-- ============================================================
-- V7 — Corrige el tipo de respuesta_pregunta.sentimiento_score
-- NUMERIC no coincide con el mapeo JPA (Double → float(53)).
-- ============================================================
ALTER TABLE respuesta_pregunta
    ALTER COLUMN sentimiento_score TYPE DOUBLE PRECISION
    USING sentimiento_score::DOUBLE PRECISION;
