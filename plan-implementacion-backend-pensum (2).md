# Plan de Implementación — Backend AcademiCORE (Spring Boot)
## Etapa 1: Módulo de Plan de Estudios (Pensum)

> Nota: el manual del sistema define el stack como C#/ASP.NET Core. Este plan traduce la misma arquitectura (Clean Architecture, capas desacopladas, adaptador Oracle 12c, caché Redis) a Java + Spring Boot, que es lo que pediste. Si en algún momento necesitas justificar el cambio de stack ante el comité, vale la pena dejarlo documentado como una decisión técnica explícita.

---

## 1. Por qué empezar por el Pensum

Casi todo lo demás del sistema depende de esto: programación académica (CU-001, CU-002), matrícula autónoma (CU-011), inclusiones (CU-012), historia académica (CU-016) y cálculo de promedios, todos leen el plan de estudios para saber qué asignaturas existen, con qué créditos, en qué período académico y con qué prerrequisitos. Es la base de datos "maestra" del dominio académico. Por eso es la elección correcta como primera pieza del backend.

---

## 2. El problema central que hay que modelar bien

**Un Programa Académico (ej. Ingeniería de Sistemas) puede tener varios Pensums activos al mismo tiempo.**

Esto pasa porque:
- Cada reforma curricular (ej. "Reforma 2010", "Reforma 1102") genera un pensum nuevo, pero los estudiantes admitidos bajo el pensum anterior **no se migran automáticamente** — terminan su carrera bajo el pensum con el que ingresaron, salvo que pidan homologación.
- Un pensum puede quedar en distintos estados: `EN_DISEÑO` → `APROBADO` → `VIGENTE` → `EN_EXTINCIÓN` (ya no admite nuevos estudiantes, pero los que ya están matriculados lo siguen usando) → `HISTÓRICO`.

Esto significa que **la asignatura no pertenece directamente al programa**: pertenece a un **Pensum** específico de ese programa. Un mismo código de asignatura (ej. Cálculo I) puede repetirse en varios pensums de un mismo programa, o incluso ser compartida entre programas (asignaturas "no propias").

### Regla de negocio clave
> Un estudiante siempre está matriculado en **un único Pensum** (no en un "Programa" en abstracto). Su historia académica, sus créditos exigidos, sus prerrequisitos y su ruta de graduación se resuelven contra ESE pensum, aunque el programa ya tenga uno más nuevo vigente.

---

## 3. Modelo de dominio (capa `domain`)

```
Universidad
 └── Facultad  [1 universidad → N facultades]
      ├── DepartamentoAcademico  [1 facultad → N departamentos; dueño de las asignaturas de catálogo]
      │    └── Asignatura  [catálogo institucional, NO pertenece a un programa ni a un pensum]
      │         ├── codigo, nombre, descripcion, estado
      │         └── naturalezas: List<NaturalezaAsignatura>  (N:N — puede ser teórica y práctica a la vez)
      │
      └── ProgramaAcademico  [1 facultad → N programas]
           └── PlanEstudios (Pensum)  [1 programa → N pensums]
                ├── numeroResolucion, fechaAprobacion
                ├── estado: EN_DISENO | APROBADO | VIGENTE | EN_EXTINCION | HISTORICO | CANCELADO
                ├── fechaVigenciaDesde, fechaVigenciaHasta (nullable)
                ├── totalCreditos, periodicidad (SEMESTRAL | CUATRIMESTRAL | TRIMESTRAL | ANUAL)
                ├── NivelCurricular (1..N — sustituye a "semestre"; el número de niveles se deriva de cuántos existan, no de un contador declarado)
                │    └── numeroNivel, nombre
                └── PlanAsignatura  [la MISMA asignatura de catálogo, configurada para ESTE pensum y ubicada en un nivel]
                     ├── asignatura: Asignatura  (referencia al catálogo)
                     ├── nivelCurricular: NivelCurricular  (debe pertenecer al mismo plan — se valida con FK compuesta)
                     ├── tipoAsignatura: OBLIGATORIA | ELECTIVA | ELECTIVA_PROFUNDIZACION | ELECTIVA_COMPLEMENTARIA
                     ├── creditos, horasDocenciaSemanales, horasTrabajoIndependiente
                     ├── esHabilitable: boolean
                     └── requisitos: List<RequisitoPlanAsignatura>  (apunta a OTRO PlanAsignatura del mismo pensum — pre/co/antirrequisito)
```

```
Estudiante
 └── planEstudiosAsignado: PlanEstudios  (fijado al momento de admisión/matrícula inicial)
```

**Nota importante sobre el cambio de nombres:** en el esquema real, `PeriodoAcademico` deja de ser la estructura del pensum (eso ahora es `NivelCurricular`) y pasa a significar el periodo calendario real (2026-1, 2026-2), que pertenece al módulo de Programación Académica, no al de Pensum. Si en conversaciones anteriores usaste "período académico" para referirte a un semestre del plan, en el código y la API de aquí en adelante eso es `nivelCurricular`.

### Puntos de diseño importantes

