--
-- PostgreSQL database dump
--

\restrict WMQoLcmnWJ86cHJNlx0DNZNwjDvWTrHsddgaA0A18wJlGmLrkkQFbe8b5gz70tl

-- Dumped from database version 16.15
-- Dumped by pg_dump version 16.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.usuario DROP CONSTRAINT IF EXISTS usuario_estudiante_id_fkey;
ALTER TABLE IF EXISTS ONLY public.usuario DROP CONSTRAINT IF EXISTS usuario_docente_id_fkey;
ALTER TABLE IF EXISTS ONLY public.sesion DROP CONSTRAINT IF EXISTS sesion_usuario_id_fkey;
ALTER TABLE IF EXISTS ONLY public.respuesta_pregunta DROP CONSTRAINT IF EXISTS fk_respuesta_pregunta;
ALTER TABLE IF EXISTS ONLY public.respuesta_pregunta DROP CONSTRAINT IF EXISTS fk_respuesta_encuesta;
ALTER TABLE IF EXISTS ONLY public.requisito_plan_asignatura DROP CONSTRAINT IF EXISTS fk_requisito_tipo;
ALTER TABLE IF EXISTS ONLY public.requisito_plan_asignatura DROP CONSTRAINT IF EXISTS fk_requisito_plan;
ALTER TABLE IF EXISTS ONLY public.requisito_plan_asignatura DROP CONSTRAINT IF EXISTS fk_requisito_asignatura_requerida;
ALTER TABLE IF EXISTS ONLY public.requisito_plan_asignatura DROP CONSTRAINT IF EXISTS fk_requisito_asignatura;
ALTER TABLE IF EXISTS ONLY public.programa_academico DROP CONSTRAINT IF EXISTS fk_programa_facultad;
ALTER TABLE IF EXISTS ONLY public.programa_campus DROP CONSTRAINT IF EXISTS fk_progcampus_programa;
ALTER TABLE IF EXISTS ONLY public.programa_campus DROP CONSTRAINT IF EXISTS fk_progcampus_campus;
ALTER TABLE IF EXISTS ONLY public.pregunta_evaluacion DROP CONSTRAINT IF EXISTS fk_pregunta_categoria;
ALTER TABLE IF EXISTS ONLY public.plan_estudios DROP CONSTRAINT IF EXISTS fk_plan_programa;
ALTER TABLE IF EXISTS ONLY public.plan_estudios DROP CONSTRAINT IF EXISTS fk_plan_periodicidad;
ALTER TABLE IF EXISTS ONLY public.plan_asignatura DROP CONSTRAINT IF EXISTS fk_plan_asignatura_tipo;
ALTER TABLE IF EXISTS ONLY public.plan_asignatura DROP CONSTRAINT IF EXISTS fk_plan_asignatura_plan;
ALTER TABLE IF EXISTS ONLY public.plan_asignatura DROP CONSTRAINT IF EXISTS fk_plan_asignatura_nivel;
ALTER TABLE IF EXISTS ONLY public.plan_asignatura DROP CONSTRAINT IF EXISTS fk_plan_asignatura_asignatura;
ALTER TABLE IF EXISTS ONLY public.oferta_admision DROP CONSTRAINT IF EXISTS fk_oferta_programa;
ALTER TABLE IF EXISTS ONLY public.oferta_admision DROP CONSTRAINT IF EXISTS fk_oferta_periodo;
ALTER TABLE IF EXISTS ONLY public.oferta_admision DROP CONSTRAINT IF EXISTS fk_oferta_pensum;
ALTER TABLE IF EXISTS ONLY public.oferta_admision DROP CONSTRAINT IF EXISTS fk_oferta_moneda;
ALTER TABLE IF EXISTS ONLY public.oferta_admision DROP CONSTRAINT IF EXISTS fk_oferta_campus;
ALTER TABLE IF EXISTS ONLY public.nivel_curricular DROP CONSTRAINT IF EXISTS fk_nivel_plan;
ALTER TABLE IF EXISTS ONLY public.inscripcion DROP CONSTRAINT IF EXISTS fk_inscripcion_oferta;
ALTER TABLE IF EXISTS ONLY public.inscripcion_evaluacion DROP CONSTRAINT IF EXISTS fk_inscripcion_evaluacion;
ALTER TABLE IF EXISTS ONLY public.inscripcion_evaluacion DROP CONSTRAINT IF EXISTS fk_inscripcion_estudiante;
ALTER TABLE IF EXISTS ONLY public.inscripcion DROP CONSTRAINT IF EXISTS fk_inscripcion_aspirante;
ALTER TABLE IF EXISTS ONLY public.imagen_campus DROP CONSTRAINT IF EXISTS fk_imagen_categoria;
ALTER TABLE IF EXISTS ONLY public.imagen_campus DROP CONSTRAINT IF EXISTS fk_imagen_campus;
ALTER TABLE IF EXISTS ONLY public.facultad DROP CONSTRAINT IF EXISTS fk_facultad_universidad;
ALTER TABLE IF EXISTS ONLY public.factura DROP CONSTRAINT IF EXISTS fk_factura_moneda;
ALTER TABLE IF EXISTS ONLY public.factura DROP CONSTRAINT IF EXISTS fk_factura_inscripcion;
ALTER TABLE IF EXISTS ONLY public.factura DROP CONSTRAINT IF EXISTS fk_factura_concepto;
ALTER TABLE IF EXISTS ONLY public.evaluacion_docente DROP CONSTRAINT IF EXISTS fk_evaluacion_programa;
ALTER TABLE IF EXISTS ONLY public.evaluacion_docente DROP CONSTRAINT IF EXISTS fk_evaluacion_docente;
ALTER TABLE IF EXISTS ONLY public.evaluacion_docente DROP CONSTRAINT IF EXISTS fk_evaluacion_asignatura;
ALTER TABLE IF EXISTS ONLY public.estudiante DROP CONSTRAINT IF EXISTS fk_estudiante_programa;
ALTER TABLE IF EXISTS ONLY public.estudiante DROP CONSTRAINT IF EXISTS fk_estudiante_plan;
ALTER TABLE IF EXISTS ONLY public.encuesta_evaluacion DROP CONSTRAINT IF EXISTS fk_encuesta_evaluacion;
ALTER TABLE IF EXISTS ONLY public.encuesta_evaluacion DROP CONSTRAINT IF EXISTS fk_encuesta_estudiante;
ALTER TABLE IF EXISTS ONLY public.documento_aspirante DROP CONSTRAINT IF EXISTS fk_documento_inscripcion;
ALTER TABLE IF EXISTS ONLY public.docente DROP CONSTRAINT IF EXISTS fk_docente_departamento;
ALTER TABLE IF EXISTS ONLY public.departamento_academico DROP CONSTRAINT IF EXISTS fk_departamento_facultad;
ALTER TABLE IF EXISTS ONLY public.campus DROP CONSTRAINT IF EXISTS fk_campus_universidad;
ALTER TABLE IF EXISTS ONLY public.asignatura_naturaleza DROP CONSTRAINT IF EXISTS fk_asignatura_naturaleza_naturaleza;
ALTER TABLE IF EXISTS ONLY public.asignatura_naturaleza DROP CONSTRAINT IF EXISTS fk_asignatura_naturaleza_asignatura;
ALTER TABLE IF EXISTS ONLY public.asignatura DROP CONSTRAINT IF EXISTS fk_asignatura_departamento;
DROP INDEX IF EXISTS public.idx_usuario_estudiante;
DROP INDEX IF EXISTS public.idx_sesion_usuario;
DROP INDEX IF EXISTS public.idx_sesion_token;
DROP INDEX IF EXISTS public.flyway_schema_history_s_idx;
ALTER TABLE IF EXISTS ONLY public.usuario DROP CONSTRAINT IF EXISTS usuario_username_key;
ALTER TABLE IF EXISTS ONLY public.usuario DROP CONSTRAINT IF EXISTS usuario_pkey;
ALTER TABLE IF EXISTS ONLY public.universidad DROP CONSTRAINT IF EXISTS uq_universidad_codigo;
ALTER TABLE IF EXISTS ONLY public.tipo_requisito DROP CONSTRAINT IF EXISTS uq_tipo_requisito_codigo;
ALTER TABLE IF EXISTS ONLY public.tipo_asignatura_plan DROP CONSTRAINT IF EXISTS uq_tipo_asignatura_codigo;
ALTER TABLE IF EXISTS ONLY public.respuesta_pregunta DROP CONSTRAINT IF EXISTS uq_respuesta_encuesta_pregunta;
ALTER TABLE IF EXISTS ONLY public.requisito_plan_asignatura DROP CONSTRAINT IF EXISTS uq_requisito;
ALTER TABLE IF EXISTS ONLY public.programa_academico DROP CONSTRAINT IF EXISTS uq_programa_facultad_codigo;
ALTER TABLE IF EXISTS ONLY public.programa_academico DROP CONSTRAINT IF EXISTS uq_programa_codigo_snies;
ALTER TABLE IF EXISTS ONLY public.pregunta_evaluacion DROP CONSTRAINT IF EXISTS uq_pregunta_numero;
ALTER TABLE IF EXISTS ONLY public.plan_estudios DROP CONSTRAINT IF EXISTS uq_plan_programa_codigo;
ALTER TABLE IF EXISTS ONLY public.plan_asignatura DROP CONSTRAINT IF EXISTS uq_plan_asignatura_plan_id;
ALTER TABLE IF EXISTS ONLY public.plan_asignatura DROP CONSTRAINT IF EXISTS uq_plan_asignatura;
ALTER TABLE IF EXISTS ONLY public.periodo_admision DROP CONSTRAINT IF EXISTS uq_periodo_admision_codigo;
ALTER TABLE IF EXISTS ONLY public.periodicidad_academica DROP CONSTRAINT IF EXISTS uq_periodicidad_codigo;
ALTER TABLE IF EXISTS ONLY public.oferta_admision DROP CONSTRAINT IF EXISTS uq_oferta_periodo_programa_campus;
ALTER TABLE IF EXISTS ONLY public.nivel_curricular DROP CONSTRAINT IF EXISTS uq_nivel_plan_numero;
ALTER TABLE IF EXISTS ONLY public.nivel_curricular DROP CONSTRAINT IF EXISTS uq_nivel_plan_id;
ALTER TABLE IF EXISTS ONLY public.naturaleza_asignatura DROP CONSTRAINT IF EXISTS uq_naturaleza_codigo;
ALTER TABLE IF EXISTS ONLY public.moneda DROP CONSTRAINT IF EXISTS uq_moneda_codigo_iso;
ALTER TABLE IF EXISTS ONLY public.inscripcion_evaluacion DROP CONSTRAINT IF EXISTS uq_inscripcion_evaluacion_estudiante;
ALTER TABLE IF EXISTS ONLY public.inscripcion DROP CONSTRAINT IF EXISTS uq_inscripcion_aspirante_oferta;
ALTER TABLE IF EXISTS ONLY public.facultad DROP CONSTRAINT IF EXISTS uq_facultad_universidad_nombre;
ALTER TABLE IF EXISTS ONLY public.facultad DROP CONSTRAINT IF EXISTS uq_facultad_universidad_codigo;
ALTER TABLE IF EXISTS ONLY public.factura DROP CONSTRAINT IF EXISTS uq_factura_numero;
ALTER TABLE IF EXISTS ONLY public.evaluacion_docente DROP CONSTRAINT IF EXISTS uq_evaluacion_docente_materia;
ALTER TABLE IF EXISTS ONLY public.estudiante DROP CONSTRAINT IF EXISTS uq_estudiante_documento;
ALTER TABLE IF EXISTS ONLY public.estudiante DROP CONSTRAINT IF EXISTS uq_estudiante_codigo;
ALTER TABLE IF EXISTS ONLY public.encuesta_evaluacion DROP CONSTRAINT IF EXISTS uq_encuesta_evaluacion_estudiante;
ALTER TABLE IF EXISTS ONLY public.docente DROP CONSTRAINT IF EXISTS uq_docente_documento;
ALTER TABLE IF EXISTS ONLY public.departamento_academico DROP CONSTRAINT IF EXISTS uq_departamento_facultad_nombre;
ALTER TABLE IF EXISTS ONLY public.departamento_academico DROP CONSTRAINT IF EXISTS uq_departamento_facultad_codigo;
ALTER TABLE IF EXISTS ONLY public.concepto_pago DROP CONSTRAINT IF EXISTS uq_concepto_pago_codigo;
ALTER TABLE IF EXISTS ONLY public.categoria_pregunta_evaluacion DROP CONSTRAINT IF EXISTS uq_categoria_pregunta_codigo;
ALTER TABLE IF EXISTS ONLY public.categoria_imagen_campus DROP CONSTRAINT IF EXISTS uq_categoria_imagen_codigo;
ALTER TABLE IF EXISTS ONLY public.campus DROP CONSTRAINT IF EXISTS uq_campus_universidad_codigo;
ALTER TABLE IF EXISTS ONLY public.aspirante DROP CONSTRAINT IF EXISTS uq_aspirante_documento;
ALTER TABLE IF EXISTS ONLY public.asignatura DROP CONSTRAINT IF EXISTS uq_asignatura_departamento_codigo;
ALTER TABLE IF EXISTS ONLY public.universidad DROP CONSTRAINT IF EXISTS universidad_pkey;
ALTER TABLE IF EXISTS ONLY public.tipo_requisito DROP CONSTRAINT IF EXISTS tipo_requisito_pkey;
ALTER TABLE IF EXISTS ONLY public.tipo_asignatura_plan DROP CONSTRAINT IF EXISTS tipo_asignatura_plan_pkey;
ALTER TABLE IF EXISTS ONLY public.sesion DROP CONSTRAINT IF EXISTS sesion_token_key;
ALTER TABLE IF EXISTS ONLY public.sesion DROP CONSTRAINT IF EXISTS sesion_pkey;
ALTER TABLE IF EXISTS ONLY public.respuesta_pregunta DROP CONSTRAINT IF EXISTS respuesta_pregunta_pkey;
ALTER TABLE IF EXISTS ONLY public.requisito_plan_asignatura DROP CONSTRAINT IF EXISTS requisito_plan_asignatura_pkey;
ALTER TABLE IF EXISTS ONLY public.programa_campus DROP CONSTRAINT IF EXISTS programa_campus_pkey;
ALTER TABLE IF EXISTS ONLY public.programa_academico DROP CONSTRAINT IF EXISTS programa_academico_pkey;
ALTER TABLE IF EXISTS ONLY public.pregunta_evaluacion DROP CONSTRAINT IF EXISTS pregunta_evaluacion_pkey;
ALTER TABLE IF EXISTS ONLY public.plan_estudios DROP CONSTRAINT IF EXISTS plan_estudios_pkey;
ALTER TABLE IF EXISTS ONLY public.plan_asignatura DROP CONSTRAINT IF EXISTS plan_asignatura_pkey;
ALTER TABLE IF EXISTS ONLY public.periodo_admision DROP CONSTRAINT IF EXISTS periodo_admision_pkey;
ALTER TABLE IF EXISTS ONLY public.periodicidad_academica DROP CONSTRAINT IF EXISTS periodicidad_academica_pkey;
ALTER TABLE IF EXISTS ONLY public.oferta_admision DROP CONSTRAINT IF EXISTS oferta_admision_pkey;
ALTER TABLE IF EXISTS ONLY public.nivel_curricular DROP CONSTRAINT IF EXISTS nivel_curricular_pkey;
ALTER TABLE IF EXISTS ONLY public.naturaleza_asignatura DROP CONSTRAINT IF EXISTS naturaleza_asignatura_pkey;
ALTER TABLE IF EXISTS ONLY public.moneda DROP CONSTRAINT IF EXISTS moneda_pkey;
ALTER TABLE IF EXISTS ONLY public.inscripcion DROP CONSTRAINT IF EXISTS inscripcion_pkey;
ALTER TABLE IF EXISTS ONLY public.inscripcion_evaluacion DROP CONSTRAINT IF EXISTS inscripcion_evaluacion_pkey;
ALTER TABLE IF EXISTS ONLY public.imagen_campus DROP CONSTRAINT IF EXISTS imagen_campus_pkey;
ALTER TABLE IF EXISTS ONLY public.flyway_schema_history DROP CONSTRAINT IF EXISTS flyway_schema_history_pk;
ALTER TABLE IF EXISTS ONLY public.facultad DROP CONSTRAINT IF EXISTS facultad_pkey;
ALTER TABLE IF EXISTS ONLY public.factura DROP CONSTRAINT IF EXISTS factura_pkey;
ALTER TABLE IF EXISTS ONLY public.evaluacion_docente DROP CONSTRAINT IF EXISTS evaluacion_docente_pkey;
ALTER TABLE IF EXISTS ONLY public.estudiante DROP CONSTRAINT IF EXISTS estudiante_pkey;
ALTER TABLE IF EXISTS ONLY public.encuesta_evaluacion DROP CONSTRAINT IF EXISTS encuesta_evaluacion_pkey;
ALTER TABLE IF EXISTS ONLY public.documento_aspirante DROP CONSTRAINT IF EXISTS documento_aspirante_pkey;
ALTER TABLE IF EXISTS ONLY public.docente DROP CONSTRAINT IF EXISTS docente_pkey;
ALTER TABLE IF EXISTS ONLY public.departamento_academico DROP CONSTRAINT IF EXISTS departamento_academico_pkey;
ALTER TABLE IF EXISTS ONLY public.concepto_pago DROP CONSTRAINT IF EXISTS concepto_pago_pkey;
ALTER TABLE IF EXISTS ONLY public.categoria_pregunta_evaluacion DROP CONSTRAINT IF EXISTS categoria_pregunta_evaluacion_pkey;
ALTER TABLE IF EXISTS ONLY public.categoria_imagen_campus DROP CONSTRAINT IF EXISTS categoria_imagen_campus_pkey;
ALTER TABLE IF EXISTS ONLY public.campus DROP CONSTRAINT IF EXISTS campus_pkey;
ALTER TABLE IF EXISTS ONLY public.aspirante DROP CONSTRAINT IF EXISTS aspirante_pkey;
ALTER TABLE IF EXISTS ONLY public.asignatura DROP CONSTRAINT IF EXISTS asignatura_pkey;
ALTER TABLE IF EXISTS ONLY public.asignatura_naturaleza DROP CONSTRAINT IF EXISTS asignatura_naturaleza_pkey;
ALTER TABLE IF EXISTS public.usuario ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.sesion ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.usuario_id_seq;
DROP TABLE IF EXISTS public.usuario;
DROP TABLE IF EXISTS public.universidad;
DROP TABLE IF EXISTS public.tipo_requisito;
DROP TABLE IF EXISTS public.tipo_asignatura_plan;
DROP SEQUENCE IF EXISTS public.sesion_id_seq;
DROP TABLE IF EXISTS public.sesion;
DROP TABLE IF EXISTS public.respuesta_pregunta;
DROP TABLE IF EXISTS public.requisito_plan_asignatura;
DROP TABLE IF EXISTS public.programa_campus;
DROP TABLE IF EXISTS public.programa_academico;
DROP TABLE IF EXISTS public.pregunta_evaluacion;
DROP TABLE IF EXISTS public.plan_estudios;
DROP TABLE IF EXISTS public.plan_asignatura;
DROP TABLE IF EXISTS public.periodo_admision;
DROP TABLE IF EXISTS public.periodicidad_academica;
DROP TABLE IF EXISTS public.oferta_admision;
DROP TABLE IF EXISTS public.nivel_curricular;
DROP TABLE IF EXISTS public.naturaleza_asignatura;
DROP TABLE IF EXISTS public.moneda;
DROP TABLE IF EXISTS public.inscripcion_evaluacion;
DROP TABLE IF EXISTS public.inscripcion;
DROP TABLE IF EXISTS public.imagen_campus;
DROP TABLE IF EXISTS public.flyway_schema_history;
DROP TABLE IF EXISTS public.facultad;
DROP TABLE IF EXISTS public.factura;
DROP TABLE IF EXISTS public.evaluacion_docente;
DROP TABLE IF EXISTS public.estudiante;
DROP TABLE IF EXISTS public.encuesta_evaluacion;
DROP TABLE IF EXISTS public.documento_aspirante;
DROP TABLE IF EXISTS public.docente;
DROP TABLE IF EXISTS public.departamento_academico;
DROP TABLE IF EXISTS public.concepto_pago;
DROP TABLE IF EXISTS public.categoria_pregunta_evaluacion;
DROP TABLE IF EXISTS public.categoria_imagen_campus;
DROP TABLE IF EXISTS public.campus;
DROP TABLE IF EXISTS public.aspirante;
DROP TABLE IF EXISTS public.asignatura_naturaleza;
DROP TABLE IF EXISTS public.asignatura;
DROP EXTENSION IF EXISTS pgcrypto;
--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asignatura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.asignatura (
    id bigint NOT NULL,
    departamento_id bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion text,
    estado character varying(30) DEFAULT 'ACTIVA'::character varying NOT NULL,
    fecha_creacion date DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT chk_asignatura_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVA'::character varying, 'INACTIVA'::character varying, 'HISTORICA'::character varying])::text[])))
);


--
-- Name: asignatura_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.asignatura ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asignatura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: asignatura_naturaleza; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.asignatura_naturaleza (
    asignatura_id bigint NOT NULL,
    naturaleza_id bigint NOT NULL
);


--
-- Name: aspirante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aspirante (
    id bigint NOT NULL,
    tipo_documento character varying(20) NOT NULL,
    numero_documento character varying(30) NOT NULL,
    nombres character varying(150) NOT NULL,
    apellidos character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    telefono character varying(30),
    fecha_nacimiento date,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado character varying(20) DEFAULT 'REGISTRADO'::character varying NOT NULL,
    CONSTRAINT chk_aspirante_estado CHECK (((estado)::text = ANY ((ARRAY['REGISTRADO'::character varying, 'VERIFICADO'::character varying, 'BLOQUEADO'::character varying])::text[])))
);


--
-- Name: aspirante_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.aspirante ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.aspirante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: campus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.campus (
    id bigint NOT NULL,
    universidad_id bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    nombre character varying(150) NOT NULL,
    direccion character varying(250),
    ciudad character varying(100) DEFAULT 'Cartagena'::character varying NOT NULL,
    descripcion text,
    estado character varying(20) DEFAULT 'ACTIVO'::character varying NOT NULL,
    es_sede_principal boolean DEFAULT false NOT NULL,
    orden integer DEFAULT 0 NOT NULL,
    url_mapa character varying(500),
    CONSTRAINT chk_campus_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVO'::character varying, 'INACTIVO'::character varying])::text[])))
);


--
-- Name: campus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.campus ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.campus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: categoria_imagen_campus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categoria_imagen_campus (
    id bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    nombre character varying(80) NOT NULL
);


--
-- Name: categoria_imagen_campus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.categoria_imagen_campus ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categoria_imagen_campus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: categoria_pregunta_evaluacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categoria_pregunta_evaluacion (
    id bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    nombre character varying(100) NOT NULL,
    orden integer DEFAULT 0 NOT NULL
);


