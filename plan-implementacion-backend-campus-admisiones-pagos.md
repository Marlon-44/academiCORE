# Plan de Implementación — Backend AcademiCORE (Spring Boot)
## Etapa 2: Campus, Programas disponibles para inscripción, Admisiones y Pagos

> Continuación directa de `plan-implementacion-backend-pensum.md` (Etapa 1). Se reutilizan las tablas `universidad`, `facultad`, `programa_academico` y `plan_estudios` ya definidas ahí — este documento **no las repite**, solo agrega lo nuevo y las referencia por FK.
>
> **Versión ampliada:** además del esquema SQL, cada tabla trae un diccionario de campos (tipo, obligatoriedad, regla de negocio, ejemplo) y cada endpoint de creación/edición trae el JSON de request y de response que debería devolver, para que el front y el backend trabajen contra el mismo contrato desde el día uno.

---

## 0. Resumen de lo que pidió Marlon (del chat) y cómo quedó resuelto aquí

| Pedido | Dónde se resuelve |
|---|---|
| Tabla de campus (Piedra de Bolívar, San Pablo, San Agustín, Zaragocilla) | §1 — tabla `campus` |
| Revisar el array del front para no duplicar nombres/estructura | §1.1 — checklist de sincronización antes de migrar |
| Imágenes por sede: fachada, zona de comidas, laboratorios, salones, bienestar, etc., varias por campus, guardadas como URL | §1.4 — tabla `imagen_campus` + catálogo `categoria_imagen_campus` |
| Confirmar almacenamiento de imágenes (Supabase, no AWS por presupuesto) | §1.5 |
| Endpoint de programas ofertados/disponibles para inscripción | §2 — tabla `oferta_admision` + endpoint |
| Tablas de inscripciones | §3 — `inscripcion` |
| Tabla de aspirantes | §3 — `aspirante` |
| Tablas de pagos y monedas (para mostrar factura) | §4 — `moneda`, `concepto_pago`, `factura`, `pago` |
| Pasarela: PayPal + PSE (decisión ya tomada en el chat, pensando en la UDC) | §4.6 — nota técnica importante sobre PSE, y diseño de puerto agnóstico a pasarela |

---

## 1. Módulo Campus

### 1.1 Antes de migrar: sincronizar con el front

Marlon mencionó que en el frontend ya existe un array con los campus y "otro más" (probablemente las categorías de imágenes o las sedes con su descripción). Antes de correr la migración:

- [ ] Confirmar con Juan los nombres **exactos** que usa el front para cada sede (para que `codigo` calce, ej. `PIEDRA_BOLIVAR`, `SAN_PABLO`, `SAN_AGUSTIN`, `ZARAGOCILLA`).
- [ ] Confirmar si el front ya tiene una lista fija de categorías de imagen (fachada, comidas, laboratorios, salones, bienestar) para que el catálogo `categoria_imagen_campus` no quede desalineado y haya que migrar de nuevo.
- [ ] Confirmar si el front espera nombres de sede visibles distintos al `codigo` interno (ej. mostrar "Zaragocilla (Medicina)" aunque el código sea `ZARAGOCILLA`) — por eso el campo `nombre` existe separado de `codigo`.

### 1.2 Diccionario de campos — `campus`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | Identificador interno, nunca se expone como el único identificador estable en la URL pública (se usa `codigo` para eso). | `3` |
| `universidad_id` | BIGINT (FK) | Sí | A qué institución pertenece. Hoy solo existe una universidad, pero queda listo para multi-tenant (ver Etapa 1, §3). | `1` |
| `codigo` | VARCHAR(30) | Sí | Identificador legible y estable, usado en la URL y por el front para mapear íconos/imágenes por defecto. En mayúsculas y sin espacios por convención. | `ZARAGOCILLA` |
| `nombre` | VARCHAR(150) | Sí | Nombre visible al usuario final. | `Sede Zaragocilla` |
| `direccion` | VARCHAR(250) | No | Para mostrar en la ficha del campus y, más adelante, para geolocalización/mapa. | `Zaragocilla, Cartagena de Indias` |
| `ciudad` | VARCHAR(100) | Sí (default `Cartagena`) | Se deja como campo aparte y no fijo en código porque, aunque hoy todas las sedes están en Cartagena, no cuesta nada dejarlo abierto. | `Cartagena` |
| `descripcion` | TEXT | No | Texto libre para la página pública del campus (qué se dicta ahí, historia de la sede, etc.). | "Sede especializada en Ciencias de la Salud..." |
| `estado` | VARCHAR(20) | Sí (default `ACTIVO`) | `ACTIVO` \| `INACTIVO`. Un campus `INACTIVO` no debe aparecer en la página pública ni poder recibir nuevas ofertas de admisión. | `ACTIVO` |

### 1.3 Esquema de base de datos — Campus y relación con programas

```sql
-- ============================================================
-- 1. CAMPUS
-- ============================================================
CREATE TABLE campus (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    universidad_id      BIGINT NOT NULL,

    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(150) NOT NULL,

    direccion           VARCHAR(250),
    ciudad              VARCHAR(100) NOT NULL DEFAULT 'Cartagena',

    descripcion         TEXT,

    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',

    CONSTRAINT fk_campus_universidad
        FOREIGN KEY (universidad_id)
        REFERENCES universidad(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_campus_universidad_codigo
        UNIQUE (universidad_id, codigo),

    CONSTRAINT chk_campus_estado
        CHECK (estado IN ('ACTIVO', 'INACTIVO'))
);


-- ============================================================
-- 2. PROGRAMA <-> CAMPUS (N:N)
-- ============================================================
-- Un programa puede dictarse en más de una sede
-- (ej. Medicina solo en Zaragocilla; Ingenierías en Piedra
-- de Bolívar y San Pablo).
-- ============================================================
CREATE TABLE programa_campus (
    programa_id         BIGINT NOT NULL,
    campus_id           BIGINT NOT NULL,

    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',

    PRIMARY KEY (programa_id, campus_id),

    CONSTRAINT fk_progcampus_programa
        FOREIGN KEY (programa_id)
        REFERENCES programa_academico(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_progcampus_campus
        FOREIGN KEY (campus_id)
        REFERENCES campus(id)
        ON DELETE CASCADE
);
```

**Diccionario de campos — `programa_campus`**