| Decisión | Por qué |
|---|---|
| `Asignatura` como tabla única (fusiona lo que antes era `Asignatura` + `AsignaturaPensum`) | Simplifica el modelo: cada fila ya representa "esta asignatura, en este período académico, de este pensum, con estos créditos". El costo es que si la misma asignatura aparece en dos pensums, sus datos se duplican — pero eso además refleja la realidad: los créditos de una asignatura sí pueden cambiar de una reforma a otra. |
| `requisito_asignatura` como tabla N:N | Una asignatura puede tener uno, varios o ningún prerrequisito/correquisito — cada requisito es una fila independiente, así que no hay límite. |
| `PlanEstudios.estado` como máquina de estados explícita | Evita que se abra matrícula sobre un pensum que no está `VIGENTE`, y evita que se sigan admitiendo estudiantes a uno `EN_EXTINCION`. |
| Rango de vigencia con fechas, no solo un booleano `activo` | Necesario para auditoría histórica: "¿qué pensums estaban vigentes el semestre 2019-1?" |
| `Asignatura.programaOrigen` (carrera dueña) | Una asignatura no pertenece exclusivamente a la carrera que la usa: Cálculo I es dueña de Ciencias Exactas pero aparece en la malla de Ingeniería de Sistemas, Industrial, etc. |
| `Facultad` como tabla de referencia (`id`, `codigo`, `nombre`, `fecha_creacion`, `estado`), no un `VARCHAR` suelto en `programa_academico` | Evita nombres de facultad escritos de forma inconsistente entre programas ("Fac. Ingeniería" vs "Facultad de Ingeniería"), permite consultar/filtrar por facultad, y deja lista la extensión a otros datos propios de la facultad. Este mismo patrón (`id` + `codigo` + `nombre` + fechas + estado) conviene aplicarlo luego a otros catálogos que hoy quedaron como `VARCHAR` (ej. `estado` de pensum, `tipo_requisito`) si el proyecto crece y necesitas administrarlos desde la UI en vez de tenerlos fijos en el código. |
| `Universidad` como raíz jerárquica (`Universidad` → `Facultad` → `ProgramaAcademico`) | El esquema deja de estar atado a una sola institución. Esto es clave si el sistema se va a ofrecer como producto para varias IES (como menciona el manual: "las Instituciones de Educación Superior poseen diferencias significativas..."), o simplemente si en el futuro se fusiona con otra universidad o se usa como referencia para otro cliente. Por eso `facultad.codigo` ya no es único globalmente, sino único **dentro de** cada universidad (`UNIQUE (universidad_id, codigo)`). |
| `PeriodoAcademico` (antes "Semestre") con `duracion_meses` propio | Generaliza el bloque dentro del pensum para que no asuma que todas las IES organizan su plan en semestres de 6 meses. Una universidad puede tener trimestres (4 meses), cuatrimestres, o ciclos anuales — cada pensum define su propio `duracion_meses` por período, en vez de que el sistema lo asuma fijo en el código. **Ojo:** esto es distinto del "Calendario Académico" institucional que menciona el manual (el que abre matrículas, define fechas de inscripción, etc.) — ese es un concepto de *tiempo real* (ej. "2024-1"), mientras que `PeriodoAcademico` aquí es un concepto de *estructura del pensum* (ej. "nivel 3 de la carrera"). Cuando construyas el módulo de Programación Académica vas a necesitar relacionar ambos, pero no son la misma entidad. |
| `intensidad_horaria_presencial` + `intensidad_horaria_independiente` (en vez de una sola columna) | Refleja cómo se calcula realmente un crédito académico: horas de acompañamiento docente (clase, laboratorio) más horas de trabajo autónomo del estudiante. Separarlas permite validar la fórmula de créditos (ej. la normativa colombiana usa 1 crédito ≈ 48 horas totales/semestre repartidas entre ambas) y también sirve después para la Fase de Programación Académica, que solo necesita programar en el horario la intensidad **presencial** — el trabajo independiente no ocupa un salón ni un bloque horario. |
| `naturaleza_asignatura` como tabla de referencia (no un `VARCHAR`/enum fijo) | Igual razón que `facultad`/`universidad`: no todas las IES clasifican sus asignaturas igual. La mayoría usa teórica/práctica/teórico-práctica, pero otras agregan "virtual", "mixta", "de laboratorio puro", etc. Con un catálogo administrable no hay que tocar código ni redeployar para agregar una categoría nueva. |

---

## 4. Arquitectura del backend (Clean Architecture sobre Spring Boot)

Manteniendo el espíritu del documento (dominio aislado de infraestructura, adaptadores para Oracle 12c y Redis):

