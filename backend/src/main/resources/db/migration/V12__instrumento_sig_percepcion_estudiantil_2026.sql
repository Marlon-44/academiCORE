-- ============================================================
-- V12 · Instrumento real SIG "ENCUESTA DE PERCEPCIÓN ESTUDIANTIL - PRESENCIAL"
--        (Universidad de Cartagena) + carga académica del periodo 2026-2.
--
-- El instrumento oficial tiene 21 ítems en 5 categorías:
--   COMUNICACIÓN (1-4), EVALUACIÓN DEL APRENDIZAJE (5-7),
--   GENERALIDADES (8-9, texto abierto máx. 250 caracteres),
--   MOTIVACIÓN Y COMPROMISO (10-14), ORIENTACIÓN EN EL APRENDIZAJE (15-21).
-- Escala de valoración: NO CUMPLE(1), ASPECTOS POR MEJORAR(2),
-- BUENO(3), EXCELENTE(4). Cada ítem pesa 1.00.
--
-- El instrumento anterior (PVD003, 15 Likert + 2 texto) pasa a histórico:
-- se desactiva y se renumeran sus ítems a 101-117 para conservar las
-- encuestas ya respondidas y liberar los números 1-21 del instrumento real.
-- ============================================================

-- 1. Categorías del instrumento real
INSERT INTO categoria_pregunta_evaluacion (codigo, nombre, orden) VALUES
    ('COMUNICACION',          'Comunicación',               5),
    ('EVALUACION_APRENDIZAJE','Evaluación del Aprendizaje', 6),
    ('GENERALIDADES',         'Generalidades',              7),
    ('MOTIVACION_COMPROMISO', 'Motivación y Compromiso',    8),
    ('ORIENTACION_APRENDIZAJE','Orientación en el Aprendizaje', 9)
ON CONFLICT (codigo) DO NOTHING;

-- 2. Instrumento PVD003 anterior → histórico (conserva respuestas existentes)
UPDATE pregunta_evaluacion
SET estado = 'INACTIVA', numero = numero + 100
WHERE estado = 'ACTIVA';