| Campo | Tipo | Obligatorio | Descripción | Ejemplo |
|---|---|---|---|---|
| `programa_id` | BIGINT (FK) | Sí | Referencia al programa académico de la Etapa 1. | `12` |
| `campus_id` | BIGINT (FK) | Sí | Referencia a la sede. | `3` |
| `estado` | VARCHAR(20) | Sí (default `ACTIVO`) | Permite "retirar" un programa de una sede sin borrar el histórico (ej. si Medicina deja de abrirse en una sede por un tiempo). | `ACTIVO` |

### 1.4 Imágenes por campus

### 1.4.1 Diccionario de campos — `categoria_imagen_campus`

| Campo | Tipo | Obligatorio | Descripción | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `2` |
| `codigo` | VARCHAR(30) | Sí | Valor estable que usa el front para agrupar/filtrar. | `LABORATORIO` |
| `nombre` | VARCHAR(80) | Sí | Etiqueta visible. | `Laboratorios` |

Seed inicial (según lo pedido en el chat): `FACHADA_SEDE`, `ZONA_COMIDAS`, `LABORATORIO`, `SALON`, `ZONA_BIENESTAR`, `OTRO`.

### 1.4.2 Diccionario de campos — `imagen_campus`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `145` |
| `campus_id` | BIGINT (FK) | Sí | A qué sede pertenece la imagen. | `3` |
| `categoria_id` | BIGINT (FK) | Sí | Referencia al catálogo anterior; permite filtrar la galería del front por pestañas ("Laboratorios", "Zona de comidas", etc.). | `2` |
| `url` | VARCHAR(500) | Sí | URL pública (o firmada) del archivo en Supabase Storage. **Nunca se guarda el binario en la base de datos.** | `https://xxxx.supabase.co/storage/v1/object/public/campus/zaragocilla/lab-01.jpg` |
| `descripcion` | VARCHAR(200) | No | Texto alternativo / pie de foto, también sirve como `alt` de accesibilidad en el front. | `Laboratorio de microbiología, bloque B` |
| `orden` | INTEGER | Sí (default `0`) | Controla el orden de aparición dentro de una misma categoría (carrusel). | `1` |
| `fecha_carga` | TIMESTAMP | Sí (auto) | Cuándo se registró. | `2026-09-07T10:15:00` |
| `estado` | VARCHAR(20) | Sí (default `ACTIVA`) | `ACTIVA` \| `INACTIVA`. Se usa en vez de borrar físicamente, para no romper referencias ni perder historial. | `ACTIVA` |

```sql
CREATE TABLE categoria_imagen_campus (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(80) NOT NULL,
    CONSTRAINT uq_categoria_imagen_codigo UNIQUE (codigo)
);

CREATE TABLE imagen_campus (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    campus_id           BIGINT NOT NULL,
    categoria_id        BIGINT NOT NULL,

    url                 VARCHAR(500) NOT NULL,
    descripcion         VARCHAR(200),
    orden               INTEGER NOT NULL DEFAULT 0,

    fecha_carga         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVA',

    CONSTRAINT fk_imagen_campus
        FOREIGN KEY (campus_id) REFERENCES campus(id) ON DELETE CASCADE,
    CONSTRAINT fk_imagen_categoria
        FOREIGN KEY (categoria_id) REFERENCES categoria_imagen_campus(id) ON DELETE RESTRICT,
    CONSTRAINT chk_imagen_estado
        CHECK (estado IN ('ACTIVA', 'INACTIVA'))
);
```

### 1.5 Almacenamiento de imágenes — decisión confirmada

Del chat: **Supabase Storage**, no AWS S3, por presupuesto. Diseño para no atarse a Supabase en el dominio:

- El dominio y los casos de uso solo conocen un `ImagenCampusStoragePort` con métodos como `generarUrlSubida(nombreArchivo): urlFirmada` y `eliminarImagen(url)`.
- El adaptador concreto (`infrastructure/storage/SupabaseStorageAdapter`) es el único que sabe que existe Supabase. Si más adelante hay presupuesto para AWS S3, se agrega otro adaptador sin tocar casos de uso.
- El backend **no sube el binario en el mismo request que crea el registro**: el flujo recomendado es (a) el front pide al backend una URL firmada, (b) el front sube el archivo directo a Supabase con esa URL, y (c) el front llama al backend solo para registrar la URL resultante en `imagen_campus`. Esto evita pasar archivos pesados por el backend de Spring innecesariamente.

### 1.6 Endpoints — Campus (con contratos JSON)

```
POST   /api/v1/campus
```
Crea un campus.

Request:
```json
{
  "universidadId": 1,
  "codigo": "ZARAGOCILLA",
  "nombre": "Sede Zaragocilla",
  "direccion": "Zaragocilla, Cartagena de Indias",
  "ciudad": "Cartagena",
  "descripcion": "Sede especializada en Ciencias de la Salud, incluye el programa de Medicina."
}
```
Response `201`:
```json
{
  "id": 3,
  "codigo": "ZARAGOCILLA",
  "nombre": "Sede Zaragocilla",
  "direccion": "Zaragocilla, Cartagena de Indias",
  "ciudad": "Cartagena",
  "descripcion": "Sede especializada en Ciencias de la Salud, incluye el programa de Medicina.",
  "estado": "ACTIVO"
}
```

```
GET    /api/v1/campus?estado=ACTIVO       Listar campus
GET    /api/v1/campus/{codigo}            Detalle de un campus
PATCH  /api/v1/campus/{id}/estado         Activar/inactivar (body: { "estado": "INACTIVO" })
```

```
POST   /api/v1/campus/{id}/imagenes/upload-url
```
Genera la URL firmada de Supabase para que el front suba el archivo directamente.

Request:
```json
{
  "nombreArchivo": "lab-microbiologia-01.jpg",
  "contentType": "image/jpeg"
}
```
Response `200`:
```json
{
  "urlSubida": "https://xxxx.supabase.co/storage/v1/object/upload/sign/campus/zaragocilla/lab-microbiologia-01.jpg?token=...",
  "urlPublicaResultante": "https://xxxx.supabase.co/storage/v1/object/public/campus/zaragocilla/lab-microbiologia-01.jpg",
  "expiraEn": 300
}
```

```
POST   /api/v1/campus/{id}/imagenes
```
Registra la URL ya subida.

