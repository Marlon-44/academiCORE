# API — Evaluación Docente (academiCORE)

Documento completo del proceso de evaluación docente: autenticación, usuarios,
actores (docente, estudiante, asignatura), instrumento **SIG "Encuesta de
Percepción Estudiantil – Presencial"** administrable (21 ítems, escala 1–4),
evaluaciones por grupo, encuestas con análisis de sentimiento y reportes/gráficas.

| | URL |
|---|---|
| API evaluación docente | `http://localhost:8080/api/v1/evaluacion-docente` |
| API autenticación | `http://localhost:8080/api/auth` |
| Swagger UI (probar en vivo) | `http://localhost:8080/swagger-ui.html` |
| Frontend | `http://localhost:3002` |

**Datos demo cargados:** 4 docentes · 50 estudiantes · 6 asignaturas ·
**17 evaluaciones** (5 en 2025-1 CERRADAS con sus encuestas + 12 en 2026-2 ABIERTAS) ·
**120 encuestas respondidas** (historial 2025-1) ·
**cada estudiante tiene 6 encuestas PENDIENTES por hacer en 2026-2**
(carga académica real de semestre, como en el SIG) · 55 usuarios con roles.

---

## 1. Autenticación y usuarios

La sesión viaja en la cookie HttpOnly `academicore_session` (válida 8 h).
El frontend debe enviar `credentials: "include"` en cada `fetch` y el CORS
ya está configurado con `allowCredentials` para `:3000`, `:3002` y `:5173`.

### Cuentas demo

| Rol | Usuario | Contraseña | Qué ve al entrar |
|---|---|---|---|
| `ADMIN` | `admin` | `admin123` | Dashboard `/evaluacion-docente` |
| `ESTUDIANTE` | `0222400001` … `0222400050` (código) | `10000001` … `10000050` (su documento) | Encuestas pendientes o su dashboard |
| `DOCENTE` | `10301274` `72104567` `73098812` `10304566` | mismo número de documento | Dashboard |

**Todos los estudiantes tienen encuestas PENDIENTES** (periodo activo 2026-2):

`0222400001`–`0222400050` → claves `10000001`–`10000050`.
Cada uno entra con `surveyCompleted: false` → vista de encuesta con
**6 tarjetas docente-asignatura pendientes** (más su historial 2025-1
respondido, que aparece como contestado).

### `POST /api/auth/login`

Autentica credenciales y crea la sesión (la cookie llega en `Set-Cookie`).

**Body:**
```json
{ "username": "0222400041", "password": "10000041" }
```

**Respuesta 200:**
```json
{
  "id": 42,
  "username": "0222400041",
  "name": "SANTIAGO RODRIGUEZ LOPEZ DIAZ",
  "role": "ESTUDIANTE",
  "estudianteId": 41,
  "docenteId": null,
  "surveyCompleted": false
}
```

| Campo | Significado |
|---|---|
| `role` | `ADMIN` · `ESTUDIANTE` · `DOCENTE` — define el "roleo" del frontend |
| `estudianteId` | id para consultar sus evaluaciones/encuestas (`null` si no es estudiante) |
| `docenteId` | id del docente (`null` si no aplica) |
| `surveyCompleted` | `true` cuando respondió TODAS sus evaluaciones inscritas; `true` siempre para ADMIN/DOCENTE |

**Errores:** `401` credenciales inválidas o usuario inactivo · `400` body incompleto.

### `GET /api/auth/me`
Devuelve el usuario de la sesión actual (mismo JSON del login). **`401`** sin sesión o expirada.

### `POST /api/auth/logout`
Elimina la sesión del servidor y expira la cookie. **Respuesta `204`.**

---

## 2. Modelos del dominio

### Docente
```json
{
  "id": 1,
  "numeroDocumento": "10301274",
  "sexo": "MASCULINO",
  "nombres": "GABRIEL ELIAS",
  "apellidos": "CHANCHI GOLONDRINO",
  "nombreCompleto": "GABRIEL ELIAS CHANCHI GOLONDRINO",
  "email": "chanchi@unicartagena.edu.co",
  "telefono": "3174501234",
  "direccion": "URBANIZACIÓN EL COUNTRY CALLE 12 #8-45",
  "tipoVinculacion": "PLANTA_TIEMPO_COMPLETO",
  "escalafon": "TITULAR",
  "nivelFormacion": "DOCTORADO",
  "departamentoId": 1,
  "departamentoCodigo": "DCC",
  "departamentoNombre": "Departamento de Ciencias de la Computación",
  "fechaIngreso": "2015-02-01",
  "estado": "ACTIVO"
}
```