--
-- Name: categoria_pregunta_evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.categoria_pregunta_evaluacion ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categoria_pregunta_evaluacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: concepto_pago; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.concepto_pago (
    id bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- Name: concepto_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.concepto_pago ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.concepto_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: departamento_academico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.departamento_academico (
    id bigint NOT NULL,
    facultad_id bigint NOT NULL,
    codigo character varying(20) NOT NULL,
    nombre character varying(150) NOT NULL,
    estado character varying(20) DEFAULT 'ACTIVO'::character varying NOT NULL,
    CONSTRAINT chk_departamento_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVO'::character varying, 'INACTIVO'::character varying])::text[])))
);


--
-- Name: departamento_academico_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.departamento_academico ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.departamento_academico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: docente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.docente (
    id bigint NOT NULL,
    numero_documento character varying(30) NOT NULL,
    nombres character varying(150) NOT NULL,
    apellidos character varying(150) NOT NULL,
    email character varying(150),
    estado character varying(20) DEFAULT 'ACTIVO'::character varying NOT NULL,
    sexo character varying(20),
    telefono character varying(30),
    direccion character varying(200),
    tipo_vinculacion character varying(30),
    escalafon character varying(30),
    nivel_formacion character varying(30),
    departamento_id bigint,
    fecha_ingreso date,
    CONSTRAINT chk_docente_escalafon CHECK (((escalafon IS NULL) OR ((escalafon)::text = ANY ((ARRAY['AUXILIAR'::character varying, 'ASISTENTE'::character varying, 'ASOCIADO'::character varying, 'TITULAR'::character varying])::text[])))),
    CONSTRAINT chk_docente_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVO'::character varying, 'INACTIVO'::character varying])::text[]))),
    CONSTRAINT chk_docente_formacion CHECK (((nivel_formacion IS NULL) OR ((nivel_formacion)::text = ANY ((ARRAY['PREGRADO'::character varying, 'ESPECIALIZACION'::character varying, 'MAESTRIA'::character varying, 'DOCTORADO'::character varying, 'POSTDOCTORADO'::character varying])::text[])))),
    CONSTRAINT chk_docente_sexo CHECK (((sexo IS NULL) OR ((sexo)::text = ANY ((ARRAY['MASCULINO'::character varying, 'FEMENINO'::character varying, 'OTRO'::character varying])::text[])))),
    CONSTRAINT chk_docente_vinculacion CHECK (((tipo_vinculacion IS NULL) OR ((tipo_vinculacion)::text = ANY ((ARRAY['PLANTA_TIEMPO_COMPLETO'::character varying, 'PLANTA_MEDIO_TIEMPO'::character varying, 'OCASIONAL'::character varying, 'CATEDRA'::character varying])::text[]))))
);


--
-- Name: docente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.docente ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.docente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: documento_aspirante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documento_aspirante (
    id bigint NOT NULL,
    inscripcion_id bigint NOT NULL,
    tipo_documento character varying(50) NOT NULL,
    url character varying(500) NOT NULL,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado character varying(20) DEFAULT 'CARGADO'::character varying NOT NULL,
    CONSTRAINT chk_documento_estado CHECK (((estado)::text = ANY ((ARRAY['CARGADO'::character varying, 'VALIDADO'::character varying, 'RECHAZADO'::character varying])::text[])))
);


--
-- Name: documento_aspirante_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.documento_aspirante ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.documento_aspirante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: encuesta_evaluacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.encuesta_evaluacion (
    id bigint NOT NULL,
    evaluacion_id bigint NOT NULL,
    fecha_respuesta timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estudiante_id bigint
);


--
-- Name: encuesta_evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.encuesta_evaluacion ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.encuesta_evaluacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: estudiante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estudiante (
    id bigint NOT NULL,
    numero_documento character varying(30) NOT NULL,
    nombres character varying(150) NOT NULL,
    apellidos character varying(150) NOT NULL,
    email character varying(150),
    estado character varying(20) DEFAULT 'ACTIVO'::character varying NOT NULL,
    codigo character varying(20),
    sexo character varying(20),
    telefono character varying(30),
    direccion character varying(200),
    programa_id bigint,
    semestre integer,
    estado_academico character varying(30) DEFAULT 'NORMAL'::character varying NOT NULL,
    estado_ingreso character varying(50) DEFAULT 'NO ESPECIFICA'::character varying NOT NULL,
    plan_estudios_id bigint,
    CONSTRAINT chk_estudiante_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVO'::character varying, 'INACTIVO'::character varying])::text[]))),
    CONSTRAINT chk_estudiante_estado_academico CHECK (((estado_academico)::text = ANY ((ARRAY['NORMAL'::character varying, 'RIESGO_ACADEMICO'::character varying, 'PRUEBA_ACADEMICA'::character varying, 'SUSPENDIDO'::character varying, 'EGRESADO'::character varying, 'RETIRADO'::character varying])::text[]))),
    CONSTRAINT chk_estudiante_semestre CHECK (((semestre IS NULL) OR ((semestre >= 1) AND (semestre <= 16)))),
    CONSTRAINT chk_estudiante_sexo CHECK (((sexo IS NULL) OR ((sexo)::text = ANY ((ARRAY['MASCULINO'::character varying, 'FEMENINO'::character varying, 'OTRO'::character varying])::text[]))))
);


--
-- Name: estudiante_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.estudiante ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.estudiante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: evaluacion_docente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evaluacion_docente (
    id bigint NOT NULL,
    docente_id bigint NOT NULL,
    asignatura_id bigint NOT NULL,
    programa_id bigint,
    grupo character varying(10) DEFAULT 'A1'::character varying NOT NULL,
    periodo character varying(20) NOT NULL,
    estudiantes_esperados integer,
    estado character varying(20) DEFAULT 'ABIERTA'::character varying NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT chk_evaluacion_esperados CHECK (((estudiantes_esperados IS NULL) OR (estudiantes_esperados > 0))),
    CONSTRAINT chk_evaluacion_estado CHECK (((estado)::text = ANY ((ARRAY['ABIERTA'::character varying, 'CERRADA'::character varying])::text[])))
);


--
-- Name: evaluacion_docente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.evaluacion_docente ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.evaluacion_docente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: factura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factura (
    id bigint NOT NULL,
    inscripcion_id bigint NOT NULL,
    concepto_pago_id bigint NOT NULL,
    moneda_id bigint NOT NULL,
    numero_factura character varying(30) NOT NULL,
    valor numeric(12,2) NOT NULL,
    fecha_emision timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_vencimiento timestamp without time zone,
    estado character varying(20) DEFAULT 'PENDIENTE'::character varying NOT NULL,
    CONSTRAINT chk_factura_estado CHECK (((estado)::text = ANY ((ARRAY['PENDIENTE'::character varying, 'PAGADA'::character varying, 'VENCIDA'::character varying, 'ANULADA'::character varying])::text[]))),
    CONSTRAINT chk_factura_valor CHECK ((valor > (0)::numeric))
);


--
-- Name: factura_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.factura ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.factura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: facultad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.facultad (
    id bigint NOT NULL,
    universidad_id bigint NOT NULL,
    codigo character varying(20) NOT NULL,
    nombre character varying(150) NOT NULL,
    fecha_creacion date DEFAULT CURRENT_DATE NOT NULL,
    estado character varying(20) DEFAULT 'ACTIVA'::character varying NOT NULL,
    CONSTRAINT chk_facultad_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVA'::character varying, 'INACTIVA'::character varying])::text[])))
);


--
-- Name: facultad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.facultad ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facultad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


--
-- Name: imagen_campus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.imagen_campus (
    id bigint NOT NULL,
    campus_id bigint NOT NULL,
    categoria_id bigint NOT NULL,
    url character varying(500) NOT NULL,
    descripcion character varying(200),
    orden integer DEFAULT 0 NOT NULL,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado character varying(20) DEFAULT 'ACTIVA'::character varying NOT NULL,
    CONSTRAINT chk_imagen_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVA'::character varying, 'INACTIVA'::character varying])::text[])))
);


--
-- Name: imagen_campus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.imagen_campus ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.imagen_campus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inscripcion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inscripcion (
    id bigint NOT NULL,
    aspirante_id bigint NOT NULL,
    oferta_admision_id bigint NOT NULL,
    fecha_inscripcion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado character varying(30) DEFAULT 'PENDIENTE_PAGO'::character varying NOT NULL,
    observaciones text,
    CONSTRAINT chk_inscripcion_estado CHECK (((estado)::text = ANY ((ARRAY['PENDIENTE_PAGO'::character varying, 'EN_REVISION'::character varying, 'ADMITIDO'::character varying, 'RECHAZADO'::character varying, 'MATRICULADO'::character varying])::text[])))
);


--
-- Name: inscripcion_evaluacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inscripcion_evaluacion (
    id bigint NOT NULL,
    evaluacion_id bigint NOT NULL,
    estudiante_id bigint NOT NULL,
    fecha_inscripcion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: inscripcion_evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.inscripcion_evaluacion ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.inscripcion_evaluacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.inscripcion ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.inscripcion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moneda; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moneda (
    id bigint NOT NULL,
    codigo_iso character varying(3) NOT NULL,
    nombre character varying(50) NOT NULL,
    simbolo character varying(5) NOT NULL
);


--
-- Name: moneda_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.moneda ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moneda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: naturaleza_asignatura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.naturaleza_asignatura (
    id bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255)
);


--
-- Name: naturaleza_asignatura_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.naturaleza_asignatura ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.naturaleza_asignatura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nivel_curricular; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nivel_curricular (
    id bigint NOT NULL,
    plan_estudios_id bigint NOT NULL,
    numero_nivel integer NOT NULL,
    nombre character varying(100),
    CONSTRAINT chk_nivel_numero CHECK ((numero_nivel > 0))
);


--
-- Name: nivel_curricular_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.nivel_curricular ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.nivel_curricular_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: oferta_admision; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oferta_admision (
    id bigint NOT NULL,
    periodo_admision_id bigint NOT NULL,
    programa_id bigint NOT NULL,
    plan_estudios_id bigint NOT NULL,
    campus_id bigint NOT NULL,
    cupos_totales integer NOT NULL,
    cupos_disponibles integer NOT NULL,
    valor_inscripcion numeric(12,2) NOT NULL,
    moneda_id bigint NOT NULL,
    estado character varying(20) DEFAULT 'ACTIVA'::character varying NOT NULL,
    CONSTRAINT chk_oferta_cupos CHECK (((cupos_disponibles >= 0) AND (cupos_disponibles <= cupos_totales))),
    CONSTRAINT chk_oferta_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVA'::character varying, 'AGOTADA'::character varying, 'CERRADA'::character varying])::text[])))
);


--
-- Name: oferta_admision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.oferta_admision ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.oferta_admision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: periodicidad_academica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.periodicidad_academica (
    id bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    nombre character varying(80) NOT NULL,
    duracion_meses integer NOT NULL,
    CONSTRAINT chk_periodicidad_duracion CHECK ((duracion_meses > 0))
);


--
-- Name: periodicidad_academica_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.periodicidad_academica ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.periodicidad_academica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: periodo_admision; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.periodo_admision (
    id bigint NOT NULL,
    codigo character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha_inicio_inscripciones date NOT NULL,
    fecha_fin_inscripciones date NOT NULL,
    fecha_inicio_clases date,
    estado character varying(20) DEFAULT 'PROGRAMADO'::character varying NOT NULL,
    CONSTRAINT chk_periodo_admision_estado CHECK (((estado)::text = ANY ((ARRAY['PROGRAMADO'::character varying, 'ABIERTO'::character varying, 'CERRADO'::character varying])::text[]))),
    CONSTRAINT chk_periodo_admision_fechas CHECK ((fecha_fin_inscripciones >= fecha_inicio_inscripciones))
);


--
-- Name: periodo_admision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.periodo_admision ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.periodo_admision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: plan_asignatura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan_asignatura (
    id bigint NOT NULL,
    plan_estudios_id bigint NOT NULL,
    asignatura_id bigint NOT NULL,
    nivel_curricular_id bigint NOT NULL,
    tipo_asignatura_id bigint NOT NULL,
    creditos numeric(5,2) NOT NULL,
    horas_docencia_semanales numeric(5,2) DEFAULT 0 NOT NULL,
    horas_trabajo_independiente numeric(5,2) DEFAULT 0 NOT NULL,
    es_habilitable boolean DEFAULT true NOT NULL,
    CONSTRAINT chk_horas_docencia CHECK ((horas_docencia_semanales >= (0)::numeric)),
    CONSTRAINT chk_horas_independiente CHECK ((horas_trabajo_independiente >= (0)::numeric)),
    CONSTRAINT chk_plan_asignatura_creditos CHECK ((creditos > (0)::numeric))
);


--
-- Name: plan_asignatura_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.plan_asignatura ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.plan_asignatura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: plan_estudios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan_estudios (
    id bigint NOT NULL,
    programa_id bigint NOT NULL,
    periodicidad_id bigint NOT NULL,
    codigo_pensum character varying(30) NOT NULL,
    nombre character varying(150),
    numero_resolucion character varying(50),
    fecha_aprobacion date,
    fecha_vigencia_desde date NOT NULL,
    fecha_vigencia_hasta date,
    total_creditos integer NOT NULL,
    estado character varying(30) DEFAULT 'EN_DISENO'::character varying NOT NULL,
    CONSTRAINT chk_plan_creditos CHECK ((total_creditos > 0)),
    CONSTRAINT chk_plan_estado CHECK (((estado)::text = ANY ((ARRAY['EN_DISENO'::character varying, 'APROBADO'::character varying, 'VIGENTE'::character varying, 'EN_EXTINCION'::character varying, 'HISTORICO'::character varying, 'CANCELADO'::character varying])::text[]))),
    CONSTRAINT chk_plan_fechas CHECK (((fecha_vigencia_hasta IS NULL) OR (fecha_vigencia_hasta >= fecha_vigencia_desde)))
);


--
-- Name: plan_estudios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.plan_estudios ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.plan_estudios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pregunta_evaluacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pregunta_evaluacion (
    id bigint NOT NULL,
    categoria_id bigint NOT NULL,
    numero integer NOT NULL,
    texto character varying(300) NOT NULL,
    estado character varying(20) DEFAULT 'ACTIVA'::character varying NOT NULL,
    tipo character varying(10) DEFAULT 'LIKERT'::character varying NOT NULL,
    CONSTRAINT chk_pregunta_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVA'::character varying, 'INACTIVA'::character varying])::text[]))),
    CONSTRAINT chk_pregunta_tipo CHECK (((tipo)::text = ANY ((ARRAY['LIKERT'::character varying, 'TEXTO'::character varying])::text[])))
);


--
-- Name: pregunta_evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pregunta_evaluacion ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pregunta_evaluacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: programa_academico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.programa_academico (
    id bigint NOT NULL,
    facultad_id bigint NOT NULL,
    codigo_interno character varying(30) NOT NULL,
    codigo_snies character varying(20),
    nombre character varying(200) NOT NULL,
    creditos_totales integer,
    estado character varying(30) DEFAULT 'ACTIVO'::character varying NOT NULL,
    fecha_creacion date DEFAULT CURRENT_DATE NOT NULL,
    CONSTRAINT chk_programa_creditos CHECK (((creditos_totales IS NULL) OR (creditos_totales > 0))),
    CONSTRAINT chk_programa_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVO'::character varying, 'EN_REGISTRO'::character varying, 'SUSPENDIDO'::character varying, 'INACTIVO'::character varying])::text[])))
);


--
-- Name: programa_academico_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.programa_academico ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.programa_academico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: programa_campus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.programa_campus (
    programa_id bigint NOT NULL,
    campus_id bigint NOT NULL,
    estado character varying(20) DEFAULT 'ACTIVO'::character varying NOT NULL
);


--
-- Name: requisito_plan_asignatura; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.requisito_plan_asignatura (
    id bigint NOT NULL,
    plan_estudios_id bigint NOT NULL,
    plan_asignatura_id bigint NOT NULL,
    plan_asignatura_requerida_id bigint NOT NULL,
    tipo_requisito_id bigint NOT NULL,
    CONSTRAINT chk_requisito_no_self CHECK ((plan_asignatura_id <> plan_asignatura_requerida_id))
);


--
-- Name: requisito_plan_asignatura_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.requisito_plan_asignatura ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.requisito_plan_asignatura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: respuesta_pregunta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.respuesta_pregunta (
    id bigint NOT NULL,
    encuesta_id bigint NOT NULL,
    pregunta_id bigint NOT NULL,
    valor integer,
    texto_respuesta text,
    sentimiento character varying(20),
    sentimiento_score double precision,
    sentimiento_metodo character varying(20),
    CONSTRAINT chk_respuesta_contenido CHECK (((valor IS NOT NULL) OR (texto_respuesta IS NOT NULL))),
    CONSTRAINT chk_respuesta_metodo CHECK (((sentimiento_metodo IS NULL) OR ((sentimiento_metodo)::text = ANY ((ARRAY['MODELO'::character varying, 'LEXICO'::character varying])::text[])))),
    CONSTRAINT chk_respuesta_sentimiento CHECK (((sentimiento IS NULL) OR ((sentimiento)::text = ANY ((ARRAY['POSITIVO'::character varying, 'NEGATIVO'::character varying, 'NEUTRO'::character varying])::text[])))),
    CONSTRAINT chk_respuesta_valor CHECK (((valor IS NULL) OR ((valor >= 1) AND (valor <= 5))))
);


--
-- Name: respuesta_pregunta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.respuesta_pregunta ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.respuesta_pregunta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sesion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sesion (
    id bigint NOT NULL,
    token character varying(80) NOT NULL,
    usuario_id bigint NOT NULL,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    expira_en timestamp with time zone NOT NULL
);


--
-- Name: sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sesion_id_seq OWNED BY public.sesion.id;


--
-- Name: tipo_asignatura_plan; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_asignatura_plan (
    id bigint NOT NULL,
    codigo character varying(40) NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- Name: tipo_asignatura_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tipo_asignatura_plan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_asignatura_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tipo_requisito; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_requisito (
    id bigint NOT NULL,
    codigo character varying(30) NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- Name: tipo_requisito_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tipo_requisito ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_requisito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: universidad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.universidad (
    id bigint NOT NULL,
    codigo character varying(20) NOT NULL,
    nombre character varying(200) NOT NULL,
    fecha_creacion date DEFAULT CURRENT_DATE NOT NULL,
    estado character varying(20) DEFAULT 'ACTIVA'::character varying NOT NULL,
    CONSTRAINT chk_universidad_estado CHECK (((estado)::text = ANY ((ARRAY['ACTIVA'::character varying, 'INACTIVA'::character varying])::text[])))
);


--
-- Name: universidad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.universidad ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.universidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    username character varying(60) NOT NULL,
    password_hash character varying(100) NOT NULL,
    rol character varying(20) NOT NULL,
    nombre_mostrar character varying(300) NOT NULL,
    estudiante_id bigint,
    docente_id bigint,
    estado character varying(20) DEFAULT 'ACTIVO'::character varying NOT NULL,
    ultimo_acceso timestamp with time zone,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT usuario_estado_check CHECK (((estado)::text = ANY ((ARRAY['ACTIVO'::character varying, 'INACTIVO'::character varying])::text[]))),
    CONSTRAINT usuario_rol_check CHECK (((rol)::text = ANY ((ARRAY['ADMIN'::character varying, 'ESTUDIANTE'::character varying, 'DOCENTE'::character varying])::text[])))
);


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: sesion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesion ALTER COLUMN id SET DEFAULT nextval('public.sesion_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: asignatura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.asignatura (id, departamento_id, codigo, nombre, descripcion, estado, fecha_creacion) FROM stdin;
1	1	EP1303	Interacción Humano Computador	Diseño de interfaces y usabilidad	ACTIVA	2026-10-23
2	1	2222123	Electiva Software Libre	Herramientas y cultura del software libre	ACTIVA	2026-10-23
3	1	EP1102	Programación II	Programación orientada a objetos en Java	ACTIVA	2026-10-23
4	1	EP2201	Bases de Datos	Modelado, SQL y normalización	ACTIVA	2026-10-23
5	1	EP1301	Ingeniería de Software I	Procesos, requisitos y modelos de ciclo de vida	ACTIVA	2026-10-23
6	1	EP2103	Redes de Computadores	Modelo OSI, TCP/IP y configuración de redes	ACTIVA	2026-10-23
\.


--
-- Data for Name: asignatura_naturaleza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.asignatura_naturaleza (asignatura_id, naturaleza_id) FROM stdin;
\.


--
-- Data for Name: aspirante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.aspirante (id, tipo_documento, numero_documento, nombres, apellidos, email, telefono, fecha_nacimiento, fecha_registro, estado) FROM stdin;
\.


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.campus (id, universidad_id, codigo, nombre, direccion, ciudad, descripcion, estado, es_sede_principal, orden, url_mapa) FROM stdin;
1	1	SAN_AGUSTIN	Claustro de San Agustín	Carrera 6 #36-100, Centro	Cartagena	Sede principal de la Universidad de Cartagena y espacio académico para programas de Ciencias Humanas y Sociales.	ACTIVO	t	1	http://localizacion.unicartagena.edu.co/
2	1	PIEDRA_BOLIVAR	Piedra de Bolívar	Calle 30 No. 48-152	Cartagena	Campus que alberga programas administrativos, ingenierías y diferentes facultades de la Universidad.	ACTIVO	f	2	http://localizacion.unicartagena.edu.co/
3	1	SAN_PABLO	Campus de San Pablo	Carrera 50 #24-120, Zaragocilla	Cartagena	Espacio para programas como Química, Física, Biología y Matemáticas, con laboratorios y áreas de investigación.	ACTIVO	f	3	http://localizacion.unicartagena.edu.co/
4	1	ZARAGOCILLA	Zaragocilla - Campus de la Salud	Campus de la Salud, Zaragocilla	Turbaco	Campus especializado para la formación en el área de la salud, con espacios médicos y laboratorios.	ACTIVO	f	4	http://localizacion.unicartagena.edu.co/
5	1	CLAUSTRO_MERCED	Claustro de La Merced	Carrera 4 #38-40, Centro	Cartagena	Espacio histórico ubicado en el Centro, donde funcionan unidades administrativas y programas de posgrado.	ACTIVO	f	5	http://localizacion.unicartagena.edu.co/
\.


--
-- Data for Name: categoria_imagen_campus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categoria_imagen_campus (id, codigo, nombre) FROM stdin;
1	FACHADA_SEDE	Fachada de la sede
2	ZONA_COMIDAS	Zona de comidas
3	LABORATORIO	Laboratorios
4	SALON	Salones
5	ZONA_BIENESTAR	Zona de bienestar
6	OTRO	Otro
7	PORTADA	Portada
\.


--
-- Data for Name: categoria_pregunta_evaluacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categoria_pregunta_evaluacion (id, codigo, nombre, orden) FROM stdin;
1	CONCEPTUAL	Conceptual	1
2	PEDAGOGICO	Pedagógico	2
3	RELACIONES	Relaciones	3
4	COMENTARIOS	Comentarios abiertos	4
\.


--
-- Data for Name: concepto_pago; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.concepto_pago (id, codigo, nombre) FROM stdin;
1	INSCRIPCION	Derecho de inscripción
2	MATRICULA	Derecho de matrícula
3	DERECHOS_GRADO	Derechos de grado
\.


--
-- Data for Name: departamento_academico; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.departamento_academico (id, facultad_id, codigo, nombre, estado) FROM stdin;
1	1	DCC	Departamento de Ciencias de la Computación	ACTIVO
\.


--
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.docente (id, numero_documento, nombres, apellidos, email, estado, sexo, telefono, direccion, tipo_vinculacion, escalafon, nivel_formacion, departamento_id, fecha_ingreso) FROM stdin;
1	10301274	GABRIEL ELIAS	CHANCHI GOLONDRINO	\N	ACTIVO	MASCULINO	3174501234	URBANIZACIÓN EL COUNTRY CALLE 12 #8-45	PLANTA_TIEMPO_COMPLETO	TITULAR	DOCTORADO	1	2015-02-01
2	72104567	MARIA FERNANDA	RUIZ CASTRO	mruiz@unicartagena.edu.co	ACTIVO	FEMENINO	3169874521	BARRIO MANGA CALLE 29 #20-11	PLANTA_TIEMPO_COMPLETO	ASOCIADO	MAESTRIA	1	2018-08-01
3	73098812	CARLOS ALBERTO	MENDOZA SIERRA	cmendoza@unicartagena.edu.co	ACTIVO	MASCULINO	3001239876	BARRIO CRESPO CALLE 72 #5-33	OCASIONAL	ASISTENTE	ESPECIALIZACION	1	2021-02-01
4	10304566	LUIS EDUARDO	PATERNINA CUELLO	lpaternina@unicartagena.edu.co	ACTIVO	MASCULINO	3155558901	BARRIO LA POPA CALLE 37 #4-19	CATEDRA	AUXILIAR	MAESTRIA	1	2023-02-01
\.


--
-- Data for Name: documento_aspirante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.documento_aspirante (id, inscripcion_id, tipo_documento, url, fecha_carga, estado) FROM stdin;
\.


--
-- Data for Name: encuesta_evaluacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.encuesta_evaluacion (id, evaluacion_id, fecha_respuesta, estudiante_id) FROM stdin;
1	1	2026-10-23 00:39:09.831523	1
2	1	2026-10-23 00:39:10.041583	2
3	1	2026-10-23 00:39:10.156883	3
4	1	2026-10-23 00:39:10.253122	4
5	1	2026-10-23 00:39:10.375134	5
6	1	2026-10-23 00:39:10.46662	6
7	1	2026-10-23 00:39:10.552339	8
8	1	2026-10-23 00:39:10.643225	10
9	1	2026-10-23 00:39:10.716794	11
10	1	2026-10-23 00:39:10.786777	12
11	1	2026-10-23 00:39:10.863041	13
12	1	2026-10-23 00:39:10.947091	14
13	1	2026-10-23 00:39:11.029939	15
14	1	2026-10-23 00:39:11.10552	16
15	1	2026-10-23 00:39:11.183423	17
16	1	2026-10-23 00:39:11.253214	18
17	1	2026-10-23 00:39:11.326348	20
18	2	2026-10-23 00:39:11.427698	16
19	2	2026-10-23 00:39:11.498595	17
20	2	2026-10-23 00:39:11.565656	20
21	2	2026-10-23 00:39:11.644989	21
22	2	2026-10-23 00:39:11.722684	22
23	2	2026-10-23 00:39:11.789718	23
24	2	2026-10-23 00:39:11.850452	24
25	2	2026-10-23 00:39:11.913093	26
26	2	2026-10-23 00:39:11.977402	27
27	2	2026-10-23 00:39:12.046687	28
28	2	2026-10-23 00:39:12.122071	29
29	2	2026-10-23 00:39:12.177436	31
30	2	2026-10-23 00:39:12.24962	32
31	2	2026-10-23 00:39:12.30136	33
32	2	2026-10-23 00:39:12.359836	34
33	2	2026-10-23 00:39:12.431277	36
34	2	2026-10-23 00:39:12.503717	37
35	2	2026-10-23 00:39:12.552684	38
36	3	2026-10-23 00:39:12.622118	21
37	3	2026-10-23 00:39:12.675529	22
38	3	2026-10-23 00:39:12.733607	23
39	3	2026-10-23 00:39:12.793154	26
40	3	2026-10-23 00:39:12.853964	27
41	3	2026-10-23 00:39:12.913436	29
42	3	2026-10-23 00:39:12.973613	30
43	3	2026-10-23 00:39:13.039777	31
44	3	2026-10-23 00:39:13.104738	32
45	3	2026-10-23 00:39:13.158719	33
46	3	2026-10-23 00:39:13.213022	34
47	3	2026-10-23 00:39:13.265666	35
48	3	2026-10-23 00:39:13.324618	36
49	3	2026-10-23 00:39:13.38391	37
50	3	2026-10-23 00:39:13.435858	39
51	3	2026-10-23 00:39:13.487296	40
52	3	2026-10-23 00:39:13.540477	42
53	3	2026-10-23 00:39:13.606356	43
54	3	2026-10-23 00:39:13.675122	44
55	3	2026-10-23 00:39:13.736896	46
56	3	2026-10-23 00:39:13.798206	48
57	3	2026-10-23 00:39:13.844294	49
58	3	2026-10-23 00:39:13.906719	50
59	4	2026-10-23 00:39:13.986242	5
60	4	2026-10-23 00:39:14.068635	6
61	4	2026-10-23 00:39:14.168778	7
62	4	2026-10-23 00:39:14.240194	9
63	4	2026-10-23 00:39:14.29801	10
64	4	2026-10-23 00:39:14.381701	11
65	4	2026-10-23 00:39:14.434647	12
66	4	2026-10-23 00:39:14.483379	13
67	4	2026-10-23 00:39:14.536613	14
68	4	2026-10-23 00:39:14.580704	16
69	4	2026-10-23 00:39:14.62234	17
70	4	2026-10-23 00:39:14.679453	19
71	4	2026-10-23 00:39:14.742525	20
72	4	2026-10-23 00:39:14.802482	21
73	4	2026-10-23 00:39:14.846183	22
74	4	2026-10-23 00:39:14.897962	23
75	4	2026-10-23 00:39:14.943198	25
76	4	2026-10-23 00:39:14.984841	26
77	4	2026-10-23 00:39:15.02941	27
78	4	2026-10-23 00:39:15.071319	28
79	5	2026-10-23 00:39:15.130143	32
80	5	2026-10-23 00:39:15.188985	34
81	5	2026-10-23 00:39:15.234047	35
82	5	2026-10-23 00:39:15.297622	36
83	5	2026-10-23 00:39:15.343415	37
84	5	2026-10-23 00:39:15.383002	40
85	5	2026-10-23 00:39:15.440054	41
86	5	2026-10-23 00:39:15.501995	42
87	5	2026-10-23 00:39:15.564175	44
88	5	2026-10-23 00:39:15.605712	45
89	5	2026-10-23 00:39:15.659391	46
90	5	2026-10-23 00:39:15.710981	47
91	5	2026-10-23 00:39:15.765918	48
92	5	2026-10-23 00:39:15.832829	50
93	1	2026-10-23 00:47:26.48196	7
94	1	2026-10-23 00:47:26.625379	9
95	1	2026-10-23 00:47:26.699903	19
96	2	2026-10-23 00:47:26.980889	15
97	2	2026-10-23 00:47:27.059356	18
98	2	2026-10-23 00:47:27.134139	19
99	2	2026-10-23 00:47:27.204876	25
100	2	2026-10-23 00:47:27.286085	30
101	2	2026-10-23 00:47:27.356381	35
102	2	2026-10-23 00:47:27.425492	39
103	3	2026-10-23 00:47:27.656312	24
104	3	2026-10-23 00:47:27.734976	25
105	3	2026-10-23 00:47:27.816384	28
106	3	2026-10-23 00:47:27.877067	38
107	3	2026-10-23 00:47:27.941094	41
108	3	2026-10-23 00:47:28.026022	45
109	3	2026-10-23 00:47:28.092326	47
110	4	2026-10-23 00:47:28.292632	8
111	4	2026-10-23 00:47:28.350444	15
112	4	2026-10-23 00:47:28.40887	18
113	4	2026-10-23 00:47:28.467184	24
114	4	2026-10-23 00:47:28.542429	29
115	5	2026-10-23 00:47:28.725677	31
116	5	2026-10-23 00:47:28.803247	33
117	5	2026-10-23 00:47:28.893837	38
118	5	2026-10-23 00:47:28.998849	39
119	5	2026-10-23 00:47:29.08042	43
120	5	2026-10-23 00:47:29.154893	49
\.


--
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.estudiante (id, numero_documento, nombres, apellidos, email, estado, codigo, sexo, telefono, direccion, programa_id, semestre, estado_academico, estado_ingreso, plan_estudios_id) FROM stdin;
1	10000001	MARIA JOSE	RODRIGUEZ LOPEZ DIAZ	mrodriguez1@unicartagena.edu.co	ACTIVO	0222400001	MASCULINO	3107825428	CALLE 30 #15-42 BARRIO MANGA	1	2	NORMAL	NO ESPECIFICA	1
2	10000002	ANDRES FELIPE	MARTINEZ DIAZ SUAREZ	amartinez2@unicartagena.edu.co	ACTIVO	0222400002	FEMENINO	3115650856	CRA 4 #33-21 GETSEMANI	1	3	NORMAL	NO ESPECIFICA	1
3	10000003	LAURA VALENTINA	GARCIA HERNANDEZ RODRIGUEZ	lgarcia3@unicartagena.edu.co	ACTIVO	0222400003	MASCULINO	3123476284	AV. PEDRO DE HEREDIA #50-12	1	4	NORMAL	NO ESPECIFICA	1
4	10000004	CARLOS ANDRES	LOPEZ SANCHEZ RAMIREZ	clopez4@unicartagena.edu.co	ACTIVO	0222400004	FEMENINO	3131301712	CALLE REAL DEL CABRERO #41-35	1	5	NORMAL	NO ESPECIFICA	1
5	10000005	ANA MARIA	GONZALEZ RAMIREZ MORENO	agonzalez5@unicartagena.edu.co	ACTIVO	0222400005	MASCULINO	3139127140	BARRIO EL BOSQUE CALLE 60 #10-22	1	6	NORMAL	NO ESPECIFICA	\N
6	10000006	LUIS MIGUEL	HERNANDEZ TORRES MARTINEZ	lhernandez6@unicartagena.edu.co	ACTIVO	0222400006	FEMENINO	3146952568	TRANSVERSAL 54 #30-18 LOZANO	1	7	NORMAL	NO ESPECIFICA	1
7	10000007	CAMILA	DIAZ CASTRO CASTRO	cdiaz7@unicartagena.edu.co	ACTIVO	0222400007	MASCULINO	3154777996	CALLE 25 #18-7 CENTRO	1	8	NORMAL	NO ESPECIFICA	1
8	10000008	DIEGO ALEJANDRO	RAMIREZ VARGAS ACOSTA	dramirez8@unicartagena.edu.co	ACTIVO	0222400008	FEMENINO	3162603424	DIAGONAL 21 #45-60 ZARAGOZA	1	9	NORMAL	NO ESPECIFICA	1
9	10000009	VALENTINA	CASTRO ORTIZ GARCIA	vcastro9@unicartagena.edu.co	ACTIVO	0222400009	MASCULINO	3170428852	BARRIO OLAYA CALLE 28 #24-15	1	10	NORMAL	NO ESPECIFICA	1
10	10000010	SEBASTIAN	TORRES MORENO TORRES	storres10@unicartagena.edu.co	ACTIVO	0222400010	FEMENINO	3178254280	MANZANA Ñ LOTE 20 PRIMER PISO	1	1	NORMAL	NO ESPECIFICA	\N
11	10000011	ISABELLA	VARGAS CORTES ROJAS	ivargas11@unicartagena.edu.co	ACTIVO	0222400011	MASCULINO	3186079708	CALLE 30 #15-42 BARRIO MANGA	1	2	NORMAL	NO ESPECIFICA	1
12	10000012	MATEO	ORTIZ SUAREZ LOPEZ	mortiz12@unicartagena.edu.co	ACTIVO	0222400012	FEMENINO	3193905136	CRA 4 #33-21 GETSEMANI	1	3	NORMAL	NO ESPECIFICA	1
13	10000013	SOFIA	CORTES ACOSTA VARGAS	scortes13@unicartagena.edu.co	ACTIVO	0222400013	MASCULINO	3101730564	AV. PEDRO DE HEREDIA #50-12	1	4	NORMAL	NO ESPECIFICA	1
14	10000014	NICOLAS	SUAREZ MEJIA MEJIA	nsuarez14@unicartagena.edu.co	ACTIVO	0222400014	FEMENINO	3109555992	CALLE REAL DEL CABRERO #41-35	1	5	NORMAL	NO ESPECIFICA	1
15	10000015	MARIA FERNANDA	MORENO ROJAS GONZALEZ	mmoreno15@unicartagena.edu.co	ACTIVO	0222400015	MASCULINO	3117381420	BARRIO EL BOSQUE CALLE 60 #10-22	1	6	NORMAL	NO ESPECIFICA	\N
16	10000016	SANTIAGO	ACOSTA PALACIOS ORTIZ	sacosta16@unicartagena.edu.co	ACTIVO	0222400016	FEMENINO	3125206848	TRANSVERSAL 54 #30-18 LOZANO	1	7	NORMAL	NO ESPECIFICA	1
17	10000017	GABRIELA	ROJAS QUINTERO QUINTERO	grojas17@unicartagena.edu.co	ACTIVO	0222400017	MASCULINO	3133032276	CALLE 25 #18-7 CENTRO	1	8	NORMAL	NO ESPECIFICA	1
18	10000018	DANIEL	MEJIA ARANGO HERNANDEZ	dmejia18@unicartagena.edu.co	ACTIVO	0222400018	FEMENINO	3140857704	DIAGONAL 21 #45-60 ZARAGOZA	1	9	NORMAL	NO ESPECIFICA	1
19	10000019	PAULA	QUINTERO SOTO CORTES	pquintero19@unicartagena.edu.co	ACTIVO	0222400019	MASCULINO	3148683132	BARRIO OLAYA CALLE 28 #24-15	1	10	NORMAL	NO ESPECIFICA	1
20	10000020	KEVIN	PEREZ GOMEZ PEREZ	kperez20@unicartagena.edu.co	ACTIVO	0222400020	FEMENINO	3156508560	MANZANA Ñ LOTE 20 PRIMER PISO	1	1	NORMAL	NO ESPECIFICA	\N
21	10000021	MANUELA	RODRIGUEZ LOPEZ DIAZ	mrodriguez21@unicartagena.edu.co	ACTIVO	0222400021	MASCULINO	3164333988	CALLE 30 #15-42 BARRIO MANGA	1	2	NORMAL	NO ESPECIFICA	1
22	10000022	ESTEBAN	MARTINEZ DIAZ SUAREZ	emartinez22@unicartagena.edu.co	ACTIVO	0222400022	FEMENINO	3172159416	CRA 4 #33-21 GETSEMANI	1	3	NORMAL	NO ESPECIFICA	1
23	10000023	JULIANA	GARCIA HERNANDEZ RODRIGUEZ	jgarcia23@unicartagena.edu.co	ACTIVO	0222400023	MASCULINO	3179984844	AV. PEDRO DE HEREDIA #50-12	1	4	NORMAL	NO ESPECIFICA	1
24	10000024	OSCAR	LOPEZ SANCHEZ RAMIREZ	olopez24@unicartagena.edu.co	ACTIVO	0222400024	FEMENINO	3187810272	CALLE REAL DEL CABRERO #41-35	1	5	NORMAL	NO ESPECIFICA	1
25	10000025	JUAN CAMILO	GONZALEZ RAMIREZ MORENO	jgonzalez25@unicartagena.edu.co	ACTIVO	0222400025	MASCULINO	3195635700	BARRIO EL BOSQUE CALLE 60 #10-22	1	6	NORMAL	NO ESPECIFICA	\N
26	10000026	MARIA JOSE	HERNANDEZ TORRES MARTINEZ	mhernandez26@unicartagena.edu.co	ACTIVO	0222400026	FEMENINO	3103461128	TRANSVERSAL 54 #30-18 LOZANO	1	7	NORMAL	NO ESPECIFICA	1
27	10000027	ANDRES FELIPE	DIAZ CASTRO CASTRO	adiaz27@unicartagena.edu.co	ACTIVO	0222400027	MASCULINO	3111286556	CALLE 25 #18-7 CENTRO	1	8	NORMAL	NO ESPECIFICA	1
28	10000028	LAURA VALENTINA	RAMIREZ VARGAS ACOSTA	lramirez28@unicartagena.edu.co	ACTIVO	0222400028	FEMENINO	3119111984	DIAGONAL 21 #45-60 ZARAGOZA	1	9	NORMAL	NO ESPECIFICA	1
29	10000029	CARLOS ANDRES	CASTRO ORTIZ GARCIA	ccastro29@unicartagena.edu.co	ACTIVO	0222400029	MASCULINO	3126937412	BARRIO OLAYA CALLE 28 #24-15	1	10	NORMAL	NO ESPECIFICA	1
30	10000030	ANA MARIA	TORRES MORENO TORRES	atorres30@unicartagena.edu.co	ACTIVO	0222400030	FEMENINO	3134762840	MANZANA Ñ LOTE 20 PRIMER PISO	1	1	NORMAL	NO ESPECIFICA	\N
31	10000031	LUIS MIGUEL	VARGAS CORTES ROJAS	lvargas31@unicartagena.edu.co	ACTIVO	0222400031	MASCULINO	3142588268	CALLE 30 #15-42 BARRIO MANGA	1	2	NORMAL	NO ESPECIFICA	1
32	10000032	CAMILA	ORTIZ SUAREZ LOPEZ	cortiz32@unicartagena.edu.co	ACTIVO	0222400032	FEMENINO	3150413696	CRA 4 #33-21 GETSEMANI	1	3	NORMAL	NO ESPECIFICA	1
33	10000033	DIEGO ALEJANDRO	CORTES ACOSTA VARGAS	dcortes33@unicartagena.edu.co	ACTIVO	0222400033	MASCULINO	3158239124	AV. PEDRO DE HEREDIA #50-12	1	4	NORMAL	NO ESPECIFICA	1
34	10000034	VALENTINA	SUAREZ MEJIA MEJIA	vsuarez34@unicartagena.edu.co	ACTIVO	0222400034	FEMENINO	3166064552	CALLE REAL DEL CABRERO #41-35	1	5	NORMAL	NO ESPECIFICA	1
35	10000035	SEBASTIAN	MORENO ROJAS GONZALEZ	smoreno35@unicartagena.edu.co	ACTIVO	0222400035	MASCULINO	3173889980	BARRIO EL BOSQUE CALLE 60 #10-22	1	6	NORMAL	NO ESPECIFICA	\N
36	10000036	ISABELLA	ACOSTA PALACIOS ORTIZ	iacosta36@unicartagena.edu.co	ACTIVO	0222400036	FEMENINO	3181715408	TRANSVERSAL 54 #30-18 LOZANO	1	7	NORMAL	NO ESPECIFICA	1
37	10000037	MATEO	ROJAS QUINTERO QUINTERO	mrojas37@unicartagena.edu.co	ACTIVO	0222400037	MASCULINO	3189540836	CALLE 25 #18-7 CENTRO	1	8	NORMAL	NO ESPECIFICA	1
38	10000038	SOFIA	MEJIA ARANGO HERNANDEZ	smejia38@unicartagena.edu.co	ACTIVO	0222400038	FEMENINO	3197366264	DIAGONAL 21 #45-60 ZARAGOZA	1	9	NORMAL	NO ESPECIFICA	1
39	10000039	NICOLAS	QUINTERO SOTO CORTES	nquintero39@unicartagena.edu.co	ACTIVO	0222400039	MASCULINO	3105191692	BARRIO OLAYA CALLE 28 #24-15	1	10	NORMAL	NO ESPECIFICA	1
40	10000040	MARIA FERNANDA	PEREZ GOMEZ PEREZ	mperez40@unicartagena.edu.co	ACTIVO	0222400040	FEMENINO	3113017120	MANZANA Ñ LOTE 20 PRIMER PISO	1	1	NORMAL	NO ESPECIFICA	\N
41	10000041	SANTIAGO	RODRIGUEZ LOPEZ DIAZ	srodriguez41@unicartagena.edu.co	ACTIVO	0222400041	MASCULINO	3120842548	CALLE 30 #15-42 BARRIO MANGA	1	2	NORMAL	NO ESPECIFICA	1
42	10000042	GABRIELA	MARTINEZ DIAZ SUAREZ	gmartinez42@unicartagena.edu.co	ACTIVO	0222400042	FEMENINO	3128667976	CRA 4 #33-21 GETSEMANI	1	3	NORMAL	NO ESPECIFICA	1
43	10000043	DANIEL	GARCIA HERNANDEZ RODRIGUEZ	dgarcia43@unicartagena.edu.co	ACTIVO	0222400043	MASCULINO	3136493404	AV. PEDRO DE HEREDIA #50-12	1	4	NORMAL	NO ESPECIFICA	1
44	10000044	PAULA	LOPEZ SANCHEZ RAMIREZ	plopez44@unicartagena.edu.co	ACTIVO	0222400044	FEMENINO	3144318832	CALLE REAL DEL CABRERO #41-35	1	5	NORMAL	NO ESPECIFICA	1
45	10000045	KEVIN	GONZALEZ RAMIREZ MORENO	kgonzalez45@unicartagena.edu.co	ACTIVO	0222400045	MASCULINO	3152144260	BARRIO EL BOSQUE CALLE 60 #10-22	1	6	NORMAL	NO ESPECIFICA	\N
46	10000046	MANUELA	HERNANDEZ TORRES MARTINEZ	mhernandez46@unicartagena.edu.co	ACTIVO	0222400046	FEMENINO	3159969688	TRANSVERSAL 54 #30-18 LOZANO	1	7	NORMAL	NO ESPECIFICA	1
47	10000047	ESTEBAN	DIAZ CASTRO CASTRO	ediaz47@unicartagena.edu.co	ACTIVO	0222400047	MASCULINO	3167795116	CALLE 25 #18-7 CENTRO	1	8	NORMAL	NO ESPECIFICA	1
48	10000048	JULIANA	RAMIREZ VARGAS ACOSTA	jramirez48@unicartagena.edu.co	ACTIVO	0222400048	FEMENINO	3175620544	DIAGONAL 21 #45-60 ZARAGOZA	1	9	NORMAL	NO ESPECIFICA	1
49	10000049	OSCAR	CASTRO ORTIZ GARCIA	ocastro49@unicartagena.edu.co	ACTIVO	0222400049	MASCULINO	3183445972	BARRIO OLAYA CALLE 28 #24-15	1	10	NORMAL	NO ESPECIFICA	1
50	10000050	JUAN CAMILO	TORRES MORENO TORRES	jtorres50@unicartagena.edu.co	ACTIVO	0222400050	FEMENINO	3191271400	MANZANA Ñ LOTE 20 PRIMER PISO	1	1	NORMAL	NO ESPECIFICA	\N
\.


--
-- Data for Name: evaluacion_docente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.evaluacion_docente (id, docente_id, asignatura_id, programa_id, grupo, periodo, estudiantes_esperados, estado, fecha_creacion) FROM stdin;
1	1	1	1	A1	2025-1	20	ABIERTA	2026-10-23 00:35:44.635934
2	1	2	1	A1	2025-1	25	ABIERTA	2026-10-23 00:35:44.635934
3	2	4	1	B1	2025-1	30	ABIERTA	2026-10-23 00:35:44.635934
4	3	3	1	A2	2025-1	25	ABIERTA	2026-10-23 00:35:44.635934
5	4	6	1	A1	2025-1	20	ABIERTA	2026-10-23 00:35:44.635934
6	3	5	1	B2	2025-2	10	ABIERTA	2026-10-23 01:27:53.681217
\.


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.factura (id, inscripcion_id, concepto_pago_id, moneda_id, numero_factura, valor, fecha_emision, fecha_vencimiento, estado) FROM stdin;
\.


--
-- Data for Name: facultad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.facultad (id, universidad_id, codigo, nombre, fecha_creacion, estado) FROM stdin;
1	1	FI	Facultad de Ingeniería	2026-10-23	ACTIVA
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	create schema	SQL	V1__create_schema.sql	-1059270586	academicore	2026-09-07 22:47:53.721467	509	t
2	2	create campus admisiones facturacion	SQL	V2__create_campus_admisiones_facturacion.sql	-1644589789	academicore	2026-09-07 22:47:54.368477	382	t
3	3	campus campos nuevos seed	SQL	V3__campus_campos_nuevos_seed.sql	800082592	academicore	2026-09-07 23:34:27.272928	98	t
4	4	campus seed imagenes	SQL	V4__campus_seed_imagenes.sql	-244818116	academicore	2026-09-07 23:46:51.938657	73	t
5	5	evaluacion docente	SQL	V5__evaluacion_docente.sql	341710004	academicore	2026-10-22 23:18:00.460353	2366	t
6	6	evaluacion preguntas crud y texto	SQL	V6__evaluacion_preguntas_crud_y_texto.sql	842463465	academicore	2026-10-22 23:18:03.690794	250	t
7	7	respuesta sentimiento score double	SQL	V7__respuesta_sentimiento_score_double.sql	1849423575	academicore	2026-10-22 23:24:01.421775	537	t
8	8	respuesta valor integer	SQL	V8__respuesta_valor_integer.sql	-234138541	academicore	2026-10-22 23:25:47.869255	243	t
9	9	estudiantes inscripciones seed demo	SQL	V9__estudiantes_inscripciones_seed_demo.sql	-8144190	academicore	2026-10-23 00:35:44.373865	457	t
10	10	ficha sia estudiante docente	SQL	V10__ficha_sia_estudiante_docente.sql	-2088700377	academicore	2026-10-23 00:46:42.250114	478	t
11	11	usuarios sesiones auth	SQL	V11__usuarios_sesiones_auth.sql	1121539662	academicore	2026-10-23 01:24:09.219369	3345	t
\.


--
-- Data for Name: imagen_campus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.imagen_campus (id, campus_id, categoria_id, url, descripcion, orden, fecha_carga, estado) FROM stdin;
1	1	7	https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/1/portada.jpeg	Portada - Claustro de San Agustín	1	2026-09-07 23:46:52.00814	ACTIVA
2	2	7	https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/2/portada.jpg	Portada - Piedra de Bolívar	1	2026-09-07 23:46:52.00814	ACTIVA
3	3	7	https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/3/portada.jpeg	Portada - Campus de San Pablo	1	2026-09-07 23:46:52.00814	ACTIVA
4	4	7	https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/4/portada.jpg	Portada - Zaragocilla Campus de la Salud	1	2026-09-07 23:46:52.00814	ACTIVA
5	5	7	https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/5/portada.jpeg	Portada - Claustro de La Merced	1	2026-09-07 23:46:52.00814	ACTIVA
\.


--
-- Data for Name: inscripcion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inscripcion (id, aspirante_id, oferta_admision_id, fecha_inscripcion, estado, observaciones) FROM stdin;
\.


--
-- Data for Name: inscripcion_evaluacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inscripcion_evaluacion (id, evaluacion_id, estudiante_id, fecha_inscripcion) FROM stdin;
1	1	1	2026-10-23 00:35:44.635934
2	1	2	2026-10-23 00:35:44.635934
3	1	3	2026-10-23 00:35:44.635934
4	1	4	2026-10-23 00:35:44.635934
5	1	5	2026-10-23 00:35:44.635934
6	1	6	2026-10-23 00:35:44.635934
7	1	7	2026-10-23 00:35:44.635934
8	1	8	2026-10-23 00:35:44.635934
9	1	9	2026-10-23 00:35:44.635934
10	1	10	2026-10-23 00:35:44.635934
11	1	11	2026-10-23 00:35:44.635934
12	1	12	2026-10-23 00:35:44.635934
13	1	13	2026-10-23 00:35:44.635934
14	1	14	2026-10-23 00:35:44.635934
15	1	15	2026-10-23 00:35:44.635934
16	1	16	2026-10-23 00:35:44.635934
17	1	17	2026-10-23 00:35:44.635934
18	1	18	2026-10-23 00:35:44.635934
19	1	19	2026-10-23 00:35:44.635934
20	1	20	2026-10-23 00:35:44.635934
21	2	15	2026-10-23 00:35:44.635934
22	2	16	2026-10-23 00:35:44.635934
23	2	17	2026-10-23 00:35:44.635934
24	2	18	2026-10-23 00:35:44.635934
25	2	19	2026-10-23 00:35:44.635934
26	2	20	2026-10-23 00:35:44.635934
27	2	21	2026-10-23 00:35:44.635934
28	2	22	2026-10-23 00:35:44.635934
29	2	23	2026-10-23 00:35:44.635934
30	2	24	2026-10-23 00:35:44.635934
31	2	25	2026-10-23 00:35:44.635934
32	2	26	2026-10-23 00:35:44.635934
33	2	27	2026-10-23 00:35:44.635934
34	2	28	2026-10-23 00:35:44.635934
35	2	29	2026-10-23 00:35:44.635934
36	2	30	2026-10-23 00:35:44.635934
37	2	31	2026-10-23 00:35:44.635934
38	2	32	2026-10-23 00:35:44.635934
39	2	33	2026-10-23 00:35:44.635934
40	2	34	2026-10-23 00:35:44.635934
41	2	35	2026-10-23 00:35:44.635934
42	2	36	2026-10-23 00:35:44.635934
43	2	37	2026-10-23 00:35:44.635934
44	2	38	2026-10-23 00:35:44.635934
45	2	39	2026-10-23 00:35:44.635934
46	3	21	2026-10-23 00:35:44.635934
47	3	22	2026-10-23 00:35:44.635934
48	3	23	2026-10-23 00:35:44.635934
49	3	24	2026-10-23 00:35:44.635934
50	3	25	2026-10-23 00:35:44.635934
51	3	26	2026-10-23 00:35:44.635934
52	3	27	2026-10-23 00:35:44.635934
53	3	28	2026-10-23 00:35:44.635934
54	3	29	2026-10-23 00:35:44.635934
55	3	30	2026-10-23 00:35:44.635934
56	3	31	2026-10-23 00:35:44.635934
57	3	32	2026-10-23 00:35:44.635934
58	3	33	2026-10-23 00:35:44.635934
59	3	34	2026-10-23 00:35:44.635934
60	3	35	2026-10-23 00:35:44.635934
61	3	36	2026-10-23 00:35:44.635934
62	3	37	2026-10-23 00:35:44.635934
63	3	38	2026-10-23 00:35:44.635934
64	3	39	2026-10-23 00:35:44.635934
65	3	40	2026-10-23 00:35:44.635934
66	3	41	2026-10-23 00:35:44.635934
67	3	42	2026-10-23 00:35:44.635934
68	3	43	2026-10-23 00:35:44.635934
69	3	44	2026-10-23 00:35:44.635934
70	3	45	2026-10-23 00:35:44.635934
71	3	46	2026-10-23 00:35:44.635934
72	3	47	2026-10-23 00:35:44.635934
73	3	48	2026-10-23 00:35:44.635934
74	3	49	2026-10-23 00:35:44.635934
75	3	50	2026-10-23 00:35:44.635934
76	4	5	2026-10-23 00:35:44.635934
77	4	6	2026-10-23 00:35:44.635934
78	4	7	2026-10-23 00:35:44.635934
79	4	8	2026-10-23 00:35:44.635934
80	4	9	2026-10-23 00:35:44.635934
81	4	10	2026-10-23 00:35:44.635934
82	4	11	2026-10-23 00:35:44.635934
83	4	12	2026-10-23 00:35:44.635934
84	4	13	2026-10-23 00:35:44.635934
85	4	14	2026-10-23 00:35:44.635934
86	4	15	2026-10-23 00:35:44.635934
87	4	16	2026-10-23 00:35:44.635934
88	4	17	2026-10-23 00:35:44.635934
89	4	18	2026-10-23 00:35:44.635934
90	4	19	2026-10-23 00:35:44.635934
91	4	20	2026-10-23 00:35:44.635934
92	4	21	2026-10-23 00:35:44.635934
93	4	22	2026-10-23 00:35:44.635934
94	4	23	2026-10-23 00:35:44.635934
95	4	24	2026-10-23 00:35:44.635934
96	4	25	2026-10-23 00:35:44.635934
97	4	26	2026-10-23 00:35:44.635934
98	4	27	2026-10-23 00:35:44.635934
99	4	28	2026-10-23 00:35:44.635934
100	4	29	2026-10-23 00:35:44.635934
101	5	31	2026-10-23 00:35:44.635934
102	5	32	2026-10-23 00:35:44.635934
103	5	33	2026-10-23 00:35:44.635934
104	5	34	2026-10-23 00:35:44.635934
105	5	35	2026-10-23 00:35:44.635934
106	5	36	2026-10-23 00:35:44.635934
107	5	37	2026-10-23 00:35:44.635934
108	5	38	2026-10-23 00:35:44.635934
109	5	39	2026-10-23 00:35:44.635934
110	5	40	2026-10-23 00:35:44.635934
111	5	41	2026-10-23 00:35:44.635934
112	5	42	2026-10-23 00:35:44.635934
113	5	43	2026-10-23 00:35:44.635934
114	5	44	2026-10-23 00:35:44.635934
115	5	45	2026-10-23 00:35:44.635934
116	5	46	2026-10-23 00:35:44.635934
117	5	47	2026-10-23 00:35:44.635934
118	5	48	2026-10-23 00:35:44.635934
119	5	49	2026-10-23 00:35:44.635934
120	5	50	2026-10-23 00:35:44.635934
121	6	41	2026-10-23 01:27:53.699114
122	6	42	2026-10-23 01:27:53.699114
123	6	43	2026-10-23 01:27:53.699114
124	6	44	2026-10-23 01:27:53.699114
125	6	45	2026-10-23 01:27:53.699114
126	6	46	2026-10-23 01:27:53.699114
127	6	47	2026-10-23 01:27:53.699114
128	6	48	2026-10-23 01:27:53.699114
129	6	49	2026-10-23 01:27:53.699114
130	6	50	2026-10-23 01:27:53.699114
\.


--
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moneda (id, codigo_iso, nombre, simbolo) FROM stdin;
1	COP	Peso colombiano	$
2	USD	Dólar estadounidense	US$
\.


--
-- Data for Name: naturaleza_asignatura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.naturaleza_asignatura (id, codigo, nombre, descripcion) FROM stdin;
1	TEORICA	Teórica	Asignatura de carácter teórico
2	PRACTICA	Práctica	Asignatura de carácter práctico
3	TEORICO_PRACTICA	Teórico-Práctica	Asignatura con componente teórico y práctico
4	VIRTUAL	Virtual	Asignatura desarrollada en modalidad virtual
5	MIXTA	Mixta	Asignatura con componentes presenciales y virtuales
6	LABORATORIO	Laboratorio	Asignatura de laboratorio puro
\.


--
-- Data for Name: nivel_curricular; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nivel_curricular (id, plan_estudios_id, numero_nivel, nombre) FROM stdin;
\.


--
-- Data for Name: oferta_admision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.oferta_admision (id, periodo_admision_id, programa_id, plan_estudios_id, campus_id, cupos_totales, cupos_disponibles, valor_inscripcion, moneda_id, estado) FROM stdin;
\.


--
-- Data for Name: periodicidad_academica; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.periodicidad_academica (id, codigo, nombre, duracion_meses) FROM stdin;
1	SEMESTRAL	Semestral	6
2	CUATRIMESTRAL	Cuatrimestral	4
3	TRIMESTRAL	Trimestral	3
4	ANUAL	Anual	12
\.


--
-- Data for Name: periodo_admision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.periodo_admision (id, codigo, nombre, fecha_inicio_inscripciones, fecha_fin_inscripciones, fecha_inicio_clases, estado) FROM stdin;
\.


--
-- Data for Name: plan_asignatura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.plan_asignatura (id, plan_estudios_id, asignatura_id, nivel_curricular_id, tipo_asignatura_id, creditos, horas_docencia_semanales, horas_trabajo_independiente, es_habilitable) FROM stdin;
\.


--
-- Data for Name: plan_estudios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.plan_estudios (id, programa_id, periodicidad_id, codigo_pensum, nombre, numero_resolucion, fecha_aprobacion, fecha_vigencia_desde, fecha_vigencia_hasta, total_creditos, estado) FROM stdin;
1	1	1	P2010	Reforma Pénsum 2010	\N	\N	2010-01-01	\N	160	VIGENTE
\.


--
-- Data for Name: pregunta_evaluacion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pregunta_evaluacion (id, categoria_id, numero, texto, estado, tipo) FROM stdin;
1	1	1	¿El docente articula los contenidos del curso o asignatura, con otras asignaturas?	ACTIVA	LIKERT
2	1	2	¿El docente cumple con el sistema de evaluación establecido en el proyecto docente?	ACTIVA	LIKERT
3	1	3	¿El docente desarrolla todos los contenidos propuestos en el proyecto docente?	ACTIVA	LIKERT
4	1	4	¿El docente utiliza los resultados de la evaluación, para reorientar los procesos de enseñanza-aprendizaje?	ACTIVA	LIKERT
5	1	5	¿El docente utiliza parámetros para evaluar los procesos de enseñanza-aprendizaje?	ACTIVA	LIKERT
6	2	6	¿El docente organiza y orienta actividades de trabajos independiente?	ACTIVA	LIKERT
7	2	7	¿El docente promueve la participación de sus estudiantes?	ACTIVA	LIKERT
8	2	8	¿El docente utiliza la pregunta como una estrategia para que el estudiante aprenda?	ACTIVA	LIKERT
9	3	9	¿Cuando ha solicitado asesoria, el docente responde oportunamente a sus inquietudes?	ACTIVA	LIKERT
10	3	10	¿El docente cumple con el horario de atención a los estudiantes?	ACTIVA	LIKERT
11	3	11	¿El docente cumple y hace cumplir los reglamentos?	ACTIVA	LIKERT
12	3	12	¿El docente es puntual a la llegada a sus compromisos académicos?	ACTIVA	LIKERT
13	3	13	¿El docente es puntual en la revisión y entrega de trabajo y calificaciones?	ACTIVA	LIKERT
14	3	14	¿El docente socializa el proyecto docente al inicio de clases?	ACTIVA	LIKERT
15	3	15	¿El docente trata con respeto a sus estudiantes?	ACTIVA	LIKERT
16	4	16	¿Qué aspectos considera que debe mejorar el docente en su práctica pedagógica?	ACTIVA	TEXTO
17	4	17	¿Qué fortalezas destaca del docente en el desarrollo del curso?	ACTIVA	TEXTO
\.


--
-- Data for Name: programa_academico; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.programa_academico (id, facultad_id, codigo_interno, codigo_snies, nombre, creditos_totales, estado, fecha_creacion) FROM stdin;
1	1	022	5302	INGENIERÍA DE SISTEMAS	160	ACTIVO	2026-10-23
\.


--
-- Data for Name: programa_campus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.programa_campus (programa_id, campus_id, estado) FROM stdin;
\.


--
-- Data for Name: requisito_plan_asignatura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.requisito_plan_asignatura (id, plan_estudios_id, plan_asignatura_id, plan_asignatura_requerida_id, tipo_requisito_id) FROM stdin;
\.


--
-- Data for Name: respuesta_pregunta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.respuesta_pregunta (id, encuesta_id, pregunta_id, valor, texto_respuesta, sentimiento, sentimiento_score, sentimiento_metodo) FROM stdin;
1	1	1	2	\N	\N	\N	\N
2	1	2	3	\N	\N	\N	\N
3	1	3	3	\N	\N	\N	\N
4	1	4	5	\N	\N	\N	\N
5	1	5	4	\N	\N	\N	\N
6	1	6	5	\N	\N	\N	\N
7	1	7	3	\N	\N	\N	\N
8	1	8	4	\N	\N	\N	\N
9	1	9	2	\N	\N	\N	\N
10	1	10	3	\N	\N	\N	\N
11	1	11	4	\N	\N	\N	\N
12	1	12	2	\N	\N	\N	\N
13	1	13	3	\N	\N	\N	\N
14	1	14	4	\N	\N	\N	\N
15	1	15	4	\N	\N	\N	\N
18	2	1	3	\N	\N	\N	\N
19	2	2	4	\N	\N	\N	\N
20	2	3	3	\N	\N	\N	\N
21	2	4	3	\N	\N	\N	\N
22	2	5	5	\N	\N	\N	\N
23	2	6	3	\N	\N	\N	\N
24	2	7	4	\N	\N	\N	\N
25	2	8	4	\N	\N	\N	\N
26	2	9	4	\N	\N	\N	\N
27	2	10	3	\N	\N	\N	\N
28	2	11	2	\N	\N	\N	\N
29	2	12	4	\N	\N	\N	\N
30	2	13	3	\N	\N	\N	\N
31	2	14	5	\N	\N	\N	\N
32	2	15	2	\N	\N	\N	\N
35	3	1	4	\N	\N	\N	\N
36	3	2	2	\N	\N	\N	\N
37	3	3	3	\N	\N	\N	\N
38	3	4	4	\N	\N	\N	\N
39	3	5	2	\N	\N	\N	\N
40	3	6	3	\N	\N	\N	\N
41	3	7	3	\N	\N	\N	\N
42	3	8	3	\N	\N	\N	\N
43	3	9	4	\N	\N	\N	\N
44	3	10	4	\N	\N	\N	\N
45	3	11	4	\N	\N	\N	\N
46	3	12	3	\N	\N	\N	\N
47	3	13	3	\N	\N	\N	\N
48	3	14	5	\N	\N	\N	\N
49	3	15	4	\N	\N	\N	\N
52	4	1	4	\N	\N	\N	\N
53	4	2	5	\N	\N	\N	\N
54	4	3	4	\N	\N	\N	\N
55	4	4	4	\N	\N	\N	\N
56	4	5	4	\N	\N	\N	\N
57	4	6	5	\N	\N	\N	\N
58	4	7	5	\N	\N	\N	\N
59	4	8	3	\N	\N	\N	\N
60	4	9	2	\N	\N	\N	\N
61	4	10	4	\N	\N	\N	\N
62	4	11	3	\N	\N	\N	\N
63	4	12	3	\N	\N	\N	\N
64	4	13	5	\N	\N	\N	\N
65	4	14	5	\N	\N	\N	\N
66	4	15	4	\N	\N	\N	\N
69	5	1	3	\N	\N	\N	\N
70	5	2	5	\N	\N	\N	\N
71	5	3	4	\N	\N	\N	\N
72	5	4	5	\N	\N	\N	\N
73	5	5	4	\N	\N	\N	\N
74	5	6	4	\N	\N	\N	\N
75	5	7	4	\N	\N	\N	\N
76	5	8	5	\N	\N	\N	\N
77	5	9	3	\N	\N	\N	\N
78	5	10	4	\N	\N	\N	\N
79	5	11	5	\N	\N	\N	\N
80	5	12	5	\N	\N	\N	\N
81	5	13	3	\N	\N	\N	\N
82	5	14	3	\N	\N	\N	\N
83	5	15	4	\N	\N	\N	\N
86	6	1	5	\N	\N	\N	\N
87	6	2	5	\N	\N	\N	\N
88	6	3	1	\N	\N	\N	\N
89	6	4	4	\N	\N	\N	\N
90	6	5	4	\N	\N	\N	\N
91	6	6	4	\N	\N	\N	\N
92	6	7	3	\N	\N	\N	\N
93	6	8	4	\N	\N	\N	\N
94	6	9	3	\N	\N	\N	\N
95	6	10	4	\N	\N	\N	\N
96	6	11	4	\N	\N	\N	\N
97	6	12	5	\N	\N	\N	\N
98	6	13	5	\N	\N	\N	\N
99	6	14	3	\N	\N	\N	\N
100	6	15	4	\N	\N	\N	\N
103	7	1	3	\N	\N	\N	\N
104	7	2	4	\N	\N	\N	\N
105	7	3	3	\N	\N	\N	\N
106	7	4	5	\N	\N	\N	\N
107	7	5	5	\N	\N	\N	\N
108	7	6	5	\N	\N	\N	\N
109	7	7	4	\N	\N	\N	\N
110	7	8	4	\N	\N	\N	\N
111	7	9	3	\N	\N	\N	\N
112	7	10	4	\N	\N	\N	\N
113	7	11	5	\N	\N	\N	\N
114	7	12	5	\N	\N	\N	\N
115	7	13	3	\N	\N	\N	\N
116	7	14	3	\N	\N	\N	\N
33	2	16	\N	Más horas de consulta, porque las que tiene se llenan de inmediato.	POSITIVO	0.3924	MODELO
50	3	16	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
51	3	17	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
67	4	16	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
68	4	17	\N	Tiene muy buena relación con los estudiantes y mucha disposición.	POSITIVO	0.9882	MODELO
84	5	16	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
85	5	17	\N	Tiene muy buena relación con los estudiantes y mucha disposición.	POSITIVO	0.9882	MODELO
101	6	16	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
102	6	17	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
17	1	17	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
117	7	15	4	\N	\N	\N	\N
120	8	1	3	\N	\N	\N	\N
121	8	2	4	\N	\N	\N	\N
122	8	3	5	\N	\N	\N	\N
123	8	4	3	\N	\N	\N	\N
124	8	5	4	\N	\N	\N	\N
125	8	6	4	\N	\N	\N	\N
126	8	7	5	\N	\N	\N	\N
127	8	8	5	\N	\N	\N	\N
128	8	9	5	\N	\N	\N	\N
129	8	10	4	\N	\N	\N	\N
130	8	11	4	\N	\N	\N	\N
131	8	12	4	\N	\N	\N	\N
132	8	13	4	\N	\N	\N	\N
133	8	14	4	\N	\N	\N	\N
134	8	15	5	\N	\N	\N	\N
137	9	1	4	\N	\N	\N	\N
138	9	2	4	\N	\N	\N	\N
139	9	3	1	\N	\N	\N	\N
140	9	4	4	\N	\N	\N	\N
141	9	5	2	\N	\N	\N	\N
142	9	6	2	\N	\N	\N	\N
143	9	7	2	\N	\N	\N	\N
144	9	8	4	\N	\N	\N	\N
145	9	9	4	\N	\N	\N	\N
146	9	10	3	\N	\N	\N	\N
147	9	11	4	\N	\N	\N	\N
148	9	12	4	\N	\N	\N	\N
149	9	13	4	\N	\N	\N	\N
150	9	14	5	\N	\N	\N	\N
151	9	15	4	\N	\N	\N	\N
154	10	1	4	\N	\N	\N	\N
155	10	2	4	\N	\N	\N	\N
156	10	3	4	\N	\N	\N	\N
157	10	4	5	\N	\N	\N	\N
158	10	5	2	\N	\N	\N	\N
159	10	6	4	\N	\N	\N	\N
160	10	7	4	\N	\N	\N	\N
161	10	8	2	\N	\N	\N	\N
162	10	9	4	\N	\N	\N	\N
163	10	10	5	\N	\N	\N	\N
164	10	11	3	\N	\N	\N	\N
165	10	12	3	\N	\N	\N	\N
166	10	13	4	\N	\N	\N	\N
167	10	14	3	\N	\N	\N	\N
168	10	15	3	\N	\N	\N	\N
171	11	1	4	\N	\N	\N	\N
172	11	2	4	\N	\N	\N	\N
173	11	3	1	\N	\N	\N	\N
174	11	4	3	\N	\N	\N	\N
175	11	5	5	\N	\N	\N	\N
176	11	6	3	\N	\N	\N	\N
177	11	7	4	\N	\N	\N	\N
178	11	8	4	\N	\N	\N	\N
179	11	9	5	\N	\N	\N	\N
180	11	10	5	\N	\N	\N	\N
181	11	11	3	\N	\N	\N	\N
182	11	12	1	\N	\N	\N	\N
183	11	13	4	\N	\N	\N	\N
184	11	14	5	\N	\N	\N	\N
185	11	15	5	\N	\N	\N	\N
188	12	1	4	\N	\N	\N	\N
189	12	2	5	\N	\N	\N	\N
190	12	3	4	\N	\N	\N	\N
191	12	4	4	\N	\N	\N	\N
192	12	5	5	\N	\N	\N	\N
193	12	6	2	\N	\N	\N	\N
194	12	7	4	\N	\N	\N	\N
195	12	8	4	\N	\N	\N	\N
196	12	9	5	\N	\N	\N	\N
197	12	10	3	\N	\N	\N	\N
198	12	11	5	\N	\N	\N	\N
199	12	12	3	\N	\N	\N	\N
200	12	13	3	\N	\N	\N	\N
201	12	14	4	\N	\N	\N	\N
202	12	15	4	\N	\N	\N	\N
205	13	1	4	\N	\N	\N	\N
206	13	2	4	\N	\N	\N	\N
207	13	3	4	\N	\N	\N	\N
208	13	4	4	\N	\N	\N	\N
209	13	5	4	\N	\N	\N	\N
210	13	6	5	\N	\N	\N	\N
211	13	7	3	\N	\N	\N	\N
212	13	8	4	\N	\N	\N	\N
213	13	9	3	\N	\N	\N	\N
214	13	10	4	\N	\N	\N	\N
215	13	11	4	\N	\N	\N	\N
216	13	12	4	\N	\N	\N	\N
217	13	13	4	\N	\N	\N	\N
218	13	14	5	\N	\N	\N	\N
219	13	15	2	\N	\N	\N	\N
222	14	1	4	\N	\N	\N	\N
223	14	2	3	\N	\N	\N	\N
224	14	3	4	\N	\N	\N	\N
225	14	4	2	\N	\N	\N	\N
226	14	5	3	\N	\N	\N	\N
227	14	6	4	\N	\N	\N	\N
228	14	7	4	\N	\N	\N	\N
229	14	8	4	\N	\N	\N	\N
230	14	9	4	\N	\N	\N	\N
136	8	17	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
152	9	16	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
153	9	17	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
169	10	16	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
170	10	17	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
186	11	16	\N	Más horas de consulta, porque las que tiene se llenan de inmediato.	POSITIVO	0.3924	MODELO
187	11	17	\N	Tiene muy buena relación con los estudiantes y mucha disposición.	POSITIVO	0.9882	MODELO
203	12	16	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
204	12	17	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
220	13	16	\N	Más horas de consulta, porque las que tiene se llenan de inmediato.	POSITIVO	0.3924	MODELO
221	13	17	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
135	8	16	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
231	14	10	5	\N	\N	\N	\N
232	14	11	5	\N	\N	\N	\N
233	14	12	4	\N	\N	\N	\N
234	14	13	4	\N	\N	\N	\N
235	14	14	4	\N	\N	\N	\N
236	14	15	5	\N	\N	\N	\N
239	15	1	3	\N	\N	\N	\N
240	15	2	4	\N	\N	\N	\N
241	15	3	3	\N	\N	\N	\N
242	15	4	4	\N	\N	\N	\N
243	15	5	4	\N	\N	\N	\N
244	15	6	5	\N	\N	\N	\N
245	15	7	4	\N	\N	\N	\N
246	15	8	3	\N	\N	\N	\N
247	15	9	5	\N	\N	\N	\N
248	15	10	2	\N	\N	\N	\N
249	15	11	4	\N	\N	\N	\N
250	15	12	5	\N	\N	\N	\N
251	15	13	2	\N	\N	\N	\N
252	15	14	4	\N	\N	\N	\N
253	15	15	3	\N	\N	\N	\N
256	16	1	4	\N	\N	\N	\N
257	16	2	3	\N	\N	\N	\N
258	16	3	5	\N	\N	\N	\N
259	16	4	4	\N	\N	\N	\N
260	16	5	3	\N	\N	\N	\N
261	16	6	2	\N	\N	\N	\N
262	16	7	4	\N	\N	\N	\N
263	16	8	4	\N	\N	\N	\N
264	16	9	4	\N	\N	\N	\N
265	16	10	2	\N	\N	\N	\N
266	16	11	4	\N	\N	\N	\N
267	16	12	5	\N	\N	\N	\N
268	16	13	5	\N	\N	\N	\N
269	16	14	2	\N	\N	\N	\N
270	16	15	4	\N	\N	\N	\N
273	17	1	4	\N	\N	\N	\N
274	17	2	3	\N	\N	\N	\N
275	17	3	5	\N	\N	\N	\N
276	17	4	5	\N	\N	\N	\N
277	17	5	5	\N	\N	\N	\N
278	17	6	5	\N	\N	\N	\N
279	17	7	5	\N	\N	\N	\N
280	17	8	2	\N	\N	\N	\N
281	17	9	5	\N	\N	\N	\N
282	17	10	4	\N	\N	\N	\N
283	17	11	5	\N	\N	\N	\N
284	17	12	5	\N	\N	\N	\N
285	17	13	5	\N	\N	\N	\N
286	17	14	5	\N	\N	\N	\N
287	17	15	3	\N	\N	\N	\N
290	18	1	4	\N	\N	\N	\N
291	18	2	4	\N	\N	\N	\N
292	18	3	3	\N	\N	\N	\N
293	18	4	4	\N	\N	\N	\N
294	18	5	3	\N	\N	\N	\N
295	18	6	1	\N	\N	\N	\N
296	18	7	3	\N	\N	\N	\N
297	18	8	3	\N	\N	\N	\N
298	18	9	5	\N	\N	\N	\N
299	18	10	5	\N	\N	\N	\N
300	18	11	3	\N	\N	\N	\N
301	18	12	4	\N	\N	\N	\N
302	18	13	3	\N	\N	\N	\N
303	18	14	5	\N	\N	\N	\N
304	18	15	4	\N	\N	\N	\N
307	19	1	5	\N	\N	\N	\N
308	19	2	3	\N	\N	\N	\N
309	19	3	2	\N	\N	\N	\N
310	19	4	4	\N	\N	\N	\N
311	19	5	4	\N	\N	\N	\N
312	19	6	3	\N	\N	\N	\N
313	19	7	4	\N	\N	\N	\N
314	19	8	4	\N	\N	\N	\N
315	19	9	3	\N	\N	\N	\N
316	19	10	4	\N	\N	\N	\N
317	19	11	3	\N	\N	\N	\N
318	19	12	4	\N	\N	\N	\N
319	19	13	1	\N	\N	\N	\N
320	19	14	5	\N	\N	\N	\N
321	19	15	4	\N	\N	\N	\N
324	20	1	4	\N	\N	\N	\N
325	20	2	2	\N	\N	\N	\N
326	20	3	5	\N	\N	\N	\N
327	20	4	4	\N	\N	\N	\N
328	20	5	4	\N	\N	\N	\N
329	20	6	3	\N	\N	\N	\N
330	20	7	4	\N	\N	\N	\N
331	20	8	4	\N	\N	\N	\N
332	20	9	3	\N	\N	\N	\N
333	20	10	4	\N	\N	\N	\N
334	20	11	3	\N	\N	\N	\N
335	20	12	4	\N	\N	\N	\N
336	20	13	3	\N	\N	\N	\N
337	20	14	4	\N	\N	\N	\N
338	20	15	3	\N	\N	\N	\N
341	21	1	4	\N	\N	\N	\N
342	21	2	3	\N	\N	\N	\N
343	21	3	4	\N	\N	\N	\N
344	21	4	4	\N	\N	\N	\N
254	15	16	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
255	15	17	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
271	16	16	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
272	16	17	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
288	17	16	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
289	17	17	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
305	18	16	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
306	18	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
322	19	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
323	19	17	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
339	20	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
340	20	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
345	21	5	4	\N	\N	\N	\N
346	21	6	4	\N	\N	\N	\N
347	21	7	5	\N	\N	\N	\N
348	21	8	4	\N	\N	\N	\N
349	21	9	4	\N	\N	\N	\N
350	21	10	3	\N	\N	\N	\N
351	21	11	4	\N	\N	\N	\N
352	21	12	4	\N	\N	\N	\N
353	21	13	2	\N	\N	\N	\N
354	21	14	5	\N	\N	\N	\N
355	21	15	3	\N	\N	\N	\N
358	22	1	4	\N	\N	\N	\N
359	22	2	5	\N	\N	\N	\N
360	22	3	2	\N	\N	\N	\N
361	22	4	3	\N	\N	\N	\N
362	22	5	4	\N	\N	\N	\N
363	22	6	3	\N	\N	\N	\N
364	22	7	4	\N	\N	\N	\N
365	22	8	4	\N	\N	\N	\N
366	22	9	3	\N	\N	\N	\N
367	22	10	4	\N	\N	\N	\N
368	22	11	1	\N	\N	\N	\N
369	22	12	4	\N	\N	\N	\N
370	22	13	4	\N	\N	\N	\N
371	22	14	2	\N	\N	\N	\N
372	22	15	3	\N	\N	\N	\N
375	23	1	5	\N	\N	\N	\N
376	23	2	4	\N	\N	\N	\N
377	23	3	4	\N	\N	\N	\N
378	23	4	4	\N	\N	\N	\N
379	23	5	5	\N	\N	\N	\N
380	23	6	4	\N	\N	\N	\N
381	23	7	5	\N	\N	\N	\N
382	23	8	5	\N	\N	\N	\N
383	23	9	4	\N	\N	\N	\N
384	23	10	4	\N	\N	\N	\N
385	23	11	4	\N	\N	\N	\N
386	23	12	5	\N	\N	\N	\N
387	23	13	4	\N	\N	\N	\N
388	23	14	5	\N	\N	\N	\N
389	23	15	4	\N	\N	\N	\N
392	24	1	4	\N	\N	\N	\N
393	24	2	4	\N	\N	\N	\N
394	24	3	3	\N	\N	\N	\N
395	24	4	2	\N	\N	\N	\N
396	24	5	3	\N	\N	\N	\N
397	24	6	3	\N	\N	\N	\N
398	24	7	3	\N	\N	\N	\N
399	24	8	4	\N	\N	\N	\N
400	24	9	3	\N	\N	\N	\N
401	24	10	3	\N	\N	\N	\N
402	24	11	4	\N	\N	\N	\N
403	24	12	4	\N	\N	\N	\N
404	24	13	2	\N	\N	\N	\N
405	24	14	3	\N	\N	\N	\N
406	24	15	4	\N	\N	\N	\N
409	25	1	4	\N	\N	\N	\N
410	25	2	5	\N	\N	\N	\N
411	25	3	4	\N	\N	\N	\N
412	25	4	3	\N	\N	\N	\N
413	25	5	1	\N	\N	\N	\N
414	25	6	3	\N	\N	\N	\N
415	25	7	4	\N	\N	\N	\N
416	25	8	5	\N	\N	\N	\N
417	25	9	5	\N	\N	\N	\N
418	25	10	3	\N	\N	\N	\N
419	25	11	4	\N	\N	\N	\N
420	25	12	4	\N	\N	\N	\N
421	25	13	4	\N	\N	\N	\N
422	25	14	3	\N	\N	\N	\N
423	25	15	3	\N	\N	\N	\N
426	26	1	5	\N	\N	\N	\N
427	26	2	5	\N	\N	\N	\N
428	26	3	5	\N	\N	\N	\N
429	26	4	4	\N	\N	\N	\N
430	26	5	5	\N	\N	\N	\N
431	26	6	4	\N	\N	\N	\N
432	26	7	4	\N	\N	\N	\N
433	26	8	2	\N	\N	\N	\N
434	26	9	3	\N	\N	\N	\N
435	26	10	5	\N	\N	\N	\N
436	26	11	3	\N	\N	\N	\N
437	26	12	3	\N	\N	\N	\N
438	26	13	3	\N	\N	\N	\N
439	26	14	4	\N	\N	\N	\N
440	26	15	3	\N	\N	\N	\N
443	27	1	2	\N	\N	\N	\N
444	27	2	1	\N	\N	\N	\N
445	27	3	4	\N	\N	\N	\N
446	27	4	5	\N	\N	\N	\N
447	27	5	3	\N	\N	\N	\N
448	27	6	4	\N	\N	\N	\N
449	27	7	4	\N	\N	\N	\N
450	27	8	4	\N	\N	\N	\N
451	27	9	4	\N	\N	\N	\N
452	27	10	5	\N	\N	\N	\N
453	27	11	3	\N	\N	\N	\N
454	27	12	1	\N	\N	\N	\N
455	27	13	3	\N	\N	\N	\N
456	27	14	2	\N	\N	\N	\N
457	27	15	4	\N	\N	\N	\N
460	28	1	3	\N	\N	\N	\N
373	22	16	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
374	22	17	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
390	23	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
391	23	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
407	24	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
408	24	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
425	25	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
441	26	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
442	26	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
458	27	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
459	27	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
357	21	17	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
461	28	2	4	\N	\N	\N	\N
462	28	3	4	\N	\N	\N	\N
463	28	4	2	\N	\N	\N	\N
464	28	5	4	\N	\N	\N	\N
465	28	6	5	\N	\N	\N	\N
466	28	7	2	\N	\N	\N	\N
467	28	8	1	\N	\N	\N	\N
468	28	9	3	\N	\N	\N	\N
469	28	10	4	\N	\N	\N	\N
470	28	11	5	\N	\N	\N	\N
471	28	12	3	\N	\N	\N	\N
472	28	13	4	\N	\N	\N	\N
473	28	14	2	\N	\N	\N	\N
474	28	15	4	\N	\N	\N	\N
477	29	1	2	\N	\N	\N	\N
478	29	2	5	\N	\N	\N	\N
479	29	3	4	\N	\N	\N	\N
480	29	4	3	\N	\N	\N	\N
481	29	5	3	\N	\N	\N	\N
482	29	6	3	\N	\N	\N	\N
483	29	7	4	\N	\N	\N	\N
484	29	8	3	\N	\N	\N	\N
485	29	9	5	\N	\N	\N	\N
486	29	10	4	\N	\N	\N	\N
487	29	11	2	\N	\N	\N	\N
488	29	12	5	\N	\N	\N	\N
489	29	13	4	\N	\N	\N	\N
490	29	14	4	\N	\N	\N	\N
491	29	15	4	\N	\N	\N	\N
494	30	1	5	\N	\N	\N	\N
495	30	2	4	\N	\N	\N	\N
496	30	3	4	\N	\N	\N	\N
497	30	4	4	\N	\N	\N	\N
498	30	5	4	\N	\N	\N	\N
499	30	6	3	\N	\N	\N	\N
500	30	7	3	\N	\N	\N	\N
501	30	8	5	\N	\N	\N	\N
502	30	9	3	\N	\N	\N	\N
503	30	10	4	\N	\N	\N	\N
504	30	11	4	\N	\N	\N	\N
505	30	12	4	\N	\N	\N	\N
506	30	13	4	\N	\N	\N	\N
507	30	14	3	\N	\N	\N	\N
508	30	15	4	\N	\N	\N	\N
511	31	1	5	\N	\N	\N	\N
512	31	2	4	\N	\N	\N	\N
513	31	3	3	\N	\N	\N	\N
514	31	4	1	\N	\N	\N	\N
515	31	5	5	\N	\N	\N	\N
516	31	6	2	\N	\N	\N	\N
517	31	7	4	\N	\N	\N	\N
518	31	8	4	\N	\N	\N	\N
519	31	9	4	\N	\N	\N	\N
520	31	10	4	\N	\N	\N	\N
521	31	11	4	\N	\N	\N	\N
522	31	12	4	\N	\N	\N	\N
523	31	13	4	\N	\N	\N	\N
524	31	14	2	\N	\N	\N	\N
525	31	15	3	\N	\N	\N	\N
528	32	1	4	\N	\N	\N	\N
529	32	2	3	\N	\N	\N	\N
530	32	3	4	\N	\N	\N	\N
531	32	4	3	\N	\N	\N	\N
532	32	5	4	\N	\N	\N	\N
533	32	6	3	\N	\N	\N	\N
534	32	7	3	\N	\N	\N	\N
535	32	8	2	\N	\N	\N	\N
536	32	9	3	\N	\N	\N	\N
537	32	10	2	\N	\N	\N	\N
538	32	11	4	\N	\N	\N	\N
539	32	12	4	\N	\N	\N	\N
540	32	13	3	\N	\N	\N	\N
541	32	14	3	\N	\N	\N	\N
542	32	15	4	\N	\N	\N	\N
545	33	1	3	\N	\N	\N	\N
546	33	2	3	\N	\N	\N	\N
547	33	3	4	\N	\N	\N	\N
548	33	4	2	\N	\N	\N	\N
549	33	5	2	\N	\N	\N	\N
550	33	6	2	\N	\N	\N	\N
551	33	7	3	\N	\N	\N	\N
552	33	8	5	\N	\N	\N	\N
553	33	9	4	\N	\N	\N	\N
554	33	10	4	\N	\N	\N	\N
555	33	11	2	\N	\N	\N	\N
556	33	12	1	\N	\N	\N	\N
557	33	13	3	\N	\N	\N	\N
558	33	14	4	\N	\N	\N	\N
559	33	15	3	\N	\N	\N	\N
562	34	1	2	\N	\N	\N	\N
563	34	2	4	\N	\N	\N	\N
564	34	3	4	\N	\N	\N	\N
565	34	4	4	\N	\N	\N	\N
566	34	5	3	\N	\N	\N	\N
567	34	6	4	\N	\N	\N	\N
568	34	7	5	\N	\N	\N	\N
569	34	8	2	\N	\N	\N	\N
570	34	9	3	\N	\N	\N	\N
571	34	10	4	\N	\N	\N	\N
572	34	11	3	\N	\N	\N	\N
573	34	12	4	\N	\N	\N	\N
574	34	13	4	\N	\N	\N	\N
575	34	14	4	\N	\N	\N	\N
576	34	15	3	\N	\N	\N	\N
932	55	14	5	\N	\N	\N	\N
492	29	16	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
493	29	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
509	30	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
510	30	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
527	31	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
543	32	16	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
544	32	17	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
560	33	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
561	33	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
577	34	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
476	28	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
579	35	1	4	\N	\N	\N	\N
580	35	2	4	\N	\N	\N	\N
581	35	3	4	\N	\N	\N	\N
582	35	4	5	\N	\N	\N	\N
583	35	5	3	\N	\N	\N	\N
584	35	6	3	\N	\N	\N	\N
585	35	7	4	\N	\N	\N	\N
586	35	8	3	\N	\N	\N	\N
587	35	9	3	\N	\N	\N	\N
588	35	10	2	\N	\N	\N	\N
589	35	11	1	\N	\N	\N	\N
590	35	12	4	\N	\N	\N	\N
591	35	13	4	\N	\N	\N	\N
592	35	14	3	\N	\N	\N	\N
593	35	15	3	\N	\N	\N	\N
596	36	1	3	\N	\N	\N	\N
597	36	2	4	\N	\N	\N	\N
598	36	3	5	\N	\N	\N	\N
599	36	4	3	\N	\N	\N	\N
600	36	5	3	\N	\N	\N	\N
601	36	6	3	\N	\N	\N	\N
602	36	7	5	\N	\N	\N	\N
603	36	8	4	\N	\N	\N	\N
604	36	9	1	\N	\N	\N	\N
605	36	10	2	\N	\N	\N	\N
606	36	11	3	\N	\N	\N	\N
607	36	12	4	\N	\N	\N	\N
608	36	13	3	\N	\N	\N	\N
609	36	14	2	\N	\N	\N	\N
610	36	15	2	\N	\N	\N	\N
613	37	1	3	\N	\N	\N	\N
614	37	2	3	\N	\N	\N	\N
615	37	3	4	\N	\N	\N	\N
616	37	4	4	\N	\N	\N	\N
617	37	5	3	\N	\N	\N	\N
618	37	6	1	\N	\N	\N	\N
619	37	7	2	\N	\N	\N	\N
620	37	8	4	\N	\N	\N	\N
621	37	9	4	\N	\N	\N	\N
622	37	10	3	\N	\N	\N	\N
623	37	11	1	\N	\N	\N	\N
624	37	12	4	\N	\N	\N	\N
625	37	13	4	\N	\N	\N	\N
626	37	14	3	\N	\N	\N	\N
627	37	15	4	\N	\N	\N	\N
630	38	1	3	\N	\N	\N	\N
631	38	2	3	\N	\N	\N	\N
632	38	3	3	\N	\N	\N	\N
633	38	4	1	\N	\N	\N	\N
634	38	5	3	\N	\N	\N	\N
635	38	6	3	\N	\N	\N	\N
636	38	7	4	\N	\N	\N	\N
637	38	8	4	\N	\N	\N	\N
638	38	9	3	\N	\N	\N	\N
639	38	10	4	\N	\N	\N	\N
640	38	11	2	\N	\N	\N	\N
641	38	12	5	\N	\N	\N	\N
642	38	13	4	\N	\N	\N	\N
643	38	14	3	\N	\N	\N	\N
644	38	15	3	\N	\N	\N	\N
647	39	1	4	\N	\N	\N	\N
648	39	2	3	\N	\N	\N	\N
649	39	3	1	\N	\N	\N	\N
650	39	4	3	\N	\N	\N	\N
651	39	5	3	\N	\N	\N	\N
652	39	6	3	\N	\N	\N	\N
653	39	7	3	\N	\N	\N	\N
654	39	8	1	\N	\N	\N	\N
655	39	9	2	\N	\N	\N	\N
656	39	10	2	\N	\N	\N	\N
657	39	11	2	\N	\N	\N	\N
658	39	12	4	\N	\N	\N	\N
659	39	13	3	\N	\N	\N	\N
660	39	14	1	\N	\N	\N	\N
661	39	15	3	\N	\N	\N	\N
664	40	1	1	\N	\N	\N	\N
665	40	2	5	\N	\N	\N	\N
666	40	3	5	\N	\N	\N	\N
667	40	4	3	\N	\N	\N	\N
668	40	5	2	\N	\N	\N	\N
669	40	6	4	\N	\N	\N	\N
670	40	7	3	\N	\N	\N	\N
671	40	8	4	\N	\N	\N	\N
672	40	9	3	\N	\N	\N	\N
673	40	10	2	\N	\N	\N	\N
674	40	11	4	\N	\N	\N	\N
675	40	12	5	\N	\N	\N	\N
676	40	13	2	\N	\N	\N	\N
677	40	14	3	\N	\N	\N	\N
678	40	15	3	\N	\N	\N	\N
681	41	1	4	\N	\N	\N	\N
682	41	2	3	\N	\N	\N	\N
683	41	3	5	\N	\N	\N	\N
684	41	4	3	\N	\N	\N	\N
685	41	5	4	\N	\N	\N	\N
686	41	6	2	\N	\N	\N	\N
687	41	7	2	\N	\N	\N	\N
688	41	8	3	\N	\N	\N	\N
689	41	9	5	\N	\N	\N	\N
690	41	10	3	\N	\N	\N	\N
691	41	11	2	\N	\N	\N	\N
692	41	12	3	\N	\N	\N	\N
693	41	13	3	\N	\N	\N	\N
694	41	14	3	\N	\N	\N	\N
695	41	15	3	\N	\N	\N	\N
933	55	15	1	\N	\N	\N	\N
595	35	17	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
611	36	16	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
612	36	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
628	37	16	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
629	37	17	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
646	38	17	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
662	39	16	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
663	39	17	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
679	40	16	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
680	40	17	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
594	35	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
698	42	1	2	\N	\N	\N	\N
699	42	2	4	\N	\N	\N	\N
700	42	3	1	\N	\N	\N	\N
701	42	4	4	\N	\N	\N	\N
702	42	5	4	\N	\N	\N	\N
703	42	6	4	\N	\N	\N	\N
704	42	7	3	\N	\N	\N	\N
705	42	8	4	\N	\N	\N	\N
706	42	9	4	\N	\N	\N	\N
707	42	10	5	\N	\N	\N	\N
708	42	11	3	\N	\N	\N	\N
709	42	12	1	\N	\N	\N	\N
710	42	13	3	\N	\N	\N	\N
711	42	14	3	\N	\N	\N	\N
712	42	15	4	\N	\N	\N	\N
715	43	1	2	\N	\N	\N	\N
716	43	2	4	\N	\N	\N	\N
717	43	3	5	\N	\N	\N	\N
718	43	4	1	\N	\N	\N	\N
719	43	5	4	\N	\N	\N	\N
720	43	6	2	\N	\N	\N	\N
721	43	7	3	\N	\N	\N	\N
722	43	8	3	\N	\N	\N	\N
723	43	9	1	\N	\N	\N	\N
724	43	10	3	\N	\N	\N	\N
725	43	11	4	\N	\N	\N	\N
726	43	12	3	\N	\N	\N	\N
727	43	13	5	\N	\N	\N	\N
728	43	14	3	\N	\N	\N	\N
729	43	15	4	\N	\N	\N	\N
732	44	1	4	\N	\N	\N	\N
733	44	2	2	\N	\N	\N	\N
734	44	3	2	\N	\N	\N	\N
735	44	4	1	\N	\N	\N	\N
736	44	5	5	\N	\N	\N	\N
737	44	6	4	\N	\N	\N	\N
738	44	7	4	\N	\N	\N	\N
739	44	8	2	\N	\N	\N	\N
740	44	9	2	\N	\N	\N	\N
741	44	10	2	\N	\N	\N	\N
742	44	11	1	\N	\N	\N	\N
743	44	12	3	\N	\N	\N	\N
744	44	13	1	\N	\N	\N	\N
745	44	14	3	\N	\N	\N	\N
746	44	15	3	\N	\N	\N	\N
749	45	1	1	\N	\N	\N	\N
750	45	2	4	\N	\N	\N	\N
751	45	3	3	\N	\N	\N	\N
752	45	4	2	\N	\N	\N	\N
753	45	5	5	\N	\N	\N	\N
754	45	6	2	\N	\N	\N	\N
755	45	7	3	\N	\N	\N	\N
756	45	8	2	\N	\N	\N	\N
757	45	9	2	\N	\N	\N	\N
758	45	10	1	\N	\N	\N	\N
759	45	11	4	\N	\N	\N	\N
760	45	12	5	\N	\N	\N	\N
761	45	13	4	\N	\N	\N	\N
762	45	14	2	\N	\N	\N	\N
763	45	15	3	\N	\N	\N	\N
766	46	1	3	\N	\N	\N	\N
767	46	2	3	\N	\N	\N	\N
768	46	3	5	\N	\N	\N	\N
769	46	4	4	\N	\N	\N	\N
770	46	5	2	\N	\N	\N	\N
771	46	6	3	\N	\N	\N	\N
772	46	7	3	\N	\N	\N	\N
773	46	8	2	\N	\N	\N	\N
774	46	9	4	\N	\N	\N	\N
775	46	10	1	\N	\N	\N	\N
776	46	11	4	\N	\N	\N	\N
777	46	12	3	\N	\N	\N	\N
778	46	13	1	\N	\N	\N	\N
779	46	14	4	\N	\N	\N	\N
780	46	15	4	\N	\N	\N	\N
783	47	1	2	\N	\N	\N	\N
784	47	2	4	\N	\N	\N	\N
785	47	3	2	\N	\N	\N	\N
786	47	4	2	\N	\N	\N	\N
787	47	5	2	\N	\N	\N	\N
788	47	6	4	\N	\N	\N	\N
789	47	7	4	\N	\N	\N	\N
790	47	8	4	\N	\N	\N	\N
791	47	9	2	\N	\N	\N	\N
792	47	10	1	\N	\N	\N	\N
793	47	11	3	\N	\N	\N	\N
794	47	12	1	\N	\N	\N	\N
795	47	13	4	\N	\N	\N	\N
796	47	14	1	\N	\N	\N	\N
797	47	15	3	\N	\N	\N	\N
800	48	1	2	\N	\N	\N	\N
801	48	2	3	\N	\N	\N	\N
802	48	3	5	\N	\N	\N	\N
803	48	4	3	\N	\N	\N	\N
804	48	5	5	\N	\N	\N	\N
805	48	6	4	\N	\N	\N	\N
806	48	7	2	\N	\N	\N	\N
807	48	8	4	\N	\N	\N	\N
808	48	9	3	\N	\N	\N	\N
809	48	10	4	\N	\N	\N	\N
810	48	11	4	\N	\N	\N	\N
811	48	12	3	\N	\N	\N	\N
812	48	13	2	\N	\N	\N	\N
813	48	14	5	\N	\N	\N	\N
814	48	15	2	\N	\N	\N	\N
713	42	16	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
714	42	17	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
731	43	17	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
747	44	16	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
748	44	17	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
764	45	16	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
765	45	17	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
781	46	16	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
782	46	17	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
798	47	16	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
799	47	17	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
697	41	17	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
817	49	1	4	\N	\N	\N	\N
818	49	2	1	\N	\N	\N	\N
819	49	3	3	\N	\N	\N	\N
820	49	4	3	\N	\N	\N	\N
821	49	5	4	\N	\N	\N	\N
822	49	6	4	\N	\N	\N	\N
823	49	7	3	\N	\N	\N	\N
824	49	8	4	\N	\N	\N	\N
825	49	9	5	\N	\N	\N	\N
826	49	10	2	\N	\N	\N	\N
827	49	11	2	\N	\N	\N	\N
828	49	12	1	\N	\N	\N	\N
829	49	13	4	\N	\N	\N	\N
830	49	14	3	\N	\N	\N	\N
831	49	15	5	\N	\N	\N	\N
834	50	1	3	\N	\N	\N	\N
835	50	2	2	\N	\N	\N	\N
836	50	3	5	\N	\N	\N	\N
837	50	4	3	\N	\N	\N	\N
838	50	5	3	\N	\N	\N	\N
839	50	6	1	\N	\N	\N	\N
840	50	7	4	\N	\N	\N	\N
841	50	8	2	\N	\N	\N	\N
842	50	9	3	\N	\N	\N	\N
843	50	10	4	\N	\N	\N	\N
844	50	11	4	\N	\N	\N	\N
845	50	12	5	\N	\N	\N	\N
846	50	13	3	\N	\N	\N	\N
847	50	14	4	\N	\N	\N	\N
848	50	15	2	\N	\N	\N	\N
851	51	1	5	\N	\N	\N	\N
852	51	2	1	\N	\N	\N	\N
853	51	3	3	\N	\N	\N	\N
854	51	4	3	\N	\N	\N	\N
855	51	5	5	\N	\N	\N	\N
856	51	6	4	\N	\N	\N	\N
857	51	7	1	\N	\N	\N	\N
858	51	8	4	\N	\N	\N	\N
859	51	9	3	\N	\N	\N	\N
860	51	10	5	\N	\N	\N	\N
861	51	11	3	\N	\N	\N	\N
862	51	12	3	\N	\N	\N	\N
863	51	13	2	\N	\N	\N	\N
864	51	14	2	\N	\N	\N	\N
865	51	15	4	\N	\N	\N	\N
868	52	1	3	\N	\N	\N	\N
869	52	2	5	\N	\N	\N	\N
870	52	3	4	\N	\N	\N	\N
871	52	4	2	\N	\N	\N	\N
872	52	5	4	\N	\N	\N	\N
873	52	6	3	\N	\N	\N	\N
874	52	7	3	\N	\N	\N	\N
875	52	8	4	\N	\N	\N	\N
876	52	9	2	\N	\N	\N	\N
877	52	10	4	\N	\N	\N	\N
878	52	11	4	\N	\N	\N	\N
879	52	12	3	\N	\N	\N	\N
880	52	13	2	\N	\N	\N	\N
881	52	14	5	\N	\N	\N	\N
882	52	15	5	\N	\N	\N	\N
885	53	1	3	\N	\N	\N	\N
886	53	2	4	\N	\N	\N	\N
887	53	3	3	\N	\N	\N	\N
888	53	4	1	\N	\N	\N	\N
889	53	5	2	\N	\N	\N	\N
890	53	6	2	\N	\N	\N	\N
891	53	7	3	\N	\N	\N	\N
892	53	8	2	\N	\N	\N	\N
893	53	9	1	\N	\N	\N	\N
894	53	10	3	\N	\N	\N	\N
895	53	11	3	\N	\N	\N	\N
896	53	12	3	\N	\N	\N	\N
897	53	13	3	\N	\N	\N	\N
898	53	14	2	\N	\N	\N	\N
899	53	15	3	\N	\N	\N	\N
902	54	1	3	\N	\N	\N	\N
903	54	2	3	\N	\N	\N	\N
904	54	3	4	\N	\N	\N	\N
905	54	4	3	\N	\N	\N	\N
906	54	5	5	\N	\N	\N	\N
907	54	6	1	\N	\N	\N	\N
908	54	7	1	\N	\N	\N	\N
909	54	8	3	\N	\N	\N	\N
910	54	9	1	\N	\N	\N	\N
911	54	10	2	\N	\N	\N	\N
912	54	11	3	\N	\N	\N	\N
913	54	12	3	\N	\N	\N	\N
914	54	13	3	\N	\N	\N	\N
915	54	14	5	\N	\N	\N	\N
916	54	15	3	\N	\N	\N	\N
919	55	1	4	\N	\N	\N	\N
920	55	2	4	\N	\N	\N	\N
921	55	3	2	\N	\N	\N	\N
922	55	4	3	\N	\N	\N	\N
923	55	5	2	\N	\N	\N	\N
924	55	6	3	\N	\N	\N	\N
925	55	7	3	\N	\N	\N	\N
926	55	8	3	\N	\N	\N	\N
927	55	9	1	\N	\N	\N	\N
928	55	10	3	\N	\N	\N	\N
929	55	11	4	\N	\N	\N	\N
930	55	12	3	\N	\N	\N	\N
931	55	13	2	\N	\N	\N	\N
833	49	17	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
849	50	16	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
850	50	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
866	51	16	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
867	51	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
883	52	16	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
884	52	17	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
900	53	16	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
901	53	17	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
917	54	16	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
918	54	17	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
816	48	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
936	56	1	3	\N	\N	\N	\N
937	56	2	3	\N	\N	\N	\N
938	56	3	3	\N	\N	\N	\N
939	56	4	2	\N	\N	\N	\N
940	56	5	3	\N	\N	\N	\N
941	56	6	4	\N	\N	\N	\N
942	56	7	4	\N	\N	\N	\N
943	56	8	4	\N	\N	\N	\N
944	56	9	4	\N	\N	\N	\N
945	56	10	5	\N	\N	\N	\N
946	56	11	3	\N	\N	\N	\N
947	56	12	3	\N	\N	\N	\N
948	56	13	3	\N	\N	\N	\N
949	56	14	2	\N	\N	\N	\N
950	56	15	4	\N	\N	\N	\N
953	57	1	4	\N	\N	\N	\N
954	57	2	3	\N	\N	\N	\N
955	57	3	4	\N	\N	\N	\N
956	57	4	4	\N	\N	\N	\N
957	57	5	5	\N	\N	\N	\N
958	57	6	4	\N	\N	\N	\N
959	57	7	3	\N	\N	\N	\N
960	57	8	3	\N	\N	\N	\N
961	57	9	1	\N	\N	\N	\N
962	57	10	5	\N	\N	\N	\N
963	57	11	4	\N	\N	\N	\N
964	57	12	2	\N	\N	\N	\N
965	57	13	2	\N	\N	\N	\N
966	57	14	4	\N	\N	\N	\N
967	57	15	3	\N	\N	\N	\N
970	58	1	3	\N	\N	\N	\N
971	58	2	2	\N	\N	\N	\N
972	58	3	3	\N	\N	\N	\N
973	58	4	1	\N	\N	\N	\N
974	58	5	4	\N	\N	\N	\N
975	58	6	2	\N	\N	\N	\N
976	58	7	3	\N	\N	\N	\N
977	58	8	3	\N	\N	\N	\N
978	58	9	3	\N	\N	\N	\N
979	58	10	4	\N	\N	\N	\N
980	58	11	4	\N	\N	\N	\N
981	58	12	3	\N	\N	\N	\N
982	58	13	1	\N	\N	\N	\N
983	58	14	1	\N	\N	\N	\N
984	58	15	2	\N	\N	\N	\N
987	59	1	2	\N	\N	\N	\N
988	59	2	2	\N	\N	\N	\N
989	59	3	3	\N	\N	\N	\N
990	59	4	1	\N	\N	\N	\N
991	59	5	2	\N	\N	\N	\N
992	59	6	2	\N	\N	\N	\N
993	59	7	3	\N	\N	\N	\N
994	59	8	2	\N	\N	\N	\N
995	59	9	3	\N	\N	\N	\N
996	59	10	1	\N	\N	\N	\N
997	59	11	2	\N	\N	\N	\N
998	59	12	3	\N	\N	\N	\N
999	59	13	1	\N	\N	\N	\N
1000	59	14	2	\N	\N	\N	\N
1001	59	15	2	\N	\N	\N	\N
1004	60	1	3	\N	\N	\N	\N
1005	60	2	1	\N	\N	\N	\N
1006	60	3	2	\N	\N	\N	\N
1007	60	4	3	\N	\N	\N	\N
1008	60	5	3	\N	\N	\N	\N
1009	60	6	4	\N	\N	\N	\N
1010	60	7	4	\N	\N	\N	\N
1011	60	8	1	\N	\N	\N	\N
1012	60	9	4	\N	\N	\N	\N
1013	60	10	1	\N	\N	\N	\N
1014	60	11	1	\N	\N	\N	\N
1015	60	12	4	\N	\N	\N	\N
1016	60	13	4	\N	\N	\N	\N
1017	60	14	3	\N	\N	\N	\N
1018	60	15	3	\N	\N	\N	\N
1021	61	1	2	\N	\N	\N	\N
1022	61	2	4	\N	\N	\N	\N
1023	61	3	3	\N	\N	\N	\N
1024	61	4	4	\N	\N	\N	\N
1025	61	5	4	\N	\N	\N	\N
1026	61	6	1	\N	\N	\N	\N
1027	61	7	4	\N	\N	\N	\N
1028	61	8	2	\N	\N	\N	\N
1029	61	9	3	\N	\N	\N	\N
1030	61	10	3	\N	\N	\N	\N
1031	61	11	2	\N	\N	\N	\N
1032	61	12	2	\N	\N	\N	\N
1033	61	13	2	\N	\N	\N	\N
1034	61	14	2	\N	\N	\N	\N
1035	61	15	1	\N	\N	\N	\N
1038	62	1	3	\N	\N	\N	\N
1039	62	2	4	\N	\N	\N	\N
1040	62	3	4	\N	\N	\N	\N
1041	62	4	2	\N	\N	\N	\N
1042	62	5	1	\N	\N	\N	\N
1043	62	6	1	\N	\N	\N	\N
1044	62	7	3	\N	\N	\N	\N
1045	62	8	3	\N	\N	\N	\N
1046	62	9	3	\N	\N	\N	\N
1047	62	10	1	\N	\N	\N	\N
1048	62	11	3	\N	\N	\N	\N
1049	62	12	2	\N	\N	\N	\N
952	56	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
968	57	16	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
969	57	17	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
985	58	16	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
986	58	17	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
1002	59	16	\N	No hay retroalimentación de los trabajos, uno no sabe en qué está mal.	NEUTRO	0.6001	MODELO
1003	59	17	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
1019	60	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1020	60	17	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
1036	61	16	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
1037	61	17	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
935	55	17	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
1050	62	13	3	\N	\N	\N	\N
1051	62	14	3	\N	\N	\N	\N
1052	62	15	2	\N	\N	\N	\N
1055	63	1	5	\N	\N	\N	\N
1056	63	2	2	\N	\N	\N	\N
1057	63	3	2	\N	\N	\N	\N
1058	63	4	2	\N	\N	\N	\N
1059	63	5	3	\N	\N	\N	\N
1060	63	6	3	\N	\N	\N	\N
1061	63	7	3	\N	\N	\N	\N
1062	63	8	2	\N	\N	\N	\N
1063	63	9	1	\N	\N	\N	\N
1064	63	10	2	\N	\N	\N	\N
1065	63	11	1	\N	\N	\N	\N
1066	63	12	2	\N	\N	\N	\N
1067	63	13	2	\N	\N	\N	\N
1068	63	14	3	\N	\N	\N	\N
1069	63	15	5	\N	\N	\N	\N
1072	64	1	5	\N	\N	\N	\N
1073	64	2	3	\N	\N	\N	\N
1074	64	3	1	\N	\N	\N	\N
1075	64	4	4	\N	\N	\N	\N
1076	64	5	3	\N	\N	\N	\N
1077	64	6	1	\N	\N	\N	\N
1078	64	7	3	\N	\N	\N	\N
1079	64	8	3	\N	\N	\N	\N
1080	64	9	5	\N	\N	\N	\N
1081	64	10	2	\N	\N	\N	\N
1082	64	11	4	\N	\N	\N	\N
1083	64	12	4	\N	\N	\N	\N
1084	64	13	5	\N	\N	\N	\N
1085	64	14	1	\N	\N	\N	\N
1086	64	15	3	\N	\N	\N	\N
1089	65	1	3	\N	\N	\N	\N
1090	65	2	2	\N	\N	\N	\N
1091	65	3	4	\N	\N	\N	\N
1092	65	4	2	\N	\N	\N	\N
1093	65	5	3	\N	\N	\N	\N
1094	65	6	3	\N	\N	\N	\N
1095	65	7	1	\N	\N	\N	\N
1096	65	8	3	\N	\N	\N	\N
1097	65	9	2	\N	\N	\N	\N
1098	65	10	2	\N	\N	\N	\N
1099	65	11	3	\N	\N	\N	\N
1100	65	12	2	\N	\N	\N	\N
1101	65	13	2	\N	\N	\N	\N
1102	65	14	4	\N	\N	\N	\N
1103	65	15	5	\N	\N	\N	\N
1106	66	1	4	\N	\N	\N	\N
1107	66	2	2	\N	\N	\N	\N
1108	66	3	3	\N	\N	\N	\N
1109	66	4	3	\N	\N	\N	\N
1110	66	5	1	\N	\N	\N	\N
1111	66	6	3	\N	\N	\N	\N
1112	66	7	1	\N	\N	\N	\N
1113	66	8	3	\N	\N	\N	\N
1114	66	9	3	\N	\N	\N	\N
1115	66	10	2	\N	\N	\N	\N
1116	66	11	1	\N	\N	\N	\N
1117	66	12	3	\N	\N	\N	\N
1118	66	13	4	\N	\N	\N	\N
1119	66	14	5	\N	\N	\N	\N
1120	66	15	4	\N	\N	\N	\N
1123	67	1	1	\N	\N	\N	\N
1124	67	2	2	\N	\N	\N	\N
1125	67	3	4	\N	\N	\N	\N
1126	67	4	2	\N	\N	\N	\N
1127	67	5	2	\N	\N	\N	\N
1128	67	6	1	\N	\N	\N	\N
1129	67	7	1	\N	\N	\N	\N
1130	67	8	4	\N	\N	\N	\N
1131	67	9	1	\N	\N	\N	\N
1132	67	10	3	\N	\N	\N	\N
1133	67	11	4	\N	\N	\N	\N
1134	67	12	4	\N	\N	\N	\N
1135	67	13	1	\N	\N	\N	\N
1136	67	14	2	\N	\N	\N	\N
1137	67	15	3	\N	\N	\N	\N
1140	68	1	4	\N	\N	\N	\N
1141	68	2	1	\N	\N	\N	\N
1142	68	3	2	\N	\N	\N	\N
1143	68	4	2	\N	\N	\N	\N
1144	68	5	3	\N	\N	\N	\N
1145	68	6	2	\N	\N	\N	\N
1146	68	7	2	\N	\N	\N	\N
1147	68	8	2	\N	\N	\N	\N
1148	68	9	3	\N	\N	\N	\N
1149	68	10	2	\N	\N	\N	\N
1150	68	11	3	\N	\N	\N	\N
1151	68	12	2	\N	\N	\N	\N
1152	68	13	4	\N	\N	\N	\N
1153	68	14	2	\N	\N	\N	\N
1154	68	15	4	\N	\N	\N	\N
1157	69	1	3	\N	\N	\N	\N
1158	69	2	3	\N	\N	\N	\N
1159	69	3	2	\N	\N	\N	\N
1160	69	4	1	\N	\N	\N	\N
1161	69	5	1	\N	\N	\N	\N
1162	69	6	3	\N	\N	\N	\N
1163	69	7	4	\N	\N	\N	\N
1164	69	8	1	\N	\N	\N	\N
1165	69	9	2	\N	\N	\N	\N
1166	69	10	2	\N	\N	\N	\N
1070	63	16	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
1071	63	17	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
1087	64	16	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
1088	64	17	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
1104	65	16	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
1105	65	17	\N	No logro destacar mucho, pero el tema es importante.	NEUTRO	0.4316	MODELO
1121	66	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1138	67	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1139	67	17	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
1155	68	16	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
1156	68	17	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
1054	62	17	\N	No logro destacar mucho, pero el tema es importante.	NEUTRO	0.4316	MODELO
1167	69	11	4	\N	\N	\N	\N
1168	69	12	3	\N	\N	\N	\N
1169	69	13	3	\N	\N	\N	\N
1170	69	14	1	\N	\N	\N	\N
1171	69	15	1	\N	\N	\N	\N
1174	70	1	4	\N	\N	\N	\N
1175	70	2	4	\N	\N	\N	\N
1176	70	3	4	\N	\N	\N	\N
1177	70	4	4	\N	\N	\N	\N
1178	70	5	2	\N	\N	\N	\N
1179	70	6	2	\N	\N	\N	\N
1180	70	7	2	\N	\N	\N	\N
1181	70	8	2	\N	\N	\N	\N
1182	70	9	1	\N	\N	\N	\N
1183	70	10	2	\N	\N	\N	\N
1184	70	11	2	\N	\N	\N	\N
1185	70	12	1	\N	\N	\N	\N
1186	70	13	3	\N	\N	\N	\N
1187	70	14	2	\N	\N	\N	\N
1188	70	15	1	\N	\N	\N	\N
1191	71	1	2	\N	\N	\N	\N
1192	71	2	3	\N	\N	\N	\N
1193	71	3	4	\N	\N	\N	\N
1194	71	4	1	\N	\N	\N	\N
1195	71	5	2	\N	\N	\N	\N
1196	71	6	1	\N	\N	\N	\N
1197	71	7	4	\N	\N	\N	\N
1198	71	8	3	\N	\N	\N	\N
1199	71	9	2	\N	\N	\N	\N
1200	71	10	3	\N	\N	\N	\N
1201	71	11	2	\N	\N	\N	\N
1202	71	12	1	\N	\N	\N	\N
1203	71	13	2	\N	\N	\N	\N
1204	71	14	3	\N	\N	\N	\N
1205	71	15	3	\N	\N	\N	\N
1208	72	1	3	\N	\N	\N	\N
1209	72	2	3	\N	\N	\N	\N
1210	72	3	2	\N	\N	\N	\N
1211	72	4	1	\N	\N	\N	\N
1212	72	5	2	\N	\N	\N	\N
1213	72	6	3	\N	\N	\N	\N
1214	72	7	1	\N	\N	\N	\N
1215	72	8	3	\N	\N	\N	\N
1216	72	9	3	\N	\N	\N	\N
1217	72	10	2	\N	\N	\N	\N
1218	72	11	5	\N	\N	\N	\N
1219	72	12	3	\N	\N	\N	\N
1220	72	13	3	\N	\N	\N	\N
1221	72	14	3	\N	\N	\N	\N
1222	72	15	1	\N	\N	\N	\N
1225	73	1	1	\N	\N	\N	\N
1226	73	2	3	\N	\N	\N	\N
1227	73	3	2	\N	\N	\N	\N
1228	73	4	3	\N	\N	\N	\N
1229	73	5	3	\N	\N	\N	\N
1230	73	6	3	\N	\N	\N	\N
1231	73	7	3	\N	\N	\N	\N
1232	73	8	2	\N	\N	\N	\N
1233	73	9	1	\N	\N	\N	\N
1234	73	10	3	\N	\N	\N	\N
1235	73	11	4	\N	\N	\N	\N
1236	73	12	1	\N	\N	\N	\N
1237	73	13	3	\N	\N	\N	\N
1238	73	14	2	\N	\N	\N	\N
1239	73	15	3	\N	\N	\N	\N
1242	74	1	2	\N	\N	\N	\N
1243	74	2	3	\N	\N	\N	\N
1244	74	3	4	\N	\N	\N	\N
1245	74	4	2	\N	\N	\N	\N
1246	74	5	2	\N	\N	\N	\N
1247	74	6	2	\N	\N	\N	\N
1248	74	7	4	\N	\N	\N	\N
1249	74	8	2	\N	\N	\N	\N
1250	74	9	1	\N	\N	\N	\N
1251	74	10	3	\N	\N	\N	\N
1252	74	11	2	\N	\N	\N	\N
1253	74	12	4	\N	\N	\N	\N
1254	74	13	1	\N	\N	\N	\N
1255	74	14	3	\N	\N	\N	\N
1256	74	15	2	\N	\N	\N	\N
1259	75	1	5	\N	\N	\N	\N
1260	75	2	2	\N	\N	\N	\N
1261	75	3	2	\N	\N	\N	\N
1262	75	4	4	\N	\N	\N	\N
1263	75	5	3	\N	\N	\N	\N
1264	75	6	4	\N	\N	\N	\N
1265	75	7	3	\N	\N	\N	\N
1266	75	8	1	\N	\N	\N	\N
1267	75	9	3	\N	\N	\N	\N
1268	75	10	4	\N	\N	\N	\N
1269	75	11	3	\N	\N	\N	\N
1270	75	12	2	\N	\N	\N	\N
1271	75	13	1	\N	\N	\N	\N
1272	75	14	3	\N	\N	\N	\N
1273	75	15	2	\N	\N	\N	\N
1276	76	1	1	\N	\N	\N	\N
1277	76	2	4	\N	\N	\N	\N
1278	76	3	2	\N	\N	\N	\N
1279	76	4	5	\N	\N	\N	\N
1280	76	5	2	\N	\N	\N	\N
1281	76	6	5	\N	\N	\N	\N
1282	76	7	4	\N	\N	\N	\N
1283	76	8	1	\N	\N	\N	\N
1189	70	16	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
1190	70	17	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
1206	71	16	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
1223	72	16	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
1224	72	17	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
1240	73	16	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
1241	73	17	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
1257	74	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1258	74	17	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
1274	75	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1275	75	17	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
1173	69	17	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
1284	76	9	3	\N	\N	\N	\N
1285	76	10	2	\N	\N	\N	\N
1286	76	11	4	\N	\N	\N	\N
1287	76	12	3	\N	\N	\N	\N
1288	76	13	5	\N	\N	\N	\N
1289	76	14	1	\N	\N	\N	\N
1290	76	15	3	\N	\N	\N	\N
1293	77	1	2	\N	\N	\N	\N
1294	77	2	2	\N	\N	\N	\N
1295	77	3	3	\N	\N	\N	\N
1296	77	4	3	\N	\N	\N	\N
1297	77	5	3	\N	\N	\N	\N
1298	77	6	4	\N	\N	\N	\N
1299	77	7	2	\N	\N	\N	\N
1300	77	8	3	\N	\N	\N	\N
1301	77	9	3	\N	\N	\N	\N
1302	77	10	3	\N	\N	\N	\N
1303	77	11	2	\N	\N	\N	\N
1304	77	12	3	\N	\N	\N	\N
1305	77	13	2	\N	\N	\N	\N
1306	77	14	1	\N	\N	\N	\N
1307	77	15	3	\N	\N	\N	\N
1310	78	1	2	\N	\N	\N	\N
1311	78	2	2	\N	\N	\N	\N
1312	78	3	5	\N	\N	\N	\N
1313	78	4	2	\N	\N	\N	\N
1314	78	5	4	\N	\N	\N	\N
1315	78	6	2	\N	\N	\N	\N
1316	78	7	1	\N	\N	\N	\N
1317	78	8	4	\N	\N	\N	\N
1318	78	9	2	\N	\N	\N	\N
1319	78	10	4	\N	\N	\N	\N
1320	78	11	2	\N	\N	\N	\N
1321	78	12	1	\N	\N	\N	\N
1322	78	13	3	\N	\N	\N	\N
1323	78	14	4	\N	\N	\N	\N
1324	78	15	2	\N	\N	\N	\N
1327	79	1	5	\N	\N	\N	\N
1328	79	2	4	\N	\N	\N	\N
1329	79	3	4	\N	\N	\N	\N
1330	79	4	4	\N	\N	\N	\N
1331	79	5	2	\N	\N	\N	\N
1332	79	6	3	\N	\N	\N	\N
1333	79	7	2	\N	\N	\N	\N
1334	79	8	4	\N	\N	\N	\N
1335	79	9	1	\N	\N	\N	\N
1336	79	10	4	\N	\N	\N	\N
1337	79	11	3	\N	\N	\N	\N
1338	79	12	4	\N	\N	\N	\N
1339	79	13	4	\N	\N	\N	\N
1340	79	14	4	\N	\N	\N	\N
1341	79	15	2	\N	\N	\N	\N
1344	80	1	5	\N	\N	\N	\N
1345	80	2	4	\N	\N	\N	\N
1346	80	3	3	\N	\N	\N	\N
1347	80	4	4	\N	\N	\N	\N
1348	80	5	3	\N	\N	\N	\N
1349	80	6	5	\N	\N	\N	\N
1350	80	7	4	\N	\N	\N	\N
1351	80	8	4	\N	\N	\N	\N
1352	80	9	3	\N	\N	\N	\N
1353	80	10	5	\N	\N	\N	\N
1354	80	11	3	\N	\N	\N	\N
1355	80	12	5	\N	\N	\N	\N
1356	80	13	2	\N	\N	\N	\N
1357	80	14	2	\N	\N	\N	\N
1358	80	15	2	\N	\N	\N	\N
1361	81	1	5	\N	\N	\N	\N
1362	81	2	5	\N	\N	\N	\N
1363	81	3	5	\N	\N	\N	\N
1364	81	4	3	\N	\N	\N	\N
1365	81	5	4	\N	\N	\N	\N
1366	81	6	4	\N	\N	\N	\N
1367	81	7	2	\N	\N	\N	\N
1368	81	8	3	\N	\N	\N	\N
1369	81	9	4	\N	\N	\N	\N
1370	81	10	4	\N	\N	\N	\N
1371	81	11	2	\N	\N	\N	\N
1372	81	12	5	\N	\N	\N	\N
1373	81	13	2	\N	\N	\N	\N
1374	81	14	4	\N	\N	\N	\N
1375	81	15	4	\N	\N	\N	\N
1378	82	1	5	\N	\N	\N	\N
1379	82	2	4	\N	\N	\N	\N
1380	82	3	3	\N	\N	\N	\N
1381	82	4	3	\N	\N	\N	\N
1382	82	5	4	\N	\N	\N	\N
1383	82	6	4	\N	\N	\N	\N
1384	82	7	1	\N	\N	\N	\N
1385	82	8	5	\N	\N	\N	\N
1386	82	9	4	\N	\N	\N	\N
1387	82	10	4	\N	\N	\N	\N
1388	82	11	3	\N	\N	\N	\N
1389	82	12	3	\N	\N	\N	\N
1390	82	13	4	\N	\N	\N	\N
1391	82	14	3	\N	\N	\N	\N
1392	82	15	3	\N	\N	\N	\N
1395	83	1	3	\N	\N	\N	\N
1396	83	2	2	\N	\N	\N	\N
1397	83	3	5	\N	\N	\N	\N
1398	83	4	3	\N	\N	\N	\N
1399	83	5	5	\N	\N	\N	\N
1400	83	6	3	\N	\N	\N	\N
1308	77	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1309	77	17	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
1326	78	17	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
1342	79	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
1343	79	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
1359	80	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
1360	80	17	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
1376	81	16	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
1377	81	17	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
1393	82	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
1394	82	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
1292	76	17	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
1401	83	7	3	\N	\N	\N	\N
1402	83	8	4	\N	\N	\N	\N
1403	83	9	4	\N	\N	\N	\N
1404	83	10	2	\N	\N	\N	\N
1405	83	11	3	\N	\N	\N	\N
1406	83	12	2	\N	\N	\N	\N
1407	83	13	3	\N	\N	\N	\N
1408	83	14	2	\N	\N	\N	\N
1409	83	15	2	\N	\N	\N	\N
1412	84	1	3	\N	\N	\N	\N
1413	84	2	2	\N	\N	\N	\N
1414	84	3	5	\N	\N	\N	\N
1415	84	4	3	\N	\N	\N	\N
1416	84	5	5	\N	\N	\N	\N
1417	84	6	4	\N	\N	\N	\N
1418	84	7	2	\N	\N	\N	\N
1419	84	8	3	\N	\N	\N	\N
1420	84	9	3	\N	\N	\N	\N
1421	84	10	3	\N	\N	\N	\N
1422	84	11	4	\N	\N	\N	\N
1423	84	12	1	\N	\N	\N	\N
1424	84	13	3	\N	\N	\N	\N
1425	84	14	4	\N	\N	\N	\N
1426	84	15	5	\N	\N	\N	\N
1429	85	1	5	\N	\N	\N	\N
1430	85	2	4	\N	\N	\N	\N
1431	85	3	4	\N	\N	\N	\N
1432	85	4	3	\N	\N	\N	\N
1433	85	5	3	\N	\N	\N	\N
1434	85	6	4	\N	\N	\N	\N
1435	85	7	3	\N	\N	\N	\N
1436	85	8	4	\N	\N	\N	\N
1437	85	9	2	\N	\N	\N	\N
1438	85	10	4	\N	\N	\N	\N
1439	85	11	4	\N	\N	\N	\N
1440	85	12	3	\N	\N	\N	\N
1441	85	13	5	\N	\N	\N	\N
1442	85	14	4	\N	\N	\N	\N
1443	85	15	2	\N	\N	\N	\N
1446	86	1	3	\N	\N	\N	\N
1447	86	2	2	\N	\N	\N	\N
1448	86	3	4	\N	\N	\N	\N
1449	86	4	3	\N	\N	\N	\N
1450	86	5	1	\N	\N	\N	\N
1451	86	6	1	\N	\N	\N	\N
1452	86	7	4	\N	\N	\N	\N
1453	86	8	4	\N	\N	\N	\N
1454	86	9	4	\N	\N	\N	\N
1455	86	10	2	\N	\N	\N	\N
1456	86	11	5	\N	\N	\N	\N
1457	86	12	2	\N	\N	\N	\N
1458	86	13	5	\N	\N	\N	\N
1459	86	14	3	\N	\N	\N	\N
1460	86	15	3	\N	\N	\N	\N
1463	87	1	4	\N	\N	\N	\N
1464	87	2	3	\N	\N	\N	\N
1465	87	3	4	\N	\N	\N	\N
1466	87	4	3	\N	\N	\N	\N
1467	87	5	4	\N	\N	\N	\N
1468	87	6	5	\N	\N	\N	\N
1469	87	7	4	\N	\N	\N	\N
1470	87	8	4	\N	\N	\N	\N
1471	87	9	4	\N	\N	\N	\N
1472	87	10	4	\N	\N	\N	\N
1473	87	11	1	\N	\N	\N	\N
1474	87	12	4	\N	\N	\N	\N
1475	87	13	5	\N	\N	\N	\N
1476	87	14	4	\N	\N	\N	\N
1477	87	15	4	\N	\N	\N	\N
1480	88	1	4	\N	\N	\N	\N
1481	88	2	4	\N	\N	\N	\N
1482	88	3	3	\N	\N	\N	\N
1483	88	4	5	\N	\N	\N	\N
1484	88	5	3	\N	\N	\N	\N
1485	88	6	4	\N	\N	\N	\N
1486	88	7	4	\N	\N	\N	\N
1487	88	8	3	\N	\N	\N	\N
1488	88	9	3	\N	\N	\N	\N
1489	88	10	3	\N	\N	\N	\N
1490	88	11	3	\N	\N	\N	\N
1491	88	12	3	\N	\N	\N	\N
1492	88	13	4	\N	\N	\N	\N
1493	88	14	4	\N	\N	\N	\N
1494	88	15	4	\N	\N	\N	\N
1497	89	1	3	\N	\N	\N	\N
1498	89	2	4	\N	\N	\N	\N
1499	89	3	4	\N	\N	\N	\N
1500	89	4	3	\N	\N	\N	\N
1501	89	5	3	\N	\N	\N	\N
1502	89	6	5	\N	\N	\N	\N
1503	89	7	3	\N	\N	\N	\N
1504	89	8	3	\N	\N	\N	\N
1505	89	9	4	\N	\N	\N	\N
1506	89	10	4	\N	\N	\N	\N
1507	89	11	4	\N	\N	\N	\N
1508	89	12	4	\N	\N	\N	\N
1509	89	13	4	\N	\N	\N	\N
1510	89	14	3	\N	\N	\N	\N
1511	89	15	3	\N	\N	\N	\N
1514	90	1	4	\N	\N	\N	\N
1515	90	2	4	\N	\N	\N	\N
1516	90	3	4	\N	\N	\N	\N
1427	84	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
1428	84	17	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
1444	85	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
1445	85	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
1461	86	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
1462	86	17	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
1479	87	17	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
1495	88	16	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
1496	88	17	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
1512	89	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
1513	89	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
1411	83	17	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
1517	90	4	4	\N	\N	\N	\N
1518	90	5	4	\N	\N	\N	\N
1519	90	6	5	\N	\N	\N	\N
1520	90	7	4	\N	\N	\N	\N
1521	90	8	3	\N	\N	\N	\N
1522	90	9	4	\N	\N	\N	\N
1523	90	10	4	\N	\N	\N	\N
1524	90	11	5	\N	\N	\N	\N
1525	90	12	3	\N	\N	\N	\N
1526	90	13	3	\N	\N	\N	\N
1527	90	14	4	\N	\N	\N	\N
1528	90	15	2	\N	\N	\N	\N
1531	91	1	4	\N	\N	\N	\N
1532	91	2	3	\N	\N	\N	\N
1533	91	3	5	\N	\N	\N	\N
1534	91	4	3	\N	\N	\N	\N
1535	91	5	4	\N	\N	\N	\N
1536	91	6	3	\N	\N	\N	\N
1537	91	7	2	\N	\N	\N	\N
1538	91	8	4	\N	\N	\N	\N
1539	91	9	3	\N	\N	\N	\N
1540	91	10	2	\N	\N	\N	\N
1541	91	11	5	\N	\N	\N	\N
1542	91	12	3	\N	\N	\N	\N
1543	91	13	3	\N	\N	\N	\N
1544	91	14	2	\N	\N	\N	\N
1545	91	15	3	\N	\N	\N	\N
1548	92	1	4	\N	\N	\N	\N
1549	92	2	5	\N	\N	\N	\N
1550	92	3	4	\N	\N	\N	\N
1551	92	4	4	\N	\N	\N	\N
1552	92	5	4	\N	\N	\N	\N
1553	92	6	3	\N	\N	\N	\N
1554	92	7	3	\N	\N	\N	\N
1555	92	8	2	\N	\N	\N	\N
1556	92	9	4	\N	\N	\N	\N
1557	92	10	4	\N	\N	\N	\N
1558	92	11	3	\N	\N	\N	\N
1559	92	12	4	\N	\N	\N	\N
1560	92	13	5	\N	\N	\N	\N
1561	92	14	1	\N	\N	\N	\N
1562	92	15	5	\N	\N	\N	\N
1565	93	1	2	\N	\N	\N	\N
1566	93	2	3	\N	\N	\N	\N
1567	93	3	3	\N	\N	\N	\N
1568	93	4	5	\N	\N	\N	\N
1569	93	5	4	\N	\N	\N	\N
1570	93	6	5	\N	\N	\N	\N
1571	93	7	3	\N	\N	\N	\N
1572	93	8	4	\N	\N	\N	\N
1573	93	9	2	\N	\N	\N	\N
1574	93	10	3	\N	\N	\N	\N
1575	93	11	4	\N	\N	\N	\N
1576	93	12	2	\N	\N	\N	\N
1577	93	13	3	\N	\N	\N	\N
1578	93	14	4	\N	\N	\N	\N
1579	93	15	4	\N	\N	\N	\N
1582	94	1	3	\N	\N	\N	\N
1583	94	2	4	\N	\N	\N	\N
1584	94	3	3	\N	\N	\N	\N
1585	94	4	3	\N	\N	\N	\N
1586	94	5	5	\N	\N	\N	\N
1587	94	6	3	\N	\N	\N	\N
1588	94	7	4	\N	\N	\N	\N
1589	94	8	4	\N	\N	\N	\N
1590	94	9	4	\N	\N	\N	\N
1591	94	10	3	\N	\N	\N	\N
1592	94	11	2	\N	\N	\N	\N
1593	94	12	4	\N	\N	\N	\N
1594	94	13	3	\N	\N	\N	\N
1595	94	14	5	\N	\N	\N	\N
1596	94	15	2	\N	\N	\N	\N
1599	95	1	4	\N	\N	\N	\N
1600	95	2	2	\N	\N	\N	\N
1601	95	3	3	\N	\N	\N	\N
1602	95	4	4	\N	\N	\N	\N
1603	95	5	2	\N	\N	\N	\N
1604	95	6	3	\N	\N	\N	\N
1605	95	7	3	\N	\N	\N	\N
1606	95	8	3	\N	\N	\N	\N
1607	95	9	4	\N	\N	\N	\N
1608	95	10	4	\N	\N	\N	\N
1609	95	11	4	\N	\N	\N	\N
1610	95	12	3	\N	\N	\N	\N
1611	95	13	3	\N	\N	\N	\N
1612	95	14	5	\N	\N	\N	\N
1613	95	15	4	\N	\N	\N	\N
1616	96	1	3	\N	\N	\N	\N
1617	96	2	5	\N	\N	\N	\N
1618	96	3	4	\N	\N	\N	\N
1619	96	4	4	\N	\N	\N	\N
1620	96	5	4	\N	\N	\N	\N
1621	96	6	5	\N	\N	\N	\N
1622	96	7	4	\N	\N	\N	\N
1623	96	8	3	\N	\N	\N	\N
1624	96	9	2	\N	\N	\N	\N
1625	96	10	3	\N	\N	\N	\N
1626	96	11	3	\N	\N	\N	\N
1627	96	12	3	\N	\N	\N	\N
1628	96	13	5	\N	\N	\N	\N
1629	96	14	5	\N	\N	\N	\N
1630	96	15	3	\N	\N	\N	\N
1547	91	17	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
1563	92	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
1564	92	17	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
1580	93	16	\N	Más horas de consulta, porque las que tiene se llenan de inmediato.	POSITIVO	0.3924	MODELO
1581	93	17	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
1597	94	16	\N	Más horas de consulta, porque las que tiene se llenan de inmediato.	POSITIVO	0.3924	MODELO
1598	94	17	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
1614	95	16	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
1615	95	17	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
1631	96	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
1632	96	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
1530	90	17	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
1633	97	1	3	\N	\N	\N	\N
1634	97	2	4	\N	\N	\N	\N
1635	97	3	4	\N	\N	\N	\N
1636	97	4	4	\N	\N	\N	\N
1637	97	5	3	\N	\N	\N	\N
1638	97	6	4	\N	\N	\N	\N
1639	97	7	3	\N	\N	\N	\N
1640	97	8	5	\N	\N	\N	\N
1641	97	9	3	\N	\N	\N	\N
1642	97	10	4	\N	\N	\N	\N
1643	97	11	4	\N	\N	\N	\N
1644	97	12	5	\N	\N	\N	\N
1645	97	13	3	\N	\N	\N	\N
1646	97	14	3	\N	\N	\N	\N
1647	97	15	4	\N	\N	\N	\N
1650	98	1	5	\N	\N	\N	\N
1651	98	2	5	\N	\N	\N	\N
1652	98	3	1	\N	\N	\N	\N
1653	98	4	4	\N	\N	\N	\N
1654	98	5	4	\N	\N	\N	\N
1655	98	6	4	\N	\N	\N	\N
1656	98	7	3	\N	\N	\N	\N
1657	98	8	4	\N	\N	\N	\N
1658	98	9	2	\N	\N	\N	\N
1659	98	10	4	\N	\N	\N	\N
1660	98	11	4	\N	\N	\N	\N
1661	98	12	5	\N	\N	\N	\N
1662	98	13	5	\N	\N	\N	\N
1663	98	14	3	\N	\N	\N	\N
1664	98	15	4	\N	\N	\N	\N
1667	99	1	4	\N	\N	\N	\N
1668	99	2	3	\N	\N	\N	\N
1669	99	3	3	\N	\N	\N	\N
1670	99	4	3	\N	\N	\N	\N
1671	99	5	5	\N	\N	\N	\N
1672	99	6	5	\N	\N	\N	\N
1673	99	7	5	\N	\N	\N	\N
1674	99	8	4	\N	\N	\N	\N
1675	99	9	4	\N	\N	\N	\N
1676	99	10	2	\N	\N	\N	\N
1677	99	11	3	\N	\N	\N	\N
1678	99	12	5	\N	\N	\N	\N
1679	99	13	4	\N	\N	\N	\N
1680	99	14	3	\N	\N	\N	\N
1681	99	15	3	\N	\N	\N	\N
1684	100	1	5	\N	\N	\N	\N
1685	100	2	4	\N	\N	\N	\N
1686	100	3	2	\N	\N	\N	\N
1687	100	4	4	\N	\N	\N	\N
1688	100	5	5	\N	\N	\N	\N
1689	100	6	3	\N	\N	\N	\N
1690	100	7	4	\N	\N	\N	\N
1691	100	8	4	\N	\N	\N	\N
1692	100	9	5	\N	\N	\N	\N
1693	100	10	5	\N	\N	\N	\N
1694	100	11	4	\N	\N	\N	\N
1695	100	12	4	\N	\N	\N	\N
1696	100	13	4	\N	\N	\N	\N
1697	100	14	3	\N	\N	\N	\N
1698	100	15	4	\N	\N	\N	\N
1701	101	1	3	\N	\N	\N	\N
1702	101	2	4	\N	\N	\N	\N
1703	101	3	3	\N	\N	\N	\N
1704	101	4	3	\N	\N	\N	\N
1705	101	5	2	\N	\N	\N	\N
1706	101	6	4	\N	\N	\N	\N
1707	101	7	3	\N	\N	\N	\N
1708	101	8	5	\N	\N	\N	\N
1709	101	9	5	\N	\N	\N	\N
1710	101	10	2	\N	\N	\N	\N
1711	101	11	3	\N	\N	\N	\N
1712	101	12	4	\N	\N	\N	\N
1713	101	13	3	\N	\N	\N	\N
1714	101	14	3	\N	\N	\N	\N
1715	101	15	5	\N	\N	\N	\N
1718	102	1	3	\N	\N	\N	\N
1719	102	2	2	\N	\N	\N	\N
1720	102	3	4	\N	\N	\N	\N
1721	102	4	3	\N	\N	\N	\N
1722	102	5	4	\N	\N	\N	\N
1723	102	6	4	\N	\N	\N	\N
1724	102	7	4	\N	\N	\N	\N
1725	102	8	5	\N	\N	\N	\N
1726	102	9	2	\N	\N	\N	\N
1727	102	10	3	\N	\N	\N	\N
1728	102	11	3	\N	\N	\N	\N
1729	102	12	5	\N	\N	\N	\N
1730	102	13	3	\N	\N	\N	\N
1731	102	14	3	\N	\N	\N	\N
1732	102	15	4	\N	\N	\N	\N
1735	103	1	4	\N	\N	\N	\N
1736	103	2	3	\N	\N	\N	\N
1737	103	3	1	\N	\N	\N	\N
1738	103	4	5	\N	\N	\N	\N
1739	103	5	4	\N	\N	\N	\N
1740	103	6	5	\N	\N	\N	\N
1741	103	7	5	\N	\N	\N	\N
1742	103	8	4	\N	\N	\N	\N
1743	103	9	2	\N	\N	\N	\N
1744	103	10	3	\N	\N	\N	\N
1745	103	11	2	\N	\N	\N	\N
1746	103	12	3	\N	\N	\N	\N
1747	103	13	1	\N	\N	\N	\N
1748	103	14	3	\N	\N	\N	\N
1749	103	15	5	\N	\N	\N	\N
1665	98	16	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
1666	98	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
1683	99	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
1699	100	16	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
1700	100	17	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
1716	101	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
1717	101	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
1733	102	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
1734	102	17	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
1750	103	16	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
1649	97	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
1752	104	1	3	\N	\N	\N	\N
1753	104	2	2	\N	\N	\N	\N
1754	104	3	2	\N	\N	\N	\N
1755	104	4	1	\N	\N	\N	\N
1756	104	5	4	\N	\N	\N	\N
1757	104	6	1	\N	\N	\N	\N
1758	104	7	3	\N	\N	\N	\N
1759	104	8	1	\N	\N	\N	\N
1760	104	9	3	\N	\N	\N	\N
1761	104	10	5	\N	\N	\N	\N
1762	104	11	3	\N	\N	\N	\N
1763	104	12	1	\N	\N	\N	\N
1764	104	13	3	\N	\N	\N	\N
1765	104	14	4	\N	\N	\N	\N
1766	104	15	1	\N	\N	\N	\N
1769	105	1	3	\N	\N	\N	\N
1770	105	2	3	\N	\N	\N	\N
1771	105	3	3	\N	\N	\N	\N
1772	105	4	3	\N	\N	\N	\N
1773	105	5	3	\N	\N	\N	\N
1774	105	6	5	\N	\N	\N	\N
1775	105	7	2	\N	\N	\N	\N
1776	105	8	4	\N	\N	\N	\N
1777	105	9	2	\N	\N	\N	\N
1778	105	10	3	\N	\N	\N	\N
1779	105	11	4	\N	\N	\N	\N
1780	105	12	2	\N	\N	\N	\N
1781	105	13	3	\N	\N	\N	\N
1782	105	14	4	\N	\N	\N	\N
1783	105	15	1	\N	\N	\N	\N
1786	106	1	3	\N	\N	\N	\N
1787	106	2	2	\N	\N	\N	\N
1788	106	3	3	\N	\N	\N	\N
1789	106	4	1	\N	\N	\N	\N
1790	106	5	2	\N	\N	\N	\N
1791	106	6	2	\N	\N	\N	\N
1792	106	7	3	\N	\N	\N	\N
1793	106	8	3	\N	\N	\N	\N
1794	106	9	3	\N	\N	\N	\N
1795	106	10	5	\N	\N	\N	\N
1796	106	11	4	\N	\N	\N	\N
1797	106	12	3	\N	\N	\N	\N
1798	106	13	4	\N	\N	\N	\N
1799	106	14	3	\N	\N	\N	\N
1800	106	15	5	\N	\N	\N	\N
1803	107	1	2	\N	\N	\N	\N
1804	107	2	2	\N	\N	\N	\N
1805	107	3	2	\N	\N	\N	\N
1806	107	4	3	\N	\N	\N	\N
1807	107	5	4	\N	\N	\N	\N
1808	107	6	4	\N	\N	\N	\N
1809	107	7	3	\N	\N	\N	\N
1810	107	8	2	\N	\N	\N	\N
1811	107	9	5	\N	\N	\N	\N
1812	107	10	1	\N	\N	\N	\N
1813	107	11	3	\N	\N	\N	\N
1814	107	12	4	\N	\N	\N	\N
1815	107	13	1	\N	\N	\N	\N
1816	107	14	3	\N	\N	\N	\N
1817	107	15	2	\N	\N	\N	\N
1820	108	1	3	\N	\N	\N	\N
1821	108	2	2	\N	\N	\N	\N
1822	108	3	5	\N	\N	\N	\N
1823	108	4	4	\N	\N	\N	\N
1824	108	5	2	\N	\N	\N	\N
1825	108	6	1	\N	\N	\N	\N
1826	108	7	3	\N	\N	\N	\N
1827	108	8	3	\N	\N	\N	\N
1828	108	9	3	\N	\N	\N	\N
1829	108	10	1	\N	\N	\N	\N
1830	108	11	3	\N	\N	\N	\N
1831	108	12	5	\N	\N	\N	\N
1832	108	13	5	\N	\N	\N	\N
1833	108	14	1	\N	\N	\N	\N
1834	108	15	3	\N	\N	\N	\N
1837	109	1	3	\N	\N	\N	\N
1838	109	2	3	\N	\N	\N	\N
1839	109	3	2	\N	\N	\N	\N
1840	109	4	5	\N	\N	\N	\N
1841	109	5	4	\N	\N	\N	\N
1842	109	6	5	\N	\N	\N	\N
1843	109	7	4	\N	\N	\N	\N
1844	109	8	4	\N	\N	\N	\N
1845	109	9	1	\N	\N	\N	\N
1846	109	10	4	\N	\N	\N	\N
1847	109	11	3	\N	\N	\N	\N
1848	109	12	5	\N	\N	\N	\N
1849	109	13	4	\N	\N	\N	\N
1850	109	14	4	\N	\N	\N	\N
1851	109	15	4	\N	\N	\N	\N
1854	110	1	2	\N	\N	\N	\N
1855	110	2	4	\N	\N	\N	\N
1856	110	3	2	\N	\N	\N	\N
1857	110	4	2	\N	\N	\N	\N
1858	110	5	3	\N	\N	\N	\N
1859	110	6	2	\N	\N	\N	\N
1860	110	7	1	\N	\N	\N	\N
1861	110	8	1	\N	\N	\N	\N
1862	110	9	2	\N	\N	\N	\N
1863	110	10	4	\N	\N	\N	\N
1864	110	11	5	\N	\N	\N	\N
1865	110	12	2	\N	\N	\N	\N
1866	110	13	3	\N	\N	\N	\N
1867	110	14	2	\N	\N	\N	\N
1868	110	15	5	\N	\N	\N	\N
1768	104	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
1784	105	16	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
1785	105	17	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
1802	106	17	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
1818	107	16	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
1819	107	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
1835	108	16	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
1836	108	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
1852	109	16	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
1853	109	17	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
1767	104	16	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
1871	111	1	5	\N	\N	\N	\N
1872	111	2	2	\N	\N	\N	\N
1873	111	3	1	\N	\N	\N	\N
1874	111	4	2	\N	\N	\N	\N
1875	111	5	3	\N	\N	\N	\N
1876	111	6	2	\N	\N	\N	\N
1877	111	7	3	\N	\N	\N	\N
1878	111	8	3	\N	\N	\N	\N
1879	111	9	2	\N	\N	\N	\N
1880	111	10	3	\N	\N	\N	\N
1881	111	11	2	\N	\N	\N	\N
1882	111	12	3	\N	\N	\N	\N
1883	111	13	1	\N	\N	\N	\N
1884	111	14	4	\N	\N	\N	\N
1885	111	15	3	\N	\N	\N	\N
1888	112	1	4	\N	\N	\N	\N
1889	112	2	3	\N	\N	\N	\N
1890	112	3	3	\N	\N	\N	\N
1891	112	4	1	\N	\N	\N	\N
1892	112	5	4	\N	\N	\N	\N
1893	112	6	3	\N	\N	\N	\N
1894	112	7	3	\N	\N	\N	\N
1895	112	8	2	\N	\N	\N	\N
1896	112	9	3	\N	\N	\N	\N
1897	112	10	3	\N	\N	\N	\N
1898	112	11	1	\N	\N	\N	\N
1899	112	12	3	\N	\N	\N	\N
1900	112	13	2	\N	\N	\N	\N
1901	112	14	3	\N	\N	\N	\N
1902	112	15	1	\N	\N	\N	\N
1905	113	1	2	\N	\N	\N	\N
1906	113	2	3	\N	\N	\N	\N
1907	113	3	3	\N	\N	\N	\N
1908	113	4	2	\N	\N	\N	\N
1909	113	5	2	\N	\N	\N	\N
1910	113	6	3	\N	\N	\N	\N
1911	113	7	3	\N	\N	\N	\N
1912	113	8	3	\N	\N	\N	\N
1913	113	9	5	\N	\N	\N	\N
1914	113	10	3	\N	\N	\N	\N
1915	113	11	3	\N	\N	\N	\N
1916	113	12	2	\N	\N	\N	\N
1917	113	13	3	\N	\N	\N	\N
1918	113	14	3	\N	\N	\N	\N
1919	113	15	1	\N	\N	\N	\N
1922	114	1	1	\N	\N	\N	\N
1923	114	2	1	\N	\N	\N	\N
1924	114	3	5	\N	\N	\N	\N
1925	114	4	3	\N	\N	\N	\N
1926	114	5	3	\N	\N	\N	\N
1927	114	6	2	\N	\N	\N	\N
1928	114	7	4	\N	\N	\N	\N
1929	114	8	3	\N	\N	\N	\N
1930	114	9	3	\N	\N	\N	\N
1931	114	10	2	\N	\N	\N	\N
1932	114	11	2	\N	\N	\N	\N
1933	114	12	1	\N	\N	\N	\N
1934	114	13	3	\N	\N	\N	\N
1935	114	14	4	\N	\N	\N	\N
1936	114	15	4	\N	\N	\N	\N
1939	115	1	4	\N	\N	\N	\N
1940	115	2	5	\N	\N	\N	\N
1941	115	3	2	\N	\N	\N	\N
1942	115	4	2	\N	\N	\N	\N
1943	115	5	3	\N	\N	\N	\N
1944	115	6	4	\N	\N	\N	\N
1945	115	7	4	\N	\N	\N	\N
1946	115	8	3	\N	\N	\N	\N
1947	115	9	4	\N	\N	\N	\N
1948	115	10	3	\N	\N	\N	\N
1949	115	11	4	\N	\N	\N	\N
1950	115	12	5	\N	\N	\N	\N
1951	115	13	3	\N	\N	\N	\N
1952	115	14	5	\N	\N	\N	\N
1953	115	15	3	\N	\N	\N	\N
1956	116	1	3	\N	\N	\N	\N
1957	116	2	4	\N	\N	\N	\N
1958	116	3	4	\N	\N	\N	\N
1959	116	4	3	\N	\N	\N	\N
1960	116	5	3	\N	\N	\N	\N
1961	116	6	4	\N	\N	\N	\N
1962	116	7	3	\N	\N	\N	\N
1963	116	8	3	\N	\N	\N	\N
1964	116	9	5	\N	\N	\N	\N
1965	116	10	2	\N	\N	\N	\N
1966	116	11	2	\N	\N	\N	\N
1967	116	12	3	\N	\N	\N	\N
1968	116	13	2	\N	\N	\N	\N
1969	116	14	3	\N	\N	\N	\N
1970	116	15	3	\N	\N	\N	\N
1973	117	1	3	\N	\N	\N	\N
1974	117	2	4	\N	\N	\N	\N
1975	117	3	5	\N	\N	\N	\N
1976	117	4	1	\N	\N	\N	\N
1977	117	5	5	\N	\N	\N	\N
1978	117	6	4	\N	\N	\N	\N
1979	117	7	4	\N	\N	\N	\N
1980	117	8	5	\N	\N	\N	\N
1981	117	9	3	\N	\N	\N	\N
1982	117	10	3	\N	\N	\N	\N
1983	117	11	5	\N	\N	\N	\N
1984	117	12	5	\N	\N	\N	\N
1985	117	13	4	\N	\N	\N	\N
1886	111	16	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
1887	111	17	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
1903	112	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1920	113	16	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
1921	113	17	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
1937	114	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1938	114	17	\N	No logro destacar mucho, pero el tema es importante.	NEUTRO	0.4316	MODELO
1954	115	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
1955	115	17	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
1971	116	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
1972	116	17	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
1870	110	17	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
1986	117	14	4	\N	\N	\N	\N
1987	117	15	4	\N	\N	\N	\N
1990	118	1	3	\N	\N	\N	\N
1991	118	2	4	\N	\N	\N	\N
1992	118	3	4	\N	\N	\N	\N
1993	118	4	4	\N	\N	\N	\N
1994	118	5	5	\N	\N	\N	\N
1995	118	6	5	\N	\N	\N	\N
1996	118	7	5	\N	\N	\N	\N
1997	118	8	4	\N	\N	\N	\N
1998	118	9	5	\N	\N	\N	\N
1999	118	10	4	\N	\N	\N	\N
2000	118	11	4	\N	\N	\N	\N
2001	118	12	2	\N	\N	\N	\N
2002	118	13	3	\N	\N	\N	\N
2003	118	14	5	\N	\N	\N	\N
2004	118	15	3	\N	\N	\N	\N
2007	119	1	5	\N	\N	\N	\N
2008	119	2	3	\N	\N	\N	\N
2009	119	3	5	\N	\N	\N	\N
2010	119	4	3	\N	\N	\N	\N
2011	119	5	5	\N	\N	\N	\N
2012	119	6	4	\N	\N	\N	\N
2013	119	7	4	\N	\N	\N	\N
2014	119	8	2	\N	\N	\N	\N
2015	119	9	5	\N	\N	\N	\N
2016	119	10	3	\N	\N	\N	\N
2017	119	11	2	\N	\N	\N	\N
2018	119	12	5	\N	\N	\N	\N
2019	119	13	1	\N	\N	\N	\N
2020	119	14	1	\N	\N	\N	\N
2021	119	15	3	\N	\N	\N	\N
2024	120	1	2	\N	\N	\N	\N
2025	120	2	5	\N	\N	\N	\N
2026	120	3	3	\N	\N	\N	\N
2027	120	4	3	\N	\N	\N	\N
2028	120	5	3	\N	\N	\N	\N
2029	120	6	4	\N	\N	\N	\N
2030	120	7	5	\N	\N	\N	\N
2031	120	8	4	\N	\N	\N	\N
2032	120	9	4	\N	\N	\N	\N
2033	120	10	2	\N	\N	\N	\N
2034	120	11	3	\N	\N	\N	\N
2035	120	12	4	\N	\N	\N	\N
2036	120	13	5	\N	\N	\N	\N
2037	120	14	4	\N	\N	\N	\N
2038	120	15	5	\N	\N	\N	\N
2006	118	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
2022	119	16	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
2023	119	17	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
2039	120	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
2040	120	17	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
16	1	16	\N	Más horas de consulta, porque las que tiene se llenan de inmediato.	POSITIVO	0.3924	MODELO
118	7	16	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
119	7	17	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
237	14	16	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
356	21	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
424	25	16	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
475	28	16	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
526	31	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
578	34	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
645	38	16	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
696	41	16	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
730	43	16	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
815	48	16	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
832	49	16	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
934	55	16	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
951	56	16	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
1053	62	16	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
1122	66	17	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
1172	69	16	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
1207	71	17	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
1291	76	16	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
1325	78	16	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
1410	83	16	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
1478	87	16	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
1529	90	16	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
1546	91	16	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
1648	97	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
1682	99	16	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
1989	117	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
34	2	17	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
238	14	17	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
1751	103	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
1801	106	16	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
1869	110	16	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
1904	112	17	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
1988	117	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
2005	118	16	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
\.


--
-- Data for Name: sesion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sesion (id, token, usuario_id, creado_en, expira_en) FROM stdin;
4	408bf2241b574b28bfb6ddac01c408f874557ec40d7a450191567d6f6e810f24	42	2026-10-23 01:27:57.419134+00	2026-10-23 09:27:57.419134+00
5	26e0a332bbec47429746e4a34f5e0da98db249251472436eb6a427151b8214c1	2	2026-10-23 01:27:57.731077+00	2026-10-23 09:27:57.731077+00
\.


--
-- Data for Name: tipo_asignatura_plan; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tipo_asignatura_plan (id, codigo, nombre) FROM stdin;
1	OBLIGATORIA	Obligatoria
2	ELECTIVA	Electiva
3	ELECTIVA_PROFUNDIZACION	Electiva de Profundización
4	ELECTIVA_COMPLEMENTARIA	Electiva Complementaria
\.


--
-- Data for Name: tipo_requisito; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tipo_requisito (id, codigo, nombre) FROM stdin;
1	PRERREQUISITO	Prerrequisito
2	CORREQUISITO	Correquisito
3	ANTIRREQUISITO	Antirrequisito
\.


--
-- Data for Name: universidad; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.universidad (id, codigo, nombre, fecha_creacion, estado) FROM stdin;
1	UDC	Universidad de Cartagena	2026-09-07	ACTIVA
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usuario (id, username, password_hash, rol, nombre_mostrar, estudiante_id, docente_id, estado, ultimo_acceso, creado_en) FROM stdin;
3	0222400002	$2a$10$rMnz3NrnvOLpH.kFYeKuO.m63eKbgA9D6rmEChjYw917s04dwopD.	ESTUDIANTE	ANDRES FELIPE MARTINEZ DIAZ SUAREZ	2	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
4	0222400003	$2a$10$GivbSyV6bFn4BrG9d2BvDOF07V3IPkgwqKSEdg/3JIKNNhM3GsgGK	ESTUDIANTE	LAURA VALENTINA GARCIA HERNANDEZ RODRIGUEZ	3	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
5	0222400004	$2a$10$UAN/rZYWyWMFZQuG.p.kjOuMNAqe3PLnI2rtj0805eORSvFSkDKR.	ESTUDIANTE	CARLOS ANDRES LOPEZ SANCHEZ RAMIREZ	4	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
6	0222400005	$2a$10$diIfFyLHXeNdZNQy7C.kJOgwRJXH1y7s.aYHR0HTVkZcc.S20cc76	ESTUDIANTE	ANA MARIA GONZALEZ RAMIREZ MORENO	5	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
7	0222400006	$2a$10$pjk8C/ftRFJ4aeHcjez2POksc5gzJgoIJyfpk2EupSdq7zlJT0qm.	ESTUDIANTE	LUIS MIGUEL HERNANDEZ TORRES MARTINEZ	6	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
8	0222400007	$2a$10$eVZ7ZPOa0nl.xN0LnQJi3eZowqaPT.lFZ/dCZr5PtmL4P6ASg8S2u	ESTUDIANTE	CAMILA DIAZ CASTRO CASTRO	7	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
9	0222400008	$2a$10$uP6Fhi5RtOdF6UDFLcZxB.SIlaHiX/0Q9F6yyuYkQ78XSnXo281fu	ESTUDIANTE	DIEGO ALEJANDRO RAMIREZ VARGAS ACOSTA	8	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
10	0222400009	$2a$10$1MhysIWRIDiZJQwJMZmvWuuWR2cQDi712eAzUx/XeBK6xgsUS35W.	ESTUDIANTE	VALENTINA CASTRO ORTIZ GARCIA	9	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
11	0222400010	$2a$10$gwvfcVrxErLrQobP.EjIHOeS4iWhr4tT1/K3xbDcTRhgyhIhPaIAe	ESTUDIANTE	SEBASTIAN TORRES MORENO TORRES	10	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
12	0222400011	$2a$10$/1bxhRGBEK44X7OgcTrtPu/wn0YzPZh8J7EuONtwjfEGWf2/bV75C	ESTUDIANTE	ISABELLA VARGAS CORTES ROJAS	11	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
13	0222400012	$2a$10$KuBvoHjDndfujtf.Qm2Keu5gvqtS6BUWXiOAfpLGfypKQwvAGEu9m	ESTUDIANTE	MATEO ORTIZ SUAREZ LOPEZ	12	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
14	0222400013	$2a$10$SZUQDFMGDVBrN10LCQuatOHnEPTV16TimCToQt/eAfOZD7nnh3xQu	ESTUDIANTE	SOFIA CORTES ACOSTA VARGAS	13	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
15	0222400014	$2a$10$/W.ygRCt7Wwf.Fup7sRdI.cddqH3txA7KrELyJexzNIEf0gTltnhK	ESTUDIANTE	NICOLAS SUAREZ MEJIA MEJIA	14	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
16	0222400015	$2a$10$8ncTBEARJpy/s6xaZO6va.ymPga9xIv2FONya3Bq3f7RU3mbNNTla	ESTUDIANTE	MARIA FERNANDA MORENO ROJAS GONZALEZ	15	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
17	0222400016	$2a$10$aYhtXsLrWD48iyKBgiraMe/KRpNIQBeA9tPHLrAV0pWlhoSoDt9v2	ESTUDIANTE	SANTIAGO ACOSTA PALACIOS ORTIZ	16	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
18	0222400017	$2a$10$glmi.867L1zF72nFRiWjW.qgdniFL3Of/ZKtReejM.6fKU5kvxgUG	ESTUDIANTE	GABRIELA ROJAS QUINTERO QUINTERO	17	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
19	0222400018	$2a$10$2DeGBrlrbJN7/absJPWcu.GLGgZVAwuFsDq/nPRs5ez4syjlI1cFC	ESTUDIANTE	DANIEL MEJIA ARANGO HERNANDEZ	18	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
20	0222400019	$2a$10$Nf4/9GYUIdZzgX5lO6Jnh.eVLnmjgepNSiakKuqWH.5jwC.IJzQeK	ESTUDIANTE	PAULA QUINTERO SOTO CORTES	19	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
21	0222400020	$2a$10$/eKFjZM/OD0PHNoSQeAG.OV.Ukj8334RdsAxzpib5s1HCccs6YSae	ESTUDIANTE	KEVIN PEREZ GOMEZ PEREZ	20	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
22	0222400021	$2a$10$J4SkBfEfQ0g3z5kdeoJLKuKLRlLqsLobSrjBbS94tZt2/9eIgobF2	ESTUDIANTE	MANUELA RODRIGUEZ LOPEZ DIAZ	21	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
23	0222400022	$2a$10$AgmQbhj6BGjiR19RCJA2LeRQUz.13s5T0LfczZfHjwuR./p/t5lZ.	ESTUDIANTE	ESTEBAN MARTINEZ DIAZ SUAREZ	22	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
24	0222400023	$2a$10$XW8CR36ILat3YlXVpjkhD.ZIO2hx/V3HU7gFEuAIhoalUpprYpVFy	ESTUDIANTE	JULIANA GARCIA HERNANDEZ RODRIGUEZ	23	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
25	0222400024	$2a$10$n5odSjEMD9RLxP6rCUWx8.uAZCVdw2yF3oROEWPXpFMyaulGSjnoe	ESTUDIANTE	OSCAR LOPEZ SANCHEZ RAMIREZ	24	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
26	0222400025	$2a$10$8NAz2ODEhRI6WUYMZsEIqeR2KYae6ONRsyQRaHUJhsy/aTLqIVuWC	ESTUDIANTE	JUAN CAMILO GONZALEZ RAMIREZ MORENO	25	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
27	0222400026	$2a$10$PRc9rumcZO1.b7RND9LvCuONz1/T.l2D6VLuWJauTE0fFEbtXwO4q	ESTUDIANTE	MARIA JOSE HERNANDEZ TORRES MARTINEZ	26	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
28	0222400027	$2a$10$Tz8bK2iQQaMNVwsDJxgSxOyYk03TmtouFxfHpv55fqAxX7Njhg//.	ESTUDIANTE	ANDRES FELIPE DIAZ CASTRO CASTRO	27	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
29	0222400028	$2a$10$5SNi3sNqLBrtQt3Lj0xi2Oa/2x5RfUBCdj3vKzDIo9CG3WP.a4e1O	ESTUDIANTE	LAURA VALENTINA RAMIREZ VARGAS ACOSTA	28	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
30	0222400029	$2a$10$o42TJgnPf5OdPkkuxJ0WAe0d7bQqPvmvC/uZuGZTrXM.II5EalJJu	ESTUDIANTE	CARLOS ANDRES CASTRO ORTIZ GARCIA	29	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
31	0222400030	$2a$10$ZdChmSPqYcbJGCC1jyV.Z.pry/.D5HPJgr.4qsKwOsPKlwPJvqUKm	ESTUDIANTE	ANA MARIA TORRES MORENO TORRES	30	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
32	0222400031	$2a$10$LZ92OAHHXjb6MpGWR0weneA2RTAYK9ifDlEjr6QerdpQABwm4oM5O	ESTUDIANTE	LUIS MIGUEL VARGAS CORTES ROJAS	31	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
33	0222400032	$2a$10$rZaAAFUhHI.CuHG03aK1qOTQsFYf6e858N2c1NQQlp0grNBS7VYzq	ESTUDIANTE	CAMILA ORTIZ SUAREZ LOPEZ	32	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
34	0222400033	$2a$10$V51HhAzM79FLjTDcy9cQVeec1U7YM3LOUzh2g6I5zl7YqKZtWmwpq	ESTUDIANTE	DIEGO ALEJANDRO CORTES ACOSTA VARGAS	33	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
35	0222400034	$2a$10$2PVnJI5uA8JYYMB9xhMHO.ZuJVLtc8irI9B5faSA6IMGamRXnTgaq	ESTUDIANTE	VALENTINA SUAREZ MEJIA MEJIA	34	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
36	0222400035	$2a$10$vZHjVB1lSho6jamMobOo.uFVxosi/bAQ91f0SA8PXciS43e5Wt3ji	ESTUDIANTE	SEBASTIAN MORENO ROJAS GONZALEZ	35	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
37	0222400036	$2a$10$pRevJfQFqvKIY2mT69m7I.8m1E50dFR0kh3gTJfKMknJzVm1nFh5S	ESTUDIANTE	ISABELLA ACOSTA PALACIOS ORTIZ	36	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
38	0222400037	$2a$10$D9q7zUFv94fkgh6C/zpV6evPSRcwjOXENpVduWvll.8YThNozGmx.	ESTUDIANTE	MATEO ROJAS QUINTERO QUINTERO	37	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
39	0222400038	$2a$10$Q9nNsagQFXmTDFy7RZDYkesZJCLYNPgmO6eelrZCFeJi.iflLcOFm	ESTUDIANTE	SOFIA MEJIA ARANGO HERNANDEZ	38	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
40	0222400039	$2a$10$2CQRDJ6FDYCBbWAmF8aoIOAJsVMwL.2qWZrGD3j6iOTM.uGLe.zWq	ESTUDIANTE	NICOLAS QUINTERO SOTO CORTES	39	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
41	0222400040	$2a$10$vC9jZE2QZa6N3t49WBvDweErgQ1bF25zJuNTTTCZaI.OQZ9tuZ9/i	ESTUDIANTE	MARIA FERNANDA PEREZ GOMEZ PEREZ	40	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
43	0222400042	$2a$10$H1NF/kTUp9xT6L01FMqjAepAETursrkPcRUBX9Av9N3beT0hSomzi	ESTUDIANTE	GABRIELA MARTINEZ DIAZ SUAREZ	42	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
44	0222400043	$2a$10$osZMMR/szTmrlLZYEkIyWOCfTyaovEm0lEdBRz5dbPmxowQNDZFE2	ESTUDIANTE	DANIEL GARCIA HERNANDEZ RODRIGUEZ	43	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
42	0222400041	$2a$10$c42Ttpbnnv.gwADtU5lurekdelvK2pdOKKrHtwvZ5EWpLqANp/0De	ESTUDIANTE	SANTIAGO RODRIGUEZ LOPEZ DIAZ	41	\N	ACTIVO	2026-10-23 01:27:57.294055+00	2026-10-23 01:24:09.266586+00
45	0222400044	$2a$10$ybBDv0mZEYDF9BTNBipz8OAPi8LmjbQmbgF/ujUaKhMQm5INk1fe.	ESTUDIANTE	PAULA LOPEZ SANCHEZ RAMIREZ	44	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
46	0222400045	$2a$10$LjfACBkK.YGQbo2N4/RnPuIHmh4AeYI9QroochPQacSNyWqyiLkOO	ESTUDIANTE	KEVIN GONZALEZ RAMIREZ MORENO	45	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
47	0222400046	$2a$10$j76xm7SEvURNBN1Xj03VhuvD1X7ypmsbrXIm4ktJFWitf2nlwWt3e	ESTUDIANTE	MANUELA HERNANDEZ TORRES MARTINEZ	46	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
48	0222400047	$2a$10$rBbF071ut0unSapcbcp2x.4YYaz9OTUpc6IMEJJr3poP7R.b88DWS	ESTUDIANTE	ESTEBAN DIAZ CASTRO CASTRO	47	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
49	0222400048	$2a$10$hCTG6RSfqPWdQnX4FgJaR.98cWE5O31.JDSfEm/l1ruGJ/oOHDrz2	ESTUDIANTE	JULIANA RAMIREZ VARGAS ACOSTA	48	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
50	0222400049	$2a$10$nuy07D15V5rJ6XasbSMhReMnBqVHabWuCg1UQEdUzsdTN2HkVJmbC	ESTUDIANTE	OSCAR CASTRO ORTIZ GARCIA	49	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
51	0222400050	$2a$10$YMob7d.FtrjpjV3jOhVGsO8Odsa8vqa42wBAB2H6y88w0o1QYe9zu	ESTUDIANTE	JUAN CAMILO TORRES MORENO TORRES	50	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
53	72104567	$2a$10$MkCHqA9.OnAjHj.qJ71DMuUIsRxZ64mK04LSiASbmCpQ3AoyzYB8y	DOCENTE	MARIA FERNANDA RUIZ CASTRO	\N	2	ACTIVO	\N	2026-10-23 01:24:09.266586+00
54	73098812	$2a$10$p69wrldNLAynTz3MZ3tHVOiBze/2.VmnEOTjg5oTDHKEfP7J52dG6	DOCENTE	CARLOS ALBERTO MENDOZA SIERRA	\N	3	ACTIVO	\N	2026-10-23 01:24:09.266586+00
55	10304566	$2a$10$YjOf3ka4n18TVKQe9l7cDu2WNX8Jv1NPFSImxA2hZXCFB86jNtnD2	DOCENTE	LUIS EDUARDO PATERNINA CUELLO	\N	4	ACTIVO	\N	2026-10-23 01:24:09.266586+00
1	admin	$2a$10$RBNzxuMBcWYiWt0GfyIMi.QwUppdPNq3vEhw7czEyQE6QD1gPaVRC	ADMIN	Administrador del sistema	\N	\N	ACTIVO	2026-10-23 01:24:45.506446+00	2026-10-23 01:24:09.266586+00
52	10301274	$2a$10$9O.rJVpB8YgCZMvf0yVvCe/SFj/Ksrb342n4IxHYbsLMqbpGZB5uW	DOCENTE	GABRIEL ELIAS CHANCHI GOLONDRINO	\N	1	ACTIVO	2026-10-23 01:25:05.586469+00	2026-10-23 01:24:09.266586+00
2	0222400001	$2a$10$xKDdnF7vaeDJvvliRoLqneiUAEctXtYuBT8e2mq.gwFx9ZXZ81cgS	ESTUDIANTE	MARIA JOSE RODRIGUEZ LOPEZ DIAZ	1	\N	ACTIVO	2026-10-23 01:27:57.665088+00	2026-10-23 01:24:09.266586+00
\.


--
-- Name: asignatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.asignatura_id_seq', 6, true);


--
-- Name: aspirante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.aspirante_id_seq', 1, false);


--
-- Name: campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.campus_id_seq', 5, true);


--
-- Name: categoria_imagen_campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categoria_imagen_campus_id_seq', 7, true);


--
-- Name: categoria_pregunta_evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categoria_pregunta_evaluacion_id_seq', 4, true);


--
-- Name: concepto_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.concepto_pago_id_seq', 3, true);


--
-- Name: departamento_academico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.departamento_academico_id_seq', 1, true);


--
-- Name: docente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.docente_id_seq', 4, true);


--
-- Name: documento_aspirante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.documento_aspirante_id_seq', 1, false);


--
-- Name: encuesta_evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.encuesta_evaluacion_id_seq', 120, true);


--
-- Name: estudiante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estudiante_id_seq', 50, true);


--
-- Name: evaluacion_docente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.evaluacion_docente_id_seq', 6, true);


--
-- Name: factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.factura_id_seq', 1, false);


--
-- Name: facultad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.facultad_id_seq', 1, true);


--
-- Name: imagen_campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.imagen_campus_id_seq', 5, true);


--
-- Name: inscripcion_evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inscripcion_evaluacion_id_seq', 130, true);


--
-- Name: inscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inscripcion_id_seq', 1, false);


--
-- Name: moneda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moneda_id_seq', 2, true);


--
-- Name: naturaleza_asignatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.naturaleza_asignatura_id_seq', 6, true);


--
-- Name: nivel_curricular_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nivel_curricular_id_seq', 1, false);


--
-- Name: oferta_admision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.oferta_admision_id_seq', 1, false);


--
-- Name: periodicidad_academica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.periodicidad_academica_id_seq', 4, true);


--
-- Name: periodo_admision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.periodo_admision_id_seq', 1, false);


--
-- Name: plan_asignatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plan_asignatura_id_seq', 1, false);


--
-- Name: plan_estudios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plan_estudios_id_seq', 1, true);


--
-- Name: pregunta_evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pregunta_evaluacion_id_seq', 17, true);


--
-- Name: programa_academico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.programa_academico_id_seq', 1, true);


--
-- Name: requisito_plan_asignatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.requisito_plan_asignatura_id_seq', 1, false);


--
-- Name: respuesta_pregunta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.respuesta_pregunta_id_seq', 2040, true);


--
-- Name: sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sesion_id_seq', 5, true);


--
-- Name: tipo_asignatura_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_asignatura_plan_id_seq', 4, true);


--
-- Name: tipo_requisito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_requisito_id_seq', 3, true);


--
-- Name: universidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.universidad_id_seq', 1, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_id_seq', 55, true);


--
-- Name: asignatura_naturaleza asignatura_naturaleza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asignatura_naturaleza
    ADD CONSTRAINT asignatura_naturaleza_pkey PRIMARY KEY (asignatura_id, naturaleza_id);


--
-- Name: asignatura asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY (id);


--
-- Name: aspirante aspirante_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aspirante
    ADD CONSTRAINT aspirante_pkey PRIMARY KEY (id);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (id);


--
-- Name: categoria_imagen_campus categoria_imagen_campus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria_imagen_campus
    ADD CONSTRAINT categoria_imagen_campus_pkey PRIMARY KEY (id);


--
-- Name: categoria_pregunta_evaluacion categoria_pregunta_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria_pregunta_evaluacion
    ADD CONSTRAINT categoria_pregunta_evaluacion_pkey PRIMARY KEY (id);


--
-- Name: concepto_pago concepto_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.concepto_pago
    ADD CONSTRAINT concepto_pago_pkey PRIMARY KEY (id);


--
-- Name: departamento_academico departamento_academico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departamento_academico
    ADD CONSTRAINT departamento_academico_pkey PRIMARY KEY (id);


--
-- Name: docente docente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (id);


--
-- Name: documento_aspirante documento_aspirante_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documento_aspirante
    ADD CONSTRAINT documento_aspirante_pkey PRIMARY KEY (id);


--
-- Name: encuesta_evaluacion encuesta_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.encuesta_evaluacion
    ADD CONSTRAINT encuesta_evaluacion_pkey PRIMARY KEY (id);


--
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id);


--
-- Name: evaluacion_docente evaluacion_docente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evaluacion_docente
    ADD CONSTRAINT evaluacion_docente_pkey PRIMARY KEY (id);


--
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id);