Request:
```json
{
  "categoriaCodigo": "LABORATORIO",
  "url": "https://xxxx.supabase.co/storage/v1/object/public/campus/zaragocilla/lab-microbiologia-01.jpg",
  "descripcion": "Laboratorio de microbiología, bloque B",
  "orden": 1
}
```
Response `201`:
```json
{
  "id": 145,
  "campusId": 3,
  "categoria": { "codigo": "LABORATORIO", "nombre": "Laboratorios" },
  "url": "https://xxxx.supabase.co/storage/v1/object/public/campus/zaragocilla/lab-microbiologia-01.jpg",
  "descripcion": "Laboratorio de microbiología, bloque B",
  "orden": 1,
  "estado": "ACTIVA"
}
```

```
GET    /api/v1/campus/{id}/imagenes?categoria=LABORATORIO   Listar imágenes de un campus, filtrable por categoría
DELETE /api/v1/campus/{id}/imagenes/{imagenId}              Elimina el registro (y opcionalmente el archivo en Supabase)
GET    /api/v1/catalogos/categoria-imagen-campus            Listar categorías disponibles

POST   /api/v1/programas/{programaId}/campus/{campusId}    Vincular programa a un campus
GET    /api/v1/programas/{programaId}/campus                Campus donde se dicta un programa
```

---

## 2. Programas disponibles para inscripción

Esto es lo que Marlon llamó "el endpoint de programas ofertados o disponibles para inscripción". La clave es que **no es lo mismo que `programa_academico`**: un programa puede existir en el catálogo institucional sin estar abierto a inscripción en este momento (ej. está `SUSPENDIDO`, o simplemente no hay convocatoria abierta este período). Por eso se necesita una tabla intermedia de oferta, igual que en Programación Académica se necesitará para los grupos.

### 2.1 Diccionario de campos — `periodo_admision`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `5` |
| `codigo` | VARCHAR(20) | Sí | Identificador corto, único, tipo "2026-2". | `2026-2` |
| `nombre` | VARCHAR(100) | Sí | Nombre visible. | `Segundo período 2026` |
| `fecha_inicio_inscripciones` | DATE | Sí | Desde cuándo se aceptan inscripciones. | `2026-09-15` |
| `fecha_fin_inscripciones` | DATE | Sí | Debe ser `>=` a la fecha de inicio (validado por `chk_periodo_admision_fechas`). | `2026-11-30` |
| `fecha_inicio_clases` | DATE | No | Informativo, útil para mostrarlo en la factura/confirmación de admisión. | `2027-01-26` |
| `estado` | VARCHAR(20) | Sí (default `PROGRAMADO`) | `PROGRAMADO` (aún no abre) → `ABIERTO` (acepta inscripciones) → `CERRADO`. Solo se puede crear `oferta_admision` sobre un período `ABIERTO` o `PROGRAMADO`. | `ABIERTO` |

### 2.2 Diccionario de campos — `oferta_admision`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `88` |
| `periodo_admision_id` | BIGINT (FK) | Sí | A qué convocatoria pertenece. | `5` |
| `programa_id` | BIGINT (FK) | Sí | Qué programa se ofrece. | `12` |
| `plan_estudios_id` | BIGINT (FK) | Sí | A qué pensum queda vinculado el admitido. **Debe estar en estado `VIGENTE`** (se valida en el caso de uso, no solo en BD). | `27` |
| `campus_id` | BIGINT (FK) | Sí | En qué sede se dicta esta oferta puntual. | `3` |
| `cupos_totales` | INTEGER | Sí | Cupos ofrecidos originalmente. | `40` |
| `cupos_disponibles` | INTEGER | Sí | Se decrementa solo cuando una inscripción pasa a `ADMITIDO` (nunca al solo inscribirse). Debe mantenerse entre `0` y `cupos_totales`. | `40` (al crear, igual a `cupos_totales`) |
| `valor_inscripcion` | NUMERIC(12,2) | Sí | Valor que se cobra solo por inscribirse (no es la matrícula). Es la base para generar la `factura`. | `85000.00` |
| `moneda_id` | BIGINT (FK) | Sí | En qué moneda está expresado `valor_inscripcion`. | `1` (COP) |
| `estado` | VARCHAR(20) | Sí (default `ACTIVA`) | `ACTIVA` \| `AGOTADA` (cupos en 0) \| `CERRADA` (cerrada manualmente aunque haya cupos). | `ACTIVA` |

```sql
CREATE TABLE periodo_admision (
    id                          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo                      VARCHAR(20) NOT NULL,
    nombre                      VARCHAR(100) NOT NULL,
    fecha_inicio_inscripciones  DATE NOT NULL,
    fecha_fin_inscripciones     DATE NOT NULL,
    fecha_inicio_clases         DATE,
    estado                      VARCHAR(20) NOT NULL DEFAULT 'PROGRAMADO',
    CONSTRAINT uq_periodo_admision_codigo UNIQUE (codigo),
    CONSTRAINT chk_periodo_admision_fechas CHECK (fecha_fin_inscripciones >= fecha_inicio_inscripciones),
    CONSTRAINT chk_periodo_admision_estado CHECK (estado IN ('PROGRAMADO', 'ABIERTO', 'CERRADO'))
);

CREATE TABLE oferta_admision (
    id                      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    periodo_admision_id     BIGINT NOT NULL,
    programa_id             BIGINT NOT NULL,
    plan_estudios_id        BIGINT NOT NULL,
    campus_id               BIGINT NOT NULL,
    cupos_totales           INTEGER NOT NULL,
    cupos_disponibles       INTEGER NOT NULL,
    valor_inscripcion       NUMERIC(12,2) NOT NULL,
    moneda_id               BIGINT NOT NULL,
    estado                  VARCHAR(20) NOT NULL DEFAULT 'ACTIVA',

    CONSTRAINT fk_oferta_periodo   FOREIGN KEY (periodo_admision_id) REFERENCES periodo_admision(id) ON DELETE RESTRICT,
    CONSTRAINT fk_oferta_programa  FOREIGN KEY (programa_id) REFERENCES programa_academico(id) ON DELETE RESTRICT,
    CONSTRAINT fk_oferta_pensum    FOREIGN KEY (plan_estudios_id) REFERENCES plan_estudios(id) ON DELETE RESTRICT,
    CONSTRAINT fk_oferta_campus    FOREIGN KEY (campus_id) REFERENCES campus(id) ON DELETE RESTRICT,
    CONSTRAINT fk_oferta_moneda    FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON DELETE RESTRICT,

    CONSTRAINT uq_oferta_periodo_programa_campus UNIQUE (periodo_admision_id, programa_id, campus_id),
    CONSTRAINT chk_oferta_cupos CHECK (cupos_disponibles >= 0 AND cupos_disponibles <= cupos_totales),
    CONSTRAINT chk_oferta_estado CHECK (estado IN ('ACTIVA', 'AGOTADA', 'CERRADA'))
);
```

