-- ============================================================
-- V5 — Evaluación Docente
-- Instrumento oficial formato PVD003 (Universidad de Cartagena):
-- 15 preguntas en 3 categorías (CONCEPTUAL, PEDAGÓGICO, RELACIONES)
-- escala 1-5 y comentario con análisis de sentimiento
-- ============================================================

-- ============================================================
-- 1. DOCENTE
-- ============================================================

CREATE TABLE docente (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero_documento    VARCHAR(30) NOT NULL,
    nombres             VARCHAR(150) NOT NULL,
    apellidos           VARCHAR(150) NOT NULL,
    email               VARCHAR(150),
    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    CONSTRAINT uq_docente_documento UNIQUE (numero_documento),
    CONSTRAINT chk_docente_estado
        CHECK (estado IN ('ACTIVO', 'INACTIVO'))
);

INSERT INTO docente (numero_documento, nombres, apellidos, email) VALUES
    ('10301274', 'GABRIEL ELIAS', 'CHANCHI GOLONDRINO', NULL);


-- ============================================================
-- 2. CATEGORÍAS Y PREGUNTAS DEL INSTRUMENTO
-- ============================================================

CREATE TABLE categoria_pregunta_evaluacion (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo              VARCHAR(30) NOT NULL,
    nombre              VARCHAR(100) NOT NULL,
    orden               INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT uq_categoria_pregunta_codigo UNIQUE (codigo)
);

INSERT INTO categoria_pregunta_evaluacion (codigo, nombre, orden) VALUES
    ('CONCEPTUAL', 'Conceptual', 1),
    ('PEDAGOGICO', 'Pedagógico', 2),
    ('RELACIONES', 'Relaciones', 3);


CREATE TABLE pregunta_evaluacion (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    categoria_id        BIGINT NOT NULL,
    numero              INTEGER NOT NULL,
    texto               VARCHAR(300) NOT NULL,
    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVA',
    CONSTRAINT fk_pregunta_categoria
        FOREIGN KEY (categoria_id) REFERENCES categoria_pregunta_evaluacion(id) ON DELETE RESTRICT,
    CONSTRAINT uq_pregunta_numero UNIQUE (numero),
    CONSTRAINT chk_pregunta_estado
        CHECK (estado IN ('ACTIVA', 'INACTIVA'))
);

INSERT INTO pregunta_evaluacion (categoria_id, numero, texto) VALUES
    -- CONCEPTUAL
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'CONCEPTUAL'), 1,
     '¿El docente articula los contenidos del curso o asignatura, con otras asignaturas?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'CONCEPTUAL'), 2,
     '¿El docente cumple con el sistema de evaluación establecido en el proyecto docente?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'CONCEPTUAL'), 3,
     '¿El docente desarrolla todos los contenidos propuestos en el proyecto docente?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'CONCEPTUAL'), 4,
     '¿El docente utiliza los resultados de la evaluación, para reorientar los procesos de enseñanza-aprendizaje?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'CONCEPTUAL'), 5,
     '¿El docente utiliza parámetros para evaluar los procesos de enseñanza-aprendizaje?'),
    -- PEDAGOGICO
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'PEDAGOGICO'), 6,
     '¿El docente organiza y orienta actividades de trabajos independiente?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'PEDAGOGICO'), 7,
     '¿El docente promueve la participación de sus estudiantes?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'PEDAGOGICO'), 8,
     '¿El docente utiliza la pregunta como una estrategia para que el estudiante aprenda?'),
    -- RELACIONES
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'RELACIONES'), 9,
     '¿Cuando ha solicitado asesoria, el docente responde oportunamente a sus inquietudes?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'RELACIONES'), 10,
     '¿El docente cumple con el horario de atención a los estudiantes?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'RELACIONES'), 11,
     '¿El docente cumple y hace cumplir los reglamentos?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'RELACIONES'), 12,
     '¿El docente es puntual a la llegada a sus compromisos académicos?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'RELACIONES'), 13,
     '¿El docente es puntual en la revisión y entrega de trabajo y calificaciones?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'RELACIONES'), 14,
     '¿El docente socializa el proyecto docente al inicio de clases?'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'RELACIONES'), 15,
     '¿El docente trata con respeto a sus estudiantes?');


