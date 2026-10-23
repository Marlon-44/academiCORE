# API — Evaluación Docente

Base URL: `http://localhost:8080/api/v1/evaluacion-docente`

Documentación interactiva (probar endpoints en vivo):
**Swagger UI → http://localhost:8080/swagger-ui.html** (grupo "Evaluación Docente")

## Modelos

| Tipo de pregunta | Descripción |
|---|---|
| `LIKERT` | Escala numérica 1–5 (las 15 del formato PVD003) |
| `TEXTO` | Respuesta abierta; recibe análisis de sentimiento automático |

| Campo | Valores |
|---|---|
| `sentimiento` | `POSITIVO` · `NEUTRO` · `NEGATIVO` |
| `sentimientoMetodo` | `MODELO` (microservicio Python) · `LEXICO` (fallback local) |
| `valoracion` | `DEFICIENTE` · `REGULAR` · `BUENO` · `MUY_BUENO` · `EXCELENTE` |

---

## Docentes

### `POST /docentes`
Registra un docente evaluable con su ficha laboral.

**Body:**
```json
{
  "numeroDocumento": "10301274",      // requerido, único
  "sexo": "MASCULINO",                // MASCULINO | FEMENINO | OTRO
  "nombres": "GABRIEL ELIAS",         // requerido
  "apellidos": "CHANCHI GOLONDRINO",  // requerido
  "email": "chanchi@unicartagena.edu.co",
  "telefono": "3174501234",
  "direccion": "URB. EL COUNTRY CALLE 12 #8-45",
  "tipoVinculacion": "PLANTA_TIEMPO_COMPLETO", // PLANTA_TIEMPO_COMPLETO | PLANTA_MEDIO_TIEMPO | OCASIONAL | CATEDRA
  "escalafon": "TITULAR",             // AUXILIAR | ASISTENTE | ASOCIADO | TITULAR
  "nivelFormacion": "DOCTORADO",      // PREGRADO | ESPECIALIZACION | MAESTRIA | DOCTORADO | POSTDOCTORADO
  "departamentoId": 1,                // departamento de adscripción
  "fechaIngreso": "2015-02-01"
}
```
**Respuesta 201:** ficha completa incl. `departamentoCodigo/departamentoNombre` resueltos del catálogo.

### `GET /docentes`
Lista docentes. **Query opcional:** `?estado=ACTIVO|INACTIVO`

### `GET /docentes/{id}`
Detalle de un docente. **Path:** `id` del docente.

### `PATCH /docentes/{id}/estado`
Activa/inactiva un docente.

**Body:** `{ "estado": "ACTIVO" }` — valores `ACTIVO` | `INACTIVO`

### `GET /docentes/{id}/graficas`
Gráficas globales del docente (todas sus materias o una en específico).

**Path:** `id` del docente · **Query opcional:** `?asignaturaId={id}` limita a una materia.

**Respuesta:** promedio general + valoración, radar por categoría, comparativo por materia/grupo/periodo, evolución por periodo, pie de sentimientos + score promedio, nube de palabras, fortalezas y oportunidades (top 3 preguntas).

### `GET /docentes/{id}/reporte`
Reporte completo para el docente: **todas las respuestas de texto** que los
estudiantes escribieron sobre él, agrupadas por evaluación.

**Path:** `id` del docente · **Query opcional:** `?asignaturaId={id}` limita a una materia.

**Respuesta:**
```json
{
  "docenteId": 1, "docenteNombre": "...", "totalEncuestas": 45,
  "promedioGeneral": 3.66, "valoracion": "BUENO",
  "evaluaciones": [{
    "evaluacionId": 1, "asignaturaCodigo": "EP1303", "grupo": "A1",
    "periodo": "2025-1", "encuestas": 20, "promedio": 3.9,
    "comentarios": [{
      "encuestaId": 5, "numero": 16, "pregunta": "¿Qué aspectos...?",
      "texto": "Debería...", "sentimiento": "NEUTRO",
      "sentimientoScore": 0.51, "sentimientoMetodo": "MODELO"
    }]
  }]
}
```

---

## Estudiantes

### `POST /estudiantes`
Registra un estudiante (ficha estilo SIA).

**Body:** `numeroDocumento`, `nombres`, `apellidos` requeridos; opcionales
`codigo`, `sexo`, `email`, `telefono`, `direccion`, `programaId`, `semestre`.

### `GET /estudiantes`
Lista todos los estudiantes con ficha completa: `codigo`, `numeroDocumento`,
`sexo`, contacto, `programaCodigo/programaNombre`, `semestre`,
`estadoAcademico`, `estadoIngreso`, `planCodigo/planNombre`.

### `GET /estudiantes/{id}`
Detalle de un estudiante.

### `GET /estudiantes/{id}/encuestas`
Vista administrativa: **el detalle de cada encuesta que respondió el
estudiante** (una por evaluación), con todas sus respuestas y sentimientos.

---

## Instrumento — Categorías

### `GET /categorias`
Lista categorías con conteo de preguntas.
**Respuesta:** `[{ id, codigo, nombre, orden, totalPreguntas }]`

### `POST /categorias`
Crea una categoría para agrupar preguntas.

**Body:** `{ "codigo": "TUTORIA", "nombre": "Tutoría y acompañamiento" }` — ambos requeridos; `codigo` máx 30, único (se normaliza a mayúsculas).

---

## Instrumento — Preguntas (CRUD)