-- 3. Las 21 preguntas reales del SIG
INSERT INTO pregunta_evaluacion (categoria_id, numero, texto, tipo, estado) VALUES
    -- CATEGORÍA: COMUNICACIÓN (ítems 1-4)
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'COMUNICACION'), 1,
     'RESPETO: El docente usa un lenguaje cortés, respetuoso y es tolerante con los diferentes puntos de vista.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'COMUNICACION'), 2,
     'COMUNICACIÓN CLARA: El docente comunica con claridad sus procesos de enseñanza.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'COMUNICACION'), 3,
     'USO DE LOS CANALES INSTITUCIONALES: El docente mantiene una comunicación continua a través de los canales disponibles en la institución.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'COMUNICACION'), 4,
     'RELACIONES INTERPERSONALES: El docente promueve situaciones de comunicación y trato que aseguran un ambiente libre de acoso para todos los miembros de la comunidad académica.', 'LIKERT', 'ACTIVA'),
    -- CATEGORÍA: EVALUACIÓN DEL APRENDIZAJE (ítems 5-7)
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'EVALUACION_APRENDIZAJE'), 5,
     'RESPONSABILIDAD: El docente respetó las reglas y fechas de evaluación establecidos en el proyecto docente y el calendario académico.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'EVALUACION_APRENDIZAJE'), 6,
     'USO DE RESULTADOS DE LA EVALUACIÓN: El docente utiliza los resultados de la evaluación para orientar los procesos de Enseñanza-Aprendizaje.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'EVALUACION_APRENDIZAJE'), 7,
     'RETROALIMENTACIÓN: El docente retroalimenta las actividades evaluativas propuestas señalando las fortalezas, debilidades y oportunidades de mejora.', 'LIKERT', 'ACTIVA'),
    -- CATEGORÍA: GENERALIDADES (ítems 8-9, texto abierto — máx. 250 caracteres en el SIG)
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'GENERALIDADES'), 8,
     '¿Cuáles considera que fueron las principales fortalezas que contribuyeron al desempeño del docente?', 'TEXTO', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'GENERALIDADES'), 9,
     '¿En qué aspectos considera que debería trabajar el docente para mejorar su desempeño?', 'TEXTO', 'ACTIVA'),
    -- CATEGORÍA: MOTIVACIÓN Y COMPROMISO (ítems 10-14)
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'MOTIVACION_COMPROMISO'), 10,
     'PUNTUALIDAD: El docente es puntual en el cumplimiento de las actividades programadas en el curso.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'MOTIVACION_COMPROMISO'), 11,
     'MOTIVACIÓN: El docente muestra agrado y entusiasmo por su labor de enseñar.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'MOTIVACION_COMPROMISO'), 12,
     'PREPARACIÓN: El docente prepara adecuadamente cada sesión o actividad de aprendizaje contemplada en el curso.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'MOTIVACION_COMPROMISO'), 13,
     'TRABAJO COLABORATIVO: El docente promueve el trabajo colaborativo entre los estudiantes en los procesos de aprendizaje individuales y colectivos.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'MOTIVACION_COMPROMISO'), 14,
     'FOMENTO DEL APRENDIZAJE: El docente fomenta el aprendizaje significativo en los estudiantes.', 'LIKERT', 'ACTIVA'),
    -- CATEGORÍA: ORIENTACIÓN EN EL APRENDIZAJE (ítems 15-21)
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'ORIENTACION_APRENDIZAJE'), 15,
     'DOMINIO DEL TEMA: El docente domina los saberes del curso o módulo a su cargo.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'ORIENTACION_APRENDIZAJE'), 16,
     'ACOMPAÑAMIENTO AL APRENDIZAJE: El docente aclara las dudas de los estudiantes sobre el desarrollo de las temáticas planteadas durante las clases y en los espacios programados para tal fin.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'ORIENTACION_APRENDIZAJE'), 17,
     'ORIENTACIÓN A LA INVESTIGACIÓN: El docente promueve un espíritu investigativo en el marco de su curso y motiva la consulta actualizada de materiales bibliográficos como apoyo al aprendizaje.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'ORIENTACION_APRENDIZAJE'), 18,
     'COMPETENCIAS TECNOLÓGICAS: El docente incorpora herramientas TIC y recursos digitales en los procesos de enseñanza que lidera.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'ORIENTACION_APRENDIZAJE'), 19,
     'EJECUCIÓN DE PLANES: El docente desarrolla todas las unidades temáticas planteadas en el proyecto docente o programa del módulo que tiene a cargo.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'ORIENTACION_APRENDIZAJE'), 20,
     'ESTRATEGIAS DIDÁCTICAS: El docente emplea diversas estrategias enfocadas en la promoción del aprendizaje de los estudiantes.', 'LIKERT', 'ACTIVA'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'ORIENTACION_APRENDIZAJE'), 21,
     'PLANIFICACIÓN: El docente socializa a inicios de semestre el proyecto docente y/o proyecta el desarrollo académico del curso o módulo a su cargo.', 'LIKERT', 'ACTIVA')
ON CONFLICT (numero) DO NOTHING;

-- ============================================================
-- 4. Evaluaciones del periodo 2026-2 (ventana SIG: 2026-10-17 a 2026-11-14)
--    Dos asignaturas por docente, grupos distintos a los de 2025-1.
-- ============================================================
INSERT INTO evaluacion_docente
    (docente_id, asignatura_id, programa_id, grupo, periodo, estudiantes_esperados, estado)
SELECT d, a, 1, g, '2026-2', e, 'ABIERTA'
FROM (VALUES
    (1, 5, 'A1', 22),   -- Chanchí  · Ingeniería de Software I
    (1, 3, 'B1', 22),   -- Chanchí  · Programación II
    (2, 1, 'B2', 21),   -- Prof. Ruiz · Interacción Humano Computador
    (2, 6, 'A1', 21),   -- Prof. Ruiz · Redes de Computadores
    (3, 4, 'A1', 21),   -- Prof. Mendoza · Bases de Datos
    (3, 2, 'B1', 21),   -- Prof. Mendoza · Electiva Software Libre
    (4, 5, 'A2', 22),   -- Prof. Paternina · Ingeniería de Software I
    (4, 3, 'A1', 21)    -- Prof. Paternina · Programación II
) AS v(d, a, g, e)
WHERE NOT EXISTS (
    SELECT 1 FROM evaluacion_docente ev
    WHERE ev.docente_id = v.d AND ev.asignatura_id = v.a
      AND ev.grupo = v.g AND ev.periodo = '2026-2'
);