> Nota: `moneda` se define en §4.1 porque también la usa `factura`; en el script real de migración (Flyway) va antes de `oferta_admision` para respetar el orden de FKs.

### 2.3 Regla de negocio clave

- Solo se puede crear una `oferta_admision` sobre un `plan_estudios` en estado `VIGENTE` (no se admite gente a un pensum `EN_EXTINCION` — esa validación ya existía conceptualmente en la Etapa 1, aquí es donde realmente se aplica).
- `cupos_disponibles` se decrementa transaccionalmente cuando una inscripción pasa a `ADMITIDO`, nunca antes — inscribirse no reserva cupo, admitir sí.

### 2.4 Endpoints (con contratos JSON)

```
POST   /api/v1/periodos-admision
```
Request:
```json
{
  "codigo": "2026-2",
  "nombre": "Segundo período 2026",
  "fechaInicioInscripciones": "2026-09-15",
  "fechaFinInscripciones": "2026-11-30",
  "fechaInicioClases": "2027-01-26"
}
```
Response `201`:
```json
{
  "id": 5,
  "codigo": "2026-2",
  "nombre": "Segundo período 2026",
  "estado": "PROGRAMADO",
  "fechaInicioInscripciones": "2026-09-15",
  "fechaFinInscripciones": "2026-11-30",
  "fechaInicioClases": "2027-01-26"
}
```

```
PATCH  /api/v1/periodos-admision/{id}/estado    Body: { "estado": "ABIERTO" }
GET    /api/v1/periodos-admision?estado=ABIERTO
```

```
POST   /api/v1/ofertas-admision
```
Publicar un programa a inscripción.

Request:
```json
{
  "periodoAdmisionId": 5,
  "programaId": 12,
  "planEstudiosId": 27,
  "campusId": 3,
  "cuposTotales": 40,
  "valorInscripcion": 85000.00,
  "monedaCodigo": "COP"
}
```
Response `201`:
```json
{
  "id": 88,
  "periodo": { "id": 5, "codigo": "2026-2" },
  "programa": { "id": 12, "nombre": "Medicina" },
  "pensum": { "id": 27, "codigoPensum": "MED-2022" },
  "campus": { "id": 3, "codigo": "ZARAGOCILLA", "nombre": "Sede Zaragocilla" },
  "cuposTotales": 40,
  "cuposDisponibles": 40,
  "valorInscripcion": 85000.00,
  "moneda": "COP",
  "estado": "ACTIVA"
}
```

```
GET    /api/v1/ofertas-admision?periodoId={id}                 Programas disponibles para inscripción — EL endpoint que pidió Marlon
GET    /api/v1/ofertas-admision?periodoId={id}&campusId={id}   Filtrable por sede, para la vista de campus
GET    /api/v1/ofertas-admision/{id}                            Detalle (incluye cupos, valor, pensum)
PATCH  /api/v1/ofertas-admision/{id}/estado                     Cerrar oferta manualmente (body: { "estado": "CERRADA" })
```

Ejemplo de response del listado (`GET /api/v1/ofertas-admision?periodoId=5`), pensado ya para lo que el front necesita pintar la tarjeta de cada programa:
```json
[
  {
    "id": 88,
    "programa": { "id": 12, "nombre": "Medicina", "codigoSnies": "10456" },
    "campus": { "id": 3, "codigo": "ZARAGOCILLA", "nombre": "Sede Zaragocilla" },
    "cuposDisponibles": 40,
    "valorInscripcion": 85000.00,
    "moneda": "COP",
    "estado": "ACTIVA"
  },
  {
    "id": 91,
    "programa": { "id": 4, "nombre": "Ingeniería de Sistemas", "codigoSnies": "10112" },
    "campus": { "id": 1, "codigo": "PIEDRA_BOLIVAR", "nombre": "Sede Piedra de Bolívar" },
    "cuposDisponibles": 12,
    "valorInscripcion": 85000.00,
    "moneda": "COP",
    "estado": "ACTIVA"
  }
]
```

---

## 3. Admisiones: Aspirantes e Inscripciones

### 3.1 Diccionario de campos — `aspirante`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `501` |
| `tipo_documento` | VARCHAR(20) | Sí | `CC`, `TI`, `CE`, `PASAPORTE`. Se deja VARCHAR en vez de catálogo aparte por ahora porque el set de valores es muy estable en Colombia; se puede migrar a tabla de catálogo después si hace falta administrar desde UI. | `TI` |
| `numero_documento` | VARCHAR(30) | Sí | Junto con `tipo_documento` forma la clave única del aspirante (no se puede registrar dos veces la misma persona). | `1234567890` |
| `nombres` | VARCHAR(150) | Sí | — | `María José` |
| `apellidos` | VARCHAR(150) | Sí | — | `Pérez Ramírez` |
| `email` | VARCHAR(150) | Sí | Canal principal de notificación (confirmación de inscripción, estado de admisión, factura). | `mariajose.perez@example.com` |
| `telefono` | VARCHAR(30) | No | — | `+57 300 1234567` |
| `fecha_nacimiento` | DATE | No | Útil para validar edad mínima según el programa si la universidad lo requiere. | `2008-04-12` |
| `fecha_registro` | TIMESTAMP | Sí (auto) | — | `2026-09-07T09:00:00` |
| `estado` | VARCHAR(20) | Sí (default `REGISTRADO`) | `REGISTRADO` → `VERIFICADO` (correo/documento validado) → `BLOQUEADO` (ej. sospecha de fraude). | `REGISTRADO` |

