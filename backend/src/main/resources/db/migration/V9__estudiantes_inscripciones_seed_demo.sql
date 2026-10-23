-- ============================================================
-- V9 — Estudiantes, inscripciones por grupo y datos de prueba
-- - estudiante: quien responde la encuesta (deja de ser anónima)
-- - inscripcion_evaluacion: el grupo de la evaluación
-- - encuesta_evaluacion.estudiante_id: vínculo estudiante→encuesta
-- - seed: facultad/departamento/asignaturas, +3 docentes,
--   5 evaluaciones (grupos de 20/25/30) y 50 estudiantes inscritos
-- ============================================================

CREATE TABLE estudiante (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero_documento    VARCHAR(30) NOT NULL,
    nombres             VARCHAR(150) NOT NULL,
    apellidos           VARCHAR(150) NOT NULL,
    email               VARCHAR(150),
    estado              VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    CONSTRAINT uq_estudiante_documento UNIQUE (numero_documento),
    CONSTRAINT chk_estudiante_estado
        CHECK (estado IN ('ACTIVO', 'INACTIVO'))
);

CREATE TABLE inscripcion_evaluacion (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    evaluacion_id       BIGINT NOT NULL,
    estudiante_id       BIGINT NOT NULL,
    fecha_inscripcion   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_inscripcion_evaluacion
        FOREIGN KEY (evaluacion_id) REFERENCES evaluacion_docente(id) ON DELETE CASCADE,
    CONSTRAINT fk_inscripcion_estudiante
        FOREIGN KEY (estudiante_id) REFERENCES estudiante(id) ON DELETE CASCADE,
    CONSTRAINT uq_inscripcion_evaluacion_estudiante
        UNIQUE (evaluacion_id, estudiante_id)
);

ALTER TABLE encuesta_evaluacion
    ADD COLUMN estudiante_id BIGINT,
    ADD CONSTRAINT fk_encuesta_estudiante
        FOREIGN KEY (estudiante_id) REFERENCES estudiante(id) ON DELETE RESTRICT,
    ADD CONSTRAINT uq_encuesta_evaluacion_estudiante
        UNIQUE (evaluacion_id, estudiante_id);

-- ============================================================
-- Catálogo académico mínimo: facultad → departamento → asignaturas
-- ============================================================

INSERT INTO facultad (universidad_id, codigo, nombre) VALUES
    (1, 'FI', 'Facultad de Ingeniería')
ON CONFLICT DO NOTHING;

INSERT INTO departamento_academico (facultad_id, codigo, nombre) VALUES
    ((SELECT id FROM facultad WHERE codigo = 'FI'), 'DCC', 'Departamento de Ciencias de la Computación')
ON CONFLICT DO NOTHING;

INSERT INTO asignatura (departamento_id, codigo, nombre, descripcion) VALUES
    ((SELECT id FROM departamento_academico WHERE codigo = 'DCC'), 'EP1303',
     'Interacción Humano Computador', 'Diseño de interfaces y usabilidad'),
    ((SELECT id FROM departamento_academico WHERE codigo = 'DCC'), '2222123',
     'Electiva Software Libre', 'Herramientas y cultura del software libre'),
    ((SELECT id FROM departamento_academico WHERE codigo = 'DCC'), 'EP1102',
     'Programación II', 'Programación orientada a objetos en Java'),
    ((SELECT id FROM departamento_academico WHERE codigo = 'DCC'), 'EP2201',
     'Bases de Datos', 'Modelado, SQL y normalización'),
    ((SELECT id FROM departamento_academico WHERE codigo = 'DCC'), 'EP1301',
     'Ingeniería de Software I', 'Procesos, requisitos y modelos de ciclo de vida'),
    ((SELECT id FROM departamento_academico WHERE codigo = 'DCC'), 'EP2103',
     'Redes de Computadores', 'Modelo OSI, TCP/IP y configuración de redes')
ON CONFLICT DO NOTHING;

-- ============================================================
-- Docentes de prueba (además de Chanchí)
-- ============================================================

INSERT INTO docente (numero_documento, nombres, apellidos, email) VALUES
    ('72104567', 'MARIA FERNANDA', 'RUIZ CASTRO', 'mruiz@unicartagena.edu.co'),
    ('73098812', 'CARLOS ALBERTO', 'MENDOZA SIERRA', 'cmendoza@unicartagena.edu.co'),
    ('10304566', 'LUIS EDUARDO', 'PATERNINA CUELLO', 'lpaternina@unicartagena.edu.co')
ON CONFLICT (numero_documento) DO NOTHING;

-- ============================================================
-- Evaluaciones 2025-1: grupos de 20, 25 y 30 estudiantes
-- ============================================================

INSERT INTO evaluacion_docente (docente_id, asignatura_id, grupo, periodo, estudiantes_esperados) VALUES
    ((SELECT id FROM docente WHERE numero_documento = '10301274'),
     (SELECT id FROM asignatura WHERE codigo = 'EP1303'), 'A1', '2025-1', 20),
    ((SELECT id FROM docente WHERE numero_documento = '10301274'),
     (SELECT id FROM asignatura WHERE codigo = '2222123'), 'A1', '2025-1', 25),
    ((SELECT id FROM docente WHERE numero_documento = '72104567'),
     (SELECT id FROM asignatura WHERE codigo = 'EP2201'), 'B1', '2025-1', 30),
    ((SELECT id FROM docente WHERE numero_documento = '73098812'),
     (SELECT id FROM asignatura WHERE codigo = 'EP1102'), 'A2', '2025-1', 25),
    ((SELECT id FROM docente WHERE numero_documento = '10304566'),
     (SELECT id FROM asignatura WHERE codigo = 'EP2103'), 'A1', '2025-1', 20)
