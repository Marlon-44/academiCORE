--
-- PostgreSQL database dump
--

\restrict oInhE92QhusMDWSwGviCwsvRUIjeFUCzn80uq8fHtINkJtWQ30Ohv4jROXlCAfD

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
5	COMUNICACION	Comunicación	5
6	EVALUACION_APRENDIZAJE	Evaluación del Aprendizaje	6
7	GENERALIDADES	Generalidades	7
8	MOTIVACION_COMPROMISO	Motivación y Compromiso	8
9	ORIENTACION_APRENDIZAJE	Orientación en el Aprendizaje	9
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
121	7	2026-10-25 03:35:10.504112	1
122	7	2026-10-25 03:35:11.033787	3
123	7	2026-10-25 03:35:11.389336	4
124	7	2026-10-25 03:35:11.744381	6
125	7	2026-10-25 03:35:12.062155	8
126	7	2026-10-25 03:35:12.39561	10
127	7	2026-10-25 03:35:12.715718	12
128	7	2026-10-25 03:35:13.022536	14
129	7	2026-10-25 03:35:13.328512	17
130	7	2026-10-25 03:35:13.622717	19
131	7	2026-10-25 03:35:13.917135	22
132	7	2026-10-25 03:35:14.208426	25
133	7	2026-10-25 03:35:14.50498	27
134	7	2026-10-25 03:35:14.840491	30
135	7	2026-10-25 03:35:15.167316	32
136	7	2026-10-25 03:35:15.522743	35
137	7	2026-10-25 03:35:15.809319	38
138	7	2026-10-25 03:35:16.13263	40
139	7	2026-10-25 03:35:16.429758	43
140	7	2026-10-25 03:35:16.793649	45
141	7	2026-10-25 03:35:17.253051	48
142	8	2026-10-25 03:35:17.97188	1
143	8	2026-10-25 03:35:18.288845	3
144	8	2026-10-25 03:35:18.581437	5
145	8	2026-10-25 03:35:18.875393	7
146	8	2026-10-25 03:35:19.20227	9
147	8	2026-10-25 03:35:19.479076	11
148	8	2026-10-25 03:35:19.841899	13
149	8	2026-10-25 03:35:20.110203	15
150	8	2026-10-25 03:35:20.455285	17
151	8	2026-10-25 03:35:20.75761	20
152	8	2026-10-25 03:35:21.018465	23
153	8	2026-10-25 03:35:21.31331	25
154	8	2026-10-25 03:35:21.597524	28
155	8	2026-10-25 03:35:21.921481	30
156	8	2026-10-25 03:35:22.232053	33
157	8	2026-10-25 03:35:22.540706	36
158	8	2026-10-25 03:35:22.851335	38
159	8	2026-10-25 03:35:23.250481	41
160	8	2026-10-25 03:35:23.803111	43
161	8	2026-10-25 03:35:24.221203	46
162	8	2026-10-25 03:35:24.672003	49
163	9	2026-10-25 03:35:25.261239	1
164	9	2026-10-25 03:35:25.578237	2
165	9	2026-10-25 03:35:25.859005	4
166	9	2026-10-25 03:35:26.149234	6
167	9	2026-10-25 03:35:26.447506	8
168	9	2026-10-25 03:35:26.703409	10
169	9	2026-10-25 03:35:27.202973	12
170	9	2026-10-25 03:35:27.672283	14
171	9	2026-10-25 03:35:27.97178	16
172	9	2026-10-25 03:35:28.26757	19
173	9	2026-10-25 03:35:28.540324	21
174	9	2026-10-25 03:35:28.790899	24
175	9	2026-10-25 03:35:29.071281	27
176	9	2026-10-25 03:35:29.33848	29
177	9	2026-10-25 03:35:29.631383	32
178	9	2026-10-25 03:35:29.899499	34
179	9	2026-10-25 03:35:30.18452	37
180	9	2026-10-25 03:35:30.520681	40
181	9	2026-10-25 03:35:30.825052	42
182	9	2026-10-25 03:35:31.104491	45
183	9	2026-10-25 03:35:31.369762	47
184	9	2026-10-25 03:35:31.640404	50
185	10	2026-10-25 03:35:32.0513	2
186	10	2026-10-25 03:35:32.340781	3
187	10	2026-10-25 03:35:32.630061	5
188	10	2026-10-25 03:35:32.906317	7
189	10	2026-10-25 03:35:33.180775	9
190	10	2026-10-25 03:35:33.450493	11
191	10	2026-10-25 03:35:33.825942	13
192	10	2026-10-25 03:35:34.081775	15
193	10	2026-10-25 03:35:34.34516	18
194	10	2026-10-25 03:35:34.615348	20
195	10	2026-10-25 03:35:34.918893	23
196	10	2026-10-25 03:35:35.191366	26
197	10	2026-10-25 03:35:35.442679	28
198	10	2026-10-25 03:35:35.711405	31
199	10	2026-10-25 03:35:35.958764	33
200	10	2026-10-25 03:35:36.238039	36
201	10	2026-10-25 03:35:36.507974	39
202	10	2026-10-25 03:35:36.903228	41
203	10	2026-10-25 03:35:37.344683	44
204	10	2026-10-25 03:35:37.929031	46
205	10	2026-10-25 03:35:38.163304	49
206	11	2026-10-25 03:35:38.529156	2
207	11	2026-10-25 03:35:38.838923	4
208	11	2026-10-25 03:35:39.119145	5
209	11	2026-10-25 03:35:39.444898	7
210	11	2026-10-25 03:35:39.679922	9
211	11	2026-10-25 03:35:39.939784	11
212	11	2026-10-25 03:35:40.185609	13
213	11	2026-10-25 03:35:40.506418	16
214	11	2026-10-25 03:35:40.782895	18
215	11	2026-10-25 03:35:41.109255	21
216	11	2026-10-25 03:35:41.422172	24
217	11	2026-10-25 03:35:41.697025	26
218	11	2026-10-25 03:35:41.976017	29
219	11	2026-10-25 03:35:42.218002	31
220	11	2026-10-25 03:35:42.495245	34
221	11	2026-10-25 03:35:42.75026	37
222	11	2026-10-25 03:35:43.101035	39
223	11	2026-10-25 03:35:43.347162	42
224	11	2026-10-25 03:35:43.614875	44
225	11	2026-10-25 03:35:43.889019	47
226	11	2026-10-25 03:35:44.147833	50
227	12	2026-10-25 03:35:44.511638	1
228	12	2026-10-25 03:35:44.788719	2
229	12	2026-10-25 03:35:45.057307	4
230	12	2026-10-25 03:35:45.40775	6
231	12	2026-10-25 03:35:45.685292	8
232	12	2026-10-25 03:35:45.947933	10
233	12	2026-10-25 03:35:46.185541	12
234	12	2026-10-25 03:35:46.461348	14
235	12	2026-10-25 03:35:46.723286	16
236	12	2026-10-25 03:35:47.099407	19
237	12	2026-10-25 03:35:47.47812	22
238	12	2026-10-25 03:35:47.868853	24
239	12	2026-10-25 03:35:48.148856	27
240	12	2026-10-25 03:35:48.433255	30
241	12	2026-10-25 03:35:48.695728	32
242	12	2026-10-25 03:35:48.95525	35
243	12	2026-10-25 03:35:49.215523	37
244	12	2026-10-25 03:35:49.51725	40
245	12	2026-10-25 03:35:49.809955	42
246	12	2026-10-25 03:35:50.152948	45
247	12	2026-10-25 03:35:50.436398	48
248	12	2026-10-25 03:35:50.739596	50
249	13	2026-10-25 03:35:51.115748	1
250	13	2026-10-25 03:35:51.374539	3
251	13	2026-10-25 03:35:51.630287	4
252	13	2026-10-25 03:35:51.904655	6
253	13	2026-10-25 03:35:52.182733	8
254	13	2026-10-25 03:35:52.467481	10
255	13	2026-10-25 03:35:52.70254	12
256	13	2026-10-25 03:35:52.972256	14
257	13	2026-10-25 03:35:53.320364	17
258	13	2026-10-25 03:35:53.604406	20
259	13	2026-10-25 03:35:53.949733	22
260	13	2026-10-25 03:35:54.251494	25
261	13	2026-10-25 03:35:54.566888	28
262	13	2026-10-25 03:35:54.930391	30
263	13	2026-10-25 03:35:55.450182	33
264	13	2026-10-25 03:35:55.810602	35
265	13	2026-10-25 03:35:56.099391	38
266	13	2026-10-25 03:35:56.368332	40
267	13	2026-10-25 03:35:56.64748	43
268	13	2026-10-25 03:35:56.922635	46
269	13	2026-10-25 03:35:57.319036	48
270	14	2026-10-25 03:35:57.874319	2
271	14	2026-10-25 03:35:58.156293	3
272	14	2026-10-25 03:35:58.423392	5
273	14	2026-10-25 03:35:58.752633	7
274	14	2026-10-25 03:35:59.032991	9
275	14	2026-10-25 03:35:59.2646	11
276	14	2026-10-25 03:35:59.509578	13
277	14	2026-10-25 03:35:59.806499	15
278	14	2026-10-25 03:36:00.082619	18
279	14	2026-10-25 03:36:00.402973	21
280	14	2026-10-25 03:36:00.771549	23
281	14	2026-10-25 03:36:01.074018	26
282	14	2026-10-25 03:36:01.360052	29
283	14	2026-10-25 03:36:01.635893	31
284	14	2026-10-25 03:36:01.917698	34
285	14	2026-10-25 03:36:02.200671	36
286	14	2026-10-25 03:36:02.461752	39
287	14	2026-10-25 03:36:02.788794	41
288	14	2026-10-25 03:36:03.066741	44
289	14	2026-10-25 03:36:03.329591	47
290	14	2026-10-25 03:36:03.587089	49
291	6	2026-10-25 03:41:39.920779	41
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
7	2	1	1	B2	2026-2	21	ABIERTA	2026-10-25 02:25:17.91049
8	3	4	1	A1	2026-2	21	ABIERTA	2026-10-25 02:25:17.91049
9	1	5	1	A1	2026-2	22	ABIERTA	2026-10-25 02:25:17.91049
10	3	2	1	B1	2026-2	21	ABIERTA	2026-10-25 02:25:17.91049
11	4	3	1	A1	2026-2	21	ABIERTA	2026-10-25 02:25:17.91049
12	1	3	1	B1	2026-2	22	ABIERTA	2026-10-25 02:25:17.91049
13	2	6	1	A1	2026-2	21	ABIERTA	2026-10-25 02:25:17.91049
14	4	5	1	A2	2026-2	21	ABIERTA	2026-10-25 02:25:17.91049
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
12	12	instrumento sig percepcion estudiantil 2026	SQL	V12__instrumento_sig_percepcion_estudiantil_2026.sql	-1792646281	academicore	2026-10-25 02:25:15.247286	757	t
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
131	7	48	2026-10-25 02:25:17.91049
132	7	45	2026-10-25 02:25:17.91049
133	7	43	2026-10-25 02:25:17.91049
134	7	40	2026-10-25 02:25:17.91049
135	7	38	2026-10-25 02:25:17.91049
136	7	35	2026-10-25 02:25:17.91049
137	7	32	2026-10-25 02:25:17.91049
138	7	30	2026-10-25 02:25:17.91049
139	7	27	2026-10-25 02:25:17.91049
140	7	25	2026-10-25 02:25:17.91049
141	7	22	2026-10-25 02:25:17.91049
142	7	19	2026-10-25 02:25:17.91049
143	7	17	2026-10-25 02:25:17.91049
144	7	14	2026-10-25 02:25:17.91049
145	7	12	2026-10-25 02:25:17.91049
146	7	10	2026-10-25 02:25:17.91049
147	7	8	2026-10-25 02:25:17.91049
148	7	6	2026-10-25 02:25:17.91049
149	7	4	2026-10-25 02:25:17.91049
150	7	3	2026-10-25 02:25:17.91049
151	7	1	2026-10-25 02:25:17.91049
152	8	49	2026-10-25 02:25:17.91049
153	8	46	2026-10-25 02:25:17.91049
154	8	43	2026-10-25 02:25:17.91049
155	8	41	2026-10-25 02:25:17.91049
156	8	38	2026-10-25 02:25:17.91049
157	8	36	2026-10-25 02:25:17.91049
158	8	33	2026-10-25 02:25:17.91049
159	8	30	2026-10-25 02:25:17.91049
160	8	28	2026-10-25 02:25:17.91049
161	8	25	2026-10-25 02:25:17.91049
162	8	23	2026-10-25 02:25:17.91049
163	8	20	2026-10-25 02:25:17.91049
164	8	17	2026-10-25 02:25:17.91049
165	8	15	2026-10-25 02:25:17.91049
166	8	13	2026-10-25 02:25:17.91049
167	8	11	2026-10-25 02:25:17.91049
168	8	9	2026-10-25 02:25:17.91049
169	8	7	2026-10-25 02:25:17.91049
170	8	5	2026-10-25 02:25:17.91049
171	8	3	2026-10-25 02:25:17.91049
172	8	1	2026-10-25 02:25:17.91049
173	9	50	2026-10-25 02:25:17.91049
174	9	47	2026-10-25 02:25:17.91049
175	9	45	2026-10-25 02:25:17.91049
176	9	42	2026-10-25 02:25:17.91049
177	9	40	2026-10-25 02:25:17.91049
178	9	37	2026-10-25 02:25:17.91049
179	9	34	2026-10-25 02:25:17.91049
180	9	32	2026-10-25 02:25:17.91049
181	9	29	2026-10-25 02:25:17.91049
182	9	27	2026-10-25 02:25:17.91049
183	9	24	2026-10-25 02:25:17.91049
184	9	21	2026-10-25 02:25:17.91049
185	9	19	2026-10-25 02:25:17.91049
186	9	16	2026-10-25 02:25:17.91049
187	9	14	2026-10-25 02:25:17.91049
188	9	12	2026-10-25 02:25:17.91049
189	9	10	2026-10-25 02:25:17.91049
190	9	8	2026-10-25 02:25:17.91049
191	9	6	2026-10-25 02:25:17.91049
192	9	4	2026-10-25 02:25:17.91049
193	9	2	2026-10-25 02:25:17.91049
194	9	1	2026-10-25 02:25:17.91049
195	10	49	2026-10-25 02:25:17.91049
196	10	46	2026-10-25 02:25:17.91049
197	10	44	2026-10-25 02:25:17.91049
198	10	41	2026-10-25 02:25:17.91049
199	10	39	2026-10-25 02:25:17.91049
200	10	36	2026-10-25 02:25:17.91049
201	10	33	2026-10-25 02:25:17.91049
202	10	31	2026-10-25 02:25:17.91049
203	10	28	2026-10-25 02:25:17.91049
204	10	26	2026-10-25 02:25:17.91049
205	10	23	2026-10-25 02:25:17.91049
206	10	20	2026-10-25 02:25:17.91049
207	10	18	2026-10-25 02:25:17.91049
208	10	15	2026-10-25 02:25:17.91049
209	10	13	2026-10-25 02:25:17.91049
210	10	11	2026-10-25 02:25:17.91049
211	10	9	2026-10-25 02:25:17.91049
212	10	7	2026-10-25 02:25:17.91049
213	10	5	2026-10-25 02:25:17.91049
214	10	3	2026-10-25 02:25:17.91049
215	10	2	2026-10-25 02:25:17.91049
216	11	50	2026-10-25 02:25:17.91049
217	11	47	2026-10-25 02:25:17.91049
218	11	44	2026-10-25 02:25:17.91049
219	11	42	2026-10-25 02:25:17.91049
220	11	39	2026-10-25 02:25:17.91049
221	11	37	2026-10-25 02:25:17.91049
222	11	34	2026-10-25 02:25:17.91049
223	11	31	2026-10-25 02:25:17.91049
224	11	29	2026-10-25 02:25:17.91049
225	11	26	2026-10-25 02:25:17.91049
226	11	24	2026-10-25 02:25:17.91049
227	11	21	2026-10-25 02:25:17.91049
228	11	18	2026-10-25 02:25:17.91049
229	11	16	2026-10-25 02:25:17.91049
230	11	13	2026-10-25 02:25:17.91049
231	11	11	2026-10-25 02:25:17.91049
232	11	9	2026-10-25 02:25:17.91049
233	11	7	2026-10-25 02:25:17.91049
234	11	5	2026-10-25 02:25:17.91049
235	11	4	2026-10-25 02:25:17.91049
236	11	2	2026-10-25 02:25:17.91049
237	12	50	2026-10-25 02:25:17.91049
238	12	48	2026-10-25 02:25:17.91049
239	12	45	2026-10-25 02:25:17.91049
240	12	42	2026-10-25 02:25:17.91049
241	12	40	2026-10-25 02:25:17.91049
242	12	37	2026-10-25 02:25:17.91049
243	12	35	2026-10-25 02:25:17.91049
244	12	32	2026-10-25 02:25:17.91049
245	12	30	2026-10-25 02:25:17.91049
246	12	27	2026-10-25 02:25:17.91049
247	12	24	2026-10-25 02:25:17.91049
248	12	22	2026-10-25 02:25:17.91049
249	12	19	2026-10-25 02:25:17.91049
250	12	16	2026-10-25 02:25:17.91049
251	12	14	2026-10-25 02:25:17.91049
252	12	12	2026-10-25 02:25:17.91049
253	12	10	2026-10-25 02:25:17.91049
254	12	8	2026-10-25 02:25:17.91049
255	12	6	2026-10-25 02:25:17.91049
256	12	4	2026-10-25 02:25:17.91049
257	12	2	2026-10-25 02:25:17.91049
258	12	1	2026-10-25 02:25:17.91049
259	13	48	2026-10-25 02:25:17.91049
260	13	46	2026-10-25 02:25:17.91049
261	13	43	2026-10-25 02:25:17.91049
262	13	40	2026-10-25 02:25:17.91049
263	13	38	2026-10-25 02:25:17.91049
264	13	35	2026-10-25 02:25:17.91049
265	13	33	2026-10-25 02:25:17.91049
266	13	30	2026-10-25 02:25:17.91049
267	13	28	2026-10-25 02:25:17.91049
268	13	25	2026-10-25 02:25:17.91049
269	13	22	2026-10-25 02:25:17.91049
270	13	20	2026-10-25 02:25:17.91049
271	13	17	2026-10-25 02:25:17.91049
272	13	14	2026-10-25 02:25:17.91049
273	13	12	2026-10-25 02:25:17.91049
274	13	10	2026-10-25 02:25:17.91049
275	13	8	2026-10-25 02:25:17.91049
276	13	6	2026-10-25 02:25:17.91049
277	13	4	2026-10-25 02:25:17.91049
278	13	3	2026-10-25 02:25:17.91049
279	13	1	2026-10-25 02:25:17.91049
280	14	49	2026-10-25 02:25:17.91049
281	14	47	2026-10-25 02:25:17.91049
282	14	44	2026-10-25 02:25:17.91049
283	14	41	2026-10-25 02:25:17.91049
284	14	39	2026-10-25 02:25:17.91049
285	14	36	2026-10-25 02:25:17.91049
286	14	34	2026-10-25 02:25:17.91049
287	14	31	2026-10-25 02:25:17.91049
288	14	29	2026-10-25 02:25:17.91049
289	14	26	2026-10-25 02:25:17.91049
290	14	23	2026-10-25 02:25:17.91049
291	14	21	2026-10-25 02:25:17.91049
292	14	18	2026-10-25 02:25:17.91049
293	14	15	2026-10-25 02:25:17.91049
294	14	13	2026-10-25 02:25:17.91049
295	14	11	2026-10-25 02:25:17.91049
296	14	9	2026-10-25 02:25:17.91049
297	14	7	2026-10-25 02:25:17.91049
298	14	5	2026-10-25 02:25:17.91049
299	14	3	2026-10-25 02:25:17.91049
300	14	2	2026-10-25 02:25:17.91049
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
1	1	101	¿El docente articula los contenidos del curso o asignatura, con otras asignaturas?	INACTIVA	LIKERT
2	1	102	¿El docente cumple con el sistema de evaluación establecido en el proyecto docente?	INACTIVA	LIKERT
3	1	103	¿El docente desarrolla todos los contenidos propuestos en el proyecto docente?	INACTIVA	LIKERT
4	1	104	¿El docente utiliza los resultados de la evaluación, para reorientar los procesos de enseñanza-aprendizaje?	INACTIVA	LIKERT
5	1	105	¿El docente utiliza parámetros para evaluar los procesos de enseñanza-aprendizaje?	INACTIVA	LIKERT
6	2	106	¿El docente organiza y orienta actividades de trabajos independiente?	INACTIVA	LIKERT
7	2	107	¿El docente promueve la participación de sus estudiantes?	INACTIVA	LIKERT
8	2	108	¿El docente utiliza la pregunta como una estrategia para que el estudiante aprenda?	INACTIVA	LIKERT
9	3	109	¿Cuando ha solicitado asesoria, el docente responde oportunamente a sus inquietudes?	INACTIVA	LIKERT
10	3	110	¿El docente cumple con el horario de atención a los estudiantes?	INACTIVA	LIKERT
11	3	111	¿El docente cumple y hace cumplir los reglamentos?	INACTIVA	LIKERT
12	3	112	¿El docente es puntual a la llegada a sus compromisos académicos?	INACTIVA	LIKERT
13	3	113	¿El docente es puntual en la revisión y entrega de trabajo y calificaciones?	INACTIVA	LIKERT
14	3	114	¿El docente socializa el proyecto docente al inicio de clases?	INACTIVA	LIKERT
15	3	115	¿El docente trata con respeto a sus estudiantes?	INACTIVA	LIKERT
16	4	116	¿Qué aspectos considera que debe mejorar el docente en su práctica pedagógica?	INACTIVA	TEXTO
17	4	117	¿Qué fortalezas destaca del docente en el desarrollo del curso?	INACTIVA	TEXTO
18	5	1	RESPETO: El docente usa un lenguaje cortés, respetuoso y es tolerante con los diferentes puntos de vista.	ACTIVA	LIKERT
19	5	2	COMUNICACIÓN CLARA: El docente comunica con claridad sus procesos de enseñanza.	ACTIVA	LIKERT
20	5	3	USO DE LOS CANALES INSTITUCIONALES: El docente mantiene una comunicación continua a través de los canales disponibles en la institución.	ACTIVA	LIKERT
21	5	4	RELACIONES INTERPERSONALES: El docente promueve situaciones de comunicación y trato que aseguran un ambiente libre de acoso para todos los miembros de la comunidad académica.	ACTIVA	LIKERT
22	6	5	RESPONSABILIDAD: El docente respetó las reglas y fechas de evaluación establecidos en el proyecto docente y el calendario académico.	ACTIVA	LIKERT
23	6	6	USO DE RESULTADOS DE LA EVALUACIÓN: El docente utiliza los resultados de la evaluación para orientar los procesos de Enseñanza-Aprendizaje.	ACTIVA	LIKERT
24	6	7	RETROALIMENTACIÓN: El docente retroalimenta las actividades evaluativas propuestas señalando las fortalezas, debilidades y oportunidades de mejora.	ACTIVA	LIKERT
25	7	8	¿Cuáles considera que fueron las principales fortalezas que contribuyeron al desempeño del docente?	ACTIVA	TEXTO
26	7	9	¿En qué aspectos considera que debería trabajar el docente para mejorar su desempeño?	ACTIVA	TEXTO
27	8	10	PUNTUALIDAD: El docente es puntual en el cumplimiento de las actividades programadas en el curso.	ACTIVA	LIKERT
28	8	11	MOTIVACIÓN: El docente muestra agrado y entusiasmo por su labor de enseñar.	ACTIVA	LIKERT
29	8	12	PREPARACIÓN: El docente prepara adecuadamente cada sesión o actividad de aprendizaje contemplada en el curso.	ACTIVA	LIKERT
30	8	13	TRABAJO COLABORATIVO: El docente promueve el trabajo colaborativo entre los estudiantes en los procesos de aprendizaje individuales y colectivos.	ACTIVA	LIKERT
31	8	14	FOMENTO DEL APRENDIZAJE: El docente fomenta el aprendizaje significativo en los estudiantes.	ACTIVA	LIKERT
32	9	15	DOMINIO DEL TEMA: El docente domina los saberes del curso o módulo a su cargo.	ACTIVA	LIKERT
33	9	16	ACOMPAÑAMIENTO AL APRENDIZAJE: El docente aclara las dudas de los estudiantes sobre el desarrollo de las temáticas planteadas durante las clases y en los espacios programados para tal fin.	ACTIVA	LIKERT
34	9	17	ORIENTACIÓN A LA INVESTIGACIÓN: El docente promueve un espíritu investigativo en el marco de su curso y motiva la consulta actualizada de materiales bibliográficos como apoyo al aprendizaje.	ACTIVA	LIKERT
35	9	18	COMPETENCIAS TECNOLÓGICAS: El docente incorpora herramientas TIC y recursos digitales en los procesos de enseñanza que lidera.	ACTIVA	LIKERT
36	9	19	EJECUCIÓN DE PLANES: El docente desarrolla todas las unidades temáticas planteadas en el proyecto docente o programa del módulo que tiene a cargo.	ACTIVA	LIKERT
37	9	20	ESTRATEGIAS DIDÁCTICAS: El docente emplea diversas estrategias enfocadas en la promoción del aprendizaje de los estudiantes.	ACTIVA	LIKERT
38	9	21	PLANIFICACIÓN: El docente socializa a inicios de semestre el proyecto docente y/o proyecta el desarrollo académico del curso o módulo a su cargo.	ACTIVA	LIKERT
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
5401	281	18	4	\N	\N	\N	\N
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
5402	281	19	3	\N	\N	\N	\N
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
5403	281	20	4	\N	\N	\N	\N
5404	281	21	1	\N	\N	\N	\N
17	1	17	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
5405	281	22	2	\N	\N	\N	\N
117	7	15	4	\N	\N	\N	\N
5406	281	23	2	\N	\N	\N	\N
5407	281	24	4	\N	\N	\N	\N
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
5545	287	36	2	\N	\N	\N	\N
135	8	16	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
5546	287	37	3	\N	\N	\N	\N
231	14	10	5	\N	\N	\N	\N
232	14	11	5	\N	\N	\N	\N
233	14	12	4	\N	\N	\N	\N
234	14	13	4	\N	\N	\N	\N
235	14	14	4	\N	\N	\N	\N
236	14	15	5	\N	\N	\N	\N
5408	281	25	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
5409	281	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
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
5410	281	27	3	\N	\N	\N	\N
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
5411	281	28	4	\N	\N	\N	\N
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
5412	281	29	4	\N	\N	\N	\N
357	21	17	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
5413	281	30	4	\N	\N	\N	\N
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
5414	281	31	4	\N	\N	\N	\N
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
5415	281	32	4	\N	\N	\N	\N
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
5416	281	33	1	\N	\N	\N	\N
476	28	17	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
5417	281	34	4	\N	\N	\N	\N
5418	281	35	2	\N	\N	\N	\N
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
5419	281	36	1	\N	\N	\N	\N
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
5420	281	37	3	\N	\N	\N	\N
594	35	16	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
5421	281	38	3	\N	\N	\N	\N
5422	282	18	2	\N	\N	\N	\N
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
5423	282	19	2	\N	\N	\N	\N
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
5424	282	20	4	\N	\N	\N	\N
697	41	17	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
5425	282	21	4	\N	\N	\N	\N
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
5426	282	22	2	\N	\N	\N	\N
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
5427	282	23	4	\N	\N	\N	\N
816	48	17	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
5428	282	24	4	\N	\N	\N	\N
5429	282	25	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
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
5547	287	38	4	\N	\N	\N	\N
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
5430	282	26	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
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
5431	282	27	2	\N	\N	\N	\N
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
5432	282	28	2	\N	\N	\N	\N
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
5433	282	29	4	\N	\N	\N	\N
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
5434	282	30	4	\N	\N	\N	\N
1173	69	17	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
5435	282	31	4	\N	\N	\N	\N
1284	76	9	3	\N	\N	\N	\N
1285	76	10	2	\N	\N	\N	\N
1286	76	11	4	\N	\N	\N	\N
1287	76	12	3	\N	\N	\N	\N
1288	76	13	5	\N	\N	\N	\N
1289	76	14	1	\N	\N	\N	\N
1290	76	15	3	\N	\N	\N	\N
5436	282	32	4	\N	\N	\N	\N
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
5437	282	33	4	\N	\N	\N	\N
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
5438	282	34	3	\N	\N	\N	\N
1292	76	17	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
5439	282	35	3	\N	\N	\N	\N
1401	83	7	3	\N	\N	\N	\N
1402	83	8	4	\N	\N	\N	\N
1403	83	9	4	\N	\N	\N	\N
1404	83	10	2	\N	\N	\N	\N
1405	83	11	3	\N	\N	\N	\N
1406	83	12	2	\N	\N	\N	\N
1407	83	13	3	\N	\N	\N	\N
1408	83	14	2	\N	\N	\N	\N
1409	83	15	2	\N	\N	\N	\N
5440	282	36	3	\N	\N	\N	\N
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
5441	282	37	2	\N	\N	\N	\N
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
5442	282	38	2	\N	\N	\N	\N
1411	83	17	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
5443	283	18	3	\N	\N	\N	\N
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
5444	283	19	3	\N	\N	\N	\N
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
5445	283	20	2	\N	\N	\N	\N
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
5446	283	21	4	\N	\N	\N	\N
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
5447	283	22	2	\N	\N	\N	\N
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
5448	283	23	3	\N	\N	\N	\N
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
5449	283	24	4	\N	\N	\N	\N
1649	97	17	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
5548	288	18	3	\N	\N	\N	\N
5450	283	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
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
5549	288	19	4	\N	\N	\N	\N
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
5550	288	20	4	\N	\N	\N	\N
1767	104	16	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
5451	283	26	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
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
5452	283	27	4	\N	\N	\N	\N
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
5453	283	28	2	\N	\N	\N	\N
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
5454	283	29	3	\N	\N	\N	\N
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
2041	121	18	1	\N	\N	\N	\N
2042	121	19	2	\N	\N	\N	\N
2043	121	20	2	\N	\N	\N	\N
2044	121	21	3	\N	\N	\N	\N
2045	121	22	3	\N	\N	\N	\N
2046	121	23	4	\N	\N	\N	\N
2047	121	24	1	\N	\N	\N	\N
2048	121	25	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
2049	121	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
2050	121	27	3	\N	\N	\N	\N
2051	121	28	1	\N	\N	\N	\N
2052	121	29	2	\N	\N	\N	\N
2053	121	30	3	\N	\N	\N	\N
2054	121	31	3	\N	\N	\N	\N
2055	121	32	2	\N	\N	\N	\N
2056	121	33	3	\N	\N	\N	\N
2057	121	34	4	\N	\N	\N	\N
2058	121	35	1	\N	\N	\N	\N
2059	121	36	4	\N	\N	\N	\N
2060	121	37	3	\N	\N	\N	\N
2061	121	38	2	\N	\N	\N	\N
2062	122	18	4	\N	\N	\N	\N
2063	122	19	2	\N	\N	\N	\N
2064	122	20	1	\N	\N	\N	\N
2065	122	21	1	\N	\N	\N	\N
2066	122	22	4	\N	\N	\N	\N
2067	122	23	3	\N	\N	\N	\N
2068	122	24	4	\N	\N	\N	\N
2069	122	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
2070	122	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
2071	122	27	1	\N	\N	\N	\N
2072	122	28	2	\N	\N	\N	\N
2073	122	29	3	\N	\N	\N	\N
2074	122	30	4	\N	\N	\N	\N
2075	122	31	2	\N	\N	\N	\N
2076	122	32	2	\N	\N	\N	\N
2077	122	33	1	\N	\N	\N	\N
2078	122	34	3	\N	\N	\N	\N
2079	122	35	3	\N	\N	\N	\N
2080	122	36	4	\N	\N	\N	\N
2081	122	37	4	\N	\N	\N	\N
2082	122	38	4	\N	\N	\N	\N
2083	123	18	3	\N	\N	\N	\N
2084	123	19	4	\N	\N	\N	\N
2085	123	20	2	\N	\N	\N	\N
2086	123	21	2	\N	\N	\N	\N
2087	123	22	3	\N	\N	\N	\N
2088	123	23	3	\N	\N	\N	\N
2089	123	24	3	\N	\N	\N	\N
2090	123	25	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
2091	123	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
2092	123	27	2	\N	\N	\N	\N
2093	123	28	2	\N	\N	\N	\N
2094	123	29	4	\N	\N	\N	\N
2095	123	30	3	\N	\N	\N	\N
2096	123	31	3	\N	\N	\N	\N
2097	123	32	3	\N	\N	\N	\N
2098	123	33	4	\N	\N	\N	\N
2099	123	34	3	\N	\N	\N	\N
2100	123	35	2	\N	\N	\N	\N
2101	123	36	1	\N	\N	\N	\N
2102	123	37	2	\N	\N	\N	\N
2103	123	38	2	\N	\N	\N	\N
2104	124	18	4	\N	\N	\N	\N
2105	124	19	4	\N	\N	\N	\N
2106	124	20	2	\N	\N	\N	\N
2107	124	21	3	\N	\N	\N	\N
2108	124	22	2	\N	\N	\N	\N
2109	124	23	4	\N	\N	\N	\N
2110	124	24	3	\N	\N	\N	\N
2111	124	25	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
2112	124	26	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
2113	124	27	2	\N	\N	\N	\N
2114	124	28	3	\N	\N	\N	\N
2115	124	29	4	\N	\N	\N	\N
2116	124	30	2	\N	\N	\N	\N
2117	124	31	2	\N	\N	\N	\N
2118	124	32	4	\N	\N	\N	\N
2119	124	33	3	\N	\N	\N	\N
2120	124	34	1	\N	\N	\N	\N
2121	124	35	1	\N	\N	\N	\N
2122	124	36	1	\N	\N	\N	\N
2123	124	37	3	\N	\N	\N	\N
2124	124	38	3	\N	\N	\N	\N
2125	125	18	1	\N	\N	\N	\N
2126	125	19	2	\N	\N	\N	\N
2127	125	20	4	\N	\N	\N	\N
2128	125	21	3	\N	\N	\N	\N
2129	125	22	4	\N	\N	\N	\N
2130	125	23	4	\N	\N	\N	\N
2131	125	24	1	\N	\N	\N	\N
5455	283	30	4	\N	\N	\N	\N
5456	283	31	4	\N	\N	\N	\N
5457	283	32	2	\N	\N	\N	\N
5458	283	33	3	\N	\N	\N	\N
5459	283	34	4	\N	\N	\N	\N
5460	283	35	4	\N	\N	\N	\N
5461	283	36	4	\N	\N	\N	\N
5462	283	37	3	\N	\N	\N	\N
5463	283	38	3	\N	\N	\N	\N
5464	284	18	3	\N	\N	\N	\N
5465	284	19	3	\N	\N	\N	\N
5466	284	20	3	\N	\N	\N	\N
5467	284	21	4	\N	\N	\N	\N
5468	284	22	3	\N	\N	\N	\N
2132	125	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
2133	125	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
2134	125	27	1	\N	\N	\N	\N
2135	125	28	3	\N	\N	\N	\N
2136	125	29	3	\N	\N	\N	\N
2137	125	30	4	\N	\N	\N	\N
2138	125	31	4	\N	\N	\N	\N
2139	125	32	2	\N	\N	\N	\N
2140	125	33	3	\N	\N	\N	\N
2141	125	34	2	\N	\N	\N	\N
2142	125	35	4	\N	\N	\N	\N
2143	125	36	4	\N	\N	\N	\N
2144	125	37	2	\N	\N	\N	\N
2145	125	38	3	\N	\N	\N	\N
2146	126	18	2	\N	\N	\N	\N
2147	126	19	3	\N	\N	\N	\N
2148	126	20	3	\N	\N	\N	\N
2149	126	21	3	\N	\N	\N	\N
2150	126	22	3	\N	\N	\N	\N
2151	126	23	1	\N	\N	\N	\N
2152	126	24	2	\N	\N	\N	\N
2153	126	25	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
2154	126	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
2155	126	27	2	\N	\N	\N	\N
2156	126	28	2	\N	\N	\N	\N
2157	126	29	3	\N	\N	\N	\N
2158	126	30	1	\N	\N	\N	\N
2159	126	31	3	\N	\N	\N	\N
2160	126	32	4	\N	\N	\N	\N
2161	126	33	4	\N	\N	\N	\N
2162	126	34	3	\N	\N	\N	\N
2163	126	35	2	\N	\N	\N	\N
2164	126	36	3	\N	\N	\N	\N
2165	126	37	4	\N	\N	\N	\N
2166	126	38	2	\N	\N	\N	\N
2167	127	18	3	\N	\N	\N	\N
2168	127	19	4	\N	\N	\N	\N
2169	127	20	4	\N	\N	\N	\N
2170	127	21	3	\N	\N	\N	\N
2171	127	22	3	\N	\N	\N	\N
2172	127	23	3	\N	\N	\N	\N
2173	127	24	2	\N	\N	\N	\N
2174	127	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
2175	127	26	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
2176	127	27	3	\N	\N	\N	\N
2177	127	28	2	\N	\N	\N	\N
2178	127	29	1	\N	\N	\N	\N
2179	127	30	1	\N	\N	\N	\N
2180	127	31	3	\N	\N	\N	\N
2181	127	32	3	\N	\N	\N	\N
2182	127	33	1	\N	\N	\N	\N
2183	127	34	3	\N	\N	\N	\N
2184	127	35	1	\N	\N	\N	\N
2185	127	36	1	\N	\N	\N	\N
2186	127	37	1	\N	\N	\N	\N
2187	127	38	2	\N	\N	\N	\N
2188	128	18	2	\N	\N	\N	\N
2189	128	19	3	\N	\N	\N	\N
2190	128	20	3	\N	\N	\N	\N
2191	128	21	3	\N	\N	\N	\N
2192	128	22	4	\N	\N	\N	\N
2193	128	23	3	\N	\N	\N	\N
2194	128	24	2	\N	\N	\N	\N
2195	128	25	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
2196	128	26	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
2197	128	27	3	\N	\N	\N	\N
2198	128	28	2	\N	\N	\N	\N
2199	128	29	3	\N	\N	\N	\N
2200	128	30	4	\N	\N	\N	\N
2201	128	31	1	\N	\N	\N	\N
2202	128	32	3	\N	\N	\N	\N
2203	128	33	3	\N	\N	\N	\N
2204	128	34	1	\N	\N	\N	\N
2205	128	35	3	\N	\N	\N	\N
2206	128	36	4	\N	\N	\N	\N
2207	128	37	1	\N	\N	\N	\N
2208	128	38	2	\N	\N	\N	\N
2209	129	18	2	\N	\N	\N	\N
2210	129	19	2	\N	\N	\N	\N
2211	129	20	3	\N	\N	\N	\N
2212	129	21	4	\N	\N	\N	\N
2213	129	22	1	\N	\N	\N	\N
2214	129	23	4	\N	\N	\N	\N
2215	129	24	4	\N	\N	\N	\N
2216	129	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
2217	129	26	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
2218	129	27	4	\N	\N	\N	\N
2219	129	28	4	\N	\N	\N	\N
2220	129	29	2	\N	\N	\N	\N
2221	129	30	3	\N	\N	\N	\N
2222	129	31	2	\N	\N	\N	\N
2223	129	32	3	\N	\N	\N	\N
2224	129	33	1	\N	\N	\N	\N
2225	129	34	2	\N	\N	\N	\N
2226	129	35	4	\N	\N	\N	\N
2227	129	36	2	\N	\N	\N	\N
2228	129	37	3	\N	\N	\N	\N
2229	129	38	3	\N	\N	\N	\N
2230	130	18	4	\N	\N	\N	\N
2231	130	19	4	\N	\N	\N	\N
2232	130	20	3	\N	\N	\N	\N
2233	130	21	3	\N	\N	\N	\N
2234	130	22	2	\N	\N	\N	\N
2235	130	23	2	\N	\N	\N	\N
2236	130	24	4	\N	\N	\N	\N
2237	130	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
2238	130	26	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
2239	130	27	1	\N	\N	\N	\N
2240	130	28	3	\N	\N	\N	\N
2241	130	29	3	\N	\N	\N	\N
2242	130	30	4	\N	\N	\N	\N
2243	130	31	2	\N	\N	\N	\N
2244	130	32	4	\N	\N	\N	\N
2245	130	33	1	\N	\N	\N	\N
2246	130	34	2	\N	\N	\N	\N
2247	130	35	3	\N	\N	\N	\N
2248	130	36	3	\N	\N	\N	\N
2249	130	37	2	\N	\N	\N	\N
2250	130	38	1	\N	\N	\N	\N
2251	131	18	2	\N	\N	\N	\N
2252	131	19	3	\N	\N	\N	\N
2253	131	20	3	\N	\N	\N	\N
2254	131	21	3	\N	\N	\N	\N
2255	131	22	3	\N	\N	\N	\N
2256	131	23	3	\N	\N	\N	\N
2257	131	24	4	\N	\N	\N	\N
2258	131	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
2259	131	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
2260	131	27	2	\N	\N	\N	\N
2261	131	28	3	\N	\N	\N	\N
2262	131	29	3	\N	\N	\N	\N
2263	131	30	4	\N	\N	\N	\N
2264	131	31	4	\N	\N	\N	\N
2265	131	32	1	\N	\N	\N	\N
2266	131	33	3	\N	\N	\N	\N
2267	131	34	3	\N	\N	\N	\N
2268	131	35	1	\N	\N	\N	\N
2269	131	36	3	\N	\N	\N	\N
2270	131	37	3	\N	\N	\N	\N
2271	131	38	2	\N	\N	\N	\N
2272	132	18	1	\N	\N	\N	\N
2273	132	19	2	\N	\N	\N	\N
2274	132	20	2	\N	\N	\N	\N
2275	132	21	3	\N	\N	\N	\N
2276	132	22	3	\N	\N	\N	\N
2277	132	23	2	\N	\N	\N	\N
2278	132	24	4	\N	\N	\N	\N
2279	132	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
2280	132	26	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
2281	132	27	2	\N	\N	\N	\N
2282	132	28	3	\N	\N	\N	\N
2283	132	29	4	\N	\N	\N	\N
2284	132	30	2	\N	\N	\N	\N
2285	132	31	1	\N	\N	\N	\N
2286	132	32	1	\N	\N	\N	\N
2287	132	33	3	\N	\N	\N	\N
2288	132	34	2	\N	\N	\N	\N
2289	132	35	3	\N	\N	\N	\N
2290	132	36	3	\N	\N	\N	\N
2291	132	37	2	\N	\N	\N	\N
2292	132	38	3	\N	\N	\N	\N
2293	133	18	3	\N	\N	\N	\N
2294	133	19	4	\N	\N	\N	\N
2295	133	20	4	\N	\N	\N	\N
2296	133	21	1	\N	\N	\N	\N
2297	133	22	3	\N	\N	\N	\N
2298	133	23	2	\N	\N	\N	\N
2299	133	24	1	\N	\N	\N	\N
2300	133	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
2301	133	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
2302	133	27	3	\N	\N	\N	\N
2303	133	28	3	\N	\N	\N	\N
2304	133	29	1	\N	\N	\N	\N
2305	133	30	1	\N	\N	\N	\N
2306	133	31	4	\N	\N	\N	\N
2307	133	32	4	\N	\N	\N	\N
2308	133	33	3	\N	\N	\N	\N
2309	133	34	4	\N	\N	\N	\N
2310	133	35	3	\N	\N	\N	\N
2311	133	36	2	\N	\N	\N	\N
2312	133	37	2	\N	\N	\N	\N
2313	133	38	2	\N	\N	\N	\N
2314	134	18	3	\N	\N	\N	\N
2315	134	19	4	\N	\N	\N	\N
2316	134	20	4	\N	\N	\N	\N
2317	134	21	2	\N	\N	\N	\N
2318	134	22	2	\N	\N	\N	\N
2319	134	23	1	\N	\N	\N	\N
2320	134	24	3	\N	\N	\N	\N
2321	134	25	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
2322	134	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
2323	134	27	4	\N	\N	\N	\N
2324	134	28	2	\N	\N	\N	\N
2325	134	29	2	\N	\N	\N	\N
2326	134	30	3	\N	\N	\N	\N
2327	134	31	2	\N	\N	\N	\N
2328	134	32	3	\N	\N	\N	\N
2329	134	33	2	\N	\N	\N	\N
2330	134	34	4	\N	\N	\N	\N
2331	134	35	3	\N	\N	\N	\N
2332	134	36	3	\N	\N	\N	\N
2333	134	37	3	\N	\N	\N	\N
2334	134	38	3	\N	\N	\N	\N
2335	135	18	2	\N	\N	\N	\N
2336	135	19	3	\N	\N	\N	\N
2337	135	20	2	\N	\N	\N	\N
2338	135	21	1	\N	\N	\N	\N
2339	135	22	3	\N	\N	\N	\N
2340	135	23	2	\N	\N	\N	\N
2341	135	24	4	\N	\N	\N	\N
2342	135	25	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
2343	135	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
2344	135	27	2	\N	\N	\N	\N
2345	135	28	2	\N	\N	\N	\N
2346	135	29	1	\N	\N	\N	\N
2347	135	30	3	\N	\N	\N	\N
2348	135	31	2	\N	\N	\N	\N
2349	135	32	3	\N	\N	\N	\N
2350	135	33	3	\N	\N	\N	\N
2351	135	34	4	\N	\N	\N	\N
2352	135	35	2	\N	\N	\N	\N
2353	135	36	1	\N	\N	\N	\N
2354	135	37	4	\N	\N	\N	\N
2355	135	38	2	\N	\N	\N	\N
2356	136	18	4	\N	\N	\N	\N
2357	136	19	1	\N	\N	\N	\N
2358	136	20	3	\N	\N	\N	\N
2359	136	21	2	\N	\N	\N	\N
2360	136	22	3	\N	\N	\N	\N
2361	136	23	3	\N	\N	\N	\N
2362	136	24	4	\N	\N	\N	\N
2363	136	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
2364	136	26	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
2365	136	27	3	\N	\N	\N	\N
2366	136	28	1	\N	\N	\N	\N
2367	136	29	4	\N	\N	\N	\N
2368	136	30	3	\N	\N	\N	\N
2369	136	31	3	\N	\N	\N	\N
2370	136	32	3	\N	\N	\N	\N
2371	136	33	3	\N	\N	\N	\N
2372	136	34	2	\N	\N	\N	\N
2373	136	35	1	\N	\N	\N	\N
2374	136	36	3	\N	\N	\N	\N
2375	136	37	2	\N	\N	\N	\N
2376	136	38	2	\N	\N	\N	\N
2377	137	18	3	\N	\N	\N	\N
2378	137	19	2	\N	\N	\N	\N
2379	137	20	2	\N	\N	\N	\N
2380	137	21	3	\N	\N	\N	\N
2381	137	22	3	\N	\N	\N	\N
2382	137	23	2	\N	\N	\N	\N
2383	137	24	2	\N	\N	\N	\N
2384	137	25	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
2385	137	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
2386	137	27	3	\N	\N	\N	\N
2387	137	28	2	\N	\N	\N	\N
2388	137	29	3	\N	\N	\N	\N
2389	137	30	1	\N	\N	\N	\N
2390	137	31	2	\N	\N	\N	\N
2391	137	32	3	\N	\N	\N	\N
2392	137	33	3	\N	\N	\N	\N
2393	137	34	3	\N	\N	\N	\N
2394	137	35	3	\N	\N	\N	\N
2395	137	36	3	\N	\N	\N	\N
2396	137	37	2	\N	\N	\N	\N
2397	137	38	3	\N	\N	\N	\N
2398	138	18	3	\N	\N	\N	\N
2399	138	19	2	\N	\N	\N	\N
2400	138	20	1	\N	\N	\N	\N
2401	138	21	3	\N	\N	\N	\N
2402	138	22	3	\N	\N	\N	\N
2403	138	23	2	\N	\N	\N	\N
2404	138	24	4	\N	\N	\N	\N
2405	138	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
2406	138	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
2407	138	27	2	\N	\N	\N	\N
2408	138	28	1	\N	\N	\N	\N
2409	138	29	4	\N	\N	\N	\N
2410	138	30	3	\N	\N	\N	\N
2411	138	31	3	\N	\N	\N	\N
2412	138	32	3	\N	\N	\N	\N
2413	138	33	4	\N	\N	\N	\N
2414	138	34	3	\N	\N	\N	\N
2415	138	35	3	\N	\N	\N	\N
2416	138	36	2	\N	\N	\N	\N
2417	138	37	2	\N	\N	\N	\N
2418	138	38	2	\N	\N	\N	\N
2419	139	18	4	\N	\N	\N	\N
2420	139	19	4	\N	\N	\N	\N
2421	139	20	4	\N	\N	\N	\N
2422	139	21	3	\N	\N	\N	\N
2423	139	22	2	\N	\N	\N	\N
2424	139	23	4	\N	\N	\N	\N
2425	139	24	3	\N	\N	\N	\N
2426	139	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
2427	139	26	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
2428	139	27	3	\N	\N	\N	\N
2429	139	28	4	\N	\N	\N	\N
2430	139	29	3	\N	\N	\N	\N
2431	139	30	4	\N	\N	\N	\N
2432	139	31	3	\N	\N	\N	\N
2433	139	32	4	\N	\N	\N	\N
2434	139	33	4	\N	\N	\N	\N
2435	139	34	3	\N	\N	\N	\N
2436	139	35	3	\N	\N	\N	\N
2437	139	36	3	\N	\N	\N	\N
2438	139	37	4	\N	\N	\N	\N
2439	139	38	3	\N	\N	\N	\N
2440	140	18	3	\N	\N	\N	\N
2441	140	19	3	\N	\N	\N	\N
2442	140	20	2	\N	\N	\N	\N
2443	140	21	2	\N	\N	\N	\N
2444	140	22	3	\N	\N	\N	\N
2445	140	23	3	\N	\N	\N	\N
2446	140	24	3	\N	\N	\N	\N
2447	140	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
2448	140	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
2449	140	27	2	\N	\N	\N	\N
2450	140	28	2	\N	\N	\N	\N
2451	140	29	4	\N	\N	\N	\N
2452	140	30	1	\N	\N	\N	\N
2453	140	31	2	\N	\N	\N	\N
2454	140	32	2	\N	\N	\N	\N
2455	140	33	2	\N	\N	\N	\N
2456	140	34	2	\N	\N	\N	\N
2457	140	35	3	\N	\N	\N	\N
2458	140	36	2	\N	\N	\N	\N
2459	140	37	3	\N	\N	\N	\N
2460	140	38	1	\N	\N	\N	\N
2461	141	18	2	\N	\N	\N	\N
2462	141	19	3	\N	\N	\N	\N
2463	141	20	4	\N	\N	\N	\N
2464	141	21	1	\N	\N	\N	\N
2465	141	22	4	\N	\N	\N	\N
2466	141	23	3	\N	\N	\N	\N
2467	141	24	3	\N	\N	\N	\N
2468	141	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
2469	141	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
2470	141	27	3	\N	\N	\N	\N
2471	141	28	3	\N	\N	\N	\N
2472	141	29	3	\N	\N	\N	\N
2473	141	30	4	\N	\N	\N	\N
2474	141	31	3	\N	\N	\N	\N
2475	141	32	2	\N	\N	\N	\N
2476	141	33	3	\N	\N	\N	\N
2477	141	34	2	\N	\N	\N	\N
2478	141	35	3	\N	\N	\N	\N
2479	141	36	3	\N	\N	\N	\N
2480	141	37	3	\N	\N	\N	\N
2481	141	38	4	\N	\N	\N	\N
2482	142	18	4	\N	\N	\N	\N
2483	142	19	2	\N	\N	\N	\N
2484	142	20	4	\N	\N	\N	\N
2485	142	21	2	\N	\N	\N	\N
2486	142	22	3	\N	\N	\N	\N
2487	142	23	1	\N	\N	\N	\N
2488	142	24	2	\N	\N	\N	\N
2489	142	25	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
2611	148	21	3	\N	\N	\N	\N
2612	148	22	1	\N	\N	\N	\N
2490	142	26	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
2491	142	27	2	\N	\N	\N	\N
2492	142	28	2	\N	\N	\N	\N
2493	142	29	2	\N	\N	\N	\N
2494	142	30	3	\N	\N	\N	\N
2495	142	31	1	\N	\N	\N	\N
2496	142	32	4	\N	\N	\N	\N
2497	142	33	2	\N	\N	\N	\N
2498	142	34	3	\N	\N	\N	\N
2499	142	35	2	\N	\N	\N	\N
2500	142	36	3	\N	\N	\N	\N
2501	142	37	1	\N	\N	\N	\N
2502	142	38	4	\N	\N	\N	\N
2503	143	18	1	\N	\N	\N	\N
2504	143	19	4	\N	\N	\N	\N
2505	143	20	1	\N	\N	\N	\N
2506	143	21	1	\N	\N	\N	\N
2507	143	22	1	\N	\N	\N	\N
2508	143	23	3	\N	\N	\N	\N
2509	143	24	3	\N	\N	\N	\N
2510	143	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
2511	143	26	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
2512	143	27	4	\N	\N	\N	\N
2513	143	28	2	\N	\N	\N	\N
2514	143	29	1	\N	\N	\N	\N
2515	143	30	2	\N	\N	\N	\N
2516	143	31	2	\N	\N	\N	\N
2517	143	32	4	\N	\N	\N	\N
2518	143	33	3	\N	\N	\N	\N
2519	143	34	3	\N	\N	\N	\N
2520	143	35	1	\N	\N	\N	\N
2521	143	36	2	\N	\N	\N	\N
2522	143	37	2	\N	\N	\N	\N
2523	143	38	4	\N	\N	\N	\N
2524	144	18	4	\N	\N	\N	\N
2525	144	19	2	\N	\N	\N	\N
2526	144	20	4	\N	\N	\N	\N
2527	144	21	1	\N	\N	\N	\N
2528	144	22	2	\N	\N	\N	\N
2529	144	23	3	\N	\N	\N	\N
2530	144	24	1	\N	\N	\N	\N
2531	144	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
2532	144	26	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
2533	144	27	3	\N	\N	\N	\N
2534	144	28	3	\N	\N	\N	\N
2535	144	29	2	\N	\N	\N	\N
2536	144	30	1	\N	\N	\N	\N
2537	144	31	2	\N	\N	\N	\N
2538	144	32	3	\N	\N	\N	\N
2539	144	33	1	\N	\N	\N	\N
2540	144	34	3	\N	\N	\N	\N
2541	144	35	1	\N	\N	\N	\N
2542	144	36	2	\N	\N	\N	\N
2543	144	37	2	\N	\N	\N	\N
2544	144	38	2	\N	\N	\N	\N
2545	145	18	4	\N	\N	\N	\N
2546	145	19	2	\N	\N	\N	\N
2547	145	20	1	\N	\N	\N	\N
2548	145	21	1	\N	\N	\N	\N
2549	145	22	2	\N	\N	\N	\N
2550	145	23	3	\N	\N	\N	\N
2551	145	24	2	\N	\N	\N	\N
2552	145	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
2553	145	26	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
2554	145	27	1	\N	\N	\N	\N
2555	145	28	3	\N	\N	\N	\N
2556	145	29	3	\N	\N	\N	\N
2557	145	30	1	\N	\N	\N	\N
2558	145	31	3	\N	\N	\N	\N
2559	145	32	1	\N	\N	\N	\N
2560	145	33	2	\N	\N	\N	\N
2561	145	34	2	\N	\N	\N	\N
2562	145	35	2	\N	\N	\N	\N
2563	145	36	1	\N	\N	\N	\N
2564	145	37	3	\N	\N	\N	\N
2565	145	38	1	\N	\N	\N	\N
2566	146	18	3	\N	\N	\N	\N
2567	146	19	2	\N	\N	\N	\N
2568	146	20	3	\N	\N	\N	\N
2569	146	21	3	\N	\N	\N	\N
2570	146	22	1	\N	\N	\N	\N
2571	146	23	1	\N	\N	\N	\N
2572	146	24	4	\N	\N	\N	\N
2573	146	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
2574	146	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
2575	146	27	3	\N	\N	\N	\N
2576	146	28	3	\N	\N	\N	\N
2577	146	29	2	\N	\N	\N	\N
2578	146	30	3	\N	\N	\N	\N
2579	146	31	1	\N	\N	\N	\N
2580	146	32	1	\N	\N	\N	\N
2581	146	33	3	\N	\N	\N	\N
2582	146	34	2	\N	\N	\N	\N
2583	146	35	2	\N	\N	\N	\N
2584	146	36	2	\N	\N	\N	\N
2585	146	37	2	\N	\N	\N	\N
2586	146	38	2	\N	\N	\N	\N
2587	147	18	2	\N	\N	\N	\N
2588	147	19	3	\N	\N	\N	\N
2589	147	20	1	\N	\N	\N	\N
2590	147	21	1	\N	\N	\N	\N
2591	147	22	1	\N	\N	\N	\N
2592	147	23	1	\N	\N	\N	\N
2593	147	24	1	\N	\N	\N	\N
2594	147	25	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
2595	147	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
2596	147	27	1	\N	\N	\N	\N
2597	147	28	2	\N	\N	\N	\N
2598	147	29	3	\N	\N	\N	\N
2599	147	30	2	\N	\N	\N	\N
2600	147	31	4	\N	\N	\N	\N
2601	147	32	3	\N	\N	\N	\N
2602	147	33	1	\N	\N	\N	\N
2603	147	34	2	\N	\N	\N	\N
2604	147	35	2	\N	\N	\N	\N
2605	147	36	3	\N	\N	\N	\N
2606	147	37	1	\N	\N	\N	\N
2607	147	38	1	\N	\N	\N	\N
2608	148	18	1	\N	\N	\N	\N
2609	148	19	4	\N	\N	\N	\N
2610	148	20	3	\N	\N	\N	\N
2613	148	23	1	\N	\N	\N	\N
2614	148	24	1	\N	\N	\N	\N
2615	148	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
2616	148	26	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
2617	148	27	1	\N	\N	\N	\N
2618	148	28	3	\N	\N	\N	\N
2619	148	29	1	\N	\N	\N	\N
2620	148	30	1	\N	\N	\N	\N
2621	148	31	2	\N	\N	\N	\N
2622	148	32	2	\N	\N	\N	\N
2623	148	33	3	\N	\N	\N	\N
2624	148	34	1	\N	\N	\N	\N
2625	148	35	3	\N	\N	\N	\N
2626	148	36	4	\N	\N	\N	\N
2627	148	37	1	\N	\N	\N	\N
2628	148	38	1	\N	\N	\N	\N
2629	149	18	2	\N	\N	\N	\N
2630	149	19	2	\N	\N	\N	\N
2631	149	20	2	\N	\N	\N	\N
2632	149	21	3	\N	\N	\N	\N
2633	149	22	2	\N	\N	\N	\N
2634	149	23	4	\N	\N	\N	\N
2635	149	24	1	\N	\N	\N	\N
2636	149	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
2637	149	26	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
2638	149	27	1	\N	\N	\N	\N
2639	149	28	4	\N	\N	\N	\N
2640	149	29	1	\N	\N	\N	\N
2641	149	30	3	\N	\N	\N	\N
2642	149	31	3	\N	\N	\N	\N
2643	149	32	1	\N	\N	\N	\N
2644	149	33	1	\N	\N	\N	\N
2645	149	34	1	\N	\N	\N	\N
2646	149	35	2	\N	\N	\N	\N
2647	149	36	1	\N	\N	\N	\N
2648	149	37	2	\N	\N	\N	\N
2649	149	38	3	\N	\N	\N	\N
2650	150	18	1	\N	\N	\N	\N
2651	150	19	1	\N	\N	\N	\N
2652	150	20	1	\N	\N	\N	\N
2653	150	21	3	\N	\N	\N	\N
2654	150	22	1	\N	\N	\N	\N
2655	150	23	1	\N	\N	\N	\N
2656	150	24	1	\N	\N	\N	\N
2657	150	25	\N	No logro destacar mucho, pero el tema es importante.	NEUTRO	0.4316	MODELO
2658	150	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
2659	150	27	2	\N	\N	\N	\N
2660	150	28	2	\N	\N	\N	\N
2661	150	29	3	\N	\N	\N	\N
2662	150	30	4	\N	\N	\N	\N
2663	150	31	3	\N	\N	\N	\N
2664	150	32	1	\N	\N	\N	\N
2665	150	33	1	\N	\N	\N	\N
2666	150	34	2	\N	\N	\N	\N
2667	150	35	3	\N	\N	\N	\N
2668	150	36	2	\N	\N	\N	\N
2669	150	37	1	\N	\N	\N	\N
2670	150	38	1	\N	\N	\N	\N
2671	151	18	3	\N	\N	\N	\N
2672	151	19	4	\N	\N	\N	\N
2673	151	20	2	\N	\N	\N	\N
2674	151	21	2	\N	\N	\N	\N
2675	151	22	1	\N	\N	\N	\N
2676	151	23	1	\N	\N	\N	\N
2677	151	24	2	\N	\N	\N	\N
2678	151	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
2679	151	26	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
2680	151	27	4	\N	\N	\N	\N
2681	151	28	3	\N	\N	\N	\N
2682	151	29	2	\N	\N	\N	\N
2683	151	30	4	\N	\N	\N	\N
2684	151	31	4	\N	\N	\N	\N
2685	151	32	3	\N	\N	\N	\N
2686	151	33	1	\N	\N	\N	\N
2687	151	34	1	\N	\N	\N	\N
2688	151	35	3	\N	\N	\N	\N
2689	151	36	2	\N	\N	\N	\N
2690	151	37	3	\N	\N	\N	\N
2691	151	38	4	\N	\N	\N	\N
2692	152	18	2	\N	\N	\N	\N
2693	152	19	3	\N	\N	\N	\N
2694	152	20	2	\N	\N	\N	\N
2695	152	21	1	\N	\N	\N	\N
2696	152	22	2	\N	\N	\N	\N
2697	152	23	2	\N	\N	\N	\N
2698	152	24	3	\N	\N	\N	\N
2699	152	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
2700	152	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
2701	152	27	1	\N	\N	\N	\N
2702	152	28	4	\N	\N	\N	\N
2703	152	29	3	\N	\N	\N	\N
2704	152	30	2	\N	\N	\N	\N
2705	152	31	2	\N	\N	\N	\N
2706	152	32	2	\N	\N	\N	\N
2707	152	33	2	\N	\N	\N	\N
2708	152	34	4	\N	\N	\N	\N
2709	152	35	2	\N	\N	\N	\N
2710	152	36	2	\N	\N	\N	\N
2711	152	37	4	\N	\N	\N	\N
2712	152	38	3	\N	\N	\N	\N
2713	153	18	2	\N	\N	\N	\N
2714	153	19	1	\N	\N	\N	\N
2715	153	20	2	\N	\N	\N	\N
2716	153	21	3	\N	\N	\N	\N
2717	153	22	3	\N	\N	\N	\N
2718	153	23	3	\N	\N	\N	\N
2719	153	24	1	\N	\N	\N	\N
2720	153	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
2721	153	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
2722	153	27	1	\N	\N	\N	\N
2723	153	28	4	\N	\N	\N	\N
2724	153	29	2	\N	\N	\N	\N
2725	153	30	1	\N	\N	\N	\N
2726	153	31	1	\N	\N	\N	\N
2727	153	32	2	\N	\N	\N	\N
2728	153	33	2	\N	\N	\N	\N
2729	153	34	1	\N	\N	\N	\N
2730	153	35	4	\N	\N	\N	\N
2731	153	36	4	\N	\N	\N	\N
2732	153	37	2	\N	\N	\N	\N
2733	153	38	1	\N	\N	\N	\N
2734	154	18	2	\N	\N	\N	\N
2735	154	19	3	\N	\N	\N	\N
2736	154	20	2	\N	\N	\N	\N
2737	154	21	1	\N	\N	\N	\N
2738	154	22	3	\N	\N	\N	\N
2739	154	23	4	\N	\N	\N	\N
2740	154	24	1	\N	\N	\N	\N
2741	154	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
2742	154	26	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
2743	154	27	2	\N	\N	\N	\N
2744	154	28	3	\N	\N	\N	\N
2745	154	29	3	\N	\N	\N	\N
2746	154	30	1	\N	\N	\N	\N
2747	154	31	3	\N	\N	\N	\N
2748	154	32	2	\N	\N	\N	\N
2749	154	33	4	\N	\N	\N	\N
2750	154	34	2	\N	\N	\N	\N
2751	154	35	3	\N	\N	\N	\N
2752	154	36	1	\N	\N	\N	\N
2753	154	37	1	\N	\N	\N	\N
2754	154	38	2	\N	\N	\N	\N
2755	155	18	2	\N	\N	\N	\N
2756	155	19	1	\N	\N	\N	\N
2757	155	20	2	\N	\N	\N	\N
2758	155	21	2	\N	\N	\N	\N
2759	155	22	2	\N	\N	\N	\N
2760	155	23	2	\N	\N	\N	\N
2761	155	24	2	\N	\N	\N	\N
2762	155	25	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
2763	155	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
2764	155	27	2	\N	\N	\N	\N
2765	155	28	1	\N	\N	\N	\N
2766	155	29	3	\N	\N	\N	\N
2767	155	30	1	\N	\N	\N	\N
2768	155	31	3	\N	\N	\N	\N
2769	155	32	3	\N	\N	\N	\N
2770	155	33	3	\N	\N	\N	\N
2771	155	34	2	\N	\N	\N	\N
2772	155	35	3	\N	\N	\N	\N
2773	155	36	3	\N	\N	\N	\N
2774	155	37	4	\N	\N	\N	\N
2775	155	38	2	\N	\N	\N	\N
2776	156	18	2	\N	\N	\N	\N
2777	156	19	2	\N	\N	\N	\N
2778	156	20	3	\N	\N	\N	\N
2779	156	21	3	\N	\N	\N	\N
2780	156	22	2	\N	\N	\N	\N
2781	156	23	2	\N	\N	\N	\N
2782	156	24	2	\N	\N	\N	\N
2783	156	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
2784	156	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
2785	156	27	1	\N	\N	\N	\N
2786	156	28	3	\N	\N	\N	\N
2787	156	29	1	\N	\N	\N	\N
2788	156	30	3	\N	\N	\N	\N
2789	156	31	2	\N	\N	\N	\N
2790	156	32	1	\N	\N	\N	\N
2791	156	33	2	\N	\N	\N	\N
2792	156	34	3	\N	\N	\N	\N
2793	156	35	2	\N	\N	\N	\N
2794	156	36	4	\N	\N	\N	\N
2795	156	37	3	\N	\N	\N	\N
2796	156	38	3	\N	\N	\N	\N
2797	157	18	2	\N	\N	\N	\N
2798	157	19	2	\N	\N	\N	\N
2799	157	20	1	\N	\N	\N	\N
2800	157	21	3	\N	\N	\N	\N
2801	157	22	1	\N	\N	\N	\N
2802	157	23	1	\N	\N	\N	\N
2803	157	24	1	\N	\N	\N	\N
2804	157	25	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
2805	157	26	\N	No hay retroalimentación de los trabajos, uno no sabe en qué está mal.	NEUTRO	0.6001	MODELO
2806	157	27	4	\N	\N	\N	\N
2807	157	28	1	\N	\N	\N	\N
2808	157	29	3	\N	\N	\N	\N
2809	157	30	1	\N	\N	\N	\N
2810	157	31	2	\N	\N	\N	\N
2811	157	32	1	\N	\N	\N	\N
2812	157	33	2	\N	\N	\N	\N
2813	157	34	2	\N	\N	\N	\N
2814	157	35	3	\N	\N	\N	\N
2815	157	36	1	\N	\N	\N	\N
2816	157	37	1	\N	\N	\N	\N
2817	157	38	3	\N	\N	\N	\N
2818	158	18	1	\N	\N	\N	\N
2819	158	19	4	\N	\N	\N	\N
2820	158	20	1	\N	\N	\N	\N
2821	158	21	2	\N	\N	\N	\N
2822	158	22	1	\N	\N	\N	\N
2823	158	23	1	\N	\N	\N	\N
2824	158	24	1	\N	\N	\N	\N
2825	158	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
2826	158	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
2827	158	27	1	\N	\N	\N	\N
2828	158	28	4	\N	\N	\N	\N
2829	158	29	4	\N	\N	\N	\N
2830	158	30	1	\N	\N	\N	\N
2831	158	31	4	\N	\N	\N	\N
2832	158	32	3	\N	\N	\N	\N
2833	158	33	2	\N	\N	\N	\N
2834	158	34	2	\N	\N	\N	\N
2835	158	35	4	\N	\N	\N	\N
2836	158	36	3	\N	\N	\N	\N
2837	158	37	1	\N	\N	\N	\N
2838	158	38	2	\N	\N	\N	\N
2839	159	18	1	\N	\N	\N	\N
2840	159	19	3	\N	\N	\N	\N
2841	159	20	1	\N	\N	\N	\N
2842	159	21	3	\N	\N	\N	\N
2843	159	22	2	\N	\N	\N	\N
2844	159	23	1	\N	\N	\N	\N
2845	159	24	3	\N	\N	\N	\N
2846	159	25	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
2847	159	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
2848	159	27	3	\N	\N	\N	\N
2849	159	28	4	\N	\N	\N	\N
2850	159	29	3	\N	\N	\N	\N
2851	159	30	1	\N	\N	\N	\N
2852	159	31	3	\N	\N	\N	\N
2853	159	32	1	\N	\N	\N	\N
2854	159	33	1	\N	\N	\N	\N
2855	159	34	1	\N	\N	\N	\N
2856	159	35	3	\N	\N	\N	\N
2857	159	36	3	\N	\N	\N	\N
2858	159	37	3	\N	\N	\N	\N
2859	159	38	1	\N	\N	\N	\N
2860	160	18	3	\N	\N	\N	\N
2861	160	19	1	\N	\N	\N	\N
2862	160	20	3	\N	\N	\N	\N
2863	160	21	1	\N	\N	\N	\N
2864	160	22	2	\N	\N	\N	\N
2865	160	23	1	\N	\N	\N	\N
2866	160	24	4	\N	\N	\N	\N
2867	160	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
2868	160	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
2869	160	27	3	\N	\N	\N	\N
2870	160	28	3	\N	\N	\N	\N
2871	160	29	2	\N	\N	\N	\N
2872	160	30	2	\N	\N	\N	\N
2873	160	31	1	\N	\N	\N	\N
2874	160	32	1	\N	\N	\N	\N
2875	160	33	4	\N	\N	\N	\N
2876	160	34	4	\N	\N	\N	\N
2877	160	35	4	\N	\N	\N	\N
2878	160	36	1	\N	\N	\N	\N
2879	160	37	3	\N	\N	\N	\N
2880	160	38	3	\N	\N	\N	\N
2881	161	18	1	\N	\N	\N	\N
2882	161	19	3	\N	\N	\N	\N
2883	161	20	1	\N	\N	\N	\N
2884	161	21	3	\N	\N	\N	\N
2885	161	22	3	\N	\N	\N	\N
2886	161	23	2	\N	\N	\N	\N
2887	161	24	3	\N	\N	\N	\N
2888	161	25	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
2889	161	26	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
2890	161	27	1	\N	\N	\N	\N
2891	161	28	1	\N	\N	\N	\N
2892	161	29	2	\N	\N	\N	\N
2893	161	30	3	\N	\N	\N	\N
2894	161	31	1	\N	\N	\N	\N
2895	161	32	2	\N	\N	\N	\N
2896	161	33	3	\N	\N	\N	\N
2897	161	34	2	\N	\N	\N	\N
2898	161	35	3	\N	\N	\N	\N
2899	161	36	2	\N	\N	\N	\N
2900	161	37	2	\N	\N	\N	\N
2901	161	38	4	\N	\N	\N	\N
2902	162	18	2	\N	\N	\N	\N
2903	162	19	3	\N	\N	\N	\N
2904	162	20	3	\N	\N	\N	\N
2905	162	21	2	\N	\N	\N	\N
2906	162	22	3	\N	\N	\N	\N
2907	162	23	3	\N	\N	\N	\N
2908	162	24	1	\N	\N	\N	\N
2909	162	25	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
2910	162	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
2911	162	27	1	\N	\N	\N	\N
2912	162	28	1	\N	\N	\N	\N
2913	162	29	2	\N	\N	\N	\N
2914	162	30	2	\N	\N	\N	\N
2915	162	31	2	\N	\N	\N	\N
2916	162	32	4	\N	\N	\N	\N
2917	162	33	3	\N	\N	\N	\N
2918	162	34	2	\N	\N	\N	\N
2919	162	35	2	\N	\N	\N	\N
2920	162	36	3	\N	\N	\N	\N
2921	162	37	3	\N	\N	\N	\N
2922	162	38	3	\N	\N	\N	\N
2923	163	18	4	\N	\N	\N	\N
2924	163	19	4	\N	\N	\N	\N
2925	163	20	3	\N	\N	\N	\N
2926	163	21	4	\N	\N	\N	\N
2927	163	22	3	\N	\N	\N	\N
2928	163	23	3	\N	\N	\N	\N
2929	163	24	3	\N	\N	\N	\N
2930	163	25	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
2931	163	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
2932	163	27	2	\N	\N	\N	\N
2933	163	28	3	\N	\N	\N	\N
2934	163	29	4	\N	\N	\N	\N
2935	163	30	4	\N	\N	\N	\N
2936	163	31	4	\N	\N	\N	\N
2937	163	32	2	\N	\N	\N	\N
2938	163	33	3	\N	\N	\N	\N
2939	163	34	4	\N	\N	\N	\N
2940	163	35	4	\N	\N	\N	\N
2941	163	36	2	\N	\N	\N	\N
2942	163	37	3	\N	\N	\N	\N
2943	163	38	4	\N	\N	\N	\N
2944	164	18	3	\N	\N	\N	\N
2945	164	19	4	\N	\N	\N	\N
2946	164	20	4	\N	\N	\N	\N
2947	164	21	4	\N	\N	\N	\N
2948	164	22	4	\N	\N	\N	\N
2949	164	23	3	\N	\N	\N	\N
2950	164	24	4	\N	\N	\N	\N
2951	164	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
2952	164	26	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
2953	164	27	4	\N	\N	\N	\N
2954	164	28	4	\N	\N	\N	\N
2955	164	29	4	\N	\N	\N	\N
2956	164	30	3	\N	\N	\N	\N
2957	164	31	4	\N	\N	\N	\N
2958	164	32	3	\N	\N	\N	\N
2959	164	33	3	\N	\N	\N	\N
2960	164	34	4	\N	\N	\N	\N
2961	164	35	4	\N	\N	\N	\N
2962	164	36	1	\N	\N	\N	\N
2963	164	37	3	\N	\N	\N	\N
2964	164	38	3	\N	\N	\N	\N
2965	165	18	3	\N	\N	\N	\N
2966	165	19	2	\N	\N	\N	\N
2967	165	20	3	\N	\N	\N	\N
2968	165	21	3	\N	\N	\N	\N
2969	165	22	4	\N	\N	\N	\N
2970	165	23	4	\N	\N	\N	\N
2971	165	24	3	\N	\N	\N	\N
3089	170	37	3	\N	\N	\N	\N
2972	165	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
2973	165	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
2974	165	27	2	\N	\N	\N	\N
2975	165	28	4	\N	\N	\N	\N
2976	165	29	3	\N	\N	\N	\N
2977	165	30	4	\N	\N	\N	\N
2978	165	31	4	\N	\N	\N	\N
2979	165	32	4	\N	\N	\N	\N
2980	165	33	2	\N	\N	\N	\N
2981	165	34	2	\N	\N	\N	\N
2982	165	35	4	\N	\N	\N	\N
2983	165	36	2	\N	\N	\N	\N
2984	165	37	3	\N	\N	\N	\N
2985	165	38	4	\N	\N	\N	\N
2986	166	18	3	\N	\N	\N	\N
2987	166	19	4	\N	\N	\N	\N
2988	166	20	4	\N	\N	\N	\N
2989	166	21	4	\N	\N	\N	\N
2990	166	22	4	\N	\N	\N	\N
2991	166	23	2	\N	\N	\N	\N
2992	166	24	4	\N	\N	\N	\N
2993	166	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
2994	166	26	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
2995	166	27	3	\N	\N	\N	\N
2996	166	28	4	\N	\N	\N	\N
2997	166	29	3	\N	\N	\N	\N
2998	166	30	4	\N	\N	\N	\N
2999	166	31	3	\N	\N	\N	\N
3000	166	32	4	\N	\N	\N	\N
3001	166	33	3	\N	\N	\N	\N
3002	166	34	3	\N	\N	\N	\N
3003	166	35	3	\N	\N	\N	\N
3004	166	36	4	\N	\N	\N	\N
3005	166	37	4	\N	\N	\N	\N
3006	166	38	4	\N	\N	\N	\N
3007	167	18	2	\N	\N	\N	\N
3008	167	19	3	\N	\N	\N	\N
3009	167	20	4	\N	\N	\N	\N
3010	167	21	3	\N	\N	\N	\N
3011	167	22	3	\N	\N	\N	\N
3012	167	23	2	\N	\N	\N	\N
3013	167	24	4	\N	\N	\N	\N
3014	167	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
3015	167	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
3016	167	27	4	\N	\N	\N	\N
3017	167	28	4	\N	\N	\N	\N
3018	167	29	4	\N	\N	\N	\N
3019	167	30	4	\N	\N	\N	\N
3020	167	31	3	\N	\N	\N	\N
3021	167	32	4	\N	\N	\N	\N
3022	167	33	3	\N	\N	\N	\N
3023	167	34	4	\N	\N	\N	\N
3024	167	35	3	\N	\N	\N	\N
3025	167	36	3	\N	\N	\N	\N
3026	167	37	4	\N	\N	\N	\N
3027	167	38	3	\N	\N	\N	\N
3028	168	18	4	\N	\N	\N	\N
3029	168	19	4	\N	\N	\N	\N
3030	168	20	4	\N	\N	\N	\N
3031	168	21	4	\N	\N	\N	\N
3032	168	22	4	\N	\N	\N	\N
3033	168	23	4	\N	\N	\N	\N
3034	168	24	4	\N	\N	\N	\N
3035	168	25	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
3036	168	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
3037	168	27	2	\N	\N	\N	\N
3038	168	28	3	\N	\N	\N	\N
3039	168	29	4	\N	\N	\N	\N
3040	168	30	4	\N	\N	\N	\N
3041	168	31	3	\N	\N	\N	\N
3042	168	32	3	\N	\N	\N	\N
3043	168	33	3	\N	\N	\N	\N
3044	168	34	4	\N	\N	\N	\N
3045	168	35	2	\N	\N	\N	\N
3046	168	36	4	\N	\N	\N	\N
3047	168	37	4	\N	\N	\N	\N
3048	168	38	2	\N	\N	\N	\N
3049	169	18	3	\N	\N	\N	\N
3050	169	19	4	\N	\N	\N	\N
3051	169	20	3	\N	\N	\N	\N
3052	169	21	3	\N	\N	\N	\N
3053	169	22	3	\N	\N	\N	\N
3054	169	23	4	\N	\N	\N	\N
3055	169	24	4	\N	\N	\N	\N
3056	169	25	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
3057	169	26	\N	Más horas de consulta, porque las que tiene se llenan de inmediato.	POSITIVO	0.3924	MODELO
3058	169	27	2	\N	\N	\N	\N
3059	169	28	2	\N	\N	\N	\N
3060	169	29	3	\N	\N	\N	\N
3061	169	30	3	\N	\N	\N	\N
3062	169	31	4	\N	\N	\N	\N
3063	169	32	3	\N	\N	\N	\N
3064	169	33	3	\N	\N	\N	\N
3065	169	34	4	\N	\N	\N	\N
3066	169	35	3	\N	\N	\N	\N
3067	169	36	3	\N	\N	\N	\N
3068	169	37	4	\N	\N	\N	\N
3069	169	38	4	\N	\N	\N	\N
3070	170	18	3	\N	\N	\N	\N
3071	170	19	3	\N	\N	\N	\N
3072	170	20	4	\N	\N	\N	\N
3073	170	21	2	\N	\N	\N	\N
3074	170	22	3	\N	\N	\N	\N
3075	170	23	4	\N	\N	\N	\N
3076	170	24	4	\N	\N	\N	\N
3077	170	25	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
3078	170	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
3079	170	27	4	\N	\N	\N	\N
3080	170	28	3	\N	\N	\N	\N
3081	170	29	3	\N	\N	\N	\N
3082	170	30	4	\N	\N	\N	\N
3083	170	31	3	\N	\N	\N	\N
3084	170	32	4	\N	\N	\N	\N
3085	170	33	4	\N	\N	\N	\N
3086	170	34	3	\N	\N	\N	\N
3087	170	35	3	\N	\N	\N	\N
3088	170	36	4	\N	\N	\N	\N
3090	170	38	4	\N	\N	\N	\N
3091	171	18	3	\N	\N	\N	\N
3092	171	19	3	\N	\N	\N	\N
3093	171	20	3	\N	\N	\N	\N
3094	171	21	4	\N	\N	\N	\N
3095	171	22	3	\N	\N	\N	\N
3096	171	23	3	\N	\N	\N	\N
3097	171	24	4	\N	\N	\N	\N
3098	171	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
3099	171	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
3100	171	27	2	\N	\N	\N	\N
3101	171	28	4	\N	\N	\N	\N
3102	171	29	3	\N	\N	\N	\N
3103	171	30	4	\N	\N	\N	\N
3104	171	31	4	\N	\N	\N	\N
3105	171	32	3	\N	\N	\N	\N
3106	171	33	3	\N	\N	\N	\N
3107	171	34	3	\N	\N	\N	\N
3108	171	35	3	\N	\N	\N	\N
3109	171	36	3	\N	\N	\N	\N
3110	171	37	4	\N	\N	\N	\N
3111	171	38	3	\N	\N	\N	\N
3112	172	18	4	\N	\N	\N	\N
3113	172	19	3	\N	\N	\N	\N
3114	172	20	4	\N	\N	\N	\N
3115	172	21	4	\N	\N	\N	\N
3116	172	22	4	\N	\N	\N	\N
3117	172	23	3	\N	\N	\N	\N
3118	172	24	3	\N	\N	\N	\N
3119	172	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
3120	172	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
3121	172	27	3	\N	\N	\N	\N
3122	172	28	4	\N	\N	\N	\N
3123	172	29	4	\N	\N	\N	\N
3124	172	30	4	\N	\N	\N	\N
3125	172	31	4	\N	\N	\N	\N
3126	172	32	3	\N	\N	\N	\N
3127	172	33	4	\N	\N	\N	\N
3128	172	34	4	\N	\N	\N	\N
3129	172	35	4	\N	\N	\N	\N
3130	172	36	4	\N	\N	\N	\N
3131	172	37	4	\N	\N	\N	\N
3132	172	38	4	\N	\N	\N	\N
3133	173	18	2	\N	\N	\N	\N
3134	173	19	3	\N	\N	\N	\N
3135	173	20	3	\N	\N	\N	\N
3136	173	21	3	\N	\N	\N	\N
3137	173	22	2	\N	\N	\N	\N
3138	173	23	4	\N	\N	\N	\N
3139	173	24	3	\N	\N	\N	\N
3140	173	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
3141	173	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
3142	173	27	2	\N	\N	\N	\N
3143	173	28	4	\N	\N	\N	\N
3144	173	29	4	\N	\N	\N	\N
3145	173	30	4	\N	\N	\N	\N
3146	173	31	4	\N	\N	\N	\N
3147	173	32	4	\N	\N	\N	\N
3148	173	33	4	\N	\N	\N	\N
3149	173	34	4	\N	\N	\N	\N
3150	173	35	4	\N	\N	\N	\N
3151	173	36	3	\N	\N	\N	\N
3152	173	37	4	\N	\N	\N	\N
3153	173	38	4	\N	\N	\N	\N
3154	174	18	4	\N	\N	\N	\N
3155	174	19	3	\N	\N	\N	\N
3156	174	20	2	\N	\N	\N	\N
3157	174	21	3	\N	\N	\N	\N
3158	174	22	4	\N	\N	\N	\N
3159	174	23	3	\N	\N	\N	\N
3160	174	24	4	\N	\N	\N	\N
3161	174	25	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
3162	174	26	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
3163	174	27	3	\N	\N	\N	\N
3164	174	28	3	\N	\N	\N	\N
3165	174	29	4	\N	\N	\N	\N
3166	174	30	3	\N	\N	\N	\N
3167	174	31	3	\N	\N	\N	\N
3168	174	32	3	\N	\N	\N	\N
3169	174	33	3	\N	\N	\N	\N
3170	174	34	3	\N	\N	\N	\N
3171	174	35	4	\N	\N	\N	\N
3172	174	36	4	\N	\N	\N	\N
3173	174	37	4	\N	\N	\N	\N
3174	174	38	2	\N	\N	\N	\N
3175	175	18	4	\N	\N	\N	\N
3176	175	19	3	\N	\N	\N	\N
3177	175	20	4	\N	\N	\N	\N
3178	175	21	4	\N	\N	\N	\N
3179	175	22	4	\N	\N	\N	\N
3180	175	23	4	\N	\N	\N	\N
3181	175	24	3	\N	\N	\N	\N
3182	175	25	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
3183	175	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
3184	175	27	4	\N	\N	\N	\N
3185	175	28	4	\N	\N	\N	\N
3186	175	29	3	\N	\N	\N	\N
3187	175	30	4	\N	\N	\N	\N
3188	175	31	4	\N	\N	\N	\N
3189	175	32	3	\N	\N	\N	\N
3190	175	33	3	\N	\N	\N	\N
3191	175	34	4	\N	\N	\N	\N
3192	175	35	4	\N	\N	\N	\N
3193	175	36	4	\N	\N	\N	\N
3194	175	37	4	\N	\N	\N	\N
3195	175	38	4	\N	\N	\N	\N
3196	176	18	4	\N	\N	\N	\N
3197	176	19	4	\N	\N	\N	\N
3198	176	20	3	\N	\N	\N	\N
3199	176	21	3	\N	\N	\N	\N
3200	176	22	3	\N	\N	\N	\N
3201	176	23	3	\N	\N	\N	\N
3202	176	24	3	\N	\N	\N	\N
3203	176	25	\N	Tiene muy buena relación con los estudiantes y mucha disposición.	POSITIVO	0.9882	MODELO
3204	176	26	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
3205	176	27	3	\N	\N	\N	\N
3206	176	28	3	\N	\N	\N	\N
3207	176	29	4	\N	\N	\N	\N
3208	176	30	4	\N	\N	\N	\N
3209	176	31	4	\N	\N	\N	\N
3210	176	32	4	\N	\N	\N	\N
3211	176	33	4	\N	\N	\N	\N
3212	176	34	4	\N	\N	\N	\N
3213	176	35	4	\N	\N	\N	\N
3214	176	36	4	\N	\N	\N	\N
3215	176	37	4	\N	\N	\N	\N
3216	176	38	3	\N	\N	\N	\N
3217	177	18	4	\N	\N	\N	\N
3218	177	19	4	\N	\N	\N	\N
3219	177	20	4	\N	\N	\N	\N
3220	177	21	4	\N	\N	\N	\N
3221	177	22	2	\N	\N	\N	\N
3222	177	23	3	\N	\N	\N	\N
3223	177	24	4	\N	\N	\N	\N
3224	177	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
3225	177	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
3226	177	27	3	\N	\N	\N	\N
3227	177	28	3	\N	\N	\N	\N
3228	177	29	4	\N	\N	\N	\N
3229	177	30	4	\N	\N	\N	\N
3230	177	31	4	\N	\N	\N	\N
3231	177	32	3	\N	\N	\N	\N
3232	177	33	4	\N	\N	\N	\N
3233	177	34	4	\N	\N	\N	\N
3234	177	35	3	\N	\N	\N	\N
3235	177	36	4	\N	\N	\N	\N
3236	177	37	4	\N	\N	\N	\N
3237	177	38	4	\N	\N	\N	\N
3238	178	18	3	\N	\N	\N	\N
3239	178	19	3	\N	\N	\N	\N
3240	178	20	4	\N	\N	\N	\N
3241	178	21	4	\N	\N	\N	\N
3242	178	22	2	\N	\N	\N	\N
3243	178	23	4	\N	\N	\N	\N
3244	178	24	3	\N	\N	\N	\N
3245	178	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
3246	178	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
3247	178	27	2	\N	\N	\N	\N
3248	178	28	3	\N	\N	\N	\N
3249	178	29	3	\N	\N	\N	\N
3250	178	30	4	\N	\N	\N	\N
3251	178	31	4	\N	\N	\N	\N
3252	178	32	2	\N	\N	\N	\N
3253	178	33	4	\N	\N	\N	\N
3254	178	34	4	\N	\N	\N	\N
3255	178	35	4	\N	\N	\N	\N
3256	178	36	4	\N	\N	\N	\N
3257	178	37	3	\N	\N	\N	\N
3258	178	38	3	\N	\N	\N	\N
3259	179	18	3	\N	\N	\N	\N
3260	179	19	2	\N	\N	\N	\N
3261	179	20	3	\N	\N	\N	\N
3262	179	21	3	\N	\N	\N	\N
3263	179	22	2	\N	\N	\N	\N
3264	179	23	4	\N	\N	\N	\N
3265	179	24	3	\N	\N	\N	\N
3266	179	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
3267	179	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
3268	179	27	4	\N	\N	\N	\N
3269	179	28	3	\N	\N	\N	\N
3270	179	29	4	\N	\N	\N	\N
3271	179	30	3	\N	\N	\N	\N
3272	179	31	1	\N	\N	\N	\N
3273	179	32	2	\N	\N	\N	\N
3274	179	33	3	\N	\N	\N	\N
3275	179	34	4	\N	\N	\N	\N
3276	179	35	4	\N	\N	\N	\N
3277	179	36	4	\N	\N	\N	\N
3278	179	37	4	\N	\N	\N	\N
3279	179	38	3	\N	\N	\N	\N
3280	180	18	3	\N	\N	\N	\N
3281	180	19	2	\N	\N	\N	\N
3282	180	20	3	\N	\N	\N	\N
3283	180	21	4	\N	\N	\N	\N
3284	180	22	4	\N	\N	\N	\N
3285	180	23	3	\N	\N	\N	\N
3286	180	24	4	\N	\N	\N	\N
3287	180	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
3288	180	26	\N	Más horas de consulta, porque las que tiene se llenan de inmediato.	POSITIVO	0.3924	MODELO
3289	180	27	3	\N	\N	\N	\N
3290	180	28	3	\N	\N	\N	\N
3291	180	29	3	\N	\N	\N	\N
3292	180	30	4	\N	\N	\N	\N
3293	180	31	3	\N	\N	\N	\N
3294	180	32	3	\N	\N	\N	\N
3295	180	33	4	\N	\N	\N	\N
3296	180	34	2	\N	\N	\N	\N
3297	180	35	4	\N	\N	\N	\N
3298	180	36	2	\N	\N	\N	\N
3299	180	37	4	\N	\N	\N	\N
3300	180	38	4	\N	\N	\N	\N
3301	181	18	4	\N	\N	\N	\N
3302	181	19	3	\N	\N	\N	\N
3303	181	20	4	\N	\N	\N	\N
3304	181	21	4	\N	\N	\N	\N
3305	181	22	4	\N	\N	\N	\N
3306	181	23	3	\N	\N	\N	\N
3307	181	24	1	\N	\N	\N	\N
3308	181	25	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
3309	181	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
3310	181	27	4	\N	\N	\N	\N
3311	181	28	4	\N	\N	\N	\N
3312	181	29	3	\N	\N	\N	\N
3313	181	30	2	\N	\N	\N	\N
3314	181	31	4	\N	\N	\N	\N
3315	181	32	4	\N	\N	\N	\N
3316	181	33	3	\N	\N	\N	\N
3317	181	34	4	\N	\N	\N	\N
3318	181	35	4	\N	\N	\N	\N
3319	181	36	4	\N	\N	\N	\N
3320	181	37	4	\N	\N	\N	\N
3321	181	38	4	\N	\N	\N	\N
3322	182	18	4	\N	\N	\N	\N
3323	182	19	4	\N	\N	\N	\N
3324	182	20	3	\N	\N	\N	\N
3325	182	21	2	\N	\N	\N	\N
3326	182	22	3	\N	\N	\N	\N
3327	182	23	2	\N	\N	\N	\N
3328	182	24	4	\N	\N	\N	\N
3329	182	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
3330	182	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
3331	182	27	4	\N	\N	\N	\N
3332	182	28	3	\N	\N	\N	\N
3333	182	29	3	\N	\N	\N	\N
3334	182	30	4	\N	\N	\N	\N
3335	182	31	4	\N	\N	\N	\N
3336	182	32	3	\N	\N	\N	\N
3337	182	33	3	\N	\N	\N	\N
3338	182	34	3	\N	\N	\N	\N
3339	182	35	4	\N	\N	\N	\N
3340	182	36	4	\N	\N	\N	\N
3341	182	37	4	\N	\N	\N	\N
3342	182	38	3	\N	\N	\N	\N
3343	183	18	4	\N	\N	\N	\N
3344	183	19	4	\N	\N	\N	\N
3345	183	20	4	\N	\N	\N	\N
3346	183	21	4	\N	\N	\N	\N
3347	183	22	4	\N	\N	\N	\N
3348	183	23	4	\N	\N	\N	\N
3349	183	24	2	\N	\N	\N	\N
3350	183	25	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
3351	183	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
3352	183	27	3	\N	\N	\N	\N
3353	183	28	3	\N	\N	\N	\N
3354	183	29	3	\N	\N	\N	\N
3355	183	30	3	\N	\N	\N	\N
3356	183	31	4	\N	\N	\N	\N
3357	183	32	3	\N	\N	\N	\N
3358	183	33	3	\N	\N	\N	\N
3359	183	34	3	\N	\N	\N	\N
3360	183	35	4	\N	\N	\N	\N
3361	183	36	4	\N	\N	\N	\N
3362	183	37	4	\N	\N	\N	\N
3363	183	38	3	\N	\N	\N	\N
3364	184	18	4	\N	\N	\N	\N
3365	184	19	2	\N	\N	\N	\N
3366	184	20	4	\N	\N	\N	\N
3367	184	21	3	\N	\N	\N	\N
3368	184	22	4	\N	\N	\N	\N
3369	184	23	4	\N	\N	\N	\N
3370	184	24	3	\N	\N	\N	\N
3371	184	25	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
3372	184	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
3373	184	27	2	\N	\N	\N	\N
3374	184	28	2	\N	\N	\N	\N
3375	184	29	4	\N	\N	\N	\N
3376	184	30	3	\N	\N	\N	\N
3377	184	31	3	\N	\N	\N	\N
3378	184	32	4	\N	\N	\N	\N
3379	184	33	4	\N	\N	\N	\N
3380	184	34	4	\N	\N	\N	\N
3381	184	35	4	\N	\N	\N	\N
3382	184	36	3	\N	\N	\N	\N
3383	184	37	4	\N	\N	\N	\N
3384	184	38	4	\N	\N	\N	\N
3385	185	18	2	\N	\N	\N	\N
3386	185	19	3	\N	\N	\N	\N
3387	185	20	1	\N	\N	\N	\N
3388	185	21	1	\N	\N	\N	\N
3389	185	22	3	\N	\N	\N	\N
3390	185	23	2	\N	\N	\N	\N
3391	185	24	2	\N	\N	\N	\N
3392	185	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
3393	185	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
3394	185	27	1	\N	\N	\N	\N
3395	185	28	2	\N	\N	\N	\N
3396	185	29	3	\N	\N	\N	\N
3397	185	30	4	\N	\N	\N	\N
3398	185	31	1	\N	\N	\N	\N
3399	185	32	1	\N	\N	\N	\N
3400	185	33	1	\N	\N	\N	\N
3401	185	34	1	\N	\N	\N	\N
3402	185	35	3	\N	\N	\N	\N
3403	185	36	4	\N	\N	\N	\N
3404	185	37	3	\N	\N	\N	\N
3405	185	38	4	\N	\N	\N	\N
3406	186	18	3	\N	\N	\N	\N
3407	186	19	3	\N	\N	\N	\N
3408	186	20	2	\N	\N	\N	\N
3409	186	21	1	\N	\N	\N	\N
3410	186	22	1	\N	\N	\N	\N
3411	186	23	1	\N	\N	\N	\N
3412	186	24	3	\N	\N	\N	\N
3413	186	25	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
3414	186	26	\N	Falta respeto con los estudiantes cuando hacen preguntas.	NEGATIVO	0.6073	MODELO
3415	186	27	1	\N	\N	\N	\N
3416	186	28	4	\N	\N	\N	\N
3417	186	29	3	\N	\N	\N	\N
3418	186	30	1	\N	\N	\N	\N
3419	186	31	2	\N	\N	\N	\N
3420	186	32	2	\N	\N	\N	\N
3421	186	33	2	\N	\N	\N	\N
3422	186	34	2	\N	\N	\N	\N
3423	186	35	4	\N	\N	\N	\N
3424	186	36	1	\N	\N	\N	\N
3425	186	37	3	\N	\N	\N	\N
3426	186	38	1	\N	\N	\N	\N
3427	187	18	3	\N	\N	\N	\N
3428	187	19	2	\N	\N	\N	\N
3429	187	20	2	\N	\N	\N	\N
3430	187	21	2	\N	\N	\N	\N
3431	187	22	2	\N	\N	\N	\N
3432	187	23	1	\N	\N	\N	\N
3433	187	24	2	\N	\N	\N	\N
3434	187	25	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
3435	187	26	\N	No hay retroalimentación de los trabajos, uno no sabe en qué está mal.	NEUTRO	0.6001	MODELO
3436	187	27	1	\N	\N	\N	\N
3437	187	28	3	\N	\N	\N	\N
3438	187	29	2	\N	\N	\N	\N
3439	187	30	2	\N	\N	\N	\N
3440	187	31	3	\N	\N	\N	\N
3441	187	32	1	\N	\N	\N	\N
3442	187	33	2	\N	\N	\N	\N
3443	187	34	3	\N	\N	\N	\N
3444	187	35	3	\N	\N	\N	\N
3445	187	36	2	\N	\N	\N	\N
3446	187	37	2	\N	\N	\N	\N
3447	187	38	1	\N	\N	\N	\N
3448	188	18	1	\N	\N	\N	\N
3449	188	19	4	\N	\N	\N	\N
3450	188	20	2	\N	\N	\N	\N
3451	188	21	1	\N	\N	\N	\N
3452	188	22	1	\N	\N	\N	\N
3453	188	23	1	\N	\N	\N	\N
3454	188	24	4	\N	\N	\N	\N
3455	188	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
3456	188	26	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
3457	188	27	2	\N	\N	\N	\N
3458	188	28	1	\N	\N	\N	\N
3459	188	29	4	\N	\N	\N	\N
3460	188	30	1	\N	\N	\N	\N
3461	188	31	3	\N	\N	\N	\N
3462	188	32	3	\N	\N	\N	\N
3463	188	33	2	\N	\N	\N	\N
3464	188	34	3	\N	\N	\N	\N
3465	188	35	2	\N	\N	\N	\N
3466	188	36	3	\N	\N	\N	\N
3467	188	37	1	\N	\N	\N	\N
3468	188	38	1	\N	\N	\N	\N
3469	189	18	2	\N	\N	\N	\N
3470	189	19	3	\N	\N	\N	\N
3471	189	20	3	\N	\N	\N	\N
3472	189	21	2	\N	\N	\N	\N
3473	189	22	3	\N	\N	\N	\N
3474	189	23	2	\N	\N	\N	\N
3475	189	24	3	\N	\N	\N	\N
3476	189	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
3477	189	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
3478	189	27	1	\N	\N	\N	\N
3479	189	28	1	\N	\N	\N	\N
3480	189	29	1	\N	\N	\N	\N
3481	189	30	2	\N	\N	\N	\N
3482	189	31	2	\N	\N	\N	\N
3483	189	32	1	\N	\N	\N	\N
3484	189	33	2	\N	\N	\N	\N
3485	189	34	2	\N	\N	\N	\N
3486	189	35	3	\N	\N	\N	\N
3487	189	36	3	\N	\N	\N	\N
3488	189	37	3	\N	\N	\N	\N
3489	189	38	4	\N	\N	\N	\N
3490	190	18	2	\N	\N	\N	\N
3491	190	19	2	\N	\N	\N	\N
3492	190	20	2	\N	\N	\N	\N
3493	190	21	2	\N	\N	\N	\N
3494	190	22	1	\N	\N	\N	\N
3495	190	23	1	\N	\N	\N	\N
3496	190	24	1	\N	\N	\N	\N
3497	190	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
3498	190	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
3499	190	27	1	\N	\N	\N	\N
3500	190	28	3	\N	\N	\N	\N
3501	190	29	1	\N	\N	\N	\N
3502	190	30	2	\N	\N	\N	\N
3503	190	31	2	\N	\N	\N	\N
3504	190	32	2	\N	\N	\N	\N
3505	190	33	3	\N	\N	\N	\N
3506	190	34	2	\N	\N	\N	\N
3507	190	35	2	\N	\N	\N	\N
3508	190	36	2	\N	\N	\N	\N
3509	190	37	2	\N	\N	\N	\N
3510	190	38	1	\N	\N	\N	\N
3511	191	18	2	\N	\N	\N	\N
3512	191	19	4	\N	\N	\N	\N
3513	191	20	1	\N	\N	\N	\N
3514	191	21	2	\N	\N	\N	\N
3515	191	22	1	\N	\N	\N	\N
3516	191	23	2	\N	\N	\N	\N
3517	191	24	3	\N	\N	\N	\N
3518	191	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
3519	191	26	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
3520	191	27	3	\N	\N	\N	\N
3521	191	28	2	\N	\N	\N	\N
3522	191	29	3	\N	\N	\N	\N
3523	191	30	3	\N	\N	\N	\N
3524	191	31	3	\N	\N	\N	\N
3525	191	32	2	\N	\N	\N	\N
3526	191	33	2	\N	\N	\N	\N
3527	191	34	2	\N	\N	\N	\N
3528	191	35	1	\N	\N	\N	\N
3529	191	36	2	\N	\N	\N	\N
3530	191	37	1	\N	\N	\N	\N
3531	191	38	2	\N	\N	\N	\N
3532	192	18	1	\N	\N	\N	\N
3533	192	19	4	\N	\N	\N	\N
3534	192	20	3	\N	\N	\N	\N
3535	192	21	1	\N	\N	\N	\N
3536	192	22	4	\N	\N	\N	\N
3537	192	23	2	\N	\N	\N	\N
3538	192	24	3	\N	\N	\N	\N
3539	192	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
3540	192	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
3541	192	27	2	\N	\N	\N	\N
3542	192	28	2	\N	\N	\N	\N
3543	192	29	1	\N	\N	\N	\N
3544	192	30	1	\N	\N	\N	\N
3545	192	31	3	\N	\N	\N	\N
3546	192	32	3	\N	\N	\N	\N
3547	192	33	2	\N	\N	\N	\N
3548	192	34	1	\N	\N	\N	\N
3549	192	35	4	\N	\N	\N	\N
3550	192	36	1	\N	\N	\N	\N
3551	192	37	4	\N	\N	\N	\N
3552	192	38	2	\N	\N	\N	\N
3553	193	18	2	\N	\N	\N	\N
3554	193	19	3	\N	\N	\N	\N
3555	193	20	2	\N	\N	\N	\N
3556	193	21	2	\N	\N	\N	\N
3557	193	22	2	\N	\N	\N	\N
3558	193	23	2	\N	\N	\N	\N
3559	193	24	2	\N	\N	\N	\N
3560	193	25	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
3561	193	26	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
3562	193	27	4	\N	\N	\N	\N
3563	193	28	2	\N	\N	\N	\N
3564	193	29	3	\N	\N	\N	\N
3565	193	30	3	\N	\N	\N	\N
3566	193	31	3	\N	\N	\N	\N
3567	193	32	1	\N	\N	\N	\N
3568	193	33	2	\N	\N	\N	\N
3569	193	34	4	\N	\N	\N	\N
3570	193	35	3	\N	\N	\N	\N
3571	193	36	3	\N	\N	\N	\N
3572	193	37	2	\N	\N	\N	\N
3573	193	38	3	\N	\N	\N	\N
3574	194	18	1	\N	\N	\N	\N
3575	194	19	3	\N	\N	\N	\N
3576	194	20	2	\N	\N	\N	\N
3577	194	21	3	\N	\N	\N	\N
3578	194	22	1	\N	\N	\N	\N
3579	194	23	3	\N	\N	\N	\N
3580	194	24	1	\N	\N	\N	\N
3581	194	25	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
3582	194	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
3583	194	27	2	\N	\N	\N	\N
3584	194	28	1	\N	\N	\N	\N
3585	194	29	3	\N	\N	\N	\N
3586	194	30	2	\N	\N	\N	\N
3587	194	31	3	\N	\N	\N	\N
3588	194	32	4	\N	\N	\N	\N
3589	194	33	3	\N	\N	\N	\N
3590	194	34	3	\N	\N	\N	\N
3591	194	35	1	\N	\N	\N	\N
3592	194	36	1	\N	\N	\N	\N
3593	194	37	1	\N	\N	\N	\N
3594	194	38	2	\N	\N	\N	\N
3595	195	18	2	\N	\N	\N	\N
3596	195	19	2	\N	\N	\N	\N
3597	195	20	1	\N	\N	\N	\N
3598	195	21	4	\N	\N	\N	\N
3599	195	22	2	\N	\N	\N	\N
3600	195	23	2	\N	\N	\N	\N
3601	195	24	3	\N	\N	\N	\N
3602	195	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
3603	195	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
3604	195	27	4	\N	\N	\N	\N
3605	195	28	1	\N	\N	\N	\N
3606	195	29	1	\N	\N	\N	\N
3607	195	30	4	\N	\N	\N	\N
3608	195	31	4	\N	\N	\N	\N
3609	195	32	3	\N	\N	\N	\N
3610	195	33	3	\N	\N	\N	\N
3611	195	34	3	\N	\N	\N	\N
3612	195	35	2	\N	\N	\N	\N
3613	195	36	2	\N	\N	\N	\N
3614	195	37	2	\N	\N	\N	\N
3615	195	38	4	\N	\N	\N	\N
3616	196	18	1	\N	\N	\N	\N
3617	196	19	2	\N	\N	\N	\N
3618	196	20	2	\N	\N	\N	\N
3619	196	21	4	\N	\N	\N	\N
3620	196	22	2	\N	\N	\N	\N
3621	196	23	2	\N	\N	\N	\N
3622	196	24	3	\N	\N	\N	\N
3623	196	25	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
3624	196	26	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
3625	196	27	2	\N	\N	\N	\N
3626	196	28	2	\N	\N	\N	\N
3627	196	29	1	\N	\N	\N	\N
3628	196	30	2	\N	\N	\N	\N
3629	196	31	1	\N	\N	\N	\N
3630	196	32	2	\N	\N	\N	\N
3631	196	33	4	\N	\N	\N	\N
3632	196	34	3	\N	\N	\N	\N
3633	196	35	1	\N	\N	\N	\N
3634	196	36	2	\N	\N	\N	\N
3635	196	37	2	\N	\N	\N	\N
3636	196	38	1	\N	\N	\N	\N
3637	197	18	2	\N	\N	\N	\N
3638	197	19	3	\N	\N	\N	\N
3639	197	20	1	\N	\N	\N	\N
3640	197	21	2	\N	\N	\N	\N
3641	197	22	3	\N	\N	\N	\N
3642	197	23	1	\N	\N	\N	\N
3643	197	24	3	\N	\N	\N	\N
3644	197	25	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
3645	197	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
3646	197	27	2	\N	\N	\N	\N
3647	197	28	4	\N	\N	\N	\N
3648	197	29	3	\N	\N	\N	\N
3649	197	30	2	\N	\N	\N	\N
3650	197	31	1	\N	\N	\N	\N
3651	197	32	4	\N	\N	\N	\N
3652	197	33	2	\N	\N	\N	\N
3653	197	34	3	\N	\N	\N	\N
3654	197	35	4	\N	\N	\N	\N
3655	197	36	1	\N	\N	\N	\N
3656	197	37	2	\N	\N	\N	\N
3657	197	38	2	\N	\N	\N	\N
3658	198	18	4	\N	\N	\N	\N
3659	198	19	4	\N	\N	\N	\N
3660	198	20	1	\N	\N	\N	\N
3661	198	21	3	\N	\N	\N	\N
3662	198	22	1	\N	\N	\N	\N
3663	198	23	4	\N	\N	\N	\N
3664	198	24	4	\N	\N	\N	\N
3665	198	25	\N	Los trabajos prácticos son útiles, eso rescata algo del curso.	NEGATIVO	0.4972	MODELO
3666	198	26	\N	No hay retroalimentación de los trabajos, uno no sabe en qué está mal.	NEUTRO	0.6001	MODELO
3667	198	27	3	\N	\N	\N	\N
3668	198	28	1	\N	\N	\N	\N
3669	198	29	2	\N	\N	\N	\N
3670	198	30	1	\N	\N	\N	\N
3671	198	31	4	\N	\N	\N	\N
3672	198	32	1	\N	\N	\N	\N
3673	198	33	4	\N	\N	\N	\N
3674	198	34	2	\N	\N	\N	\N
3675	198	35	2	\N	\N	\N	\N
3676	198	36	4	\N	\N	\N	\N
3677	198	37	3	\N	\N	\N	\N
3678	198	38	2	\N	\N	\N	\N
3679	199	18	1	\N	\N	\N	\N
3680	199	19	1	\N	\N	\N	\N
3681	199	20	2	\N	\N	\N	\N
3682	199	21	1	\N	\N	\N	\N
3683	199	22	1	\N	\N	\N	\N
3684	199	23	3	\N	\N	\N	\N
3685	199	24	3	\N	\N	\N	\N
3686	199	25	\N	Al menos es estricto con la asistencia al aula.	POSITIVO	0.4242	MODELO
3687	199	26	\N	Debería preparar mejor las clases, se nota improvisación.	POSITIVO	0.7819	MODELO
3688	199	27	3	\N	\N	\N	\N
3689	199	28	2	\N	\N	\N	\N
3690	199	29	1	\N	\N	\N	\N
3691	199	30	3	\N	\N	\N	\N
3692	199	31	1	\N	\N	\N	\N
3693	199	32	1	\N	\N	\N	\N
3694	199	33	2	\N	\N	\N	\N
3695	199	34	1	\N	\N	\N	\N
3696	199	35	1	\N	\N	\N	\N
3697	199	36	1	\N	\N	\N	\N
3698	199	37	3	\N	\N	\N	\N
3699	199	38	4	\N	\N	\N	\N
3700	200	18	3	\N	\N	\N	\N
3701	200	19	1	\N	\N	\N	\N
3702	200	20	3	\N	\N	\N	\N
3703	200	21	3	\N	\N	\N	\N
3704	200	22	1	\N	\N	\N	\N
3705	200	23	1	\N	\N	\N	\N
3706	200	24	2	\N	\N	\N	\N
3707	200	25	\N	No logro destacar mucho, pero el tema es importante.	NEUTRO	0.4316	MODELO
3708	200	26	\N	No hay retroalimentación de los trabajos, uno no sabe en qué está mal.	NEUTRO	0.6001	MODELO
3709	200	27	3	\N	\N	\N	\N
3710	200	28	3	\N	\N	\N	\N
3711	200	29	4	\N	\N	\N	\N
3712	200	30	2	\N	\N	\N	\N
3713	200	31	1	\N	\N	\N	\N
3714	200	32	4	\N	\N	\N	\N
3715	200	33	2	\N	\N	\N	\N
3716	200	34	2	\N	\N	\N	\N
3717	200	35	4	\N	\N	\N	\N
3718	200	36	2	\N	\N	\N	\N
3719	200	37	3	\N	\N	\N	\N
3720	200	38	4	\N	\N	\N	\N
3721	201	18	3	\N	\N	\N	\N
3722	201	19	3	\N	\N	\N	\N
3723	201	20	3	\N	\N	\N	\N
3724	201	21	3	\N	\N	\N	\N
3725	201	22	2	\N	\N	\N	\N
3726	201	23	3	\N	\N	\N	\N
3727	201	24	2	\N	\N	\N	\N
3728	201	25	\N	Se nota que conoce el tema, aunque no logre enseñarlo.	NEUTRO	0.4636	MODELO
3729	201	26	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
3730	201	27	1	\N	\N	\N	\N
3731	201	28	3	\N	\N	\N	\N
3732	201	29	4	\N	\N	\N	\N
3733	201	30	1	\N	\N	\N	\N
3734	201	31	2	\N	\N	\N	\N
3735	201	32	1	\N	\N	\N	\N
3736	201	33	3	\N	\N	\N	\N
3737	201	34	2	\N	\N	\N	\N
3738	201	35	3	\N	\N	\N	\N
3739	201	36	3	\N	\N	\N	\N
3740	201	37	2	\N	\N	\N	\N
3741	201	38	4	\N	\N	\N	\N
3742	202	18	1	\N	\N	\N	\N
3743	202	19	1	\N	\N	\N	\N
3744	202	20	2	\N	\N	\N	\N
3745	202	21	2	\N	\N	\N	\N
3746	202	22	2	\N	\N	\N	\N
3747	202	23	3	\N	\N	\N	\N
3748	202	24	2	\N	\N	\N	\N
3749	202	25	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
3750	202	26	\N	La clase es poco clara, lee literalmente las diapositivas sin explicar.	NEUTRO	0.4971	MODELO
3751	202	27	2	\N	\N	\N	\N
3752	202	28	1	\N	\N	\N	\N
3753	202	29	2	\N	\N	\N	\N
3754	202	30	1	\N	\N	\N	\N
3755	202	31	4	\N	\N	\N	\N
3756	202	32	4	\N	\N	\N	\N
3757	202	33	1	\N	\N	\N	\N
3758	202	34	4	\N	\N	\N	\N
3759	202	35	1	\N	\N	\N	\N
3760	202	36	2	\N	\N	\N	\N
3761	202	37	3	\N	\N	\N	\N
3762	202	38	3	\N	\N	\N	\N
3763	203	18	3	\N	\N	\N	\N
3764	203	19	2	\N	\N	\N	\N
3765	203	20	4	\N	\N	\N	\N
3766	203	21	2	\N	\N	\N	\N
3767	203	22	3	\N	\N	\N	\N
3768	203	23	4	\N	\N	\N	\N
3769	203	24	2	\N	\N	\N	\N
3770	203	25	\N	No logro destacar mucho, pero el tema es importante.	NEUTRO	0.4316	MODELO
3771	203	26	\N	No hay retroalimentación de los trabajos, uno no sabe en qué está mal.	NEUTRO	0.6001	MODELO
3772	203	27	1	\N	\N	\N	\N
3773	203	28	4	\N	\N	\N	\N
3774	203	29	2	\N	\N	\N	\N
3775	203	30	1	\N	\N	\N	\N
3776	203	31	4	\N	\N	\N	\N
3777	203	32	3	\N	\N	\N	\N
3778	203	33	3	\N	\N	\N	\N
3779	203	34	4	\N	\N	\N	\N
3780	203	35	2	\N	\N	\N	\N
3781	203	36	3	\N	\N	\N	\N
3782	203	37	2	\N	\N	\N	\N
3783	203	38	2	\N	\N	\N	\N
3784	204	18	2	\N	\N	\N	\N
3785	204	19	1	\N	\N	\N	\N
3786	204	20	1	\N	\N	\N	\N
3787	204	21	3	\N	\N	\N	\N
3788	204	22	3	\N	\N	\N	\N
3789	204	23	1	\N	\N	\N	\N
3790	204	24	3	\N	\N	\N	\N
3791	204	25	\N	El contenido del curso es interesante, lástima la forma de enseñarlo.	POSITIVO	0.975	MODELO
3792	204	26	\N	Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.	POSITIVO	0.6005	MODELO
3793	204	27	1	\N	\N	\N	\N
3794	204	28	1	\N	\N	\N	\N
3795	204	29	2	\N	\N	\N	\N
3796	204	30	3	\N	\N	\N	\N
3797	204	31	1	\N	\N	\N	\N
3798	204	32	3	\N	\N	\N	\N
3799	204	33	2	\N	\N	\N	\N
3800	204	34	1	\N	\N	\N	\N
3801	204	35	1	\N	\N	\N	\N
3802	204	36	3	\N	\N	\N	\N
3803	204	37	1	\N	\N	\N	\N
3804	204	38	2	\N	\N	\N	\N
3805	205	18	3	\N	\N	\N	\N
3806	205	19	3	\N	\N	\N	\N
3807	205	20	2	\N	\N	\N	\N
3808	205	21	2	\N	\N	\N	\N
3809	205	22	3	\N	\N	\N	\N
3810	205	23	2	\N	\N	\N	\N
3811	205	24	2	\N	\N	\N	\N
3812	205	25	\N	No logro destacar mucho, pero el tema es importante.	NEUTRO	0.4316	MODELO
3813	205	26	\N	No hay retroalimentación de los trabajos, uno no sabe en qué está mal.	NEUTRO	0.6001	MODELO
3814	205	27	1	\N	\N	\N	\N
3815	205	28	2	\N	\N	\N	\N
3816	205	29	2	\N	\N	\N	\N
3817	205	30	3	\N	\N	\N	\N
3818	205	31	1	\N	\N	\N	\N
3819	205	32	3	\N	\N	\N	\N
3820	205	33	2	\N	\N	\N	\N
3821	205	34	1	\N	\N	\N	\N
3822	205	35	2	\N	\N	\N	\N
3823	205	36	3	\N	\N	\N	\N
3824	205	37	2	\N	\N	\N	\N
3825	205	38	2	\N	\N	\N	\N
3826	206	18	3	\N	\N	\N	\N
3827	206	19	3	\N	\N	\N	\N
3828	206	20	2	\N	\N	\N	\N
3829	206	21	3	\N	\N	\N	\N
3830	206	22	3	\N	\N	\N	\N
3831	206	23	3	\N	\N	\N	\N
3832	206	24	4	\N	\N	\N	\N
3833	206	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
3834	206	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
3835	206	27	3	\N	\N	\N	\N
3836	206	28	3	\N	\N	\N	\N
3837	206	29	3	\N	\N	\N	\N
3838	206	30	3	\N	\N	\N	\N
3839	206	31	3	\N	\N	\N	\N
3840	206	32	3	\N	\N	\N	\N
3841	206	33	2	\N	\N	\N	\N
3842	206	34	3	\N	\N	\N	\N
3843	206	35	3	\N	\N	\N	\N
3844	206	36	3	\N	\N	\N	\N
3845	206	37	4	\N	\N	\N	\N
3846	206	38	1	\N	\N	\N	\N
3847	207	18	3	\N	\N	\N	\N
3848	207	19	1	\N	\N	\N	\N
3849	207	20	2	\N	\N	\N	\N
3850	207	21	4	\N	\N	\N	\N
3851	207	22	3	\N	\N	\N	\N
3852	207	23	4	\N	\N	\N	\N
3853	207	24	2	\N	\N	\N	\N
3854	207	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
3855	207	26	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
3856	207	27	2	\N	\N	\N	\N
3857	207	28	2	\N	\N	\N	\N
3858	207	29	4	\N	\N	\N	\N
3859	207	30	4	\N	\N	\N	\N
3860	207	31	4	\N	\N	\N	\N
3861	207	32	4	\N	\N	\N	\N
3862	207	33	4	\N	\N	\N	\N
3863	207	34	4	\N	\N	\N	\N
3864	207	35	3	\N	\N	\N	\N
3865	207	36	3	\N	\N	\N	\N
3866	207	37	3	\N	\N	\N	\N
3867	207	38	3	\N	\N	\N	\N
3868	208	18	4	\N	\N	\N	\N
3869	208	19	3	\N	\N	\N	\N
3870	208	20	3	\N	\N	\N	\N
3871	208	21	4	\N	\N	\N	\N
3872	208	22	3	\N	\N	\N	\N
3873	208	23	4	\N	\N	\N	\N
3874	208	24	4	\N	\N	\N	\N
3875	208	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
3876	208	26	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
3877	208	27	3	\N	\N	\N	\N
3878	208	28	1	\N	\N	\N	\N
3879	208	29	4	\N	\N	\N	\N
3880	208	30	4	\N	\N	\N	\N
3881	208	31	1	\N	\N	\N	\N
3882	208	32	3	\N	\N	\N	\N
3883	208	33	3	\N	\N	\N	\N
3884	208	34	4	\N	\N	\N	\N
3885	208	35	3	\N	\N	\N	\N
3886	208	36	2	\N	\N	\N	\N
3887	208	37	3	\N	\N	\N	\N
3888	208	38	3	\N	\N	\N	\N
3889	209	18	3	\N	\N	\N	\N
3890	209	19	4	\N	\N	\N	\N
3891	209	20	3	\N	\N	\N	\N
3892	209	21	4	\N	\N	\N	\N
3893	209	22	3	\N	\N	\N	\N
3894	209	23	4	\N	\N	\N	\N
3895	209	24	4	\N	\N	\N	\N
3896	209	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
3897	209	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
3898	209	27	3	\N	\N	\N	\N
3899	209	28	4	\N	\N	\N	\N
3900	209	29	3	\N	\N	\N	\N
3901	209	30	4	\N	\N	\N	\N
3902	209	31	1	\N	\N	\N	\N
3903	209	32	1	\N	\N	\N	\N
3904	209	33	4	\N	\N	\N	\N
3905	209	34	4	\N	\N	\N	\N
3906	209	35	4	\N	\N	\N	\N
3907	209	36	4	\N	\N	\N	\N
3908	209	37	3	\N	\N	\N	\N
3909	209	38	4	\N	\N	\N	\N
3910	210	18	4	\N	\N	\N	\N
3911	210	19	1	\N	\N	\N	\N
3912	210	20	3	\N	\N	\N	\N
3913	210	21	3	\N	\N	\N	\N
3914	210	22	3	\N	\N	\N	\N
3915	210	23	4	\N	\N	\N	\N
3916	210	24	3	\N	\N	\N	\N
3917	210	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
3918	210	26	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
3919	210	27	3	\N	\N	\N	\N
3920	210	28	1	\N	\N	\N	\N
3921	210	29	3	\N	\N	\N	\N
3922	210	30	3	\N	\N	\N	\N
3923	210	31	4	\N	\N	\N	\N
3924	210	32	1	\N	\N	\N	\N
3925	210	33	4	\N	\N	\N	\N
3926	210	34	4	\N	\N	\N	\N
3927	210	35	4	\N	\N	\N	\N
3928	210	36	4	\N	\N	\N	\N
3929	210	37	2	\N	\N	\N	\N
3930	210	38	2	\N	\N	\N	\N
3931	211	18	2	\N	\N	\N	\N
3932	211	19	3	\N	\N	\N	\N
3933	211	20	4	\N	\N	\N	\N
3934	211	21	3	\N	\N	\N	\N
3935	211	22	3	\N	\N	\N	\N
3936	211	23	3	\N	\N	\N	\N
3937	211	24	3	\N	\N	\N	\N
3938	211	25	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
3939	211	26	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
3940	211	27	4	\N	\N	\N	\N
3941	211	28	4	\N	\N	\N	\N
3942	211	29	4	\N	\N	\N	\N
3943	211	30	2	\N	\N	\N	\N
3944	211	31	3	\N	\N	\N	\N
3945	211	32	3	\N	\N	\N	\N
3946	211	33	1	\N	\N	\N	\N
3947	211	34	1	\N	\N	\N	\N
3948	211	35	2	\N	\N	\N	\N
3949	211	36	3	\N	\N	\N	\N
3950	211	37	3	\N	\N	\N	\N
3951	211	38	4	\N	\N	\N	\N
3952	212	18	4	\N	\N	\N	\N
3953	212	19	2	\N	\N	\N	\N
3954	212	20	3	\N	\N	\N	\N
3955	212	21	1	\N	\N	\N	\N
3956	212	22	2	\N	\N	\N	\N
3957	212	23	4	\N	\N	\N	\N
3958	212	24	4	\N	\N	\N	\N
3959	212	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
3960	212	26	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
3961	212	27	4	\N	\N	\N	\N
3962	212	28	3	\N	\N	\N	\N
3963	212	29	1	\N	\N	\N	\N
3964	212	30	4	\N	\N	\N	\N
3965	212	31	3	\N	\N	\N	\N
3966	212	32	4	\N	\N	\N	\N
3967	212	33	3	\N	\N	\N	\N
3968	212	34	4	\N	\N	\N	\N
3969	212	35	4	\N	\N	\N	\N
3970	212	36	3	\N	\N	\N	\N
3971	212	37	2	\N	\N	\N	\N
3972	212	38	2	\N	\N	\N	\N
3973	213	18	4	\N	\N	\N	\N
3974	213	19	3	\N	\N	\N	\N
3975	213	20	4	\N	\N	\N	\N
3976	213	21	3	\N	\N	\N	\N
3977	213	22	4	\N	\N	\N	\N
3978	213	23	2	\N	\N	\N	\N
3979	213	24	4	\N	\N	\N	\N
3980	213	25	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
3981	213	26	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
3982	213	27	1	\N	\N	\N	\N
3983	213	28	3	\N	\N	\N	\N
3984	213	29	4	\N	\N	\N	\N
3985	213	30	3	\N	\N	\N	\N
3986	213	31	4	\N	\N	\N	\N
3987	213	32	4	\N	\N	\N	\N
3988	213	33	3	\N	\N	\N	\N
3989	213	34	4	\N	\N	\N	\N
3990	213	35	1	\N	\N	\N	\N
3991	213	36	3	\N	\N	\N	\N
3992	213	37	4	\N	\N	\N	\N
3993	213	38	3	\N	\N	\N	\N
3994	214	18	4	\N	\N	\N	\N
3995	214	19	3	\N	\N	\N	\N
3996	214	20	4	\N	\N	\N	\N
3997	214	21	4	\N	\N	\N	\N
3998	214	22	2	\N	\N	\N	\N
3999	214	23	3	\N	\N	\N	\N
4000	214	24	4	\N	\N	\N	\N
4001	214	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
4002	214	26	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
4003	214	27	4	\N	\N	\N	\N
4004	214	28	3	\N	\N	\N	\N
4005	214	29	4	\N	\N	\N	\N
4006	214	30	3	\N	\N	\N	\N
4007	214	31	2	\N	\N	\N	\N
4008	214	32	1	\N	\N	\N	\N
4009	214	33	3	\N	\N	\N	\N
4010	214	34	3	\N	\N	\N	\N
4011	214	35	3	\N	\N	\N	\N
4012	214	36	2	\N	\N	\N	\N
4013	214	37	2	\N	\N	\N	\N
4014	214	38	3	\N	\N	\N	\N
4015	215	18	3	\N	\N	\N	\N
4016	215	19	1	\N	\N	\N	\N
4017	215	20	3	\N	\N	\N	\N
4018	215	21	2	\N	\N	\N	\N
4019	215	22	3	\N	\N	\N	\N
4020	215	23	3	\N	\N	\N	\N
4021	215	24	3	\N	\N	\N	\N
4022	215	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
4023	215	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
4024	215	27	4	\N	\N	\N	\N
4025	215	28	4	\N	\N	\N	\N
4026	215	29	3	\N	\N	\N	\N
4027	215	30	2	\N	\N	\N	\N
4028	215	31	3	\N	\N	\N	\N
4029	215	32	2	\N	\N	\N	\N
4030	215	33	3	\N	\N	\N	\N
4031	215	34	3	\N	\N	\N	\N
4032	215	35	2	\N	\N	\N	\N
4033	215	36	3	\N	\N	\N	\N
4034	215	37	3	\N	\N	\N	\N
4035	215	38	3	\N	\N	\N	\N
4036	216	18	3	\N	\N	\N	\N
4037	216	19	3	\N	\N	\N	\N
4038	216	20	3	\N	\N	\N	\N
4039	216	21	3	\N	\N	\N	\N
4040	216	22	2	\N	\N	\N	\N
4041	216	23	2	\N	\N	\N	\N
4042	216	24	3	\N	\N	\N	\N
4162	222	18	3	\N	\N	\N	\N
4163	222	19	3	\N	\N	\N	\N
4043	216	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
4044	216	26	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
4045	216	27	4	\N	\N	\N	\N
4046	216	28	3	\N	\N	\N	\N
4047	216	29	3	\N	\N	\N	\N
4048	216	30	4	\N	\N	\N	\N
4049	216	31	4	\N	\N	\N	\N
4050	216	32	4	\N	\N	\N	\N
4051	216	33	2	\N	\N	\N	\N
4052	216	34	3	\N	\N	\N	\N
4053	216	35	4	\N	\N	\N	\N
4054	216	36	2	\N	\N	\N	\N
4055	216	37	3	\N	\N	\N	\N
4056	216	38	4	\N	\N	\N	\N
4057	217	18	3	\N	\N	\N	\N
4058	217	19	4	\N	\N	\N	\N
4059	217	20	3	\N	\N	\N	\N
4060	217	21	3	\N	\N	\N	\N
4061	217	22	3	\N	\N	\N	\N
4062	217	23	3	\N	\N	\N	\N
4063	217	24	4	\N	\N	\N	\N
4064	217	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
4065	217	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
4066	217	27	3	\N	\N	\N	\N
4067	217	28	3	\N	\N	\N	\N
4068	217	29	4	\N	\N	\N	\N
4069	217	30	3	\N	\N	\N	\N
4070	217	31	4	\N	\N	\N	\N
4071	217	32	3	\N	\N	\N	\N
4072	217	33	4	\N	\N	\N	\N
4073	217	34	3	\N	\N	\N	\N
4074	217	35	3	\N	\N	\N	\N
4075	217	36	4	\N	\N	\N	\N
4076	217	37	4	\N	\N	\N	\N
4077	217	38	4	\N	\N	\N	\N
4078	218	18	3	\N	\N	\N	\N
4079	218	19	3	\N	\N	\N	\N
4080	218	20	3	\N	\N	\N	\N
4081	218	21	4	\N	\N	\N	\N
4082	218	22	4	\N	\N	\N	\N
4083	218	23	4	\N	\N	\N	\N
4084	218	24	2	\N	\N	\N	\N
4085	218	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
4086	218	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
4087	218	27	3	\N	\N	\N	\N
4088	218	28	4	\N	\N	\N	\N
4089	218	29	4	\N	\N	\N	\N
4090	218	30	3	\N	\N	\N	\N
4091	218	31	4	\N	\N	\N	\N
4092	218	32	3	\N	\N	\N	\N
4093	218	33	4	\N	\N	\N	\N
4094	218	34	3	\N	\N	\N	\N
4095	218	35	3	\N	\N	\N	\N
4096	218	36	2	\N	\N	\N	\N
4097	218	37	4	\N	\N	\N	\N
4098	218	38	4	\N	\N	\N	\N
4099	219	18	4	\N	\N	\N	\N
4100	219	19	1	\N	\N	\N	\N
4101	219	20	4	\N	\N	\N	\N
4102	219	21	4	\N	\N	\N	\N
4103	219	22	3	\N	\N	\N	\N
4104	219	23	4	\N	\N	\N	\N
4105	219	24	4	\N	\N	\N	\N
4106	219	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
4107	219	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
4108	219	27	3	\N	\N	\N	\N
4109	219	28	3	\N	\N	\N	\N
4110	219	29	3	\N	\N	\N	\N
4111	219	30	3	\N	\N	\N	\N
4112	219	31	3	\N	\N	\N	\N
4113	219	32	3	\N	\N	\N	\N
4114	219	33	4	\N	\N	\N	\N
4115	219	34	3	\N	\N	\N	\N
4116	219	35	3	\N	\N	\N	\N
4117	219	36	3	\N	\N	\N	\N
4118	219	37	1	\N	\N	\N	\N
4119	219	38	2	\N	\N	\N	\N
4120	220	18	4	\N	\N	\N	\N
4121	220	19	2	\N	\N	\N	\N
4122	220	20	4	\N	\N	\N	\N
4123	220	21	2	\N	\N	\N	\N
4124	220	22	3	\N	\N	\N	\N
4125	220	23	3	\N	\N	\N	\N
4126	220	24	2	\N	\N	\N	\N
4127	220	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
4128	220	26	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
4129	220	27	3	\N	\N	\N	\N
4130	220	28	3	\N	\N	\N	\N
4131	220	29	4	\N	\N	\N	\N
4132	220	30	2	\N	\N	\N	\N
4133	220	31	4	\N	\N	\N	\N
4134	220	32	4	\N	\N	\N	\N
4135	220	33	4	\N	\N	\N	\N
4136	220	34	2	\N	\N	\N	\N
4137	220	35	4	\N	\N	\N	\N
4138	220	36	3	\N	\N	\N	\N
4139	220	37	2	\N	\N	\N	\N
4140	220	38	2	\N	\N	\N	\N
4141	221	18	4	\N	\N	\N	\N
4142	221	19	3	\N	\N	\N	\N
4143	221	20	3	\N	\N	\N	\N
4144	221	21	2	\N	\N	\N	\N
4145	221	22	4	\N	\N	\N	\N
4146	221	23	3	\N	\N	\N	\N
4147	221	24	1	\N	\N	\N	\N
4148	221	25	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
4149	221	26	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
4150	221	27	3	\N	\N	\N	\N
4151	221	28	4	\N	\N	\N	\N
4152	221	29	2	\N	\N	\N	\N
4153	221	30	4	\N	\N	\N	\N
4154	221	31	4	\N	\N	\N	\N
4155	221	32	2	\N	\N	\N	\N
4156	221	33	2	\N	\N	\N	\N
4157	221	34	4	\N	\N	\N	\N
4158	221	35	2	\N	\N	\N	\N
4159	221	36	3	\N	\N	\N	\N
4160	221	37	3	\N	\N	\N	\N
4161	221	38	3	\N	\N	\N	\N
4164	222	20	3	\N	\N	\N	\N
4165	222	21	3	\N	\N	\N	\N
4166	222	22	3	\N	\N	\N	\N
4167	222	23	3	\N	\N	\N	\N
4168	222	24	4	\N	\N	\N	\N
4169	222	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
4170	222	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
4171	222	27	2	\N	\N	\N	\N
4172	222	28	2	\N	\N	\N	\N
4173	222	29	2	\N	\N	\N	\N
4174	222	30	3	\N	\N	\N	\N
4175	222	31	2	\N	\N	\N	\N
4176	222	32	4	\N	\N	\N	\N
4177	222	33	3	\N	\N	\N	\N
4178	222	34	3	\N	\N	\N	\N
4179	222	35	2	\N	\N	\N	\N
4180	222	36	3	\N	\N	\N	\N
4181	222	37	2	\N	\N	\N	\N
4182	222	38	3	\N	\N	\N	\N
4183	223	18	4	\N	\N	\N	\N
4184	223	19	4	\N	\N	\N	\N
4185	223	20	3	\N	\N	\N	\N
4186	223	21	3	\N	\N	\N	\N
4187	223	22	2	\N	\N	\N	\N
4188	223	23	3	\N	\N	\N	\N
4189	223	24	3	\N	\N	\N	\N
4190	223	25	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
4191	223	26	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
4192	223	27	2	\N	\N	\N	\N
4193	223	28	4	\N	\N	\N	\N
4194	223	29	4	\N	\N	\N	\N
4195	223	30	3	\N	\N	\N	\N
4196	223	31	3	\N	\N	\N	\N
4197	223	32	4	\N	\N	\N	\N
4198	223	33	3	\N	\N	\N	\N
4199	223	34	4	\N	\N	\N	\N
4200	223	35	3	\N	\N	\N	\N
4201	223	36	2	\N	\N	\N	\N
4202	223	37	1	\N	\N	\N	\N
4203	223	38	4	\N	\N	\N	\N
4204	224	18	3	\N	\N	\N	\N
4205	224	19	3	\N	\N	\N	\N
4206	224	20	2	\N	\N	\N	\N
4207	224	21	3	\N	\N	\N	\N
4208	224	22	4	\N	\N	\N	\N
4209	224	23	4	\N	\N	\N	\N
4210	224	24	3	\N	\N	\N	\N
4211	224	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
4212	224	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
4213	224	27	4	\N	\N	\N	\N
4214	224	28	3	\N	\N	\N	\N
4215	224	29	4	\N	\N	\N	\N
4216	224	30	1	\N	\N	\N	\N
4217	224	31	4	\N	\N	\N	\N
4218	224	32	3	\N	\N	\N	\N
4219	224	33	4	\N	\N	\N	\N
4220	224	34	2	\N	\N	\N	\N
4221	224	35	4	\N	\N	\N	\N
4222	224	36	4	\N	\N	\N	\N
4223	224	37	3	\N	\N	\N	\N
4224	224	38	4	\N	\N	\N	\N
4225	225	18	3	\N	\N	\N	\N
4226	225	19	4	\N	\N	\N	\N
4227	225	20	3	\N	\N	\N	\N
4228	225	21	4	\N	\N	\N	\N
4229	225	22	4	\N	\N	\N	\N
4230	225	23	3	\N	\N	\N	\N
4231	225	24	4	\N	\N	\N	\N
4232	225	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
4233	225	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
4234	225	27	3	\N	\N	\N	\N
4235	225	28	2	\N	\N	\N	\N
4236	225	29	2	\N	\N	\N	\N
4237	225	30	2	\N	\N	\N	\N
4238	225	31	2	\N	\N	\N	\N
4239	225	32	1	\N	\N	\N	\N
4240	225	33	3	\N	\N	\N	\N
4241	225	34	3	\N	\N	\N	\N
4242	225	35	3	\N	\N	\N	\N
4243	225	36	3	\N	\N	\N	\N
4244	225	37	4	\N	\N	\N	\N
4245	225	38	3	\N	\N	\N	\N
4246	226	18	4	\N	\N	\N	\N
4247	226	19	4	\N	\N	\N	\N
4248	226	20	4	\N	\N	\N	\N
4249	226	21	2	\N	\N	\N	\N
4250	226	22	4	\N	\N	\N	\N
4251	226	23	4	\N	\N	\N	\N
4252	226	24	4	\N	\N	\N	\N
4253	226	25	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
4254	226	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
4255	226	27	3	\N	\N	\N	\N
4256	226	28	4	\N	\N	\N	\N
4257	226	29	4	\N	\N	\N	\N
4258	226	30	4	\N	\N	\N	\N
4259	226	31	4	\N	\N	\N	\N
4260	226	32	3	\N	\N	\N	\N
4261	226	33	3	\N	\N	\N	\N
4262	226	34	3	\N	\N	\N	\N
4263	226	35	3	\N	\N	\N	\N
4264	226	36	3	\N	\N	\N	\N
4265	226	37	3	\N	\N	\N	\N
4266	226	38	4	\N	\N	\N	\N
4267	227	18	4	\N	\N	\N	\N
4268	227	19	3	\N	\N	\N	\N
4269	227	20	4	\N	\N	\N	\N
4270	227	21	3	\N	\N	\N	\N
4271	227	22	4	\N	\N	\N	\N
4272	227	23	3	\N	\N	\N	\N
4273	227	24	1	\N	\N	\N	\N
4274	227	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
4275	227	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
4276	227	27	4	\N	\N	\N	\N
4277	227	28	4	\N	\N	\N	\N
4278	227	29	4	\N	\N	\N	\N
4279	227	30	4	\N	\N	\N	\N
4280	227	31	3	\N	\N	\N	\N
4281	227	32	4	\N	\N	\N	\N
4282	227	33	4	\N	\N	\N	\N
4283	227	34	4	\N	\N	\N	\N
4284	227	35	3	\N	\N	\N	\N
4285	227	36	3	\N	\N	\N	\N
4286	227	37	4	\N	\N	\N	\N
4287	227	38	3	\N	\N	\N	\N
4288	228	18	4	\N	\N	\N	\N
4289	228	19	4	\N	\N	\N	\N
4290	228	20	4	\N	\N	\N	\N
4291	228	21	2	\N	\N	\N	\N
4292	228	22	4	\N	\N	\N	\N
4293	228	23	4	\N	\N	\N	\N
4294	228	24	1	\N	\N	\N	\N
4295	228	25	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
4296	228	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
4297	228	27	4	\N	\N	\N	\N
4298	228	28	3	\N	\N	\N	\N
4299	228	29	4	\N	\N	\N	\N
4300	228	30	4	\N	\N	\N	\N
4301	228	31	4	\N	\N	\N	\N
4302	228	32	3	\N	\N	\N	\N
4303	228	33	4	\N	\N	\N	\N
4304	228	34	4	\N	\N	\N	\N
4305	228	35	2	\N	\N	\N	\N
4306	228	36	3	\N	\N	\N	\N
4307	228	37	2	\N	\N	\N	\N
4308	228	38	4	\N	\N	\N	\N
4309	229	18	2	\N	\N	\N	\N
4310	229	19	4	\N	\N	\N	\N
4311	229	20	4	\N	\N	\N	\N
4312	229	21	4	\N	\N	\N	\N
4313	229	22	3	\N	\N	\N	\N
4314	229	23	2	\N	\N	\N	\N
4315	229	24	2	\N	\N	\N	\N
4316	229	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
4317	229	26	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
4318	229	27	4	\N	\N	\N	\N
4319	229	28	3	\N	\N	\N	\N
4320	229	29	1	\N	\N	\N	\N
4321	229	30	3	\N	\N	\N	\N
4322	229	31	3	\N	\N	\N	\N
4323	229	32	4	\N	\N	\N	\N
4324	229	33	4	\N	\N	\N	\N
4325	229	34	4	\N	\N	\N	\N
4326	229	35	3	\N	\N	\N	\N
4327	229	36	2	\N	\N	\N	\N
4328	229	37	4	\N	\N	\N	\N
4329	229	38	3	\N	\N	\N	\N
4330	230	18	3	\N	\N	\N	\N
4331	230	19	3	\N	\N	\N	\N
4332	230	20	4	\N	\N	\N	\N
4333	230	21	4	\N	\N	\N	\N
4334	230	22	4	\N	\N	\N	\N
4335	230	23	4	\N	\N	\N	\N
4336	230	24	2	\N	\N	\N	\N
4337	230	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
4338	230	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
4339	230	27	3	\N	\N	\N	\N
4340	230	28	3	\N	\N	\N	\N
4341	230	29	4	\N	\N	\N	\N
4342	230	30	4	\N	\N	\N	\N
4343	230	31	4	\N	\N	\N	\N
4344	230	32	3	\N	\N	\N	\N
4345	230	33	3	\N	\N	\N	\N
4346	230	34	4	\N	\N	\N	\N
4347	230	35	3	\N	\N	\N	\N
4348	230	36	3	\N	\N	\N	\N
4349	230	37	4	\N	\N	\N	\N
4350	230	38	3	\N	\N	\N	\N
4351	231	18	4	\N	\N	\N	\N
4352	231	19	3	\N	\N	\N	\N
4353	231	20	4	\N	\N	\N	\N
4354	231	21	3	\N	\N	\N	\N
4355	231	22	4	\N	\N	\N	\N
4356	231	23	4	\N	\N	\N	\N
4357	231	24	3	\N	\N	\N	\N
4358	231	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
4359	231	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
4360	231	27	3	\N	\N	\N	\N
4361	231	28	4	\N	\N	\N	\N
4362	231	29	3	\N	\N	\N	\N
4363	231	30	3	\N	\N	\N	\N
4364	231	31	4	\N	\N	\N	\N
4365	231	32	4	\N	\N	\N	\N
4366	231	33	4	\N	\N	\N	\N
4367	231	34	3	\N	\N	\N	\N
4368	231	35	3	\N	\N	\N	\N
4369	231	36	3	\N	\N	\N	\N
4370	231	37	4	\N	\N	\N	\N
4371	231	38	2	\N	\N	\N	\N
4372	232	18	1	\N	\N	\N	\N
4373	232	19	3	\N	\N	\N	\N
4374	232	20	3	\N	\N	\N	\N
4375	232	21	3	\N	\N	\N	\N
4376	232	22	4	\N	\N	\N	\N
4377	232	23	3	\N	\N	\N	\N
4378	232	24	4	\N	\N	\N	\N
4379	232	25	\N	Tiene muy buena relación con los estudiantes y mucha disposición.	POSITIVO	0.9882	MODELO
4380	232	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
4381	232	27	1	\N	\N	\N	\N
4382	232	28	2	\N	\N	\N	\N
4383	232	29	3	\N	\N	\N	\N
4384	232	30	2	\N	\N	\N	\N
4385	232	31	2	\N	\N	\N	\N
4386	232	32	4	\N	\N	\N	\N
4387	232	33	4	\N	\N	\N	\N
4388	232	34	4	\N	\N	\N	\N
4389	232	35	4	\N	\N	\N	\N
4390	232	36	3	\N	\N	\N	\N
4391	232	37	4	\N	\N	\N	\N
4392	232	38	2	\N	\N	\N	\N
4393	233	18	4	\N	\N	\N	\N
4394	233	19	3	\N	\N	\N	\N
4395	233	20	3	\N	\N	\N	\N
4396	233	21	4	\N	\N	\N	\N
4397	233	22	3	\N	\N	\N	\N
4398	233	23	4	\N	\N	\N	\N
4399	233	24	4	\N	\N	\N	\N
4400	233	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
4401	233	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
4402	233	27	4	\N	\N	\N	\N
4403	233	28	4	\N	\N	\N	\N
4404	233	29	2	\N	\N	\N	\N
4405	233	30	2	\N	\N	\N	\N
4406	233	31	3	\N	\N	\N	\N
4407	233	32	4	\N	\N	\N	\N
4408	233	33	4	\N	\N	\N	\N
4409	233	34	3	\N	\N	\N	\N
4410	233	35	4	\N	\N	\N	\N
4411	233	36	4	\N	\N	\N	\N
4412	233	37	3	\N	\N	\N	\N
4413	233	38	4	\N	\N	\N	\N
4414	234	18	3	\N	\N	\N	\N
4415	234	19	4	\N	\N	\N	\N
4416	234	20	4	\N	\N	\N	\N
4417	234	21	4	\N	\N	\N	\N
4418	234	22	4	\N	\N	\N	\N
4419	234	23	3	\N	\N	\N	\N
4420	234	24	3	\N	\N	\N	\N
4421	234	25	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
4422	234	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
4423	234	27	4	\N	\N	\N	\N
4424	234	28	2	\N	\N	\N	\N
4425	234	29	4	\N	\N	\N	\N
4426	234	30	3	\N	\N	\N	\N
4427	234	31	2	\N	\N	\N	\N
4428	234	32	4	\N	\N	\N	\N
4429	234	33	4	\N	\N	\N	\N
4430	234	34	2	\N	\N	\N	\N
4431	234	35	4	\N	\N	\N	\N
4432	234	36	3	\N	\N	\N	\N
4433	234	37	4	\N	\N	\N	\N
4434	234	38	4	\N	\N	\N	\N
4435	235	18	3	\N	\N	\N	\N
4436	235	19	3	\N	\N	\N	\N
4437	235	20	4	\N	\N	\N	\N
4438	235	21	4	\N	\N	\N	\N
4439	235	22	3	\N	\N	\N	\N
4440	235	23	4	\N	\N	\N	\N
4441	235	24	2	\N	\N	\N	\N
4442	235	25	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
4443	235	26	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
4444	235	27	3	\N	\N	\N	\N
4445	235	28	3	\N	\N	\N	\N
4446	235	29	4	\N	\N	\N	\N
4447	235	30	4	\N	\N	\N	\N
4448	235	31	4	\N	\N	\N	\N
4449	235	32	4	\N	\N	\N	\N
4450	235	33	4	\N	\N	\N	\N
4451	235	34	3	\N	\N	\N	\N
4452	235	35	3	\N	\N	\N	\N
4453	235	36	3	\N	\N	\N	\N
4454	235	37	4	\N	\N	\N	\N
4455	235	38	3	\N	\N	\N	\N
4456	236	18	3	\N	\N	\N	\N
4457	236	19	4	\N	\N	\N	\N
4458	236	20	4	\N	\N	\N	\N
4459	236	21	3	\N	\N	\N	\N
4460	236	22	4	\N	\N	\N	\N
4461	236	23	4	\N	\N	\N	\N
4462	236	24	4	\N	\N	\N	\N
4463	236	25	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
4464	236	26	\N	Nada que mejorar realmente, el docente maneja muy bien el curso.	POSITIVO	0.9023	MODELO
4465	236	27	3	\N	\N	\N	\N
4466	236	28	4	\N	\N	\N	\N
4467	236	29	1	\N	\N	\N	\N
4468	236	30	3	\N	\N	\N	\N
4469	236	31	4	\N	\N	\N	\N
4470	236	32	3	\N	\N	\N	\N
4471	236	33	4	\N	\N	\N	\N
4472	236	34	4	\N	\N	\N	\N
4473	236	35	4	\N	\N	\N	\N
4474	236	36	4	\N	\N	\N	\N
4475	236	37	4	\N	\N	\N	\N
4476	236	38	3	\N	\N	\N	\N
4477	237	18	4	\N	\N	\N	\N
4478	237	19	3	\N	\N	\N	\N
4479	237	20	1	\N	\N	\N	\N
4480	237	21	3	\N	\N	\N	\N
4481	237	22	3	\N	\N	\N	\N
4482	237	23	3	\N	\N	\N	\N
4483	237	24	4	\N	\N	\N	\N
4484	237	25	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
4485	237	26	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
4486	237	27	3	\N	\N	\N	\N
4487	237	28	4	\N	\N	\N	\N
4488	237	29	3	\N	\N	\N	\N
4489	237	30	3	\N	\N	\N	\N
4490	237	31	4	\N	\N	\N	\N
4491	237	32	3	\N	\N	\N	\N
4492	237	33	4	\N	\N	\N	\N
4493	237	34	4	\N	\N	\N	\N
4494	237	35	3	\N	\N	\N	\N
4495	237	36	3	\N	\N	\N	\N
4496	237	37	2	\N	\N	\N	\N
4497	237	38	3	\N	\N	\N	\N
4498	238	18	3	\N	\N	\N	\N
4499	238	19	4	\N	\N	\N	\N
4500	238	20	4	\N	\N	\N	\N
4501	238	21	4	\N	\N	\N	\N
4502	238	22	4	\N	\N	\N	\N
4503	238	23	4	\N	\N	\N	\N
4504	238	24	4	\N	\N	\N	\N
4505	238	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
4506	238	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
4507	238	27	4	\N	\N	\N	\N
4508	238	28	3	\N	\N	\N	\N
4509	238	29	3	\N	\N	\N	\N
4510	238	30	4	\N	\N	\N	\N
4511	238	31	4	\N	\N	\N	\N
4512	238	32	3	\N	\N	\N	\N
4513	238	33	4	\N	\N	\N	\N
4514	238	34	3	\N	\N	\N	\N
4515	238	35	4	\N	\N	\N	\N
4516	238	36	3	\N	\N	\N	\N
4517	238	37	4	\N	\N	\N	\N
4518	238	38	3	\N	\N	\N	\N
4519	239	18	3	\N	\N	\N	\N
4520	239	19	3	\N	\N	\N	\N
4521	239	20	3	\N	\N	\N	\N
4522	239	21	3	\N	\N	\N	\N
4523	239	22	3	\N	\N	\N	\N
4524	239	23	3	\N	\N	\N	\N
4525	239	24	4	\N	\N	\N	\N
4526	239	25	\N	Tiene muy buena relación con los estudiantes y mucha disposición.	POSITIVO	0.9882	MODELO
4527	239	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
4528	239	27	2	\N	\N	\N	\N
4529	239	28	4	\N	\N	\N	\N
4530	239	29	3	\N	\N	\N	\N
4531	239	30	4	\N	\N	\N	\N
4532	239	31	4	\N	\N	\N	\N
4533	239	32	3	\N	\N	\N	\N
4534	239	33	4	\N	\N	\N	\N
4535	239	34	3	\N	\N	\N	\N
4536	239	35	4	\N	\N	\N	\N
4537	239	36	4	\N	\N	\N	\N
4538	239	37	3	\N	\N	\N	\N
4539	239	38	2	\N	\N	\N	\N
4540	240	18	4	\N	\N	\N	\N
4541	240	19	3	\N	\N	\N	\N
4542	240	20	4	\N	\N	\N	\N
4543	240	21	4	\N	\N	\N	\N
4544	240	22	4	\N	\N	\N	\N
4545	240	23	4	\N	\N	\N	\N
4546	240	24	2	\N	\N	\N	\N
4547	240	25	\N	Es un docente excepcional: responde todas las dudas y motiva a investigar más.	POSITIVO	0.7308	MODELO
4548	240	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
4549	240	27	4	\N	\N	\N	\N
4550	240	28	4	\N	\N	\N	\N
4551	240	29	3	\N	\N	\N	\N
4552	240	30	4	\N	\N	\N	\N
4553	240	31	3	\N	\N	\N	\N
4554	240	32	4	\N	\N	\N	\N
4555	240	33	4	\N	\N	\N	\N
4556	240	34	4	\N	\N	\N	\N
4557	240	35	3	\N	\N	\N	\N
4558	240	36	4	\N	\N	\N	\N
4559	240	37	2	\N	\N	\N	\N
4560	240	38	2	\N	\N	\N	\N
4561	241	18	3	\N	\N	\N	\N
4562	241	19	3	\N	\N	\N	\N
4563	241	20	4	\N	\N	\N	\N
4564	241	21	4	\N	\N	\N	\N
4565	241	22	3	\N	\N	\N	\N
4566	241	23	2	\N	\N	\N	\N
4567	241	24	4	\N	\N	\N	\N
4568	241	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
4569	241	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
4570	241	27	4	\N	\N	\N	\N
4571	241	28	3	\N	\N	\N	\N
4572	241	29	3	\N	\N	\N	\N
4573	241	30	3	\N	\N	\N	\N
4574	241	31	4	\N	\N	\N	\N
4575	241	32	3	\N	\N	\N	\N
4576	241	33	3	\N	\N	\N	\N
4577	241	34	3	\N	\N	\N	\N
4578	241	35	4	\N	\N	\N	\N
4579	241	36	4	\N	\N	\N	\N
4580	241	37	4	\N	\N	\N	\N
4581	241	38	4	\N	\N	\N	\N
4582	242	18	4	\N	\N	\N	\N
4583	242	19	2	\N	\N	\N	\N
4584	242	20	3	\N	\N	\N	\N
4585	242	21	3	\N	\N	\N	\N
4586	242	22	4	\N	\N	\N	\N
4587	242	23	4	\N	\N	\N	\N
4588	242	24	3	\N	\N	\N	\N
4589	242	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
4590	242	26	\N	Podría subir las notas un poco más rápido, es lo único que se me ocurre.	NEGATIVO	0.4145	MODELO
4591	242	27	4	\N	\N	\N	\N
4592	242	28	3	\N	\N	\N	\N
4593	242	29	4	\N	\N	\N	\N
4594	242	30	4	\N	\N	\N	\N
4595	242	31	4	\N	\N	\N	\N
4596	242	32	4	\N	\N	\N	\N
4597	242	33	3	\N	\N	\N	\N
4598	242	34	3	\N	\N	\N	\N
4599	242	35	3	\N	\N	\N	\N
4600	242	36	3	\N	\N	\N	\N
4601	242	37	4	\N	\N	\N	\N
4602	242	38	4	\N	\N	\N	\N
4603	243	18	4	\N	\N	\N	\N
4604	243	19	4	\N	\N	\N	\N
4605	243	20	4	\N	\N	\N	\N
4606	243	21	4	\N	\N	\N	\N
4607	243	22	4	\N	\N	\N	\N
4608	243	23	3	\N	\N	\N	\N
4609	243	24	4	\N	\N	\N	\N
4610	243	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
4611	243	26	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
4612	243	27	4	\N	\N	\N	\N
4613	243	28	4	\N	\N	\N	\N
4614	243	29	3	\N	\N	\N	\N
4615	243	30	4	\N	\N	\N	\N
4616	243	31	4	\N	\N	\N	\N
4617	243	32	3	\N	\N	\N	\N
4618	243	33	3	\N	\N	\N	\N
4619	243	34	3	\N	\N	\N	\N
4620	243	35	4	\N	\N	\N	\N
4621	243	36	3	\N	\N	\N	\N
4622	243	37	4	\N	\N	\N	\N
4623	243	38	4	\N	\N	\N	\N
4624	244	18	4	\N	\N	\N	\N
4625	244	19	3	\N	\N	\N	\N
4626	244	20	4	\N	\N	\N	\N
4627	244	21	4	\N	\N	\N	\N
4628	244	22	4	\N	\N	\N	\N
4629	244	23	4	\N	\N	\N	\N
4630	244	24	4	\N	\N	\N	\N
4631	244	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
4632	244	26	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
4633	244	27	4	\N	\N	\N	\N
4634	244	28	1	\N	\N	\N	\N
4635	244	29	4	\N	\N	\N	\N
4636	244	30	3	\N	\N	\N	\N
4637	244	31	4	\N	\N	\N	\N
4638	244	32	4	\N	\N	\N	\N
4639	244	33	3	\N	\N	\N	\N
4640	244	34	3	\N	\N	\N	\N
4641	244	35	4	\N	\N	\N	\N
4642	244	36	4	\N	\N	\N	\N
4643	244	37	2	\N	\N	\N	\N
4644	244	38	3	\N	\N	\N	\N
4645	245	18	3	\N	\N	\N	\N
4646	245	19	3	\N	\N	\N	\N
4647	245	20	4	\N	\N	\N	\N
4648	245	21	3	\N	\N	\N	\N
4649	245	22	2	\N	\N	\N	\N
4650	245	23	4	\N	\N	\N	\N
4651	245	24	4	\N	\N	\N	\N
4652	245	25	\N	Su forma de evaluar es justa y da retroalimentación detallada y rápida.	POSITIVO	0.5845	MODELO
4653	245	26	\N	Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.	POSITIVO	0.8795	MODELO
4654	245	27	4	\N	\N	\N	\N
4655	245	28	4	\N	\N	\N	\N
4656	245	29	3	\N	\N	\N	\N
4657	245	30	4	\N	\N	\N	\N
4658	245	31	4	\N	\N	\N	\N
4659	245	32	3	\N	\N	\N	\N
4660	245	33	4	\N	\N	\N	\N
4661	245	34	4	\N	\N	\N	\N
4662	245	35	4	\N	\N	\N	\N
4663	245	36	4	\N	\N	\N	\N
4664	245	37	3	\N	\N	\N	\N
4665	245	38	4	\N	\N	\N	\N
4666	246	18	3	\N	\N	\N	\N
4667	246	19	4	\N	\N	\N	\N
4668	246	20	3	\N	\N	\N	\N
4669	246	21	3	\N	\N	\N	\N
4670	246	22	1	\N	\N	\N	\N
4671	246	23	4	\N	\N	\N	\N
4672	246	24	4	\N	\N	\N	\N
4673	246	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
4674	246	26	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
4675	246	27	3	\N	\N	\N	\N
4676	246	28	4	\N	\N	\N	\N
4677	246	29	4	\N	\N	\N	\N
4678	246	30	4	\N	\N	\N	\N
4679	246	31	3	\N	\N	\N	\N
4680	246	32	4	\N	\N	\N	\N
4681	246	33	3	\N	\N	\N	\N
4682	246	34	2	\N	\N	\N	\N
4683	246	35	3	\N	\N	\N	\N
4684	246	36	3	\N	\N	\N	\N
4685	246	37	4	\N	\N	\N	\N
4686	246	38	4	\N	\N	\N	\N
4687	247	18	4	\N	\N	\N	\N
4688	247	19	4	\N	\N	\N	\N
4689	247	20	3	\N	\N	\N	\N
4690	247	21	1	\N	\N	\N	\N
4691	247	22	3	\N	\N	\N	\N
4692	247	23	4	\N	\N	\N	\N
4693	247	24	3	\N	\N	\N	\N
4694	247	25	\N	Domina completamente el tema y explica con ejemplos reales muy claros.	POSITIVO	0.5292	MODELO
4695	247	26	\N	Fue una experiencia normal, sin mayores comentarios.	NEUTRO	0.8753	MODELO
4696	247	27	4	\N	\N	\N	\N
4697	247	28	4	\N	\N	\N	\N
4698	247	29	4	\N	\N	\N	\N
4699	247	30	4	\N	\N	\N	\N
4700	247	31	3	\N	\N	\N	\N
4701	247	32	4	\N	\N	\N	\N
4702	247	33	3	\N	\N	\N	\N
4703	247	34	4	\N	\N	\N	\N
4704	247	35	4	\N	\N	\N	\N
4705	247	36	4	\N	\N	\N	\N
4706	247	37	4	\N	\N	\N	\N
4707	247	38	3	\N	\N	\N	\N
4708	248	18	4	\N	\N	\N	\N
4709	248	19	3	\N	\N	\N	\N
4710	248	20	3	\N	\N	\N	\N
4711	248	21	4	\N	\N	\N	\N
4712	248	22	2	\N	\N	\N	\N
4713	248	23	3	\N	\N	\N	\N
4714	248	24	3	\N	\N	\N	\N
4715	248	25	\N	Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.	POSITIVO	0.8571	MODELO
4716	248	26	\N	Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.	POSITIVO	0.8954	MODELO
4717	248	27	3	\N	\N	\N	\N
4718	248	28	4	\N	\N	\N	\N
4719	248	29	4	\N	\N	\N	\N
4720	248	30	4	\N	\N	\N	\N
4721	248	31	3	\N	\N	\N	\N
4722	248	32	4	\N	\N	\N	\N
4723	248	33	4	\N	\N	\N	\N
4724	248	34	3	\N	\N	\N	\N
4725	248	35	2	\N	\N	\N	\N
4726	248	36	3	\N	\N	\N	\N
4727	248	37	4	\N	\N	\N	\N
4728	248	38	3	\N	\N	\N	\N
4729	249	18	4	\N	\N	\N	\N
4730	249	19	3	\N	\N	\N	\N
4731	249	20	3	\N	\N	\N	\N
4732	249	21	2	\N	\N	\N	\N
4733	249	22	1	\N	\N	\N	\N
4734	249	23	2	\N	\N	\N	\N
4735	249	24	3	\N	\N	\N	\N
4736	249	25	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
4737	249	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
4738	249	27	1	\N	\N	\N	\N
4739	249	28	4	\N	\N	\N	\N
4740	249	29	3	\N	\N	\N	\N
4741	249	30	3	\N	\N	\N	\N
4742	249	31	1	\N	\N	\N	\N
4743	249	32	2	\N	\N	\N	\N
4744	249	33	3	\N	\N	\N	\N
4745	249	34	4	\N	\N	\N	\N
4746	249	35	3	\N	\N	\N	\N
4747	249	36	1	\N	\N	\N	\N
4748	249	37	3	\N	\N	\N	\N
4749	249	38	3	\N	\N	\N	\N
4750	250	18	2	\N	\N	\N	\N
4751	250	19	3	\N	\N	\N	\N
4752	250	20	2	\N	\N	\N	\N
4753	250	21	2	\N	\N	\N	\N
4754	250	22	2	\N	\N	\N	\N
4755	250	23	2	\N	\N	\N	\N
4756	250	24	1	\N	\N	\N	\N
4757	250	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
4758	250	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
4759	250	27	3	\N	\N	\N	\N
4760	250	28	2	\N	\N	\N	\N
4761	250	29	3	\N	\N	\N	\N
4762	250	30	1	\N	\N	\N	\N
4763	250	31	3	\N	\N	\N	\N
4764	250	32	4	\N	\N	\N	\N
4765	250	33	3	\N	\N	\N	\N
4766	250	34	3	\N	\N	\N	\N
4767	250	35	2	\N	\N	\N	\N
4768	250	36	1	\N	\N	\N	\N
4769	250	37	2	\N	\N	\N	\N
4770	250	38	3	\N	\N	\N	\N
4771	251	18	3	\N	\N	\N	\N
4772	251	19	4	\N	\N	\N	\N
4773	251	20	3	\N	\N	\N	\N
4774	251	21	2	\N	\N	\N	\N
4775	251	22	2	\N	\N	\N	\N
4776	251	23	2	\N	\N	\N	\N
4777	251	24	4	\N	\N	\N	\N
4778	251	25	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
4779	251	26	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
4780	251	27	3	\N	\N	\N	\N
4781	251	28	3	\N	\N	\N	\N
4782	251	29	2	\N	\N	\N	\N
4783	251	30	3	\N	\N	\N	\N
4784	251	31	2	\N	\N	\N	\N
4785	251	32	4	\N	\N	\N	\N
4786	251	33	4	\N	\N	\N	\N
4787	251	34	4	\N	\N	\N	\N
4788	251	35	2	\N	\N	\N	\N
4789	251	36	3	\N	\N	\N	\N
4790	251	37	4	\N	\N	\N	\N
4791	251	38	3	\N	\N	\N	\N
4792	252	18	3	\N	\N	\N	\N
4793	252	19	4	\N	\N	\N	\N
4794	252	20	2	\N	\N	\N	\N
4795	252	21	4	\N	\N	\N	\N
4796	252	22	4	\N	\N	\N	\N
4797	252	23	1	\N	\N	\N	\N
4798	252	24	2	\N	\N	\N	\N
4799	252	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
4800	252	26	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
4801	252	27	3	\N	\N	\N	\N
4802	252	28	4	\N	\N	\N	\N
4803	252	29	3	\N	\N	\N	\N
4804	252	30	3	\N	\N	\N	\N
4805	252	31	3	\N	\N	\N	\N
4806	252	32	3	\N	\N	\N	\N
4807	252	33	3	\N	\N	\N	\N
4808	252	34	2	\N	\N	\N	\N
4809	252	35	3	\N	\N	\N	\N
4810	252	36	3	\N	\N	\N	\N
4811	252	37	4	\N	\N	\N	\N
4812	252	38	4	\N	\N	\N	\N
4813	253	18	1	\N	\N	\N	\N
4814	253	19	2	\N	\N	\N	\N
4815	253	20	3	\N	\N	\N	\N
4816	253	21	2	\N	\N	\N	\N
4817	253	22	3	\N	\N	\N	\N
4818	253	23	2	\N	\N	\N	\N
4819	253	24	3	\N	\N	\N	\N
4820	253	25	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
4821	253	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
4822	253	27	2	\N	\N	\N	\N
4823	253	28	3	\N	\N	\N	\N
4824	253	29	3	\N	\N	\N	\N
4825	253	30	1	\N	\N	\N	\N
4826	253	31	4	\N	\N	\N	\N
4827	253	32	2	\N	\N	\N	\N
4828	253	33	2	\N	\N	\N	\N
4829	253	34	3	\N	\N	\N	\N
4830	253	35	4	\N	\N	\N	\N
4831	253	36	4	\N	\N	\N	\N
4832	253	37	1	\N	\N	\N	\N
4833	253	38	4	\N	\N	\N	\N
4834	254	18	2	\N	\N	\N	\N
4835	254	19	3	\N	\N	\N	\N
4836	254	20	3	\N	\N	\N	\N
4837	254	21	1	\N	\N	\N	\N
4838	254	22	4	\N	\N	\N	\N
4839	254	23	2	\N	\N	\N	\N
4840	254	24	4	\N	\N	\N	\N
4841	254	25	\N	Tiene buena disposición cuando se le pregunta directamente.	POSITIVO	0.963	MODELO
4842	254	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
4843	254	27	3	\N	\N	\N	\N
4844	254	28	1	\N	\N	\N	\N
4845	254	29	3	\N	\N	\N	\N
4846	254	30	4	\N	\N	\N	\N
4847	254	31	3	\N	\N	\N	\N
4848	254	32	3	\N	\N	\N	\N
4849	254	33	3	\N	\N	\N	\N
4850	254	34	2	\N	\N	\N	\N
4851	254	35	1	\N	\N	\N	\N
4852	254	36	3	\N	\N	\N	\N
4853	254	37	1	\N	\N	\N	\N
4854	254	38	3	\N	\N	\N	\N
4855	255	18	3	\N	\N	\N	\N
4856	255	19	3	\N	\N	\N	\N
4857	255	20	3	\N	\N	\N	\N
4858	255	21	2	\N	\N	\N	\N
4859	255	22	4	\N	\N	\N	\N
4860	255	23	2	\N	\N	\N	\N
4861	255	24	1	\N	\N	\N	\N
4862	255	25	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
4863	255	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
4864	255	27	2	\N	\N	\N	\N
4865	255	28	4	\N	\N	\N	\N
4866	255	29	3	\N	\N	\N	\N
4867	255	30	3	\N	\N	\N	\N
4868	255	31	2	\N	\N	\N	\N
4869	255	32	1	\N	\N	\N	\N
4870	255	33	2	\N	\N	\N	\N
4871	255	34	3	\N	\N	\N	\N
4872	255	35	2	\N	\N	\N	\N
4873	255	36	4	\N	\N	\N	\N
4874	255	37	3	\N	\N	\N	\N
4875	255	38	2	\N	\N	\N	\N
4876	256	18	4	\N	\N	\N	\N
4877	256	19	3	\N	\N	\N	\N
4878	256	20	3	\N	\N	\N	\N
4879	256	21	2	\N	\N	\N	\N
4880	256	22	2	\N	\N	\N	\N
4881	256	23	2	\N	\N	\N	\N
4882	256	24	3	\N	\N	\N	\N
4883	256	25	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
4884	256	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
4885	256	27	2	\N	\N	\N	\N
4886	256	28	3	\N	\N	\N	\N
4887	256	29	1	\N	\N	\N	\N
4888	256	30	3	\N	\N	\N	\N
4889	256	31	3	\N	\N	\N	\N
4890	256	32	1	\N	\N	\N	\N
4891	256	33	4	\N	\N	\N	\N
4892	256	34	3	\N	\N	\N	\N
4893	256	35	3	\N	\N	\N	\N
4894	256	36	1	\N	\N	\N	\N
4895	256	37	2	\N	\N	\N	\N
4896	256	38	4	\N	\N	\N	\N
4897	257	18	4	\N	\N	\N	\N
4898	257	19	3	\N	\N	\N	\N
4899	257	20	3	\N	\N	\N	\N
4900	257	21	2	\N	\N	\N	\N
4901	257	22	2	\N	\N	\N	\N
4902	257	23	2	\N	\N	\N	\N
4903	257	24	3	\N	\N	\N	\N
4904	257	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
4905	257	26	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
4906	257	27	1	\N	\N	\N	\N
4907	257	28	4	\N	\N	\N	\N
4908	257	29	4	\N	\N	\N	\N
4909	257	30	4	\N	\N	\N	\N
4910	257	31	3	\N	\N	\N	\N
4911	257	32	3	\N	\N	\N	\N
4912	257	33	2	\N	\N	\N	\N
4913	257	34	3	\N	\N	\N	\N
4914	257	35	3	\N	\N	\N	\N
4915	257	36	2	\N	\N	\N	\N
4916	257	37	2	\N	\N	\N	\N
4917	257	38	2	\N	\N	\N	\N
4918	258	18	3	\N	\N	\N	\N
4919	258	19	4	\N	\N	\N	\N
4920	258	20	3	\N	\N	\N	\N
4921	258	21	2	\N	\N	\N	\N
4922	258	22	3	\N	\N	\N	\N
4923	258	23	2	\N	\N	\N	\N
4924	258	24	1	\N	\N	\N	\N
4925	258	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
4926	258	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
4927	258	27	3	\N	\N	\N	\N
4928	258	28	3	\N	\N	\N	\N
4929	258	29	3	\N	\N	\N	\N
4930	258	30	4	\N	\N	\N	\N
4931	258	31	2	\N	\N	\N	\N
4932	258	32	3	\N	\N	\N	\N
4933	258	33	2	\N	\N	\N	\N
4934	258	34	1	\N	\N	\N	\N
4935	258	35	3	\N	\N	\N	\N
4936	258	36	3	\N	\N	\N	\N
4937	258	37	2	\N	\N	\N	\N
4938	258	38	3	\N	\N	\N	\N
4939	259	18	3	\N	\N	\N	\N
4940	259	19	3	\N	\N	\N	\N
4941	259	20	4	\N	\N	\N	\N
4942	259	21	3	\N	\N	\N	\N
4943	259	22	3	\N	\N	\N	\N
4944	259	23	4	\N	\N	\N	\N
4945	259	24	4	\N	\N	\N	\N
4946	259	25	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
4947	259	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
4948	259	27	2	\N	\N	\N	\N
4949	259	28	2	\N	\N	\N	\N
4950	259	29	4	\N	\N	\N	\N
4951	259	30	3	\N	\N	\N	\N
4952	259	31	2	\N	\N	\N	\N
4953	259	32	3	\N	\N	\N	\N
4954	259	33	2	\N	\N	\N	\N
4955	259	34	1	\N	\N	\N	\N
4956	259	35	2	\N	\N	\N	\N
4957	259	36	3	\N	\N	\N	\N
4958	259	37	2	\N	\N	\N	\N
4959	259	38	3	\N	\N	\N	\N
4960	260	18	2	\N	\N	\N	\N
4961	260	19	2	\N	\N	\N	\N
4962	260	20	4	\N	\N	\N	\N
4963	260	21	3	\N	\N	\N	\N
4964	260	22	4	\N	\N	\N	\N
4965	260	23	3	\N	\N	\N	\N
4966	260	24	4	\N	\N	\N	\N
4967	260	25	\N	El curso estuvo bien en general.	POSITIVO	0.9648	MODELO
4968	260	26	\N	Las evaluaciones no siempre reflejan lo visto en clase.	NEUTRO	0.5035	MODELO
4969	260	27	3	\N	\N	\N	\N
4970	260	28	3	\N	\N	\N	\N
4971	260	29	4	\N	\N	\N	\N
4972	260	30	2	\N	\N	\N	\N
4973	260	31	4	\N	\N	\N	\N
4974	260	32	2	\N	\N	\N	\N
4975	260	33	4	\N	\N	\N	\N
4976	260	34	4	\N	\N	\N	\N
4977	260	35	4	\N	\N	\N	\N
4978	260	36	2	\N	\N	\N	\N
4979	260	37	4	\N	\N	\N	\N
4980	260	38	2	\N	\N	\N	\N
4981	261	18	2	\N	\N	\N	\N
4982	261	19	4	\N	\N	\N	\N
4983	261	20	2	\N	\N	\N	\N
4984	261	21	1	\N	\N	\N	\N
4985	261	22	3	\N	\N	\N	\N
4986	261	23	2	\N	\N	\N	\N
4987	261	24	3	\N	\N	\N	\N
4988	261	25	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
4989	261	26	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
4990	261	27	2	\N	\N	\N	\N
4991	261	28	3	\N	\N	\N	\N
4992	261	29	3	\N	\N	\N	\N
4993	261	30	3	\N	\N	\N	\N
4994	261	31	3	\N	\N	\N	\N
4995	261	32	1	\N	\N	\N	\N
4996	261	33	3	\N	\N	\N	\N
4997	261	34	3	\N	\N	\N	\N
4998	261	35	4	\N	\N	\N	\N
4999	261	36	4	\N	\N	\N	\N
5000	261	37	3	\N	\N	\N	\N
5001	261	38	3	\N	\N	\N	\N
5002	262	18	1	\N	\N	\N	\N
5003	262	19	3	\N	\N	\N	\N
5004	262	20	2	\N	\N	\N	\N
5005	262	21	4	\N	\N	\N	\N
5006	262	22	2	\N	\N	\N	\N
5007	262	23	1	\N	\N	\N	\N
5008	262	24	3	\N	\N	\N	\N
5009	262	25	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
5010	262	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
5011	262	27	4	\N	\N	\N	\N
5012	262	28	3	\N	\N	\N	\N
5013	262	29	3	\N	\N	\N	\N
5014	262	30	3	\N	\N	\N	\N
5015	262	31	3	\N	\N	\N	\N
5016	262	32	3	\N	\N	\N	\N
5017	262	33	2	\N	\N	\N	\N
5018	262	34	4	\N	\N	\N	\N
5019	262	35	3	\N	\N	\N	\N
5020	262	36	3	\N	\N	\N	\N
5021	262	37	2	\N	\N	\N	\N
5022	262	38	4	\N	\N	\N	\N
5023	263	18	1	\N	\N	\N	\N
5024	263	19	2	\N	\N	\N	\N
5025	263	20	4	\N	\N	\N	\N
5026	263	21	2	\N	\N	\N	\N
5027	263	22	1	\N	\N	\N	\N
5028	263	23	3	\N	\N	\N	\N
5029	263	24	2	\N	\N	\N	\N
5030	263	25	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
5031	263	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
5032	263	27	3	\N	\N	\N	\N
5033	263	28	3	\N	\N	\N	\N
5034	263	29	3	\N	\N	\N	\N
5035	263	30	1	\N	\N	\N	\N
5036	263	31	1	\N	\N	\N	\N
5037	263	32	4	\N	\N	\N	\N
5038	263	33	1	\N	\N	\N	\N
5039	263	34	1	\N	\N	\N	\N
5040	263	35	3	\N	\N	\N	\N
5041	263	36	2	\N	\N	\N	\N
5042	263	37	2	\N	\N	\N	\N
5043	263	38	3	\N	\N	\N	\N
5044	264	18	3	\N	\N	\N	\N
5045	264	19	1	\N	\N	\N	\N
5046	264	20	3	\N	\N	\N	\N
5047	264	21	1	\N	\N	\N	\N
5048	264	22	3	\N	\N	\N	\N
5049	264	23	3	\N	\N	\N	\N
5050	264	24	3	\N	\N	\N	\N
5051	264	25	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
5052	264	26	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
5053	264	27	1	\N	\N	\N	\N
5054	264	28	1	\N	\N	\N	\N
5055	264	29	1	\N	\N	\N	\N
5056	264	30	2	\N	\N	\N	\N
5057	264	31	2	\N	\N	\N	\N
5058	264	32	2	\N	\N	\N	\N
5059	264	33	3	\N	\N	\N	\N
5060	264	34	2	\N	\N	\N	\N
5061	264	35	3	\N	\N	\N	\N
5062	264	36	2	\N	\N	\N	\N
5063	264	37	1	\N	\N	\N	\N
5064	264	38	3	\N	\N	\N	\N
5065	265	18	4	\N	\N	\N	\N
5066	265	19	2	\N	\N	\N	\N
5067	265	20	1	\N	\N	\N	\N
5068	265	21	3	\N	\N	\N	\N
5069	265	22	4	\N	\N	\N	\N
5070	265	23	4	\N	\N	\N	\N
5071	265	24	3	\N	\N	\N	\N
5072	265	25	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
5073	265	26	\N	Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.	POSITIVO	0.4101	MODELO
5074	265	27	3	\N	\N	\N	\N
5075	265	28	1	\N	\N	\N	\N
5076	265	29	2	\N	\N	\N	\N
5077	265	30	2	\N	\N	\N	\N
5078	265	31	4	\N	\N	\N	\N
5079	265	32	2	\N	\N	\N	\N
5080	265	33	3	\N	\N	\N	\N
5081	265	34	1	\N	\N	\N	\N
5082	265	35	2	\N	\N	\N	\N
5083	265	36	1	\N	\N	\N	\N
5084	265	37	2	\N	\N	\N	\N
5085	265	38	4	\N	\N	\N	\N
5086	266	18	3	\N	\N	\N	\N
5087	266	19	1	\N	\N	\N	\N
5088	266	20	3	\N	\N	\N	\N
5089	266	21	1	\N	\N	\N	\N
5090	266	22	4	\N	\N	\N	\N
5091	266	23	3	\N	\N	\N	\N
5092	266	24	2	\N	\N	\N	\N
5093	266	25	\N	El material que comparte es útil para estudiar.	POSITIVO	0.7489	MODELO
5094	266	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
5095	266	27	4	\N	\N	\N	\N
5096	266	28	1	\N	\N	\N	\N
5097	266	29	4	\N	\N	\N	\N
5098	266	30	2	\N	\N	\N	\N
5099	266	31	3	\N	\N	\N	\N
5100	266	32	4	\N	\N	\N	\N
5101	266	33	2	\N	\N	\N	\N
5102	266	34	2	\N	\N	\N	\N
5103	266	35	4	\N	\N	\N	\N
5104	266	36	3	\N	\N	\N	\N
5105	266	37	3	\N	\N	\N	\N
5106	266	38	3	\N	\N	\N	\N
5107	267	18	3	\N	\N	\N	\N
5108	267	19	1	\N	\N	\N	\N
5109	267	20	4	\N	\N	\N	\N
5110	267	21	2	\N	\N	\N	\N
5111	267	22	3	\N	\N	\N	\N
5112	267	23	3	\N	\N	\N	\N
5113	267	24	4	\N	\N	\N	\N
5114	267	25	\N	Es responsable y puntual, eso se valora.	POSITIVO	0.9453	MODELO
5115	267	26	\N	Falta más interacción con los estudiantes, la clase es casi toda monólogo.	POSITIVO	0.4563	MODELO
5116	267	27	3	\N	\N	\N	\N
5117	267	28	4	\N	\N	\N	\N
5118	267	29	4	\N	\N	\N	\N
5119	267	30	3	\N	\N	\N	\N
5120	267	31	4	\N	\N	\N	\N
5121	267	32	3	\N	\N	\N	\N
5122	267	33	3	\N	\N	\N	\N
5123	267	34	4	\N	\N	\N	\N
5124	267	35	3	\N	\N	\N	\N
5125	267	36	1	\N	\N	\N	\N
5126	267	37	3	\N	\N	\N	\N
5127	267	38	1	\N	\N	\N	\N
5128	268	18	3	\N	\N	\N	\N
5129	268	19	3	\N	\N	\N	\N
5130	268	20	3	\N	\N	\N	\N
5131	268	21	2	\N	\N	\N	\N
5132	268	22	4	\N	\N	\N	\N
5133	268	23	4	\N	\N	\N	\N
5134	268	24	3	\N	\N	\N	\N
5135	268	25	\N	Algunas clases específicas resultaron muy buenas.	POSITIVO	0.9798	MODELO
5136	268	26	\N	Debería actualizar los ejemplos, algunos son de hace varios años.	POSITIVO	0.5089	MODELO
5137	268	27	3	\N	\N	\N	\N
5138	268	28	3	\N	\N	\N	\N
5139	268	29	3	\N	\N	\N	\N
5140	268	30	2	\N	\N	\N	\N
5141	268	31	4	\N	\N	\N	\N
5142	268	32	4	\N	\N	\N	\N
5143	268	33	3	\N	\N	\N	\N
5144	268	34	1	\N	\N	\N	\N
5145	268	35	4	\N	\N	\N	\N
5146	268	36	3	\N	\N	\N	\N
5147	268	37	3	\N	\N	\N	\N
5148	268	38	3	\N	\N	\N	\N
5149	269	18	3	\N	\N	\N	\N
5150	269	19	2	\N	\N	\N	\N
5151	269	20	2	\N	\N	\N	\N
5152	269	21	2	\N	\N	\N	\N
5153	269	22	3	\N	\N	\N	\N
5154	269	23	3	\N	\N	\N	\N
5155	269	24	2	\N	\N	\N	\N
5156	269	25	\N	Se nota que sabe del tema aunque a veces le cuesta transmitirlo.	NEUTRO	0.3966	MODELO
5157	269	26	\N	Debería empezar puntual y avisar con tiempo cuando cancela.	POSITIVO	0.4735	MODELO
5158	269	27	3	\N	\N	\N	\N
5159	269	28	4	\N	\N	\N	\N
5160	269	29	3	\N	\N	\N	\N
5161	269	30	1	\N	\N	\N	\N
5162	269	31	3	\N	\N	\N	\N
5163	269	32	3	\N	\N	\N	\N
5164	269	33	1	\N	\N	\N	\N
5165	269	34	3	\N	\N	\N	\N
5166	269	35	3	\N	\N	\N	\N
5167	269	36	1	\N	\N	\N	\N
5168	269	37	1	\N	\N	\N	\N
5169	269	38	3	\N	\N	\N	\N
5170	270	18	3	\N	\N	\N	\N
5171	270	19	3	\N	\N	\N	\N
5172	270	20	2	\N	\N	\N	\N
5173	270	21	4	\N	\N	\N	\N
5174	270	22	4	\N	\N	\N	\N
5175	270	23	3	\N	\N	\N	\N
5176	270	24	1	\N	\N	\N	\N
5177	270	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
5178	270	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
5179	270	27	3	\N	\N	\N	\N
5180	270	28	4	\N	\N	\N	\N
5181	270	29	3	\N	\N	\N	\N
5182	270	30	3	\N	\N	\N	\N
5183	270	31	2	\N	\N	\N	\N
5184	270	32	4	\N	\N	\N	\N
5185	270	33	1	\N	\N	\N	\N
5186	270	34	3	\N	\N	\N	\N
5187	270	35	3	\N	\N	\N	\N
5188	270	36	4	\N	\N	\N	\N
5189	270	37	3	\N	\N	\N	\N
5190	270	38	3	\N	\N	\N	\N
5191	271	18	4	\N	\N	\N	\N
5192	271	19	3	\N	\N	\N	\N
5193	271	20	4	\N	\N	\N	\N
5194	271	21	4	\N	\N	\N	\N
5195	271	22	3	\N	\N	\N	\N
5196	271	23	3	\N	\N	\N	\N
5197	271	24	2	\N	\N	\N	\N
5198	271	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
5199	271	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
5200	271	27	4	\N	\N	\N	\N
5201	271	28	2	\N	\N	\N	\N
5202	271	29	3	\N	\N	\N	\N
5203	271	30	4	\N	\N	\N	\N
5204	271	31	4	\N	\N	\N	\N
5205	271	32	3	\N	\N	\N	\N
5206	271	33	4	\N	\N	\N	\N
5207	271	34	3	\N	\N	\N	\N
5208	271	35	4	\N	\N	\N	\N
5209	271	36	4	\N	\N	\N	\N
5210	271	37	2	\N	\N	\N	\N
5211	271	38	3	\N	\N	\N	\N
5212	272	18	1	\N	\N	\N	\N
5213	272	19	4	\N	\N	\N	\N
5214	272	20	4	\N	\N	\N	\N
5215	272	21	3	\N	\N	\N	\N
5216	272	22	3	\N	\N	\N	\N
5217	272	23	4	\N	\N	\N	\N
5218	272	24	2	\N	\N	\N	\N
5219	272	25	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
5220	272	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
5221	272	27	3	\N	\N	\N	\N
5222	272	28	3	\N	\N	\N	\N
5223	272	29	4	\N	\N	\N	\N
5224	272	30	3	\N	\N	\N	\N
5225	272	31	3	\N	\N	\N	\N
5226	272	32	4	\N	\N	\N	\N
5227	272	33	3	\N	\N	\N	\N
5228	272	34	3	\N	\N	\N	\N
5229	272	35	3	\N	\N	\N	\N
5230	272	36	3	\N	\N	\N	\N
5231	272	37	4	\N	\N	\N	\N
5232	272	38	2	\N	\N	\N	\N
5233	273	18	4	\N	\N	\N	\N
5234	273	19	3	\N	\N	\N	\N
5235	273	20	4	\N	\N	\N	\N
5236	273	21	3	\N	\N	\N	\N
5237	273	22	3	\N	\N	\N	\N
5238	273	23	4	\N	\N	\N	\N
5239	273	24	3	\N	\N	\N	\N
5240	273	25	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
5241	273	26	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
5242	273	27	4	\N	\N	\N	\N
5243	273	28	4	\N	\N	\N	\N
5244	273	29	2	\N	\N	\N	\N
5245	273	30	4	\N	\N	\N	\N
5246	273	31	4	\N	\N	\N	\N
5247	273	32	2	\N	\N	\N	\N
5248	273	33	3	\N	\N	\N	\N
5249	273	34	3	\N	\N	\N	\N
5250	273	35	4	\N	\N	\N	\N
5251	273	36	4	\N	\N	\N	\N
5252	273	37	3	\N	\N	\N	\N
5253	273	38	3	\N	\N	\N	\N
5254	274	18	4	\N	\N	\N	\N
5255	274	19	4	\N	\N	\N	\N
5256	274	20	4	\N	\N	\N	\N
5257	274	21	3	\N	\N	\N	\N
5258	274	22	4	\N	\N	\N	\N
5259	274	23	3	\N	\N	\N	\N
5260	274	24	1	\N	\N	\N	\N
5261	274	25	\N	Trata bien a los estudiantes y el ambiente de clase es bueno.	POSITIVO	0.9851	MODELO
5262	274	26	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
5263	274	27	2	\N	\N	\N	\N
5264	274	28	4	\N	\N	\N	\N
5265	274	29	2	\N	\N	\N	\N
5266	274	30	3	\N	\N	\N	\N
5267	274	31	3	\N	\N	\N	\N
5268	274	32	4	\N	\N	\N	\N
5269	274	33	4	\N	\N	\N	\N
5270	274	34	3	\N	\N	\N	\N
5271	274	35	4	\N	\N	\N	\N
5272	274	36	1	\N	\N	\N	\N
5273	274	37	4	\N	\N	\N	\N
5274	274	38	2	\N	\N	\N	\N
5275	275	18	4	\N	\N	\N	\N
5276	275	19	4	\N	\N	\N	\N
5277	275	20	4	\N	\N	\N	\N
5278	275	21	3	\N	\N	\N	\N
5279	275	22	3	\N	\N	\N	\N
5280	275	23	4	\N	\N	\N	\N
5281	275	24	4	\N	\N	\N	\N
5282	275	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
5283	275	26	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
5284	275	27	3	\N	\N	\N	\N
5285	275	28	4	\N	\N	\N	\N
5286	275	29	4	\N	\N	\N	\N
5287	275	30	4	\N	\N	\N	\N
5288	275	31	1	\N	\N	\N	\N
5289	275	32	4	\N	\N	\N	\N
5290	275	33	2	\N	\N	\N	\N
5291	275	34	4	\N	\N	\N	\N
5292	275	35	4	\N	\N	\N	\N
5293	275	36	3	\N	\N	\N	\N
5294	275	37	3	\N	\N	\N	\N
5295	275	38	3	\N	\N	\N	\N
5296	276	18	3	\N	\N	\N	\N
5297	276	19	3	\N	\N	\N	\N
5298	276	20	4	\N	\N	\N	\N
5299	276	21	2	\N	\N	\N	\N
5300	276	22	4	\N	\N	\N	\N
5301	276	23	2	\N	\N	\N	\N
5302	276	24	3	\N	\N	\N	\N
5303	276	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
5304	276	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
5305	276	27	4	\N	\N	\N	\N
5306	276	28	2	\N	\N	\N	\N
5307	276	29	1	\N	\N	\N	\N
5308	276	30	3	\N	\N	\N	\N
5309	276	31	3	\N	\N	\N	\N
5310	276	32	2	\N	\N	\N	\N
5311	276	33	4	\N	\N	\N	\N
5312	276	34	1	\N	\N	\N	\N
5313	276	35	3	\N	\N	\N	\N
5314	276	36	4	\N	\N	\N	\N
5315	276	37	1	\N	\N	\N	\N
5316	276	38	4	\N	\N	\N	\N
5317	277	18	4	\N	\N	\N	\N
5318	277	19	3	\N	\N	\N	\N
5319	277	20	4	\N	\N	\N	\N
5320	277	21	3	\N	\N	\N	\N
5321	277	22	4	\N	\N	\N	\N
5322	277	23	3	\N	\N	\N	\N
5323	277	24	2	\N	\N	\N	\N
5324	277	25	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
5325	277	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
5326	277	27	3	\N	\N	\N	\N
5327	277	28	4	\N	\N	\N	\N
5328	277	29	2	\N	\N	\N	\N
5329	277	30	3	\N	\N	\N	\N
5330	277	31	3	\N	\N	\N	\N
5331	277	32	3	\N	\N	\N	\N
5332	277	33	4	\N	\N	\N	\N
5333	277	34	4	\N	\N	\N	\N
5334	277	35	3	\N	\N	\N	\N
5335	277	36	3	\N	\N	\N	\N
5336	277	37	4	\N	\N	\N	\N
5337	277	38	3	\N	\N	\N	\N
5338	278	18	3	\N	\N	\N	\N
5339	278	19	4	\N	\N	\N	\N
5340	278	20	4	\N	\N	\N	\N
5341	278	21	2	\N	\N	\N	\N
5342	278	22	3	\N	\N	\N	\N
5343	278	23	3	\N	\N	\N	\N
5344	278	24	4	\N	\N	\N	\N
5345	278	25	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
5346	278	26	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
5347	278	27	3	\N	\N	\N	\N
5348	278	28	4	\N	\N	\N	\N
5349	278	29	2	\N	\N	\N	\N
5350	278	30	3	\N	\N	\N	\N
5351	278	31	4	\N	\N	\N	\N
5352	278	32	1	\N	\N	\N	\N
5353	278	33	3	\N	\N	\N	\N
5354	278	34	4	\N	\N	\N	\N
5355	278	35	3	\N	\N	\N	\N
5356	278	36	3	\N	\N	\N	\N
5357	278	37	3	\N	\N	\N	\N
5358	278	38	3	\N	\N	\N	\N
5359	279	18	3	\N	\N	\N	\N
5360	279	19	2	\N	\N	\N	\N
5361	279	20	2	\N	\N	\N	\N
5362	279	21	4	\N	\N	\N	\N
5363	279	22	4	\N	\N	\N	\N
5364	279	23	3	\N	\N	\N	\N
5365	279	24	3	\N	\N	\N	\N
5366	279	25	\N	Explica bien la mayoría de temas y es paciente con las dudas.	POSITIVO	0.8175	MODELO
5367	279	26	\N	Podría usar más recursos visuales en las diapositivas.	POSITIVO	0.6854	MODELO
5368	279	27	4	\N	\N	\N	\N
5369	279	28	2	\N	\N	\N	\N
5370	279	29	4	\N	\N	\N	\N
5371	279	30	4	\N	\N	\N	\N
5372	279	31	4	\N	\N	\N	\N
5373	279	32	3	\N	\N	\N	\N
5374	279	33	4	\N	\N	\N	\N
5375	279	34	2	\N	\N	\N	\N
5376	279	35	4	\N	\N	\N	\N
5377	279	36	1	\N	\N	\N	\N
5378	279	37	4	\N	\N	\N	\N
5379	279	38	1	\N	\N	\N	\N
5380	280	18	2	\N	\N	\N	\N
5381	280	19	3	\N	\N	\N	\N
5382	280	20	2	\N	\N	\N	\N
5383	280	21	4	\N	\N	\N	\N
5384	280	22	4	\N	\N	\N	\N
5385	280	23	3	\N	\N	\N	\N
5386	280	24	3	\N	\N	\N	\N
5387	280	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
5388	280	26	\N	La materia es importante para la carrera.	POSITIVO	0.9273	MODELO
5389	280	27	2	\N	\N	\N	\N
5390	280	28	1	\N	\N	\N	\N
5391	280	29	4	\N	\N	\N	\N
5392	280	30	2	\N	\N	\N	\N
5393	280	31	4	\N	\N	\N	\N
5394	280	32	1	\N	\N	\N	\N
5395	280	33	4	\N	\N	\N	\N
5396	280	34	3	\N	\N	\N	\N
5397	280	35	3	\N	\N	\N	\N
5398	280	36	3	\N	\N	\N	\N
5399	280	37	4	\N	\N	\N	\N
5400	280	38	3	\N	\N	\N	\N
5469	284	23	2	\N	\N	\N	\N
5470	284	24	4	\N	\N	\N	\N
5471	284	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
5472	284	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
5473	284	27	4	\N	\N	\N	\N
5474	284	28	2	\N	\N	\N	\N
5475	284	29	4	\N	\N	\N	\N
5476	284	30	3	\N	\N	\N	\N
5477	284	31	4	\N	\N	\N	\N
5478	284	32	4	\N	\N	\N	\N
5479	284	33	4	\N	\N	\N	\N
5480	284	34	3	\N	\N	\N	\N
5481	284	35	4	\N	\N	\N	\N
5482	284	36	3	\N	\N	\N	\N
5483	284	37	4	\N	\N	\N	\N
5484	284	38	2	\N	\N	\N	\N
5485	285	18	3	\N	\N	\N	\N
5486	285	19	4	\N	\N	\N	\N
5487	285	20	3	\N	\N	\N	\N
5488	285	21	4	\N	\N	\N	\N
5489	285	22	2	\N	\N	\N	\N
5490	285	23	3	\N	\N	\N	\N
5491	285	24	4	\N	\N	\N	\N
5492	285	25	\N	Es puntual, organizado y cumple lo que propone en el sílabo.	POSITIVO	0.8712	MODELO
5493	285	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
5494	285	27	3	\N	\N	\N	\N
5495	285	28	3	\N	\N	\N	\N
5496	285	29	3	\N	\N	\N	\N
5497	285	30	4	\N	\N	\N	\N
5498	285	31	4	\N	\N	\N	\N
5499	285	32	4	\N	\N	\N	\N
5500	285	33	3	\N	\N	\N	\N
5501	285	34	2	\N	\N	\N	\N
5502	285	35	3	\N	\N	\N	\N
5503	285	36	3	\N	\N	\N	\N
5504	285	37	2	\N	\N	\N	\N
5505	285	38	4	\N	\N	\N	\N
5506	286	18	4	\N	\N	\N	\N
5507	286	19	4	\N	\N	\N	\N
5508	286	20	3	\N	\N	\N	\N
5509	286	21	3	\N	\N	\N	\N
5510	286	22	2	\N	\N	\N	\N
5511	286	23	3	\N	\N	\N	\N
5512	286	24	2	\N	\N	\N	\N
5513	286	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
5514	286	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
5515	286	27	4	\N	\N	\N	\N
5516	286	28	3	\N	\N	\N	\N
5517	286	29	3	\N	\N	\N	\N
5518	286	30	3	\N	\N	\N	\N
5519	286	31	1	\N	\N	\N	\N
5520	286	32	4	\N	\N	\N	\N
5521	286	33	3	\N	\N	\N	\N
5522	286	34	4	\N	\N	\N	\N
5523	286	35	3	\N	\N	\N	\N
5524	286	36	4	\N	\N	\N	\N
5525	286	37	4	\N	\N	\N	\N
5526	286	38	3	\N	\N	\N	\N
5527	287	18	2	\N	\N	\N	\N
5528	287	19	4	\N	\N	\N	\N
5529	287	20	3	\N	\N	\N	\N
5530	287	21	4	\N	\N	\N	\N
5531	287	22	4	\N	\N	\N	\N
5532	287	23	3	\N	\N	\N	\N
5533	287	24	3	\N	\N	\N	\N
5534	287	25	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
5535	287	26	\N	Mejorar la retroalimentación de los talleres, tarda en devolverlos.	POSITIVO	0.8304	MODELO
5536	287	27	3	\N	\N	\N	\N
5537	287	28	3	\N	\N	\N	\N
5538	287	29	3	\N	\N	\N	\N
5539	287	30	3	\N	\N	\N	\N
5540	287	31	2	\N	\N	\N	\N
5541	287	32	2	\N	\N	\N	\N
5542	287	33	2	\N	\N	\N	\N
5543	287	34	4	\N	\N	\N	\N
5544	287	35	2	\N	\N	\N	\N
5551	288	21	3	\N	\N	\N	\N
5552	288	22	3	\N	\N	\N	\N
5553	288	23	2	\N	\N	\N	\N
5554	288	24	2	\N	\N	\N	\N
5555	288	25	\N	Conoce bien la materia y se nota la experiencia profesional.	POSITIVO	0.9749	MODELO
5556	288	26	\N	A veces avanza un poco rápido, convendría pausas para asimilar.	POSITIVO	0.6042	MODELO
5557	288	27	3	\N	\N	\N	\N
5558	288	28	2	\N	\N	\N	\N
5559	288	29	3	\N	\N	\N	\N
5560	288	30	1	\N	\N	\N	\N
5561	288	31	3	\N	\N	\N	\N
5562	288	32	1	\N	\N	\N	\N
5563	288	33	3	\N	\N	\N	\N
5564	288	34	2	\N	\N	\N	\N
5565	288	35	4	\N	\N	\N	\N
5566	288	36	3	\N	\N	\N	\N
5567	288	37	3	\N	\N	\N	\N
5568	288	38	1	\N	\N	\N	\N
5569	289	18	4	\N	\N	\N	\N
5570	289	19	3	\N	\N	\N	\N
5571	289	20	2	\N	\N	\N	\N
5572	289	21	3	\N	\N	\N	\N
5573	289	22	4	\N	\N	\N	\N
5574	289	23	4	\N	\N	\N	\N
5575	289	24	2	\N	\N	\N	\N
5576	289	25	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
5577	289	26	\N	Incluir más ejercicios de práctica antes de los parciales.	POSITIVO	0.5245	MODELO
5578	289	27	4	\N	\N	\N	\N
5579	289	28	2	\N	\N	\N	\N
5580	289	29	4	\N	\N	\N	\N
5581	289	30	3	\N	\N	\N	\N
5582	289	31	4	\N	\N	\N	\N
5583	289	32	3	\N	\N	\N	\N
5584	289	33	3	\N	\N	\N	\N
5585	289	34	3	\N	\N	\N	\N
5586	289	35	3	\N	\N	\N	\N
5587	289	36	3	\N	\N	\N	\N
5588	289	37	2	\N	\N	\N	\N
5589	289	38	2	\N	\N	\N	\N
5590	290	18	3	\N	\N	\N	\N
5591	290	19	3	\N	\N	\N	\N
5592	290	20	2	\N	\N	\N	\N
5593	290	21	2	\N	\N	\N	\N
5594	290	22	3	\N	\N	\N	\N
5595	290	23	3	\N	\N	\N	\N
5596	290	24	1	\N	\N	\N	\N
5597	290	25	\N	Sus ejemplos del mundo laboral ayudan a entender la teoría.	POSITIVO	0.8348	MODELO
5598	290	26	\N	Debería dar más ejemplos aplicados en algunos temas que son abstractos.	POSITIVO	0.5939	MODELO
5599	290	27	3	\N	\N	\N	\N
5600	290	28	2	\N	\N	\N	\N
5601	290	29	3	\N	\N	\N	\N
5602	290	30	4	\N	\N	\N	\N
5603	290	31	4	\N	\N	\N	\N
5604	290	32	4	\N	\N	\N	\N
5605	290	33	4	\N	\N	\N	\N
5606	290	34	3	\N	\N	\N	\N
5607	290	35	3	\N	\N	\N	\N
5608	290	36	1	\N	\N	\N	\N
5609	290	37	3	\N	\N	\N	\N
5610	290	38	3	\N	\N	\N	\N
5611	291	18	4	\N	\N	\N	\N
5612	291	19	4	\N	\N	\N	\N
5613	291	20	4	\N	\N	\N	\N
5614	291	21	4	\N	\N	\N	\N
5615	291	22	4	\N	\N	\N	\N
5616	291	23	4	\N	\N	\N	\N
5617	291	24	4	\N	\N	\N	\N
5618	291	25	\N	Muy buen docente, claro y puntual.	POSITIVO	0.7773	MODELO
5619	291	26	\N	Muy buen docente, claro y puntual.	POSITIVO	0.7773	MODELO
5620	291	27	4	\N	\N	\N	\N
5621	291	28	4	\N	\N	\N	\N
5622	291	29	4	\N	\N	\N	\N
5623	291	30	4	\N	\N	\N	\N
5624	291	31	4	\N	\N	\N	\N
5625	291	32	4	\N	\N	\N	\N
5626	291	33	4	\N	\N	\N	\N
5627	291	34	4	\N	\N	\N	\N
5628	291	35	4	\N	\N	\N	\N
5629	291	36	4	\N	\N	\N	\N
5630	291	37	4	\N	\N	\N	\N
5631	291	38	4	\N	\N	\N	\N
\.