### 3.2 Diccionario de campos — `inscripcion`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `900` |
| `aspirante_id` | BIGINT (FK) | Sí | Quién se inscribe. | `501` |
| `oferta_admision_id` | BIGINT (FK) | Sí | A qué oferta puntual (programa + campus + período) se inscribe. | `88` |
| `fecha_inscripcion` | TIMESTAMP | Sí (auto) | — | `2026-09-07T09:05:00` |
| `estado` | VARCHAR(30) | Sí (default `PENDIENTE_PAGO`) | `PENDIENTE_PAGO` → `EN_REVISION` → `ADMITIDO` \| `RECHAZADO` → (futuro) `MATRICULADO`. Solo puede pasar a `ADMITIDO` si su factura asociada está `PAGADA`. | `PENDIENTE_PAGO` |
| `observaciones` | TEXT | No | Notas internas del equipo de admisiones (ej. motivo de rechazo). | `Falta certificado de bachiller legible` |

### 3.3 Diccionario de campos — `documento_aspirante`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `1210` |
| `inscripcion_id` | BIGINT (FK) | Sí | A qué inscripción pertenece el soporte. | `900` |
| `tipo_documento` | VARCHAR(50) | Sí | `CEDULA`, `DIPLOMA_BACHILLER`, `ICFES`, `FOTO`, `OTRO`. | `DIPLOMA_BACHILLER` |
| `url` | VARCHAR(500) | Sí | URL en el bucket **privado** de Supabase (a diferencia de las imágenes de campus, estos documentos no son públicos). | `https://xxxx.supabase.co/storage/v1/object/sign/aspirantes/501/diploma.pdf?token=...` |
| `fecha_carga` | TIMESTAMP | Sí (auto) | — | `2026-09-07T09:10:00` |
| `estado` | VARCHAR(20) | Sí (default `CARGADO`) | `CARGADO` → `VALIDADO` \| `RECHAZADO` (por el equipo de admisiones). | `CARGADO` |

```sql
CREATE TABLE aspirante (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo_documento      VARCHAR(20) NOT NULL,
    numero_documento    VARCHAR(30) NOT NULL,
    nombres             VARCHAR(150) NOT NULL,
    apellidos           VARCHAR(150) NOT NULL,
    email               VARCHAR(150) NOT NULL,
    telefono            VARCHAR(30),
    fecha_nacimiento    DATE,
    fecha_registro      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado              VARCHAR(20) NOT NULL DEFAULT 'REGISTRADO',
    CONSTRAINT uq_aspirante_documento UNIQUE (tipo_documento, numero_documento),
    CONSTRAINT chk_aspirante_estado CHECK (estado IN ('REGISTRADO', 'VERIFICADO', 'BLOQUEADO'))
);

CREATE TABLE inscripcion (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    aspirante_id        BIGINT NOT NULL,
    oferta_admision_id  BIGINT NOT NULL,
    fecha_inscripcion   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado              VARCHAR(30) NOT NULL DEFAULT 'PENDIENTE_PAGO',
    observaciones       TEXT,
    CONSTRAINT fk_inscripcion_aspirante FOREIGN KEY (aspirante_id) REFERENCES aspirante(id) ON DELETE RESTRICT,
    CONSTRAINT fk_inscripcion_oferta FOREIGN KEY (oferta_admision_id) REFERENCES oferta_admision(id) ON DELETE RESTRICT,
    CONSTRAINT uq_inscripcion_aspirante_oferta UNIQUE (aspirante_id, oferta_admision_id),
    CONSTRAINT chk_inscripcion_estado CHECK (estado IN ('PENDIENTE_PAGO', 'EN_REVISION', 'ADMITIDO', 'RECHAZADO', 'MATRICULADO'))
);

CREATE TABLE documento_aspirante (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    inscripcion_id      BIGINT NOT NULL,
    tipo_documento      VARCHAR(50) NOT NULL,
    url                 VARCHAR(500) NOT NULL,
    fecha_carga         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado              VARCHAR(20) NOT NULL DEFAULT 'CARGADO',
    CONSTRAINT fk_documento_inscripcion FOREIGN KEY (inscripcion_id) REFERENCES inscripcion(id) ON DELETE CASCADE,
    CONSTRAINT chk_documento_estado CHECK (estado IN ('CARGADO', 'VALIDADO', 'RECHAZADO'))
);
```

### 3.4 Regla de negocio clave

- Una inscripción **no pasa a `ADMITIDO`** si su factura de inscripción (§4) no está `PAGADA`. Esta validación va en el caso de uso `AdmitirAspiranteUseCase`, no en la base de datos (la BD no sabe de pagos por diseño de capas).
- El decremento de `cupos_disponibles` en `oferta_admision` ocurre en la misma transacción que el cambio a `ADMITIDO`, para evitar sobrecupo por condición de carrera en época de alta demanda (aquí sí aplica el mismo Redis/lock que Programación Académica va a necesitar).

### 3.5 Endpoints (con contratos JSON)

```
POST   /api/v1/aspirantes
```
Request:
```json
{
  "tipoDocumento": "TI",
  "numeroDocumento": "1234567890",
  "nombres": "María José",
  "apellidos": "Pérez Ramírez",
  "email": "mariajose.perez@example.com",
  "telefono": "+57 300 1234567",
  "fechaNacimiento": "2008-04-12"
}
```
Response `201`:
```json
{
  "id": 501,
  "tipoDocumento": "TI",
  "numeroDocumento": "1234567890",
  "nombres": "María José",
  "apellidos": "Pérez Ramírez",
  "email": "mariajose.perez@example.com",
  "estado": "REGISTRADO"
}
```

```
GET    /api/v1/aspirantes/{id}
```

```
POST   /api/v1/inscripciones
```
Request:
```json
{
  "aspiranteId": 501,
  "ofertaAdmisionId": 88
}
```
Response `201`:
```json
{
  "id": 900,
  "aspirante": { "id": 501, "nombres": "María José", "apellidos": "Pérez Ramírez" },
  "ofertaAdmision": {
    "id": 88,
    "programa": "Medicina",
    "campus": "Sede Zaragocilla",
    "periodo": "2026-2"
  },
  "estado": "PENDIENTE_PAGO",
  "factura": {
    "id": 2200,
    "numeroFactura": "FAC-2026-002200",
    "valor": 85000.00,
    "moneda": "COP",
    "estado": "PENDIENTE"
  }
}
```
> Nota: al crear la inscripción, el backend genera automáticamente la `factura` de concepto `INSCRIPCION` en la misma transacción (ver §4.3), por eso el response ya la incluye.