```
com.academicore.pensum
├── domain/                         # Núcleo — sin dependencias de Spring ni de infraestructura
│   ├── model/                      # Entidades de dominio puras (POJOs)
│   ├── repository/                 # Interfaces (puertos) — ej. PlanEstudiosRepository
│   └── exception/                  # Excepciones de negocio
│
├── application/                    # Casos de uso
│   ├── usecase/
│   │   ├── CrearPlanEstudiosUseCase
│   │   ├── ConsultarPensumVigenteUseCase
│   │   ├── ConsultarPensumPorEstudianteUseCase
│   │   └── AgregarAsignaturaAPensumUseCase
│   └── dto/                        # DTOs de entrada/salida de los casos de uso
│
├── infrastructure/
│   ├── persistence/
│   │   ├── entity/                 # @Entity JPA (mapeo, NO es el modelo de dominio)
│   │   ├── repository/             # Spring Data JPA — implementa los puertos del dominio
│   │   └── mapper/                 # Entity ↔ Domain model
│   ├── cache/                      # Adaptador Redis (oferta/pensum de alta consulta)
│   └── legacy/                     # Adaptador hacia Oracle 12c (para etapas futuras)
│
├── presentation/
│   ├── rest/
│   │   ├── controller/             # @RestController
│   │   └── dto/                    # Request/Response de la API (distinto del dto de application)
│   └── exception/                  # @ControllerAdvice
│
└── config/                         # Beans, seguridad, OpenAPI, etc.
```

Este orden importa: **el dominio no debe importar nada de `infrastructure` ni de `javax.persistence`**. Así, si en una fase posterior el pensum tiene que consultarse también desde Oracle 12c heredado, sólo tocas `infrastructure/legacy`, sin mover una línea de las reglas de negocio.

---

## 5. Esquema de base de datos (etapa 1)

> **Corrección:** el esquema de abajo es el real de AcademiCORE (`academicore.sql`), no el borrador que traía este plan originalmente. Se transcribe **exactamente**, sin modificarlo, porque ya está validado como el modelo de datos vigente. Las diferencias importantes frente al borrador anterior están explicadas después de la tabla.

