# academiCORE — Evaluación Docente
## Reporte técnico: análisis de sentimiento, datos consultables, dashboard y backlog

**Fecha:** 27 de octubre de 2026 · **Versión:** 1.0
**Alcance:** módulo de evaluación docente (instrumento SIG "Encuesta de Percepción Estudiantil – Presencial", Universidad de Cartagena)

---

## 1. Resumen ejecutivo

academiCORE es un ERP académico (Spring Boot 3.3.4 + Java 21 + React/TypeScript/Vite + PostgreSQL) que ahora incluye un **módulo completo de evaluación docente por percepción estudiantil**:

- Instrumento oficial **SIG** de 21 ítems (19 Likert escala 1–4 + 2 abiertas) en 5 categorías.
- **Autenticación por sesión** con roles ADMIN / DOCENTE / ESTUDIANTE (cookie HttpOnly, SecureRandom, duración 15 días staff / 60 días estudiantes).
- **Microservicio Python de análisis de sentimiento** (DistilBERT multilingüe) con **fallback léxico** en el backend — cada comentario abierto recibe etiqueta + score + método.
- **Dashboard administrativo** con radar por categorías, dona de sentimientos, barras por pregunta, nube de palabras, comparativas y evolución.
- **Base de datos en Supabase** (PostgreSQL 17, pooler `us-east-2`), Flyway V1–V13, dataset demo: 8 docentes, 80 estudiantes, 16 evaluaciones, 960 encuestas, 20.160 respuestas.

---

## 2. Pipeline de análisis de sentimiento

```
Estudiante responde encuesta
        │  POST /api/v1/evaluacion-docente/encuestas
        ▼
EncuestaUseCase.registrar()  ── por cada respuesta de tipo TEXTO (í­tems 8 y 9)
        │  SentimentAnalysisPort.analizar(texto)
        ▼
SentimentAnalysisHttpAdapter ── RestClient (timeout 3s/5s)
        │  POST http://sentiment:5000/sentimiento  {"texto": "..."}
        ▼
┌──────────────────────────┐        si falla / timeout
│ Microservicio Flask :5000│ ──────────────────► LexicoSentimiento (Java)
│ DistilBERT multilingual  │                    (lexicón español, metodo=LEXICO)
└──────────────────────────┘
        │  {sentimiento: POSITIVO|NEGATIVO|NEUTRO, score: 0..1}
        ▼
respuesta_pregunta: texto_respuesta, sentimiento, sentimiento_score, sentimiento_metodo
        │
        ▼
GraficasUseCase agrega por evaluación / docente
        │  JSON → endpoints /graficas y /reporte
        ▼
Frontend React (recharts 3.10.1): dona, radar, barras, word cloud, comentarios
```

## 3. Microservicio Python (`sentiment-service/`)

| Pieza | Detalle |
|---|---|
| **Librerías** | `flask==3.0.3` (HTTP), `transformers==4.46.3` (pipeline HF), `torch` (CPU, instalado desde índice pytorch/cpu en la imagen) |
| **Modelo** | `lxyuan/distilbert-base-multilingual-cased-sentiments-student` — DistilBERT base multilingüe fine-tuned para sentimiento; elegido sobre el viejo `sentiment-analysis-spanish` (Naive Bayes) por precisión en comentarios académicos |
| **Endpoint** | `POST /sentimiento` body `{"texto": "..."}` → `{"sentimiento": "POSITIVO\|NEGATIVO\|NEUTRO", "score": 0.0-1.0}` |
| **Salud** | `GET /salud` → `{"estado": "ok", "modelo": "..."}` |
| **Inferencia** | `pipeline("sentiment-analysis", model=MODELO)` con `truncation=True, max_length=512`; labels del modelo mapeadas a español |
| **Docker** | `academicore-sentiment`, puerto 5000, `HF_HOME=/app/hf_cache` para cachear el modelo en la imagen, CPU-only |

**Ejemplo real:**

```json
POST http://localhost:5000/sentimiento
{ "texto": "El profesor explica con mucha claridad y resuelve todas las dudas." }
→ { "sentimiento": "POSITIVO", "score": 0.9821 }
```

## 4. Integración en el backend (Java)