```
GET    /api/v1/inscripciones/{id}                          Detalle de inscripción
GET    /api/v1/aspirantes/{id}/inscripciones                 Inscripciones de un aspirante
PATCH  /api/v1/inscripciones/{id}/estado                    Body: { "estado": "ADMITIDO", "observaciones": "..." }
```

```
POST   /api/v1/inscripciones/{id}/documentos/upload-url
```
Request:
```json
{ "tipoDocumento": "DIPLOMA_BACHILLER", "nombreArchivo": "diploma.pdf", "contentType": "application/pdf" }
```
Response `200`:
```json
{
  "urlSubida": "https://xxxx.supabase.co/storage/v1/object/upload/sign/aspirantes/501/diploma.pdf?token=...",
  "urlPrivadaResultante": "https://xxxx.supabase.co/storage/v1/object/sign/aspirantes/501/diploma.pdf",
  "expiraEn": 300
}
```

```
POST   /api/v1/inscripciones/{id}/documentos
```
Request:
```json
{
  "tipoDocumento": "DIPLOMA_BACHILLER",
  "url": "https://xxxx.supabase.co/storage/v1/object/sign/aspirantes/501/diploma.pdf"
}
```
Response `201`:
```json
{
  "id": 1210,
  "inscripcionId": 900,
  "tipoDocumento": "DIPLOMA_BACHILLER",
  "estado": "CARGADO"
}
```

```
GET    /api/v1/inscripciones/{id}/documentos              Listar soportes cargados
```

---

## 4. Pagos y Facturación

### 4.1 Diccionario de campos — `moneda`

| Campo | Tipo | Obligatorio | Descripción | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `1` |
| `codigo_iso` | VARCHAR(3) | Sí | Código ISO 4217. | `COP` |
| `nombre` | VARCHAR(50) | Sí | — | `Peso colombiano` |
| `simbolo` | VARCHAR(5) | Sí | Para formatear montos en el front. | `$` |

Seed inicial: `COP` (Peso colombiano), `USD` (para si algún aspirante extranjero paga por PayPal en dólares).

### 4.2 Diccionario de campos — `concepto_pago`

| Campo | Tipo | Obligatorio | Descripción | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `1` |
| `codigo` | VARCHAR(30) | Sí | — | `INSCRIPCION` |
| `nombre` | VARCHAR(100) | Sí | — | `Derecho de inscripción` |

Seed inicial: `INSCRIPCION`, `MATRICULA` (se usará cuando exista el módulo de Matrícula), `DERECHOS_GRADO` (futuro).

### 4.3 Diccionario de campos — `factura`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `2200` |
| `inscripcion_id` | BIGINT (FK) | Sí | A qué inscripción corresponde. | `900` |
| `concepto_pago_id` | BIGINT (FK) | Sí | — | `1` (INSCRIPCION) |
| `moneda_id` | BIGINT (FK) | Sí | — | `1` (COP) |
| `numero_factura` | VARCHAR(30) | Sí | Consecutivo único, formato sugerido `FAC-{año}-{consecutivo}`. | `FAC-2026-002200` |
| `valor` | NUMERIC(12,2) | Sí | Debe ser `> 0`. Se copia de `oferta_admision.valor_inscripcion` al momento de generarse. | `85000.00` |
| `fecha_emision` | TIMESTAMP | Sí (auto) | — | `2026-09-07T09:05:00` |
| `fecha_vencimiento` | TIMESTAMP | No | Si se vence sin pago, pasa a `VENCIDA` (job programado o validación al consultar). | `2026-09-14T23:59:59` |
| `estado` | VARCHAR(20) | Sí (default `PENDIENTE`) | `PENDIENTE` → `PAGADA` (por webhook de la pasarela) \| `VENCIDA` \| `ANULADA`. | `PENDIENTE` |

### 4.4 Diccionario de campos — `pasarela_pago`

| Campo | Tipo | Obligatorio | Descripción | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `2` |
| `codigo` | VARCHAR(30) | Sí | `PAYPAL` \| `PSE`. | `PSE` |
| `nombre` | VARCHAR(80) | Sí | — | `PSE (Pagos Seguros en Línea)` |

### 4.5 Diccionario de campos — `pago`

| Campo | Tipo | Obligatorio | Descripción / regla de negocio | Ejemplo |
|---|---|---|---|---|
| `id` | BIGINT | Sí (autogenerado) | — | `4501` |
| `factura_id` | BIGINT (FK) | Sí | A qué factura corresponde. Una factura puede tener **varios** registros de `pago` si el primer intento fue rechazado y el aspirante reintentó. | `2200` |
| `pasarela_id` | BIGINT (FK) | Sí | Con qué pasarela se intentó el pago. | `2` (PSE) |
| `moneda_id` | BIGINT (FK) | Sí | — | `1` (COP) |
| `referencia_externa` | VARCHAR(100) | No (se llena al confirmar) | ID de la transacción en PayPal, o en el agregador PSE elegido (Wompi/ePayco/PayU). Clave para conciliar reclamos. | `wompi_tx_8f3a...` |
| `valor_pagado` | NUMERIC(12,2) | Sí | Debe coincidir con `factura.valor`; si no coincide, el caso de uso debe rechazar la confirmación aunque la pasarela diga "aprobado". | `85000.00` |
| `estado` | VARCHAR(20) | Sí (default `INICIADO`) | `INICIADO` (se generó el checkout) → `PENDIENTE` (esperando confirmación async, típico de PSE) → `APROBADO` \| `RECHAZADO` \| `EXPIRADO`. | `INICIADO` |
| `payload_respuesta` | JSONB | No | Respuesta cruda de la pasarela, guardada tal cual para auditoría/soporte ante reclamos ("yo sí pagué"). | `{ "status": "APPROVED", "id": "..." }` |
| `fecha_creacion` | TIMESTAMP | Sí (auto) | — | `2026-09-07T09:06:00` |
| `fecha_confirmacion` | TIMESTAMP | No | Se llena solo cuando llega el webhook de confirmación. | `2026-09-07T09:12:40` |