### Estudiante (ficha estilo SIA)
```json
{
  "id": 36,
  "codigo": "0222400036",
  "numeroDocumento": "10000036",
  "sexo": "FEMENINO",
  "nombres": "ISABELLA",
  "apellidos": "ACOSTA PALACIOS ORTIZ",
  "nombreCompleto": "ISABELLA ACOSTA PALACIOS ORTIZ",
  "email": "iacosta36@unicartagena.edu.co",
  "telefono": "3181715408",
  "direccion": "TRANSVERSAL 54 #30-18 LOZANO",
  "programaId": 1,
  "programaCodigo": "022",
  "programaNombre": "INGENIERÍA DE SISTEMAS",
  "semestre": 7,
  "estadoAcademico": "NORMAL",
  "estadoIngreso": "NO ESPECIFICA",
  "planEstudiosId": 1,
  "planCodigo": "P2010",
  "planNombre": "Reforma Pénsum 2010",
  "estado": "ACTIVO"
}
```

### Asignatura
Viene del catálogo de pensum (no se crea por esta API; se referencia por `asignaturaId`).
En los DTOs aparece embebida:
```json
{ "asignaturaId": 1, "asignaturaCodigo": "EP1303", "asignaturaNombre": "Interacción Humano Computador" }
```
Asignaturas sembradas: `1 EP1303` IHC · `2 2222123` Electiva Software Libre ·
`3 EP1102` Programación II · `4 EP2201` Bases de Datos · `5 EP1301` Ing. Software I · `6 EP2103` Redes.

### Evaluación (grupo que se evalúa)
```json
{
  "id": 1,
  "docenteId": 1,
  "docenteNombre": "GABRIEL ELIAS CHANCHI GOLONDRINO",
  "asignaturaId": 1,
  "asignaturaCodigo": "EP1303",
  "asignaturaNombre": "Interacción Humano Computador",
  "programaId": 1,
  "grupo": "A1",
  "periodo": "2025-1",
  "estudiantesEsperados": 20,
  "encuestasRespondidas": 20,
  "estado": "ABIERTA",
  "fechaCreacion": "2026-10-23T00:35:44.635934"
}
```

### Encuesta (una respuesta de estudiante por evaluación)
```json
{
  "id": 1,
  "evaluacionId": 1,
  "estudianteId": 1,
  "estudianteNombre": "MARIA JOSE RODRIGUEZ LOPEZ DIAZ",
  "estudianteDocumento": "10000001",
  "fechaRespuesta": "2026-10-23T00:39:09.831523",
  "promedio": 3.4,
  "valoracion": "Regular",
  "respuestas": [
    { "preguntaId": 1,  "valor": 2, "textoRespuesta": null, "sentimiento": null, "sentimientoScore": null, "sentimientoMetodo": null },
    { "preguntaId": 16, "valor": null, "textoRespuesta": "Más horas de consulta, porque las que tiene se llenan de inmediato.", "sentimiento": "POSITIVO", "sentimientoScore": 0.3924, "sentimientoMetodo": "MODELO" }
  ]
}
```

### Pregunta y categoría
```json
{ "id": 18, "numero": 1, "texto": "RESPETO: El docente usa un lenguaje cortés, respetuoso y es tolerante...",
  "tipo": "LIKERT", "categoriaCodigo": "COMUNICACION", "categoriaNombre": "Comunicación", "estado": "ACTIVA" }
```
```json
{ "id": 7, "codigo": "GENERALIDADES", "nombre": "Generalidades", "orden": 7, "totalPreguntas": 2 }
```

### Valores enumerados