| Componente | Responsabilidad |
|---|---|
| `SentimentAnalysisPort` (dominio) | Puerto: `analizar(texto) → SentimentResult(etiqueta, score, metodo)` |
| `SentimentAnalysisHttpAdapter` | `RestClient` a `${sentimiento.service-url}` (default `http://sentiment:5000` en Docker), timeouts 3s conexión / 5s lectura. Si el microservicio falla → **fallback** |
| `LexicoSentimiento` | Fallback local: lexicón español (~34 positivas / ~24 negativas), normalización NFD sin acentos, score calculado por margen `0.5 ± 0.15·Δ`. Garantiza que el registro de encuesta **nunca se bloquee** |
| `EncuestaUseCase` | Al registrar: por cada `pregunta tipo=TEXTO` llama al puerto y persiste `sentimiento`, `sentimiento_score`, `sentimiento_metodo` (`MODELO` o `LEXICO`) |
| `GraficasUseCase` | Agrega: `sentimientosChart` (conteo por etiqueta), `promedioSentimiento` (media del score), `wordCloud` (top términos de textos abiertos) |

**Campos persistidos** en `respuesta_pregunta`:

```sql
texto_respuesta     TEXT           -- comentario del estudiante
sentimiento         VARCHAR(20)    -- POSITIVO | NEGATIVO | NEUTRO
sentimiento_score   DOUBLE PRECISION  -- confianza 0..1
sentimiento_metodo  VARCHAR(20)    -- MODELO (microservicio) | LEXICO (fallback)
```

## 5. Datos consultables por API (estado actual)

Base: `http://localhost:8080/api/v1/evaluacion-docente`

### 5.1 Gráficas por docente — `GET /docentes/{id}/graficas`

```json
{
  "docenteId": 1, "docenteNombre": "GABRIEL ELIAS CHANCHI GOLONDRINO",
  "totalEncuestas": 120, "promedioGeneral": 3.53, "valoracion": "Bueno",
  "radarCategorias": {
    "labels": ["COMUNICACION","EVALUACION_APRENDIZAJE","MOTIVACION_COMPROMISO","ORIENTACION_APRENDIZAJE"],
    "valores": [3.6, 3.5, 3.5, 3.6] },
  "comparativoMaterias": [
    { "evaluacionId": 9, "asignaturaCodigo": "EP1302", "periodo": "2026-2",
      "promedio": 3.52, "respondidas": 35 } ],
  "evolucionPeriodos": { "labels": ["2026-1","2026-2"], "valores": [3.54, 3.52] },
  "sentimientos": { "labels": ["POSITIVO","NEUTRO","NEGATIVO"], "valores": [172, 20, 8] },
  "promedioSentimiento": 0.81,
  "fortalezas":    [{ "numero": 15, "texto": "...", "categoria": "ORIENTACION_APRENDIZAJE", "promedio": 3.7 }],
  "oportunidades": [{ "numero": 6,  "texto": "...", "categoria": "EVALUACION_APRENDIZAJE", "promedio": 3.3 }],
  "wordCloud": [{ "texto": "clases", "peso": 42 }, { "texto": "profesor", "peso": 38 }]
}
```

### 5.2 Reporte de comentarios — `GET /docentes/{id}/reporte`

Todos los textos abiertos agrupados por evaluación, **cada uno con su sentimiento**:

```json
{ "evaluacionId": 1, "periodo": "2026-1", "encuestas": 80, "promedio": 3.54,
  "comentarios": [
    { "encuestaId": 11, "numero": 9, "pregunta": "¿En qué aspectos debería trabajar…?",
      "texto": "Podría compartir las diapositivas antes de clase…",
      "sentimiento": "NEUTRO", "sentimientoScore": 0.61, "sentimientoMetodo": "MODELO" } ] }
```

### 5.3 Gráficas por evaluación/grupo — `GET /evaluaciones/{id}/graficas`

`participacion` (esperados/respondidas/%), `promedioGeneral`, `valoracion`,
`radarCategorias`, `barrasPromedioPreguntas` (P1–P19 Likert),
`distribucionLikert` (conteo 1–4), `distribucionPorPregunta`,
`sentimientos`, `promedioSentimiento`, `wordCloud`.

### 5.4 Detalle de encuesta — `GET /encuestas/{id}` · `GET /evaluaciones/{id}/encuestas` · `GET /estudiantes/{id}/encuestas`

Respuesta a respuesta: `valor` (Likert) o `textoRespuesta` + tripla de sentimiento.

### 5.5 Otros datos consultables hoy