```sql
CREATE TABLE moneda (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_iso          VARCHAR(3) NOT NULL,
    nombre              VARCHAR(50) NOT NULL,
    simbolo             VARCHAR(5) NOT NULL,
    CONSTRAINT uq_moneda_codigo_iso UNIQUE (codigo_iso)
);

CREATE TABLE concepto_pago (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(100) NOT NULL,
    CONSTRAINT uq_concepto_pago_codigo UNIQUE (codigo)
);

CREATE TABLE factura (
    id                      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    inscripcion_id          BIGINT NOT NULL,
    concepto_pago_id        BIGINT NOT NULL,
    moneda_id               BIGINT NOT NULL,
    numero_factura          VARCHAR(30) NOT NULL,
    valor                   NUMERIC(12,2) NOT NULL,
    fecha_emision           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_vencimiento       TIMESTAMP,
    estado                  VARCHAR(20) NOT NULL DEFAULT 'PENDIENTE',
    CONSTRAINT fk_factura_inscripcion FOREIGN KEY (inscripcion_id) REFERENCES inscripcion(id) ON DELETE RESTRICT,
    CONSTRAINT fk_factura_concepto FOREIGN KEY (concepto_pago_id) REFERENCES concepto_pago(id) ON DELETE RESTRICT,
    CONSTRAINT fk_factura_moneda FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON DELETE RESTRICT,
    CONSTRAINT uq_factura_numero UNIQUE (numero_factura),
    CONSTRAINT chk_factura_valor CHECK (valor > 0),
    CONSTRAINT chk_factura_estado CHECK (estado IN ('PENDIENTE', 'PAGADA', 'VENCIDA', 'ANULADA'))
);

CREATE TABLE pasarela_pago (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(80) NOT NULL,
    CONSTRAINT uq_pasarela_codigo UNIQUE (codigo)
);

CREATE TABLE pago (
    id                      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    factura_id              BIGINT NOT NULL,
    pasarela_id             BIGINT NOT NULL,
    moneda_id               BIGINT NOT NULL,
    referencia_externa      VARCHAR(100),
    valor_pagado            NUMERIC(12,2) NOT NULL,
    estado                  VARCHAR(20) NOT NULL DEFAULT 'INICIADO',
    payload_respuesta       JSONB,
    fecha_creacion          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_confirmacion      TIMESTAMP,
    CONSTRAINT fk_pago_factura FOREIGN KEY (factura_id) REFERENCES factura(id) ON DELETE RESTRICT,
    CONSTRAINT fk_pago_pasarela FOREIGN KEY (pasarela_id) REFERENCES pasarela_pago(id) ON DELETE RESTRICT,
    CONSTRAINT fk_pago_moneda FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON DELETE RESTRICT,
    CONSTRAINT chk_pago_estado CHECK (estado IN ('INICIADO', 'PENDIENTE', 'APROBADO', 'RECHAZADO', 'EXPIRADO'))
);
```

### 4.6 Regla de negocio clave

- La factura pasa a `PAGADA` **únicamente** cuando llega una confirmación de la pasarela (webhook), nunca por el simple hecho de que el aspirante haya "iniciado" el pago en el frontend. Esto es crítico con PSE, porque el usuario puede cerrar la ventana del banco a mitad de proceso.
- `pago.payload_respuesta` guarda la respuesta cruda como JSONB — no para consultarla en lógica de negocio, sino para poder auditar/depurar reclamos de aspirantes ("yo sí pagué") sin depender de los logs de la pasarela externa.
- Antes de marcar `APROBADO`, el caso de uso `ConfirmarPagoWebhookUseCase` **valida que `valor_pagado` coincida con `factura.valor`**, para blindarse contra una respuesta manipulada o un bug de la pasarela.

### 4.7 Arquitectura del módulo de pagos (puerto agnóstico a la pasarela)

```
com.academicore.pagos
├── domain/
│   ├── model/                      # Factura, Pago (dominio puro)
│   └── repository/
│
├── application/
│   ├── usecase/
│   │   ├── GenerarFacturaInscripcionUseCase
│   │   ├── IniciarPagoUseCase           # decide qué adaptador llamar según pasarela elegida
│   │   └── ConfirmarPagoWebhookUseCase  # procesa la notificación async de la pasarela
│   └── port/
│       └── PasarelaPagoPort            # interfaz única: iniciarPago(), consultarEstado()
│
└── infrastructure/
    └── pasarelas/
        ├── paypal/PayPalAdapter        # implementa PasarelaPagoPort
        └── pse/PseAdapter              # implementa PasarelaPagoPort (ver nota 4.8)
```

`PasarelaPagoPort` es lo único que el caso de uso conoce. Si mañana la universidad decide agregar Nequi o Mercado Pago, se agrega otro adaptador sin tocar `IniciarPagoUseCase`.

### 4.8 Nota técnica importante sobre PSE — léela antes de empezar a construir

Esto **no estaba en el chat** pero es necesario aclararlo porque cambia el alcance real del trabajo:

**PSE no es una pasarela que se integre directamente con un botón, como PayPal.** PSE es el riel de pagos interbancario colombiano (ACH Colombia), y para conectarse a él una empresa necesita ser un "recaudador" autorizado, lo cual implica un proceso de habilitación bancario propio, no algo que se resuelva solo con una API key.

En la práctica, casi ninguna empresa se integra a PSE directamente. Lo que se hace es integrarse con un **agregador de pagos colombiano** que ya tiene el convenio con ACH Colombia y expone PSE (junto con tarjetas, Nequi, etc.) detrás de una sola API. Las opciones más usadas para este caso son:

| Agregador | Por qué se suele elegir |
|---|---|
| **Wompi** (Bancolombia) | API simple, buena documentación en español, sandbox fácil de probar, tarifas competitivas para volumen bajo/medio — probablemente el mejor punto de partida para un proyecto universitario. |
| **ePayco** | Alternativa colombiana muy usada por instituciones educativas específicamente, tiene módulos ya pensados para "pago de matrícula". |
| **PayU** | Más corporativo, integración algo más pesada, pero soporta también pagos internacionales si en el futuro quieren cobrarle a aspirantes extranjeros sin PayPal. |

**Recomendación concreta para este proyecto:** usar **Wompi** o **ePayco** como el adaptador real detrás de `PseAdapter`, en vez de intentar hablar con ACH Colombia directo. El nombre `PseAdapter` en el diagrama de arriba se refiere al *método de pago* PSE tal como lo ve el aspirante, pero técnicamente se implementa contra la API del agregador elegido. Esto no cambia nada del modelo de datos de este documento (`pasarela_pago.codigo = 'PSE'` sigue siendo válido de cara al negocio), solo cambia qué SDK/API se usa dentro de `infrastructure/pasarelas/pse/`.