--
-- Name: facultad facultad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: imagen_campus imagen_campus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imagen_campus
    ADD CONSTRAINT imagen_campus_pkey PRIMARY KEY (id);


--
-- Name: inscripcion_evaluacion inscripcion_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inscripcion_evaluacion
    ADD CONSTRAINT inscripcion_evaluacion_pkey PRIMARY KEY (id);


--
-- Name: inscripcion inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_pkey PRIMARY KEY (id);


--
-- Name: moneda moneda_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (id);


--
-- Name: naturaleza_asignatura naturaleza_asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.naturaleza_asignatura
    ADD CONSTRAINT naturaleza_asignatura_pkey PRIMARY KEY (id);


--
-- Name: nivel_curricular nivel_curricular_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nivel_curricular
    ADD CONSTRAINT nivel_curricular_pkey PRIMARY KEY (id);


--
-- Name: oferta_admision oferta_admision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oferta_admision
    ADD CONSTRAINT oferta_admision_pkey PRIMARY KEY (id);


--
-- Name: periodicidad_academica periodicidad_academica_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.periodicidad_academica
    ADD CONSTRAINT periodicidad_academica_pkey PRIMARY KEY (id);


--
-- Name: periodo_admision periodo_admision_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.periodo_admision
    ADD CONSTRAINT periodo_admision_pkey PRIMARY KEY (id);