```sql
-- ============================================================
-- 1. UNIVERSIDAD / INSTITUCIÓN
-- ============================================================

CREATE TABLE universidad (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    codigo              VARCHAR(20)  NOT NULL,
    nombre              VARCHAR(200) NOT NULL,

    fecha_creacion      DATE NOT NULL DEFAULT CURRENT_DATE,

    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVA',

    CONSTRAINT uq_universidad_codigo
        UNIQUE (codigo),

    CONSTRAINT chk_universidad_estado
        CHECK (estado IN (
            'ACTIVA',
            'INACTIVA'
        ))
);


-- ============================================================
-- 2. FACULTAD
-- ============================================================

CREATE TABLE facultad (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    universidad_id      BIGINT NOT NULL,
    codigo              VARCHAR(20) NOT NULL,
    nombre              VARCHAR(150) NOT NULL,

    fecha_creacion      DATE NOT NULL DEFAULT CURRENT_DATE,

    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVA',

    CONSTRAINT fk_facultad_universidad
        FOREIGN KEY (universidad_id)
        REFERENCES universidad(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_facultad_universidad_codigo
        UNIQUE (universidad_id, codigo),

    CONSTRAINT uq_facultad_universidad_nombre
        UNIQUE (universidad_id, nombre),

    CONSTRAINT chk_facultad_estado
        CHECK (estado IN (
            'ACTIVA',
            'INACTIVA'
        ))
);


-- ============================================================
-- 3. DEPARTAMENTO / UNIDAD ACADÉMICA
-- ============================================================
-- Una asignatura normalmente pertenece a una unidad académica
-- responsable (departamento, escuela, etc.), no necesariamente
-- a un programa académico.
--
-- Esto permite que:
--
-- Matemáticas I
--
-- sea utilizada por:
--   Ingeniería
--   Economía
--   Administración
--   etc.
--
-- sin duplicar la asignatura.
-- ============================================================

CREATE TABLE departamento_academico (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    facultad_id         BIGINT NOT NULL,

    codigo              VARCHAR(20) NOT NULL,
    nombre              VARCHAR(150) NOT NULL,

    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',

    CONSTRAINT fk_departamento_facultad
        FOREIGN KEY (facultad_id)
        REFERENCES facultad(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_departamento_facultad_codigo
        UNIQUE (facultad_id, codigo),

    CONSTRAINT uq_departamento_facultad_nombre
        UNIQUE (facultad_id, nombre),

    CONSTRAINT chk_departamento_estado
        CHECK (estado IN (
            'ACTIVO',
            'INACTIVO'
        ))
);


-- ============================================================
-- 4. PROGRAMA ACADÉMICO
-- ============================================================

CREATE TABLE programa_academico (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    facultad_id         BIGINT NOT NULL,

    codigo_interno      VARCHAR(30) NOT NULL,
    codigo_snies        VARCHAR(20),

    nombre              VARCHAR(200) NOT NULL,

    creditos_totales    INTEGER,

    estado              VARCHAR(30) NOT NULL DEFAULT 'ACTIVO',

    fecha_creacion      DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_programa_facultad
        FOREIGN KEY (facultad_id)
        REFERENCES facultad(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_programa_facultad_codigo
        UNIQUE (facultad_id, codigo_interno),

    CONSTRAINT uq_programa_codigo_snies
        UNIQUE (codigo_snies),

    CONSTRAINT chk_programa_creditos
        CHECK (
            creditos_totales IS NULL
            OR creditos_totales > 0
        ),

    CONSTRAINT chk_programa_estado
        CHECK (estado IN (
            'ACTIVO',
            'EN_REGISTRO',
            'SUSPENDIDO',
            'INACTIVO'
        ))
);


-- ============================================================
-- 5. PERIODICIDAD ACADÉMICA
-- ============================================================
-- NO es el periodo 2026-1.
--
-- Define cómo se estructura temporalmente un programa:
--
-- SEMESTRAL
-- CUATRIMESTRAL
-- TRIMESTRAL
-- ANUAL
-- etc.
-- ============================================================

CREATE TABLE periodicidad_academica (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(80) NOT NULL,

    duracion_meses      INTEGER NOT NULL,

    CONSTRAINT uq_periodicidad_codigo
        UNIQUE (codigo),

    CONSTRAINT chk_periodicidad_duracion
        CHECK (duracion_meses > 0)
);


-- ============================================================
-- 6. PLAN DE ESTUDIOS / PENSUM
-- ============================================================
-- Representa una versión curricular de un programa.
--
-- Ejemplo:
--
-- Ingeniería de Software
--
--   Pensum 2022
--   Pensum 2026
--
-- Ambos pueden existir simultáneamente.
-- ============================================================

CREATE TABLE plan_estudios (
    id                      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    programa_id             BIGINT NOT NULL,
    periodicidad_id         BIGINT NOT NULL,

    codigo_pensum           VARCHAR(30) NOT NULL,
    nombre                  VARCHAR(150),

    numero_resolucion       VARCHAR(50),
    fecha_aprobacion        DATE,

    fecha_vigencia_desde    DATE NOT NULL,
    fecha_vigencia_hasta    DATE,

    total_creditos          INTEGER NOT NULL,

    estado                  VARCHAR(30) NOT NULL DEFAULT 'EN_DISENO',

    CONSTRAINT fk_plan_programa
        FOREIGN KEY (programa_id)
        REFERENCES programa_academico(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_plan_periodicidad
        FOREIGN KEY (periodicidad_id)
        REFERENCES periodicidad_academica(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_plan_programa_codigo
        UNIQUE (programa_id, codigo_pensum),

    CONSTRAINT chk_plan_creditos
        CHECK (total_creditos > 0),

    CONSTRAINT chk_plan_fechas
        CHECK (
            fecha_vigencia_hasta IS NULL
            OR fecha_vigencia_hasta >= fecha_vigencia_desde
        ),

    CONSTRAINT chk_plan_estado
        CHECK (estado IN (
            'EN_DISENO',
            'APROBADO',
            'VIGENTE',
            'EN_EXTINCION',
            'HISTORICO',
            'CANCELADO'
        ))
);


-- ============================================================
-- 7. NIVEL CURRICULAR
-- ============================================================
-- Sustituye completamente al concepto de "semestre".
--
-- Ejemplo:
--
-- Nivel 1
-- Nivel 2
-- Nivel 3
--
-- Puede representar:
--
-- Semestre 1
-- Cuatrimestre 1
-- Trimestre 1
--
-- según la periodicidad del plan.
-- ============================================================

CREATE TABLE nivel_curricular (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    plan_estudios_id    BIGINT NOT NULL,

    numero_nivel        INTEGER NOT NULL,

    nombre              VARCHAR(100),

    CONSTRAINT fk_nivel_plan
        FOREIGN KEY (plan_estudios_id)
        REFERENCES plan_estudios(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_nivel_plan_numero
        UNIQUE (plan_estudios_id, numero_nivel),

    CONSTRAINT uq_nivel_plan_id
        UNIQUE (plan_estudios_id, id),

    CONSTRAINT chk_nivel_numero
        CHECK (numero_nivel > 0)
);


-- ============================================================
-- 8. ASIGNATURA / COURSE CATALOG
-- ============================================================
-- La asignatura es una entidad del catálogo institucional.
--
-- NO pertenece a un programa.
--
-- Puede ser utilizada por múltiples programas.
--
-- Ejemplo:
--
-- MAT101 - Matemáticas I
--
-- puede aparecer en:
--
-- Ingeniería
-- Administración
-- Economía
-- etc.
-- ============================================================

CREATE TABLE asignatura (
    id                      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    departamento_id         BIGINT NOT NULL,

    codigo                  VARCHAR(30) NOT NULL,
    nombre                  VARCHAR(200) NOT NULL,

    descripcion             TEXT,

    estado                  VARCHAR(30) NOT NULL DEFAULT 'ACTIVA',

    fecha_creacion          DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_asignatura_departamento
        FOREIGN KEY (departamento_id)
        REFERENCES departamento_academico(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_asignatura_departamento_codigo
        UNIQUE (departamento_id, codigo),

    CONSTRAINT chk_asignatura_estado
        CHECK (estado IN (
            'ACTIVA',
            'INACTIVA',
            'HISTORICA'
        ))
);


-- ============================================================
-- 9. NATURALEZA / TIPO FORMATIVO DE ASIGNATURA
-- ============================================================

CREATE TABLE naturaleza_asignatura (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(100) NOT NULL,

    descripcion         VARCHAR(255),

    CONSTRAINT uq_naturaleza_codigo
        UNIQUE (codigo)
);


-- ============================================================
-- 10. NATURALEZA DE LA ASIGNATURA
-- ============================================================
-- Relación N:N.
--
-- Una asignatura puede ser:
--
-- TEORICA
-- PRACTICA
-- TEORICO_PRACTICA
--
-- Se deja como relación para no limitar el modelo.
-- ============================================================

CREATE TABLE asignatura_naturaleza (
    asignatura_id       BIGINT NOT NULL,
    naturaleza_id       BIGINT NOT NULL,

    PRIMARY KEY (
        asignatura_id,
        naturaleza_id
    ),

    CONSTRAINT fk_asignatura_naturaleza_asignatura
        FOREIGN KEY (asignatura_id)
        REFERENCES asignatura(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_asignatura_naturaleza_naturaleza
        FOREIGN KEY (naturaleza_id)
        REFERENCES naturaleza_asignatura(id)
        ON DELETE RESTRICT
);


-- ============================================================
-- 11. TIPO DE ASIGNATURA DENTRO DEL PLAN
-- ============================================================

CREATE TABLE tipo_asignatura_plan (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    codigo              VARCHAR(40) NOT NULL,
    nombre              VARCHAR(100) NOT NULL,

    CONSTRAINT uq_tipo_asignatura_codigo
        UNIQUE (codigo)
);


-- ============================================================
-- 12. ASIGNATURA DENTRO DEL PLAN
-- ============================================================
-- Esta es una de las tablas MÁS importantes.
--
-- Aquí se define:
--
-- "¿Cómo participa esta asignatura en este pensum?"
--
-- La misma asignatura puede tener configuraciones diferentes
-- en distintos planes.
-- ============================================================

CREATE TABLE plan_asignatura (
    id                              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    plan_estudios_id                BIGINT NOT NULL,

    asignatura_id                   BIGINT NOT NULL,

    nivel_curricular_id             BIGINT NOT NULL,

    tipo_asignatura_id              BIGINT NOT NULL,

    creditos                        NUMERIC(5,2) NOT NULL,

    horas_docencia_semanales        NUMERIC(5,2) NOT NULL DEFAULT 0,

    horas_trabajo_independiente     NUMERIC(5,2) NOT NULL DEFAULT 0,

    es_habilitable                  BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_plan_asignatura_plan
        FOREIGN KEY (plan_estudios_id)
        REFERENCES plan_estudios(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_plan_asignatura_asignatura
        FOREIGN KEY (asignatura_id)
        REFERENCES asignatura(id)
        ON DELETE RESTRICT,

    -- Esta FK compuesta es MUY importante.
    --
    -- Garantiza que el nivel pertenece al mismo plan.
    CONSTRAINT fk_plan_asignatura_nivel
        FOREIGN KEY (
            plan_estudios_id,
            nivel_curricular_id
        )
        REFERENCES nivel_curricular (
            plan_estudios_id,
            id
        )
        ON DELETE RESTRICT,

    CONSTRAINT fk_plan_asignatura_tipo
        FOREIGN KEY (tipo_asignatura_id)
        REFERENCES tipo_asignatura_plan(id)
        ON DELETE RESTRICT,

    -- Permite que otras tablas puedan referenciar
    -- explícitamente plan + asignatura.
    CONSTRAINT uq_plan_asignatura_plan_id
        UNIQUE (
            plan_estudios_id,
            id
        ),

    -- Una asignatura no aparece dos veces dentro
    -- del mismo pensum.
    CONSTRAINT uq_plan_asignatura
        UNIQUE (
            plan_estudios_id,
            asignatura_id
        ),

    CONSTRAINT chk_plan_asignatura_creditos
        CHECK (creditos > 0),

    CONSTRAINT chk_horas_docencia
        CHECK (horas_docencia_semanales >= 0),

    CONSTRAINT chk_horas_independiente
        CHECK (horas_trabajo_independiente >= 0)
);


-- ============================================================
-- 13. TIPO DE REQUISITO
-- ============================================================

CREATE TABLE tipo_requisito (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(100) NOT NULL,

    CONSTRAINT uq_tipo_requisito_codigo
        UNIQUE (codigo)
);


-- ============================================================
-- 14. REQUISITOS DE ASIGNATURAS
-- ============================================================
-- Ejemplo:
--
-- Programación II
--     requiere Programación I
--
-- Matemáticas III
--     requiere Matemáticas II
--
-- IMPORTANTE:
-- Las dos asignaturas deben pertenecer al MISMO PLAN.
-- ============================================================

CREATE TABLE requisito_plan_asignatura (
    id                              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    plan_estudios_id                BIGINT NOT NULL,

    plan_asignatura_id              BIGINT NOT NULL,

    plan_asignatura_requerida_id    BIGINT NOT NULL,

    tipo_requisito_id               BIGINT NOT NULL,

    CONSTRAINT fk_requisito_plan
        FOREIGN KEY (plan_estudios_id)
        REFERENCES plan_estudios(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_requisito_asignatura
        FOREIGN KEY (
            plan_estudios_id,
            plan_asignatura_id
        )
        REFERENCES plan_asignatura (
            plan_estudios_id,
            id
        )
        ON DELETE CASCADE,

    CONSTRAINT fk_requisito_asignatura_requerida
        FOREIGN KEY (
            plan_estudios_id,
            plan_asignatura_requerida_id
        )
        REFERENCES plan_asignatura (
            plan_estudios_id,
            id
        )
        ON DELETE CASCADE,

    CONSTRAINT fk_requisito_tipo
        FOREIGN KEY (tipo_requisito_id)
        REFERENCES tipo_requisito(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_requisito
        UNIQUE (
            plan_asignatura_id,
            plan_asignatura_requerida_id,
            tipo_requisito_id
        ),

    CONSTRAINT chk_requisito_no_self
        CHECK (
            plan_asignatura_id <>
            plan_asignatura_requerida_id
        )
);
```