### `GET /preguntas`
Lista las preguntas del instrumento ordenadas por número.

**Query opcional:** `?soloActivas=false` — por defecto `true` (solo activas).

**Respuesta:** `[{ id, numero, texto, tipo, categoriaCodigo, categoriaNombre, estado }]`

### `POST /preguntas`
Crea una pregunta nueva.

**Body:**
```json
{
  "categoriaCodigo": "COMENTARIOS", // requerido, debe existir
  "texto": "¿Cómo califica...?",    // requerido, máx 300
  "tipo": "TEXTO",                  // opcional: LIKERT (default) | TEXTO
  "numero": 18                      // opcional: si no se envía, asigna el siguiente libre
}
```
**Errores:** 404 categoría inexistente · 409 número duplicado · 400 tipo inválido.

### `PUT /preguntas/{id}`
Actualiza una pregunta (campos parciales).

**Body (todos opcionales):**
```json
{ "categoriaCodigo": "RELACIONES", "numero": 5, "texto": "...", "tipo": "LIKERT" }
```
**Errores:** 404 no existe · 409 número duplicado o tipo cambiado teniendo respuestas · 400 texto vacío.

### `PATCH /preguntas/{id}/estado`
Activa/inactiva una pregunta.

**Body:** `{ "estado": "INACTIVA" }` — valores `ACTIVA` | `INACTIVA`

### `DELETE /preguntas/{id}`
Elimina una pregunta. **Solo si no tiene respuestas registradas** — si las tiene devuelve `409` sugiriendo inactivarla. **Respuesta 204.**

---

## Evaluaciones

### `POST /evaluaciones`
Crea una evaluación (docente + asignatura + grupo + periodo).

**Body:**
```json
{
  "docenteId": 1,                // requerido
  "asignaturaId": 10,            // requerido, debe existir en el catálogo de pensum
  "grupo": "A1",                 // requerido
  "periodo": "2025-1",           // requerido
  "estudiantesEsperados": 16     // opcional
}
```

### `GET /evaluaciones`
Lista evaluaciones. **Queries opcionales:** `?docenteId=` `?asignaturaId=` `?periodo=`

**Respuesta:** `[{ id, docenteId, docenteNombre, asignaturaId, asignaturaCodigo, asignaturaNombre, grupo, periodo, estudiantesEsperados, encuestasRespondidas, estado, fechaCreacion }]`

### `GET /evaluaciones/{id}`
Detalle de una evaluación.

### `PATCH /evaluaciones/{id}/estado`
Abre/cierra la evaluación. **Body:** `{ "estado": "ABIERTA" }` — `ABIERTA` | `CERRADA` (una cerrada no acepta encuestas).

### `GET /evaluaciones/{id}/encuestas`
Lista las encuestas respondidas de esa evaluación, con todas sus respuestas (Likert con `valor`, texto con `textoRespuesta` + sentimiento) y el estudiante que respondió cada una (`estudianteId`, `estudianteNombre`, `estudianteDocumento`).

### `GET /evaluaciones/{id}/inscritos`
Lista los estudiantes inscritos en el grupo de la evaluación (ficha completa).

### `GET /evaluaciones/{id}/graficas`
Gráficas agregadas de la evaluación (todas las encuestas del grupo).

**Respuesta:** participación (esperados/respondidas/%), promedio + valoración, radar por categoría, barras de promedio por pregunta, distribución Likert global y apilada por pregunta, pie de sentimientos + score, nube de palabras y comentarios más positivo/negativo.

---

## Encuestas

### `POST /encuestas`
Registra la respuesta de un estudiante. Debe incluir **todas las preguntas activas** una sola vez.

**Body:**
```json
{
  "evaluacionId": 1,                    // requerido; la evaluación debe estar ABIERTA
  "estudianteId": 36,                   // opcional; debe estar inscrito en la evaluación
  "respuestas": [                        // requerido, no vacío, sin duplicados
    { "preguntaId": 1,  "valor": 5 },    // pregunta LIKERT: valor 1-5 obligatorio
    { "preguntaId": 16, "textoRespuesta": "El docente explica muy bien..." } // TEXTO: obligatorio, máx 2000
  ]
}
```
**Errores:** 404 evaluación/estudiante inexistente · 409 estudiante ya respondió · 400 evaluación cerrada, estudiante no inscrito, pregunta inexistente/inactiva, duplicada, falta alguna activa, valor fuera de 1-5 o texto vacío en pregunta TEXTO.

**Respuesta 201:** `{ id, evaluacionId, estudianteId, estudianteNombre, estudianteDocumento, fechaRespuesta, promedio, valoracion, respuestas: [...] }`

### `GET /encuestas/{id}`
Detalle de una encuesta respondida (mismo shape anterior).

### `GET /encuestas/{id}/grafica`
Gráfica de la encuesta individual.

**Respuesta:** promedio + valoración, radar por categoría, barras con el valor de cada pregunta Likert, y `respuestasTexto[]` con cada comentario, su pregunta, sentimiento, score y método.

---

## Códigos de error comunes

| HTTP | Cuándo |
|---|---|
| 400 | Validación de body o regla de negocio (duplicados, faltantes, rango) |
| 404 | Recurso no encontrado (docente, evaluación, encuesta, pregunta, categoría) |
| 409 | Conflicto (número de pregunta duplicado, tipo con respuestas, eliminar con respuestas, código de categoría repetido) |