--
-- Name: plan_asignatura plan_asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_asignatura
    ADD CONSTRAINT plan_asignatura_pkey PRIMARY KEY (id);


--
-- Name: plan_estudios plan_estudios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_estudios
    ADD CONSTRAINT plan_estudios_pkey PRIMARY KEY (id);


--
-- Name: pregunta_evaluacion pregunta_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pregunta_evaluacion
    ADD CONSTRAINT pregunta_evaluacion_pkey PRIMARY KEY (id);


--
-- Name: programa_academico programa_academico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programa_academico
    ADD CONSTRAINT programa_academico_pkey PRIMARY KEY (id);


--
-- Name: programa_campus programa_campus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programa_campus
    ADD CONSTRAINT programa_campus_pkey PRIMARY KEY (programa_id, campus_id);


--
-- Name: requisito_plan_asignatura requisito_plan_asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requisito_plan_asignatura
    ADD CONSTRAINT requisito_plan_asignatura_pkey PRIMARY KEY (id);


--
-- Name: respuesta_pregunta respuesta_pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuesta_pregunta
    ADD CONSTRAINT respuesta_pregunta_pkey PRIMARY KEY (id);


--
-- Name: sesion sesion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesion
    ADD CONSTRAINT sesion_pkey PRIMARY KEY (id);


