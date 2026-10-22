-- ============================================================
-- V6 — Evaluación Docente: preguntas administrables + preguntas de texto
-- - tipo en pregunta_evaluacion (LIKERT | TEXTO)
-- - categoría COMENTARIOS con 2 preguntas abiertas
-- - la respuesta guarda texto_respuesta + sentimiento propio
-- - se elimina el comentario único de la encuesta (ahora vive por respuesta)
-- ============================================================

-- 1. Tipo de pregunta
ALTER TABLE pregunta_evaluacion
    ADD COLUMN tipo VARCHAR(10) NOT NULL DEFAULT 'LIKERT',
    ADD CONSTRAINT chk_pregunta_tipo
        CHECK (tipo IN ('LIKERT', 'TEXTO'));

-- 2. Categoría y preguntas de texto abierto (análisis de sentimiento)
INSERT INTO categoria_pregunta_evaluacion (codigo, nombre, orden) VALUES
    ('COMENTARIOS', 'Comentarios abiertos', 4)
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO pregunta_evaluacion (categoria_id, numero, texto, tipo) VALUES
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'COMENTARIOS'), 16,
     '¿Qué aspectos considera que debe mejorar el docente en su práctica pedagógica?', 'TEXTO'),
    ((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo = 'COMENTARIOS'), 17,
     '¿Qué fortalezas destaca del docente en el desarrollo del curso?', 'TEXTO')
ON CONFLICT (numero) DO NOTHING;

-- 3. Respuesta: valor opcional + texto propio + sentimiento por respuesta
ALTER TABLE respuesta_pregunta
    DROP CONSTRAINT chk_respuesta_valor,
    ALTER COLUMN valor DROP NOT NULL,
    ADD COLUMN texto_respuesta TEXT,
    ADD COLUMN sentimiento VARCHAR(20),
    ADD COLUMN sentimiento_score NUMERIC(4,3),
    ADD COLUMN sentimiento_metodo VARCHAR(20),
    ADD CONSTRAINT chk_respuesta_valor
        CHECK (valor IS NULL OR valor BETWEEN 1 AND 5),
    ADD CONSTRAINT chk_respuesta_contenido
        CHECK (valor IS NOT NULL OR texto_respuesta IS NOT NULL),
    ADD CONSTRAINT chk_respuesta_sentimiento
        CHECK (sentimiento IS NULL OR sentimiento IN ('POSITIVO', 'NEGATIVO', 'NEUTRO')),
    ADD CONSTRAINT chk_respuesta_metodo
        CHECK (sentimiento_metodo IS NULL OR sentimiento_metodo IN ('MODELO', 'LEXICO'));

-- 4. La encuesta ya no guarda comentario/sentimiento propio
ALTER TABLE encuesta_evaluacion
    DROP CONSTRAINT chk_encuesta_sentimiento,
    DROP CONSTRAINT chk_encuesta_sentimiento_metodo,
    DROP COLUMN comentario,
    DROP COLUMN sentimiento,
    DROP COLUMN sentimiento_score,
    DROP COLUMN sentimiento_metodo;