> A partir de aquí (periodo_academico real, sesión, oferta, sección, horarios, espacios, docentes) el esquema de AcademiCORE ya cubre la **Programación Académica** (módulo 2), fuera del alcance de la Etapa 1. Se deja fuera de este documento a propósito; ver la sección 8 para el orden de módulos. Si quieres el DDL completo de esas tablas también, dímelo y lo agrego.

`estudiante.plan_estudios_id` (referenciando `plan_estudios.id`, y en la práctica probablemente a `plan_asignatura` para la ruta de graduación) se agrega cuando construyas el módulo de Estudiantes/Admisiones — no hace falta en esta etapa, pero el diseño ya lo deja listo.

### Diferencias clave frente al borrador anterior de este plan

| Antes (borrador) | Ahora (esquema real) | Por qué importa |
|---|---|---|
| `asignatura` colgaba directo de `periodo_academico`, y `periodo_academico` era la estructura del pensum (semestre 1, 2, 3...) | `nivel_curricular` es la estructura del pensum (sustituye a "semestre"); `periodo_academico` pasa a ser el periodo real en el tiempo (2026-1, 2026-2), parte del módulo de Programación Académica, no del pensum | Antes el nombre `periodo_academico` se usaba para dos cosas distintas a la vez (estructura curricular y tiempo calendario). El esquema real las separa. |
| `asignatura` tenía `creditos`, `intensidad_horaria_*`, `tipo`, `naturaleza_id`, `es_habilitable` y vivía dentro de un período/pensum específico | `asignatura` es catálogo institucional puro (código, nombre, departamento dueño); todo lo que antes estaba en la fila de la asignatura (créditos, horas, tipo, es_habilitable, nivel) ahora vive en `plan_asignatura` | Esto es justo lo que ya intuía el punto 2 del plan ("la asignatura no pertenece al programa, pertenece al pensum"): con `plan_asignatura` la misma asignatura de catálogo puede tener créditos/horas distintos en cada pensum sin duplicar la fila completa de la asignatura. |
| No existía `departamento_academico` | `asignatura.departamento_id` referencia `departamento_academico`, que cuelga de `facultad` | Reemplaza al viejo `programa_origen_id` de la asignatura: la unidad dueña de una asignatura es un departamento/escuela, no un programa. |
| `programa_academico.codigo_snies` era `UNIQUE NOT NULL` | `codigo_snies` es único pero **nullable**, y hay un `codigo_interno` obligatorio único por facultad | Permite crear/registrar un programa antes de tener resolución SNIES asignada (estado `EN_REGISTRO`). |
| `naturaleza_asignatura` era FK única (1:1) en `asignatura` | `asignatura_naturaleza` es tabla N:N | Una asignatura puede combinar naturalezas (ej. teórica y práctica a la vez) sin forzar una sola categoría. |
| `tipo` de la asignatura era un `VARCHAR` con CHECK fijo | `tipo_asignatura_plan` es tabla catálogo, referenciada desde `plan_asignatura.tipo_asignatura_id` | Administrable sin redeploy, y correctamente ubicado en `plan_asignatura` (el tipo es una decisión del pensum, no de la asignatura en abstracto). |
| `requisito_asignatura` apuntaba `asignatura_id → asignatura_id` directamente, con `tipo_requisito` como `VARCHAR` | `requisito_plan_asignatura` apunta `plan_asignatura_id → plan_asignatura_id` (con FK compuesta que obliga a que ambas pertenezcan al mismo `plan_estudios_id`), y `tipo_requisito` es tabla catálogo (incluye además `ANTIRREQUISITO`) | Antes nada impedía a nivel de base de datos que un requisito cruzara asignaturas de dos pensums distintos; ahora la FK compuesta lo hace imposible. |
| `plan_estudios.numero_periodos` como columna | No existe esa columna; el número de niveles se deriva de contar filas en `nivel_curricular` | Evita que dos datos (el contador declarado y los niveles reales creados) se desincronicen. |
| Sin `chk_*` explícitos en casi ninguna tabla | Casi todas las tablas reales tienen `CHECK` de estado/fechas/valores > 0 | Blinda las reglas de negocio (fechas de vigencia, créditos > 0, estados válidos) directamente en el motor, no solo en el `application layer`. |