--
-- Name: sesion sesion_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesion
    ADD CONSTRAINT sesion_token_key UNIQUE (token);


--
-- Name: tipo_asignatura_plan tipo_asignatura_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_asignatura_plan
    ADD CONSTRAINT tipo_asignatura_plan_pkey PRIMARY KEY (id);


--
-- Name: tipo_requisito tipo_requisito_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_requisito
    ADD CONSTRAINT tipo_requisito_pkey PRIMARY KEY (id);


--
-- Name: universidad universidad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_pkey PRIMARY KEY (id);


--
-- Name: asignatura uq_asignatura_departamento_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT uq_asignatura_departamento_codigo UNIQUE (departamento_id, codigo);


--
-- Name: aspirante uq_aspirante_documento; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aspirante
    ADD CONSTRAINT uq_aspirante_documento UNIQUE (tipo_documento, numero_documento);


--
-- Name: campus uq_campus_universidad_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT uq_campus_universidad_codigo UNIQUE (universidad_id, codigo);


--
-- Name: categoria_imagen_campus uq_categoria_imagen_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria_imagen_campus
    ADD CONSTRAINT uq_categoria_imagen_codigo UNIQUE (codigo);


--
-- Name: categoria_pregunta_evaluacion uq_categoria_pregunta_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria_pregunta_evaluacion
    ADD CONSTRAINT uq_categoria_pregunta_codigo UNIQUE (codigo);


