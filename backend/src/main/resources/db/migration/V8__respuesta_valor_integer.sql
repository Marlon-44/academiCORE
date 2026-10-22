-- ============================================================
-- V8 — respuesta_pregunta.valor: SMALLINT → INTEGER
-- Hibernate (ddl-auto validate) espera integer para un campo Integer.
-- ============================================================
ALTER TABLE respuesta_pregunta
    ALTER COLUMN valor TYPE INTEGER;