---

## 6. Plan de implementación — fases concretas

### Fase 0 — Bootstrap del proyecto (0.5–1 día)
1. Generar el proyecto con Spring Initializr: `spring-boot-starter-web`, `spring-boot-starter-data-jpa`, `spring-boot-starter-validation`, `postgresql` (driver, para desarrollo local — Oracle 12c queda para el adaptador legado en etapas posteriores), `flyway-core`, `lombok`, `springdoc-openapi-starter-webmvc-ui`.
2. Configurar `docker-compose.yml` con Postgres para desarrollo local (evitas depender de Oracle 12c desde el día 1; el adaptador Oracle se conecta cuando integres el historial académico).
3. Configurar Flyway con las migraciones del esquema del punto 5.
4. Estructura de paquetes según el punto 4.

### Fase 1 — Dominio y casos de uso (2–3 días)
1. Modelar las clases de dominio puras (`ProgramaAcademico`, `PlanEstudios`, `NivelCurricular`, `Asignatura`, `PlanAsignatura`, `RequisitoPlanAsignatura`) — sin anotaciones JPA.
2. Definir los puertos (interfaces) de repositorio en `domain/repository`.
3. Implementar los casos de uso principales de esta etapa:
   - `CrearUniversidadUseCase`
   - `CrearFacultadUseCase`
   - `CrearDepartamentoAcademicoUseCase`
   - `CrearProgramaAcademicoUseCase`
   - `RegistrarAsignaturaUseCase` (alta en el catálogo institucional, independiente de cualquier pensum)
   - `RegistrarNaturalezaAsignaturaUseCase` (alta del catálogo — usualmente se siembra una sola vez con datos iniciales vía migración, no por API en el día a día)
   - `CrearPlanEstudiosUseCase` (valida que no haya dos pensums `VIGENTE` que se solapen mal, valida suma de créditos, etc.)
   - `AgregarNivelCurricularUseCase` / `AgregarAsignaturaAPlanUseCase` (crea la fila en `plan_asignatura`, vinculando catálogo + pensum + nivel)
   - `DefinirRequisitoUseCase` (valida que el prerrequisito exista en un nivel curricular anterior o igual del mismo pensum — regla de integridad crítica, reforzada por la FK compuesta de `requisito_plan_asignatura`)
   - `ConsultarPensumVigentePorProgramaUseCase`
   - `ConsultarMallaCompletaUseCase` (devuelve el pensum completo por niveles curriculares, tal como se ve en la imagen que compartiste)