--
-- Name: concepto_pago uq_concepto_pago_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.concepto_pago
    ADD CONSTRAINT uq_concepto_pago_codigo UNIQUE (codigo);


--
-- Name: departamento_academico uq_departamento_facultad_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departamento_academico
    ADD CONSTRAINT uq_departamento_facultad_codigo UNIQUE (facultad_id, codigo);


--
-- Name: departamento_academico uq_departamento_facultad_nombre; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departamento_academico
    ADD CONSTRAINT uq_departamento_facultad_nombre UNIQUE (facultad_id, nombre);


--
-- Name: docente uq_docente_documento; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT uq_docente_documento UNIQUE (numero_documento);


--
-- Name: encuesta_evaluacion uq_encuesta_evaluacion_estudiante; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.encuesta_evaluacion
    ADD CONSTRAINT uq_encuesta_evaluacion_estudiante UNIQUE (evaluacion_id, estudiante_id);


--
-- Name: estudiante uq_estudiante_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT uq_estudiante_codigo UNIQUE (codigo);


--
-- Name: estudiante uq_estudiante_documento; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT uq_estudiante_documento UNIQUE (numero_documento);


--
-- Name: evaluacion_docente uq_evaluacion_docente_materia; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evaluacion_docente
    ADD CONSTRAINT uq_evaluacion_docente_materia UNIQUE (docente_id, asignatura_id, grupo, periodo);