--
-- Data for Name: sesion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sesion (id, token, usuario_id, creado_en, expira_en) FROM stdin;
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
42	0222400041	$2a$10$c42Ttpbnnv.gwADtU5lurekdelvK2pdOKKrHtwvZ5EWpLqANp/0De	ESTUDIANTE	SANTIAGO RODRIGUEZ LOPEZ DIAZ	41	\N	ACTIVO	2026-10-25 03:36:21.660968+00	2026-10-23 01:24:09.266586+00
45	0222400044	$2a$10$ybBDv0mZEYDF9BTNBipz8OAPi8LmjbQmbgF/ujUaKhMQm5INk1fe.	ESTUDIANTE	PAULA LOPEZ SANCHEZ RAMIREZ	44	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
46	0222400045	$2a$10$LjfACBkK.YGQbo2N4/RnPuIHmh4AeYI9QroochPQacSNyWqyiLkOO	ESTUDIANTE	KEVIN GONZALEZ RAMIREZ MORENO	45	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
48	0222400047	$2a$10$rBbF071ut0unSapcbcp2x.4YYaz9OTUpc6IMEJJr3poP7R.b88DWS	ESTUDIANTE	ESTEBAN DIAZ CASTRO CASTRO	47	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
49	0222400048	$2a$10$hCTG6RSfqPWdQnX4FgJaR.98cWE5O31.JDSfEm/l1ruGJ/oOHDrz2	ESTUDIANTE	JULIANA RAMIREZ VARGAS ACOSTA	48	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
50	0222400049	$2a$10$nuy07D15V5rJ6XasbSMhReMnBqVHabWuCg1UQEdUzsdTN2HkVJmbC	ESTUDIANTE	OSCAR CASTRO ORTIZ GARCIA	49	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
51	0222400050	$2a$10$YMob7d.FtrjpjV3jOhVGsO8Odsa8vqa42wBAB2H6y88w0o1QYe9zu	ESTUDIANTE	JUAN CAMILO TORRES MORENO TORRES	50	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
53	72104567	$2a$10$MkCHqA9.OnAjHj.qJ71DMuUIsRxZ64mK04LSiASbmCpQ3AoyzYB8y	DOCENTE	MARIA FERNANDA RUIZ CASTRO	\N	2	ACTIVO	\N	2026-10-23 01:24:09.266586+00
54	73098812	$2a$10$p69wrldNLAynTz3MZ3tHVOiBze/2.VmnEOTjg5oTDHKEfP7J52dG6	DOCENTE	CARLOS ALBERTO MENDOZA SIERRA	\N	3	ACTIVO	\N	2026-10-23 01:24:09.266586+00
55	10304566	$2a$10$YjOf3ka4n18TVKQe9l7cDu2WNX8Jv1NPFSImxA2hZXCFB86jNtnD2	DOCENTE	LUIS EDUARDO PATERNINA CUELLO	\N	4	ACTIVO	\N	2026-10-23 01:24:09.266586+00
1	admin	$2a$10$RBNzxuMBcWYiWt0GfyIMi.QwUppdPNq3vEhw7czEyQE6QD1gPaVRC	ADMIN	Administrador del sistema	\N	\N	ACTIVO	2026-10-23 01:24:45.506446+00	2026-10-23 01:24:09.266586+00
52	10301274	$2a$10$9O.rJVpB8YgCZMvf0yVvCe/SFj/Ksrb342n4IxHYbsLMqbpGZB5uW	DOCENTE	GABRIEL ELIAS CHANCHI GOLONDRINO	\N	1	ACTIVO	2026-10-23 01:25:05.586469+00	2026-10-23 01:24:09.266586+00
47	0222400046	$2a$10$j76xm7SEvURNBN1Xj03VhuvD1X7ypmsbrXIm4ktJFWitf2nlwWt3e	ESTUDIANTE	MANUELA HERNANDEZ TORRES MARTINEZ	46	\N	ACTIVO	2026-10-23 01:30:04.3746+00	2026-10-23 01:24:09.266586+00
2	0222400001	$2a$10$xKDdnF7vaeDJvvliRoLqneiUAEctXtYuBT8e2mq.gwFx9ZXZ81cgS	ESTUDIANTE	MARIA JOSE RODRIGUEZ LOPEZ DIAZ	1	\N	ACTIVO	2026-10-25 03:36:22.018374+00	2026-10-23 01:24:09.266586+00
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

SELECT pg_catalog.setval('public.categoria_pregunta_evaluacion_id_seq', 9, true);


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

SELECT pg_catalog.setval('public.encuesta_evaluacion_id_seq', 291, true);


--
-- Name: estudiante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estudiante_id_seq', 50, true);


--
-- Name: evaluacion_docente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.evaluacion_docente_id_seq', 14, true);


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

SELECT pg_catalog.setval('public.inscripcion_evaluacion_id_seq', 300, true);


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

SELECT pg_catalog.setval('public.pregunta_evaluacion_id_seq', 38, true);


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

SELECT pg_catalog.setval('public.respuesta_pregunta_id_seq', 5631, true);


--
-- Name: sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sesion_id_seq', 8, true);


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

\unrestrict oInhE92QhusMDWSwGviCwsvRUIjeFUCzn80uq8fHtINkJtWQ30Ohv4jROXlCAfD

