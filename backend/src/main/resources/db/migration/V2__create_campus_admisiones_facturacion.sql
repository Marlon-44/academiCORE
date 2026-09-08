-- ============================================================
-- V2 — Campus, Admisiones y Facturación (sin pasarelas de pago)
-- Etapa 2 del plan de implementación
-- ============================================================

-- ============================================================
-- Catálogos base (van primero por las FK)
-- ============================================================

CREATE TABLE moneda (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_iso          VARCHAR(3) NOT NULL,
    nombre              VARCHAR(50) NOT NULL,
    simbolo             VARCHAR(5) NOT NULL,
    CONSTRAINT uq_moneda_codigo_iso UNIQUE (codigo_iso)
);

INSERT INTO moneda (codigo_iso, nombre, simbolo) VALUES
    ('COP', 'Peso colombiano', '$'),
    ('USD', 'Dólar estadounidense', 'US$');


CREATE TABLE concepto_pago (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(100) NOT NULL,
    CONSTRAINT uq_concepto_pago_codigo UNIQUE (codigo)
);

INSERT INTO concepto_pago (codigo, nombre) VALUES
    ('INSCRIPCION', 'Derecho de inscripción'),
    ('MATRICULA', 'Derecho de matrícula'),
    ('DERECHOS_GRADO', 'Derechos de grado');


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
        FOREIGN KEY (universidad_id) REFERENCES universidad(id) ON DELETE RESTRICT,
    CONSTRAINT uq_campus_universidad_codigo
        UNIQUE (universidad_id, codigo),
    CONSTRAINT chk_campus_estado
        CHECK (estado IN ('ACTIVO', 'INACTIVO'))
);


CREATE TABLE programa_campus (
    programa_id         BIGINT NOT NULL,
    campus_id           BIGINT NOT NULL,
    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    PRIMARY KEY (programa_id, campus_id),
    CONSTRAINT fk_progcampus_programa
        FOREIGN KEY (programa_id) REFERENCES programa_academico(id) ON DELETE CASCADE,
    CONSTRAINT fk_progcampus_campus
        FOREIGN KEY (campus_id) REFERENCES campus(id) ON DELETE CASCADE
);


CREATE TABLE categoria_imagen_campus (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(80) NOT NULL,
    CONSTRAINT uq_categoria_imagen_codigo UNIQUE (codigo)
);

INSERT INTO categoria_imagen_campus (codigo, nombre) VALUES
    ('FACHADA_SEDE', 'Fachada de la sede'),
    ('ZONA_COMIDAS', 'Zona de comidas'),
    ('LABORATORIO', 'Laboratorios'),
    ('SALON', 'Salones'),
    ('ZONA_BIENESTAR', 'Zona de bienestar'),
    ('OTRO', 'Otro');


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


-- ============================================================
-- 2. PERIODO DE ADMISIÓN Y OFERTA
-- ============================================================

CREATE TABLE periodo_admision (
    id                          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo                      VARCHAR(20) NOT NULL,
    nombre                      VARCHAR(100) NOT NULL,
    fecha_inicio_inscripciones  DATE NOT NULL,
    fecha_fin_inscripciones     DATE NOT NULL,
    fecha_inicio_clases         DATE,
    estado                      VARCHAR(20) NOT NULL DEFAULT 'PROGRAMADO',
    CONSTRAINT uq_periodo_admision_codigo UNIQUE (codigo),
    CONSTRAINT chk_periodo_admision_fechas
        CHECK (fecha_fin_inscripciones >= fecha_inicio_inscripciones),
    CONSTRAINT chk_periodo_admision_estado
        CHECK (estado IN ('PROGRAMADO', 'ABIERTO', 'CERRADO'))
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
    CONSTRAINT fk_oferta_periodo
        FOREIGN KEY (periodo_admision_id) REFERENCES periodo_admision(id) ON DELETE RESTRICT,
    CONSTRAINT fk_oferta_programa
        FOREIGN KEY (programa_id) REFERENCES programa_academico(id) ON DELETE RESTRICT,
    CONSTRAINT fk_oferta_pensum
        FOREIGN KEY (plan_estudios_id) REFERENCES plan_estudios(id) ON DELETE RESTRICT,
    CONSTRAINT fk_oferta_campus
        FOREIGN KEY (campus_id) REFERENCES campus(id) ON DELETE RESTRICT,
    CONSTRAINT fk_oferta_moneda
        FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON DELETE RESTRICT,
    CONSTRAINT uq_oferta_periodo_programa_campus
        UNIQUE (periodo_admision_id, programa_id, campus_id),
    CONSTRAINT chk_oferta_cupos
        CHECK (cupos_disponibles >= 0 AND cupos_disponibles <= cupos_totales),
    CONSTRAINT chk_oferta_estado
        CHECK (estado IN ('ACTIVA', 'AGOTADA', 'CERRADA'))
);