--
-- Name: factura uq_factura_numero; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT uq_factura_numero UNIQUE (numero_factura);


--
-- Name: facultad uq_facultad_universidad_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT uq_facultad_universidad_codigo UNIQUE (universidad_id, codigo);


--
-- Name: facultad uq_facultad_universidad_nombre; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT uq_facultad_universidad_nombre UNIQUE (universidad_id, nombre);


--
-- Name: inscripcion uq_inscripcion_aspirante_oferta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT uq_inscripcion_aspirante_oferta UNIQUE (aspirante_id, oferta_admision_id);


--
-- Name: inscripcion_evaluacion uq_inscripcion_evaluacion_estudiante; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inscripcion_evaluacion
    ADD CONSTRAINT uq_inscripcion_evaluacion_estudiante UNIQUE (evaluacion_id, estudiante_id);


--
-- Name: moneda uq_moneda_codigo_iso; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moneda
    ADD CONSTRAINT uq_moneda_codigo_iso UNIQUE (codigo_iso);


--
-- Name: naturaleza_asignatura uq_naturaleza_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.naturaleza_asignatura
    ADD CONSTRAINT uq_naturaleza_codigo UNIQUE (codigo);


--
-- Name: nivel_curricular uq_nivel_plan_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nivel_curricular
    ADD CONSTRAINT uq_nivel_plan_id UNIQUE (plan_estudios_id, id);