- [ ] Antes del próximo sprint (como quedó dicho en el chat): decidir entre Wompi, ePayco o PayU, revisando comisión por transacción y tiempo de aprobación como comercio nuevo — esto puede tardar días/semanas en aprobarse y conviene arrancarlo ya, en paralelo al desarrollo.

**Sobre PayPal:** confirmado en el chat que es el mismo que ya usan en Onboard, así que la integración en sí es la parte conocida — el riesgo real y el punto que Marlon identificó bien ("dudo que el 10% tenga PayPal") es que **PayPal debe quedar como opción secundaria/para extranjeros**, y PSE (vía el agregador elegido) como el método principal para la población real de la UDC.

### 4.9 Endpoints (con contratos JSON)

```
GET    /api/v1/inscripciones/{id}/factura
GET    /api/v1/facturas/{id}
```
Response `200` (detalle de factura, lo que se muestra al aspirante):
```json
{
  "id": 2200,
  "numeroFactura": "FAC-2026-002200",
  "concepto": "Derecho de inscripción",
  "valor": 85000.00,
  "moneda": "COP",
  "fechaEmision": "2026-09-07T09:05:00",
  "fechaVencimiento": "2026-09-14T23:59:59",
  "estado": "PENDIENTE",
  "inscripcion": {
    "id": 900,
    "programa": "Medicina",
    "aspirante": "María José Pérez Ramírez"
  }
}
```

```
POST   /api/v1/facturas/{id}/pagos
```
Inicia un pago contra la pasarela elegida.

Request:
```json
{
  "pasarela": "PSE",
  "urlRetorno": "https://admisiones.udc.edu.co/inscripcion/900/confirmacion"
}
```
Response `201` (el front redirige al aspirante a `urlCheckout`):
```json
{
  "pagoId": 4501,
  "estado": "INICIADO",
  "pasarela": "PSE",
  "urlCheckout": "https://checkout.wompi.co/p/abc123..."
}
```

Ejemplo con PayPal (mismo endpoint, cambia `pasarela`):
```json
{ "pasarela": "PAYPAL", "urlRetorno": "https://admisiones.udc.edu.co/inscripcion/900/confirmacion" }
```
```json
{
  "pagoId": 4502,
  "estado": "INICIADO",
  "pasarela": "PAYPAL",
  "urlCheckout": "https://www.paypal.com/checkoutnow?token=EC-..."
}
```

```
POST   /api/v1/pagos/webhook/paypal
POST   /api/v1/pagos/webhook/pse
```
Estos dos no los llama el front — los llama la pasarela/agregador de forma asíncrona. Ejemplo simplificado de lo que llegaría desde Wompi (PSE) y de cómo debe verse `payload_respuesta` guardado:
```json
{
  "event": "transaction.updated",
  "data": {
    "transaction": {
      "id": "wompi_tx_8f3a...",
      "reference": "FAC-2026-002200",
      "status": "APPROVED",
      "amount_in_cents": 8500000,
      "currency": "COP"
    }
  }
}
```
El caso de uso `ConfirmarPagoWebhookUseCase` toma `reference` para ubicar la `factura`, valida `amount_in_cents` contra `factura.valor`, y solo entonces marca `pago.estado = APROBADO` y `factura.estado = PAGADA`.

```
GET    /api/v1/pagos/{id}/estado                            Consultar estado de un pago puntual (polling desde el front mientras espera el webhook)
GET    /api/v1/catalogos/monedas                            Listar monedas soportadas
GET    /api/v1/catalogos/pasarelas-pago                     Listar pasarelas disponibles (para pintar los botones en el front)
```

---

## 5. Orden de implementación sugerido para este sprint

Dado que Marlon va a empezar en paralelo con la vista de inscripciones/admisiones en el front, este orden minimiza bloqueos mutuos:

1. **Campus + imágenes** (§1) — es independiente de todo lo demás, se puede entregar primero y ya desbloquea la página pública de sedes.
2. **Catálogos base** (`moneda`, `concepto_pago`, `pasarela_pago`, `categoria_imagen_campus`) — rápidos de crear, y todo lo demás depende de que existan.
3. **`periodo_admision` + `oferta_admision`** (§2) — desbloquea el endpoint de "programas disponibles para inscripción" que el front necesita cuanto antes.
4. **`aspirante` + `inscripcion` + `documento_aspirante`** (§3) — con esto el front ya puede construir el formulario completo de inscripción, incluso antes de que pagos esté listo (la inscripción nace en `PENDIENTE_PAGO` y se queda ahí).
5. **`factura` + `pago` + adaptadores PayPal/PSE** (§4) — se hace al final porque depende de una decisión externa (elegir agregador PSE) que no depende de ustedes, así que no debe bloquear el resto del sprint.

---

## 6. Checklist de arranque inmediato

- [ ] Migración Flyway de este documento (respetar el orden: catálogos → `campus` → `imagen_campus`/`programa_campus` → `periodo_admision`/`oferta_admision` → `aspirante`/`inscripcion`/`documento_aspirante` → `factura`/`pago`)
- [ ] Sincronizar nombres de campus y categorías de imagen contra el array del frontend (§1.1) antes de correr el seed
- [ ] Crear bucket en Supabase Storage para imágenes de campus (público) y otro para documentos de aspirantes (privado, con políticas de acceso distintas)
- [ ] Definir formato final del consecutivo de `numero_factura` (sugerido: `FAC-{año}-{consecutivo con ceros a la izquierda}`)
- [ ] Casos de uso: crear campus → cargar imágenes → publicar oferta de admisión → registrar aspirante → crear inscripción (genera factura) → iniciar pago → confirmar por webhook → admitir
- [ ] Definir con Juan, antes de tocar código de pagos, cuál agregador PSE se va a usar (Wompi/ePayco/PayU) — es la única dependencia externa de todo este plan
- [ ] Tests: "no se puede admitir una inscripción con factura no pagada", "no se puede publicar oferta sobre un pensum que no está VIGENTE", "cupos_disponibles nunca queda negativo bajo concurrencia", "un webhook con valor distinto al de la factura no debe aprobar el pago"