| Endpoint | Devuelve |
|---|---|
| `GET /docentes` · `/docentes/{id}` · `POST/PUT` | CRUD docentes (8 cargados) |
| `GET /estudiantes` · `/{id}` · `POST` | CRUD estudiantes (80 cargados) |
| `GET /estudiantes/{id}/evaluaciones` | Vista estudiante: **solo ABIERTA**, pendientes primero (4+4 en 2026-2) |
| `GET /evaluaciones` `?docenteId=&asignaturaId=&periodo=` | 16 evaluaciones (8×2026-1 CERRADA, 8×2026-2 ABIERTA) |
| `GET /evaluaciones/{id}/inscritos` | Grupo inscrito (80/eval) |
| `GET/POST/PUT/DELETE/PATCH /preguntas` | CRUD instrumento (21 activas, escala 1–4) |
| `GET/POST /categorias` | 5 categorías SIG |
| `POST /encuestas` | Registrar respuestas (dispara sentimiento en textos) |
| `POST /api/auth/login` `GET /me` `POST /logout` | Sesión por cookie |

## 6. Qué ve el dashboard del administrador

| Visualización (recharts) | Componente front | Endpoint | Campo DTO |
|---|---|---|---|
| Radar por categorías | `CategoriaRadar` (`RadarChart`) | `/docentes/{id}/graficas` | `radarCategorias` |
| Dona sentimientos POS/NEU/NEG | `SentimientoPie` (`PieChart`) | `/docentes/{id}/graficas` | `sentimientos` + `promedioSentimiento` |
| Barras promedio por pregunta | `BarChart` | `/evaluaciones/{id}/graficas` | `barrasPromedioPreguntas` / `distribucionPorPregunta` |
| Distribución Likert 1–4 | `BarChart` | `/evaluaciones/{id}/graficas` | `distribucionLikert` |
| Nube de palabras | WordCloud (custom) | `…/graficas` | `wordCloud[]` `{texto, peso}` |
| Comparativo materias / evolución | tabla/líneas | `/docentes/{id}/graficas` | `comparativoMaterias` / `evolucionPeriodos` |
| Top fortalezas / oportunidades | lista | `/docentes/{id}/graficas` | `fortalezas` / `oportunidades` (3 mejores y 3 peores) |
| Participación del grupo | métrica | `/evaluaciones/{id}/graficas` | `participacion` |
| Comentarios con etiqueta | tabla | `/docentes/{id}/reporte` | `comentarios[].sentimiento/score/metodo` |

**Flujo front→backend:** `evaluacionDocenteApi.ts` llama `fetchDocenteGraficas(id)` / `fetchEvaluacionGraficas(id)` → JSON tipado (`DocenteGraficasDTO`, `EvaluacionGraficasDTO`, `ChartSerieDTO`) → `AdminDashboard/charts.tsx` mapea `labels[]`+`valores[]` a las series de recharts. CORS con `credentials: include` para la cookie de sesión.

## 7. Dataset actualmente consultable (Supabase)

| Entidad | Volumen | Detalle |
|---|---|---|
| Estudiantes | 80 | `0222400001–080` · clave = documento `10000001–080` |
| Docentes | 8 | perfiles de calidad sembrados: 2 excelentes (~3.5), 2 buenos (~3.2), 2 regulares (~2.6), 2 malos (~1.8) |
| Asignaturas | 12 | programa Ing. de Sistemas (IHC, Prog I-II, BD, Redes, Ing. Sw I-II, IA, SO, Arquitectura, Estructuras, Electiva SL) |
| Evaluaciones | 16 | 8×2026-1 CERRADA + 8×2026-2 ABIERTA (una por docente) |
| Inscripciones | 1.280 | 80 estudiantes × 16 grupos |
| Encuestas | 960 | 640 en 2026-1 + 320 en 2026-2 (4 resueltas + **4 pendientes** por estudiante) |
| Respuestas | 20.160 | 19 Likert + 2 texto por encuesta → **1.920 comentarios con sentimiento** (MODELO) |
| Usuarios | 89 | admin + 80 estudiantes + 8 docentes |

**Consultas útiles de muestra:** promedio por docente y periodo, distribución de sentimiento por docente, top palabras en comentarios negativos de un docente concreto, participación % por grupo, evolución 2026-1→2026-2 por categoría.

## 8. Backlog del proyecto (para Taiga)

### Épica 1 — Autenticación y roles ✅
- HU1.1 Login con usuario/clave → cookie HttpOnly `academicore_session` (SecureRandom 32B) — *hecho*
- HU1.2 Duración de sesión por rol: staff 15d / estudiantes 60d — *hecho*
- HU1.3 `/me`, `/logout`, expiración y borrado de sesiones viejas — *hecho*
- HU1.4 Flag `surveyCompleted` (solo evaluaciones ABIERTA) para el roleo del front — *hecho*