-- ============================================================
-- 3. EVALUACIÓN (instrumento asignado a docente+materia+grupo+periodo)
-- ============================================================

CREATE TABLE evaluacion_docente (
    id                          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    docente_id                  BIGINT NOT NULL,
    asignatura_id               BIGINT NOT NULL,
    programa_id                 BIGINT,
    grupo                       VARCHAR(10) NOT NULL DEFAULT 'A1',
    periodo                     VARCHAR(20) NOT NULL,
    estudiantes_esperados       INTEGER,
    estado                      VARCHAR(20) NOT NULL DEFAULT 'ABIERTA',
    fecha_creacion              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_evaluacion_docente
        FOREIGN KEY (docente_id) REFERENCES docente(id) ON DELETE RESTRICT,
    CONSTRAINT fk_evaluacion_asignatura
        FOREIGN KEY (asignatura_id) REFERENCES asignatura(id) ON DELETE RESTRICT,
    CONSTRAINT fk_evaluacion_programa
        FOREIGN KEY (programa_id) REFERENCES programa_academico(id) ON DELETE RESTRICT,
    CONSTRAINT uq_evaluacion_docente_materia
        UNIQUE (docente_id, asignatura_id, grupo, periodo),
    CONSTRAINT chk_evaluacion_esperados
        CHECK (estudiantes_esperados IS NULL OR estudiantes_esperados > 0),
    CONSTRAINT chk_evaluacion_estado
        CHECK (estado IN ('ABIERTA', 'CERRADA'))
);


-- ============================================================
-- 4. ENCUESTA (respuesta anónima de un estudiante)
-- ============================================================

CREATE TABLE encuesta_evaluacion (
    id                      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    evaluacion_id           BIGINT NOT NULL,
    comentario              TEXT,
    sentimiento             VARCHAR(20),
    sentimiento_score       NUMERIC(4,3),
    sentimiento_metodo      VARCHAR(20),
    fecha_respuesta         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_encuesta_evaluacion
        FOREIGN KEY (evaluacion_id) REFERENCES evaluacion_docente(id) ON DELETE CASCADE,
    CONSTRAINT chk_encuesta_sentimiento
        CHECK (sentimiento IS NULL OR sentimiento IN ('POSITIVO', 'NEGATIVO', 'NEUTRO')),
    CONSTRAINT chk_encuesta_sentimiento_metodo
        CHECK (sentimiento_metodo IS NULL OR sentimiento_metodo IN ('MODELO', 'LEXICO'))
);


CREATE TABLE respuesta_pregunta (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    encuesta_id         BIGINT NOT NULL,
    pregunta_id         BIGINT NOT NULL,
    valor               SMALLINT NOT NULL,
    CONSTRAINT fk_respuesta_encuesta
        FOREIGN KEY (encuesta_id) REFERENCES encuesta_evaluacion(id) ON DELETE CASCADE,
    CONSTRAINT fk_respuesta_pregunta
        FOREIGN KEY (pregunta_id) REFERENCES pregunta_evaluacion(id) ON DELETE RESTRICT,
    CONSTRAINT uq_respuesta_encuesta_pregunta
        UNIQUE (encuesta_id, pregunta_id),
    CONSTRAINT chk_respuesta_valor
        CHECK (valor BETWEEN 1 AND 5)
);


-- ============================================================
-- 5. SEED DEMO — evaluaciones del periodo 2025-1 de los PDFs
-- Solo se insertan si las asignaturas existen en el catálogo
-- ============================================================

INSERT INTO evaluacion_docente (docente_id, asignatura_id, grupo, periodo, estudiantes_esperados)
SELECT d.id, a.id, 'A1', '2025-1', 16
FROM docente d, asignatura a
WHERE d.numero_documento = '10301274' AND a.codigo = 'EP1303'
ON CONFLICT DO NOTHING;

INSERT INTO evaluacion_docente (docente_id, asignatura_id, grupo, periodo, estudiantes_esperados)
SELECT d.id, a.id, 'A1', '2025-1', 18
FROM docente d, asignatura a
WHERE d.numero_documento = '10301274' AND a.codigo = '2222123'
ON CONFLICT DO NOTHING;