| Campo | Valores |
|---|---|
| `tipo` (pregunta) | `LIKERT` (numérica; SIG usa 1–4, backend acepta 1–5) · `TEXTO` (abierta, con sentimiento) |
| `estado` (pregunta) | `ACTIVA` · `INACTIVA` |
| `estado` (evaluación) | `ABIERTA` (acepta encuestas) · `CERRADA` |
| `sentimiento` | `POSITIVO` · `NEUTRO` · `NEGATIVO` |
| `sentimientoMetodo` | `MODELO` (transformer en el microservicio) · `LEXICO` (fallback local) |
| `valoracion` | `Deficiente` · `Regular` · `Bueno` · `Muy bueno` · `Excelente` |
| `tipoVinculacion` | `PLANTA_TIEMPO_COMPLETO` · `PLANTA_MEDIO_TIEMPO` · `OCASIONAL` · `CATEDRA` |
| `escalafon` | `AUXILIAR` · `ASISTENTE` · `ASOCIADO` · `TITULAR` |
| `nivelFormacion` | `PREGRADO` · `ESPECIALIZACION` · `MAESTRIA` · `DOCTORADO` · `POSTDOCTORADO` |
| `estado` (docente/estudiante) | `ACTIVO` · `INACTIVO` |

---

## 3. Docentes

### `POST /docentes`
Registra un docente evaluable con su ficha laboral.

**Body** (`numeroDocumento`, `nombres`, `apellidos` requeridos):
```json
{
  "numeroDocumento": "10301274",
  "sexo": "MASCULINO",
  "nombres": "GABRIEL ELIAS",
  "apellidos": "CHANCHI GOLONDRINO",
  "email": "chanchi@unicartagena.edu.co",
  "telefono": "3174501234",
  "direccion": "URB. EL COUNTRY CALLE 12 #8-45",
  "tipoVinculacion": "PLANTA_TIEMPO_COMPLETO",
  "escalafon": "TITULAR",
  "nivelFormacion": "DOCTORADO",
  "departamentoId": 1,
  "fechaIngreso": "2015-02-01"
}
```
**Respuesta 201:** ficha completa del modelo Docente. **Errores:** `409` documento duplicado.

### `GET /docentes`
Lista docentes. **Query:** `?estado=ACTIVO|INACTIVO` (opcional).

### `GET /docentes/{id}`
Detalle de un docente (modelo completo). `404` si no existe.

### `PATCH /docentes/{id}/estado`
Activa/inactiva. **Body:** `{ "estado": "ACTIVO" }` → `ACTIVO` | `INACTIVO`.

### `GET /docentes/{id}/graficas`
Gráficas globales del docente. **Query opcional:** `?asignaturaId=` limita a una materia.

**Respuesta 200:**
```json
{
  "docenteId": 1,
  "docenteNombre": "GABRIEL ELIAS CHANCHI GOLONDRINO",
  "numeroDocumento": "10301274",
  "totalEncuestas": 45,
  "promedioGeneral": 3.66,
  "valoracion": "Bueno",
  "radarCategorias": { "labels": ["CONCEPTUAL","PEDAGOGICO","RELACIONES"], "valores": [3.6, 3.7, 3.7] },
  "comparativoMaterias": [
    { "evaluacionId": 1, "asignaturaCodigo": "EP1303", "asignaturaNombre": "Interacción Humano Computador",
      "grupo": "A1", "periodo": "2025-1", "promedio": 3.74, "respondidas": 20 }
  ],
  "evolucionPeriodos": { "labels": ["2025-1"], "valores": [3.66] },
  "sentimientos": { "labels": ["POSITIVO","NEUTRO","NEGATIVO"], "valores": [87, 0, 3] },
  "promedioSentimiento": 0.75,
  "fortalezas":    [{ "numero": 12, "texto": "¿El docente es puntual...?", "categoria": "RELACIONES", "promedio": 3.8 }],
  "oportunidades": [{ "numero": 3,  "texto": "¿El docente desarrolla...?", "categoria": "CONCEPTUAL", "promedio": 3.42 }],
  "wordCloud": [{ "texto": "aunque", "peso": 10 }]
}
```
`comparativoMaterias`: una entrada por evaluación/grupo · `fortalezas`/`oportunidades`: top 3 preguntas mejor/peor calificadas.

