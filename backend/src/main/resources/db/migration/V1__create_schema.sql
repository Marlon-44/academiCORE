-- ============================================================
-- V1 — Esquema del módulo de Plan de Estudios (Pensum)
-- Transcripción exacta del esquema validado de AcademiCORE
-- ============================================================

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
-- 10. NATURALEZA DE LA ASIGNATURA (N:N)
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

    CONSTRAINT uq_plan_asignatura_plan_id
        UNIQUE (
            plan_estudios_id,
            id
        ),

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


-- ============================================================
-- V2 — Datos semilla de catálogos
-- ============================================================

INSERT INTO periodicidad_academica (codigo, nombre, duracion_meses) VALUES
    ('SEMESTRAL', 'Semestral', 6),
    ('CUATRIMESTRAL', 'Cuatrimestral', 4),
    ('TRIMESTRAL', 'Trimestral', 3),
    ('ANUAL', 'Anual', 12);

INSERT INTO naturaleza_asignatura (codigo, nombre, descripcion) VALUES
    ('TEORICA', 'Teórica', 'Asignatura de carácter teórico'),
    ('PRACTICA', 'Práctica', 'Asignatura de carácter práctico'),
    ('TEORICO_PRACTICA', 'Teórico-Práctica', 'Asignatura con componente teórico y práctico'),
    ('VIRTUAL', 'Virtual', 'Asignatura desarrollada en modalidad virtual'),
    ('MIXTA', 'Mixta', 'Asignatura con componentes presenciales y virtuales'),
    ('LABORATORIO', 'Laboratorio', 'Asignatura de laboratorio puro');

INSERT INTO tipo_asignatura_plan (codigo, nombre) VALUES
    ('OBLIGATORIA', 'Obligatoria'),
    ('ELECTIVA', 'Electiva'),
    ('ELECTIVA_PROFUNDIZACION', 'Electiva de Profundización'),
    ('ELECTIVA_COMPLEMENTARIA', 'Electiva Complementaria');

INSERT INTO tipo_requisito (codigo, nombre) VALUES
    ('PRERREQUISITO', 'Prerrequisito'),
    ('CORREQUISITO', 'Correquisito'),
    ('ANTIRREQUISITO', 'Antirrequisito');
