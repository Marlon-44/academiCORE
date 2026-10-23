-- ============================================================
-- V10 — Ficha académica estilo SIA para estudiantes y docentes
-- Estudiante: código estudiantil, identificación, sexo, contacto,
--             programa, semestre, estado académico/ingreso, pensum
-- Docente:    contacto + datos laborales (vinculación, escalafón,
--             formación, departamento, fecha de ingreso)
-- ============================================================

ALTER TABLE estudiante
    ADD COLUMN codigo            VARCHAR(20),
    ADD COLUMN sexo              VARCHAR(20),
    ADD COLUMN telefono          VARCHAR(30),
    ADD COLUMN direccion         VARCHAR(200),
    ADD COLUMN programa_id       BIGINT,
    ADD COLUMN semestre          INTEGER,
    ADD COLUMN estado_academico  VARCHAR(30) NOT NULL DEFAULT 'NORMAL',
    ADD COLUMN estado_ingreso    VARCHAR(50) NOT NULL DEFAULT 'NO ESPECIFICA',
    ADD COLUMN plan_estudios_id  BIGINT,
    ADD CONSTRAINT uq_estudiante_codigo UNIQUE (codigo),
    ADD CONSTRAINT fk_estudiante_programa
        FOREIGN KEY (programa_id) REFERENCES programa_academico(id) ON DELETE RESTRICT,
    ADD CONSTRAINT fk_estudiante_plan
        FOREIGN KEY (plan_estudios_id) REFERENCES plan_estudios(id) ON DELETE RESTRICT,
    ADD CONSTRAINT chk_estudiante_sexo
        CHECK (sexo IS NULL OR sexo IN ('MASCULINO', 'FEMENINO', 'OTRO')),
    ADD CONSTRAINT chk_estudiante_semestre
        CHECK (semestre IS NULL OR semestre BETWEEN 1 AND 16),
    ADD CONSTRAINT chk_estudiante_estado_academico
        CHECK (estado_academico IN (
            'NORMAL', 'RIESGO_ACADEMICO', 'PRUEBA_ACADEMICA',
            'SUSPENDIDO', 'EGRESADO', 'RETIRADO'));

ALTER TABLE docente
    ADD COLUMN sexo             VARCHAR(20),
    ADD COLUMN telefono         VARCHAR(30),
    ADD COLUMN direccion        VARCHAR(200),
    ADD COLUMN tipo_vinculacion VARCHAR(30),
    ADD COLUMN escalafon        VARCHAR(30),
    ADD COLUMN nivel_formacion  VARCHAR(30),
    ADD COLUMN departamento_id  BIGINT,
    ADD COLUMN fecha_ingreso    DATE,
    ADD CONSTRAINT fk_docente_departamento
        FOREIGN KEY (departamento_id) REFERENCES departamento_academico(id) ON DELETE RESTRICT,
    ADD CONSTRAINT chk_docente_sexo
        CHECK (sexo IS NULL OR sexo IN ('MASCULINO', 'FEMENINO', 'OTRO')),
    ADD CONSTRAINT chk_docente_vinculacion
        CHECK (tipo_vinculacion IS NULL OR tipo_vinculacion IN (
            'PLANTA_TIEMPO_COMPLETO', 'PLANTA_MEDIO_TIEMPO',
            'OCASIONAL', 'CATEDRA')),
    ADD CONSTRAINT chk_docente_escalafon
        CHECK (escalafon IS NULL OR escalafon IN (
            'AUXILIAR', 'ASISTENTE', 'ASOCIADO', 'TITULAR')),
    ADD CONSTRAINT chk_docente_formacion
        CHECK (nivel_formacion IS NULL OR nivel_formacion IN (
            'PREGRADO', 'ESPECIALIZACION', 'MAESTRIA',
            'DOCTORADO', 'POSTDOCTORADO'));

-- ============================================================
-- Programa 022 - INGENIERÍA DE SISTEMAS y su Reforma Pénsum 2010
-- ============================================================

INSERT INTO programa_academico (facultad_id, codigo_interno, codigo_snies, nombre, creditos_totales)
VALUES ((SELECT id FROM facultad WHERE codigo = 'FI'),
        '022', '5302', 'INGENIERÍA DE SISTEMAS', 160)
ON CONFLICT DO NOTHING;

INSERT INTO plan_estudios (programa_id, periodicidad_id, codigo_pensum, nombre,
                           fecha_vigencia_desde, total_creditos, estado)
VALUES ((SELECT id FROM programa_academico WHERE codigo_interno = '022'),
        (SELECT id FROM periodicidad_academica WHERE codigo = 'SEMESTRAL'),
        'P2010', 'Reforma Pénsum 2010', DATE '2010-01-01', 160, 'VIGENTE')