### Fase 2 — Persistencia (2 días)
1. Entidades JPA en `infrastructure/persistence/entity`.
2. Repositorios Spring Data JPA que implementan los puertos del dominio.
3. Mappers (puedes usar MapStruct) entre entidad JPA y modelo de dominio.
4. Tests de integración con Testcontainers (Postgres real, no H2, para detectar problemas de tipos/constraints reales).

### Fase 3 — API REST (1–2 días)
Endpoints mínimos de esta etapa:

```
POST   /api/v1/universidades                       Crear universidad
GET    /api/v1/universidades                        Listar universidades
GET    /api/v1/universidades/{codigo}                Consultar universidad

POST   /api/v1/facultades                          Crear facultad
GET    /api/v1/facultades?universidadId={id}       Listar facultades de una universidad
GET    /api/v1/facultades/{id}                      Consultar facultad

POST   /api/v1/departamentos                       Crear departamento académico
GET    /api/v1/departamentos?facultadId={id}       Listar departamentos de una facultad

POST   /api/v1/asignaturas                         Registrar asignatura en el catálogo institucional
GET    /api/v1/asignaturas?departamentoId={id}     Listar asignaturas del catálogo de un departamento

POST   /api/v1/programas                          Crear programa académico
GET    /api/v1/programas/{codigoInterno}           Consultar programa

POST   /api/v1/pensums                             Crear un pensum (estado EN_DISENO)
PATCH  /api/v1/pensums/{id}/estado                 Cambiar estado (aprobar, activar, poner en extinción)
GET    /api/v1/pensums/{id}                        Detalle de un pensum
GET    /api/v1/pensums?programaId={id}&estado=VIGENTE   Listar pensums de un programa

POST   /api/v1/pensums/{id}/niveles                       Agregar un nivel curricular al pensum
POST   /api/v1/pensums/{id}/niveles/{n}/asignaturas        Vincular una asignatura del catálogo a ese nivel (crea plan_asignatura)
POST   /api/v1/pensums/{id}/plan-asignaturas/{id}/requisitos   Definir prerrequisito/correquisito/antirrequisito contra otra asignatura del MISMO pensum (se puede llamar varias veces para agregar varios)

GET    /api/v1/catalogos/naturaleza-asignatura     Listar valores disponibles (teórica, práctica, teórico-práctica, ...)
GET    /api/v1/catalogos/tipo-asignatura-plan       Listar valores disponibles (obligatoria, electiva, ...)
GET    /api/v1/catalogos/tipo-requisito             Listar valores disponibles (prerrequisito, correquisito, antirrequisito)

GET    /api/v1/pensums/{id}/malla                  La malla curricular completa por niveles curriculares
GET    /api/v1/estudiantes/{codigo}/pensum          El pensum específico que le corresponde a ESE estudiante
```