-- ============================================================
-- 3. ASPIRANTES E INSCRIPCIONES
-- ============================================================

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
    CONSTRAINT uq_aspirante_documento
        UNIQUE (tipo_documento, numero_documento),
    CONSTRAINT chk_aspirante_estado
        CHECK (estado IN ('REGISTRADO', 'VERIFICADO', 'BLOQUEADO'))
);


CREATE TABLE inscripcion (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    aspirante_id        BIGINT NOT NULL,
    oferta_admision_id  BIGINT NOT NULL,
    fecha_inscripcion   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado              VARCHAR(30) NOT NULL DEFAULT 'PENDIENTE_PAGO',
    observaciones       TEXT,
    CONSTRAINT fk_inscripcion_aspirante
        FOREIGN KEY (aspirante_id) REFERENCES aspirante(id) ON DELETE RESTRICT,
    CONSTRAINT fk_inscripcion_oferta
        FOREIGN KEY (oferta_admision_id) REFERENCES oferta_admision(id) ON DELETE RESTRICT,
    CONSTRAINT uq_inscripcion_aspirante_oferta
        UNIQUE (aspirante_id, oferta_admision_id),
    CONSTRAINT chk_inscripcion_estado
        CHECK (estado IN ('PENDIENTE_PAGO', 'EN_REVISION', 'ADMITIDO', 'RECHAZADO', 'MATRICULADO'))
);


CREATE TABLE documento_aspirante (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    inscripcion_id      BIGINT NOT NULL,
    tipo_documento      VARCHAR(50) NOT NULL,
    url                 VARCHAR(500) NOT NULL,
    fecha_carga         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado              VARCHAR(20) NOT NULL DEFAULT 'CARGADO',
    CONSTRAINT fk_documento_inscripcion
        FOREIGN KEY (inscripcion_id) REFERENCES inscripcion(id) ON DELETE CASCADE,
    CONSTRAINT chk_documento_estado
        CHECK (estado IN ('CARGADO', 'VALIDADO', 'RECHAZADO'))
);


-- ============================================================
-- 4. FACTURACIÓN (sin tablas de pasarela ni pago)
-- ============================================================

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
    CONSTRAINT fk_factura_inscripcion
        FOREIGN KEY (inscripcion_id) REFERENCES inscripcion(id) ON DELETE RESTRICT,
    CONSTRAINT fk_factura_concepto
        FOREIGN KEY (concepto_pago_id) REFERENCES concepto_pago(id) ON DELETE RESTRICT,
    CONSTRAINT fk_factura_moneda
        FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON DELETE RESTRICT,
    CONSTRAINT uq_factura_numero
        UNIQUE (numero_factura),
    CONSTRAINT chk_factura_valor
        CHECK (valor > 0),
    CONSTRAINT chk_factura_estado
        CHECK (estado IN ('PENDIENTE', 'PAGADA', 'VENCIDA', 'ANULADA'))
);