### `GET /docentes/{id}/reporte`
Reporte completo: **todos los comentarios de texto** que los estudiantes escribieron,
agrupados por evaluación. **Query opcional:** `?asignaturaId=`.

```json
{
  "docenteId": 1, "docenteNombre": "...", "totalEncuestas": 45,
  "promedioGeneral": 3.66, "valoracion": "Bueno",
  "evaluaciones": [{
    "evaluacionId": 1, "asignaturaCodigo": "EP1303", "asignaturaNombre": "Interacción Humano Computador",
    "grupo": "A1", "periodo": "2025-1", "encuestas": 20, "promedio": 3.74,
    "comentarios": [{
      "encuestaId": 1, "numero": 16, "pregunta": "¿Qué aspectos considera que debe mejorar...?",
      "texto": "Más horas de consulta...", "sentimiento": "POSITIVO",
      "sentimientoScore": 0.3924, "sentimientoMetodo": "MODELO"
    }]
  }]
}
```

---

## 4. Estudiantes

### `POST /estudiantes`
Registra un estudiante. **Requeridos:** `numeroDocumento`, `nombres`, `apellidos`.
**Opcionales:** `codigo`, `sexo`, `email`, `telefono`, `direccion`, `programaId`, `semestre`.

```json
{ "numeroDocumento": "10000051", "nombres": "ANDREA", "apellidos": "PEREZ MORA",
  "codigo": "0222400051", "sexo": "FEMENINO", "email": "aperez51@unicartagena.edu.co",
  "semestre": 3, "programaId": 1 }
```
**Respuesta 201:** modelo Estudiante completo. **Errores:** `409` documento duplicado.

### `GET /estudiantes` · `GET /estudiantes/{id}`
Lista completa / detalle — modelo Estudiante arriba.

### `GET /estudiantes/{id}/evaluaciones`
**Vista del estudiante**: evaluaciones inscritas, pendientes primero.
Fuente de datos para la pantalla "mis evaluaciones" (la del roleo por login).

```json
[
  {
    "evaluacionId": 21, "estado": "ABIERTA", "grupo": "B1", "periodo": "2026-2",
    "docenteId": 2, "docenteNombre": "MARIA FERNANDA RUIZ CASTRO",
    "asignaturaId": 4, "asignaturaCodigo": "EP2201", "asignaturaNombre": "Bases de Datos",
    "programaNombre": "INGENIERÍA DE SISTEMAS",
    "contestada": false, "encuestaId": null
  },
  {
    "evaluacionId": 1, "estado": "CERRADA", "grupo": "A1", "periodo": "2025-1",
    "docenteId": 1, "docenteNombre": "GABRIEL ELIAS CHANCHI GOLONDRINO",
    "asignaturaId": 1, "asignaturaCodigo": "EP1303", "asignaturaNombre": "Interacción Humano Computador",
    "programaNombre": "INGENIERÍA DE SISTEMAS",
    "contestada": true, "encuestaId": 7
  }
]
```
`contestada: false` + `encuestaId: null` → pendiente (mostrar botón "responder").

### `GET /estudiantes/{id}/encuestas`
**Vista administrativa**: detalle de cada encuesta que respondió (modelo Encuesta
con todas las respuestas y sentimientos).

---

## 5. Instrumento — Categorías y preguntas

### `GET /categorias`
```json
[{ "id": 1, "codigo": "CONCEPTUAL", "nombre": "Conceptual", "orden": 1, "totalPreguntas": 5 }]
```
Sembradas — vigentes (SIG): `COMUNICACION`(4) · `EVALUACION_APRENDIZAJE`(3) ·
`GENERALIDADES`(2 texto) · `MOTIVACION_COMPROMISO`(5) · `ORIENTACION_APRENDIZAJE`(7).
Históricas (PVD003, solo conservan respuestas viejas): `CONCEPTUAL` · `PEDAGOGICO` · `RELACIONES` · `COMENTARIOS`.

### `POST /categorias`
`{ "codigo": "TUTORIA", "nombre": "Tutoría y acompañamiento" }` — ambos requeridos; `codigo` único, se normaliza a mayúsculas. **Error `409`** duplicado.

### `GET /preguntas`
Instrumento completo ordenado por número. **Query:** `?soloActivas=false` (default `true`).