Nota sobre el último endpoint: es el que resuelve el problema central — cuando construyas matrícula/historia académica, siempre resolverás "el pensum del estudiante", nunca "el pensum del programa", precisamente porque puede haber varios activos.

### Fase 4 — Validaciones de negocio importantes
- Al crear un pensum nuevo con estado `VIGENTE`, el sistema **no** debe cerrar automáticamente los anteriores — deben quedar en `EN_EXTINCION` explícitamente (decisión de negocio del Comité Curricular, no del sistema).
- Suma de créditos por período académico y total del pensum debe cuadrar contra lo declarado (como en tu imagen, donde se ve el acumulado de créditos por bloque de períodos académicos).
- Un prerrequisito solo puede apuntar a una asignatura de un período académico **igual o anterior** dentro del **mismo pensum**.
- No permitir borrar/editar un pensum que ya tiene estudiantes matriculados bajo él (solo se puede poner en extinción).

### Fase 5 — Caché (cuando llegues a la etapa de matrícula/programación)
El manual pide Redis para la oferta académica en épocas de matrícula masiva. Para el módulo de Pensum en sí no es crítico todavía (se consulta con mucha menor frecuencia que la oferta de grupos), pero puedes dejar el puerto (`PlanEstudiosCachePort`) definido desde ya en el dominio para no tener que retocar los casos de uso después.

---

## 7. Ejemplo de clase de dominio (para que veas el estilo esperado)

```java
package com.academicore.pensum.domain.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class PlanEstudios {

    private Long id;
    private ProgramaAcademico programa;
    private String codigoPensum;
    private String nombreReforma;
    private EstadoPensum estado;
    private LocalDate fechaVigenciaDesde;
    private LocalDate fechaVigenciaHasta;
    private int totalCreditos;
    private final List<NivelCurricular> nivelesCurriculares = new ArrayList<>();

    public void activar() {
        if (this.estado != EstadoPensum.APROBADO) {
            throw new IllegalStateException(
                "Solo un pensum APROBADO puede pasar a VIGENTE. Estado actual: " + this.estado);
        }
        this.estado = EstadoPensum.VIGENTE;
        this.fechaVigenciaDesde = LocalDate.now();
    }

    public void ponerEnExtincion() {
        if (this.estado != EstadoPensum.VIGENTE) {
            throw new IllegalStateException("Solo un pensum VIGENTE puede pasar a EN_EXTINCION.");
        }
        this.estado = EstadoPensum.EN_EXTINCION;
    }

    public boolean admiteNuevosEstudiantes() {
        return this.estado == EstadoPensum.VIGENTE;
    }

    public int calcularCreditosTotales() {
        return nivelesCurriculares.stream()
                .flatMap(n -> n.getPlanAsignaturas().stream())
                .mapToInt(PlanAsignatura::getCreditos)  // creditos vive en PlanAsignatura, no en Asignatura
                .sum();
    }

    // getters/setters omitidos
}
```

---

## 8. Siguientes módulos (para que tengas el mapa completo, pero no los ataques todavía)

Una vez el Pensum esté sólido, el orden natural según las dependencias del manual es:

1. **Programación Académica** (CU-001, CU-002, CU-003) — depende 100% del pensum.
2. **Admisiones / Estudiantes** — para poder asignar `plan_estudios_id` a cada estudiante.
3. **Matrícula Autónoma** (CU-011) — el módulo de alta concurrencia, ahí sí entra Redis en serio.
4. **Historia Académica** (CU-016) — ahí es donde entra el adaptador contra Oracle 12c heredado.

---

## 9. Checklist de arranque inmediato

- [ ] `spring init` con las dependencias mencionadas
- [ ] `docker-compose up` con Postgres
- [ ] Primera migración Flyway con el esquema del punto 5
- [ ] Clases de dominio del punto 3 (sin JPA)
- [ ] Casos de uso: crear departamento → registrar asignatura en catálogo → crear programa → crear pensum → agregar niveles curriculares → vincular asignaturas al pensum (`plan_asignatura`) → definir requisitos → consultar malla
- [ ] Controladores REST + Swagger/OpenAPI expuesto en `/swagger-ui.html`
- [ ] Tests: al menos el caso de uso de "prerrequisito debe existir en nivel curricular anterior o igual, dentro del mismo pensum" y "no se puede activar un pensum que no está aprobado"