### Épica 2 — Instrumento SIG ✅
- HU2.1 Categorías y preguntas administrables (CRUD + activar/inactivar) — *hecho*
- HU2.2 Instrumento oficial: 21 ítems, 5 categorías, Likert 1–4, 2 abiertas — *hecho*

### Épica 3 — Proceso de evaluación ✅
- HU3.1 Evaluaciones docente+materia+grupo+periodo con estado ABIERTA/CERRADA — *hecho*
- HU3.2 Inscripciones (grupo de estudiantes por evaluación) — *hecho*
- HU3.3 Vista del estudiante: solo periodo activo, pendientes primero — *hecho*
- HU3.4 Registrar encuesta (19 Likert + 2 texto), unicidad por estudiante-evaluación, rechazo duplicado 409 — *hecho*

### Épica 4 — Análisis de sentimiento ✅
- HU4.1 Microservicio Flask + DistilBERT multilingual (`/sentimiento`, `/salud`) — *hecho*
- HU4.2 Puerto + adaptador HTTP con timeouts — *hecho*
- HU4.3 Fallback léxico (metodo=LEXICO) — *hecho*
- HU4.4 Persistir etiqueta/score/método por respuesta de texto — *hecho*

### Épica 5 — Reportes y dashboard ✅
- HU5.1 Agregados por evaluación: participación, promedio, radar, barras, distribución — *hecho*
- HU5.2 Agregados por docente: comparativo materias, evolución, sentimientos, word cloud, fortalezas/oportunidades — *hecho*
- HU5.3 Reporte de comentarios con sentimiento por texto — *hecho*
- HU5.4 Front: `AdminDashboard` + charts recharts consumiendo los endpoints — *hecho (Marlon)*

### Épica 6 — Datos y despliegue ✅/🔶
- HU6.1 Migraciones Flyway V1–V13 + dump versionado `db/init` — *hecho*
- HU6.2 Dataset 2026: 8 docentes, 80 estudiantes, 16 evaluaciones, 960 encuestas con textos realistas — *hecho*
- HU6.3 Migración a Supabase (pooler, SSL, credenciales por `.env`) — *hecho*
- HU6.4 Rotación de `service_role` key (expuesta en historial git) — *pendiente*
- HU6.5 Postgres local como perfil opcional `localdb` — *hecho*

### Backlog pendiente sugerido (sprints siguientes)

| Historia | Puntos |
|---|---|
| HU7.1 Tests de integración del módulo evaluación (Testcontainers) | 8 |
| HU7.2 Validación estricta: `valor` 1–4 + texto ≤250 chars según SIG real | 3 |
| HU7.3 RLS/políticas en Supabase si el front accede directo en el futuro | 5 |
| HU7.4 Exportar reporte docente a PDF (admin) | 5 |
| HU7.5 Vista docente: auto-consulta de sus gráficas tras login | 5 |
| HU7.6 Endpoint para cerrar periodo en bloque + apertura de nuevo periodo | 3 |
| HU7.7 Monitorizar cobertura `MODELO` vs `LEXICO` (métrica de fallback) | 2 |
| HU7.8 CI: build + test + validación del dump en pipeline | 5 |

**Deuda técnica conocida:** service key en historial git (rotar); `valor` acepta 1–5 (superset del 1–4 real); textos SIG visual 250 chars vs 2000 en BD; `seed_encuestas.py` obsoleto (usar `gen_eval_data_2026.py`); sin tests automatizados del módulo.

## 9. Stack y puertos

| Capa | Tecnología | Puerto |
|---|---|---|
| Frontend | React 19 + TS + Vite + recharts 3.10.1 (nginx) | 3002 |
| Backend | Spring Boot 3.3.4, Java 21, Spring Data JPA, Flyway, springdoc-openapi | 8080 |
| Sentimiento | Python 3.12, Flask 3.0.3, transformers 4.46.3, torch CPU | 5000 |
| BD | Supabase PostgreSQL 17.6 (Supavisor, us-east-2, sslmode=require) | pooler 5432 |
| Docs | `evaluacion-docente-api.md` + Swagger UI `/swagger-ui.html` | — |

---
*Generado para la planeación de sprints en Taiga — academiCORE · evaluación docente.*