--
-- Name: nivel_curricular uq_nivel_plan_numero; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nivel_curricular
    ADD CONSTRAINT uq_nivel_plan_numero UNIQUE (plan_estudios_id, numero_nivel);


--
-- Name: oferta_admision uq_oferta_periodo_programa_campus; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oferta_admision
    ADD CONSTRAINT uq_oferta_periodo_programa_campus UNIQUE (periodo_admision_id, programa_id, campus_id);


--
-- Name: periodicidad_academica uq_periodicidad_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.periodicidad_academica
    ADD CONSTRAINT uq_periodicidad_codigo UNIQUE (codigo);


--
-- Name: periodo_admision uq_periodo_admision_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.periodo_admision
    ADD CONSTRAINT uq_periodo_admision_codigo UNIQUE (codigo);


--
-- Name: plan_asignatura uq_plan_asignatura; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_asignatura
    ADD CONSTRAINT uq_plan_asignatura UNIQUE (plan_estudios_id, asignatura_id);


--
-- Name: plan_asignatura uq_plan_asignatura_plan_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_asignatura
    ADD CONSTRAINT uq_plan_asignatura_plan_id UNIQUE (plan_estudios_id, id);


--
-- Name: plan_estudios uq_plan_programa_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_estudios
    ADD CONSTRAINT uq_plan_programa_codigo UNIQUE (programa_id, codigo_pensum);


--
-- Name: pregunta_evaluacion uq_pregunta_numero; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pregunta_evaluacion
    ADD CONSTRAINT uq_pregunta_numero UNIQUE (numero);


--
-- Name: programa_academico uq_programa_codigo_snies; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programa_academico
    ADD CONSTRAINT uq_programa_codigo_snies UNIQUE (codigo_snies);


--
-- Name: programa_academico uq_programa_facultad_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programa_academico
    ADD CONSTRAINT uq_programa_facultad_codigo UNIQUE (facultad_id, codigo_interno);


--
-- Name: requisito_plan_asignatura uq_requisito; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requisito_plan_asignatura
    ADD CONSTRAINT uq_requisito UNIQUE (plan_asignatura_id, plan_asignatura_requerida_id, tipo_requisito_id);


--
-- Name: respuesta_pregunta uq_respuesta_encuesta_pregunta; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuesta_pregunta
    ADD CONSTRAINT uq_respuesta_encuesta_pregunta UNIQUE (encuesta_id, pregunta_id);


--
-- Name: tipo_asignatura_plan uq_tipo_asignatura_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_asignatura_plan
    ADD CONSTRAINT uq_tipo_asignatura_codigo UNIQUE (codigo);


--
-- Name: tipo_requisito uq_tipo_requisito_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_requisito
    ADD CONSTRAINT uq_tipo_requisito_codigo UNIQUE (codigo);


--
-- Name: universidad uq_universidad_codigo; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT uq_universidad_codigo UNIQUE (codigo);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_username_key UNIQUE (username);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: idx_sesion_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_sesion_token ON public.sesion USING btree (token);


--
-- Name: idx_sesion_usuario; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_sesion_usuario ON public.sesion USING btree (usuario_id);


--
-- Name: idx_usuario_estudiante; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_usuario_estudiante ON public.usuario USING btree (estudiante_id);


--
-- Name: asignatura fk_asignatura_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT fk_asignatura_departamento FOREIGN KEY (departamento_id) REFERENCES public.departamento_academico(id) ON DELETE RESTRICT;


--
-- Name: asignatura_naturaleza fk_asignatura_naturaleza_asignatura; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asignatura_naturaleza
    ADD CONSTRAINT fk_asignatura_naturaleza_asignatura FOREIGN KEY (asignatura_id) REFERENCES public.asignatura(id) ON DELETE CASCADE;


--
-- Name: asignatura_naturaleza fk_asignatura_naturaleza_naturaleza; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.asignatura_naturaleza
    ADD CONSTRAINT fk_asignatura_naturaleza_naturaleza FOREIGN KEY (naturaleza_id) REFERENCES public.naturaleza_asignatura(id) ON DELETE RESTRICT;


--
-- Name: campus fk_campus_universidad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT fk_campus_universidad FOREIGN KEY (universidad_id) REFERENCES public.universidad(id) ON DELETE RESTRICT;


--
-- Name: departamento_academico fk_departamento_facultad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departamento_academico
    ADD CONSTRAINT fk_departamento_facultad FOREIGN KEY (facultad_id) REFERENCES public.facultad(id) ON DELETE RESTRICT;


--
-- Name: docente fk_docente_departamento; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT fk_docente_departamento FOREIGN KEY (departamento_id) REFERENCES public.departamento_academico(id) ON DELETE RESTRICT;


--
-- Name: documento_aspirante fk_documento_inscripcion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documento_aspirante
    ADD CONSTRAINT fk_documento_inscripcion FOREIGN KEY (inscripcion_id) REFERENCES public.inscripcion(id) ON DELETE CASCADE;


--
-- Name: encuesta_evaluacion fk_encuesta_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.encuesta_evaluacion
    ADD CONSTRAINT fk_encuesta_estudiante FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id) ON DELETE RESTRICT;


--
-- Name: encuesta_evaluacion fk_encuesta_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.encuesta_evaluacion
    ADD CONSTRAINT fk_encuesta_evaluacion FOREIGN KEY (evaluacion_id) REFERENCES public.evaluacion_docente(id) ON DELETE CASCADE;


--
-- Name: estudiante fk_estudiante_plan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT fk_estudiante_plan FOREIGN KEY (plan_estudios_id) REFERENCES public.plan_estudios(id) ON DELETE RESTRICT;


--
-- Name: estudiante fk_estudiante_programa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT fk_estudiante_programa FOREIGN KEY (programa_id) REFERENCES public.programa_academico(id) ON DELETE RESTRICT;


--
-- Name: evaluacion_docente fk_evaluacion_asignatura; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evaluacion_docente
    ADD CONSTRAINT fk_evaluacion_asignatura FOREIGN KEY (asignatura_id) REFERENCES public.asignatura(id) ON DELETE RESTRICT;


--
-- Name: evaluacion_docente fk_evaluacion_docente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evaluacion_docente
    ADD CONSTRAINT fk_evaluacion_docente FOREIGN KEY (docente_id) REFERENCES public.docente(id) ON DELETE RESTRICT;


--
-- Name: evaluacion_docente fk_evaluacion_programa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evaluacion_docente
    ADD CONSTRAINT fk_evaluacion_programa FOREIGN KEY (programa_id) REFERENCES public.programa_academico(id) ON DELETE RESTRICT;


--
-- Name: factura fk_factura_concepto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_factura_concepto FOREIGN KEY (concepto_pago_id) REFERENCES public.concepto_pago(id) ON DELETE RESTRICT;


--
-- Name: factura fk_factura_inscripcion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_factura_inscripcion FOREIGN KEY (inscripcion_id) REFERENCES public.inscripcion(id) ON DELETE RESTRICT;


--
-- Name: factura fk_factura_moneda; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_factura_moneda FOREIGN KEY (moneda_id) REFERENCES public.moneda(id) ON DELETE RESTRICT;


--
-- Name: facultad fk_facultad_universidad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT fk_facultad_universidad FOREIGN KEY (universidad_id) REFERENCES public.universidad(id) ON DELETE RESTRICT;


--
-- Name: imagen_campus fk_imagen_campus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imagen_campus
    ADD CONSTRAINT fk_imagen_campus FOREIGN KEY (campus_id) REFERENCES public.campus(id) ON DELETE CASCADE;


--
-- Name: imagen_campus fk_imagen_categoria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imagen_campus
    ADD CONSTRAINT fk_imagen_categoria FOREIGN KEY (categoria_id) REFERENCES public.categoria_imagen_campus(id) ON DELETE RESTRICT;


--
-- Name: inscripcion fk_inscripcion_aspirante; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT fk_inscripcion_aspirante FOREIGN KEY (aspirante_id) REFERENCES public.aspirante(id) ON DELETE RESTRICT;


--
-- Name: inscripcion_evaluacion fk_inscripcion_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inscripcion_evaluacion
    ADD CONSTRAINT fk_inscripcion_estudiante FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id) ON DELETE CASCADE;


--
-- Name: inscripcion_evaluacion fk_inscripcion_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inscripcion_evaluacion
    ADD CONSTRAINT fk_inscripcion_evaluacion FOREIGN KEY (evaluacion_id) REFERENCES public.evaluacion_docente(id) ON DELETE CASCADE;


--
-- Name: inscripcion fk_inscripcion_oferta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT fk_inscripcion_oferta FOREIGN KEY (oferta_admision_id) REFERENCES public.oferta_admision(id) ON DELETE RESTRICT;


--
-- Name: nivel_curricular fk_nivel_plan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nivel_curricular
    ADD CONSTRAINT fk_nivel_plan FOREIGN KEY (plan_estudios_id) REFERENCES public.plan_estudios(id) ON DELETE CASCADE;


--
-- Name: oferta_admision fk_oferta_campus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oferta_admision
    ADD CONSTRAINT fk_oferta_campus FOREIGN KEY (campus_id) REFERENCES public.campus(id) ON DELETE RESTRICT;


--
-- Name: oferta_admision fk_oferta_moneda; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oferta_admision
    ADD CONSTRAINT fk_oferta_moneda FOREIGN KEY (moneda_id) REFERENCES public.moneda(id) ON DELETE RESTRICT;


--
-- Name: oferta_admision fk_oferta_pensum; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oferta_admision
    ADD CONSTRAINT fk_oferta_pensum FOREIGN KEY (plan_estudios_id) REFERENCES public.plan_estudios(id) ON DELETE RESTRICT;


--
-- Name: oferta_admision fk_oferta_periodo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oferta_admision
    ADD CONSTRAINT fk_oferta_periodo FOREIGN KEY (periodo_admision_id) REFERENCES public.periodo_admision(id) ON DELETE RESTRICT;


--
-- Name: oferta_admision fk_oferta_programa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oferta_admision
    ADD CONSTRAINT fk_oferta_programa FOREIGN KEY (programa_id) REFERENCES public.programa_academico(id) ON DELETE RESTRICT;


--
-- Name: plan_asignatura fk_plan_asignatura_asignatura; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_asignatura
    ADD CONSTRAINT fk_plan_asignatura_asignatura FOREIGN KEY (asignatura_id) REFERENCES public.asignatura(id) ON DELETE RESTRICT;


--
-- Name: plan_asignatura fk_plan_asignatura_nivel; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_asignatura
    ADD CONSTRAINT fk_plan_asignatura_nivel FOREIGN KEY (plan_estudios_id, nivel_curricular_id) REFERENCES public.nivel_curricular(plan_estudios_id, id) ON DELETE RESTRICT;


--
-- Name: plan_asignatura fk_plan_asignatura_plan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_asignatura
    ADD CONSTRAINT fk_plan_asignatura_plan FOREIGN KEY (plan_estudios_id) REFERENCES public.plan_estudios(id) ON DELETE CASCADE;


--
-- Name: plan_asignatura fk_plan_asignatura_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_asignatura
    ADD CONSTRAINT fk_plan_asignatura_tipo FOREIGN KEY (tipo_asignatura_id) REFERENCES public.tipo_asignatura_plan(id) ON DELETE RESTRICT;


--
-- Name: plan_estudios fk_plan_periodicidad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_estudios
    ADD CONSTRAINT fk_plan_periodicidad FOREIGN KEY (periodicidad_id) REFERENCES public.periodicidad_academica(id) ON DELETE RESTRICT;


--
-- Name: plan_estudios fk_plan_programa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_estudios
    ADD CONSTRAINT fk_plan_programa FOREIGN KEY (programa_id) REFERENCES public.programa_academico(id) ON DELETE RESTRICT;


--
-- Name: pregunta_evaluacion fk_pregunta_categoria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pregunta_evaluacion
    ADD CONSTRAINT fk_pregunta_categoria FOREIGN KEY (categoria_id) REFERENCES public.categoria_pregunta_evaluacion(id) ON DELETE RESTRICT;


--
-- Name: programa_campus fk_progcampus_campus; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programa_campus
    ADD CONSTRAINT fk_progcampus_campus FOREIGN KEY (campus_id) REFERENCES public.campus(id) ON DELETE CASCADE;


--
-- Name: programa_campus fk_progcampus_programa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programa_campus
    ADD CONSTRAINT fk_progcampus_programa FOREIGN KEY (programa_id) REFERENCES public.programa_academico(id) ON DELETE CASCADE;


--
-- Name: programa_academico fk_programa_facultad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programa_academico
    ADD CONSTRAINT fk_programa_facultad FOREIGN KEY (facultad_id) REFERENCES public.facultad(id) ON DELETE RESTRICT;


--
-- Name: requisito_plan_asignatura fk_requisito_asignatura; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requisito_plan_asignatura
    ADD CONSTRAINT fk_requisito_asignatura FOREIGN KEY (plan_estudios_id, plan_asignatura_id) REFERENCES public.plan_asignatura(plan_estudios_id, id) ON DELETE CASCADE;


--
-- Name: requisito_plan_asignatura fk_requisito_asignatura_requerida; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requisito_plan_asignatura
    ADD CONSTRAINT fk_requisito_asignatura_requerida FOREIGN KEY (plan_estudios_id, plan_asignatura_requerida_id) REFERENCES public.plan_asignatura(plan_estudios_id, id) ON DELETE CASCADE;


--
-- Name: requisito_plan_asignatura fk_requisito_plan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requisito_plan_asignatura
    ADD CONSTRAINT fk_requisito_plan FOREIGN KEY (plan_estudios_id) REFERENCES public.plan_estudios(id) ON DELETE CASCADE;


--
-- Name: requisito_plan_asignatura fk_requisito_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requisito_plan_asignatura
    ADD CONSTRAINT fk_requisito_tipo FOREIGN KEY (tipo_requisito_id) REFERENCES public.tipo_requisito(id) ON DELETE RESTRICT;


--
-- Name: respuesta_pregunta fk_respuesta_encuesta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuesta_pregunta
    ADD CONSTRAINT fk_respuesta_encuesta FOREIGN KEY (encuesta_id) REFERENCES public.encuesta_evaluacion(id) ON DELETE CASCADE;


--
-- Name: respuesta_pregunta fk_respuesta_pregunta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuesta_pregunta
    ADD CONSTRAINT fk_respuesta_pregunta FOREIGN KEY (pregunta_id) REFERENCES public.pregunta_evaluacion(id) ON DELETE RESTRICT;


--
-- Name: sesion sesion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sesion
    ADD CONSTRAINT sesion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- Name: usuario usuario_docente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_docente_id_fkey FOREIGN KEY (docente_id) REFERENCES public.docente(id) ON DELETE SET NULL;


--
-- Name: usuario usuario_estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict WMQoLcmnWJ86cHJNlx0DNZNwjDvWTrHsddgaA0A18wJlGmLrkkQFbe8b5gz70tl