ON CONFLICT DO NOTHING;

-- ============================================================
-- Completar la ficha de los 50 estudiantes sembrados en V9
-- ============================================================

WITH dir AS (
    SELECT ARRAY[
        'MANZANA Ñ LOTE 20 PRIMER PISO', 'CALLE 30 #15-42 BARRIO MANGA',
        'CRA 4 #33-21 GETSEMANI', 'AV. PEDRO DE HEREDIA #50-12',
        'CALLE REAL DEL CABRERO #41-35', 'BARRIO EL BOSQUE CALLE 60 #10-22',
        'TRANSVERSAL 54 #30-18 LOZANO', 'CALLE 25 #18-7 CENTRO',
        'DIAGONAL 21 #45-60 ZARAGOZA', 'BARRIO OLAYA CALLE 28 #24-15'
    ] AS v
), seq AS (
    SELECT id, row_number() OVER (ORDER BY numero_documento) AS rn
    FROM estudiante
)
UPDATE estudiante e SET
    codigo           = '022' || '24' || lpad(seq.rn::text, 5, '0'),
    sexo             = CASE WHEN seq.rn % 2 = 0 THEN 'FEMENINO' ELSE 'MASCULINO' END,
    telefono         = '31' || lpad(((seq.rn * 7825428) % 100000000)::text, 8, '0'),
    direccion        = dir.v[1 + (seq.rn % 10)],
    programa_id      = (SELECT id FROM programa_academico WHERE codigo_interno = '022'),
    semestre         = 1 + (seq.rn % 10),
    estado_academico = 'NORMAL',
    estado_ingreso   = 'NO ESPECIFICA',
    plan_estudios_id = CASE WHEN seq.rn % 5 = 0 THEN NULL
                            ELSE (SELECT id FROM plan_estudios WHERE codigo_pensum = 'P2010') END,
    email            = lower(
        substr(split_part(e.nombres, ' ', 1), 1, 1) ||
        replace(split_part(e.apellidos, ' ', 1), ' ', '') ||
        seq.rn::text || '@unicartagena.edu.co')
FROM seq, dir
WHERE e.id = seq.id;

-- ============================================================
-- Ficha laboral de los 4 docentes
-- ============================================================

UPDATE docente SET
    sexo = 'MASCULINO', telefono = '3174501234',
    direccion = 'URBANIZACIÓN EL COUNTRY CALLE 12 #8-45',
    tipo_vinculacion = 'PLANTA_TIEMPO_COMPLETO', escalafon = 'TITULAR',
    nivel_formacion = 'DOCTORADO',
    departamento_id = (SELECT id FROM departamento_academico WHERE codigo = 'DCC'),
    fecha_ingreso = DATE '2015-02-01'
WHERE numero_documento = '10301274';

UPDATE docente SET
    sexo = 'FEMENINO', telefono = '3169874521',
    direccion = 'BARRIO MANGA CALLE 29 #20-11',
    tipo_vinculacion = 'PLANTA_TIEMPO_COMPLETO', escalafon = 'ASOCIADO',
    nivel_formacion = 'MAESTRIA',
    departamento_id = (SELECT id FROM departamento_academico WHERE codigo = 'DCC'),
    fecha_ingreso = DATE '2018-08-01'
WHERE numero_documento = '72104567';

UPDATE docente SET
    sexo = 'MASCULINO', telefono = '3001239876',
    direccion = 'BARRIO CRESPO CALLE 72 #5-33',
    tipo_vinculacion = 'OCASIONAL', escalafon = 'ASISTENTE',
    nivel_formacion = 'ESPECIALIZACION',
    departamento_id = (SELECT id FROM departamento_academico WHERE codigo = 'DCC'),
    fecha_ingreso = DATE '2021-02-01'
WHERE numero_documento = '73098812';

UPDATE docente SET
    sexo = 'MASCULINO', telefono = '3155558901',
    direccion = 'BARRIO LA POPA CALLE 37 #4-19',
    tipo_vinculacion = 'CATEDRA', escalafon = 'AUXILIAR',
    nivel_formacion = 'MAESTRIA',
    departamento_id = (SELECT id FROM departamento_academico WHERE codigo = 'DCC'),
    fecha_ingreso = DATE '2023-02-01'
WHERE numero_documento = '10304566';

-- Las evaluaciones quedan adscritas al programa 022
UPDATE evaluacion_docente
SET programa_id = (SELECT id FROM programa_academico WHERE codigo_interno = '022')
WHERE programa_id IS NULL;