ON CONFLICT (docente_id, asignatura_id, grupo, periodo) DO NOTHING;

-- ============================================================
-- 50 estudiantes de prueba
-- ============================================================

WITH pool AS (
    SELECT
        ARRAY['JUAN CAMILO','MARIA JOSE','ANDRES FELIPE','LAURA VALENTINA','CARLOS ANDRES',
              'ANA MARIA','LUIS MIGUEL','CAMILA','DIEGO ALEJANDRO','VALENTINA',
              'SEBASTIAN','ISABELLA','MATEO','SOFIA','NICOLAS',
              'MARIA FERNANDA','SANTIAGO','GABRIELA','DANIEL','PAULA',
              'KEVIN','MANUELA','ESTEBAN','JULIANA','OSCAR'] AS n,
        ARRAY['PEREZ GOMEZ','RODRIGUEZ LOPEZ','MARTINEZ DIAZ','GARCIA HERNANDEZ','LOPEZ SANCHEZ',
              'GONZALEZ RAMIREZ','HERNANDEZ TORRES','DIAZ CASTRO','RAMIREZ VARGAS','CASTRO ORTIZ',
              'TORRES MORENO','VARGAS CORTES','ORTIZ SUAREZ','CORTES ACOSTA','SUAREZ MEJIA',
              'MORENO ROJAS','ACOSTA PALACIOS','ROJAS QUINTERO','MEJIA ARANGO','QUINTERO SOTO'] AS a
)
INSERT INTO estudiante (numero_documento, nombres, apellidos, email)
SELECT
    '10' || lpad(gs::text, 6, '0'),
    pool.n[1 + (gs % 25)],
    pool.a[1 + (gs % 20)] || ' ' || split_part(pool.a[1 + ((gs * 7) % 20)], ' ', 1),
    lower(replace(
        split_part(pool.n[1 + (gs % 25)], ' ', 1) || '.' ||
        split_part(pool.a[1 + (gs % 20)], ' ', 1) || gs || '@estudiante.unicartagena.edu.co',
        ' ', ''))
FROM generate_series(1, 50) gs, pool
ON CONFLICT (numero_documento) DO NOTHING;

-- ============================================================
-- Inscripciones: cada grupo recibe su cupo tomando bloques
-- desplazados de la lista de estudiantes (traslape realista)
-- ============================================================

-- EP1303 A1 (Chanchí): 20 estudiantes — bloque 1-20
INSERT INTO inscripcion_evaluacion (evaluacion_id, estudiante_id)
SELECT ev.id, e.id
FROM evaluacion_docente ev,
     (SELECT id, row_number() OVER (ORDER BY numero_documento) rn FROM estudiante) e
WHERE ev.grupo = 'A1' AND ev.periodo = '2025-1'
  AND ev.asignatura_id = (SELECT id FROM asignatura WHERE codigo = 'EP1303')
  AND e.rn BETWEEN 1 AND 20
ON CONFLICT DO NOTHING;

-- 2222123 A1 (Chanchí): 25 estudiantes — bloque 15-39 (traslape)
INSERT INTO inscripcion_evaluacion (evaluacion_id, estudiante_id)
SELECT ev.id, e.id
FROM evaluacion_docente ev,
     (SELECT id, row_number() OVER (ORDER BY numero_documento) rn FROM estudiante) e
WHERE ev.grupo = 'A1' AND ev.periodo = '2025-1'
  AND ev.asignatura_id = (SELECT id FROM asignatura WHERE codigo = '2222123')
  AND e.rn BETWEEN 15 AND 39
ON CONFLICT DO NOTHING;

-- EP2201 B1 (Prof. Ruiz): 30 estudiantes — bloque 21-50
INSERT INTO inscripcion_evaluacion (evaluacion_id, estudiante_id)
SELECT ev.id, e.id
FROM evaluacion_docente ev,
     (SELECT id, row_number() OVER (ORDER BY numero_documento) rn FROM estudiante) e
WHERE ev.grupo = 'B1' AND ev.periodo = '2025-1'
  AND ev.asignatura_id = (SELECT id FROM asignatura WHERE codigo = 'EP2201')
  AND e.rn BETWEEN 21 AND 50
ON CONFLICT DO NOTHING;

-- EP1102 A2 (Prof. Mendoza): 25 estudiantes — bloque 5-29 (traslape)
INSERT INTO inscripcion_evaluacion (evaluacion_id, estudiante_id)
SELECT ev.id, e.id
FROM evaluacion_docente ev,
     (SELECT id, row_number() OVER (ORDER BY numero_documento) rn FROM estudiante) e
WHERE ev.grupo = 'A2' AND ev.periodo = '2025-1'
  AND ev.asignatura_id = (SELECT id FROM asignatura WHERE codigo = 'EP1102')
  AND e.rn BETWEEN 5 AND 29
ON CONFLICT DO NOTHING;

-- EP2103 A1 (Prof. Paternina): 20 estudiantes — bloque 31-50
INSERT INTO inscripcion_evaluacion (evaluacion_id, estudiante_id)
SELECT ev.id, e.id
FROM evaluacion_docente ev,
     (SELECT id, row_number() OVER (ORDER BY numero_documento) rn FROM estudiante) e
WHERE ev.grupo = 'A1' AND ev.periodo = '2025-1'
  AND ev.asignatura_id = (SELECT id FROM asignatura WHERE codigo = 'EP2103')
  AND e.rn BETWEEN 31 AND 50
ON CONFLICT DO NOTHING;