-- ============================================================
-- 5. Inscripciones 2026-2: cada estudiante queda con 6 evaluaciones
--    en total (carga académica real de un semestre, como en el SIG).
--    La evaluación 6 (Ing. Software I · B2 · 2025-2, estudiantes 41-50)
--    queda pendiente para el flujo de encuesta.
-- ============================================================
INSERT INTO inscripcion_evaluacion (evaluacion_id, estudiante_id)
SELECT ev.id, x.estudiante_id
FROM (VALUES
    ('A1', 'EP1301', 1),
    ('B1', 'EP1102', 1),
    ('B2', 'EP1303', 1),
    ('A1', 'EP2103', 1),
    ('A1', 'EP2201', 1),
    ('B1', '2222123', 2),
    ('A2', 'EP1301', 2),
    ('A1', 'EP1102', 2),
    ('A1', 'EP1301', 2),
    ('B1', 'EP1102', 2),
    ('B2', 'EP1303', 3),
    ('A1', 'EP2103', 3),
    ('A1', 'EP2201', 3),
    ('B1', '2222123', 3),
    ('A2', 'EP1301', 3),
    ('A1', 'EP1102', 4),
    ('A1', 'EP1301', 4),
    ('B1', 'EP1102', 4),
    ('B2', 'EP1303', 4),
    ('A1', 'EP2103', 4),
    ('A1', 'EP2201', 5),
    ('B1', '2222123', 5),
    ('A2', 'EP1301', 5),
    ('A1', 'EP1102', 5),
    ('A1', 'EP1301', 6),
    ('B1', 'EP1102', 6),
    ('B2', 'EP1303', 6),
    ('A1', 'EP2103', 6),
    ('A1', 'EP2201', 7),
    ('B1', '2222123', 7),
    ('A2', 'EP1301', 7),
    ('A1', 'EP1102', 7),
    ('A1', 'EP1301', 8),
    ('B1', 'EP1102', 8),
    ('B2', 'EP1303', 8),
    ('A1', 'EP2103', 8),
    ('A1', 'EP2201', 9),
    ('B1', '2222123', 9),
    ('A2', 'EP1301', 9),
    ('A1', 'EP1102', 9),
    ('A1', 'EP1301', 10),
    ('B1', 'EP1102', 10),
    ('B2', 'EP1303', 10),
    ('A1', 'EP2103', 10),
    ('A1', 'EP2201', 11),
    ('B1', '2222123', 11),
    ('A2', 'EP1301', 11),
    ('A1', 'EP1102', 11),
    ('A1', 'EP1301', 12),
    ('B1', 'EP1102', 12),
    ('B2', 'EP1303', 12),
    ('A1', 'EP2103', 12),
    ('A1', 'EP2201', 13),
    ('B1', '2222123', 13),
    ('A2', 'EP1301', 13),
    ('A1', 'EP1102', 13),
    ('A1', 'EP1301', 14),
    ('B1', 'EP1102', 14),
    ('B2', 'EP1303', 14),
    ('A1', 'EP2103', 14),
    ('A1', 'EP2201', 15),
    ('B1', '2222123', 15),
    ('A2', 'EP1301', 15),
    ('A1', 'EP1102', 16),
    ('A1', 'EP1301', 16),
    ('B1', 'EP1102', 16),
    ('B2', 'EP1303', 17),
    ('A1', 'EP2103', 17),
    ('A1', 'EP2201', 17),
    ('B1', '2222123', 18),
    ('A2', 'EP1301', 18),
    ('A1', 'EP1102', 18),
    ('A1', 'EP1301', 19),
    ('B1', 'EP1102', 19),
    ('B2', 'EP1303', 19),
    ('A1', 'EP2103', 20),
    ('A1', 'EP2201', 20),
    ('B1', '2222123', 20),
    ('A2', 'EP1301', 21),
    ('A1', 'EP1102', 21),
    ('A1', 'EP1301', 21),
    ('B1', 'EP1102', 22),
    ('B2', 'EP1303', 22),
    ('A1', 'EP2103', 22),
    ('A1', 'EP2201', 23),
    ('B1', '2222123', 23),
    ('A2', 'EP1301', 23),
    ('A1', 'EP1102', 24),
    ('A1', 'EP1301', 24),
    ('B1', 'EP1102', 24),
    ('B2', 'EP1303', 25),
    ('A1', 'EP2103', 25),
    ('A1', 'EP2201', 25),
    ('B1', '2222123', 26),
    ('A2', 'EP1301', 26),
    ('A1', 'EP1102', 26),
    ('A1', 'EP1301', 27),
    ('B1', 'EP1102', 27),
    ('B2', 'EP1303', 27),
    ('A1', 'EP2103', 28),
    ('A1', 'EP2201', 28),
    ('B1', '2222123', 28),
    ('A2', 'EP1301', 29),
    ('A1', 'EP1102', 29),
    ('A1', 'EP1301', 29),
    ('B1', 'EP1102', 30),
    ('B2', 'EP1303', 30),
    ('A1', 'EP2103', 30),
    ('A1', 'EP2201', 30),
    ('B1', '2222123', 31),
    ('A2', 'EP1301', 31),
    ('A1', 'EP1102', 31),
    ('A1', 'EP1301', 32),
    ('B1', 'EP1102', 32),
    ('B2', 'EP1303', 32),
    ('A1', 'EP2103', 33),
    ('A1', 'EP2201', 33),
    ('B1', '2222123', 33),
    ('A2', 'EP1301', 34),
    ('A1', 'EP1102', 34),
    ('A1', 'EP1301', 34),
    ('B1', 'EP1102', 35),
    ('B2', 'EP1303', 35),
    ('A1', 'EP2103', 35),
    ('A1', 'EP2201', 36),
    ('B1', '2222123', 36),
    ('A2', 'EP1301', 36),
    ('A1', 'EP1102', 37),
    ('A1', 'EP1301', 37),
    ('B1', 'EP1102', 37),
    ('B2', 'EP1303', 38),
    ('A1', 'EP2103', 38),
    ('A1', 'EP2201', 38),
    ('B1', '2222123', 39),
    ('A2', 'EP1301', 39),
    ('A1', 'EP1102', 39),
    ('A1', 'EP1301', 40),
    ('B1', 'EP1102', 40),
    ('B2', 'EP1303', 40),
    ('A1', 'EP2103', 40),
    ('A1', 'EP2201', 41),
    ('B1', '2222123', 41),
    ('A2', 'EP1301', 41),
    ('A1', 'EP1102', 42),
    ('A1', 'EP1301', 42),
    ('B1', 'EP1102', 42),
    ('B2', 'EP1303', 43),
    ('A1', 'EP2103', 43),
    ('A1', 'EP2201', 43),
    ('B1', '2222123', 44),
    ('A2', 'EP1301', 44),
    ('A1', 'EP1102', 44),
    ('A1', 'EP1301', 45),
    ('B1', 'EP1102', 45),
    ('B2', 'EP1303', 45),
    ('A1', 'EP2103', 46),
    ('A1', 'EP2201', 46),
    ('B1', '2222123', 46),
    ('A2', 'EP1301', 47),
    ('A1', 'EP1102', 47),
    ('A1', 'EP1301', 47),
    ('B1', 'EP1102', 48),
    ('B2', 'EP1303', 48),
    ('A1', 'EP2103', 48),
    ('A1', 'EP2201', 49),
    ('B1', '2222123', 49),
    ('A2', 'EP1301', 49),
    ('A1', 'EP1102', 50),
    ('A1', 'EP1301', 50),
    ('B1', 'EP1102', 50)
) AS x(grupo, asignatura_codigo, estudiante_id)
JOIN evaluacion_docente ev
    ON ev.grupo = x.grupo AND ev.periodo = '2026-2'
   AND ev.asignatura_id = (SELECT id FROM asignatura WHERE codigo = x.asignatura_codigo)
ON CONFLICT DO NOTHING;

-- estudiantes_esperados = cupo real inscrito
UPDATE evaluacion_docente ev
SET estudiantes_esperados = (
    SELECT COUNT(*) FROM inscripcion_evaluacion i WHERE i.evaluacion_id = ev.id
)
WHERE ev.periodo = '2026-2';