**Instrumento vigente — SIG "Encuesta de Percepción Estudiantil – Presencial"**
(21 ítems activos; el PVD003 anterior quedó `INACTIVA` con números 101–117
para conservar las encuestas 2025-1):

| # | Categoría | Ítem |
|---|---|---|
| 1–4 | `COMUNICACION` | Respeto · Comunicación clara · Canales institucionales · Relaciones interpersonales (ambiente libre de acoso) |
| 5–7 | `EVALUACION_APRENDIZAJE` | Responsabilidad (reglas/fechas) · Uso de resultados · Retroalimentación |
| 8–9 | `GENERALIDADES` | **Texto abierto** — fortalezas del docente · aspectos por mejorar (máx 250 caracteres en el SIG) |
| 10–14 | `MOTIVACION_COMPROMISO` | Puntualidad · Motivación · Preparación · Trabajo colaborativo · Fomento del aprendizaje |
| 15–21 | `ORIENTACION_APRENDIZAJE` | Dominio del tema · Acompañamiento · Orientación a la investigación · Competencias TIC · Ejecución de planes · Estrategias didácticas · Planificación |

**Escala real del SIG:** `1` NO CUMPLE · `2` ASPECTOS POR MEJORAR · `3` BUENO ·
`4` EXCELENTE. El backend acepta `valor` **1–5** (superset, por compatibilidad
con el instrumento anterior); las encuestas 2026-2 usan 1–4.

### `POST /preguntas`
```json
{ "categoriaCodigo": "COMENTARIOS", "texto": "¿Cómo califica la tutoría?", "tipo": "TEXTO", "numero": 18 }
```
`numero` opcional (auto-asigna el siguiente libre). **Errores:** `404` categoría · `409` número duplicado · `400` tipo inválido.

### `PUT /preguntas/{id}`
Campos parciales: `{ "categoriaCodigo", "numero", "texto", "tipo" }`.
**Errores:** `404` · `409` número duplicado o tipo con respuestas.

### `PATCH /preguntas/{id}/estado`
`{ "estado": "INACTIVA" }` → `ACTIVA` | `INACTIVA`. Una inactiva no se exige en nuevas encuestas.

### `DELETE /preguntas/{id}`
Solo sin respuestas; si tiene → `409` sugiriendo inactivarla. **204** al borrar.

---

## 6. Evaluaciones (grupos)

### `POST /evaluaciones`
```json
{ "docenteId": 1, "asignaturaId": 5, "grupo": "B2", "periodo": "2025-2", "estudiantesEsperados": 10 }
```
Requeridos: `docenteId`, `asignaturaId`, `grupo`, `periodo`. Único por docente+materia+grupo+periodo.
**Errores:** `404` docente/asignatura · `409` combinación ya existe. Nace `ABIERTA` y **sin inscritos**
(la inscripción se hace aparte o por seed; los estudiantes solo responden si están inscritos).

### `GET /evaluaciones`
**Queries opcionales:** `?docenteId=` `?asignaturaId=` `?periodo=` → modelo Evaluación.

### `GET /evaluaciones/{id}` · `PATCH /evaluaciones/{id}/estado`
Detalle / abrir-cerrar: `{ "estado": "CERRADA" }`. Una `CERRADA` rechaza encuestas (`422 EVALUACION_NO_ABIERTA`).

### `GET /evaluaciones/{id}/inscritos`
Estudiantes inscritos al grupo (modelo Estudiante completo).

### `GET /evaluaciones/{id}/encuestas`
Encuestas respondidas del grupo (modelo Encuesta completo c/u).

### `GET /evaluaciones/{id}/graficas`
Agregados del grupo:

```json
{
  "evaluacionId": 1, "docenteNombre": "...", "asignaturaCodigo": "EP1303",
  "grupo": "A1", "periodo": "2025-1",
  "participacion": { "esperados": 20, "respondidas": 20, "porcentaje": 100.0 },
  "promedioGeneral": 3.74, "valoracion": "Bueno",
  "radarCategorias": { "labels": [...], "valores": [...] },
  "barrasPromedioPreguntas": { "labels": ["P1"..."P19"], "valores": [3.55, 3.75, ...] },
  "distribucionLikert": { "labels": ["1","2","3","4","5"], "valores": [4, 29, 74, 126, 67] },
  "distribucionPorPregunta": [{ "numero": 1, "texto": "...", "categoria": "COMUNICACION", "distribucion": [0,2,6,11,1] }],
  "sentimientos": { "labels": ["POSITIVO","NEUTRO","NEGATIVO"], "valores": [37, 0, 3] },
  "promedioSentimiento": 0.69,
  "wordCloud": [{ "texto": "aunque", "peso": 10 }],
  "comentariosDestacados": { "masPositivo": "...", "masNegativo": "..." }
}
```

---

## 7. Encuestas

### `POST /encuestas`
Registra la respuesta de un estudiante. Debe traer **todas las preguntas activas**
(hoy **21** del instrumento SIG) una sola vez: LIKERT con `valor` y TEXTO con
`textoRespuesta`.

```json
{
  "evaluacionId": 21,
  "estudianteId": 7,
  "respuestas": [
    { "preguntaId": 18, "valor": 4 },
    { "preguntaId": 19, "valor": 3 },
    "...": "(las 19 LIKERT: ids 18-24 y 27-38)",
    { "preguntaId": 25, "textoRespuesta": "Explica muy claro y responde dudas con paciencia." },
    { "preguntaId": 26, "textoRespuesta": "Debería usar más ejercicios prácticos en clase." }
  ]
}
```

Ids del instrumento vigente: LIKERT `18–24` (ítems 1–7) y `27–38` (ítems 10–21);
TEXTO `25` (ítem 8, fortalezas) y `26` (ítem 9, mejoras).

| Regla | Error |
|---|---|
| Evaluación `ABIERTA` | `422 EVALUACION_NO_ABIERTA` |
| Estudiante inscrito en la evaluación | `400` |
| LIKERT: `valor` 1–5 requerido (el SIG usa 1–4) · TEXTO: `textoRespuesta` requerido (máx 2000; en el SIG el campo visible es de 250) | `400` |
| Todas las activas presentes, sin duplicadas | `400` |
| Una encuesta por estudiante por evaluación | `409` |
| Al responder TEXTO se calcula `sentimiento`/`sentimientoScore`/`sentimientoMetodo` automático | — |

**Respuesta 201:** modelo Encuesta completo.

### `GET /encuestas/{id}`
Detalle completo (modelo Encuesta).

### `GET /encuestas/{id}/grafica`
Gráfica de la encuesta individual:

```json
{
  "encuestaId": 1, "evaluacionId": 1, "fechaRespuesta": "2026-10-23T00:39:09.831523",
  "promedioGeneral": 3.4, "valoracion": "Regular",
  "radarCategorias": { "labels": ["CONCEPTUAL","PEDAGOGICO","RELACIONES"], "valores": [3.4, 4.0, 3.14] },
  "barrasPreguntas": [{ "numero": 1, "texto": "...", "categoria": "CONCEPTUAL", "valor": 2 }],
  "respuestasTexto": [{ "numero": 16, "pregunta": "...", "textoRespuesta": "...",
                       "sentimiento": "POSITIVO", "sentimientoScore": 0.3924, "sentimientoMetodo": "MODELO" }]
}
```

---

## 8. Errores

Formato de error (GlobalExceptionHandler):
```json
{ "timestamp": "2026-10-23T01:00:00", "status": 401, "error": "Unauthorized",
  "code": "NO_AUTORIZADO", "message": "Usuario o contraseña incorrectos" }
```

| HTTP | Cuándo |
|---|---|
| `400` | Validación de body (campos requeridos, rangos, duplicados en respuestas, estudiante no inscrito) |
| `401` | Login inválido, sin cookie de sesión o sesión expirada |
| `404` | Recurso inexistente (docente, estudiante, evaluación, encuesta, pregunta, categoría, asignatura) |
| `409` | Documento duplicado, número de pregunta duplicado, cambiar tipo con respuestas, borrar con respuestas, estudiante ya respondió esa evaluación |
| `422` | Regla de negocio (`EVALUACION_NO_ABIERTA` al encuestar una cerrada, `NO_AUTORIZADO` en credenciales) |
