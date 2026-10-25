--
-- PostgreSQL database dump
--

\restrict zDSGIAOdbSG23t0fPNg0Nu5hw4jP9hoehvtqbnaA94JpBIDKjnQE3Ba3DyUy4qm

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
7	1	EP1101	Programación I	Lógica de programación y Python	ACTIVA	2026-10-25
8	1	EP2101	Estructuras de Datos	Listas, pilas, colas, árboles y grafos	ACTIVA	2026-10-25
9	1	EP2202	Sistemas Operativos	Procesos, memoria, concurrencia y Linux	ACTIVA	2026-10-25
10	1	EP3101	Inteligencia Artificial	Búsqueda, aprendizaje automático y PLN	ACTIVA	2026-10-25
11	1	EP1302	Ingeniería de Software II	Diseño, patrones, pruebas y calidad	ACTIVA	2026-10-25
12	1	EP3201	Arquitectura de Computadores	ISA, pipeline, memoria caché y ensamblador	ACTIVA	2026-10-25
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
5	74112233	HERNANDO JAVIER	DE LA HOZ MARTINEZ	hdelahoz@unicartagena.edu.co	ACTIVO	\N	\N	\N	\N	\N	\N	\N	\N
6	10403321	YOLANDA	PEREZ TAPIA	yperez@unicartagena.edu.co	ACTIVO	\N	\N	\N	\N	\N	\N	\N	\N
7	11024567	JAIRO ALONSO	CASSIANI VARGAS	jcassiani@unicartagena.edu.co	ACTIVO	\N	\N	\N	\N	\N	\N	\N	\N
8	73115544	NORBERTO ENRIQUE	MANJARRES PABON	nmanjarres@unicartagena.edu.co	ACTIVO	\N	\N	\N	\N	\N	\N	\N	\N
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
292	27	2026-06-07 00:00:00	80
293	27	2026-05-11 00:00:00	79
294	27	2026-05-29 00:00:00	78
295	27	2026-05-19 00:00:00	77
296	27	2026-06-10 00:00:00	76
297	27	2026-06-06 00:00:00	75
298	27	2026-05-10 00:00:00	74
299	27	2026-05-07 00:00:00	73
300	27	2026-06-12 00:00:00	72
301	27	2026-05-24 00:00:00	71
302	27	2026-05-27 00:00:00	70
303	27	2026-05-29 00:00:00	69
304	27	2026-05-14 00:00:00	68
305	27	2026-05-08 00:00:00	67
306	27	2026-05-23 00:00:00	66
307	27	2026-06-06 00:00:00	65
308	27	2026-05-19 00:00:00	64
309	27	2026-06-09 00:00:00	63
310	27	2026-05-29 00:00:00	62
311	27	2026-05-28 00:00:00	61
312	27	2026-06-12 00:00:00	60
313	27	2026-06-08 00:00:00	59
314	27	2026-06-09 00:00:00	58
315	27	2026-05-26 00:00:00	57
316	27	2026-06-08 00:00:00	56
317	27	2026-06-02 00:00:00	55
318	27	2026-06-04 00:00:00	54
319	27	2026-05-14 00:00:00	53
320	27	2026-05-15 00:00:00	52
321	27	2026-05-15 00:00:00	51
322	27	2026-05-20 00:00:00	50
323	27	2026-06-02 00:00:00	49
324	27	2026-06-02 00:00:00	48
325	27	2026-06-05 00:00:00	47
326	27	2026-05-28 00:00:00	46
327	27	2026-05-26 00:00:00	45
328	27	2026-05-17 00:00:00	44
329	27	2026-06-05 00:00:00	43
330	27	2026-05-05 00:00:00	42
331	27	2026-05-15 00:00:00	41
332	27	2026-05-17 00:00:00	40
333	27	2026-05-22 00:00:00	39
334	27	2026-05-17 00:00:00	38
335	27	2026-05-19 00:00:00	37
336	27	2026-05-08 00:00:00	36
337	27	2026-05-16 00:00:00	35
338	27	2026-05-16 00:00:00	34
339	27	2026-05-20 00:00:00	33
340	27	2026-06-01 00:00:00	32
341	27	2026-05-20 00:00:00	31
342	27	2026-06-11 00:00:00	30
343	27	2026-05-19 00:00:00	29
344	27	2026-05-28 00:00:00	28
345	27	2026-06-06 00:00:00	27
346	27	2026-05-08 00:00:00	26
347	27	2026-05-21 00:00:00	25
348	27	2026-05-22 00:00:00	24
349	27	2026-05-15 00:00:00	23
350	27	2026-06-10 00:00:00	22
351	27	2026-06-04 00:00:00	21
352	27	2026-06-09 00:00:00	20
353	27	2026-05-13 00:00:00	19
354	27	2026-05-16 00:00:00	18
355	27	2026-05-26 00:00:00	17
356	27	2026-05-09 00:00:00	16
357	27	2026-05-07 00:00:00	15
358	27	2026-05-12 00:00:00	14
359	27	2026-06-04 00:00:00	13
360	27	2026-05-27 00:00:00	12
361	27	2026-06-01 00:00:00	11
362	27	2026-05-29 00:00:00	10
363	27	2026-06-05 00:00:00	9
364	27	2026-06-05 00:00:00	8
365	27	2026-06-09 00:00:00	7
366	27	2026-06-04 00:00:00	6
367	27	2026-06-07 00:00:00	5
368	27	2026-06-02 00:00:00	4
369	27	2026-06-08 00:00:00	3
370	27	2026-06-02 00:00:00	2
371	27	2026-05-31 00:00:00	1
372	28	2026-05-19 00:00:00	80
373	28	2026-05-21 00:00:00	79
374	28	2026-05-25 00:00:00	78
375	28	2026-05-30 00:00:00	77
376	28	2026-05-07 00:00:00	76
377	28	2026-05-19 00:00:00	75
378	28	2026-05-24 00:00:00	74
379	28	2026-05-25 00:00:00	73
380	28	2026-05-05 00:00:00	72
381	28	2026-06-08 00:00:00	71
382	28	2026-05-20 00:00:00	70
383	28	2026-06-03 00:00:00	69
384	28	2026-05-28 00:00:00	68
385	28	2026-06-03 00:00:00	67
386	28	2026-05-15 00:00:00	66
387	28	2026-05-20 00:00:00	65
388	28	2026-05-05 00:00:00	64
389	28	2026-05-22 00:00:00	63
390	28	2026-05-29 00:00:00	62
391	28	2026-06-03 00:00:00	61
392	28	2026-05-13 00:00:00	60
393	28	2026-05-23 00:00:00	59
394	28	2026-06-08 00:00:00	58
395	28	2026-05-24 00:00:00	57
396	28	2026-06-06 00:00:00	56
397	28	2026-06-12 00:00:00	55
398	28	2026-05-07 00:00:00	54
399	28	2026-05-11 00:00:00	53
400	28	2026-05-08 00:00:00	52
401	28	2026-06-01 00:00:00	51
402	28	2026-06-09 00:00:00	50
403	28	2026-05-30 00:00:00	49
404	28	2026-05-15 00:00:00	48
405	28	2026-06-08 00:00:00	47
406	28	2026-06-10 00:00:00	46
407	28	2026-05-30 00:00:00	45
408	28	2026-05-21 00:00:00	44
409	28	2026-05-05 00:00:00	43
410	28	2026-05-27 00:00:00	42
411	28	2026-05-25 00:00:00	41
412	28	2026-05-25 00:00:00	40
413	28	2026-05-16 00:00:00	39
414	28	2026-05-31 00:00:00	38
415	28	2026-06-01 00:00:00	37
416	28	2026-05-05 00:00:00	36
417	28	2026-06-04 00:00:00	35
418	28	2026-05-15 00:00:00	34
419	28	2026-06-03 00:00:00	33
420	28	2026-05-18 00:00:00	32
421	28	2026-05-14 00:00:00	31
422	28	2026-06-09 00:00:00	30
423	28	2026-05-20 00:00:00	29
424	28	2026-06-11 00:00:00	28
425	28	2026-05-27 00:00:00	27
426	28	2026-06-10 00:00:00	26
427	28	2026-05-22 00:00:00	25
428	28	2026-05-23 00:00:00	24
429	28	2026-05-26 00:00:00	23
430	28	2026-05-22 00:00:00	22
431	28	2026-05-30 00:00:00	21
432	28	2026-05-28 00:00:00	20
433	28	2026-06-08 00:00:00	19
434	28	2026-06-01 00:00:00	18
435	28	2026-05-26 00:00:00	17
436	28	2026-06-08 00:00:00	16
437	28	2026-05-16 00:00:00	15
438	28	2026-05-14 00:00:00	14
439	28	2026-05-30 00:00:00	13
440	28	2026-05-16 00:00:00	12
441	28	2026-05-14 00:00:00	11
442	28	2026-05-25 00:00:00	10
443	28	2026-05-11 00:00:00	9
444	28	2026-06-12 00:00:00	8
445	28	2026-05-08 00:00:00	7
446	28	2026-05-22 00:00:00	6
447	28	2026-05-12 00:00:00	5
448	28	2026-05-14 00:00:00	4
449	28	2026-05-20 00:00:00	3
450	28	2026-06-12 00:00:00	2
451	28	2026-06-03 00:00:00	1
452	29	2026-06-02 00:00:00	80
453	29	2026-05-26 00:00:00	79
454	29	2026-06-01 00:00:00	78
455	29	2026-06-08 00:00:00	77
456	29	2026-05-10 00:00:00	76
457	29	2026-05-16 00:00:00	75
458	29	2026-05-28 00:00:00	74
459	29	2026-06-08 00:00:00	73
460	29	2026-05-10 00:00:00	72
461	29	2026-05-28 00:00:00	71
462	29	2026-05-14 00:00:00	70
463	29	2026-05-27 00:00:00	69
464	29	2026-06-05 00:00:00	68
465	29	2026-05-28 00:00:00	67
466	29	2026-05-08 00:00:00	66
467	29	2026-06-05 00:00:00	65
468	29	2026-05-25 00:00:00	64
469	29	2026-05-22 00:00:00	63
470	29	2026-05-09 00:00:00	62
471	29	2026-05-14 00:00:00	61
472	29	2026-05-29 00:00:00	60
473	29	2026-05-31 00:00:00	59
474	29	2026-06-02 00:00:00	58
475	29	2026-05-13 00:00:00	57
476	29	2026-06-01 00:00:00	56
477	29	2026-05-14 00:00:00	55
478	29	2026-05-09 00:00:00	54
479	29	2026-05-14 00:00:00	53
480	29	2026-05-09 00:00:00	52
481	29	2026-05-06 00:00:00	51
482	29	2026-05-06 00:00:00	50
483	29	2026-05-05 00:00:00	49
484	29	2026-05-27 00:00:00	48
485	29	2026-05-09 00:00:00	47
486	29	2026-05-06 00:00:00	46
487	29	2026-05-16 00:00:00	45
488	29	2026-05-06 00:00:00	44
489	29	2026-05-21 00:00:00	43
490	29	2026-05-18 00:00:00	42
491	29	2026-05-06 00:00:00	41
492	29	2026-06-08 00:00:00	40
493	29	2026-06-04 00:00:00	39
494	29	2026-05-22 00:00:00	38
495	29	2026-05-11 00:00:00	37
496	29	2026-05-08 00:00:00	36
497	29	2026-05-16 00:00:00	35
498	29	2026-05-06 00:00:00	34
499	29	2026-06-11 00:00:00	33
500	29	2026-05-14 00:00:00	32
501	29	2026-05-15 00:00:00	31
502	29	2026-06-04 00:00:00	30
503	29	2026-05-15 00:00:00	29
504	29	2026-05-24 00:00:00	28
505	29	2026-05-15 00:00:00	27
506	29	2026-05-19 00:00:00	26
507	29	2026-05-09 00:00:00	25
508	29	2026-06-06 00:00:00	24
509	29	2026-05-26 00:00:00	23
510	29	2026-06-08 00:00:00	22
511	29	2026-05-30 00:00:00	21
512	29	2026-05-17 00:00:00	20
513	29	2026-06-12 00:00:00	19
514	29	2026-05-31 00:00:00	18
515	29	2026-06-10 00:00:00	17
516	29	2026-05-10 00:00:00	16
517	29	2026-05-24 00:00:00	15
518	29	2026-06-02 00:00:00	14
519	29	2026-05-30 00:00:00	13
520	29	2026-05-30 00:00:00	12
521	29	2026-06-05 00:00:00	11
522	29	2026-05-10 00:00:00	10
523	29	2026-05-10 00:00:00	9
524	29	2026-06-01 00:00:00	8
525	29	2026-05-06 00:00:00	7
526	29	2026-06-10 00:00:00	6
527	29	2026-05-28 00:00:00	5
528	29	2026-05-31 00:00:00	4
529	29	2026-05-07 00:00:00	3
530	29	2026-06-11 00:00:00	2
531	29	2026-05-24 00:00:00	1
532	30	2026-05-27 00:00:00	80
533	30	2026-05-27 00:00:00	79
534	30	2026-06-03 00:00:00	78
535	30	2026-05-16 00:00:00	77
536	30	2026-06-01 00:00:00	76
537	30	2026-05-31 00:00:00	75
538	30	2026-05-28 00:00:00	74
539	30	2026-06-06 00:00:00	73
540	30	2026-06-10 00:00:00	72
541	30	2026-05-09 00:00:00	71
542	30	2026-05-06 00:00:00	70
543	30	2026-05-30 00:00:00	69
544	30	2026-06-11 00:00:00	68
545	30	2026-05-15 00:00:00	67
546	30	2026-05-10 00:00:00	66
547	30	2026-06-03 00:00:00	65
548	30	2026-05-07 00:00:00	64
549	30	2026-05-19 00:00:00	63
550	30	2026-05-19 00:00:00	62
551	30	2026-05-14 00:00:00	61
552	30	2026-05-12 00:00:00	60
553	30	2026-05-23 00:00:00	59
554	30	2026-05-23 00:00:00	58
555	30	2026-05-06 00:00:00	57
556	30	2026-05-07 00:00:00	56
557	30	2026-05-12 00:00:00	55
558	30	2026-05-27 00:00:00	54
559	30	2026-05-28 00:00:00	53
560	30	2026-05-17 00:00:00	52
561	30	2026-06-02 00:00:00	51
562	30	2026-06-05 00:00:00	50
563	30	2026-05-24 00:00:00	49
564	30	2026-05-29 00:00:00	48
565	30	2026-05-24 00:00:00	47
566	30	2026-06-12 00:00:00	46
567	30	2026-06-12 00:00:00	45
568	30	2026-06-12 00:00:00	44
569	30	2026-06-12 00:00:00	43
570	30	2026-06-02 00:00:00	42
571	30	2026-06-06 00:00:00	41
572	30	2026-06-05 00:00:00	40
573	30	2026-06-04 00:00:00	39
574	30	2026-05-06 00:00:00	38
575	30	2026-05-09 00:00:00	37
576	30	2026-05-20 00:00:00	36
577	30	2026-06-11 00:00:00	35
578	30	2026-05-31 00:00:00	34
579	30	2026-06-04 00:00:00	33
580	30	2026-06-09 00:00:00	32
581	30	2026-06-06 00:00:00	31
582	30	2026-05-21 00:00:00	30
583	30	2026-05-11 00:00:00	29
584	30	2026-06-01 00:00:00	28
585	30	2026-06-09 00:00:00	27
586	30	2026-06-01 00:00:00	26
587	30	2026-06-05 00:00:00	25
588	30	2026-06-02 00:00:00	24
589	30	2026-06-10 00:00:00	23
590	30	2026-05-21 00:00:00	22
591	30	2026-05-06 00:00:00	21
592	30	2026-06-02 00:00:00	20
593	30	2026-06-02 00:00:00	19
594	30	2026-05-10 00:00:00	18
595	30	2026-06-12 00:00:00	17
596	30	2026-05-29 00:00:00	16
597	30	2026-05-27 00:00:00	15
598	30	2026-05-15 00:00:00	14
599	30	2026-06-02 00:00:00	13
600	30	2026-05-26 00:00:00	12
601	30	2026-06-10 00:00:00	11
602	30	2026-05-09 00:00:00	10
603	30	2026-06-03 00:00:00	9
604	30	2026-05-31 00:00:00	8
605	30	2026-05-14 00:00:00	7
606	30	2026-05-22 00:00:00	6
607	30	2026-05-07 00:00:00	5
608	30	2026-06-06 00:00:00	4
609	30	2026-05-11 00:00:00	3
610	30	2026-05-18 00:00:00	2
611	30	2026-06-11 00:00:00	1
612	31	2026-06-01 00:00:00	80
613	31	2026-06-12 00:00:00	79
614	31	2026-06-09 00:00:00	78
615	31	2026-05-27 00:00:00	77
616	31	2026-05-21 00:00:00	76
617	31	2026-06-03 00:00:00	75
618	31	2026-05-25 00:00:00	74
619	31	2026-05-08 00:00:00	73
620	31	2026-06-09 00:00:00	72
621	31	2026-05-24 00:00:00	71
622	31	2026-06-11 00:00:00	70
623	31	2026-06-04 00:00:00	69
624	31	2026-05-27 00:00:00	68
625	31	2026-05-24 00:00:00	67
626	31	2026-06-10 00:00:00	66
627	31	2026-05-28 00:00:00	65
628	31	2026-05-31 00:00:00	64
629	31	2026-05-06 00:00:00	63
630	31	2026-05-17 00:00:00	62
631	31	2026-05-10 00:00:00	61
632	31	2026-05-22 00:00:00	60
633	31	2026-05-20 00:00:00	59
634	31	2026-05-14 00:00:00	58
635	31	2026-05-29 00:00:00	57
636	31	2026-06-04 00:00:00	56
637	31	2026-05-08 00:00:00	55
638	31	2026-06-12 00:00:00	54
639	31	2026-05-26 00:00:00	53
640	31	2026-05-31 00:00:00	52
641	31	2026-05-12 00:00:00	51
642	31	2026-05-25 00:00:00	50
643	31	2026-06-01 00:00:00	49
644	31	2026-05-17 00:00:00	48
645	31	2026-05-29 00:00:00	47
646	31	2026-05-27 00:00:00	46
647	31	2026-06-08 00:00:00	45
648	31	2026-05-30 00:00:00	44
649	31	2026-05-31 00:00:00	43
650	31	2026-06-04 00:00:00	42
651	31	2026-05-20 00:00:00	41
652	31	2026-05-26 00:00:00	40
653	31	2026-06-11 00:00:00	39
654	31	2026-05-31 00:00:00	38
655	31	2026-05-05 00:00:00	37
656	31	2026-06-09 00:00:00	36
657	31	2026-05-09 00:00:00	35
658	31	2026-05-21 00:00:00	34
659	31	2026-05-11 00:00:00	33
660	31	2026-05-14 00:00:00	32
661	31	2026-06-11 00:00:00	31
662	31	2026-05-18 00:00:00	30
663	31	2026-06-04 00:00:00	29
664	31	2026-05-27 00:00:00	28
665	31	2026-05-22 00:00:00	27
666	31	2026-05-19 00:00:00	26
667	31	2026-05-17 00:00:00	25
668	31	2026-05-12 00:00:00	24
669	31	2026-06-12 00:00:00	23
670	31	2026-05-10 00:00:00	22
671	31	2026-05-17 00:00:00	21
672	31	2026-06-11 00:00:00	20
673	31	2026-05-10 00:00:00	19
674	31	2026-05-30 00:00:00	18
675	31	2026-05-27 00:00:00	17
676	31	2026-05-31 00:00:00	16
677	31	2026-05-17 00:00:00	15
678	31	2026-05-26 00:00:00	14
679	31	2026-05-14 00:00:00	13
680	31	2026-05-05 00:00:00	12
681	31	2026-05-22 00:00:00	11
682	31	2026-06-08 00:00:00	10
683	31	2026-05-19 00:00:00	9
684	31	2026-05-31 00:00:00	8
685	31	2026-06-10 00:00:00	7
686	31	2026-06-03 00:00:00	6
687	31	2026-06-06 00:00:00	5
688	31	2026-06-02 00:00:00	4
689	31	2026-06-05 00:00:00	3
690	31	2026-05-07 00:00:00	2
691	31	2026-05-23 00:00:00	1
692	32	2026-05-14 00:00:00	80
693	32	2026-05-31 00:00:00	79
694	32	2026-05-31 00:00:00	78
695	32	2026-05-10 00:00:00	77
696	32	2026-06-12 00:00:00	76
697	32	2026-05-11 00:00:00	75
698	32	2026-06-08 00:00:00	74
699	32	2026-05-15 00:00:00	73
700	32	2026-05-26 00:00:00	72
701	32	2026-06-03 00:00:00	71
702	32	2026-05-28 00:00:00	70
703	32	2026-06-08 00:00:00	69
704	32	2026-05-06 00:00:00	68
705	32	2026-05-11 00:00:00	67
706	32	2026-05-12 00:00:00	66
707	32	2026-05-21 00:00:00	65
708	32	2026-05-14 00:00:00	64
709	32	2026-05-20 00:00:00	63
710	32	2026-05-21 00:00:00	62
711	32	2026-05-23 00:00:00	61
712	32	2026-06-09 00:00:00	60
713	32	2026-06-06 00:00:00	59
714	32	2026-06-05 00:00:00	58
715	32	2026-05-22 00:00:00	57
716	32	2026-06-08 00:00:00	56
717	32	2026-06-08 00:00:00	55
718	32	2026-05-28 00:00:00	54
719	32	2026-06-09 00:00:00	53
720	32	2026-05-20 00:00:00	52
721	32	2026-06-03 00:00:00	51
722	32	2026-06-06 00:00:00	50
723	32	2026-05-10 00:00:00	49
724	32	2026-05-31 00:00:00	48
725	32	2026-06-07 00:00:00	47
726	32	2026-05-16 00:00:00	46
727	32	2026-05-08 00:00:00	45
728	32	2026-05-13 00:00:00	44
729	32	2026-05-29 00:00:00	43
730	32	2026-05-09 00:00:00	42
731	32	2026-05-06 00:00:00	41
732	32	2026-05-22 00:00:00	40
733	32	2026-06-10 00:00:00	39
734	32	2026-06-10 00:00:00	38
735	32	2026-06-05 00:00:00	37
736	32	2026-05-12 00:00:00	36
737	32	2026-06-07 00:00:00	35
738	32	2026-05-31 00:00:00	34
739	32	2026-05-24 00:00:00	33
740	32	2026-06-01 00:00:00	32
741	32	2026-05-26 00:00:00	31
742	32	2026-06-08 00:00:00	30
743	32	2026-06-04 00:00:00	29
744	32	2026-05-08 00:00:00	28
745	32	2026-05-19 00:00:00	27
746	32	2026-05-06 00:00:00	26
747	32	2026-05-18 00:00:00	25
748	32	2026-06-06 00:00:00	24
749	32	2026-05-12 00:00:00	23
750	32	2026-06-04 00:00:00	22
751	32	2026-06-08 00:00:00	21
752	32	2026-05-11 00:00:00	20
753	32	2026-06-06 00:00:00	19
754	32	2026-05-24 00:00:00	18
755	32	2026-05-18 00:00:00	17
756	32	2026-05-29 00:00:00	16
757	32	2026-05-21 00:00:00	15
758	32	2026-06-06 00:00:00	14
759	32	2026-05-05 00:00:00	13
760	32	2026-05-21 00:00:00	12
761	32	2026-05-12 00:00:00	11
762	32	2026-05-06 00:00:00	10
763	32	2026-06-08 00:00:00	9
764	32	2026-05-26 00:00:00	8
765	32	2026-05-21 00:00:00	7
766	32	2026-05-24 00:00:00	6
767	32	2026-06-05 00:00:00	5
768	32	2026-06-05 00:00:00	4
769	32	2026-06-02 00:00:00	3
770	32	2026-06-06 00:00:00	2
771	32	2026-06-10 00:00:00	1
772	33	2026-05-06 00:00:00	80
773	33	2026-05-18 00:00:00	79
774	33	2026-06-02 00:00:00	78
775	33	2026-05-27 00:00:00	77
776	33	2026-05-19 00:00:00	76
777	33	2026-05-30 00:00:00	75
778	33	2026-06-06 00:00:00	74
779	33	2026-05-07 00:00:00	73
780	33	2026-05-17 00:00:00	72
781	33	2026-05-21 00:00:00	71
782	33	2026-05-18 00:00:00	70
783	33	2026-06-02 00:00:00	69
784	33	2026-05-16 00:00:00	68
785	33	2026-05-14 00:00:00	67
786	33	2026-05-10 00:00:00	66
787	33	2026-06-02 00:00:00	65
788	33	2026-06-12 00:00:00	64
789	33	2026-05-29 00:00:00	63
790	33	2026-05-20 00:00:00	62
791	33	2026-05-30 00:00:00	61
792	33	2026-05-12 00:00:00	60
793	33	2026-05-12 00:00:00	59
794	33	2026-06-11 00:00:00	58
795	33	2026-06-11 00:00:00	57
796	33	2026-05-29 00:00:00	56
797	33	2026-05-28 00:00:00	55
798	33	2026-05-05 00:00:00	54
799	33	2026-05-31 00:00:00	53
800	33	2026-06-02 00:00:00	52
801	33	2026-05-21 00:00:00	51
802	33	2026-05-10 00:00:00	50
803	33	2026-05-17 00:00:00	49
804	33	2026-05-17 00:00:00	48
805	33	2026-05-21 00:00:00	47
806	33	2026-05-11 00:00:00	46
807	33	2026-06-09 00:00:00	45
808	33	2026-05-21 00:00:00	44
809	33	2026-05-18 00:00:00	43
810	33	2026-05-10 00:00:00	42
811	33	2026-05-17 00:00:00	41
812	33	2026-05-23 00:00:00	40
813	33	2026-05-26 00:00:00	39
814	33	2026-06-10 00:00:00	38
815	33	2026-06-12 00:00:00	37
816	33	2026-05-23 00:00:00	36
817	33	2026-05-20 00:00:00	35
818	33	2026-06-06 00:00:00	34
819	33	2026-05-31 00:00:00	33
820	33	2026-05-30 00:00:00	32
821	33	2026-05-31 00:00:00	31
822	33	2026-05-28 00:00:00	30
823	33	2026-05-31 00:00:00	29
824	33	2026-06-09 00:00:00	28
825	33	2026-05-22 00:00:00	27
826	33	2026-05-07 00:00:00	26
827	33	2026-06-05 00:00:00	25
828	33	2026-05-31 00:00:00	24
829	33	2026-05-27 00:00:00	23
830	33	2026-05-10 00:00:00	22
831	33	2026-05-24 00:00:00	21
832	33	2026-05-17 00:00:00	20
833	33	2026-05-18 00:00:00	19
834	33	2026-06-11 00:00:00	18
835	33	2026-05-27 00:00:00	17
836	33	2026-05-27 00:00:00	16
837	33	2026-05-05 00:00:00	15
838	33	2026-05-06 00:00:00	14
839	33	2026-05-21 00:00:00	13
840	33	2026-05-06 00:00:00	12
841	33	2026-05-20 00:00:00	11
842	33	2026-05-12 00:00:00	10
843	33	2026-06-01 00:00:00	9
844	33	2026-05-31 00:00:00	8
845	33	2026-05-16 00:00:00	7
846	33	2026-06-01 00:00:00	6
847	33	2026-06-08 00:00:00	5
848	33	2026-06-08 00:00:00	4
849	33	2026-05-21 00:00:00	3
850	33	2026-05-14 00:00:00	2
851	33	2026-05-31 00:00:00	1
852	34	2026-06-10 00:00:00	80
853	34	2026-05-16 00:00:00	79
854	34	2026-06-10 00:00:00	78
855	34	2026-05-28 00:00:00	77
856	34	2026-05-28 00:00:00	76
857	34	2026-05-17 00:00:00	75
858	34	2026-05-08 00:00:00	74
859	34	2026-06-09 00:00:00	73
860	34	2026-05-16 00:00:00	72
861	34	2026-06-05 00:00:00	71
862	34	2026-05-24 00:00:00	70
863	34	2026-05-25 00:00:00	69
864	34	2026-05-22 00:00:00	68
865	34	2026-06-10 00:00:00	67
866	34	2026-05-05 00:00:00	66
867	34	2026-05-31 00:00:00	65
868	34	2026-05-14 00:00:00	64
869	34	2026-05-27 00:00:00	63
870	34	2026-06-03 00:00:00	62
871	34	2026-06-04 00:00:00	61
872	34	2026-06-02 00:00:00	60
873	34	2026-05-06 00:00:00	59
874	34	2026-06-09 00:00:00	58
875	34	2026-05-31 00:00:00	57
876	34	2026-06-10 00:00:00	56
877	34	2026-06-03 00:00:00	55
878	34	2026-05-22 00:00:00	54
879	34	2026-05-29 00:00:00	53
880	34	2026-05-13 00:00:00	52
881	34	2026-06-12 00:00:00	51
882	34	2026-06-03 00:00:00	50
883	34	2026-06-01 00:00:00	49
884	34	2026-06-12 00:00:00	48
885	34	2026-06-07 00:00:00	47
886	34	2026-05-05 00:00:00	46
887	34	2026-05-29 00:00:00	45
888	34	2026-06-10 00:00:00	44
889	34	2026-05-29 00:00:00	43
890	34	2026-05-23 00:00:00	42
891	34	2026-05-08 00:00:00	41
892	34	2026-05-15 00:00:00	40
893	34	2026-05-29 00:00:00	39
894	34	2026-05-26 00:00:00	38
895	34	2026-05-07 00:00:00	37
896	34	2026-05-27 00:00:00	36
897	34	2026-06-10 00:00:00	35
898	34	2026-06-02 00:00:00	34
899	34	2026-05-07 00:00:00	33
900	34	2026-05-13 00:00:00	32
901	34	2026-05-14 00:00:00	31
902	34	2026-05-08 00:00:00	30
903	34	2026-05-27 00:00:00	29
904	34	2026-06-07 00:00:00	28
905	34	2026-06-10 00:00:00	27
906	34	2026-06-06 00:00:00	26
907	34	2026-05-12 00:00:00	25
908	34	2026-05-12 00:00:00	24
909	34	2026-05-10 00:00:00	23
910	34	2026-05-23 00:00:00	22
911	34	2026-06-02 00:00:00	21
912	34	2026-05-18 00:00:00	20
913	34	2026-05-18 00:00:00	19
914	34	2026-05-29 00:00:00	18
915	34	2026-05-28 00:00:00	17
916	34	2026-05-25 00:00:00	16
917	34	2026-05-30 00:00:00	15
918	34	2026-05-06 00:00:00	14
919	34	2026-06-05 00:00:00	13
920	34	2026-05-08 00:00:00	12
921	34	2026-06-09 00:00:00	11
922	34	2026-05-14 00:00:00	10
923	34	2026-05-21 00:00:00	9
924	34	2026-05-31 00:00:00	8
925	34	2026-05-27 00:00:00	7
926	34	2026-05-21 00:00:00	6
927	34	2026-06-07 00:00:00	5
928	34	2026-05-13 00:00:00	4
929	34	2026-05-17 00:00:00	3
930	34	2026-05-13 00:00:00	2
931	34	2026-05-11 00:00:00	1
932	35	2026-10-18 00:00:00	79
933	35	2026-10-21 00:00:00	78
934	35	2026-10-22 00:00:00	76
935	35	2026-10-18 00:00:00	74
936	35	2026-10-25 00:00:00	72
937	35	2026-10-18 00:00:00	71
938	35	2026-10-19 00:00:00	70
939	35	2026-10-22 00:00:00	69
940	35	2026-10-18 00:00:00	61
941	35	2026-10-24 00:00:00	58
942	35	2026-10-23 00:00:00	57
943	35	2026-10-21 00:00:00	54
944	35	2026-10-25 00:00:00	53
945	35	2026-10-21 00:00:00	50
946	35	2026-10-18 00:00:00	49
947	35	2026-10-23 00:00:00	46
948	35	2026-10-20 00:00:00	45
949	35	2026-10-22 00:00:00	43
950	35	2026-10-25 00:00:00	42
951	35	2026-10-18 00:00:00	41
952	35	2026-10-22 00:00:00	40
953	35	2026-10-20 00:00:00	34
954	35	2026-10-21 00:00:00	33
955	35	2026-10-25 00:00:00	26
956	35	2026-10-18 00:00:00	25
957	35	2026-10-21 00:00:00	21
958	35	2026-10-18 00:00:00	20
959	35	2026-10-24 00:00:00	19
960	35	2026-10-24 00:00:00	16
961	35	2026-10-20 00:00:00	14
962	35	2026-10-20 00:00:00	13
963	35	2026-10-20 00:00:00	11
964	35	2026-10-18 00:00:00	9
965	35	2026-10-22 00:00:00	3
966	35	2026-10-20 00:00:00	2
967	36	2026-10-25 00:00:00	80
968	36	2026-10-18 00:00:00	79
969	36	2026-10-21 00:00:00	78
970	36	2026-10-20 00:00:00	77
971	36	2026-10-18 00:00:00	75
972	36	2026-10-24 00:00:00	68
973	36	2026-10-20 00:00:00	67
974	36	2026-10-23 00:00:00	64
975	36	2026-10-23 00:00:00	62
976	36	2026-10-20 00:00:00	61
977	36	2026-10-22 00:00:00	60
978	36	2026-10-23 00:00:00	57
979	36	2026-10-19 00:00:00	56
980	36	2026-10-20 00:00:00	52
981	36	2026-10-21 00:00:00	51
982	36	2026-10-21 00:00:00	50
983	36	2026-10-22 00:00:00	49
984	36	2026-10-24 00:00:00	48
985	36	2026-10-20 00:00:00	47
986	36	2026-10-19 00:00:00	45
987	36	2026-10-20 00:00:00	42
988	36	2026-10-19 00:00:00	38
989	36	2026-10-22 00:00:00	37
990	36	2026-10-24 00:00:00	34
991	36	2026-10-19 00:00:00	32
992	36	2026-10-19 00:00:00	27
993	36	2026-10-20 00:00:00	26
994	36	2026-10-22 00:00:00	23
995	36	2026-10-21 00:00:00	21
996	36	2026-10-20 00:00:00	20
997	36	2026-10-25 00:00:00	19
998	36	2026-10-18 00:00:00	17
999	36	2026-10-24 00:00:00	15
1000	36	2026-10-25 00:00:00	14
1001	36	2026-10-20 00:00:00	12
1002	36	2026-10-22 00:00:00	11
1003	36	2026-10-23 00:00:00	9
1004	36	2026-10-20 00:00:00	6
1005	36	2026-10-19 00:00:00	5
1006	36	2026-10-24 00:00:00	4
1007	36	2026-10-25 00:00:00	3
1008	36	2026-10-21 00:00:00	2
1009	37	2026-10-20 00:00:00	80
1010	37	2026-10-18 00:00:00	79
1011	37	2026-10-19 00:00:00	78
1012	37	2026-10-19 00:00:00	77
1013	37	2026-10-21 00:00:00	76
1014	37	2026-10-20 00:00:00	74
1015	37	2026-10-21 00:00:00	73
1016	37	2026-10-19 00:00:00	72
1017	37	2026-10-19 00:00:00	70
1018	37	2026-10-24 00:00:00	68
1019	37	2026-10-23 00:00:00	62
1020	37	2026-10-21 00:00:00	61
1021	37	2026-10-18 00:00:00	60
1022	37	2026-10-22 00:00:00	59
1023	37	2026-10-23 00:00:00	58
1024	37	2026-10-20 00:00:00	55
1025	37	2026-10-23 00:00:00	54
1026	37	2026-10-20 00:00:00	51
1027	37	2026-10-18 00:00:00	50
1028	37	2026-10-22 00:00:00	49
1029	37	2026-10-21 00:00:00	48
1030	37	2026-10-18 00:00:00	46
1031	37	2026-10-20 00:00:00	44
1032	37	2026-10-18 00:00:00	40
1033	37	2026-10-19 00:00:00	37
1034	37	2026-10-22 00:00:00	36
1035	37	2026-10-22 00:00:00	33
1036	37	2026-10-18 00:00:00	32
1037	37	2026-10-23 00:00:00	30
1038	37	2026-10-24 00:00:00	29
1039	37	2026-10-25 00:00:00	27
1040	37	2026-10-22 00:00:00	23
1041	37	2026-10-25 00:00:00	18
1042	37	2026-10-21 00:00:00	17
1043	37	2026-10-20 00:00:00	12
1044	37	2026-10-20 00:00:00	9
1045	37	2026-10-22 00:00:00	8
1046	37	2026-10-23 00:00:00	7
1047	37	2026-10-25 00:00:00	5
1048	38	2026-10-25 00:00:00	78
1049	38	2026-10-21 00:00:00	77
1050	38	2026-10-22 00:00:00	76
1051	38	2026-10-21 00:00:00	75
1052	38	2026-10-23 00:00:00	73
1053	38	2026-10-20 00:00:00	69
1054	38	2026-10-20 00:00:00	68
1055	38	2026-10-20 00:00:00	65
1056	38	2026-10-21 00:00:00	64
1057	38	2026-10-23 00:00:00	63
1058	38	2026-10-24 00:00:00	59
1059	38	2026-10-19 00:00:00	58
1060	38	2026-10-21 00:00:00	57
1061	38	2026-10-23 00:00:00	55
1062	38	2026-10-22 00:00:00	54
1063	38	2026-10-18 00:00:00	48
1064	38	2026-10-23 00:00:00	45
1065	38	2026-10-24 00:00:00	44
1066	38	2026-10-19 00:00:00	43
1067	38	2026-10-23 00:00:00	41
1068	38	2026-10-22 00:00:00	32
1069	38	2026-10-18 00:00:00	31
1070	38	2026-10-18 00:00:00	30
1071	38	2026-10-20 00:00:00	29
1072	38	2026-10-20 00:00:00	27
1073	38	2026-10-24 00:00:00	25
1074	38	2026-10-19 00:00:00	24
1075	38	2026-10-24 00:00:00	22
1076	38	2026-10-20 00:00:00	19
1077	38	2026-10-19 00:00:00	18
1078	38	2026-10-24 00:00:00	16
1079	38	2026-10-24 00:00:00	15
1080	38	2026-10-20 00:00:00	12
1081	38	2026-10-18 00:00:00	10
1082	38	2026-10-25 00:00:00	8
1083	38	2026-10-25 00:00:00	6
1084	38	2026-10-25 00:00:00	4
1085	38	2026-10-25 00:00:00	3
1086	38	2026-10-24 00:00:00	2
1087	38	2026-10-23 00:00:00	1
1088	39	2026-10-24 00:00:00	79
1089	39	2026-10-24 00:00:00	76
1090	39	2026-10-20 00:00:00	75
1091	39	2026-10-24 00:00:00	74
1092	39	2026-10-24 00:00:00	71
1093	39	2026-10-20 00:00:00	67
1094	39	2026-10-23 00:00:00	66
1095	39	2026-10-20 00:00:00	62
1096	39	2026-10-18 00:00:00	59
1097	39	2026-10-19 00:00:00	58
1098	39	2026-10-20 00:00:00	56
1099	39	2026-10-21 00:00:00	53
1100	39	2026-10-18 00:00:00	52
1101	39	2026-10-18 00:00:00	51
1102	39	2026-10-23 00:00:00	49
1103	39	2026-10-20 00:00:00	48
1104	39	2026-10-18 00:00:00	47
1105	39	2026-10-25 00:00:00	44
1106	39	2026-10-24 00:00:00	43
1107	39	2026-10-25 00:00:00	42
1108	39	2026-10-19 00:00:00	41
1109	39	2026-10-25 00:00:00	40
1110	39	2026-10-24 00:00:00	39
1111	39	2026-10-20 00:00:00	36
1112	39	2026-10-22 00:00:00	35
1113	39	2026-10-19 00:00:00	31
1114	39	2026-10-20 00:00:00	29
1115	39	2026-10-18 00:00:00	28
1116	39	2026-10-20 00:00:00	24
1117	39	2026-10-25 00:00:00	23
1118	39	2026-10-20 00:00:00	22
1119	39	2026-10-18 00:00:00	20
1120	39	2026-10-19 00:00:00	19
1121	39	2026-10-19 00:00:00	14
1122	39	2026-10-24 00:00:00	13
1123	39	2026-10-20 00:00:00	11
1124	39	2026-10-24 00:00:00	4
1125	39	2026-10-24 00:00:00	3
1126	40	2026-10-23 00:00:00	71
1127	40	2026-10-25 00:00:00	67
1128	40	2026-10-19 00:00:00	66
1129	40	2026-10-25 00:00:00	65
1130	40	2026-10-22 00:00:00	64
1131	40	2026-10-18 00:00:00	63
1132	40	2026-10-20 00:00:00	62
1133	40	2026-10-18 00:00:00	60
1134	40	2026-10-25 00:00:00	57
1135	40	2026-10-24 00:00:00	56
1136	40	2026-10-20 00:00:00	55
1137	40	2026-10-20 00:00:00	53
1138	40	2026-10-19 00:00:00	52
1139	40	2026-10-18 00:00:00	46
1140	40	2026-10-23 00:00:00	45
1141	40	2026-10-25 00:00:00	44
1142	40	2026-10-20 00:00:00	41
1143	40	2026-10-18 00:00:00	40
1144	40	2026-10-19 00:00:00	39
1145	40	2026-10-18 00:00:00	38
1146	40	2026-10-18 00:00:00	37
1147	40	2026-10-23 00:00:00	35
1148	40	2026-10-24 00:00:00	34
1149	40	2026-10-21 00:00:00	33
1150	40	2026-10-25 00:00:00	31
1151	40	2026-10-21 00:00:00	30
1152	40	2026-10-20 00:00:00	28
1153	40	2026-10-18 00:00:00	26
1154	40	2026-10-19 00:00:00	25
1155	40	2026-10-21 00:00:00	24
1156	40	2026-10-18 00:00:00	23
1157	40	2026-10-21 00:00:00	21
1158	40	2026-10-22 00:00:00	20
1159	40	2026-10-23 00:00:00	18
1160	40	2026-10-20 00:00:00	17
1161	40	2026-10-20 00:00:00	13
1162	40	2026-10-25 00:00:00	12
1163	40	2026-10-24 00:00:00	10
1164	40	2026-10-18 00:00:00	8
1165	40	2026-10-23 00:00:00	7
1166	40	2026-10-25 00:00:00	6
1167	40	2026-10-18 00:00:00	5
1168	40	2026-10-19 00:00:00	1
1169	41	2026-10-19 00:00:00	80
1170	41	2026-10-21 00:00:00	73
1171	41	2026-10-20 00:00:00	72
1172	41	2026-10-18 00:00:00	71
1173	41	2026-10-22 00:00:00	70
1174	41	2026-10-18 00:00:00	69
1175	41	2026-10-22 00:00:00	68
1176	41	2026-10-22 00:00:00	67
1177	41	2026-10-25 00:00:00	66
1178	41	2026-10-22 00:00:00	65
1179	41	2026-10-19 00:00:00	63
1180	41	2026-10-22 00:00:00	61
1181	41	2026-10-24 00:00:00	56
1182	41	2026-10-24 00:00:00	50
1183	41	2026-10-23 00:00:00	47
1184	41	2026-10-18 00:00:00	46
1185	41	2026-10-25 00:00:00	43
1186	41	2026-10-24 00:00:00	39
1187	41	2026-10-18 00:00:00	38
1188	41	2026-10-22 00:00:00	36
1189	41	2026-10-22 00:00:00	35
1190	41	2026-10-19 00:00:00	33
1191	41	2026-10-22 00:00:00	31
1192	41	2026-10-25 00:00:00	30
1193	41	2026-10-18 00:00:00	28
1194	41	2026-10-24 00:00:00	27
1195	41	2026-10-21 00:00:00	26
1196	41	2026-10-19 00:00:00	22
1197	41	2026-10-18 00:00:00	18
1198	41	2026-10-24 00:00:00	16
1199	41	2026-10-19 00:00:00	15
1200	41	2026-10-24 00:00:00	14
1201	41	2026-10-23 00:00:00	10
1202	41	2026-10-25 00:00:00	9
1203	41	2026-10-18 00:00:00	8
1204	41	2026-10-22 00:00:00	7
1205	41	2026-10-22 00:00:00	6
1206	41	2026-10-25 00:00:00	5
1207	41	2026-10-25 00:00:00	4
1208	41	2026-10-25 00:00:00	2
1209	41	2026-10-25 00:00:00	1
1210	42	2026-10-24 00:00:00	80
1211	42	2026-10-25 00:00:00	77
1212	42	2026-10-24 00:00:00	75
1213	42	2026-10-25 00:00:00	74
1214	42	2026-10-23 00:00:00	73
1215	42	2026-10-21 00:00:00	72
1216	42	2026-10-21 00:00:00	70
1217	42	2026-10-22 00:00:00	69
1218	42	2026-10-18 00:00:00	66
1219	42	2026-10-22 00:00:00	65
1220	42	2026-10-20 00:00:00	64
1221	42	2026-10-24 00:00:00	63
1222	42	2026-10-25 00:00:00	60
1223	42	2026-10-24 00:00:00	59
1224	42	2026-10-18 00:00:00	55
1225	42	2026-10-21 00:00:00	54
1226	42	2026-10-21 00:00:00	53
1227	42	2026-10-25 00:00:00	52
1228	42	2026-10-21 00:00:00	51
1229	42	2026-10-22 00:00:00	47
1230	42	2026-10-24 00:00:00	42
1231	42	2026-10-21 00:00:00	39
1232	42	2026-10-18 00:00:00	38
1233	42	2026-10-21 00:00:00	37
1234	42	2026-10-19 00:00:00	36
1235	42	2026-10-23 00:00:00	35
1236	42	2026-10-23 00:00:00	34
1237	42	2026-10-24 00:00:00	32
1238	42	2026-10-19 00:00:00	29
1239	42	2026-10-18 00:00:00	28
1240	42	2026-10-19 00:00:00	25
1241	42	2026-10-21 00:00:00	24
1242	42	2026-10-19 00:00:00	22
1243	42	2026-10-19 00:00:00	21
1244	42	2026-10-25 00:00:00	17
1245	42	2026-10-18 00:00:00	16
1246	42	2026-10-19 00:00:00	15
1247	42	2026-10-20 00:00:00	13
1248	42	2026-10-21 00:00:00	11
1249	42	2026-10-19 00:00:00	10
1250	42	2026-10-24 00:00:00	7
1251	42	2026-10-24 00:00:00	1
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
51	10000051	ELVIS TEK	CARDENAS RUIZ	elvis.cardenas51@estudiante.unicartagena.edu.co	ACTIVO	0222400051	FEMENINO	3134772446	Cartagena, Colombia	1	4	NORMAL	NO ESPECIFICA	1
52	10000052	ARMANDO	PAREDES SOLIS	armando.paredes52@estudiante.unicartagena.edu.co	ACTIVO	0222400052	FEMENINO	3107862181	Cartagena, Colombia	1	5	NORMAL	NO ESPECIFICA	1
53	10000053	YUSLEIDY DAYANA	MANGONES PERTUZ	yusleidy.mangones53@estudiante.unicartagena.edu.co	ACTIVO	0222400053	MASCULINO	3153266185	Cartagena, Colombia	1	3	NORMAL	NO ESPECIFICA	1
54	10000054	JHON JAIRO	MONTENEGRO PADILLA	jhon.montenegro54@estudiante.unicartagena.edu.co	ACTIVO	0222400054	FEMENINO	3137531410	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
55	10000055	BRAYAN STIVEN	PALOMINO ROZO	brayan.palomino55@estudiante.unicartagena.edu.co	ACTIVO	0222400055	MASCULINO	3122390912	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
56	10000056	YEISON DAVID	CARRENO HERNANDEZ	yeison.carreno56@estudiante.unicartagena.edu.co	ACTIVO	0222400056	FEMENINO	3141736503	Cartagena, Colombia	1	7	NORMAL	NO ESPECIFICA	1
57	10000057	USNAVY MARIA	RIBON CANTILLO	usnavy.ribon57@estudiante.unicartagena.edu.co	ACTIVO	0222400057	MASCULINO	3101529296	Cartagena, Colombia	1	5	NORMAL	NO ESPECIFICA	1
58	10000058	DEIBY YHOAN	QUINTERO BOSSA	deiby.quintero58@estudiante.unicartagena.edu.co	ACTIVO	0222400058	FEMENINO	3134655988	Cartagena, Colombia	1	6	NORMAL	NO ESPECIFICA	1
59	10000059	ZOILA ROSA	PRADO SIERRA	zoila.prado59@estudiante.unicartagena.edu.co	ACTIVO	0222400059	MASCULINO	3106450498	Cartagena, Colombia	1	4	NORMAL	NO ESPECIFICA	1
60	10000060	JUAN BAUTISTA	UPARELA MENA	juan.uparela60@estudiante.unicartagena.edu.co	ACTIVO	0222400060	FEMENINO	3148768493	Cartagena, Colombia	1	5	NORMAL	NO ESPECIFICA	1
61	10000061	SANDY	CALO DOMINGUEZ	sandy.calo61@estudiante.unicartagena.edu.co	ACTIVO	0222400061	FEMENINO	3113244143	Cartagena, Colombia	1	6	NORMAL	NO ESPECIFICA	1
62	10000062	ESTEBAN	QUITO MORELOS	esteban.quito62@estudiante.unicartagena.edu.co	ACTIVO	0222400062	FEMENINO	3151852168	Cartagena, Colombia	1	5	NORMAL	NO ESPECIFICA	1
63	10000063	MILEIDY CAROLINA	PERTUZ ANAYA	mileidy.pertuz63@estudiante.unicartagena.edu.co	ACTIVO	0222400063	FEMENINO	3113004640	Cartagena, Colombia	1	5	NORMAL	NO ESPECIFICA	1
64	10000064	WILSON YESID	SAMPEDRO AVILA	wilson.sampedro64@estudiante.unicartagena.edu.co	ACTIVO	0222400064	MASCULINO	3156313828	Cartagena, Colombia	1	9	NORMAL	NO ESPECIFICA	1
65	10000065	LEIDY JOHANA	MERCADO FONTALVO	leidy.mercado65@estudiante.unicartagena.edu.co	ACTIVO	0222400065	FEMENINO	3137174906	Cartagena, Colombia	1	7	NORMAL	NO ESPECIFICA	1
66	10000066	OTONIEL ANDRES	FERNANDEZ DE ARCO	otoniel.fernandez66@estudiante.unicartagena.edu.co	ACTIVO	0222400066	FEMENINO	3147667365	Cartagena, Colombia	1	3	NORMAL	NO ESPECIFICA	1
67	10000067	DUBIAN STIVE	BLANQUICETT ORTEGA	dubian.blanquicett67@estudiante.unicartagena.edu.co	ACTIVO	0222400067	MASCULINO	3153024374	Cartagena, Colombia	1	3	NORMAL	NO ESPECIFICA	1
68	10000068	YAJIRO	SITH MERCADO	yajiro.sith68@estudiante.unicartagena.edu.co	ACTIVO	0222400068	MASCULINO	3132031673	Cartagena, Colombia	1	9	NORMAL	NO ESPECIFICA	1
69	10000069	ANGIE PAOLA	CANTILLO FLOREZ	angie.cantillo69@estudiante.unicartagena.edu.co	ACTIVO	0222400069	FEMENINO	3146919123	Cartagena, Colombia	1	6	NORMAL	NO ESPECIFICA	1
70	10000070	ORLANDO ENRIQUE	TOLEDO MARTINEZ	orlando.toledo70@estudiante.unicartagena.edu.co	ACTIVO	0222400070	MASCULINO	3115568544	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
71	10000071	MARLON BRANDO	CARRILLO VEGA	marlon.carrillo71@estudiante.unicartagena.edu.co	ACTIVO	0222400071	FEMENINO	3152337703	Cartagena, Colombia	1	4	NORMAL	NO ESPECIFICA	1
72	10000072	PEDRO PABLO	PEREZ PEREZ	pedro.perez72@estudiante.unicartagena.edu.co	ACTIVO	0222400072	MASCULINO	3144447239	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
73	10000073	INGRID YOHANA	BARRIOS LOZANO	ingrid.barrios73@estudiante.unicartagena.edu.co	ACTIVO	0222400073	FEMENINO	3157995402	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
74	10000074	KEVIN JHOJAN	LACOUTURE RIOS	kevin.lacouture74@estudiante.unicartagena.edu.co	ACTIVO	0222400074	FEMENINO	3129105484	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
75	10000075	ROSALBA ENEIDA	TAMARA PICON	rosalba.tamara75@estudiante.unicartagena.edu.co	ACTIVO	0222400075	MASCULINO	3103020737	Cartagena, Colombia	1	6	NORMAL	NO ESPECIFICA	1
76	10000076	FULANITO	DE TAL MARTINEZ	fulanito.de76@estudiante.unicartagena.edu.co	ACTIVO	0222400076	FEMENINO	3119936397	Cartagena, Colombia	1	6	NORMAL	NO ESPECIFICA	1
77	10000077	BRAYAN MAICOL	ORTIZ CERCHIOLO	brayan.ortiz77@estudiante.unicartagena.edu.co	ACTIVO	0222400077	MASCULINO	3114490646	Cartagena, Colombia	1	5	NORMAL	NO ESPECIFICA	1
78	10000078	DAYANA CAROLINA	INSIGNARES OJEDA	dayana.insignares78@estudiante.unicartagena.edu.co	ACTIVO	0222400078	MASCULINO	3104796661	Cartagena, Colombia	1	7	NORMAL	NO ESPECIFICA	1
79	10000079	ROBERTO CARLOS	HINOJOSA PADRON	roberto.hinojosa79@estudiante.unicartagena.edu.co	ACTIVO	0222400079	MASCULINO	3151932082	Cartagena, Colombia	1	4	NORMAL	NO ESPECIFICA	1
80	10000080	CINDY LORENA	PADILLA ROSALES	cindy.padilla80@estudiante.unicartagena.edu.co	ACTIVO	0222400080	MASCULINO	3139751070	Cartagena, Colombia	1	5	NORMAL	NO ESPECIFICA	1
\.


--
-- Data for Name: evaluacion_docente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.evaluacion_docente (id, docente_id, asignatura_id, programa_id, grupo, periodo, estudiantes_esperados, estado, fecha_creacion) FROM stdin;
27	1	1	1	A1	2026-1	80	CERRADA	2026-02-10 00:00:00
28	2	4	1	A1	2026-1	80	CERRADA	2026-02-10 00:00:00
29	3	3	1	A1	2026-1	80	CERRADA	2026-02-10 00:00:00
30	4	6	1	A1	2026-1	80	CERRADA	2026-02-10 00:00:00
31	5	7	1	A1	2026-1	80	CERRADA	2026-02-10 00:00:00
32	6	8	1	A1	2026-1	80	CERRADA	2026-02-10 00:00:00
33	7	10	1	A1	2026-1	80	CERRADA	2026-02-10 00:00:00
34	8	9	1	A1	2026-1	80	CERRADA	2026-02-10 00:00:00
35	1	11	1	A1	2026-2	80	ABIERTA	2026-08-15 00:00:00
36	2	12	1	A1	2026-2	80	ABIERTA	2026-08-15 00:00:00
37	3	2	1	A1	2026-2	80	ABIERTA	2026-08-15 00:00:00
38	4	5	1	A1	2026-2	80	ABIERTA	2026-08-15 00:00:00
39	5	6	1	A1	2026-2	80	ABIERTA	2026-08-15 00:00:00
40	6	4	1	A1	2026-2	80	ABIERTA	2026-08-15 00:00:00
41	7	1	1	A1	2026-2	80	ABIERTA	2026-08-15 00:00:00
42	8	3	1	A1	2026-2	80	ABIERTA	2026-08-15 00:00:00
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
13	13	seis encuestas pendientes por estudiante	SQL	V13__seis_encuestas_pendientes_por_estudiante.sql	1182036846	academicore	2026-10-25 05:16:25.63861	515	t
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
681	28	1	2026-10-25 17:38:02.649322
682	28	2	2026-10-25 17:38:02.649322
683	28	3	2026-10-25 17:38:02.649322
684	28	4	2026-10-25 17:38:02.649322
685	28	5	2026-10-25 17:38:02.649322
686	28	6	2026-10-25 17:38:02.649322
687	28	7	2026-10-25 17:38:02.649322
688	28	8	2026-10-25 17:38:02.649322
689	28	9	2026-10-25 17:38:02.649322
690	28	10	2026-10-25 17:38:02.649322
691	28	11	2026-10-25 17:38:02.649322
692	28	12	2026-10-25 17:38:02.649322
693	28	13	2026-10-25 17:38:02.649322
694	28	14	2026-10-25 17:38:02.649322
695	28	15	2026-10-25 17:38:02.649322
696	28	16	2026-10-25 17:38:02.649322
697	28	17	2026-10-25 17:38:02.649322
698	28	18	2026-10-25 17:38:02.649322
699	28	19	2026-10-25 17:38:02.649322
700	28	20	2026-10-25 17:38:02.649322
701	28	21	2026-10-25 17:38:02.649322
702	28	22	2026-10-25 17:38:02.649322
703	28	23	2026-10-25 17:38:02.649322
704	28	24	2026-10-25 17:38:02.649322
705	28	25	2026-10-25 17:38:02.649322
706	28	26	2026-10-25 17:38:02.649322
707	28	27	2026-10-25 17:38:02.649322
708	28	28	2026-10-25 17:38:02.649322
709	28	29	2026-10-25 17:38:02.649322
710	28	30	2026-10-25 17:38:02.649322
711	28	31	2026-10-25 17:38:02.649322
712	28	32	2026-10-25 17:38:02.649322
713	28	33	2026-10-25 17:38:02.649322
714	28	34	2026-10-25 17:38:02.649322
715	28	35	2026-10-25 17:38:02.649322
716	28	36	2026-10-25 17:38:02.649322
717	28	37	2026-10-25 17:38:02.649322
718	28	38	2026-10-25 17:38:02.649322
719	28	39	2026-10-25 17:38:02.649322
720	28	40	2026-10-25 17:38:02.649322
721	28	41	2026-10-25 17:38:02.649322
722	28	42	2026-10-25 17:38:02.649322
723	28	43	2026-10-25 17:38:02.649322
724	28	44	2026-10-25 17:38:02.649322
725	28	45	2026-10-25 17:38:02.649322
726	28	46	2026-10-25 17:38:02.649322
727	28	47	2026-10-25 17:38:02.649322
728	28	48	2026-10-25 17:38:02.649322
729	28	49	2026-10-25 17:38:02.649322
730	28	50	2026-10-25 17:38:02.649322
731	28	51	2026-10-25 17:38:02.649322
732	28	52	2026-10-25 17:38:02.649322
733	28	53	2026-10-25 17:38:02.649322
734	28	54	2026-10-25 17:38:02.649322
735	28	55	2026-10-25 17:38:02.649322
736	28	56	2026-10-25 17:38:02.649322
737	28	57	2026-10-25 17:38:02.649322
738	28	58	2026-10-25 17:38:02.649322
739	28	59	2026-10-25 17:38:02.649322
740	28	60	2026-10-25 17:38:02.649322
741	28	61	2026-10-25 17:38:02.649322
742	28	62	2026-10-25 17:38:02.649322
743	28	63	2026-10-25 17:38:02.649322
744	28	64	2026-10-25 17:38:02.649322
745	28	65	2026-10-25 17:38:02.649322
746	28	66	2026-10-25 17:38:02.649322
747	28	67	2026-10-25 17:38:02.649322
748	28	68	2026-10-25 17:38:02.649322
749	28	69	2026-10-25 17:38:02.649322
750	28	70	2026-10-25 17:38:02.649322
751	28	71	2026-10-25 17:38:02.649322
752	28	72	2026-10-25 17:38:02.649322
753	28	73	2026-10-25 17:38:02.649322
754	28	74	2026-10-25 17:38:02.649322
755	28	75	2026-10-25 17:38:02.649322
756	28	76	2026-10-25 17:38:02.649322
757	28	77	2026-10-25 17:38:02.649322
758	28	78	2026-10-25 17:38:02.649322
759	28	79	2026-10-25 17:38:02.649322
760	28	80	2026-10-25 17:38:02.649322
761	29	1	2026-10-25 17:38:02.649322
762	29	2	2026-10-25 17:38:02.649322
763	29	3	2026-10-25 17:38:02.649322
764	29	4	2026-10-25 17:38:02.649322
765	29	5	2026-10-25 17:38:02.649322
766	29	6	2026-10-25 17:38:02.649322
767	29	7	2026-10-25 17:38:02.649322
768	29	8	2026-10-25 17:38:02.649322
769	29	9	2026-10-25 17:38:02.649322
770	29	10	2026-10-25 17:38:02.649322
771	29	11	2026-10-25 17:38:02.649322
772	29	12	2026-10-25 17:38:02.649322
773	29	13	2026-10-25 17:38:02.649322
774	29	14	2026-10-25 17:38:02.649322
775	29	15	2026-10-25 17:38:02.649322
776	29	16	2026-10-25 17:38:02.649322
777	29	17	2026-10-25 17:38:02.649322
778	29	18	2026-10-25 17:38:02.649322
779	29	19	2026-10-25 17:38:02.649322
780	29	20	2026-10-25 17:38:02.649322
781	29	21	2026-10-25 17:38:02.649322
782	29	22	2026-10-25 17:38:02.649322
783	29	23	2026-10-25 17:38:02.649322
784	29	24	2026-10-25 17:38:02.649322
785	29	25	2026-10-25 17:38:02.649322
786	29	26	2026-10-25 17:38:02.649322
787	29	27	2026-10-25 17:38:02.649322
788	29	28	2026-10-25 17:38:02.649322
789	29	29	2026-10-25 17:38:02.649322
790	29	30	2026-10-25 17:38:02.649322
791	29	31	2026-10-25 17:38:02.649322
792	29	32	2026-10-25 17:38:02.649322
793	29	33	2026-10-25 17:38:02.649322
794	29	34	2026-10-25 17:38:02.649322
795	29	35	2026-10-25 17:38:02.649322
796	29	36	2026-10-25 17:38:02.649322
797	29	37	2026-10-25 17:38:02.649322
798	29	38	2026-10-25 17:38:02.649322
799	29	39	2026-10-25 17:38:02.649322
800	29	40	2026-10-25 17:38:02.649322
801	29	41	2026-10-25 17:38:02.649322
802	29	42	2026-10-25 17:38:02.649322
803	29	43	2026-10-25 17:38:02.649322
804	29	44	2026-10-25 17:38:02.649322
805	29	45	2026-10-25 17:38:02.649322
806	29	46	2026-10-25 17:38:02.649322
807	29	47	2026-10-25 17:38:02.649322
808	29	48	2026-10-25 17:38:02.649322
809	29	49	2026-10-25 17:38:02.649322
810	29	50	2026-10-25 17:38:02.649322
811	29	51	2026-10-25 17:38:02.649322
812	29	52	2026-10-25 17:38:02.649322
813	29	53	2026-10-25 17:38:02.649322
814	29	54	2026-10-25 17:38:02.649322
815	29	55	2026-10-25 17:38:02.649322
816	29	56	2026-10-25 17:38:02.649322
817	29	57	2026-10-25 17:38:02.649322
818	29	58	2026-10-25 17:38:02.649322
819	29	59	2026-10-25 17:38:02.649322
820	29	60	2026-10-25 17:38:02.649322
821	29	61	2026-10-25 17:38:02.649322
822	29	62	2026-10-25 17:38:02.649322
823	29	63	2026-10-25 17:38:02.649322
824	29	64	2026-10-25 17:38:02.649322
825	29	65	2026-10-25 17:38:02.649322
826	29	66	2026-10-25 17:38:02.649322
827	29	67	2026-10-25 17:38:02.649322
828	29	68	2026-10-25 17:38:02.649322
829	29	69	2026-10-25 17:38:02.649322
830	29	70	2026-10-25 17:38:02.649322
831	29	71	2026-10-25 17:38:02.649322
832	29	72	2026-10-25 17:38:02.649322
833	29	73	2026-10-25 17:38:02.649322
834	29	74	2026-10-25 17:38:02.649322
835	29	75	2026-10-25 17:38:02.649322
836	29	76	2026-10-25 17:38:02.649322
837	29	77	2026-10-25 17:38:02.649322
838	29	78	2026-10-25 17:38:02.649322
839	29	79	2026-10-25 17:38:02.649322
840	29	80	2026-10-25 17:38:02.649322
841	30	1	2026-10-25 17:38:02.649322
842	30	2	2026-10-25 17:38:02.649322
843	30	3	2026-10-25 17:38:02.649322
844	30	4	2026-10-25 17:38:02.649322
845	30	5	2026-10-25 17:38:02.649322
846	30	6	2026-10-25 17:38:02.649322
847	30	7	2026-10-25 17:38:02.649322
848	30	8	2026-10-25 17:38:02.649322
849	30	9	2026-10-25 17:38:02.649322
850	30	10	2026-10-25 17:38:02.649322
851	30	11	2026-10-25 17:38:02.649322
852	30	12	2026-10-25 17:38:02.649322
853	30	13	2026-10-25 17:38:02.649322
854	30	14	2026-10-25 17:38:02.649322
855	30	15	2026-10-25 17:38:02.649322
856	30	16	2026-10-25 17:38:02.649322
857	30	17	2026-10-25 17:38:02.649322
858	30	18	2026-10-25 17:38:02.649322
859	30	19	2026-10-25 17:38:02.649322
860	30	20	2026-10-25 17:38:02.649322
601	27	1	2026-10-25 17:38:02.649322
602	27	2	2026-10-25 17:38:02.649322
603	27	3	2026-10-25 17:38:02.649322
604	27	4	2026-10-25 17:38:02.649322
605	27	5	2026-10-25 17:38:02.649322
606	27	6	2026-10-25 17:38:02.649322
607	27	7	2026-10-25 17:38:02.649322
608	27	8	2026-10-25 17:38:02.649322
609	27	9	2026-10-25 17:38:02.649322
610	27	10	2026-10-25 17:38:02.649322
611	27	11	2026-10-25 17:38:02.649322
612	27	12	2026-10-25 17:38:02.649322
613	27	13	2026-10-25 17:38:02.649322
614	27	14	2026-10-25 17:38:02.649322
615	27	15	2026-10-25 17:38:02.649322
616	27	16	2026-10-25 17:38:02.649322
617	27	17	2026-10-25 17:38:02.649322
618	27	18	2026-10-25 17:38:02.649322
619	27	19	2026-10-25 17:38:02.649322
620	27	20	2026-10-25 17:38:02.649322
621	27	21	2026-10-25 17:38:02.649322
622	27	22	2026-10-25 17:38:02.649322
623	27	23	2026-10-25 17:38:02.649322
624	27	24	2026-10-25 17:38:02.649322
625	27	25	2026-10-25 17:38:02.649322
626	27	26	2026-10-25 17:38:02.649322
627	27	27	2026-10-25 17:38:02.649322
628	27	28	2026-10-25 17:38:02.649322
629	27	29	2026-10-25 17:38:02.649322
630	27	30	2026-10-25 17:38:02.649322
631	27	31	2026-10-25 17:38:02.649322
632	27	32	2026-10-25 17:38:02.649322
633	27	33	2026-10-25 17:38:02.649322
634	27	34	2026-10-25 17:38:02.649322
635	27	35	2026-10-25 17:38:02.649322
636	27	36	2026-10-25 17:38:02.649322
637	27	37	2026-10-25 17:38:02.649322
638	27	38	2026-10-25 17:38:02.649322
639	27	39	2026-10-25 17:38:02.649322
640	27	40	2026-10-25 17:38:02.649322
641	27	41	2026-10-25 17:38:02.649322
642	27	42	2026-10-25 17:38:02.649322
643	27	43	2026-10-25 17:38:02.649322
644	27	44	2026-10-25 17:38:02.649322
645	27	45	2026-10-25 17:38:02.649322
646	27	46	2026-10-25 17:38:02.649322
647	27	47	2026-10-25 17:38:02.649322
648	27	48	2026-10-25 17:38:02.649322
649	27	49	2026-10-25 17:38:02.649322
650	27	50	2026-10-25 17:38:02.649322
651	27	51	2026-10-25 17:38:02.649322
652	27	52	2026-10-25 17:38:02.649322
653	27	53	2026-10-25 17:38:02.649322
654	27	54	2026-10-25 17:38:02.649322
655	27	55	2026-10-25 17:38:02.649322
656	27	56	2026-10-25 17:38:02.649322
657	27	57	2026-10-25 17:38:02.649322
658	27	58	2026-10-25 17:38:02.649322
659	27	59	2026-10-25 17:38:02.649322
660	27	60	2026-10-25 17:38:02.649322
661	27	61	2026-10-25 17:38:02.649322
662	27	62	2026-10-25 17:38:02.649322
663	27	63	2026-10-25 17:38:02.649322
664	27	64	2026-10-25 17:38:02.649322
665	27	65	2026-10-25 17:38:02.649322
666	27	66	2026-10-25 17:38:02.649322
667	27	67	2026-10-25 17:38:02.649322
668	27	68	2026-10-25 17:38:02.649322
669	27	69	2026-10-25 17:38:02.649322
670	27	70	2026-10-25 17:38:02.649322
671	27	71	2026-10-25 17:38:02.649322
672	27	72	2026-10-25 17:38:02.649322
673	27	73	2026-10-25 17:38:02.649322
674	27	74	2026-10-25 17:38:02.649322
675	27	75	2026-10-25 17:38:02.649322
676	27	76	2026-10-25 17:38:02.649322
677	27	77	2026-10-25 17:38:02.649322
678	27	78	2026-10-25 17:38:02.649322
679	27	79	2026-10-25 17:38:02.649322
680	27	80	2026-10-25 17:38:02.649322
861	30	21	2026-10-25 17:38:02.649322
862	30	22	2026-10-25 17:38:02.649322
863	30	23	2026-10-25 17:38:02.649322
864	30	24	2026-10-25 17:38:02.649322
865	30	25	2026-10-25 17:38:02.649322
866	30	26	2026-10-25 17:38:02.649322
867	30	27	2026-10-25 17:38:02.649322
868	30	28	2026-10-25 17:38:02.649322
869	30	29	2026-10-25 17:38:02.649322
870	30	30	2026-10-25 17:38:02.649322
871	30	31	2026-10-25 17:38:02.649322
872	30	32	2026-10-25 17:38:02.649322
873	30	33	2026-10-25 17:38:02.649322
874	30	34	2026-10-25 17:38:02.649322
875	30	35	2026-10-25 17:38:02.649322
876	30	36	2026-10-25 17:38:02.649322
877	30	37	2026-10-25 17:38:02.649322
878	30	38	2026-10-25 17:38:02.649322
879	30	39	2026-10-25 17:38:02.649322
880	30	40	2026-10-25 17:38:02.649322
881	30	41	2026-10-25 17:38:02.649322
882	30	42	2026-10-25 17:38:02.649322
883	30	43	2026-10-25 17:38:02.649322
884	30	44	2026-10-25 17:38:02.649322
885	30	45	2026-10-25 17:38:02.649322
886	30	46	2026-10-25 17:38:02.649322
887	30	47	2026-10-25 17:38:02.649322
888	30	48	2026-10-25 17:38:02.649322
889	30	49	2026-10-25 17:38:02.649322
890	30	50	2026-10-25 17:38:02.649322
891	30	51	2026-10-25 17:38:02.649322
892	30	52	2026-10-25 17:38:02.649322
893	30	53	2026-10-25 17:38:02.649322
894	30	54	2026-10-25 17:38:02.649322
895	30	55	2026-10-25 17:38:02.649322
896	30	56	2026-10-25 17:38:02.649322
897	30	57	2026-10-25 17:38:02.649322
898	30	58	2026-10-25 17:38:02.649322
899	30	59	2026-10-25 17:38:02.649322
900	30	60	2026-10-25 17:38:02.649322
901	30	61	2026-10-25 17:38:02.649322
902	30	62	2026-10-25 17:38:02.649322
903	30	63	2026-10-25 17:38:02.649322
904	30	64	2026-10-25 17:38:02.649322
905	30	65	2026-10-25 17:38:02.649322
906	30	66	2026-10-25 17:38:02.649322
907	30	67	2026-10-25 17:38:02.649322
908	30	68	2026-10-25 17:38:02.649322
909	30	69	2026-10-25 17:38:02.649322
910	30	70	2026-10-25 17:38:02.649322
911	30	71	2026-10-25 17:38:02.649322
912	30	72	2026-10-25 17:38:02.649322
913	30	73	2026-10-25 17:38:02.649322
914	30	74	2026-10-25 17:38:02.649322
915	30	75	2026-10-25 17:38:02.649322
916	30	76	2026-10-25 17:38:02.649322
917	30	77	2026-10-25 17:38:02.649322
918	30	78	2026-10-25 17:38:02.649322
919	30	79	2026-10-25 17:38:02.649322
920	30	80	2026-10-25 17:38:02.649322
921	31	1	2026-10-25 17:38:02.649322
922	31	2	2026-10-25 17:38:02.649322
923	31	3	2026-10-25 17:38:02.649322
924	31	4	2026-10-25 17:38:02.649322
925	31	5	2026-10-25 17:38:02.649322
926	31	6	2026-10-25 17:38:02.649322
927	31	7	2026-10-25 17:38:02.649322
928	31	8	2026-10-25 17:38:02.649322
929	31	9	2026-10-25 17:38:02.649322
930	31	10	2026-10-25 17:38:02.649322
931	31	11	2026-10-25 17:38:02.649322
932	31	12	2026-10-25 17:38:02.649322
933	31	13	2026-10-25 17:38:02.649322
934	31	14	2026-10-25 17:38:02.649322
935	31	15	2026-10-25 17:38:02.649322
936	31	16	2026-10-25 17:38:02.649322
937	31	17	2026-10-25 17:38:02.649322
938	31	18	2026-10-25 17:38:02.649322
939	31	19	2026-10-25 17:38:02.649322
940	31	20	2026-10-25 17:38:02.649322
941	31	21	2026-10-25 17:38:02.649322
942	31	22	2026-10-25 17:38:02.649322
943	31	23	2026-10-25 17:38:02.649322
944	31	24	2026-10-25 17:38:02.649322
945	31	25	2026-10-25 17:38:02.649322
946	31	26	2026-10-25 17:38:02.649322
947	31	27	2026-10-25 17:38:02.649322
948	31	28	2026-10-25 17:38:02.649322
949	31	29	2026-10-25 17:38:02.649322
950	31	30	2026-10-25 17:38:02.649322
951	31	31	2026-10-25 17:38:02.649322
952	31	32	2026-10-25 17:38:02.649322
953	31	33	2026-10-25 17:38:02.649322
954	31	34	2026-10-25 17:38:02.649322
955	31	35	2026-10-25 17:38:02.649322
956	31	36	2026-10-25 17:38:02.649322
957	31	37	2026-10-25 17:38:02.649322
958	31	38	2026-10-25 17:38:02.649322
959	31	39	2026-10-25 17:38:02.649322
960	31	40	2026-10-25 17:38:02.649322
961	31	41	2026-10-25 17:38:02.649322
962	31	42	2026-10-25 17:38:02.649322
963	31	43	2026-10-25 17:38:02.649322
964	31	44	2026-10-25 17:38:02.649322
965	31	45	2026-10-25 17:38:02.649322
966	31	46	2026-10-25 17:38:02.649322
967	31	47	2026-10-25 17:38:02.649322
968	31	48	2026-10-25 17:38:02.649322
969	31	49	2026-10-25 17:38:02.649322
970	31	50	2026-10-25 17:38:02.649322
971	31	51	2026-10-25 17:38:02.649322
972	31	52	2026-10-25 17:38:02.649322
973	31	53	2026-10-25 17:38:02.649322
974	31	54	2026-10-25 17:38:02.649322
975	31	55	2026-10-25 17:38:02.649322
976	31	56	2026-10-25 17:38:02.649322
977	31	57	2026-10-25 17:38:02.649322
978	31	58	2026-10-25 17:38:02.649322
979	31	59	2026-10-25 17:38:02.649322
980	31	60	2026-10-25 17:38:02.649322
981	31	61	2026-10-25 17:38:02.649322
982	31	62	2026-10-25 17:38:02.649322
983	31	63	2026-10-25 17:38:02.649322
984	31	64	2026-10-25 17:38:02.649322
985	31	65	2026-10-25 17:38:02.649322
986	31	66	2026-10-25 17:38:02.649322
987	31	67	2026-10-25 17:38:02.649322
988	31	68	2026-10-25 17:38:02.649322
989	31	69	2026-10-25 17:38:02.649322
990	31	70	2026-10-25 17:38:02.649322
991	31	71	2026-10-25 17:38:02.649322
992	31	72	2026-10-25 17:38:02.649322
993	31	73	2026-10-25 17:38:02.649322
994	31	74	2026-10-25 17:38:02.649322
995	31	75	2026-10-25 17:38:02.649322
996	31	76	2026-10-25 17:38:02.649322
997	31	77	2026-10-25 17:38:02.649322
998	31	78	2026-10-25 17:38:02.649322
999	31	79	2026-10-25 17:38:02.649322
1000	31	80	2026-10-25 17:38:02.649322
1001	32	1	2026-10-25 17:38:02.649322
1002	32	2	2026-10-25 17:38:02.649322
1003	32	3	2026-10-25 17:38:02.649322
1004	32	4	2026-10-25 17:38:02.649322
1005	32	5	2026-10-25 17:38:02.649322
1006	32	6	2026-10-25 17:38:02.649322
1007	32	7	2026-10-25 17:38:02.649322
1008	32	8	2026-10-25 17:38:02.649322
1009	32	9	2026-10-25 17:38:02.649322
1010	32	10	2026-10-25 17:38:02.649322
1011	32	11	2026-10-25 17:38:02.649322
1012	32	12	2026-10-25 17:38:02.649322
1013	32	13	2026-10-25 17:38:02.649322
1014	32	14	2026-10-25 17:38:02.649322
1015	32	15	2026-10-25 17:38:02.649322
1016	32	16	2026-10-25 17:38:02.649322
1017	32	17	2026-10-25 17:38:02.649322
1018	32	18	2026-10-25 17:38:02.649322
1019	32	19	2026-10-25 17:38:02.649322
1020	32	20	2026-10-25 17:38:02.649322
1021	32	21	2026-10-25 17:38:02.649322
1022	32	22	2026-10-25 17:38:02.649322
1023	32	23	2026-10-25 17:38:02.649322
1024	32	24	2026-10-25 17:38:02.649322
1025	32	25	2026-10-25 17:38:02.649322
1026	32	26	2026-10-25 17:38:02.649322
1027	32	27	2026-10-25 17:38:02.649322
1028	32	28	2026-10-25 17:38:02.649322
1029	32	29	2026-10-25 17:38:02.649322
1030	32	30	2026-10-25 17:38:02.649322
1031	32	31	2026-10-25 17:38:02.649322
1032	32	32	2026-10-25 17:38:02.649322
1033	32	33	2026-10-25 17:38:02.649322
1034	32	34	2026-10-25 17:38:02.649322
1035	32	35	2026-10-25 17:38:02.649322
1036	32	36	2026-10-25 17:38:02.649322
1037	32	37	2026-10-25 17:38:02.649322
1038	32	38	2026-10-25 17:38:02.649322
1039	32	39	2026-10-25 17:38:02.649322
1040	32	40	2026-10-25 17:38:02.649322
1041	32	41	2026-10-25 17:38:02.649322
1042	32	42	2026-10-25 17:38:02.649322
1043	32	43	2026-10-25 17:38:02.649322
1044	32	44	2026-10-25 17:38:02.649322
1045	32	45	2026-10-25 17:38:02.649322
1046	32	46	2026-10-25 17:38:02.649322
1047	32	47	2026-10-25 17:38:02.649322
1048	32	48	2026-10-25 17:38:02.649322
1049	32	49	2026-10-25 17:38:02.649322
1050	32	50	2026-10-25 17:38:02.649322
1051	32	51	2026-10-25 17:38:02.649322
1052	32	52	2026-10-25 17:38:02.649322
1053	32	53	2026-10-25 17:38:02.649322
1054	32	54	2026-10-25 17:38:02.649322
1055	32	55	2026-10-25 17:38:02.649322
1056	32	56	2026-10-25 17:38:02.649322
1057	32	57	2026-10-25 17:38:02.649322
1058	32	58	2026-10-25 17:38:02.649322
1059	32	59	2026-10-25 17:38:02.649322
1060	32	60	2026-10-25 17:38:02.649322
1061	32	61	2026-10-25 17:38:02.649322
1062	32	62	2026-10-25 17:38:02.649322
1063	32	63	2026-10-25 17:38:02.649322
1064	32	64	2026-10-25 17:38:02.649322
1065	32	65	2026-10-25 17:38:02.649322
1066	32	66	2026-10-25 17:38:02.649322
1067	32	67	2026-10-25 17:38:02.649322
1068	32	68	2026-10-25 17:38:02.649322
1069	32	69	2026-10-25 17:38:02.649322
1070	32	70	2026-10-25 17:38:02.649322
1071	32	71	2026-10-25 17:38:02.649322
1072	32	72	2026-10-25 17:38:02.649322
1073	32	73	2026-10-25 17:38:02.649322
1074	32	74	2026-10-25 17:38:02.649322
1075	32	75	2026-10-25 17:38:02.649322
1076	32	76	2026-10-25 17:38:02.649322
1077	32	77	2026-10-25 17:38:02.649322
1078	32	78	2026-10-25 17:38:02.649322
1079	32	79	2026-10-25 17:38:02.649322
1080	32	80	2026-10-25 17:38:02.649322
1081	33	1	2026-10-25 17:38:02.649322
1082	33	2	2026-10-25 17:38:02.649322
1083	33	3	2026-10-25 17:38:02.649322
1084	33	4	2026-10-25 17:38:02.649322
1085	33	5	2026-10-25 17:38:02.649322
1086	33	6	2026-10-25 17:38:02.649322
1087	33	7	2026-10-25 17:38:02.649322
1088	33	8	2026-10-25 17:38:02.649322
1089	33	9	2026-10-25 17:38:02.649322
1090	33	10	2026-10-25 17:38:02.649322
1091	33	11	2026-10-25 17:38:02.649322
1092	33	12	2026-10-25 17:38:02.649322
1093	33	13	2026-10-25 17:38:02.649322
1094	33	14	2026-10-25 17:38:02.649322
1095	33	15	2026-10-25 17:38:02.649322
1096	33	16	2026-10-25 17:38:02.649322
1097	33	17	2026-10-25 17:38:02.649322
1098	33	18	2026-10-25 17:38:02.649322
1099	33	19	2026-10-25 17:38:02.649322
1100	33	20	2026-10-25 17:38:02.649322
1101	33	21	2026-10-25 17:38:02.649322
1102	33	22	2026-10-25 17:38:02.649322
1103	33	23	2026-10-25 17:38:02.649322
1104	33	24	2026-10-25 17:38:02.649322
1105	33	25	2026-10-25 17:38:02.649322
1106	33	26	2026-10-25 17:38:02.649322
1107	33	27	2026-10-25 17:38:02.649322
1108	33	28	2026-10-25 17:38:02.649322
1109	33	29	2026-10-25 17:38:02.649322
1110	33	30	2026-10-25 17:38:02.649322
1111	33	31	2026-10-25 17:38:02.649322
1112	33	32	2026-10-25 17:38:02.649322
1113	33	33	2026-10-25 17:38:02.649322
1114	33	34	2026-10-25 17:38:02.649322
1115	33	35	2026-10-25 17:38:02.649322
1116	33	36	2026-10-25 17:38:02.649322
1117	33	37	2026-10-25 17:38:02.649322
1118	33	38	2026-10-25 17:38:02.649322
1119	33	39	2026-10-25 17:38:02.649322
1120	33	40	2026-10-25 17:38:02.649322
1121	33	41	2026-10-25 17:38:02.649322
1122	33	42	2026-10-25 17:38:02.649322
1123	33	43	2026-10-25 17:38:02.649322
1124	33	44	2026-10-25 17:38:02.649322
1125	33	45	2026-10-25 17:38:02.649322
1126	33	46	2026-10-25 17:38:02.649322
1127	33	47	2026-10-25 17:38:02.649322
1128	33	48	2026-10-25 17:38:02.649322
1129	33	49	2026-10-25 17:38:02.649322
1130	33	50	2026-10-25 17:38:02.649322
1131	33	51	2026-10-25 17:38:02.649322
1132	33	52	2026-10-25 17:38:02.649322
1133	33	53	2026-10-25 17:38:02.649322
1134	33	54	2026-10-25 17:38:02.649322
1135	33	55	2026-10-25 17:38:02.649322
1136	33	56	2026-10-25 17:38:02.649322
1137	33	57	2026-10-25 17:38:02.649322
1138	33	58	2026-10-25 17:38:02.649322
1139	33	59	2026-10-25 17:38:02.649322
1140	33	60	2026-10-25 17:38:02.649322
1141	33	61	2026-10-25 17:38:02.649322
1142	33	62	2026-10-25 17:38:02.649322
1143	33	63	2026-10-25 17:38:02.649322
1144	33	64	2026-10-25 17:38:02.649322
1145	33	65	2026-10-25 17:38:02.649322
1146	33	66	2026-10-25 17:38:02.649322
1147	33	67	2026-10-25 17:38:02.649322
1148	33	68	2026-10-25 17:38:02.649322
1149	33	69	2026-10-25 17:38:02.649322
1150	33	70	2026-10-25 17:38:02.649322
1151	33	71	2026-10-25 17:38:02.649322
1152	33	72	2026-10-25 17:38:02.649322
1153	33	73	2026-10-25 17:38:02.649322
1154	33	74	2026-10-25 17:38:02.649322
1155	33	75	2026-10-25 17:38:02.649322
1156	33	76	2026-10-25 17:38:02.649322
1157	33	77	2026-10-25 17:38:02.649322
1158	33	78	2026-10-25 17:38:02.649322
1159	33	79	2026-10-25 17:38:02.649322
1160	33	80	2026-10-25 17:38:02.649322
1161	34	1	2026-10-25 17:38:02.649322
1162	34	2	2026-10-25 17:38:02.649322
1163	34	3	2026-10-25 17:38:02.649322
1164	34	4	2026-10-25 17:38:02.649322
1165	34	5	2026-10-25 17:38:02.649322
1166	34	6	2026-10-25 17:38:02.649322
1167	34	7	2026-10-25 17:38:02.649322
1168	34	8	2026-10-25 17:38:02.649322
1169	34	9	2026-10-25 17:38:02.649322
1170	34	10	2026-10-25 17:38:02.649322
1171	34	11	2026-10-25 17:38:02.649322
1172	34	12	2026-10-25 17:38:02.649322
1173	34	13	2026-10-25 17:38:02.649322
1174	34	14	2026-10-25 17:38:02.649322
1175	34	15	2026-10-25 17:38:02.649322
1176	34	16	2026-10-25 17:38:02.649322
1177	34	17	2026-10-25 17:38:02.649322
1178	34	18	2026-10-25 17:38:02.649322
1179	34	19	2026-10-25 17:38:02.649322
1180	34	20	2026-10-25 17:38:02.649322
1181	34	21	2026-10-25 17:38:02.649322
1182	34	22	2026-10-25 17:38:02.649322
1183	34	23	2026-10-25 17:38:02.649322
1184	34	24	2026-10-25 17:38:02.649322
1185	34	25	2026-10-25 17:38:02.649322
1186	34	26	2026-10-25 17:38:02.649322
1187	34	27	2026-10-25 17:38:02.649322
1188	34	28	2026-10-25 17:38:02.649322
1189	34	29	2026-10-25 17:38:02.649322
1190	34	30	2026-10-25 17:38:02.649322
1191	34	31	2026-10-25 17:38:02.649322
1192	34	32	2026-10-25 17:38:02.649322
1193	34	33	2026-10-25 17:38:02.649322
1194	34	34	2026-10-25 17:38:02.649322
1195	34	35	2026-10-25 17:38:02.649322
1196	34	36	2026-10-25 17:38:02.649322
1197	34	37	2026-10-25 17:38:02.649322
1198	34	38	2026-10-25 17:38:02.649322
1199	34	39	2026-10-25 17:38:02.649322
1200	34	40	2026-10-25 17:38:02.649322
1201	34	41	2026-10-25 17:38:02.649322
1202	34	42	2026-10-25 17:38:02.649322
1203	34	43	2026-10-25 17:38:02.649322
1204	34	44	2026-10-25 17:38:02.649322
1205	34	45	2026-10-25 17:38:02.649322
1206	34	46	2026-10-25 17:38:02.649322
1207	34	47	2026-10-25 17:38:02.649322
1208	34	48	2026-10-25 17:38:02.649322
1209	34	49	2026-10-25 17:38:02.649322
1210	34	50	2026-10-25 17:38:02.649322
1211	34	51	2026-10-25 17:38:02.649322
1212	34	52	2026-10-25 17:38:02.649322
1213	34	53	2026-10-25 17:38:02.649322
1214	34	54	2026-10-25 17:38:02.649322
1215	34	55	2026-10-25 17:38:02.649322
1216	34	56	2026-10-25 17:38:02.649322
1217	34	57	2026-10-25 17:38:02.649322
1218	34	58	2026-10-25 17:38:02.649322
1219	34	59	2026-10-25 17:38:02.649322
1220	34	60	2026-10-25 17:38:02.649322
1221	34	61	2026-10-25 17:38:02.649322
1222	34	62	2026-10-25 17:38:02.649322
1223	34	63	2026-10-25 17:38:02.649322
1224	34	64	2026-10-25 17:38:02.649322
1225	34	65	2026-10-25 17:38:02.649322
1226	34	66	2026-10-25 17:38:02.649322
1227	34	67	2026-10-25 17:38:02.649322
1228	34	68	2026-10-25 17:38:02.649322
1229	34	69	2026-10-25 17:38:02.649322
1230	34	70	2026-10-25 17:38:02.649322
1231	34	71	2026-10-25 17:38:02.649322
1232	34	72	2026-10-25 17:38:02.649322
1233	34	73	2026-10-25 17:38:02.649322
1234	34	74	2026-10-25 17:38:02.649322
1235	34	75	2026-10-25 17:38:02.649322
1236	34	76	2026-10-25 17:38:02.649322
1237	34	77	2026-10-25 17:38:02.649322
1238	34	78	2026-10-25 17:38:02.649322
1239	34	79	2026-10-25 17:38:02.649322
1240	34	80	2026-10-25 17:38:02.649322
1241	35	1	2026-10-25 17:38:02.649322
1242	35	2	2026-10-25 17:38:02.649322
1243	35	3	2026-10-25 17:38:02.649322
1244	35	4	2026-10-25 17:38:02.649322
1245	35	5	2026-10-25 17:38:02.649322
1246	35	6	2026-10-25 17:38:02.649322
1247	35	7	2026-10-25 17:38:02.649322
1248	35	8	2026-10-25 17:38:02.649322
1249	35	9	2026-10-25 17:38:02.649322
1250	35	10	2026-10-25 17:38:02.649322
1251	35	11	2026-10-25 17:38:02.649322
1252	35	12	2026-10-25 17:38:02.649322
1253	35	13	2026-10-25 17:38:02.649322
1254	35	14	2026-10-25 17:38:02.649322
1255	35	15	2026-10-25 17:38:02.649322
1256	35	16	2026-10-25 17:38:02.649322
1257	35	17	2026-10-25 17:38:02.649322
1258	35	18	2026-10-25 17:38:02.649322
1259	35	19	2026-10-25 17:38:02.649322
1260	35	20	2026-10-25 17:38:02.649322
1261	35	21	2026-10-25 17:38:02.649322
1262	35	22	2026-10-25 17:38:02.649322
1263	35	23	2026-10-25 17:38:02.649322
1264	35	24	2026-10-25 17:38:02.649322
1265	35	25	2026-10-25 17:38:02.649322
1266	35	26	2026-10-25 17:38:02.649322
1267	35	27	2026-10-25 17:38:02.649322
1268	35	28	2026-10-25 17:38:02.649322
1269	35	29	2026-10-25 17:38:02.649322
1270	35	30	2026-10-25 17:38:02.649322
1271	35	31	2026-10-25 17:38:02.649322
1272	35	32	2026-10-25 17:38:02.649322
1273	35	33	2026-10-25 17:38:02.649322
1274	35	34	2026-10-25 17:38:02.649322
1275	35	35	2026-10-25 17:38:02.649322
1276	35	36	2026-10-25 17:38:02.649322
1277	35	37	2026-10-25 17:38:02.649322
1278	35	38	2026-10-25 17:38:02.649322
1279	35	39	2026-10-25 17:38:02.649322
1280	35	40	2026-10-25 17:38:02.649322
1281	35	41	2026-10-25 17:38:02.649322
1282	35	42	2026-10-25 17:38:02.649322
1283	35	43	2026-10-25 17:38:02.649322
1284	35	44	2026-10-25 17:38:02.649322
1285	35	45	2026-10-25 17:38:02.649322
1286	35	46	2026-10-25 17:38:02.649322
1287	35	47	2026-10-25 17:38:02.649322
1288	35	48	2026-10-25 17:38:02.649322
1289	35	49	2026-10-25 17:38:02.649322
1290	35	50	2026-10-25 17:38:02.649322
1291	35	51	2026-10-25 17:38:02.649322
1292	35	52	2026-10-25 17:38:02.649322
1293	35	53	2026-10-25 17:38:02.649322
1294	35	54	2026-10-25 17:38:02.649322
1295	35	55	2026-10-25 17:38:02.649322
1296	35	56	2026-10-25 17:38:02.649322
1297	35	57	2026-10-25 17:38:02.649322
1298	35	58	2026-10-25 17:38:02.649322
1299	35	59	2026-10-25 17:38:02.649322
1300	35	60	2026-10-25 17:38:02.649322
1301	35	61	2026-10-25 17:38:02.649322
1302	35	62	2026-10-25 17:38:02.649322
1303	35	63	2026-10-25 17:38:02.649322
1304	35	64	2026-10-25 17:38:02.649322
1305	35	65	2026-10-25 17:38:02.649322
1306	35	66	2026-10-25 17:38:02.649322
1307	35	67	2026-10-25 17:38:02.649322
1308	35	68	2026-10-25 17:38:02.649322
1309	35	69	2026-10-25 17:38:02.649322
1310	35	70	2026-10-25 17:38:02.649322
1311	35	71	2026-10-25 17:38:02.649322
1312	35	72	2026-10-25 17:38:02.649322
1313	35	73	2026-10-25 17:38:02.649322
1314	35	74	2026-10-25 17:38:02.649322
1315	35	75	2026-10-25 17:38:02.649322
1316	35	76	2026-10-25 17:38:02.649322
1317	35	77	2026-10-25 17:38:02.649322
1318	35	78	2026-10-25 17:38:02.649322
1319	35	79	2026-10-25 17:38:02.649322
1320	35	80	2026-10-25 17:38:02.649322
1321	36	1	2026-10-25 17:38:02.649322
1322	36	2	2026-10-25 17:38:02.649322
1323	36	3	2026-10-25 17:38:02.649322
1324	36	4	2026-10-25 17:38:02.649322
1325	36	5	2026-10-25 17:38:02.649322
1326	36	6	2026-10-25 17:38:02.649322
1327	36	7	2026-10-25 17:38:02.649322
1328	36	8	2026-10-25 17:38:02.649322
1329	36	9	2026-10-25 17:38:02.649322
1330	36	10	2026-10-25 17:38:02.649322
1331	36	11	2026-10-25 17:38:02.649322
1332	36	12	2026-10-25 17:38:02.649322
1333	36	13	2026-10-25 17:38:02.649322
1334	36	14	2026-10-25 17:38:02.649322
1335	36	15	2026-10-25 17:38:02.649322
1336	36	16	2026-10-25 17:38:02.649322
1337	36	17	2026-10-25 17:38:02.649322
1338	36	18	2026-10-25 17:38:02.649322
1339	36	19	2026-10-25 17:38:02.649322
1340	36	20	2026-10-25 17:38:02.649322
1341	36	21	2026-10-25 17:38:02.649322
1342	36	22	2026-10-25 17:38:02.649322
1343	36	23	2026-10-25 17:38:02.649322
1344	36	24	2026-10-25 17:38:02.649322
1345	36	25	2026-10-25 17:38:02.649322
1346	36	26	2026-10-25 17:38:02.649322
1347	36	27	2026-10-25 17:38:02.649322
1348	36	28	2026-10-25 17:38:02.649322
1349	36	29	2026-10-25 17:38:02.649322
1350	36	30	2026-10-25 17:38:02.649322
1351	36	31	2026-10-25 17:38:02.649322
1352	36	32	2026-10-25 17:38:02.649322
1353	36	33	2026-10-25 17:38:02.649322
1354	36	34	2026-10-25 17:38:02.649322
1355	36	35	2026-10-25 17:38:02.649322
1356	36	36	2026-10-25 17:38:02.649322
1357	36	37	2026-10-25 17:38:02.649322
1358	36	38	2026-10-25 17:38:02.649322
1359	36	39	2026-10-25 17:38:02.649322
1360	36	40	2026-10-25 17:38:02.649322
1361	36	41	2026-10-25 17:38:02.649322
1362	36	42	2026-10-25 17:38:02.649322
1363	36	43	2026-10-25 17:38:02.649322
1364	36	44	2026-10-25 17:38:02.649322
1365	36	45	2026-10-25 17:38:02.649322
1366	36	46	2026-10-25 17:38:02.649322
1367	36	47	2026-10-25 17:38:02.649322
1368	36	48	2026-10-25 17:38:02.649322
1369	36	49	2026-10-25 17:38:02.649322
1370	36	50	2026-10-25 17:38:02.649322
1371	36	51	2026-10-25 17:38:02.649322
1372	36	52	2026-10-25 17:38:02.649322
1373	36	53	2026-10-25 17:38:02.649322
1374	36	54	2026-10-25 17:38:02.649322
1375	36	55	2026-10-25 17:38:02.649322
1376	36	56	2026-10-25 17:38:02.649322
1377	36	57	2026-10-25 17:38:02.649322
1378	36	58	2026-10-25 17:38:02.649322
1379	36	59	2026-10-25 17:38:02.649322
1380	36	60	2026-10-25 17:38:02.649322
1381	36	61	2026-10-25 17:38:02.649322
1382	36	62	2026-10-25 17:38:02.649322
1383	36	63	2026-10-25 17:38:02.649322
1384	36	64	2026-10-25 17:38:02.649322
1385	36	65	2026-10-25 17:38:02.649322
1386	36	66	2026-10-25 17:38:02.649322
1387	36	67	2026-10-25 17:38:02.649322
1388	36	68	2026-10-25 17:38:02.649322
1389	36	69	2026-10-25 17:38:02.649322
1390	36	70	2026-10-25 17:38:02.649322
1391	36	71	2026-10-25 17:38:02.649322
1392	36	72	2026-10-25 17:38:02.649322
1393	36	73	2026-10-25 17:38:02.649322
1394	36	74	2026-10-25 17:38:02.649322
1395	36	75	2026-10-25 17:38:02.649322
1396	36	76	2026-10-25 17:38:02.649322
1397	36	77	2026-10-25 17:38:02.649322
1398	36	78	2026-10-25 17:38:02.649322
1399	36	79	2026-10-25 17:38:02.649322
1400	36	80	2026-10-25 17:38:02.649322
1401	37	1	2026-10-25 17:38:02.649322
1402	37	2	2026-10-25 17:38:02.649322
1403	37	3	2026-10-25 17:38:02.649322
1404	37	4	2026-10-25 17:38:02.649322
1405	37	5	2026-10-25 17:38:02.649322
1406	37	6	2026-10-25 17:38:02.649322
1407	37	7	2026-10-25 17:38:02.649322
1408	37	8	2026-10-25 17:38:02.649322
1409	37	9	2026-10-25 17:38:02.649322
1410	37	10	2026-10-25 17:38:02.649322
1411	37	11	2026-10-25 17:38:02.649322
1412	37	12	2026-10-25 17:38:02.649322
1413	37	13	2026-10-25 17:38:02.649322
1414	37	14	2026-10-25 17:38:02.649322
1415	37	15	2026-10-25 17:38:02.649322
1416	37	16	2026-10-25 17:38:02.649322
1417	37	17	2026-10-25 17:38:02.649322
1418	37	18	2026-10-25 17:38:02.649322
1419	37	19	2026-10-25 17:38:02.649322
1420	37	20	2026-10-25 17:38:02.649322
1421	37	21	2026-10-25 17:38:02.649322
1422	37	22	2026-10-25 17:38:02.649322
1423	37	23	2026-10-25 17:38:02.649322
1424	37	24	2026-10-25 17:38:02.649322
1425	37	25	2026-10-25 17:38:02.649322
1426	37	26	2026-10-25 17:38:02.649322
1427	37	27	2026-10-25 17:38:02.649322
1428	37	28	2026-10-25 17:38:02.649322
1429	37	29	2026-10-25 17:38:02.649322
1430	37	30	2026-10-25 17:38:02.649322
1431	37	31	2026-10-25 17:38:02.649322
1432	37	32	2026-10-25 17:38:02.649322
1433	37	33	2026-10-25 17:38:02.649322
1434	37	34	2026-10-25 17:38:02.649322
1435	37	35	2026-10-25 17:38:02.649322
1436	37	36	2026-10-25 17:38:02.649322
1437	37	37	2026-10-25 17:38:02.649322
1438	37	38	2026-10-25 17:38:02.649322
1439	37	39	2026-10-25 17:38:02.649322
1440	37	40	2026-10-25 17:38:02.649322
1441	37	41	2026-10-25 17:38:02.649322
1442	37	42	2026-10-25 17:38:02.649322
1443	37	43	2026-10-25 17:38:02.649322
1444	37	44	2026-10-25 17:38:02.649322
1445	37	45	2026-10-25 17:38:02.649322
1446	37	46	2026-10-25 17:38:02.649322
1447	37	47	2026-10-25 17:38:02.649322
1448	37	48	2026-10-25 17:38:02.649322
1449	37	49	2026-10-25 17:38:02.649322
1450	37	50	2026-10-25 17:38:02.649322
1451	37	51	2026-10-25 17:38:02.649322
1452	37	52	2026-10-25 17:38:02.649322
1453	37	53	2026-10-25 17:38:02.649322
1454	37	54	2026-10-25 17:38:02.649322
1455	37	55	2026-10-25 17:38:02.649322
1456	37	56	2026-10-25 17:38:02.649322
1457	37	57	2026-10-25 17:38:02.649322
1458	37	58	2026-10-25 17:38:02.649322
1459	37	59	2026-10-25 17:38:02.649322
1460	37	60	2026-10-25 17:38:02.649322
1461	37	61	2026-10-25 17:38:02.649322
1462	37	62	2026-10-25 17:38:02.649322
1463	37	63	2026-10-25 17:38:02.649322
1464	37	64	2026-10-25 17:38:02.649322
1465	37	65	2026-10-25 17:38:02.649322
1466	37	66	2026-10-25 17:38:02.649322
1467	37	67	2026-10-25 17:38:02.649322
1468	37	68	2026-10-25 17:38:02.649322
1469	37	69	2026-10-25 17:38:02.649322
1470	37	70	2026-10-25 17:38:02.649322
1471	37	71	2026-10-25 17:38:02.649322
1472	37	72	2026-10-25 17:38:02.649322
1473	37	73	2026-10-25 17:38:02.649322
1474	37	74	2026-10-25 17:38:02.649322
1475	37	75	2026-10-25 17:38:02.649322
1476	37	76	2026-10-25 17:38:02.649322
1477	37	77	2026-10-25 17:38:02.649322
1478	37	78	2026-10-25 17:38:02.649322
1479	37	79	2026-10-25 17:38:02.649322
1480	37	80	2026-10-25 17:38:02.649322
1481	38	1	2026-10-25 17:38:02.649322
1482	38	2	2026-10-25 17:38:02.649322
1483	38	3	2026-10-25 17:38:02.649322
1484	38	4	2026-10-25 17:38:02.649322
1485	38	5	2026-10-25 17:38:02.649322
1486	38	6	2026-10-25 17:38:02.649322
1487	38	7	2026-10-25 17:38:02.649322
1488	38	8	2026-10-25 17:38:02.649322
1489	38	9	2026-10-25 17:38:02.649322
1490	38	10	2026-10-25 17:38:02.649322
1491	38	11	2026-10-25 17:38:02.649322
1492	38	12	2026-10-25 17:38:02.649322
1493	38	13	2026-10-25 17:38:02.649322
1494	38	14	2026-10-25 17:38:02.649322
1495	38	15	2026-10-25 17:38:02.649322
1496	38	16	2026-10-25 17:38:02.649322
1497	38	17	2026-10-25 17:38:02.649322
1498	38	18	2026-10-25 17:38:02.649322
1499	38	19	2026-10-25 17:38:02.649322
1500	38	20	2026-10-25 17:38:02.649322
1501	38	21	2026-10-25 17:38:02.649322
1502	38	22	2026-10-25 17:38:02.649322
1503	38	23	2026-10-25 17:38:02.649322
1504	38	24	2026-10-25 17:38:02.649322
1505	38	25	2026-10-25 17:38:02.649322
1506	38	26	2026-10-25 17:38:02.649322
1507	38	27	2026-10-25 17:38:02.649322
1508	38	28	2026-10-25 17:38:02.649322
1509	38	29	2026-10-25 17:38:02.649322
1510	38	30	2026-10-25 17:38:02.649322
1511	38	31	2026-10-25 17:38:02.649322
1512	38	32	2026-10-25 17:38:02.649322
1513	38	33	2026-10-25 17:38:02.649322
1514	38	34	2026-10-25 17:38:02.649322
1515	38	35	2026-10-25 17:38:02.649322
1516	38	36	2026-10-25 17:38:02.649322
1517	38	37	2026-10-25 17:38:02.649322
1518	38	38	2026-10-25 17:38:02.649322
1519	38	39	2026-10-25 17:38:02.649322
1520	38	40	2026-10-25 17:38:02.649322
1521	38	41	2026-10-25 17:38:02.649322
1522	38	42	2026-10-25 17:38:02.649322
1523	38	43	2026-10-25 17:38:02.649322
1524	38	44	2026-10-25 17:38:02.649322
1525	38	45	2026-10-25 17:38:02.649322
1526	38	46	2026-10-25 17:38:02.649322
1527	38	47	2026-10-25 17:38:02.649322
1528	38	48	2026-10-25 17:38:02.649322
1529	38	49	2026-10-25 17:38:02.649322
1530	38	50	2026-10-25 17:38:02.649322
1531	38	51	2026-10-25 17:38:02.649322
1532	38	52	2026-10-25 17:38:02.649322
1533	38	53	2026-10-25 17:38:02.649322
1534	38	54	2026-10-25 17:38:02.649322
1535	38	55	2026-10-25 17:38:02.649322
1536	38	56	2026-10-25 17:38:02.649322
1537	38	57	2026-10-25 17:38:02.649322
1538	38	58	2026-10-25 17:38:02.649322
1539	38	59	2026-10-25 17:38:02.649322
1540	38	60	2026-10-25 17:38:02.649322
1541	38	61	2026-10-25 17:38:02.649322
1542	38	62	2026-10-25 17:38:02.649322
1543	38	63	2026-10-25 17:38:02.649322
1544	38	64	2026-10-25 17:38:02.649322
1545	38	65	2026-10-25 17:38:02.649322
1546	38	66	2026-10-25 17:38:02.649322
1547	38	67	2026-10-25 17:38:02.649322
1548	38	68	2026-10-25 17:38:02.649322
1549	38	69	2026-10-25 17:38:02.649322
1550	38	70	2026-10-25 17:38:02.649322
1551	38	71	2026-10-25 17:38:02.649322
1552	38	72	2026-10-25 17:38:02.649322
1553	38	73	2026-10-25 17:38:02.649322
1554	38	74	2026-10-25 17:38:02.649322
1555	38	75	2026-10-25 17:38:02.649322
1556	38	76	2026-10-25 17:38:02.649322
1557	38	77	2026-10-25 17:38:02.649322
1558	38	78	2026-10-25 17:38:02.649322
1559	38	79	2026-10-25 17:38:02.649322
1560	38	80	2026-10-25 17:38:02.649322
1561	39	1	2026-10-25 17:38:02.649322
1562	39	2	2026-10-25 17:38:02.649322
1563	39	3	2026-10-25 17:38:02.649322
1564	39	4	2026-10-25 17:38:02.649322
1565	39	5	2026-10-25 17:38:02.649322
1566	39	6	2026-10-25 17:38:02.649322
1567	39	7	2026-10-25 17:38:02.649322
1568	39	8	2026-10-25 17:38:02.649322
1569	39	9	2026-10-25 17:38:02.649322
1570	39	10	2026-10-25 17:38:02.649322
1571	39	11	2026-10-25 17:38:02.649322
1572	39	12	2026-10-25 17:38:02.649322
1573	39	13	2026-10-25 17:38:02.649322
1574	39	14	2026-10-25 17:38:02.649322
1575	39	15	2026-10-25 17:38:02.649322
1576	39	16	2026-10-25 17:38:02.649322
1577	39	17	2026-10-25 17:38:02.649322
1578	39	18	2026-10-25 17:38:02.649322
1579	39	19	2026-10-25 17:38:02.649322
1580	39	20	2026-10-25 17:38:02.649322
1581	39	21	2026-10-25 17:38:02.649322
1582	39	22	2026-10-25 17:38:02.649322
1583	39	23	2026-10-25 17:38:02.649322
1584	39	24	2026-10-25 17:38:02.649322
1585	39	25	2026-10-25 17:38:02.649322
1586	39	26	2026-10-25 17:38:02.649322
1587	39	27	2026-10-25 17:38:02.649322
1588	39	28	2026-10-25 17:38:02.649322
1589	39	29	2026-10-25 17:38:02.649322
1590	39	30	2026-10-25 17:38:02.649322
1591	39	31	2026-10-25 17:38:02.649322
1592	39	32	2026-10-25 17:38:02.649322
1593	39	33	2026-10-25 17:38:02.649322
1594	39	34	2026-10-25 17:38:02.649322
1595	39	35	2026-10-25 17:38:02.649322
1596	39	36	2026-10-25 17:38:02.649322
1597	39	37	2026-10-25 17:38:02.649322
1598	39	38	2026-10-25 17:38:02.649322
1599	39	39	2026-10-25 17:38:02.649322
1600	39	40	2026-10-25 17:38:02.649322
1601	39	41	2026-10-25 17:38:02.649322
1602	39	42	2026-10-25 17:38:02.649322
1603	39	43	2026-10-25 17:38:02.649322
1604	39	44	2026-10-25 17:38:02.649322
1605	39	45	2026-10-25 17:38:02.649322
1606	39	46	2026-10-25 17:38:02.649322
1607	39	47	2026-10-25 17:38:02.649322
1608	39	48	2026-10-25 17:38:02.649322
1609	39	49	2026-10-25 17:38:02.649322
1610	39	50	2026-10-25 17:38:02.649322
1611	39	51	2026-10-25 17:38:02.649322
1612	39	52	2026-10-25 17:38:02.649322
1613	39	53	2026-10-25 17:38:02.649322
1614	39	54	2026-10-25 17:38:02.649322
1615	39	55	2026-10-25 17:38:02.649322
1616	39	56	2026-10-25 17:38:02.649322
1617	39	57	2026-10-25 17:38:02.649322
1618	39	58	2026-10-25 17:38:02.649322
1619	39	59	2026-10-25 17:38:02.649322
1620	39	60	2026-10-25 17:38:02.649322
1621	39	61	2026-10-25 17:38:02.649322
1622	39	62	2026-10-25 17:38:02.649322
1623	39	63	2026-10-25 17:38:02.649322
1624	39	64	2026-10-25 17:38:02.649322
1625	39	65	2026-10-25 17:38:02.649322
1626	39	66	2026-10-25 17:38:02.649322
1627	39	67	2026-10-25 17:38:02.649322
1628	39	68	2026-10-25 17:38:02.649322
1629	39	69	2026-10-25 17:38:02.649322
1630	39	70	2026-10-25 17:38:02.649322
1631	39	71	2026-10-25 17:38:02.649322
1632	39	72	2026-10-25 17:38:02.649322
1633	39	73	2026-10-25 17:38:02.649322
1634	39	74	2026-10-25 17:38:02.649322
1635	39	75	2026-10-25 17:38:02.649322
1636	39	76	2026-10-25 17:38:02.649322
1637	39	77	2026-10-25 17:38:02.649322
1638	39	78	2026-10-25 17:38:02.649322
1639	39	79	2026-10-25 17:38:02.649322
1640	39	80	2026-10-25 17:38:02.649322
1641	40	1	2026-10-25 17:38:02.649322
1642	40	2	2026-10-25 17:38:02.649322
1643	40	3	2026-10-25 17:38:02.649322
1644	40	4	2026-10-25 17:38:02.649322
1645	40	5	2026-10-25 17:38:02.649322
1646	40	6	2026-10-25 17:38:02.649322
1647	40	7	2026-10-25 17:38:02.649322
1648	40	8	2026-10-25 17:38:02.649322
1649	40	9	2026-10-25 17:38:02.649322
1650	40	10	2026-10-25 17:38:02.649322
1651	40	11	2026-10-25 17:38:02.649322
1652	40	12	2026-10-25 17:38:02.649322
1653	40	13	2026-10-25 17:38:02.649322
1654	40	14	2026-10-25 17:38:02.649322
1655	40	15	2026-10-25 17:38:02.649322
1656	40	16	2026-10-25 17:38:02.649322
1657	40	17	2026-10-25 17:38:02.649322
1658	40	18	2026-10-25 17:38:02.649322
1659	40	19	2026-10-25 17:38:02.649322
1660	40	20	2026-10-25 17:38:02.649322
1661	40	21	2026-10-25 17:38:02.649322
1662	40	22	2026-10-25 17:38:02.649322
1663	40	23	2026-10-25 17:38:02.649322
1664	40	24	2026-10-25 17:38:02.649322
1665	40	25	2026-10-25 17:38:02.649322
1666	40	26	2026-10-25 17:38:02.649322
1667	40	27	2026-10-25 17:38:02.649322
1668	40	28	2026-10-25 17:38:02.649322
1669	40	29	2026-10-25 17:38:02.649322
1670	40	30	2026-10-25 17:38:02.649322
1671	40	31	2026-10-25 17:38:02.649322
1672	40	32	2026-10-25 17:38:02.649322
1673	40	33	2026-10-25 17:38:02.649322
1674	40	34	2026-10-25 17:38:02.649322
1675	40	35	2026-10-25 17:38:02.649322
1676	40	36	2026-10-25 17:38:02.649322
1677	40	37	2026-10-25 17:38:02.649322
1678	40	38	2026-10-25 17:38:02.649322
1679	40	39	2026-10-25 17:38:02.649322
1680	40	40	2026-10-25 17:38:02.649322
1681	40	41	2026-10-25 17:38:02.649322
1682	40	42	2026-10-25 17:38:02.649322
1683	40	43	2026-10-25 17:38:02.649322
1684	40	44	2026-10-25 17:38:02.649322
1685	40	45	2026-10-25 17:38:02.649322
1686	40	46	2026-10-25 17:38:02.649322
1687	40	47	2026-10-25 17:38:02.649322
1688	40	48	2026-10-25 17:38:02.649322
1689	40	49	2026-10-25 17:38:02.649322
1690	40	50	2026-10-25 17:38:02.649322
1691	40	51	2026-10-25 17:38:02.649322
1692	40	52	2026-10-25 17:38:02.649322
1693	40	53	2026-10-25 17:38:02.649322
1694	40	54	2026-10-25 17:38:02.649322
1695	40	55	2026-10-25 17:38:02.649322
1696	40	56	2026-10-25 17:38:02.649322
1697	40	57	2026-10-25 17:38:02.649322
1698	40	58	2026-10-25 17:38:02.649322
1699	40	59	2026-10-25 17:38:02.649322
1700	40	60	2026-10-25 17:38:02.649322
1701	40	61	2026-10-25 17:38:02.649322
1702	40	62	2026-10-25 17:38:02.649322
1703	40	63	2026-10-25 17:38:02.649322
1704	40	64	2026-10-25 17:38:02.649322
1705	40	65	2026-10-25 17:38:02.649322
1706	40	66	2026-10-25 17:38:02.649322
1707	40	67	2026-10-25 17:38:02.649322
1708	40	68	2026-10-25 17:38:02.649322
1709	40	69	2026-10-25 17:38:02.649322
1710	40	70	2026-10-25 17:38:02.649322
1711	40	71	2026-10-25 17:38:02.649322
1712	40	72	2026-10-25 17:38:02.649322
1713	40	73	2026-10-25 17:38:02.649322
1714	40	74	2026-10-25 17:38:02.649322
1715	40	75	2026-10-25 17:38:02.649322
1716	40	76	2026-10-25 17:38:02.649322
1717	40	77	2026-10-25 17:38:02.649322
1718	40	78	2026-10-25 17:38:02.649322
1719	40	79	2026-10-25 17:38:02.649322
1720	40	80	2026-10-25 17:38:02.649322
1721	41	1	2026-10-25 17:38:02.649322
1722	41	2	2026-10-25 17:38:02.649322
1723	41	3	2026-10-25 17:38:02.649322
1724	41	4	2026-10-25 17:38:02.649322
1725	41	5	2026-10-25 17:38:02.649322
1726	41	6	2026-10-25 17:38:02.649322
1727	41	7	2026-10-25 17:38:02.649322
1728	41	8	2026-10-25 17:38:02.649322
1729	41	9	2026-10-25 17:38:02.649322
1730	41	10	2026-10-25 17:38:02.649322
1731	41	11	2026-10-25 17:38:02.649322
1732	41	12	2026-10-25 17:38:02.649322
1733	41	13	2026-10-25 17:38:02.649322
1734	41	14	2026-10-25 17:38:02.649322
1735	41	15	2026-10-25 17:38:02.649322
1736	41	16	2026-10-25 17:38:02.649322
1737	41	17	2026-10-25 17:38:02.649322
1738	41	18	2026-10-25 17:38:02.649322
1739	41	19	2026-10-25 17:38:02.649322
1740	41	20	2026-10-25 17:38:02.649322
1741	41	21	2026-10-25 17:38:02.649322
1742	41	22	2026-10-25 17:38:02.649322
1743	41	23	2026-10-25 17:38:02.649322
1744	41	24	2026-10-25 17:38:02.649322
1745	41	25	2026-10-25 17:38:02.649322
1746	41	26	2026-10-25 17:38:02.649322
1747	41	27	2026-10-25 17:38:02.649322
1748	41	28	2026-10-25 17:38:02.649322
1749	41	29	2026-10-25 17:38:02.649322
1750	41	30	2026-10-25 17:38:02.649322
1751	41	31	2026-10-25 17:38:02.649322
1752	41	32	2026-10-25 17:38:02.649322
1753	41	33	2026-10-25 17:38:02.649322
1754	41	34	2026-10-25 17:38:02.649322
1755	41	35	2026-10-25 17:38:02.649322
1756	41	36	2026-10-25 17:38:02.649322
1757	41	37	2026-10-25 17:38:02.649322
1758	41	38	2026-10-25 17:38:02.649322
1759	41	39	2026-10-25 17:38:02.649322
1760	41	40	2026-10-25 17:38:02.649322
1761	41	41	2026-10-25 17:38:02.649322
1762	41	42	2026-10-25 17:38:02.649322
1763	41	43	2026-10-25 17:38:02.649322
1764	41	44	2026-10-25 17:38:02.649322
1765	41	45	2026-10-25 17:38:02.649322
1766	41	46	2026-10-25 17:38:02.649322
1767	41	47	2026-10-25 17:38:02.649322
1768	41	48	2026-10-25 17:38:02.649322
1769	41	49	2026-10-25 17:38:02.649322
1770	41	50	2026-10-25 17:38:02.649322
1771	41	51	2026-10-25 17:38:02.649322
1772	41	52	2026-10-25 17:38:02.649322
1773	41	53	2026-10-25 17:38:02.649322
1774	41	54	2026-10-25 17:38:02.649322
1775	41	55	2026-10-25 17:38:02.649322
1776	41	56	2026-10-25 17:38:02.649322
1777	41	57	2026-10-25 17:38:02.649322
1778	41	58	2026-10-25 17:38:02.649322
1779	41	59	2026-10-25 17:38:02.649322
1780	41	60	2026-10-25 17:38:02.649322
1781	41	61	2026-10-25 17:38:02.649322
1782	41	62	2026-10-25 17:38:02.649322
1783	41	63	2026-10-25 17:38:02.649322
1784	41	64	2026-10-25 17:38:02.649322
1785	41	65	2026-10-25 17:38:02.649322
1786	41	66	2026-10-25 17:38:02.649322
1787	41	67	2026-10-25 17:38:02.649322
1788	41	68	2026-10-25 17:38:02.649322
1789	41	69	2026-10-25 17:38:02.649322
1790	41	70	2026-10-25 17:38:02.649322
1791	41	71	2026-10-25 17:38:02.649322
1792	41	72	2026-10-25 17:38:02.649322
1793	41	73	2026-10-25 17:38:02.649322
1794	41	74	2026-10-25 17:38:02.649322
1795	41	75	2026-10-25 17:38:02.649322
1796	41	76	2026-10-25 17:38:02.649322
1797	41	77	2026-10-25 17:38:02.649322
1798	41	78	2026-10-25 17:38:02.649322
1799	41	79	2026-10-25 17:38:02.649322
1800	41	80	2026-10-25 17:38:02.649322
1801	42	1	2026-10-25 17:38:02.649322
1802	42	2	2026-10-25 17:38:02.649322
1803	42	3	2026-10-25 17:38:02.649322
1804	42	4	2026-10-25 17:38:02.649322
1805	42	5	2026-10-25 17:38:02.649322
1806	42	6	2026-10-25 17:38:02.649322
1807	42	7	2026-10-25 17:38:02.649322
1808	42	8	2026-10-25 17:38:02.649322
1809	42	9	2026-10-25 17:38:02.649322
1810	42	10	2026-10-25 17:38:02.649322
1811	42	11	2026-10-25 17:38:02.649322
1812	42	12	2026-10-25 17:38:02.649322
1813	42	13	2026-10-25 17:38:02.649322
1814	42	14	2026-10-25 17:38:02.649322
1815	42	15	2026-10-25 17:38:02.649322
1816	42	16	2026-10-25 17:38:02.649322
1817	42	17	2026-10-25 17:38:02.649322
1818	42	18	2026-10-25 17:38:02.649322
1819	42	19	2026-10-25 17:38:02.649322
1820	42	20	2026-10-25 17:38:02.649322
1821	42	21	2026-10-25 17:38:02.649322
1822	42	22	2026-10-25 17:38:02.649322
1823	42	23	2026-10-25 17:38:02.649322
1824	42	24	2026-10-25 17:38:02.649322
1825	42	25	2026-10-25 17:38:02.649322
1826	42	26	2026-10-25 17:38:02.649322
1827	42	27	2026-10-25 17:38:02.649322
1828	42	28	2026-10-25 17:38:02.649322
1829	42	29	2026-10-25 17:38:02.649322
1830	42	30	2026-10-25 17:38:02.649322
1831	42	31	2026-10-25 17:38:02.649322
1832	42	32	2026-10-25 17:38:02.649322
1833	42	33	2026-10-25 17:38:02.649322
1834	42	34	2026-10-25 17:38:02.649322
1835	42	35	2026-10-25 17:38:02.649322
1836	42	36	2026-10-25 17:38:02.649322
1837	42	37	2026-10-25 17:38:02.649322
1838	42	38	2026-10-25 17:38:02.649322
1839	42	39	2026-10-25 17:38:02.649322
1840	42	40	2026-10-25 17:38:02.649322
1841	42	41	2026-10-25 17:38:02.649322
1842	42	42	2026-10-25 17:38:02.649322
1843	42	43	2026-10-25 17:38:02.649322
1844	42	44	2026-10-25 17:38:02.649322
1845	42	45	2026-10-25 17:38:02.649322
1846	42	46	2026-10-25 17:38:02.649322
1847	42	47	2026-10-25 17:38:02.649322
1848	42	48	2026-10-25 17:38:02.649322
1849	42	49	2026-10-25 17:38:02.649322
1850	42	50	2026-10-25 17:38:02.649322
1851	42	51	2026-10-25 17:38:02.649322
1852	42	52	2026-10-25 17:38:02.649322
1853	42	53	2026-10-25 17:38:02.649322
1854	42	54	2026-10-25 17:38:02.649322
1855	42	55	2026-10-25 17:38:02.649322
1856	42	56	2026-10-25 17:38:02.649322
1857	42	57	2026-10-25 17:38:02.649322
1858	42	58	2026-10-25 17:38:02.649322
1859	42	59	2026-10-25 17:38:02.649322
1860	42	60	2026-10-25 17:38:02.649322
1861	42	61	2026-10-25 17:38:02.649322
1862	42	62	2026-10-25 17:38:02.649322
1863	42	63	2026-10-25 17:38:02.649322
1864	42	64	2026-10-25 17:38:02.649322
1865	42	65	2026-10-25 17:38:02.649322
1866	42	66	2026-10-25 17:38:02.649322
1867	42	67	2026-10-25 17:38:02.649322
1868	42	68	2026-10-25 17:38:02.649322
1869	42	69	2026-10-25 17:38:02.649322
1870	42	70	2026-10-25 17:38:02.649322
1871	42	71	2026-10-25 17:38:02.649322
1872	42	72	2026-10-25 17:38:02.649322
1873	42	73	2026-10-25 17:38:02.649322
1874	42	74	2026-10-25 17:38:02.649322
1875	42	75	2026-10-25 17:38:02.649322
1876	42	76	2026-10-25 17:38:02.649322
1877	42	77	2026-10-25 17:38:02.649322
1878	42	78	2026-10-25 17:38:02.649322
1879	42	79	2026-10-25 17:38:02.649322
1880	42	80	2026-10-25 17:38:02.649322
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
5632	371	18	3	\N	\N	\N	\N
5633	371	19	4	\N	\N	\N	\N
5634	371	20	4	\N	\N	\N	\N
5635	371	21	4	\N	\N	\N	\N
5636	371	22	4	\N	\N	\N	\N
5637	371	23	1	\N	\N	\N	\N
5638	371	24	3	\N	\N	\N	\N
5639	371	27	4	\N	\N	\N	\N
5640	371	28	3	\N	\N	\N	\N
5641	371	29	4	\N	\N	\N	\N
5642	371	30	4	\N	\N	\N	\N
5643	371	31	4	\N	\N	\N	\N
5644	371	32	4	\N	\N	\N	\N
5645	371	33	4	\N	\N	\N	\N
5646	371	34	3	\N	\N	\N	\N
5647	371	35	4	\N	\N	\N	\N
5648	371	36	2	\N	\N	\N	\N
5649	371	37	4	\N	\N	\N	\N
5650	371	38	3	\N	\N	\N	\N
5788	364	29	4	\N	\N	\N	\N
5789	364	30	2	\N	\N	\N	\N
5651	371	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.874	MODELO
5790	364	31	4	\N	\N	\N	\N
5652	371	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.746	MODELO
5653	370	18	4	\N	\N	\N	\N
5654	370	19	4	\N	\N	\N	\N
5655	370	20	4	\N	\N	\N	\N
5656	370	21	4	\N	\N	\N	\N
5657	370	22	4	\N	\N	\N	\N
5658	370	23	4	\N	\N	\N	\N
5659	370	24	4	\N	\N	\N	\N
5660	370	27	2	\N	\N	\N	\N
5661	370	28	3	\N	\N	\N	\N
5662	370	29	4	\N	\N	\N	\N
5663	370	30	4	\N	\N	\N	\N
5664	370	31	4	\N	\N	\N	\N
5665	370	32	4	\N	\N	\N	\N
5666	370	33	4	\N	\N	\N	\N
5667	370	34	4	\N	\N	\N	\N
5668	370	35	3	\N	\N	\N	\N
5669	370	36	3	\N	\N	\N	\N
5670	370	37	4	\N	\N	\N	\N
5671	370	38	3	\N	\N	\N	\N
5791	364	32	4	\N	\N	\N	\N
5672	370	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.891	MODELO
5792	364	33	4	\N	\N	\N	\N
5793	364	34	4	\N	\N	\N	\N
5673	370	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.815	MODELO
5674	369	18	4	\N	\N	\N	\N
5675	369	19	4	\N	\N	\N	\N
5676	369	20	4	\N	\N	\N	\N
5677	369	21	4	\N	\N	\N	\N
5678	369	22	4	\N	\N	\N	\N
5679	369	23	3	\N	\N	\N	\N
5680	369	24	4	\N	\N	\N	\N
5681	369	27	4	\N	\N	\N	\N
5682	369	28	4	\N	\N	\N	\N
5683	369	29	4	\N	\N	\N	\N
5684	369	30	4	\N	\N	\N	\N
5685	369	31	3	\N	\N	\N	\N
5686	369	32	4	\N	\N	\N	\N
5687	369	33	4	\N	\N	\N	\N
5688	369	34	3	\N	\N	\N	\N
5689	369	35	4	\N	\N	\N	\N
5690	369	36	4	\N	\N	\N	\N
5691	369	37	3	\N	\N	\N	\N
5692	369	38	3	\N	\N	\N	\N
5693	369	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.725	MODELO
5694	369	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.804	MODELO
5695	368	18	1	\N	\N	\N	\N
5696	368	19	4	\N	\N	\N	\N
5697	368	20	4	\N	\N	\N	\N
5698	368	21	4	\N	\N	\N	\N
5699	368	22	4	\N	\N	\N	\N
5700	368	23	2	\N	\N	\N	\N
5701	368	24	3	\N	\N	\N	\N
5702	368	27	4	\N	\N	\N	\N
5703	368	28	3	\N	\N	\N	\N
5704	368	29	3	\N	\N	\N	\N
5705	368	30	3	\N	\N	\N	\N
5706	368	31	4	\N	\N	\N	\N
5707	368	32	4	\N	\N	\N	\N
5708	368	33	3	\N	\N	\N	\N
5709	368	34	4	\N	\N	\N	\N
5710	368	35	2	\N	\N	\N	\N
5711	368	36	4	\N	\N	\N	\N
5712	368	37	4	\N	\N	\N	\N
5713	368	38	3	\N	\N	\N	\N
5714	368	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.931	MODELO
5715	368	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.907	MODELO
5716	367	18	4	\N	\N	\N	\N
5717	367	19	2	\N	\N	\N	\N
5718	367	20	4	\N	\N	\N	\N
5719	367	21	4	\N	\N	\N	\N
5720	367	22	4	\N	\N	\N	\N
5721	367	23	4	\N	\N	\N	\N
5722	367	24	4	\N	\N	\N	\N
5723	367	27	3	\N	\N	\N	\N
5724	367	28	3	\N	\N	\N	\N
5725	367	29	3	\N	\N	\N	\N
5726	367	30	4	\N	\N	\N	\N
5727	367	31	4	\N	\N	\N	\N
5728	367	32	3	\N	\N	\N	\N
5729	367	33	4	\N	\N	\N	\N
5730	367	34	4	\N	\N	\N	\N
5731	367	35	2	\N	\N	\N	\N
5732	367	36	1	\N	\N	\N	\N
5733	367	37	4	\N	\N	\N	\N
5734	367	38	3	\N	\N	\N	\N
5735	367	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.731	MODELO
5736	367	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.847	MODELO
5737	366	18	4	\N	\N	\N	\N
5738	366	19	4	\N	\N	\N	\N
5739	366	20	4	\N	\N	\N	\N
5740	366	21	4	\N	\N	\N	\N
5741	366	22	4	\N	\N	\N	\N
5742	366	23	3	\N	\N	\N	\N
5743	366	24	4	\N	\N	\N	\N
5744	366	27	4	\N	\N	\N	\N
5745	366	28	4	\N	\N	\N	\N
5746	366	29	4	\N	\N	\N	\N
5747	366	30	4	\N	\N	\N	\N
5748	366	31	4	\N	\N	\N	\N
5749	366	32	3	\N	\N	\N	\N
5750	366	33	3	\N	\N	\N	\N
5751	366	34	4	\N	\N	\N	\N
5752	366	35	3	\N	\N	\N	\N
5753	366	36	4	\N	\N	\N	\N
5754	366	37	4	\N	\N	\N	\N
5755	366	38	4	\N	\N	\N	\N
5756	366	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.874	MODELO
5757	366	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.88	MODELO
5758	365	18	4	\N	\N	\N	\N
5759	365	19	3	\N	\N	\N	\N
5760	365	20	1	\N	\N	\N	\N
5761	365	21	4	\N	\N	\N	\N
5762	365	22	3	\N	\N	\N	\N
5763	365	23	4	\N	\N	\N	\N
5764	365	24	4	\N	\N	\N	\N
5765	365	27	3	\N	\N	\N	\N
5766	365	28	4	\N	\N	\N	\N
5767	365	29	3	\N	\N	\N	\N
5768	365	30	3	\N	\N	\N	\N
5769	365	31	4	\N	\N	\N	\N
5770	365	32	4	\N	\N	\N	\N
5771	365	33	4	\N	\N	\N	\N
5772	365	34	4	\N	\N	\N	\N
5773	365	35	4	\N	\N	\N	\N
5774	365	36	4	\N	\N	\N	\N
5775	365	37	4	\N	\N	\N	\N
5776	365	38	4	\N	\N	\N	\N
5777	365	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.889	MODELO
5778	365	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.898	MODELO
5779	364	18	4	\N	\N	\N	\N
5780	364	19	4	\N	\N	\N	\N
5781	364	20	3	\N	\N	\N	\N
5782	364	21	4	\N	\N	\N	\N
5783	364	22	4	\N	\N	\N	\N
5784	364	23	4	\N	\N	\N	\N
5785	364	24	4	\N	\N	\N	\N
5786	364	27	4	\N	\N	\N	\N
5787	364	28	3	\N	\N	\N	\N
5794	364	35	3	\N	\N	\N	\N
5795	364	36	3	\N	\N	\N	\N
5796	364	37	4	\N	\N	\N	\N
5797	364	38	4	\N	\N	\N	\N
5798	364	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.876	MODELO
5799	364	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.737	MODELO
5800	363	18	4	\N	\N	\N	\N
5801	363	19	1	\N	\N	\N	\N
5802	363	20	2	\N	\N	\N	\N
5803	363	21	4	\N	\N	\N	\N
5804	363	22	4	\N	\N	\N	\N
5805	363	23	4	\N	\N	\N	\N
5806	363	24	4	\N	\N	\N	\N
5807	363	27	2	\N	\N	\N	\N
5808	363	28	4	\N	\N	\N	\N
5809	363	29	4	\N	\N	\N	\N
5810	363	30	3	\N	\N	\N	\N
5811	363	31	4	\N	\N	\N	\N
5812	363	32	2	\N	\N	\N	\N
5813	363	33	4	\N	\N	\N	\N
5814	363	34	3	\N	\N	\N	\N
5815	363	35	4	\N	\N	\N	\N
5816	363	36	4	\N	\N	\N	\N
5817	363	37	4	\N	\N	\N	\N
5818	363	38	4	\N	\N	\N	\N
5819	363	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.736	MODELO
5820	363	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.873	MODELO
5821	362	18	4	\N	\N	\N	\N
5822	362	19	4	\N	\N	\N	\N
5823	362	20	3	\N	\N	\N	\N
5824	362	21	4	\N	\N	\N	\N
5825	362	22	4	\N	\N	\N	\N
5826	362	23	3	\N	\N	\N	\N
5827	362	24	3	\N	\N	\N	\N
5828	362	27	4	\N	\N	\N	\N
5829	362	28	4	\N	\N	\N	\N
5830	362	29	3	\N	\N	\N	\N
5831	362	30	3	\N	\N	\N	\N
5832	362	31	4	\N	\N	\N	\N
5833	362	32	4	\N	\N	\N	\N
5834	362	33	3	\N	\N	\N	\N
5835	362	34	4	\N	\N	\N	\N
5836	362	35	4	\N	\N	\N	\N
5837	362	36	4	\N	\N	\N	\N
5838	362	37	3	\N	\N	\N	\N
5839	362	38	3	\N	\N	\N	\N
5840	362	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.706	MODELO
5841	362	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.734	MODELO
5842	361	18	3	\N	\N	\N	\N
5843	361	19	4	\N	\N	\N	\N
5844	361	20	4	\N	\N	\N	\N
5845	361	21	4	\N	\N	\N	\N
5846	361	22	3	\N	\N	\N	\N
5847	361	23	4	\N	\N	\N	\N
5848	361	24	3	\N	\N	\N	\N
5849	361	27	3	\N	\N	\N	\N
5850	361	28	4	\N	\N	\N	\N
5851	361	29	4	\N	\N	\N	\N
5852	361	30	3	\N	\N	\N	\N
5853	361	31	4	\N	\N	\N	\N
5854	361	32	4	\N	\N	\N	\N
5855	361	33	4	\N	\N	\N	\N
5856	361	34	4	\N	\N	\N	\N
5857	361	35	4	\N	\N	\N	\N
5858	361	36	3	\N	\N	\N	\N
5859	361	37	4	\N	\N	\N	\N
5860	361	38	4	\N	\N	\N	\N
5861	361	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.861	MODELO
5862	361	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.728	MODELO
5863	360	18	3	\N	\N	\N	\N
5864	360	19	3	\N	\N	\N	\N
5865	360	20	4	\N	\N	\N	\N
5866	360	21	4	\N	\N	\N	\N
5867	360	22	4	\N	\N	\N	\N
5868	360	23	2	\N	\N	\N	\N
5869	360	24	4	\N	\N	\N	\N
5870	360	27	4	\N	\N	\N	\N
5871	360	28	4	\N	\N	\N	\N
5872	360	29	4	\N	\N	\N	\N
5873	360	30	3	\N	\N	\N	\N
5874	360	31	4	\N	\N	\N	\N
5875	360	32	2	\N	\N	\N	\N
5876	360	33	1	\N	\N	\N	\N
5877	360	34	4	\N	\N	\N	\N
5878	360	35	4	\N	\N	\N	\N
5879	360	36	4	\N	\N	\N	\N
5880	360	37	4	\N	\N	\N	\N
5881	360	38	4	\N	\N	\N	\N
5882	360	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.91	MODELO
5883	360	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.684	MODELO
5884	359	18	4	\N	\N	\N	\N
5885	359	19	4	\N	\N	\N	\N
5886	359	20	1	\N	\N	\N	\N
5887	359	21	4	\N	\N	\N	\N
5888	359	22	4	\N	\N	\N	\N
5889	359	23	2	\N	\N	\N	\N
5890	359	24	2	\N	\N	\N	\N
5891	359	27	3	\N	\N	\N	\N
5892	359	28	4	\N	\N	\N	\N
5893	359	29	4	\N	\N	\N	\N
5894	359	30	4	\N	\N	\N	\N
5895	359	31	4	\N	\N	\N	\N
5896	359	32	3	\N	\N	\N	\N
5897	359	33	4	\N	\N	\N	\N
5898	359	34	4	\N	\N	\N	\N
5899	359	35	4	\N	\N	\N	\N
5900	359	36	4	\N	\N	\N	\N
5901	359	37	4	\N	\N	\N	\N
5902	359	38	2	\N	\N	\N	\N
5903	359	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.984	MODELO
5904	359	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.801	MODELO
5905	358	18	3	\N	\N	\N	\N
5906	358	19	2	\N	\N	\N	\N
5907	358	20	4	\N	\N	\N	\N
5908	358	21	4	\N	\N	\N	\N
5909	358	22	4	\N	\N	\N	\N
5910	358	23	4	\N	\N	\N	\N
5911	358	24	4	\N	\N	\N	\N
5912	358	27	4	\N	\N	\N	\N
5913	358	28	4	\N	\N	\N	\N
5914	358	29	4	\N	\N	\N	\N
5915	358	30	4	\N	\N	\N	\N
5916	358	31	3	\N	\N	\N	\N
5917	358	32	4	\N	\N	\N	\N
5918	358	33	3	\N	\N	\N	\N
5919	358	34	3	\N	\N	\N	\N
5920	358	35	4	\N	\N	\N	\N
5921	358	36	4	\N	\N	\N	\N
5922	358	37	1	\N	\N	\N	\N
5923	358	38	4	\N	\N	\N	\N
5924	358	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.835	MODELO
5925	358	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.625	MODELO
5926	357	18	4	\N	\N	\N	\N
5927	357	19	4	\N	\N	\N	\N
5928	357	20	4	\N	\N	\N	\N
5929	357	21	4	\N	\N	\N	\N
5930	357	22	4	\N	\N	\N	\N
5931	357	23	4	\N	\N	\N	\N
5932	357	24	4	\N	\N	\N	\N
5933	357	27	1	\N	\N	\N	\N
5934	357	28	1	\N	\N	\N	\N
5935	357	29	4	\N	\N	\N	\N
5936	357	30	4	\N	\N	\N	\N
5937	357	31	4	\N	\N	\N	\N
5938	357	32	4	\N	\N	\N	\N
5939	357	33	4	\N	\N	\N	\N
5940	357	34	4	\N	\N	\N	\N
5941	357	35	4	\N	\N	\N	\N
5942	357	36	4	\N	\N	\N	\N
5943	357	37	3	\N	\N	\N	\N
5944	357	38	4	\N	\N	\N	\N
5945	357	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.537	MODELO
5946	357	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.847	MODELO
5947	356	18	4	\N	\N	\N	\N
5948	356	19	4	\N	\N	\N	\N
5949	356	20	4	\N	\N	\N	\N
5950	356	21	4	\N	\N	\N	\N
5951	356	22	2	\N	\N	\N	\N
5952	356	23	4	\N	\N	\N	\N
5953	356	24	3	\N	\N	\N	\N
5954	356	27	4	\N	\N	\N	\N
5955	356	28	4	\N	\N	\N	\N
5956	356	29	4	\N	\N	\N	\N
5957	356	30	4	\N	\N	\N	\N
5958	356	31	4	\N	\N	\N	\N
5959	356	32	4	\N	\N	\N	\N
5960	356	33	4	\N	\N	\N	\N
5961	356	34	4	\N	\N	\N	\N
5962	356	35	4	\N	\N	\N	\N
5963	356	36	4	\N	\N	\N	\N
5964	356	37	3	\N	\N	\N	\N
5965	356	38	4	\N	\N	\N	\N
5966	356	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.719	MODELO
5967	356	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.504	MODELO
5968	355	18	4	\N	\N	\N	\N
5969	355	19	4	\N	\N	\N	\N
5970	355	20	4	\N	\N	\N	\N
5971	355	21	3	\N	\N	\N	\N
5972	355	22	4	\N	\N	\N	\N
5973	355	23	3	\N	\N	\N	\N
5974	355	24	1	\N	\N	\N	\N
5975	355	27	4	\N	\N	\N	\N
5976	355	28	3	\N	\N	\N	\N
5977	355	29	4	\N	\N	\N	\N
5978	355	30	4	\N	\N	\N	\N
5979	355	31	1	\N	\N	\N	\N
5980	355	32	4	\N	\N	\N	\N
5981	355	33	4	\N	\N	\N	\N
5982	355	34	3	\N	\N	\N	\N
5983	355	35	3	\N	\N	\N	\N
5984	355	36	3	\N	\N	\N	\N
5985	355	37	2	\N	\N	\N	\N
5986	355	38	4	\N	\N	\N	\N
5987	355	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.971	MODELO
5988	355	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.733	MODELO
5989	354	18	4	\N	\N	\N	\N
5990	354	19	3	\N	\N	\N	\N
5991	354	20	3	\N	\N	\N	\N
5992	354	21	3	\N	\N	\N	\N
5993	354	22	3	\N	\N	\N	\N
5994	354	23	4	\N	\N	\N	\N
5995	354	24	3	\N	\N	\N	\N
5996	354	27	4	\N	\N	\N	\N
5997	354	28	4	\N	\N	\N	\N
5998	354	29	3	\N	\N	\N	\N
5999	354	30	4	\N	\N	\N	\N
6000	354	31	4	\N	\N	\N	\N
6001	354	32	4	\N	\N	\N	\N
6002	354	33	3	\N	\N	\N	\N
6003	354	34	4	\N	\N	\N	\N
6004	354	35	3	\N	\N	\N	\N
6005	354	36	2	\N	\N	\N	\N
6006	354	37	4	\N	\N	\N	\N
6007	354	38	2	\N	\N	\N	\N
6008	354	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.929	MODELO
6009	354	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.902	MODELO
6010	353	18	2	\N	\N	\N	\N
6011	353	19	4	\N	\N	\N	\N
6012	353	20	4	\N	\N	\N	\N
6013	353	21	4	\N	\N	\N	\N
6014	353	22	4	\N	\N	\N	\N
6015	353	23	4	\N	\N	\N	\N
6016	353	24	4	\N	\N	\N	\N
6017	353	27	1	\N	\N	\N	\N
6018	353	28	3	\N	\N	\N	\N
6019	353	29	3	\N	\N	\N	\N
6020	353	30	4	\N	\N	\N	\N
6021	353	31	4	\N	\N	\N	\N
6022	353	32	1	\N	\N	\N	\N
6023	353	33	4	\N	\N	\N	\N
6024	353	34	4	\N	\N	\N	\N
6025	353	35	4	\N	\N	\N	\N
6026	353	36	4	\N	\N	\N	\N
6027	353	37	4	\N	\N	\N	\N
6028	353	38	3	\N	\N	\N	\N
6144	347	28	4	\N	\N	\N	\N
6145	347	29	4	\N	\N	\N	\N
6029	353	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.78	MODELO
6030	353	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.904	MODELO
6031	352	18	4	\N	\N	\N	\N
6032	352	19	4	\N	\N	\N	\N
6033	352	20	1	\N	\N	\N	\N
6034	352	21	4	\N	\N	\N	\N
6035	352	22	2	\N	\N	\N	\N
6036	352	23	4	\N	\N	\N	\N
6037	352	24	4	\N	\N	\N	\N
6038	352	27	4	\N	\N	\N	\N
6039	352	28	4	\N	\N	\N	\N
6040	352	29	4	\N	\N	\N	\N
6041	352	30	4	\N	\N	\N	\N
6042	352	31	4	\N	\N	\N	\N
6043	352	32	4	\N	\N	\N	\N
6044	352	33	3	\N	\N	\N	\N
6045	352	34	4	\N	\N	\N	\N
6046	352	35	4	\N	\N	\N	\N
6047	352	36	4	\N	\N	\N	\N
6048	352	37	2	\N	\N	\N	\N
6049	352	38	4	\N	\N	\N	\N
6050	352	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.823	MODELO
6051	352	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.763	MODELO
6052	351	18	4	\N	\N	\N	\N
6053	351	19	4	\N	\N	\N	\N
6054	351	20	4	\N	\N	\N	\N
6055	351	21	4	\N	\N	\N	\N
6056	351	22	4	\N	\N	\N	\N
6057	351	23	4	\N	\N	\N	\N
6058	351	24	4	\N	\N	\N	\N
6059	351	27	3	\N	\N	\N	\N
6060	351	28	3	\N	\N	\N	\N
6061	351	29	4	\N	\N	\N	\N
6062	351	30	4	\N	\N	\N	\N
6063	351	31	4	\N	\N	\N	\N
6064	351	32	1	\N	\N	\N	\N
6065	351	33	4	\N	\N	\N	\N
6066	351	34	3	\N	\N	\N	\N
6067	351	35	4	\N	\N	\N	\N
6068	351	36	4	\N	\N	\N	\N
6069	351	37	4	\N	\N	\N	\N
6070	351	38	4	\N	\N	\N	\N
6071	351	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.87	MODELO
6072	351	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.529	MODELO
6073	350	18	4	\N	\N	\N	\N
6074	350	19	4	\N	\N	\N	\N
6075	350	20	4	\N	\N	\N	\N
6076	350	21	3	\N	\N	\N	\N
6077	350	22	4	\N	\N	\N	\N
6078	350	23	4	\N	\N	\N	\N
6079	350	24	2	\N	\N	\N	\N
6080	350	27	3	\N	\N	\N	\N
6081	350	28	2	\N	\N	\N	\N
6082	350	29	2	\N	\N	\N	\N
6083	350	30	3	\N	\N	\N	\N
6084	350	31	4	\N	\N	\N	\N
6085	350	32	3	\N	\N	\N	\N
6086	350	33	4	\N	\N	\N	\N
6087	350	34	3	\N	\N	\N	\N
6088	350	35	4	\N	\N	\N	\N
6089	350	36	2	\N	\N	\N	\N
6090	350	37	4	\N	\N	\N	\N
6091	350	38	3	\N	\N	\N	\N
6092	350	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.82	MODELO
6093	350	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.903	MODELO
6094	349	18	2	\N	\N	\N	\N
6095	349	19	4	\N	\N	\N	\N
6096	349	20	4	\N	\N	\N	\N
6097	349	21	3	\N	\N	\N	\N
6098	349	22	4	\N	\N	\N	\N
6099	349	23	4	\N	\N	\N	\N
6100	349	24	4	\N	\N	\N	\N
6101	349	27	3	\N	\N	\N	\N
6102	349	28	3	\N	\N	\N	\N
6103	349	29	4	\N	\N	\N	\N
6104	349	30	3	\N	\N	\N	\N
6105	349	31	4	\N	\N	\N	\N
6106	349	32	4	\N	\N	\N	\N
6107	349	33	4	\N	\N	\N	\N
6108	349	34	4	\N	\N	\N	\N
6109	349	35	4	\N	\N	\N	\N
6110	349	36	2	\N	\N	\N	\N
6111	349	37	4	\N	\N	\N	\N
6112	349	38	4	\N	\N	\N	\N
6113	349	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.798	MODELO
6114	349	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.86	MODELO
6115	348	18	3	\N	\N	\N	\N
6116	348	19	2	\N	\N	\N	\N
6117	348	20	4	\N	\N	\N	\N
6118	348	21	4	\N	\N	\N	\N
6119	348	22	4	\N	\N	\N	\N
6120	348	23	4	\N	\N	\N	\N
6121	348	24	4	\N	\N	\N	\N
6122	348	27	3	\N	\N	\N	\N
6123	348	28	4	\N	\N	\N	\N
6124	348	29	4	\N	\N	\N	\N
6125	348	30	4	\N	\N	\N	\N
6126	348	31	4	\N	\N	\N	\N
6127	348	32	4	\N	\N	\N	\N
6128	348	33	3	\N	\N	\N	\N
6129	348	34	4	\N	\N	\N	\N
6130	348	35	4	\N	\N	\N	\N
6131	348	36	4	\N	\N	\N	\N
6132	348	37	3	\N	\N	\N	\N
6133	348	38	4	\N	\N	\N	\N
6134	348	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.766	MODELO
6135	348	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.974	MODELO
6136	347	18	4	\N	\N	\N	\N
6137	347	19	4	\N	\N	\N	\N
6138	347	20	3	\N	\N	\N	\N
6139	347	21	4	\N	\N	\N	\N
6140	347	22	4	\N	\N	\N	\N
6141	347	23	4	\N	\N	\N	\N
6142	347	24	3	\N	\N	\N	\N
6143	347	27	4	\N	\N	\N	\N
6146	347	30	2	\N	\N	\N	\N
6147	347	31	3	\N	\N	\N	\N
6148	347	32	2	\N	\N	\N	\N
6149	347	33	1	\N	\N	\N	\N
6150	347	34	4	\N	\N	\N	\N
6151	347	35	4	\N	\N	\N	\N
6152	347	36	2	\N	\N	\N	\N
6153	347	37	4	\N	\N	\N	\N
6154	347	38	3	\N	\N	\N	\N
6155	347	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.766	MODELO
6156	347	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.554	MODELO
6157	346	18	4	\N	\N	\N	\N
6158	346	19	4	\N	\N	\N	\N
6159	346	20	4	\N	\N	\N	\N
6160	346	21	4	\N	\N	\N	\N
6161	346	22	3	\N	\N	\N	\N
6162	346	23	4	\N	\N	\N	\N
6163	346	24	4	\N	\N	\N	\N
6164	346	27	4	\N	\N	\N	\N
6165	346	28	4	\N	\N	\N	\N
6166	346	29	4	\N	\N	\N	\N
6167	346	30	4	\N	\N	\N	\N
6168	346	31	3	\N	\N	\N	\N
6169	346	32	3	\N	\N	\N	\N
6170	346	33	4	\N	\N	\N	\N
6171	346	34	2	\N	\N	\N	\N
6172	346	35	4	\N	\N	\N	\N
6173	346	36	4	\N	\N	\N	\N
6174	346	37	2	\N	\N	\N	\N
6175	346	38	3	\N	\N	\N	\N
6176	346	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.766	MODELO
6177	346	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.604	MODELO
6178	345	18	4	\N	\N	\N	\N
6179	345	19	4	\N	\N	\N	\N
6180	345	20	3	\N	\N	\N	\N
6181	345	21	4	\N	\N	\N	\N
6182	345	22	3	\N	\N	\N	\N
6183	345	23	4	\N	\N	\N	\N
6184	345	24	4	\N	\N	\N	\N
6185	345	27	4	\N	\N	\N	\N
6186	345	28	3	\N	\N	\N	\N
6187	345	29	4	\N	\N	\N	\N
6188	345	30	4	\N	\N	\N	\N
6189	345	31	4	\N	\N	\N	\N
6190	345	32	4	\N	\N	\N	\N
6191	345	33	4	\N	\N	\N	\N
6192	345	34	4	\N	\N	\N	\N
6193	345	35	4	\N	\N	\N	\N
6194	345	36	4	\N	\N	\N	\N
6195	345	37	4	\N	\N	\N	\N
6196	345	38	4	\N	\N	\N	\N
6197	345	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.958	MODELO
6198	345	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.652	MODELO
6199	344	18	3	\N	\N	\N	\N
6200	344	19	4	\N	\N	\N	\N
6201	344	20	3	\N	\N	\N	\N
6202	344	21	4	\N	\N	\N	\N
6203	344	22	4	\N	\N	\N	\N
6204	344	23	2	\N	\N	\N	\N
6205	344	24	4	\N	\N	\N	\N
6206	344	27	4	\N	\N	\N	\N
6207	344	28	4	\N	\N	\N	\N
6208	344	29	3	\N	\N	\N	\N
6209	344	30	3	\N	\N	\N	\N
6210	344	31	4	\N	\N	\N	\N
6211	344	32	4	\N	\N	\N	\N
6212	344	33	1	\N	\N	\N	\N
6213	344	34	3	\N	\N	\N	\N
6214	344	35	4	\N	\N	\N	\N
6215	344	36	4	\N	\N	\N	\N
6216	344	37	3	\N	\N	\N	\N
6217	344	38	1	\N	\N	\N	\N
6218	344	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.811	MODELO
6219	344	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.91	MODELO
6220	343	18	4	\N	\N	\N	\N
6221	343	19	4	\N	\N	\N	\N
6222	343	20	3	\N	\N	\N	\N
6223	343	21	3	\N	\N	\N	\N
6224	343	22	3	\N	\N	\N	\N
6225	343	23	4	\N	\N	\N	\N
6226	343	24	4	\N	\N	\N	\N
6227	343	27	4	\N	\N	\N	\N
6228	343	28	3	\N	\N	\N	\N
6229	343	29	4	\N	\N	\N	\N
6230	343	30	2	\N	\N	\N	\N
6231	343	31	4	\N	\N	\N	\N
6232	343	32	3	\N	\N	\N	\N
6233	343	33	3	\N	\N	\N	\N
6234	343	34	4	\N	\N	\N	\N
6235	343	35	4	\N	\N	\N	\N
6236	343	36	4	\N	\N	\N	\N
6237	343	37	1	\N	\N	\N	\N
6238	343	38	4	\N	\N	\N	\N
6239	343	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.867	MODELO
6240	343	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.966	MODELO
6241	342	18	4	\N	\N	\N	\N
6242	342	19	4	\N	\N	\N	\N
6243	342	20	4	\N	\N	\N	\N
6244	342	21	4	\N	\N	\N	\N
6245	342	22	3	\N	\N	\N	\N
6246	342	23	3	\N	\N	\N	\N
6247	342	24	4	\N	\N	\N	\N
6248	342	27	4	\N	\N	\N	\N
6249	342	28	4	\N	\N	\N	\N
6250	342	29	4	\N	\N	\N	\N
6251	342	30	4	\N	\N	\N	\N
6252	342	31	3	\N	\N	\N	\N
6253	342	32	4	\N	\N	\N	\N
6254	342	33	4	\N	\N	\N	\N
6255	342	34	4	\N	\N	\N	\N
6256	342	35	4	\N	\N	\N	\N
6257	342	36	3	\N	\N	\N	\N
6258	342	37	4	\N	\N	\N	\N
6259	342	38	4	\N	\N	\N	\N
6260	342	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.835	MODELO
6261	342	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.9	MODELO
6262	341	18	4	\N	\N	\N	\N
6263	341	19	4	\N	\N	\N	\N
6264	341	20	4	\N	\N	\N	\N
6265	341	21	4	\N	\N	\N	\N
6266	341	22	4	\N	\N	\N	\N
6267	341	23	4	\N	\N	\N	\N
6268	341	24	4	\N	\N	\N	\N
6269	341	27	3	\N	\N	\N	\N
6270	341	28	4	\N	\N	\N	\N
6271	341	29	4	\N	\N	\N	\N
6272	341	30	4	\N	\N	\N	\N
6273	341	31	3	\N	\N	\N	\N
6274	341	32	4	\N	\N	\N	\N
6275	341	33	4	\N	\N	\N	\N
6276	341	34	4	\N	\N	\N	\N
6277	341	35	3	\N	\N	\N	\N
6278	341	36	3	\N	\N	\N	\N
6279	341	37	2	\N	\N	\N	\N
6280	341	38	3	\N	\N	\N	\N
6281	341	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.941	MODELO
6282	341	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.883	MODELO
6283	340	18	3	\N	\N	\N	\N
6284	340	19	3	\N	\N	\N	\N
6285	340	20	3	\N	\N	\N	\N
6286	340	21	3	\N	\N	\N	\N
6287	340	22	4	\N	\N	\N	\N
6288	340	23	4	\N	\N	\N	\N
6289	340	24	2	\N	\N	\N	\N
6290	340	27	4	\N	\N	\N	\N
6291	340	28	4	\N	\N	\N	\N
6292	340	29	4	\N	\N	\N	\N
6293	340	30	3	\N	\N	\N	\N
6294	340	31	4	\N	\N	\N	\N
6295	340	32	4	\N	\N	\N	\N
6296	340	33	3	\N	\N	\N	\N
6297	340	34	3	\N	\N	\N	\N
6298	340	35	3	\N	\N	\N	\N
6299	340	36	3	\N	\N	\N	\N
6300	340	37	2	\N	\N	\N	\N
6301	340	38	4	\N	\N	\N	\N
6302	340	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.505	MODELO
6303	340	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.88	MODELO
6304	339	18	4	\N	\N	\N	\N
6305	339	19	4	\N	\N	\N	\N
6306	339	20	3	\N	\N	\N	\N
6307	339	21	4	\N	\N	\N	\N
6308	339	22	4	\N	\N	\N	\N
6309	339	23	4	\N	\N	\N	\N
6310	339	24	4	\N	\N	\N	\N
6311	339	27	4	\N	\N	\N	\N
6312	339	28	4	\N	\N	\N	\N
6313	339	29	4	\N	\N	\N	\N
6314	339	30	2	\N	\N	\N	\N
6315	339	31	2	\N	\N	\N	\N
6316	339	32	4	\N	\N	\N	\N
6317	339	33	4	\N	\N	\N	\N
6318	339	34	3	\N	\N	\N	\N
6319	339	35	3	\N	\N	\N	\N
6320	339	36	4	\N	\N	\N	\N
6321	339	37	4	\N	\N	\N	\N
6322	339	38	4	\N	\N	\N	\N
6323	339	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.754	MODELO
6324	339	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.947	MODELO
6325	338	18	4	\N	\N	\N	\N
6326	338	19	4	\N	\N	\N	\N
6327	338	20	4	\N	\N	\N	\N
6328	338	21	4	\N	\N	\N	\N
6329	338	22	4	\N	\N	\N	\N
6330	338	23	4	\N	\N	\N	\N
6331	338	24	4	\N	\N	\N	\N
6332	338	27	4	\N	\N	\N	\N
6333	338	28	3	\N	\N	\N	\N
6334	338	29	2	\N	\N	\N	\N
6335	338	30	4	\N	\N	\N	\N
6336	338	31	4	\N	\N	\N	\N
6337	338	32	4	\N	\N	\N	\N
6338	338	33	4	\N	\N	\N	\N
6339	338	34	4	\N	\N	\N	\N
6340	338	35	4	\N	\N	\N	\N
6341	338	36	4	\N	\N	\N	\N
6342	338	37	4	\N	\N	\N	\N
6343	338	38	4	\N	\N	\N	\N
6344	338	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.82	MODELO
6345	338	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.753	MODELO
6346	337	18	3	\N	\N	\N	\N
6347	337	19	4	\N	\N	\N	\N
6348	337	20	4	\N	\N	\N	\N
6349	337	21	3	\N	\N	\N	\N
6350	337	22	4	\N	\N	\N	\N
6351	337	23	4	\N	\N	\N	\N
6352	337	24	3	\N	\N	\N	\N
6353	337	27	4	\N	\N	\N	\N
6354	337	28	3	\N	\N	\N	\N
6355	337	29	4	\N	\N	\N	\N
6356	337	30	2	\N	\N	\N	\N
6357	337	31	2	\N	\N	\N	\N
6358	337	32	4	\N	\N	\N	\N
6359	337	33	3	\N	\N	\N	\N
6360	337	34	4	\N	\N	\N	\N
6361	337	35	4	\N	\N	\N	\N
6362	337	36	4	\N	\N	\N	\N
6363	337	37	4	\N	\N	\N	\N
6364	337	38	4	\N	\N	\N	\N
6365	337	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.702	MODELO
6366	337	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.816	MODELO
6367	336	18	4	\N	\N	\N	\N
6368	336	19	3	\N	\N	\N	\N
6369	336	20	4	\N	\N	\N	\N
6370	336	21	4	\N	\N	\N	\N
6371	336	22	4	\N	\N	\N	\N
6372	336	23	4	\N	\N	\N	\N
6373	336	24	4	\N	\N	\N	\N
6374	336	27	4	\N	\N	\N	\N
6375	336	28	2	\N	\N	\N	\N
6376	336	29	3	\N	\N	\N	\N
6377	336	30	4	\N	\N	\N	\N
6378	336	31	4	\N	\N	\N	\N
6379	336	32	4	\N	\N	\N	\N
6380	336	33	3	\N	\N	\N	\N
6381	336	34	4	\N	\N	\N	\N
6382	336	35	4	\N	\N	\N	\N
6383	336	36	3	\N	\N	\N	\N
6384	336	37	1	\N	\N	\N	\N
6385	336	38	2	\N	\N	\N	\N
6386	336	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.534	MODELO
6387	336	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.967	MODELO
6388	335	18	4	\N	\N	\N	\N
6389	335	19	4	\N	\N	\N	\N
6390	335	20	4	\N	\N	\N	\N
6391	335	21	4	\N	\N	\N	\N
6392	335	22	4	\N	\N	\N	\N
6393	335	23	4	\N	\N	\N	\N
6394	335	24	4	\N	\N	\N	\N
6395	335	27	4	\N	\N	\N	\N
6396	335	28	4	\N	\N	\N	\N
6397	335	29	4	\N	\N	\N	\N
6398	335	30	4	\N	\N	\N	\N
6399	335	31	4	\N	\N	\N	\N
6400	335	32	4	\N	\N	\N	\N
6401	335	33	4	\N	\N	\N	\N
6402	335	34	3	\N	\N	\N	\N
6403	335	35	4	\N	\N	\N	\N
6404	335	36	4	\N	\N	\N	\N
6405	335	37	2	\N	\N	\N	\N
6406	335	38	3	\N	\N	\N	\N
6407	335	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.949	MODELO
6408	335	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.749	MODELO
6409	334	18	3	\N	\N	\N	\N
6410	334	19	3	\N	\N	\N	\N
6411	334	20	4	\N	\N	\N	\N
6412	334	21	2	\N	\N	\N	\N
6413	334	22	4	\N	\N	\N	\N
6414	334	23	4	\N	\N	\N	\N
6415	334	24	4	\N	\N	\N	\N
6416	334	27	3	\N	\N	\N	\N
6417	334	28	4	\N	\N	\N	\N
6418	334	29	4	\N	\N	\N	\N
6419	334	30	4	\N	\N	\N	\N
6420	334	31	4	\N	\N	\N	\N
6421	334	32	3	\N	\N	\N	\N
6422	334	33	4	\N	\N	\N	\N
6423	334	34	4	\N	\N	\N	\N
6424	334	35	4	\N	\N	\N	\N
6425	334	36	3	\N	\N	\N	\N
6426	334	37	4	\N	\N	\N	\N
6427	334	38	4	\N	\N	\N	\N
6428	334	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.722	MODELO
6429	334	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.921	MODELO
6430	333	18	4	\N	\N	\N	\N
6431	333	19	3	\N	\N	\N	\N
6432	333	20	4	\N	\N	\N	\N
6433	333	21	4	\N	\N	\N	\N
6434	333	22	3	\N	\N	\N	\N
6435	333	23	4	\N	\N	\N	\N
6436	333	24	4	\N	\N	\N	\N
6437	333	27	4	\N	\N	\N	\N
6438	333	28	4	\N	\N	\N	\N
6439	333	29	4	\N	\N	\N	\N
6440	333	30	4	\N	\N	\N	\N
6441	333	31	3	\N	\N	\N	\N
6442	333	32	4	\N	\N	\N	\N
6443	333	33	4	\N	\N	\N	\N
6444	333	34	3	\N	\N	\N	\N
6445	333	35	1	\N	\N	\N	\N
6446	333	36	3	\N	\N	\N	\N
6447	333	37	4	\N	\N	\N	\N
6448	333	38	3	\N	\N	\N	\N
6449	333	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.848	MODELO
6450	333	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.831	MODELO
6451	332	18	3	\N	\N	\N	\N
6452	332	19	4	\N	\N	\N	\N
6453	332	20	2	\N	\N	\N	\N
6454	332	21	4	\N	\N	\N	\N
6455	332	22	4	\N	\N	\N	\N
6456	332	23	4	\N	\N	\N	\N
6457	332	24	3	\N	\N	\N	\N
6458	332	27	3	\N	\N	\N	\N
6459	332	28	4	\N	\N	\N	\N
6460	332	29	4	\N	\N	\N	\N
6461	332	30	3	\N	\N	\N	\N
6462	332	31	4	\N	\N	\N	\N
6463	332	32	4	\N	\N	\N	\N
6464	332	33	4	\N	\N	\N	\N
6465	332	34	4	\N	\N	\N	\N
6466	332	35	4	\N	\N	\N	\N
6467	332	36	4	\N	\N	\N	\N
6468	332	37	4	\N	\N	\N	\N
6469	332	38	2	\N	\N	\N	\N
6470	332	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.824	MODELO
6471	332	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.705	MODELO
6472	331	18	4	\N	\N	\N	\N
6473	331	19	4	\N	\N	\N	\N
6474	331	20	4	\N	\N	\N	\N
6475	331	21	4	\N	\N	\N	\N
6476	331	22	2	\N	\N	\N	\N
6477	331	23	4	\N	\N	\N	\N
6478	331	24	3	\N	\N	\N	\N
6479	331	27	4	\N	\N	\N	\N
6480	331	28	4	\N	\N	\N	\N
6481	331	29	3	\N	\N	\N	\N
6482	331	30	3	\N	\N	\N	\N
6483	331	31	4	\N	\N	\N	\N
6484	331	32	4	\N	\N	\N	\N
6485	331	33	4	\N	\N	\N	\N
6486	331	34	4	\N	\N	\N	\N
6487	331	35	3	\N	\N	\N	\N
6488	331	36	3	\N	\N	\N	\N
6489	331	37	4	\N	\N	\N	\N
6490	331	38	4	\N	\N	\N	\N
6491	331	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.923	MODELO
6492	331	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.712	MODELO
6493	330	18	4	\N	\N	\N	\N
6494	330	19	3	\N	\N	\N	\N
6495	330	20	3	\N	\N	\N	\N
6496	330	21	3	\N	\N	\N	\N
6497	330	22	4	\N	\N	\N	\N
6498	330	23	4	\N	\N	\N	\N
6499	330	24	4	\N	\N	\N	\N
6500	330	27	2	\N	\N	\N	\N
6501	330	28	4	\N	\N	\N	\N
6502	330	29	3	\N	\N	\N	\N
6503	330	30	4	\N	\N	\N	\N
6504	330	31	4	\N	\N	\N	\N
6505	330	32	3	\N	\N	\N	\N
6506	330	33	3	\N	\N	\N	\N
6507	330	34	4	\N	\N	\N	\N
6508	330	35	4	\N	\N	\N	\N
6509	330	36	2	\N	\N	\N	\N
6510	330	37	1	\N	\N	\N	\N
6511	330	38	4	\N	\N	\N	\N
6512	330	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.906	MODELO
6513	330	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.853	MODELO
6514	329	18	4	\N	\N	\N	\N
6515	329	19	4	\N	\N	\N	\N
6516	329	20	4	\N	\N	\N	\N
6517	329	21	4	\N	\N	\N	\N
6518	329	22	4	\N	\N	\N	\N
6519	329	23	3	\N	\N	\N	\N
6520	329	24	4	\N	\N	\N	\N
6521	329	27	4	\N	\N	\N	\N
6522	329	28	4	\N	\N	\N	\N
6523	329	29	3	\N	\N	\N	\N
6524	329	30	4	\N	\N	\N	\N
6525	329	31	4	\N	\N	\N	\N
6526	329	32	4	\N	\N	\N	\N
6527	329	33	4	\N	\N	\N	\N
6528	329	34	4	\N	\N	\N	\N
6529	329	35	4	\N	\N	\N	\N
6530	329	36	4	\N	\N	\N	\N
6531	329	37	3	\N	\N	\N	\N
6532	329	38	3	\N	\N	\N	\N
6533	329	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.566	MODELO
6534	329	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.803	MODELO
6535	328	18	2	\N	\N	\N	\N
6536	328	19	4	\N	\N	\N	\N
6537	328	20	3	\N	\N	\N	\N
6538	328	21	3	\N	\N	\N	\N
6539	328	22	3	\N	\N	\N	\N
6540	328	23	4	\N	\N	\N	\N
6541	328	24	2	\N	\N	\N	\N
6542	328	27	4	\N	\N	\N	\N
6543	328	28	3	\N	\N	\N	\N
6544	328	29	4	\N	\N	\N	\N
6545	328	30	3	\N	\N	\N	\N
6546	328	31	4	\N	\N	\N	\N
6547	328	32	2	\N	\N	\N	\N
6548	328	33	4	\N	\N	\N	\N
6549	328	34	4	\N	\N	\N	\N
6550	328	35	4	\N	\N	\N	\N
6551	328	36	4	\N	\N	\N	\N
6552	328	37	4	\N	\N	\N	\N
6553	328	38	3	\N	\N	\N	\N
6554	328	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.824	MODELO
6555	328	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.732	MODELO
6556	327	18	4	\N	\N	\N	\N
6557	327	19	4	\N	\N	\N	\N
6558	327	20	4	\N	\N	\N	\N
6559	327	21	4	\N	\N	\N	\N
6560	327	22	4	\N	\N	\N	\N
6561	327	23	4	\N	\N	\N	\N
6562	327	24	3	\N	\N	\N	\N
6563	327	27	4	\N	\N	\N	\N
6564	327	28	4	\N	\N	\N	\N
6565	327	29	3	\N	\N	\N	\N
6566	327	30	3	\N	\N	\N	\N
6567	327	31	2	\N	\N	\N	\N
6568	327	32	1	\N	\N	\N	\N
6569	327	33	2	\N	\N	\N	\N
6570	327	34	4	\N	\N	\N	\N
6571	327	35	3	\N	\N	\N	\N
6572	327	36	4	\N	\N	\N	\N
6573	327	37	4	\N	\N	\N	\N
6574	327	38	3	\N	\N	\N	\N
6575	327	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.795	MODELO
6576	327	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.774	MODELO
6577	326	18	4	\N	\N	\N	\N
6578	326	19	4	\N	\N	\N	\N
6579	326	20	4	\N	\N	\N	\N
6580	326	21	4	\N	\N	\N	\N
6581	326	22	4	\N	\N	\N	\N
6582	326	23	3	\N	\N	\N	\N
6583	326	24	4	\N	\N	\N	\N
6584	326	27	4	\N	\N	\N	\N
6585	326	28	4	\N	\N	\N	\N
6586	326	29	4	\N	\N	\N	\N
6587	326	30	4	\N	\N	\N	\N
6588	326	31	4	\N	\N	\N	\N
6589	326	32	4	\N	\N	\N	\N
6590	326	33	4	\N	\N	\N	\N
6591	326	34	4	\N	\N	\N	\N
6592	326	35	4	\N	\N	\N	\N
6593	326	36	4	\N	\N	\N	\N
6594	326	37	4	\N	\N	\N	\N
6595	326	38	3	\N	\N	\N	\N
6596	326	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.717	MODELO
6597	326	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.771	MODELO
6598	325	18	4	\N	\N	\N	\N
6599	325	19	3	\N	\N	\N	\N
6600	325	20	4	\N	\N	\N	\N
6601	325	21	1	\N	\N	\N	\N
6602	325	22	1	\N	\N	\N	\N
6603	325	23	4	\N	\N	\N	\N
6604	325	24	4	\N	\N	\N	\N
6605	325	27	4	\N	\N	\N	\N
6606	325	28	4	\N	\N	\N	\N
6607	325	29	1	\N	\N	\N	\N
6608	325	30	3	\N	\N	\N	\N
6609	325	31	4	\N	\N	\N	\N
6610	325	32	4	\N	\N	\N	\N
6611	325	33	3	\N	\N	\N	\N
6612	325	34	4	\N	\N	\N	\N
6613	325	35	2	\N	\N	\N	\N
6614	325	36	4	\N	\N	\N	\N
6615	325	37	2	\N	\N	\N	\N
6616	325	38	4	\N	\N	\N	\N
6617	325	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.57	MODELO
6618	325	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.988	MODELO
6619	324	18	4	\N	\N	\N	\N
6620	324	19	4	\N	\N	\N	\N
6621	324	20	1	\N	\N	\N	\N
6622	324	21	4	\N	\N	\N	\N
6623	324	22	3	\N	\N	\N	\N
6624	324	23	4	\N	\N	\N	\N
6625	324	24	4	\N	\N	\N	\N
6626	324	27	3	\N	\N	\N	\N
6627	324	28	4	\N	\N	\N	\N
6628	324	29	4	\N	\N	\N	\N
6629	324	30	4	\N	\N	\N	\N
6630	324	31	3	\N	\N	\N	\N
6631	324	32	4	\N	\N	\N	\N
6632	324	33	4	\N	\N	\N	\N
6633	324	34	3	\N	\N	\N	\N
6634	324	35	3	\N	\N	\N	\N
6635	324	36	3	\N	\N	\N	\N
6636	324	37	4	\N	\N	\N	\N
6637	324	38	1	\N	\N	\N	\N
6638	324	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.747	MODELO
6639	324	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.818	MODELO
6640	323	18	3	\N	\N	\N	\N
6641	323	19	3	\N	\N	\N	\N
6642	323	20	3	\N	\N	\N	\N
6643	323	21	4	\N	\N	\N	\N
6644	323	22	4	\N	\N	\N	\N
6645	323	23	4	\N	\N	\N	\N
6646	323	24	3	\N	\N	\N	\N
6647	323	27	4	\N	\N	\N	\N
6648	323	28	4	\N	\N	\N	\N
6649	323	29	2	\N	\N	\N	\N
6650	323	30	3	\N	\N	\N	\N
6651	323	31	3	\N	\N	\N	\N
6652	323	32	4	\N	\N	\N	\N
6653	323	33	4	\N	\N	\N	\N
6654	323	34	4	\N	\N	\N	\N
6655	323	35	4	\N	\N	\N	\N
6656	323	36	4	\N	\N	\N	\N
6657	323	37	4	\N	\N	\N	\N
6658	323	38	4	\N	\N	\N	\N
6659	323	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.885	MODELO
6660	323	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.518	MODELO
6661	322	18	1	\N	\N	\N	\N
6662	322	19	4	\N	\N	\N	\N
6663	322	20	4	\N	\N	\N	\N
6664	322	21	3	\N	\N	\N	\N
6665	322	22	4	\N	\N	\N	\N
6666	322	23	4	\N	\N	\N	\N
6667	322	24	4	\N	\N	\N	\N
6668	322	27	4	\N	\N	\N	\N
6669	322	28	4	\N	\N	\N	\N
6670	322	29	4	\N	\N	\N	\N
6671	322	30	4	\N	\N	\N	\N
6672	322	31	3	\N	\N	\N	\N
6673	322	32	4	\N	\N	\N	\N
6674	322	33	4	\N	\N	\N	\N
6675	322	34	4	\N	\N	\N	\N
6676	322	35	2	\N	\N	\N	\N
6677	322	36	4	\N	\N	\N	\N
6678	322	37	3	\N	\N	\N	\N
6679	322	38	4	\N	\N	\N	\N
6680	322	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.927	MODELO
6681	322	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.779	MODELO
6682	321	18	4	\N	\N	\N	\N
6683	321	19	4	\N	\N	\N	\N
6684	321	20	4	\N	\N	\N	\N
6685	321	21	3	\N	\N	\N	\N
6686	321	22	4	\N	\N	\N	\N
6687	321	23	2	\N	\N	\N	\N
6688	321	24	3	\N	\N	\N	\N
6689	321	27	4	\N	\N	\N	\N
6690	321	28	4	\N	\N	\N	\N
6691	321	29	2	\N	\N	\N	\N
6692	321	30	3	\N	\N	\N	\N
6693	321	31	4	\N	\N	\N	\N
6694	321	32	4	\N	\N	\N	\N
6695	321	33	3	\N	\N	\N	\N
6696	321	34	4	\N	\N	\N	\N
6697	321	35	4	\N	\N	\N	\N
6698	321	36	4	\N	\N	\N	\N
6699	321	37	3	\N	\N	\N	\N
6700	321	38	1	\N	\N	\N	\N
6701	321	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.952	MODELO
6702	321	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.731	MODELO
6703	320	18	4	\N	\N	\N	\N
6704	320	19	4	\N	\N	\N	\N
6705	320	20	4	\N	\N	\N	\N
6706	320	21	4	\N	\N	\N	\N
6707	320	22	4	\N	\N	\N	\N
6708	320	23	4	\N	\N	\N	\N
6709	320	24	4	\N	\N	\N	\N
6710	320	27	3	\N	\N	\N	\N
6711	320	28	4	\N	\N	\N	\N
6712	320	29	4	\N	\N	\N	\N
6713	320	30	2	\N	\N	\N	\N
6714	320	31	4	\N	\N	\N	\N
6715	320	32	4	\N	\N	\N	\N
6716	320	33	4	\N	\N	\N	\N
6717	320	34	4	\N	\N	\N	\N
6718	320	35	4	\N	\N	\N	\N
6719	320	36	3	\N	\N	\N	\N
6720	320	37	4	\N	\N	\N	\N
6721	320	38	3	\N	\N	\N	\N
6722	320	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.771	MODELO
6723	320	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.941	MODELO
6724	319	18	4	\N	\N	\N	\N
6725	319	19	4	\N	\N	\N	\N
6726	319	20	4	\N	\N	\N	\N
6727	319	21	4	\N	\N	\N	\N
6728	319	22	3	\N	\N	\N	\N
6729	319	23	4	\N	\N	\N	\N
6730	319	24	4	\N	\N	\N	\N
6731	319	27	4	\N	\N	\N	\N
6732	319	28	4	\N	\N	\N	\N
6733	319	29	4	\N	\N	\N	\N
6734	319	30	1	\N	\N	\N	\N
6735	319	31	3	\N	\N	\N	\N
6736	319	32	4	\N	\N	\N	\N
6737	319	33	3	\N	\N	\N	\N
6738	319	34	4	\N	\N	\N	\N
6739	319	35	4	\N	\N	\N	\N
6740	319	36	4	\N	\N	\N	\N
6741	319	37	4	\N	\N	\N	\N
6742	319	38	4	\N	\N	\N	\N
6743	319	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.942	MODELO
6744	319	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.719	MODELO
6745	318	18	4	\N	\N	\N	\N
6746	318	19	4	\N	\N	\N	\N
6747	318	20	4	\N	\N	\N	\N
6748	318	21	3	\N	\N	\N	\N
6749	318	22	3	\N	\N	\N	\N
6750	318	23	4	\N	\N	\N	\N
6751	318	24	3	\N	\N	\N	\N
6752	318	27	4	\N	\N	\N	\N
6753	318	28	4	\N	\N	\N	\N
6754	318	29	2	\N	\N	\N	\N
6755	318	30	4	\N	\N	\N	\N
6756	318	31	4	\N	\N	\N	\N
6757	318	32	4	\N	\N	\N	\N
6758	318	33	4	\N	\N	\N	\N
6759	318	34	3	\N	\N	\N	\N
6760	318	35	4	\N	\N	\N	\N
6761	318	36	2	\N	\N	\N	\N
6762	318	37	4	\N	\N	\N	\N
6763	318	38	4	\N	\N	\N	\N
6764	318	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.926	MODELO
6765	318	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.967	MODELO
6766	317	18	3	\N	\N	\N	\N
6767	317	19	4	\N	\N	\N	\N
6768	317	20	4	\N	\N	\N	\N
6769	317	21	3	\N	\N	\N	\N
6770	317	22	4	\N	\N	\N	\N
6771	317	23	3	\N	\N	\N	\N
6772	317	24	4	\N	\N	\N	\N
6773	317	27	1	\N	\N	\N	\N
6774	317	28	3	\N	\N	\N	\N
6775	317	29	1	\N	\N	\N	\N
6776	317	30	4	\N	\N	\N	\N
6777	317	31	3	\N	\N	\N	\N
6778	317	32	1	\N	\N	\N	\N
6779	317	33	4	\N	\N	\N	\N
6780	317	34	4	\N	\N	\N	\N
6781	317	35	4	\N	\N	\N	\N
6782	317	36	4	\N	\N	\N	\N
6783	317	37	4	\N	\N	\N	\N
6784	317	38	4	\N	\N	\N	\N
6785	317	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.915	MODELO
6786	317	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.773	MODELO
6787	316	18	4	\N	\N	\N	\N
6788	316	19	4	\N	\N	\N	\N
6789	316	20	3	\N	\N	\N	\N
6790	316	21	2	\N	\N	\N	\N
6791	316	22	4	\N	\N	\N	\N
6792	316	23	4	\N	\N	\N	\N
6793	316	24	4	\N	\N	\N	\N
6794	316	27	4	\N	\N	\N	\N
6795	316	28	4	\N	\N	\N	\N
6796	316	29	4	\N	\N	\N	\N
6797	316	30	4	\N	\N	\N	\N
6798	316	31	4	\N	\N	\N	\N
6799	316	32	4	\N	\N	\N	\N
6800	316	33	4	\N	\N	\N	\N
6801	316	34	4	\N	\N	\N	\N
6802	316	35	4	\N	\N	\N	\N
6803	316	36	4	\N	\N	\N	\N
6804	316	37	3	\N	\N	\N	\N
6805	316	38	4	\N	\N	\N	\N
6806	316	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.91	MODELO
6807	316	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.926	MODELO
6808	315	18	4	\N	\N	\N	\N
6809	315	19	4	\N	\N	\N	\N
6810	315	20	4	\N	\N	\N	\N
6811	315	21	3	\N	\N	\N	\N
6812	315	22	3	\N	\N	\N	\N
6813	315	23	4	\N	\N	\N	\N
6814	315	24	4	\N	\N	\N	\N
6815	315	27	3	\N	\N	\N	\N
6816	315	28	3	\N	\N	\N	\N
6817	315	29	4	\N	\N	\N	\N
6818	315	30	4	\N	\N	\N	\N
6819	315	31	4	\N	\N	\N	\N
6820	315	32	4	\N	\N	\N	\N
6821	315	33	3	\N	\N	\N	\N
6822	315	34	4	\N	\N	\N	\N
6823	315	35	4	\N	\N	\N	\N
6824	315	36	1	\N	\N	\N	\N
6825	315	37	3	\N	\N	\N	\N
6826	315	38	4	\N	\N	\N	\N
6827	315	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.918	MODELO
6828	315	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.912	MODELO
6829	314	18	3	\N	\N	\N	\N
6830	314	19	4	\N	\N	\N	\N
6831	314	20	4	\N	\N	\N	\N
6832	314	21	4	\N	\N	\N	\N
6833	314	22	3	\N	\N	\N	\N
6834	314	23	4	\N	\N	\N	\N
6835	314	24	4	\N	\N	\N	\N
6836	314	27	3	\N	\N	\N	\N
6837	314	28	4	\N	\N	\N	\N
6838	314	29	4	\N	\N	\N	\N
6839	314	30	4	\N	\N	\N	\N
6840	314	31	3	\N	\N	\N	\N
6841	314	32	4	\N	\N	\N	\N
6842	314	33	4	\N	\N	\N	\N
6843	314	34	4	\N	\N	\N	\N
6844	314	35	3	\N	\N	\N	\N
6845	314	36	2	\N	\N	\N	\N
6846	314	37	4	\N	\N	\N	\N
6847	314	38	2	\N	\N	\N	\N
6848	314	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.876	MODELO
6849	314	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.864	MODELO
6850	313	18	4	\N	\N	\N	\N
6851	313	19	4	\N	\N	\N	\N
6852	313	20	3	\N	\N	\N	\N
6853	313	21	4	\N	\N	\N	\N
6854	313	22	4	\N	\N	\N	\N
6855	313	23	4	\N	\N	\N	\N
6856	313	24	4	\N	\N	\N	\N
6857	313	27	4	\N	\N	\N	\N
6858	313	28	4	\N	\N	\N	\N
6859	313	29	4	\N	\N	\N	\N
6860	313	30	3	\N	\N	\N	\N
6861	313	31	3	\N	\N	\N	\N
6862	313	32	4	\N	\N	\N	\N
6863	313	33	4	\N	\N	\N	\N
6864	313	34	3	\N	\N	\N	\N
6865	313	35	4	\N	\N	\N	\N
6866	313	36	4	\N	\N	\N	\N
6867	313	37	3	\N	\N	\N	\N
6868	313	38	4	\N	\N	\N	\N
6869	313	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.91	MODELO
6870	313	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.804	MODELO
6871	312	18	3	\N	\N	\N	\N
6872	312	19	4	\N	\N	\N	\N
6873	312	20	4	\N	\N	\N	\N
6874	312	21	4	\N	\N	\N	\N
6875	312	22	3	\N	\N	\N	\N
6876	312	23	2	\N	\N	\N	\N
6877	312	24	4	\N	\N	\N	\N
6878	312	27	4	\N	\N	\N	\N
6879	312	28	3	\N	\N	\N	\N
6880	312	29	3	\N	\N	\N	\N
6881	312	30	4	\N	\N	\N	\N
6882	312	31	4	\N	\N	\N	\N
6883	312	32	4	\N	\N	\N	\N
6884	312	33	4	\N	\N	\N	\N
6885	312	34	3	\N	\N	\N	\N
6886	312	35	3	\N	\N	\N	\N
6887	312	36	3	\N	\N	\N	\N
6888	312	37	4	\N	\N	\N	\N
6889	312	38	4	\N	\N	\N	\N
6890	312	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.781	MODELO
6891	312	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.706	MODELO
6892	311	18	4	\N	\N	\N	\N
6893	311	19	4	\N	\N	\N	\N
6894	311	20	4	\N	\N	\N	\N
6895	311	21	4	\N	\N	\N	\N
6896	311	22	4	\N	\N	\N	\N
6897	311	23	4	\N	\N	\N	\N
6898	311	24	3	\N	\N	\N	\N
6899	311	27	4	\N	\N	\N	\N
6900	311	28	4	\N	\N	\N	\N
6901	311	29	4	\N	\N	\N	\N
6902	311	30	4	\N	\N	\N	\N
6903	311	31	4	\N	\N	\N	\N
6904	311	32	4	\N	\N	\N	\N
6905	311	33	4	\N	\N	\N	\N
6906	311	34	3	\N	\N	\N	\N
6907	311	35	4	\N	\N	\N	\N
6908	311	36	4	\N	\N	\N	\N
6909	311	37	3	\N	\N	\N	\N
6910	311	38	4	\N	\N	\N	\N
6911	311	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.752	MODELO
6912	311	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.969	MODELO
6913	310	18	3	\N	\N	\N	\N
6914	310	19	4	\N	\N	\N	\N
6915	310	20	3	\N	\N	\N	\N
6916	310	21	4	\N	\N	\N	\N
6917	310	22	4	\N	\N	\N	\N
6918	310	23	3	\N	\N	\N	\N
6919	310	24	4	\N	\N	\N	\N
6920	310	27	4	\N	\N	\N	\N
6921	310	28	4	\N	\N	\N	\N
6922	310	29	4	\N	\N	\N	\N
6923	310	30	4	\N	\N	\N	\N
6924	310	31	3	\N	\N	\N	\N
6925	310	32	4	\N	\N	\N	\N
6926	310	33	4	\N	\N	\N	\N
6927	310	34	3	\N	\N	\N	\N
6928	310	35	4	\N	\N	\N	\N
6929	310	36	4	\N	\N	\N	\N
6930	310	37	2	\N	\N	\N	\N
6931	310	38	4	\N	\N	\N	\N
6932	310	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.988	MODELO
6933	310	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.782	MODELO
6934	309	18	2	\N	\N	\N	\N
6935	309	19	3	\N	\N	\N	\N
6936	309	20	4	\N	\N	\N	\N
6937	309	21	4	\N	\N	\N	\N
6938	309	22	4	\N	\N	\N	\N
6939	309	23	4	\N	\N	\N	\N
6940	309	24	4	\N	\N	\N	\N
6941	309	27	4	\N	\N	\N	\N
6942	309	28	4	\N	\N	\N	\N
6943	309	29	4	\N	\N	\N	\N
6944	309	30	1	\N	\N	\N	\N
6945	309	31	3	\N	\N	\N	\N
6946	309	32	1	\N	\N	\N	\N
6947	309	33	2	\N	\N	\N	\N
6948	309	34	4	\N	\N	\N	\N
6949	309	35	3	\N	\N	\N	\N
6950	309	36	1	\N	\N	\N	\N
6951	309	37	4	\N	\N	\N	\N
6952	309	38	3	\N	\N	\N	\N
6953	309	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.785	MODELO
6954	309	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.536	MODELO
6955	308	18	4	\N	\N	\N	\N
6956	308	19	4	\N	\N	\N	\N
6957	308	20	4	\N	\N	\N	\N
6958	308	21	4	\N	\N	\N	\N
6959	308	22	4	\N	\N	\N	\N
6960	308	23	3	\N	\N	\N	\N
6961	308	24	4	\N	\N	\N	\N
6962	308	27	4	\N	\N	\N	\N
6963	308	28	4	\N	\N	\N	\N
6964	308	29	4	\N	\N	\N	\N
6965	308	30	4	\N	\N	\N	\N
6966	308	31	4	\N	\N	\N	\N
6967	308	32	4	\N	\N	\N	\N
6968	308	33	4	\N	\N	\N	\N
6969	308	34	4	\N	\N	\N	\N
6970	308	35	4	\N	\N	\N	\N
6971	308	36	4	\N	\N	\N	\N
6972	308	37	4	\N	\N	\N	\N
6973	308	38	3	\N	\N	\N	\N
6974	308	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.884	MODELO
6975	308	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.705	MODELO
6976	307	18	3	\N	\N	\N	\N
6977	307	19	4	\N	\N	\N	\N
6978	307	20	4	\N	\N	\N	\N
6979	307	21	3	\N	\N	\N	\N
6980	307	22	3	\N	\N	\N	\N
6981	307	23	4	\N	\N	\N	\N
6982	307	24	4	\N	\N	\N	\N
6983	307	27	3	\N	\N	\N	\N
6984	307	28	3	\N	\N	\N	\N
6985	307	29	4	\N	\N	\N	\N
6986	307	30	4	\N	\N	\N	\N
6987	307	31	4	\N	\N	\N	\N
6988	307	32	3	\N	\N	\N	\N
6989	307	33	4	\N	\N	\N	\N
6990	307	34	4	\N	\N	\N	\N
6991	307	35	4	\N	\N	\N	\N
6992	307	36	4	\N	\N	\N	\N
6993	307	37	4	\N	\N	\N	\N
6994	307	38	3	\N	\N	\N	\N
6995	307	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.831	MODELO
6996	307	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.635	MODELO
6997	306	18	4	\N	\N	\N	\N
6998	306	19	3	\N	\N	\N	\N
6999	306	20	4	\N	\N	\N	\N
7000	306	21	4	\N	\N	\N	\N
7001	306	22	3	\N	\N	\N	\N
7002	306	23	4	\N	\N	\N	\N
7003	306	24	4	\N	\N	\N	\N
7004	306	27	4	\N	\N	\N	\N
7005	306	28	3	\N	\N	\N	\N
7006	306	29	4	\N	\N	\N	\N
7007	306	30	4	\N	\N	\N	\N
7008	306	31	4	\N	\N	\N	\N
7009	306	32	4	\N	\N	\N	\N
7010	306	33	4	\N	\N	\N	\N
7011	306	34	4	\N	\N	\N	\N
7012	306	35	2	\N	\N	\N	\N
7013	306	36	3	\N	\N	\N	\N
7014	306	37	4	\N	\N	\N	\N
7015	306	38	1	\N	\N	\N	\N
7016	306	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.711	MODELO
7017	306	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.603	MODELO
7018	305	18	4	\N	\N	\N	\N
7019	305	19	4	\N	\N	\N	\N
7020	305	20	4	\N	\N	\N	\N
7021	305	21	4	\N	\N	\N	\N
7022	305	22	4	\N	\N	\N	\N
7023	305	23	4	\N	\N	\N	\N
7024	305	24	4	\N	\N	\N	\N
7025	305	27	2	\N	\N	\N	\N
7026	305	28	4	\N	\N	\N	\N
7027	305	29	4	\N	\N	\N	\N
7028	305	30	4	\N	\N	\N	\N
7029	305	31	4	\N	\N	\N	\N
7030	305	32	4	\N	\N	\N	\N
7031	305	33	3	\N	\N	\N	\N
7032	305	34	4	\N	\N	\N	\N
7033	305	35	4	\N	\N	\N	\N
7034	305	36	4	\N	\N	\N	\N
7035	305	37	3	\N	\N	\N	\N
7036	305	38	4	\N	\N	\N	\N
7037	305	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.683	MODELO
7038	305	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.941	MODELO
7039	304	18	4	\N	\N	\N	\N
7040	304	19	4	\N	\N	\N	\N
7041	304	20	3	\N	\N	\N	\N
7042	304	21	4	\N	\N	\N	\N
7043	304	22	4	\N	\N	\N	\N
7044	304	23	3	\N	\N	\N	\N
7045	304	24	1	\N	\N	\N	\N
7046	304	27	4	\N	\N	\N	\N
7047	304	28	4	\N	\N	\N	\N
7048	304	29	4	\N	\N	\N	\N
7049	304	30	4	\N	\N	\N	\N
7050	304	31	4	\N	\N	\N	\N
7051	304	32	4	\N	\N	\N	\N
7052	304	33	4	\N	\N	\N	\N
7053	304	34	2	\N	\N	\N	\N
7054	304	35	3	\N	\N	\N	\N
7055	304	36	4	\N	\N	\N	\N
7056	304	37	4	\N	\N	\N	\N
7057	304	38	4	\N	\N	\N	\N
7058	304	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.764	MODELO
7059	304	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.786	MODELO
7060	303	18	2	\N	\N	\N	\N
7061	303	19	4	\N	\N	\N	\N
7062	303	20	2	\N	\N	\N	\N
7063	303	21	4	\N	\N	\N	\N
7064	303	22	3	\N	\N	\N	\N
7065	303	23	4	\N	\N	\N	\N
7066	303	24	4	\N	\N	\N	\N
7067	303	27	3	\N	\N	\N	\N
7068	303	28	4	\N	\N	\N	\N
7069	303	29	4	\N	\N	\N	\N
7070	303	30	4	\N	\N	\N	\N
7071	303	31	4	\N	\N	\N	\N
7072	303	32	3	\N	\N	\N	\N
7073	303	33	4	\N	\N	\N	\N
7074	303	34	4	\N	\N	\N	\N
7075	303	35	4	\N	\N	\N	\N
7076	303	36	4	\N	\N	\N	\N
7077	303	37	4	\N	\N	\N	\N
7078	303	38	3	\N	\N	\N	\N
7079	303	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.775	MODELO
7080	303	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.949	MODELO
7081	302	18	2	\N	\N	\N	\N
7082	302	19	4	\N	\N	\N	\N
7083	302	20	2	\N	\N	\N	\N
7084	302	21	3	\N	\N	\N	\N
7085	302	22	3	\N	\N	\N	\N
7086	302	23	4	\N	\N	\N	\N
7087	302	24	4	\N	\N	\N	\N
7088	302	27	3	\N	\N	\N	\N
7089	302	28	3	\N	\N	\N	\N
7090	302	29	4	\N	\N	\N	\N
7091	302	30	4	\N	\N	\N	\N
7092	302	31	4	\N	\N	\N	\N
7093	302	32	3	\N	\N	\N	\N
7094	302	33	3	\N	\N	\N	\N
7095	302	34	4	\N	\N	\N	\N
7096	302	35	4	\N	\N	\N	\N
7097	302	36	4	\N	\N	\N	\N
7098	302	37	4	\N	\N	\N	\N
7099	302	38	3	\N	\N	\N	\N
7100	302	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.828	MODELO
7101	302	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.921	MODELO
7102	301	18	4	\N	\N	\N	\N
7103	301	19	4	\N	\N	\N	\N
7104	301	20	4	\N	\N	\N	\N
7105	301	21	2	\N	\N	\N	\N
7106	301	22	2	\N	\N	\N	\N
7107	301	23	4	\N	\N	\N	\N
7108	301	24	3	\N	\N	\N	\N
7109	301	27	4	\N	\N	\N	\N
7110	301	28	4	\N	\N	\N	\N
7111	301	29	4	\N	\N	\N	\N
7112	301	30	4	\N	\N	\N	\N
7113	301	31	1	\N	\N	\N	\N
7114	301	32	4	\N	\N	\N	\N
7115	301	33	4	\N	\N	\N	\N
7116	301	34	4	\N	\N	\N	\N
7117	301	35	4	\N	\N	\N	\N
7118	301	36	3	\N	\N	\N	\N
7119	301	37	4	\N	\N	\N	\N
7120	301	38	3	\N	\N	\N	\N
7121	301	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.974	MODELO
7122	301	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.894	MODELO
7123	300	18	3	\N	\N	\N	\N
7124	300	19	3	\N	\N	\N	\N
7125	300	20	1	\N	\N	\N	\N
7126	300	21	4	\N	\N	\N	\N
7127	300	22	1	\N	\N	\N	\N
7128	300	23	3	\N	\N	\N	\N
7129	300	24	3	\N	\N	\N	\N
7130	300	27	4	\N	\N	\N	\N
7131	300	28	2	\N	\N	\N	\N
7132	300	29	4	\N	\N	\N	\N
7133	300	30	4	\N	\N	\N	\N
7134	300	31	4	\N	\N	\N	\N
7135	300	32	1	\N	\N	\N	\N
7136	300	33	4	\N	\N	\N	\N
7137	300	34	4	\N	\N	\N	\N
7138	300	35	4	\N	\N	\N	\N
7139	300	36	4	\N	\N	\N	\N
7140	300	37	4	\N	\N	\N	\N
7141	300	38	4	\N	\N	\N	\N
7142	300	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.945	MODELO
7143	300	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.962	MODELO
7144	299	18	4	\N	\N	\N	\N
7145	299	19	3	\N	\N	\N	\N
7146	299	20	4	\N	\N	\N	\N
7147	299	21	2	\N	\N	\N	\N
7148	299	22	3	\N	\N	\N	\N
7149	299	23	4	\N	\N	\N	\N
7150	299	24	1	\N	\N	\N	\N
7151	299	27	3	\N	\N	\N	\N
7152	299	28	4	\N	\N	\N	\N
7153	299	29	1	\N	\N	\N	\N
7154	299	30	4	\N	\N	\N	\N
7155	299	31	4	\N	\N	\N	\N
7156	299	32	4	\N	\N	\N	\N
7157	299	33	4	\N	\N	\N	\N
7158	299	34	4	\N	\N	\N	\N
7159	299	35	2	\N	\N	\N	\N
7160	299	36	3	\N	\N	\N	\N
7161	299	37	3	\N	\N	\N	\N
7162	299	38	3	\N	\N	\N	\N
7163	299	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.877	MODELO
7164	299	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.892	MODELO
7165	298	18	4	\N	\N	\N	\N
7166	298	19	4	\N	\N	\N	\N
7167	298	20	4	\N	\N	\N	\N
7168	298	21	2	\N	\N	\N	\N
7169	298	22	4	\N	\N	\N	\N
7170	298	23	3	\N	\N	\N	\N
7171	298	24	4	\N	\N	\N	\N
7172	298	27	4	\N	\N	\N	\N
7173	298	28	3	\N	\N	\N	\N
7174	298	29	4	\N	\N	\N	\N
7175	298	30	3	\N	\N	\N	\N
7176	298	31	3	\N	\N	\N	\N
7177	298	32	4	\N	\N	\N	\N
7178	298	33	4	\N	\N	\N	\N
7179	298	34	4	\N	\N	\N	\N
7180	298	35	2	\N	\N	\N	\N
7181	298	36	3	\N	\N	\N	\N
7182	298	37	4	\N	\N	\N	\N
7183	298	38	4	\N	\N	\N	\N
7184	298	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.522	MODELO
7185	298	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.749	MODELO
7186	297	18	4	\N	\N	\N	\N
7187	297	19	3	\N	\N	\N	\N
7188	297	20	4	\N	\N	\N	\N
7189	297	21	3	\N	\N	\N	\N
7190	297	22	1	\N	\N	\N	\N
7191	297	23	4	\N	\N	\N	\N
7192	297	24	2	\N	\N	\N	\N
7193	297	27	4	\N	\N	\N	\N
7194	297	28	4	\N	\N	\N	\N
7195	297	29	4	\N	\N	\N	\N
7196	297	30	2	\N	\N	\N	\N
7197	297	31	4	\N	\N	\N	\N
7198	297	32	4	\N	\N	\N	\N
7199	297	33	4	\N	\N	\N	\N
7200	297	34	4	\N	\N	\N	\N
7201	297	35	4	\N	\N	\N	\N
7202	297	36	3	\N	\N	\N	\N
7203	297	37	3	\N	\N	\N	\N
7204	297	38	4	\N	\N	\N	\N
7321	966	29	4	\N	\N	\N	\N
7205	297	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.615	MODELO
7206	297	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.832	MODELO
7207	296	18	4	\N	\N	\N	\N
7208	296	19	3	\N	\N	\N	\N
7209	296	20	4	\N	\N	\N	\N
7210	296	21	4	\N	\N	\N	\N
7211	296	22	3	\N	\N	\N	\N
7212	296	23	3	\N	\N	\N	\N
7213	296	24	4	\N	\N	\N	\N
7214	296	27	4	\N	\N	\N	\N
7215	296	28	4	\N	\N	\N	\N
7216	296	29	4	\N	\N	\N	\N
7217	296	30	3	\N	\N	\N	\N
7218	296	31	3	\N	\N	\N	\N
7219	296	32	3	\N	\N	\N	\N
7220	296	33	2	\N	\N	\N	\N
7221	296	34	3	\N	\N	\N	\N
7222	296	35	4	\N	\N	\N	\N
7223	296	36	4	\N	\N	\N	\N
7224	296	37	4	\N	\N	\N	\N
7225	296	38	4	\N	\N	\N	\N
7226	296	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.886	MODELO
7227	296	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.962	MODELO
7228	295	18	4	\N	\N	\N	\N
7229	295	19	4	\N	\N	\N	\N
7230	295	20	1	\N	\N	\N	\N
7231	295	21	3	\N	\N	\N	\N
7232	295	22	4	\N	\N	\N	\N
7233	295	23	1	\N	\N	\N	\N
7234	295	24	4	\N	\N	\N	\N
7235	295	27	3	\N	\N	\N	\N
7236	295	28	4	\N	\N	\N	\N
7237	295	29	4	\N	\N	\N	\N
7238	295	30	4	\N	\N	\N	\N
7239	295	31	4	\N	\N	\N	\N
7240	295	32	3	\N	\N	\N	\N
7241	295	33	2	\N	\N	\N	\N
7242	295	34	4	\N	\N	\N	\N
7243	295	35	2	\N	\N	\N	\N
7244	295	36	4	\N	\N	\N	\N
7245	295	37	3	\N	\N	\N	\N
7246	295	38	3	\N	\N	\N	\N
7247	295	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.867	MODELO
7248	295	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.956	MODELO
7249	294	18	4	\N	\N	\N	\N
7250	294	19	4	\N	\N	\N	\N
7251	294	20	4	\N	\N	\N	\N
7252	294	21	3	\N	\N	\N	\N
7253	294	22	4	\N	\N	\N	\N
7254	294	23	3	\N	\N	\N	\N
7255	294	24	4	\N	\N	\N	\N
7256	294	27	4	\N	\N	\N	\N
7257	294	28	4	\N	\N	\N	\N
7258	294	29	4	\N	\N	\N	\N
7259	294	30	4	\N	\N	\N	\N
7260	294	31	4	\N	\N	\N	\N
7261	294	32	3	\N	\N	\N	\N
7262	294	33	4	\N	\N	\N	\N
7263	294	34	4	\N	\N	\N	\N
7264	294	35	3	\N	\N	\N	\N
7265	294	36	2	\N	\N	\N	\N
7266	294	37	4	\N	\N	\N	\N
7267	294	38	4	\N	\N	\N	\N
7268	294	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.978	MODELO
7269	294	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.784	MODELO
7270	293	18	4	\N	\N	\N	\N
7271	293	19	3	\N	\N	\N	\N
7272	293	20	4	\N	\N	\N	\N
7273	293	21	1	\N	\N	\N	\N
7274	293	22	4	\N	\N	\N	\N
7275	293	23	3	\N	\N	\N	\N
7276	293	24	4	\N	\N	\N	\N
7277	293	27	3	\N	\N	\N	\N
7278	293	28	4	\N	\N	\N	\N
7279	293	29	4	\N	\N	\N	\N
7280	293	30	4	\N	\N	\N	\N
7281	293	31	4	\N	\N	\N	\N
7282	293	32	4	\N	\N	\N	\N
7283	293	33	4	\N	\N	\N	\N
7284	293	34	4	\N	\N	\N	\N
7285	293	35	3	\N	\N	\N	\N
7286	293	36	4	\N	\N	\N	\N
7287	293	37	2	\N	\N	\N	\N
7288	293	38	4	\N	\N	\N	\N
7289	293	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.84	MODELO
7290	293	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.634	MODELO
7291	292	18	4	\N	\N	\N	\N
7292	292	19	3	\N	\N	\N	\N
7293	292	20	3	\N	\N	\N	\N
7294	292	21	4	\N	\N	\N	\N
7295	292	22	4	\N	\N	\N	\N
7296	292	23	4	\N	\N	\N	\N
7297	292	24	3	\N	\N	\N	\N
7298	292	27	3	\N	\N	\N	\N
7299	292	28	4	\N	\N	\N	\N
7300	292	29	4	\N	\N	\N	\N
7301	292	30	4	\N	\N	\N	\N
7302	292	31	3	\N	\N	\N	\N
7303	292	32	4	\N	\N	\N	\N
7304	292	33	4	\N	\N	\N	\N
7305	292	34	4	\N	\N	\N	\N
7306	292	35	3	\N	\N	\N	\N
7307	292	36	4	\N	\N	\N	\N
7308	292	37	4	\N	\N	\N	\N
7309	292	38	4	\N	\N	\N	\N
7310	292	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.853	MODELO
7311	292	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.803	MODELO
7312	966	18	4	\N	\N	\N	\N
7313	966	19	4	\N	\N	\N	\N
7314	966	20	4	\N	\N	\N	\N
7315	966	21	4	\N	\N	\N	\N
7316	966	22	4	\N	\N	\N	\N
7317	966	23	4	\N	\N	\N	\N
7318	966	24	4	\N	\N	\N	\N
7319	966	27	3	\N	\N	\N	\N
7320	966	28	4	\N	\N	\N	\N
7322	966	30	4	\N	\N	\N	\N
7323	966	31	4	\N	\N	\N	\N
7324	966	32	4	\N	\N	\N	\N
7325	966	33	4	\N	\N	\N	\N
7326	966	34	4	\N	\N	\N	\N
7327	966	35	3	\N	\N	\N	\N
7328	966	36	3	\N	\N	\N	\N
7329	966	37	3	\N	\N	\N	\N
7330	966	38	4	\N	\N	\N	\N
7331	966	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.778	MODELO
7332	966	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.745	MODELO
7333	965	18	3	\N	\N	\N	\N
7334	965	19	4	\N	\N	\N	\N
7335	965	20	4	\N	\N	\N	\N
7336	965	21	3	\N	\N	\N	\N
7337	965	22	4	\N	\N	\N	\N
7338	965	23	4	\N	\N	\N	\N
7339	965	24	4	\N	\N	\N	\N
7340	965	27	4	\N	\N	\N	\N
7341	965	28	4	\N	\N	\N	\N
7342	965	29	3	\N	\N	\N	\N
7343	965	30	4	\N	\N	\N	\N
7344	965	31	3	\N	\N	\N	\N
7345	965	32	3	\N	\N	\N	\N
7346	965	33	3	\N	\N	\N	\N
7347	965	34	4	\N	\N	\N	\N
7348	965	35	4	\N	\N	\N	\N
7349	965	36	4	\N	\N	\N	\N
7350	965	37	4	\N	\N	\N	\N
7351	965	38	3	\N	\N	\N	\N
7352	965	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.804	MODELO
7353	965	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.914	MODELO
7354	964	18	2	\N	\N	\N	\N
7355	964	19	3	\N	\N	\N	\N
7356	964	20	3	\N	\N	\N	\N
7357	964	21	1	\N	\N	\N	\N
7358	964	22	3	\N	\N	\N	\N
7359	964	23	1	\N	\N	\N	\N
7360	964	24	4	\N	\N	\N	\N
7361	964	27	4	\N	\N	\N	\N
7362	964	28	4	\N	\N	\N	\N
7363	964	29	4	\N	\N	\N	\N
7364	964	30	4	\N	\N	\N	\N
7365	964	31	4	\N	\N	\N	\N
7366	964	32	2	\N	\N	\N	\N
7367	964	33	2	\N	\N	\N	\N
7368	964	34	4	\N	\N	\N	\N
7369	964	35	3	\N	\N	\N	\N
7370	964	36	3	\N	\N	\N	\N
7371	964	37	4	\N	\N	\N	\N
7372	964	38	4	\N	\N	\N	\N
7373	964	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.905	MODELO
7374	964	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.849	MODELO
7375	963	18	4	\N	\N	\N	\N
7376	963	19	4	\N	\N	\N	\N
7377	963	20	4	\N	\N	\N	\N
7378	963	21	4	\N	\N	\N	\N
7379	963	22	4	\N	\N	\N	\N
7380	963	23	4	\N	\N	\N	\N
7381	963	24	4	\N	\N	\N	\N
7382	963	27	3	\N	\N	\N	\N
7383	963	28	4	\N	\N	\N	\N
7384	963	29	3	\N	\N	\N	\N
7385	963	30	4	\N	\N	\N	\N
7386	963	31	4	\N	\N	\N	\N
7387	963	32	4	\N	\N	\N	\N
7388	963	33	4	\N	\N	\N	\N
7389	963	34	4	\N	\N	\N	\N
7390	963	35	4	\N	\N	\N	\N
7391	963	36	2	\N	\N	\N	\N
7392	963	37	4	\N	\N	\N	\N
7393	963	38	3	\N	\N	\N	\N
7394	963	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.828	MODELO
7395	963	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.667	MODELO
7396	962	18	2	\N	\N	\N	\N
7397	962	19	4	\N	\N	\N	\N
7398	962	20	3	\N	\N	\N	\N
7399	962	21	4	\N	\N	\N	\N
7400	962	22	2	\N	\N	\N	\N
7401	962	23	4	\N	\N	\N	\N
7402	962	24	4	\N	\N	\N	\N
7403	962	27	3	\N	\N	\N	\N
7404	962	28	4	\N	\N	\N	\N
7405	962	29	4	\N	\N	\N	\N
7406	962	30	4	\N	\N	\N	\N
7407	962	31	4	\N	\N	\N	\N
7408	962	32	4	\N	\N	\N	\N
7409	962	33	3	\N	\N	\N	\N
7410	962	34	4	\N	\N	\N	\N
7411	962	35	3	\N	\N	\N	\N
7412	962	36	3	\N	\N	\N	\N
7413	962	37	2	\N	\N	\N	\N
7414	962	38	4	\N	\N	\N	\N
7415	962	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.726	MODELO
7416	962	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.851	MODELO
7417	961	18	4	\N	\N	\N	\N
7418	961	19	4	\N	\N	\N	\N
7419	961	20	4	\N	\N	\N	\N
7420	961	21	3	\N	\N	\N	\N
7421	961	22	4	\N	\N	\N	\N
7422	961	23	4	\N	\N	\N	\N
7423	961	24	4	\N	\N	\N	\N
7424	961	27	4	\N	\N	\N	\N
7425	961	28	2	\N	\N	\N	\N
7426	961	29	4	\N	\N	\N	\N
7427	961	30	2	\N	\N	\N	\N
7428	961	31	4	\N	\N	\N	\N
7429	961	32	4	\N	\N	\N	\N
7430	961	33	4	\N	\N	\N	\N
7431	961	34	1	\N	\N	\N	\N
7432	961	35	4	\N	\N	\N	\N
7433	961	36	1	\N	\N	\N	\N
7434	961	37	2	\N	\N	\N	\N
7435	961	38	3	\N	\N	\N	\N
7436	961	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.755	MODELO
7437	961	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.88	MODELO
7438	960	18	3	\N	\N	\N	\N
7439	960	19	3	\N	\N	\N	\N
7440	960	20	4	\N	\N	\N	\N
7441	960	21	4	\N	\N	\N	\N
7442	960	22	4	\N	\N	\N	\N
7443	960	23	4	\N	\N	\N	\N
7444	960	24	4	\N	\N	\N	\N
7445	960	27	3	\N	\N	\N	\N
7446	960	28	4	\N	\N	\N	\N
7447	960	29	4	\N	\N	\N	\N
7448	960	30	4	\N	\N	\N	\N
7449	960	31	1	\N	\N	\N	\N
7450	960	32	4	\N	\N	\N	\N
7451	960	33	4	\N	\N	\N	\N
7452	960	34	3	\N	\N	\N	\N
7453	960	35	4	\N	\N	\N	\N
7454	960	36	1	\N	\N	\N	\N
7455	960	37	4	\N	\N	\N	\N
7456	960	38	2	\N	\N	\N	\N
7457	960	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.85	MODELO
7458	960	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.767	MODELO
7459	959	18	4	\N	\N	\N	\N
7460	959	19	4	\N	\N	\N	\N
7461	959	20	4	\N	\N	\N	\N
7462	959	21	4	\N	\N	\N	\N
7463	959	22	3	\N	\N	\N	\N
7464	959	23	3	\N	\N	\N	\N
7465	959	24	4	\N	\N	\N	\N
7466	959	27	4	\N	\N	\N	\N
7467	959	28	2	\N	\N	\N	\N
7468	959	29	4	\N	\N	\N	\N
7469	959	30	4	\N	\N	\N	\N
7470	959	31	4	\N	\N	\N	\N
7471	959	32	4	\N	\N	\N	\N
7472	959	33	3	\N	\N	\N	\N
7473	959	34	4	\N	\N	\N	\N
7474	959	35	4	\N	\N	\N	\N
7475	959	36	3	\N	\N	\N	\N
7476	959	37	3	\N	\N	\N	\N
7477	959	38	4	\N	\N	\N	\N
7478	959	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.764	MODELO
7479	959	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.768	MODELO
7480	958	18	4	\N	\N	\N	\N
7481	958	19	2	\N	\N	\N	\N
7482	958	20	4	\N	\N	\N	\N
7483	958	21	4	\N	\N	\N	\N
7484	958	22	4	\N	\N	\N	\N
7485	958	23	4	\N	\N	\N	\N
7486	958	24	3	\N	\N	\N	\N
7487	958	27	3	\N	\N	\N	\N
7488	958	28	2	\N	\N	\N	\N
7489	958	29	4	\N	\N	\N	\N
7490	958	30	4	\N	\N	\N	\N
7491	958	31	3	\N	\N	\N	\N
7492	958	32	4	\N	\N	\N	\N
7493	958	33	3	\N	\N	\N	\N
7494	958	34	3	\N	\N	\N	\N
7495	958	35	2	\N	\N	\N	\N
7496	958	36	4	\N	\N	\N	\N
7497	958	37	2	\N	\N	\N	\N
7498	958	38	4	\N	\N	\N	\N
7499	958	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.78	MODELO
7500	958	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.751	MODELO
7501	957	18	4	\N	\N	\N	\N
7502	957	19	4	\N	\N	\N	\N
7503	957	20	3	\N	\N	\N	\N
7504	957	21	3	\N	\N	\N	\N
7505	957	22	4	\N	\N	\N	\N
7506	957	23	4	\N	\N	\N	\N
7507	957	24	4	\N	\N	\N	\N
7508	957	27	4	\N	\N	\N	\N
7509	957	28	3	\N	\N	\N	\N
7510	957	29	4	\N	\N	\N	\N
7511	957	30	3	\N	\N	\N	\N
7512	957	31	4	\N	\N	\N	\N
7513	957	32	2	\N	\N	\N	\N
7514	957	33	4	\N	\N	\N	\N
7515	957	34	3	\N	\N	\N	\N
7516	957	35	3	\N	\N	\N	\N
7517	957	36	4	\N	\N	\N	\N
7518	957	37	4	\N	\N	\N	\N
7519	957	38	4	\N	\N	\N	\N
7520	957	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.87	MODELO
7521	957	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.765	MODELO
7522	956	18	4	\N	\N	\N	\N
7523	956	19	3	\N	\N	\N	\N
7524	956	20	4	\N	\N	\N	\N
7525	956	21	3	\N	\N	\N	\N
7526	956	22	4	\N	\N	\N	\N
7527	956	23	2	\N	\N	\N	\N
7528	956	24	4	\N	\N	\N	\N
7529	956	27	3	\N	\N	\N	\N
7530	956	28	4	\N	\N	\N	\N
7531	956	29	4	\N	\N	\N	\N
7532	956	30	4	\N	\N	\N	\N
7533	956	31	2	\N	\N	\N	\N
7534	956	32	4	\N	\N	\N	\N
7535	956	33	4	\N	\N	\N	\N
7536	956	34	3	\N	\N	\N	\N
7537	956	35	3	\N	\N	\N	\N
7538	956	36	4	\N	\N	\N	\N
7539	956	37	4	\N	\N	\N	\N
7540	956	38	4	\N	\N	\N	\N
7541	956	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.84	MODELO
7542	956	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.863	MODELO
7543	955	18	4	\N	\N	\N	\N
7544	955	19	4	\N	\N	\N	\N
7545	955	20	4	\N	\N	\N	\N
7546	955	21	3	\N	\N	\N	\N
7547	955	22	4	\N	\N	\N	\N
7548	955	23	3	\N	\N	\N	\N
7549	955	24	3	\N	\N	\N	\N
7550	955	27	3	\N	\N	\N	\N
7551	955	28	4	\N	\N	\N	\N
7552	955	29	4	\N	\N	\N	\N
7553	955	30	3	\N	\N	\N	\N
7554	955	31	3	\N	\N	\N	\N
7555	955	32	4	\N	\N	\N	\N
7556	955	33	4	\N	\N	\N	\N
7557	955	34	3	\N	\N	\N	\N
7558	955	35	3	\N	\N	\N	\N
7559	955	36	4	\N	\N	\N	\N
7560	955	37	4	\N	\N	\N	\N
7561	955	38	3	\N	\N	\N	\N
7562	955	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.737	MODELO
7563	955	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.811	MODELO
7564	954	18	4	\N	\N	\N	\N
7565	954	19	4	\N	\N	\N	\N
7566	954	20	4	\N	\N	\N	\N
7567	954	21	4	\N	\N	\N	\N
7568	954	22	3	\N	\N	\N	\N
7569	954	23	3	\N	\N	\N	\N
7570	954	24	4	\N	\N	\N	\N
7571	954	27	4	\N	\N	\N	\N
7572	954	28	2	\N	\N	\N	\N
7573	954	29	4	\N	\N	\N	\N
7574	954	30	4	\N	\N	\N	\N
7575	954	31	4	\N	\N	\N	\N
7576	954	32	4	\N	\N	\N	\N
7577	954	33	4	\N	\N	\N	\N
7578	954	34	4	\N	\N	\N	\N
7579	954	35	3	\N	\N	\N	\N
7580	954	36	4	\N	\N	\N	\N
7581	954	37	3	\N	\N	\N	\N
7582	954	38	4	\N	\N	\N	\N
7583	954	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.951	MODELO
7584	954	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.525	MODELO
7585	953	18	4	\N	\N	\N	\N
7586	953	19	3	\N	\N	\N	\N
7587	953	20	4	\N	\N	\N	\N
7588	953	21	4	\N	\N	\N	\N
7589	953	22	2	\N	\N	\N	\N
7590	953	23	4	\N	\N	\N	\N
7591	953	24	4	\N	\N	\N	\N
7592	953	27	4	\N	\N	\N	\N
7593	953	28	3	\N	\N	\N	\N
7594	953	29	2	\N	\N	\N	\N
7595	953	30	4	\N	\N	\N	\N
7596	953	31	4	\N	\N	\N	\N
7597	953	32	3	\N	\N	\N	\N
7598	953	33	4	\N	\N	\N	\N
7599	953	34	3	\N	\N	\N	\N
7600	953	35	4	\N	\N	\N	\N
7601	953	36	2	\N	\N	\N	\N
7602	953	37	4	\N	\N	\N	\N
7603	953	38	4	\N	\N	\N	\N
7604	953	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.783	MODELO
7605	953	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.791	MODELO
7606	952	18	4	\N	\N	\N	\N
7607	952	19	4	\N	\N	\N	\N
7608	952	20	4	\N	\N	\N	\N
7609	952	21	3	\N	\N	\N	\N
7610	952	22	4	\N	\N	\N	\N
7611	952	23	4	\N	\N	\N	\N
7612	952	24	4	\N	\N	\N	\N
7613	952	27	4	\N	\N	\N	\N
7614	952	28	4	\N	\N	\N	\N
7615	952	29	3	\N	\N	\N	\N
7616	952	30	4	\N	\N	\N	\N
7617	952	31	4	\N	\N	\N	\N
7618	952	32	4	\N	\N	\N	\N
7619	952	33	4	\N	\N	\N	\N
7620	952	34	4	\N	\N	\N	\N
7621	952	35	4	\N	\N	\N	\N
7622	952	36	4	\N	\N	\N	\N
7623	952	37	4	\N	\N	\N	\N
7624	952	38	4	\N	\N	\N	\N
7625	952	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.504	MODELO
7626	952	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.703	MODELO
7627	951	18	4	\N	\N	\N	\N
7628	951	19	2	\N	\N	\N	\N
7629	951	20	2	\N	\N	\N	\N
7630	951	21	4	\N	\N	\N	\N
7631	951	22	3	\N	\N	\N	\N
7632	951	23	3	\N	\N	\N	\N
7633	951	24	3	\N	\N	\N	\N
7634	951	27	4	\N	\N	\N	\N
7635	951	28	1	\N	\N	\N	\N
7636	951	29	2	\N	\N	\N	\N
7637	951	30	4	\N	\N	\N	\N
7638	951	31	4	\N	\N	\N	\N
7639	951	32	3	\N	\N	\N	\N
7640	951	33	4	\N	\N	\N	\N
7641	951	34	3	\N	\N	\N	\N
7642	951	35	4	\N	\N	\N	\N
7643	951	36	3	\N	\N	\N	\N
7644	951	37	4	\N	\N	\N	\N
7645	951	38	4	\N	\N	\N	\N
7646	951	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.944	MODELO
7647	951	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.683	MODELO
7648	950	18	4	\N	\N	\N	\N
7649	950	19	4	\N	\N	\N	\N
7650	950	20	4	\N	\N	\N	\N
7651	950	21	3	\N	\N	\N	\N
7652	950	22	4	\N	\N	\N	\N
7653	950	23	3	\N	\N	\N	\N
7654	950	24	3	\N	\N	\N	\N
7655	950	27	4	\N	\N	\N	\N
7656	950	28	4	\N	\N	\N	\N
7657	950	29	3	\N	\N	\N	\N
7658	950	30	4	\N	\N	\N	\N
7659	950	31	4	\N	\N	\N	\N
7660	950	32	4	\N	\N	\N	\N
7661	950	33	4	\N	\N	\N	\N
7662	950	34	4	\N	\N	\N	\N
7663	950	35	4	\N	\N	\N	\N
7664	950	36	3	\N	\N	\N	\N
7665	950	37	4	\N	\N	\N	\N
7666	950	38	3	\N	\N	\N	\N
7667	950	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.946	MODELO
7668	950	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.723	MODELO
7669	949	18	3	\N	\N	\N	\N
7670	949	19	4	\N	\N	\N	\N
7671	949	20	4	\N	\N	\N	\N
7672	949	21	3	\N	\N	\N	\N
7673	949	22	4	\N	\N	\N	\N
7674	949	23	3	\N	\N	\N	\N
7675	949	24	3	\N	\N	\N	\N
7676	949	27	4	\N	\N	\N	\N
7677	949	28	4	\N	\N	\N	\N
7678	949	29	2	\N	\N	\N	\N
7679	949	30	4	\N	\N	\N	\N
7680	949	31	4	\N	\N	\N	\N
7681	949	32	3	\N	\N	\N	\N
7682	949	33	4	\N	\N	\N	\N
7683	949	34	4	\N	\N	\N	\N
7684	949	35	4	\N	\N	\N	\N
7685	949	36	4	\N	\N	\N	\N
7686	949	37	4	\N	\N	\N	\N
7687	949	38	4	\N	\N	\N	\N
7688	949	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.959	MODELO
7689	949	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.711	MODELO
7690	948	18	3	\N	\N	\N	\N
7691	948	19	3	\N	\N	\N	\N
7692	948	20	4	\N	\N	\N	\N
7693	948	21	3	\N	\N	\N	\N
7694	948	22	4	\N	\N	\N	\N
7695	948	23	4	\N	\N	\N	\N
7696	948	24	4	\N	\N	\N	\N
7697	948	27	4	\N	\N	\N	\N
7698	948	28	4	\N	\N	\N	\N
7699	948	29	4	\N	\N	\N	\N
7700	948	30	4	\N	\N	\N	\N
7701	948	31	4	\N	\N	\N	\N
7702	948	32	4	\N	\N	\N	\N
7703	948	33	4	\N	\N	\N	\N
7704	948	34	4	\N	\N	\N	\N
7705	948	35	4	\N	\N	\N	\N
7706	948	36	3	\N	\N	\N	\N
7707	948	37	4	\N	\N	\N	\N
7708	948	38	3	\N	\N	\N	\N
7709	948	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.738	MODELO
7710	948	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.926	MODELO
7711	947	18	4	\N	\N	\N	\N
7712	947	19	3	\N	\N	\N	\N
7713	947	20	4	\N	\N	\N	\N
7714	947	21	4	\N	\N	\N	\N
7715	947	22	4	\N	\N	\N	\N
7716	947	23	3	\N	\N	\N	\N
7717	947	24	4	\N	\N	\N	\N
7718	947	27	4	\N	\N	\N	\N
7719	947	28	4	\N	\N	\N	\N
7720	947	29	1	\N	\N	\N	\N
7721	947	30	4	\N	\N	\N	\N
7722	947	31	4	\N	\N	\N	\N
7723	947	32	4	\N	\N	\N	\N
7724	947	33	3	\N	\N	\N	\N
7725	947	34	4	\N	\N	\N	\N
7726	947	35	3	\N	\N	\N	\N
7727	947	36	4	\N	\N	\N	\N
7728	947	37	3	\N	\N	\N	\N
7729	947	38	4	\N	\N	\N	\N
7730	947	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.823	MODELO
7731	947	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.928	MODELO
7732	946	18	4	\N	\N	\N	\N
7733	946	19	4	\N	\N	\N	\N
7734	946	20	3	\N	\N	\N	\N
7735	946	21	3	\N	\N	\N	\N
7736	946	22	4	\N	\N	\N	\N
7737	946	23	4	\N	\N	\N	\N
7738	946	24	4	\N	\N	\N	\N
7739	946	27	4	\N	\N	\N	\N
7740	946	28	4	\N	\N	\N	\N
7741	946	29	4	\N	\N	\N	\N
7742	946	30	2	\N	\N	\N	\N
7743	946	31	2	\N	\N	\N	\N
7744	946	32	4	\N	\N	\N	\N
7745	946	33	2	\N	\N	\N	\N
7746	946	34	4	\N	\N	\N	\N
7747	946	35	4	\N	\N	\N	\N
7748	946	36	4	\N	\N	\N	\N
7749	946	37	4	\N	\N	\N	\N
7750	946	38	4	\N	\N	\N	\N
7751	946	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.968	MODELO
7752	946	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.739	MODELO
7753	945	18	3	\N	\N	\N	\N
7754	945	19	4	\N	\N	\N	\N
7755	945	20	4	\N	\N	\N	\N
7756	945	21	4	\N	\N	\N	\N
7757	945	22	2	\N	\N	\N	\N
7758	945	23	3	\N	\N	\N	\N
7759	945	24	3	\N	\N	\N	\N
7760	945	27	3	\N	\N	\N	\N
7761	945	28	3	\N	\N	\N	\N
7762	945	29	4	\N	\N	\N	\N
7763	945	30	2	\N	\N	\N	\N
7764	945	31	1	\N	\N	\N	\N
7765	945	32	4	\N	\N	\N	\N
7766	945	33	4	\N	\N	\N	\N
7767	945	34	2	\N	\N	\N	\N
7768	945	35	4	\N	\N	\N	\N
7769	945	36	4	\N	\N	\N	\N
7770	945	37	4	\N	\N	\N	\N
7771	945	38	4	\N	\N	\N	\N
7772	945	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.797	MODELO
7773	945	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.578	MODELO
7774	944	18	4	\N	\N	\N	\N
7775	944	19	3	\N	\N	\N	\N
7776	944	20	4	\N	\N	\N	\N
7777	944	21	4	\N	\N	\N	\N
7778	944	22	4	\N	\N	\N	\N
7779	944	23	4	\N	\N	\N	\N
7780	944	24	3	\N	\N	\N	\N
7781	944	27	4	\N	\N	\N	\N
7782	944	28	4	\N	\N	\N	\N
7783	944	29	4	\N	\N	\N	\N
7784	944	30	3	\N	\N	\N	\N
7785	944	31	4	\N	\N	\N	\N
7786	944	32	4	\N	\N	\N	\N
7787	944	33	3	\N	\N	\N	\N
7788	944	34	4	\N	\N	\N	\N
7789	944	35	4	\N	\N	\N	\N
7790	944	36	4	\N	\N	\N	\N
7791	944	37	3	\N	\N	\N	\N
7792	944	38	4	\N	\N	\N	\N
7793	944	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.764	MODELO
7794	944	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.849	MODELO
7795	943	18	3	\N	\N	\N	\N
7796	943	19	3	\N	\N	\N	\N
7797	943	20	4	\N	\N	\N	\N
7798	943	21	1	\N	\N	\N	\N
7799	943	22	4	\N	\N	\N	\N
7800	943	23	2	\N	\N	\N	\N
7801	943	24	3	\N	\N	\N	\N
7802	943	27	4	\N	\N	\N	\N
7803	943	28	4	\N	\N	\N	\N
7804	943	29	4	\N	\N	\N	\N
7805	943	30	4	\N	\N	\N	\N
7806	943	31	4	\N	\N	\N	\N
7807	943	32	4	\N	\N	\N	\N
7808	943	33	3	\N	\N	\N	\N
7809	943	34	4	\N	\N	\N	\N
7810	943	35	4	\N	\N	\N	\N
7811	943	36	4	\N	\N	\N	\N
7812	943	37	4	\N	\N	\N	\N
7813	943	38	3	\N	\N	\N	\N
7814	943	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.968	MODELO
7815	943	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.984	MODELO
7816	942	18	4	\N	\N	\N	\N
7817	942	19	4	\N	\N	\N	\N
7818	942	20	4	\N	\N	\N	\N
7819	942	21	4	\N	\N	\N	\N
7820	942	22	4	\N	\N	\N	\N
7821	942	23	4	\N	\N	\N	\N
7822	942	24	4	\N	\N	\N	\N
7823	942	27	4	\N	\N	\N	\N
7824	942	28	1	\N	\N	\N	\N
7825	942	29	4	\N	\N	\N	\N
7826	942	30	4	\N	\N	\N	\N
7827	942	31	4	\N	\N	\N	\N
7828	942	32	1	\N	\N	\N	\N
7829	942	33	4	\N	\N	\N	\N
7830	942	34	4	\N	\N	\N	\N
7831	942	35	4	\N	\N	\N	\N
7832	942	36	4	\N	\N	\N	\N
7833	942	37	2	\N	\N	\N	\N
7834	942	38	2	\N	\N	\N	\N
7835	942	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.542	MODELO
7836	942	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.665	MODELO
7837	941	18	4	\N	\N	\N	\N
7838	941	19	4	\N	\N	\N	\N
7839	941	20	4	\N	\N	\N	\N
7840	941	21	4	\N	\N	\N	\N
7841	941	22	4	\N	\N	\N	\N
7842	941	23	4	\N	\N	\N	\N
7843	941	24	4	\N	\N	\N	\N
7844	941	27	4	\N	\N	\N	\N
7845	941	28	3	\N	\N	\N	\N
7846	941	29	2	\N	\N	\N	\N
7847	941	30	4	\N	\N	\N	\N
7848	941	31	4	\N	\N	\N	\N
7849	941	32	4	\N	\N	\N	\N
7850	941	33	4	\N	\N	\N	\N
7851	941	34	3	\N	\N	\N	\N
7852	941	35	4	\N	\N	\N	\N
7853	941	36	3	\N	\N	\N	\N
7854	941	37	3	\N	\N	\N	\N
7855	941	38	3	\N	\N	\N	\N
7856	941	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.888	MODELO
7857	941	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.659	MODELO
7858	940	18	4	\N	\N	\N	\N
7859	940	19	4	\N	\N	\N	\N
7860	940	20	1	\N	\N	\N	\N
7861	940	21	4	\N	\N	\N	\N
7862	940	22	4	\N	\N	\N	\N
7863	940	23	4	\N	\N	\N	\N
7864	940	24	4	\N	\N	\N	\N
7865	940	27	4	\N	\N	\N	\N
7866	940	28	4	\N	\N	\N	\N
7867	940	29	3	\N	\N	\N	\N
7868	940	30	4	\N	\N	\N	\N
7869	940	31	3	\N	\N	\N	\N
7870	940	32	3	\N	\N	\N	\N
7871	940	33	4	\N	\N	\N	\N
7872	940	34	3	\N	\N	\N	\N
7873	940	35	4	\N	\N	\N	\N
7874	940	36	4	\N	\N	\N	\N
7875	940	37	4	\N	\N	\N	\N
7876	940	38	4	\N	\N	\N	\N
7877	940	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.9	MODELO
7878	940	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.89	MODELO
7879	939	18	4	\N	\N	\N	\N
7880	939	19	4	\N	\N	\N	\N
7881	939	20	3	\N	\N	\N	\N
7882	939	21	3	\N	\N	\N	\N
7883	939	22	3	\N	\N	\N	\N
7884	939	23	2	\N	\N	\N	\N
7885	939	24	4	\N	\N	\N	\N
7886	939	27	3	\N	\N	\N	\N
7887	939	28	4	\N	\N	\N	\N
7888	939	29	4	\N	\N	\N	\N
7889	939	30	4	\N	\N	\N	\N
7890	939	31	3	\N	\N	\N	\N
7891	939	32	4	\N	\N	\N	\N
7892	939	33	4	\N	\N	\N	\N
7893	939	34	4	\N	\N	\N	\N
7894	939	35	3	\N	\N	\N	\N
7895	939	36	4	\N	\N	\N	\N
7896	939	37	4	\N	\N	\N	\N
7897	939	38	3	\N	\N	\N	\N
7898	939	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.79	MODELO
7899	939	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.729	MODELO
7900	938	18	3	\N	\N	\N	\N
7901	938	19	4	\N	\N	\N	\N
7902	938	20	4	\N	\N	\N	\N
7903	938	21	1	\N	\N	\N	\N
7904	938	22	3	\N	\N	\N	\N
7905	938	23	4	\N	\N	\N	\N
7906	938	24	4	\N	\N	\N	\N
7907	938	27	3	\N	\N	\N	\N
7908	938	28	4	\N	\N	\N	\N
7909	938	29	4	\N	\N	\N	\N
7910	938	30	4	\N	\N	\N	\N
7911	938	31	3	\N	\N	\N	\N
7912	938	32	4	\N	\N	\N	\N
7913	938	33	2	\N	\N	\N	\N
7914	938	34	3	\N	\N	\N	\N
7915	938	35	4	\N	\N	\N	\N
7916	938	36	4	\N	\N	\N	\N
7917	938	37	4	\N	\N	\N	\N
7918	938	38	3	\N	\N	\N	\N
7919	938	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.969	MODELO
7920	938	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.881	MODELO
7921	937	18	4	\N	\N	\N	\N
7922	937	19	4	\N	\N	\N	\N
7923	937	20	2	\N	\N	\N	\N
7924	937	21	4	\N	\N	\N	\N
7925	937	22	4	\N	\N	\N	\N
7926	937	23	4	\N	\N	\N	\N
7927	937	24	4	\N	\N	\N	\N
7928	937	27	2	\N	\N	\N	\N
7929	937	28	2	\N	\N	\N	\N
7930	937	29	3	\N	\N	\N	\N
7931	937	30	4	\N	\N	\N	\N
7932	937	31	4	\N	\N	\N	\N
7933	937	32	3	\N	\N	\N	\N
7934	937	33	4	\N	\N	\N	\N
7935	937	34	4	\N	\N	\N	\N
7936	937	35	4	\N	\N	\N	\N
7937	937	36	4	\N	\N	\N	\N
7938	937	37	2	\N	\N	\N	\N
7939	937	38	4	\N	\N	\N	\N
7940	937	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.864	MODELO
7941	937	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.961	MODELO
7942	936	18	3	\N	\N	\N	\N
7943	936	19	4	\N	\N	\N	\N
7944	936	20	4	\N	\N	\N	\N
7945	936	21	4	\N	\N	\N	\N
7946	936	22	4	\N	\N	\N	\N
7947	936	23	3	\N	\N	\N	\N
7948	936	24	4	\N	\N	\N	\N
7949	936	27	4	\N	\N	\N	\N
7950	936	28	4	\N	\N	\N	\N
7951	936	29	4	\N	\N	\N	\N
7952	936	30	4	\N	\N	\N	\N
7953	936	31	4	\N	\N	\N	\N
7954	936	32	4	\N	\N	\N	\N
7955	936	33	4	\N	\N	\N	\N
7956	936	34	4	\N	\N	\N	\N
7957	936	35	4	\N	\N	\N	\N
7958	936	36	4	\N	\N	\N	\N
7959	936	37	4	\N	\N	\N	\N
7960	936	38	3	\N	\N	\N	\N
7961	936	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.889	MODELO
7962	936	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.605	MODELO
7963	935	18	3	\N	\N	\N	\N
7964	935	19	3	\N	\N	\N	\N
7965	935	20	4	\N	\N	\N	\N
7966	935	21	1	\N	\N	\N	\N
7967	935	22	1	\N	\N	\N	\N
7968	935	23	4	\N	\N	\N	\N
7969	935	24	4	\N	\N	\N	\N
7970	935	27	3	\N	\N	\N	\N
7971	935	28	4	\N	\N	\N	\N
7972	935	29	4	\N	\N	\N	\N
7973	935	30	4	\N	\N	\N	\N
7974	935	31	4	\N	\N	\N	\N
7975	935	32	4	\N	\N	\N	\N
7976	935	33	4	\N	\N	\N	\N
7977	935	34	4	\N	\N	\N	\N
7978	935	35	4	\N	\N	\N	\N
7979	935	36	3	\N	\N	\N	\N
7980	935	37	4	\N	\N	\N	\N
7981	935	38	3	\N	\N	\N	\N
7982	935	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.813	MODELO
7983	935	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.961	MODELO
7984	934	18	4	\N	\N	\N	\N
7985	934	19	3	\N	\N	\N	\N
7986	934	20	3	\N	\N	\N	\N
7987	934	21	3	\N	\N	\N	\N
7988	934	22	4	\N	\N	\N	\N
7989	934	23	4	\N	\N	\N	\N
7990	934	24	3	\N	\N	\N	\N
7991	934	27	4	\N	\N	\N	\N
7992	934	28	4	\N	\N	\N	\N
7993	934	29	4	\N	\N	\N	\N
7994	934	30	4	\N	\N	\N	\N
7995	934	31	3	\N	\N	\N	\N
7996	934	32	1	\N	\N	\N	\N
7997	934	33	4	\N	\N	\N	\N
7998	934	34	1	\N	\N	\N	\N
7999	934	35	4	\N	\N	\N	\N
8000	934	36	4	\N	\N	\N	\N
8001	934	37	4	\N	\N	\N	\N
8002	934	38	4	\N	\N	\N	\N
8003	934	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.867	MODELO
8004	934	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.808	MODELO
8005	933	18	3	\N	\N	\N	\N
8006	933	19	4	\N	\N	\N	\N
8007	933	20	3	\N	\N	\N	\N
8008	933	21	4	\N	\N	\N	\N
8009	933	22	4	\N	\N	\N	\N
8010	933	23	4	\N	\N	\N	\N
8011	933	24	3	\N	\N	\N	\N
8012	933	27	2	\N	\N	\N	\N
8013	933	28	2	\N	\N	\N	\N
8014	933	29	4	\N	\N	\N	\N
8015	933	30	4	\N	\N	\N	\N
8016	933	31	3	\N	\N	\N	\N
8017	933	32	4	\N	\N	\N	\N
8018	933	33	4	\N	\N	\N	\N
8019	933	34	4	\N	\N	\N	\N
8020	933	35	3	\N	\N	\N	\N
8021	933	36	1	\N	\N	\N	\N
8022	933	37	3	\N	\N	\N	\N
8023	933	38	4	\N	\N	\N	\N
8024	933	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.566	MODELO
8025	933	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.516	MODELO
8026	932	18	4	\N	\N	\N	\N
8027	932	19	4	\N	\N	\N	\N
8028	932	20	3	\N	\N	\N	\N
8029	932	21	4	\N	\N	\N	\N
8030	932	22	4	\N	\N	\N	\N
8031	932	23	2	\N	\N	\N	\N
8032	932	24	1	\N	\N	\N	\N
8033	932	27	4	\N	\N	\N	\N
8034	932	28	3	\N	\N	\N	\N
8035	932	29	4	\N	\N	\N	\N
8036	932	30	1	\N	\N	\N	\N
8037	932	31	4	\N	\N	\N	\N
8038	932	32	4	\N	\N	\N	\N
8039	932	33	4	\N	\N	\N	\N
8040	932	34	4	\N	\N	\N	\N
8041	932	35	1	\N	\N	\N	\N
8042	932	36	4	\N	\N	\N	\N
8043	932	37	4	\N	\N	\N	\N
8044	932	38	1	\N	\N	\N	\N
8045	932	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.546	MODELO
8046	932	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.952	MODELO
8047	451	18	3	\N	\N	\N	\N
8048	451	19	4	\N	\N	\N	\N
8049	451	20	3	\N	\N	\N	\N
8050	451	21	4	\N	\N	\N	\N
8051	451	22	4	\N	\N	\N	\N
8052	451	23	3	\N	\N	\N	\N
8053	451	24	3	\N	\N	\N	\N
8054	451	27	3	\N	\N	\N	\N
8055	451	28	3	\N	\N	\N	\N
8056	451	29	3	\N	\N	\N	\N
8057	451	30	3	\N	\N	\N	\N
8058	451	31	3	\N	\N	\N	\N
8059	451	32	3	\N	\N	\N	\N
8060	451	33	4	\N	\N	\N	\N
8061	451	34	3	\N	\N	\N	\N
8062	451	35	4	\N	\N	\N	\N
8063	451	36	3	\N	\N	\N	\N
8064	451	37	4	\N	\N	\N	\N
8065	451	38	4	\N	\N	\N	\N
8066	451	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.823	MODELO
8067	451	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.975	MODELO
8068	450	18	2	\N	\N	\N	\N
8069	450	19	3	\N	\N	\N	\N
8070	450	20	2	\N	\N	\N	\N
8071	450	21	3	\N	\N	\N	\N
8072	450	22	3	\N	\N	\N	\N
8073	450	23	3	\N	\N	\N	\N
8074	450	24	4	\N	\N	\N	\N
8075	450	27	3	\N	\N	\N	\N
8076	450	28	3	\N	\N	\N	\N
8077	450	29	4	\N	\N	\N	\N
8078	450	30	3	\N	\N	\N	\N
8079	450	31	3	\N	\N	\N	\N
8080	450	32	4	\N	\N	\N	\N
8081	450	33	4	\N	\N	\N	\N
8082	450	34	3	\N	\N	\N	\N
8083	450	35	3	\N	\N	\N	\N
8084	450	36	4	\N	\N	\N	\N
8085	450	37	3	\N	\N	\N	\N
8086	450	38	4	\N	\N	\N	\N
8087	450	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.742	MODELO
8088	450	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.722	MODELO
8089	449	18	4	\N	\N	\N	\N
8090	449	19	4	\N	\N	\N	\N
8091	449	20	3	\N	\N	\N	\N
8092	449	21	2	\N	\N	\N	\N
8093	449	22	4	\N	\N	\N	\N
8094	449	23	4	\N	\N	\N	\N
8095	449	24	2	\N	\N	\N	\N
8096	449	27	4	\N	\N	\N	\N
8097	449	28	2	\N	\N	\N	\N
8098	449	29	4	\N	\N	\N	\N
8099	449	30	3	\N	\N	\N	\N
8100	449	31	3	\N	\N	\N	\N
8101	449	32	3	\N	\N	\N	\N
8102	449	33	3	\N	\N	\N	\N
8103	449	34	3	\N	\N	\N	\N
8104	449	35	3	\N	\N	\N	\N
8105	449	36	1	\N	\N	\N	\N
8106	449	37	4	\N	\N	\N	\N
8107	449	38	4	\N	\N	\N	\N
8108	449	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.685	MODELO
8109	449	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.705	MODELO
8110	448	18	3	\N	\N	\N	\N
8111	448	19	4	\N	\N	\N	\N
8112	448	20	4	\N	\N	\N	\N
8113	448	21	4	\N	\N	\N	\N
8114	448	22	3	\N	\N	\N	\N
8115	448	23	2	\N	\N	\N	\N
8116	448	24	3	\N	\N	\N	\N
8117	448	27	4	\N	\N	\N	\N
8118	448	28	3	\N	\N	\N	\N
8119	448	29	3	\N	\N	\N	\N
8120	448	30	4	\N	\N	\N	\N
8121	448	31	3	\N	\N	\N	\N
8122	448	32	2	\N	\N	\N	\N
8123	448	33	4	\N	\N	\N	\N
8124	448	34	1	\N	\N	\N	\N
8125	448	35	3	\N	\N	\N	\N
8126	448	36	3	\N	\N	\N	\N
8127	448	37	2	\N	\N	\N	\N
8128	448	38	1	\N	\N	\N	\N
8129	448	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.908	MODELO
8130	448	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.777	MODELO
8131	447	18	3	\N	\N	\N	\N
8132	447	19	4	\N	\N	\N	\N
8133	447	20	3	\N	\N	\N	\N
8134	447	21	4	\N	\N	\N	\N
8135	447	22	4	\N	\N	\N	\N
8136	447	23	3	\N	\N	\N	\N
8137	447	24	3	\N	\N	\N	\N
8138	447	27	4	\N	\N	\N	\N
8139	447	28	2	\N	\N	\N	\N
8140	447	29	4	\N	\N	\N	\N
8141	447	30	2	\N	\N	\N	\N
8142	447	31	4	\N	\N	\N	\N
8143	447	32	3	\N	\N	\N	\N
8144	447	33	3	\N	\N	\N	\N
8145	447	34	3	\N	\N	\N	\N
8146	447	35	3	\N	\N	\N	\N
8147	447	36	3	\N	\N	\N	\N
8148	447	37	3	\N	\N	\N	\N
8149	447	38	3	\N	\N	\N	\N
8150	447	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.883	MODELO
8151	447	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.975	MODELO
8152	446	18	1	\N	\N	\N	\N
8153	446	19	4	\N	\N	\N	\N
8154	446	20	3	\N	\N	\N	\N
8155	446	21	4	\N	\N	\N	\N
8156	446	22	4	\N	\N	\N	\N
8157	446	23	4	\N	\N	\N	\N
8158	446	24	3	\N	\N	\N	\N
8159	446	27	4	\N	\N	\N	\N
8160	446	28	3	\N	\N	\N	\N
8161	446	29	3	\N	\N	\N	\N
8162	446	30	3	\N	\N	\N	\N
8163	446	31	3	\N	\N	\N	\N
8164	446	32	4	\N	\N	\N	\N
8165	446	33	4	\N	\N	\N	\N
8166	446	34	3	\N	\N	\N	\N
8167	446	35	4	\N	\N	\N	\N
8168	446	36	4	\N	\N	\N	\N
8169	446	37	4	\N	\N	\N	\N
8170	446	38	3	\N	\N	\N	\N
8171	446	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.95	MODELO
8172	446	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.625	MODELO
8173	445	18	3	\N	\N	\N	\N
8174	445	19	3	\N	\N	\N	\N
8175	445	20	1	\N	\N	\N	\N
8176	445	21	3	\N	\N	\N	\N
8177	445	22	3	\N	\N	\N	\N
8178	445	23	2	\N	\N	\N	\N
8179	445	24	4	\N	\N	\N	\N
8180	445	27	3	\N	\N	\N	\N
8181	445	28	4	\N	\N	\N	\N
8182	445	29	4	\N	\N	\N	\N
8183	445	30	1	\N	\N	\N	\N
8184	445	31	3	\N	\N	\N	\N
8185	445	32	3	\N	\N	\N	\N
8186	445	33	2	\N	\N	\N	\N
8187	445	34	4	\N	\N	\N	\N
8188	445	35	4	\N	\N	\N	\N
8189	445	36	3	\N	\N	\N	\N
8190	445	37	3	\N	\N	\N	\N
8191	445	38	4	\N	\N	\N	\N
8192	445	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.755	MODELO
8193	445	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.507	MODELO
8194	444	18	1	\N	\N	\N	\N
8195	444	19	3	\N	\N	\N	\N
8196	444	20	3	\N	\N	\N	\N
8197	444	21	2	\N	\N	\N	\N
8198	444	22	4	\N	\N	\N	\N
8199	444	23	4	\N	\N	\N	\N
8200	444	24	2	\N	\N	\N	\N
8201	444	27	4	\N	\N	\N	\N
8202	444	28	3	\N	\N	\N	\N
8203	444	29	3	\N	\N	\N	\N
8204	444	30	3	\N	\N	\N	\N
8205	444	31	4	\N	\N	\N	\N
8206	444	32	4	\N	\N	\N	\N
8207	444	33	3	\N	\N	\N	\N
8208	444	34	2	\N	\N	\N	\N
8209	444	35	3	\N	\N	\N	\N
8210	444	36	3	\N	\N	\N	\N
8211	444	37	4	\N	\N	\N	\N
8212	444	38	4	\N	\N	\N	\N
8213	444	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.541	MODELO
8214	444	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.554	MODELO
8215	443	18	4	\N	\N	\N	\N
8216	443	19	3	\N	\N	\N	\N
8217	443	20	4	\N	\N	\N	\N
8218	443	21	4	\N	\N	\N	\N
8219	443	22	3	\N	\N	\N	\N
8220	443	23	3	\N	\N	\N	\N
8221	443	24	3	\N	\N	\N	\N
8222	443	27	3	\N	\N	\N	\N
8223	443	28	4	\N	\N	\N	\N
8224	443	29	3	\N	\N	\N	\N
8225	443	30	3	\N	\N	\N	\N
8226	443	31	1	\N	\N	\N	\N
8227	443	32	2	\N	\N	\N	\N
8228	443	33	3	\N	\N	\N	\N
8229	443	34	3	\N	\N	\N	\N
8230	443	35	4	\N	\N	\N	\N
8231	443	36	2	\N	\N	\N	\N
8232	443	37	2	\N	\N	\N	\N
8233	443	38	4	\N	\N	\N	\N
8234	443	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.961	MODELO
8235	443	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.74	MODELO
8236	442	18	3	\N	\N	\N	\N
8237	442	19	2	\N	\N	\N	\N
8238	442	20	4	\N	\N	\N	\N
8239	442	21	4	\N	\N	\N	\N
8240	442	22	4	\N	\N	\N	\N
8241	442	23	3	\N	\N	\N	\N
8242	442	24	1	\N	\N	\N	\N
8243	442	27	3	\N	\N	\N	\N
8244	442	28	3	\N	\N	\N	\N
8245	442	29	2	\N	\N	\N	\N
8246	442	30	1	\N	\N	\N	\N
8247	442	31	4	\N	\N	\N	\N
8248	442	32	2	\N	\N	\N	\N
8249	442	33	4	\N	\N	\N	\N
8250	442	34	3	\N	\N	\N	\N
8251	442	35	4	\N	\N	\N	\N
8252	442	36	3	\N	\N	\N	\N
8253	442	37	3	\N	\N	\N	\N
8254	442	38	4	\N	\N	\N	\N
8255	442	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.835	MODELO
8256	442	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.659	MODELO
8257	441	18	4	\N	\N	\N	\N
8258	441	19	4	\N	\N	\N	\N
8259	441	20	4	\N	\N	\N	\N
8260	441	21	4	\N	\N	\N	\N
8261	441	22	3	\N	\N	\N	\N
8262	441	23	3	\N	\N	\N	\N
8263	441	24	4	\N	\N	\N	\N
8264	441	27	2	\N	\N	\N	\N
8265	441	28	4	\N	\N	\N	\N
8266	441	29	1	\N	\N	\N	\N
8267	441	30	3	\N	\N	\N	\N
8268	441	31	4	\N	\N	\N	\N
8269	441	32	4	\N	\N	\N	\N
8270	441	33	3	\N	\N	\N	\N
8271	441	34	3	\N	\N	\N	\N
8272	441	35	4	\N	\N	\N	\N
8273	441	36	3	\N	\N	\N	\N
8274	441	37	3	\N	\N	\N	\N
8275	441	38	3	\N	\N	\N	\N
8276	441	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.759	MODELO
8277	441	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.544	MODELO
8278	440	18	4	\N	\N	\N	\N
8279	440	19	4	\N	\N	\N	\N
8280	440	20	3	\N	\N	\N	\N
8281	440	21	3	\N	\N	\N	\N
8282	440	22	4	\N	\N	\N	\N
8283	440	23	4	\N	\N	\N	\N
8284	440	24	4	\N	\N	\N	\N
8285	440	27	3	\N	\N	\N	\N
8286	440	28	1	\N	\N	\N	\N
8287	440	29	2	\N	\N	\N	\N
8288	440	30	3	\N	\N	\N	\N
8289	440	31	4	\N	\N	\N	\N
8290	440	32	3	\N	\N	\N	\N
8291	440	33	2	\N	\N	\N	\N
8292	440	34	3	\N	\N	\N	\N
8293	440	35	4	\N	\N	\N	\N
8294	440	36	2	\N	\N	\N	\N
8295	440	37	2	\N	\N	\N	\N
8296	440	38	4	\N	\N	\N	\N
8297	440	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.741	MODELO
8298	440	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.872	MODELO
8299	439	18	4	\N	\N	\N	\N
8300	439	19	2	\N	\N	\N	\N
8301	439	20	4	\N	\N	\N	\N
8302	439	21	4	\N	\N	\N	\N
8303	439	22	4	\N	\N	\N	\N
8304	439	23	4	\N	\N	\N	\N
8305	439	24	4	\N	\N	\N	\N
8306	439	27	4	\N	\N	\N	\N
8307	439	28	3	\N	\N	\N	\N
8308	439	29	4	\N	\N	\N	\N
8309	439	30	3	\N	\N	\N	\N
8310	439	31	4	\N	\N	\N	\N
8311	439	32	1	\N	\N	\N	\N
8312	439	33	3	\N	\N	\N	\N
8313	439	34	3	\N	\N	\N	\N
8314	439	35	1	\N	\N	\N	\N
8315	439	36	3	\N	\N	\N	\N
8316	439	37	4	\N	\N	\N	\N
8317	439	38	3	\N	\N	\N	\N
8318	439	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.977	MODELO
8319	439	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.746	MODELO
8320	438	18	4	\N	\N	\N	\N
8321	438	19	3	\N	\N	\N	\N
8322	438	20	3	\N	\N	\N	\N
8323	438	21	3	\N	\N	\N	\N
8324	438	22	4	\N	\N	\N	\N
8325	438	23	3	\N	\N	\N	\N
8326	438	24	4	\N	\N	\N	\N
8327	438	27	4	\N	\N	\N	\N
8328	438	28	3	\N	\N	\N	\N
8329	438	29	1	\N	\N	\N	\N
8330	438	30	2	\N	\N	\N	\N
8331	438	31	3	\N	\N	\N	\N
8332	438	32	4	\N	\N	\N	\N
8333	438	33	4	\N	\N	\N	\N
8334	438	34	4	\N	\N	\N	\N
8335	438	35	3	\N	\N	\N	\N
8336	438	36	4	\N	\N	\N	\N
8337	438	37	3	\N	\N	\N	\N
8338	438	38	4	\N	\N	\N	\N
8339	438	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.855	MODELO
8340	438	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.956	MODELO
8341	437	18	4	\N	\N	\N	\N
8342	437	19	4	\N	\N	\N	\N
8343	437	20	4	\N	\N	\N	\N
8344	437	21	2	\N	\N	\N	\N
8345	437	22	3	\N	\N	\N	\N
8346	437	23	4	\N	\N	\N	\N
8347	437	24	4	\N	\N	\N	\N
8348	437	27	2	\N	\N	\N	\N
8349	437	28	4	\N	\N	\N	\N
8350	437	29	3	\N	\N	\N	\N
8351	437	30	3	\N	\N	\N	\N
8352	437	31	3	\N	\N	\N	\N
8353	437	32	3	\N	\N	\N	\N
8354	437	33	2	\N	\N	\N	\N
8355	437	34	3	\N	\N	\N	\N
8356	437	35	3	\N	\N	\N	\N
8357	437	36	3	\N	\N	\N	\N
8358	437	37	4	\N	\N	\N	\N
8359	437	38	4	\N	\N	\N	\N
8360	437	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.855	MODELO
8361	437	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.683	MODELO
8362	436	18	4	\N	\N	\N	\N
8363	436	19	4	\N	\N	\N	\N
8364	436	20	1	\N	\N	\N	\N
8365	436	21	4	\N	\N	\N	\N
8366	436	22	3	\N	\N	\N	\N
8367	436	23	4	\N	\N	\N	\N
8368	436	24	4	\N	\N	\N	\N
8369	436	27	2	\N	\N	\N	\N
8370	436	28	3	\N	\N	\N	\N
8371	436	29	3	\N	\N	\N	\N
8372	436	30	3	\N	\N	\N	\N
8373	436	31	3	\N	\N	\N	\N
8374	436	32	4	\N	\N	\N	\N
8375	436	33	4	\N	\N	\N	\N
8376	436	34	3	\N	\N	\N	\N
8377	436	35	4	\N	\N	\N	\N
8378	436	36	3	\N	\N	\N	\N
8379	436	37	4	\N	\N	\N	\N
8380	436	38	3	\N	\N	\N	\N
8381	436	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.668	MODELO
8382	436	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.884	MODELO
8383	435	18	4	\N	\N	\N	\N
8384	435	19	4	\N	\N	\N	\N
8385	435	20	4	\N	\N	\N	\N
8386	435	21	4	\N	\N	\N	\N
8387	435	22	3	\N	\N	\N	\N
8388	435	23	3	\N	\N	\N	\N
8389	435	24	3	\N	\N	\N	\N
8390	435	27	3	\N	\N	\N	\N
8391	435	28	3	\N	\N	\N	\N
8392	435	29	2	\N	\N	\N	\N
8393	435	30	2	\N	\N	\N	\N
8394	435	31	3	\N	\N	\N	\N
8395	435	32	3	\N	\N	\N	\N
8396	435	33	1	\N	\N	\N	\N
8397	435	34	2	\N	\N	\N	\N
8398	435	35	4	\N	\N	\N	\N
8399	435	36	4	\N	\N	\N	\N
8400	435	37	3	\N	\N	\N	\N
8401	435	38	3	\N	\N	\N	\N
8402	435	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.935	MODELO
8403	435	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.932	MODELO
8404	434	18	1	\N	\N	\N	\N
8405	434	19	3	\N	\N	\N	\N
8406	434	20	3	\N	\N	\N	\N
8407	434	21	3	\N	\N	\N	\N
8408	434	22	4	\N	\N	\N	\N
8409	434	23	3	\N	\N	\N	\N
8410	434	24	3	\N	\N	\N	\N
8411	434	27	3	\N	\N	\N	\N
8412	434	28	3	\N	\N	\N	\N
8413	434	29	3	\N	\N	\N	\N
8414	434	30	4	\N	\N	\N	\N
8415	434	31	3	\N	\N	\N	\N
8416	434	32	4	\N	\N	\N	\N
8417	434	33	3	\N	\N	\N	\N
8418	434	34	3	\N	\N	\N	\N
8419	434	35	4	\N	\N	\N	\N
8420	434	36	3	\N	\N	\N	\N
8421	434	37	4	\N	\N	\N	\N
8422	434	38	3	\N	\N	\N	\N
8423	434	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.874	MODELO
8424	434	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.521	MODELO
8425	433	18	4	\N	\N	\N	\N
8426	433	19	3	\N	\N	\N	\N
8427	433	20	4	\N	\N	\N	\N
8428	433	21	3	\N	\N	\N	\N
8429	433	22	3	\N	\N	\N	\N
8430	433	23	3	\N	\N	\N	\N
8431	433	24	4	\N	\N	\N	\N
8432	433	27	3	\N	\N	\N	\N
8433	433	28	2	\N	\N	\N	\N
8434	433	29	4	\N	\N	\N	\N
8435	433	30	4	\N	\N	\N	\N
8436	433	31	4	\N	\N	\N	\N
8437	433	32	3	\N	\N	\N	\N
8438	433	33	3	\N	\N	\N	\N
8439	433	34	3	\N	\N	\N	\N
8440	433	35	4	\N	\N	\N	\N
8441	433	36	3	\N	\N	\N	\N
8442	433	37	3	\N	\N	\N	\N
8443	433	38	3	\N	\N	\N	\N
8444	433	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.908	MODELO
8445	433	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.71	MODELO
8446	432	18	3	\N	\N	\N	\N
8447	432	19	2	\N	\N	\N	\N
8448	432	20	1	\N	\N	\N	\N
8449	432	21	4	\N	\N	\N	\N
8450	432	22	3	\N	\N	\N	\N
8451	432	23	3	\N	\N	\N	\N
8452	432	24	3	\N	\N	\N	\N
8453	432	27	4	\N	\N	\N	\N
8454	432	28	4	\N	\N	\N	\N
8455	432	29	4	\N	\N	\N	\N
8456	432	30	4	\N	\N	\N	\N
8457	432	31	4	\N	\N	\N	\N
8458	432	32	4	\N	\N	\N	\N
8459	432	33	3	\N	\N	\N	\N
8460	432	34	3	\N	\N	\N	\N
8461	432	35	3	\N	\N	\N	\N
8462	432	36	3	\N	\N	\N	\N
8463	432	37	3	\N	\N	\N	\N
8464	432	38	3	\N	\N	\N	\N
8465	432	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.624	MODELO
8466	432	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.593	MODELO
8467	431	18	3	\N	\N	\N	\N
8468	431	19	3	\N	\N	\N	\N
8469	431	20	3	\N	\N	\N	\N
8470	431	21	4	\N	\N	\N	\N
8471	431	22	4	\N	\N	\N	\N
8472	431	23	3	\N	\N	\N	\N
8473	431	24	3	\N	\N	\N	\N
8474	431	27	3	\N	\N	\N	\N
8475	431	28	3	\N	\N	\N	\N
8476	431	29	2	\N	\N	\N	\N
8477	431	30	3	\N	\N	\N	\N
8478	431	31	2	\N	\N	\N	\N
8479	431	32	1	\N	\N	\N	\N
8480	431	33	4	\N	\N	\N	\N
8481	431	34	4	\N	\N	\N	\N
8482	431	35	4	\N	\N	\N	\N
8483	431	36	4	\N	\N	\N	\N
8484	431	37	3	\N	\N	\N	\N
8485	431	38	4	\N	\N	\N	\N
8486	431	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.752	MODELO
8487	431	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.712	MODELO
8488	430	18	3	\N	\N	\N	\N
8489	430	19	4	\N	\N	\N	\N
8490	430	20	3	\N	\N	\N	\N
8491	430	21	3	\N	\N	\N	\N
8492	430	22	4	\N	\N	\N	\N
8493	430	23	3	\N	\N	\N	\N
8494	430	24	3	\N	\N	\N	\N
8495	430	27	3	\N	\N	\N	\N
8496	430	28	4	\N	\N	\N	\N
8497	430	29	4	\N	\N	\N	\N
8498	430	30	4	\N	\N	\N	\N
8499	430	31	3	\N	\N	\N	\N
8500	430	32	3	\N	\N	\N	\N
8501	430	33	3	\N	\N	\N	\N
8502	430	34	3	\N	\N	\N	\N
8503	430	35	3	\N	\N	\N	\N
8504	430	36	4	\N	\N	\N	\N
8505	430	37	2	\N	\N	\N	\N
8506	430	38	3	\N	\N	\N	\N
8507	430	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.732	MODELO
8508	430	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.502	MODELO
8509	429	18	3	\N	\N	\N	\N
8510	429	19	2	\N	\N	\N	\N
8511	429	20	3	\N	\N	\N	\N
8512	429	21	4	\N	\N	\N	\N
8513	429	22	3	\N	\N	\N	\N
8514	429	23	3	\N	\N	\N	\N
8515	429	24	3	\N	\N	\N	\N
8516	429	27	3	\N	\N	\N	\N
8517	429	28	4	\N	\N	\N	\N
8518	429	29	3	\N	\N	\N	\N
8519	429	30	4	\N	\N	\N	\N
8520	429	31	4	\N	\N	\N	\N
8521	429	32	3	\N	\N	\N	\N
8522	429	33	3	\N	\N	\N	\N
8523	429	34	3	\N	\N	\N	\N
8524	429	35	3	\N	\N	\N	\N
8525	429	36	3	\N	\N	\N	\N
8526	429	37	4	\N	\N	\N	\N
8527	429	38	3	\N	\N	\N	\N
8528	429	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.919	MODELO
8529	429	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.789	MODELO
8530	428	18	3	\N	\N	\N	\N
8531	428	19	3	\N	\N	\N	\N
8532	428	20	3	\N	\N	\N	\N
8533	428	21	4	\N	\N	\N	\N
8534	428	22	3	\N	\N	\N	\N
8535	428	23	3	\N	\N	\N	\N
8536	428	24	3	\N	\N	\N	\N
8537	428	27	3	\N	\N	\N	\N
8538	428	28	3	\N	\N	\N	\N
8539	428	29	4	\N	\N	\N	\N
8540	428	30	4	\N	\N	\N	\N
8541	428	31	4	\N	\N	\N	\N
8542	428	32	3	\N	\N	\N	\N
8543	428	33	2	\N	\N	\N	\N
8544	428	34	3	\N	\N	\N	\N
8545	428	35	4	\N	\N	\N	\N
8546	428	36	4	\N	\N	\N	\N
8547	428	37	3	\N	\N	\N	\N
8548	428	38	3	\N	\N	\N	\N
8549	428	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.73	MODELO
8550	428	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.556	MODELO
8551	427	18	2	\N	\N	\N	\N
8552	427	19	3	\N	\N	\N	\N
8553	427	20	4	\N	\N	\N	\N
8554	427	21	3	\N	\N	\N	\N
8555	427	22	3	\N	\N	\N	\N
8556	427	23	3	\N	\N	\N	\N
8557	427	24	3	\N	\N	\N	\N
8558	427	27	3	\N	\N	\N	\N
8559	427	28	4	\N	\N	\N	\N
8560	427	29	4	\N	\N	\N	\N
8561	427	30	2	\N	\N	\N	\N
8562	427	31	4	\N	\N	\N	\N
8563	427	32	4	\N	\N	\N	\N
8564	427	33	1	\N	\N	\N	\N
8565	427	34	4	\N	\N	\N	\N
8566	427	35	3	\N	\N	\N	\N
8567	427	36	3	\N	\N	\N	\N
8568	427	37	4	\N	\N	\N	\N
8569	427	38	2	\N	\N	\N	\N
8570	427	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.94	MODELO
8571	427	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.789	MODELO
8572	426	18	1	\N	\N	\N	\N
8573	426	19	3	\N	\N	\N	\N
8574	426	20	1	\N	\N	\N	\N
8575	426	21	2	\N	\N	\N	\N
8576	426	22	3	\N	\N	\N	\N
8577	426	23	3	\N	\N	\N	\N
8578	426	24	2	\N	\N	\N	\N
8579	426	27	3	\N	\N	\N	\N
8580	426	28	3	\N	\N	\N	\N
8581	426	29	3	\N	\N	\N	\N
8582	426	30	4	\N	\N	\N	\N
8583	426	31	3	\N	\N	\N	\N
8584	426	32	4	\N	\N	\N	\N
8585	426	33	3	\N	\N	\N	\N
8586	426	34	4	\N	\N	\N	\N
8587	426	35	4	\N	\N	\N	\N
8588	426	36	3	\N	\N	\N	\N
8589	426	37	3	\N	\N	\N	\N
8590	426	38	4	\N	\N	\N	\N
8591	426	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.515	MODELO
8592	426	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.728	MODELO
8593	425	18	3	\N	\N	\N	\N
8594	425	19	4	\N	\N	\N	\N
8595	425	20	4	\N	\N	\N	\N
8596	425	21	3	\N	\N	\N	\N
8597	425	22	3	\N	\N	\N	\N
8598	425	23	3	\N	\N	\N	\N
8599	425	24	4	\N	\N	\N	\N
8600	425	27	4	\N	\N	\N	\N
8601	425	28	3	\N	\N	\N	\N
8602	425	29	4	\N	\N	\N	\N
8603	425	30	4	\N	\N	\N	\N
8604	425	31	4	\N	\N	\N	\N
8605	425	32	3	\N	\N	\N	\N
8606	425	33	3	\N	\N	\N	\N
8607	425	34	4	\N	\N	\N	\N
8608	425	35	4	\N	\N	\N	\N
8609	425	36	4	\N	\N	\N	\N
8610	425	37	3	\N	\N	\N	\N
8611	425	38	3	\N	\N	\N	\N
8612	425	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.844	MODELO
8732	419	33	3	\N	\N	\N	\N
8613	425	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.835	MODELO
8614	424	18	4	\N	\N	\N	\N
8615	424	19	4	\N	\N	\N	\N
8616	424	20	4	\N	\N	\N	\N
8617	424	21	3	\N	\N	\N	\N
8618	424	22	3	\N	\N	\N	\N
8619	424	23	4	\N	\N	\N	\N
8620	424	24	4	\N	\N	\N	\N
8621	424	27	3	\N	\N	\N	\N
8622	424	28	3	\N	\N	\N	\N
8623	424	29	4	\N	\N	\N	\N
8624	424	30	3	\N	\N	\N	\N
8625	424	31	3	\N	\N	\N	\N
8626	424	32	3	\N	\N	\N	\N
8627	424	33	2	\N	\N	\N	\N
8628	424	34	4	\N	\N	\N	\N
8629	424	35	3	\N	\N	\N	\N
8630	424	36	3	\N	\N	\N	\N
8631	424	37	4	\N	\N	\N	\N
8632	424	38	4	\N	\N	\N	\N
8633	424	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.734	MODELO
8634	424	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.967	MODELO
8635	423	18	3	\N	\N	\N	\N
8636	423	19	4	\N	\N	\N	\N
8637	423	20	4	\N	\N	\N	\N
8638	423	21	4	\N	\N	\N	\N
8639	423	22	2	\N	\N	\N	\N
8640	423	23	4	\N	\N	\N	\N
8641	423	24	3	\N	\N	\N	\N
8642	423	27	3	\N	\N	\N	\N
8643	423	28	4	\N	\N	\N	\N
8644	423	29	3	\N	\N	\N	\N
8645	423	30	2	\N	\N	\N	\N
8646	423	31	2	\N	\N	\N	\N
8647	423	32	3	\N	\N	\N	\N
8648	423	33	4	\N	\N	\N	\N
8649	423	34	4	\N	\N	\N	\N
8650	423	35	4	\N	\N	\N	\N
8651	423	36	3	\N	\N	\N	\N
8652	423	37	3	\N	\N	\N	\N
8653	423	38	3	\N	\N	\N	\N
8654	423	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.947	MODELO
8655	423	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.77	MODELO
8656	422	18	3	\N	\N	\N	\N
8657	422	19	1	\N	\N	\N	\N
8658	422	20	4	\N	\N	\N	\N
8659	422	21	4	\N	\N	\N	\N
8660	422	22	3	\N	\N	\N	\N
8661	422	23	2	\N	\N	\N	\N
8662	422	24	3	\N	\N	\N	\N
8663	422	27	4	\N	\N	\N	\N
8664	422	28	4	\N	\N	\N	\N
8665	422	29	3	\N	\N	\N	\N
8666	422	30	3	\N	\N	\N	\N
8667	422	31	3	\N	\N	\N	\N
8668	422	32	2	\N	\N	\N	\N
8669	422	33	3	\N	\N	\N	\N
8670	422	34	3	\N	\N	\N	\N
8671	422	35	3	\N	\N	\N	\N
8672	422	36	4	\N	\N	\N	\N
8673	422	37	4	\N	\N	\N	\N
8674	422	38	4	\N	\N	\N	\N
8675	422	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.726	MODELO
8676	422	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.623	MODELO
8677	421	18	4	\N	\N	\N	\N
8678	421	19	3	\N	\N	\N	\N
8679	421	20	4	\N	\N	\N	\N
8680	421	21	3	\N	\N	\N	\N
8681	421	22	4	\N	\N	\N	\N
8682	421	23	4	\N	\N	\N	\N
8683	421	24	3	\N	\N	\N	\N
8684	421	27	3	\N	\N	\N	\N
8685	421	28	2	\N	\N	\N	\N
8686	421	29	3	\N	\N	\N	\N
8687	421	30	3	\N	\N	\N	\N
8688	421	31	3	\N	\N	\N	\N
8689	421	32	2	\N	\N	\N	\N
8690	421	33	3	\N	\N	\N	\N
8691	421	34	3	\N	\N	\N	\N
8692	421	35	3	\N	\N	\N	\N
8693	421	36	4	\N	\N	\N	\N
8694	421	37	4	\N	\N	\N	\N
8695	421	38	2	\N	\N	\N	\N
8696	421	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.723	MODELO
8697	421	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.617	MODELO
8698	420	18	2	\N	\N	\N	\N
8699	420	19	4	\N	\N	\N	\N
8700	420	20	4	\N	\N	\N	\N
8701	420	21	4	\N	\N	\N	\N
8702	420	22	3	\N	\N	\N	\N
8703	420	23	3	\N	\N	\N	\N
8704	420	24	4	\N	\N	\N	\N
8705	420	27	3	\N	\N	\N	\N
8706	420	28	4	\N	\N	\N	\N
8707	420	29	3	\N	\N	\N	\N
8708	420	30	3	\N	\N	\N	\N
8709	420	31	4	\N	\N	\N	\N
8710	420	32	3	\N	\N	\N	\N
8711	420	33	3	\N	\N	\N	\N
8712	420	34	3	\N	\N	\N	\N
8713	420	35	4	\N	\N	\N	\N
8714	420	36	3	\N	\N	\N	\N
8715	420	37	4	\N	\N	\N	\N
8716	420	38	4	\N	\N	\N	\N
8717	420	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.876	MODELO
8718	420	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.932	MODELO
8719	419	18	4	\N	\N	\N	\N
8720	419	19	3	\N	\N	\N	\N
8721	419	20	3	\N	\N	\N	\N
8722	419	21	2	\N	\N	\N	\N
8723	419	22	3	\N	\N	\N	\N
8724	419	23	3	\N	\N	\N	\N
8725	419	24	3	\N	\N	\N	\N
8726	419	27	3	\N	\N	\N	\N
8727	419	28	4	\N	\N	\N	\N
8728	419	29	4	\N	\N	\N	\N
8729	419	30	3	\N	\N	\N	\N
8730	419	31	3	\N	\N	\N	\N
8731	419	32	3	\N	\N	\N	\N
8733	419	34	3	\N	\N	\N	\N
8734	419	35	4	\N	\N	\N	\N
8735	419	36	4	\N	\N	\N	\N
8736	419	37	1	\N	\N	\N	\N
8737	419	38	3	\N	\N	\N	\N
8738	419	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.742	MODELO
8739	419	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.845	MODELO
8740	418	18	4	\N	\N	\N	\N
8741	418	19	3	\N	\N	\N	\N
8742	418	20	2	\N	\N	\N	\N
8743	418	21	1	\N	\N	\N	\N
8744	418	22	4	\N	\N	\N	\N
8745	418	23	3	\N	\N	\N	\N
8746	418	24	3	\N	\N	\N	\N
8747	418	27	3	\N	\N	\N	\N
8748	418	28	4	\N	\N	\N	\N
8749	418	29	3	\N	\N	\N	\N
8750	418	30	4	\N	\N	\N	\N
8751	418	31	3	\N	\N	\N	\N
8752	418	32	3	\N	\N	\N	\N
8753	418	33	4	\N	\N	\N	\N
8754	418	34	2	\N	\N	\N	\N
8755	418	35	3	\N	\N	\N	\N
8756	418	36	4	\N	\N	\N	\N
8757	418	37	4	\N	\N	\N	\N
8758	418	38	3	\N	\N	\N	\N
8759	418	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.869	MODELO
8760	418	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.719	MODELO
8761	417	18	3	\N	\N	\N	\N
8762	417	19	2	\N	\N	\N	\N
8763	417	20	3	\N	\N	\N	\N
8764	417	21	2	\N	\N	\N	\N
8765	417	22	3	\N	\N	\N	\N
8766	417	23	3	\N	\N	\N	\N
8767	417	24	3	\N	\N	\N	\N
8768	417	27	3	\N	\N	\N	\N
8769	417	28	3	\N	\N	\N	\N
8770	417	29	4	\N	\N	\N	\N
8771	417	30	4	\N	\N	\N	\N
8772	417	31	4	\N	\N	\N	\N
8773	417	32	3	\N	\N	\N	\N
8774	417	33	4	\N	\N	\N	\N
8775	417	34	3	\N	\N	\N	\N
8776	417	35	3	\N	\N	\N	\N
8777	417	36	3	\N	\N	\N	\N
8778	417	37	3	\N	\N	\N	\N
8779	417	38	4	\N	\N	\N	\N
8780	417	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.957	MODELO
8781	417	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.665	MODELO
8782	416	18	3	\N	\N	\N	\N
8783	416	19	4	\N	\N	\N	\N
8784	416	20	3	\N	\N	\N	\N
8785	416	21	4	\N	\N	\N	\N
8786	416	22	3	\N	\N	\N	\N
8787	416	23	3	\N	\N	\N	\N
8788	416	24	2	\N	\N	\N	\N
8789	416	27	4	\N	\N	\N	\N
8790	416	28	4	\N	\N	\N	\N
8791	416	29	3	\N	\N	\N	\N
8792	416	30	3	\N	\N	\N	\N
8793	416	31	4	\N	\N	\N	\N
8794	416	32	4	\N	\N	\N	\N
8795	416	33	1	\N	\N	\N	\N
8796	416	34	4	\N	\N	\N	\N
8797	416	35	3	\N	\N	\N	\N
8798	416	36	3	\N	\N	\N	\N
8799	416	37	4	\N	\N	\N	\N
8800	416	38	3	\N	\N	\N	\N
8801	416	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.952	MODELO
8802	416	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.675	MODELO
8803	415	18	4	\N	\N	\N	\N
8804	415	19	3	\N	\N	\N	\N
8805	415	20	3	\N	\N	\N	\N
8806	415	21	4	\N	\N	\N	\N
8807	415	22	3	\N	\N	\N	\N
8808	415	23	3	\N	\N	\N	\N
8809	415	24	3	\N	\N	\N	\N
8810	415	27	3	\N	\N	\N	\N
8811	415	28	4	\N	\N	\N	\N
8812	415	29	4	\N	\N	\N	\N
8813	415	30	4	\N	\N	\N	\N
8814	415	31	1	\N	\N	\N	\N
8815	415	32	3	\N	\N	\N	\N
8816	415	33	4	\N	\N	\N	\N
8817	415	34	2	\N	\N	\N	\N
8818	415	35	3	\N	\N	\N	\N
8819	415	36	3	\N	\N	\N	\N
8820	415	37	4	\N	\N	\N	\N
8821	415	38	3	\N	\N	\N	\N
8822	415	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.681	MODELO
8823	415	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.794	MODELO
8824	414	18	3	\N	\N	\N	\N
8825	414	19	3	\N	\N	\N	\N
8826	414	20	3	\N	\N	\N	\N
8827	414	21	2	\N	\N	\N	\N
8828	414	22	4	\N	\N	\N	\N
8829	414	23	2	\N	\N	\N	\N
8830	414	24	2	\N	\N	\N	\N
8831	414	27	3	\N	\N	\N	\N
8832	414	28	4	\N	\N	\N	\N
8833	414	29	1	\N	\N	\N	\N
8834	414	30	3	\N	\N	\N	\N
8835	414	31	4	\N	\N	\N	\N
8836	414	32	4	\N	\N	\N	\N
8837	414	33	4	\N	\N	\N	\N
8838	414	34	3	\N	\N	\N	\N
8839	414	35	3	\N	\N	\N	\N
8840	414	36	4	\N	\N	\N	\N
8841	414	37	3	\N	\N	\N	\N
8842	414	38	4	\N	\N	\N	\N
8843	414	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.853	MODELO
8844	414	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.648	MODELO
8845	413	18	4	\N	\N	\N	\N
8846	413	19	2	\N	\N	\N	\N
8847	413	20	2	\N	\N	\N	\N
8848	413	21	4	\N	\N	\N	\N
8849	413	22	3	\N	\N	\N	\N
8850	413	23	4	\N	\N	\N	\N
8851	413	24	4	\N	\N	\N	\N
8852	413	27	3	\N	\N	\N	\N
8853	413	28	2	\N	\N	\N	\N
8854	413	29	3	\N	\N	\N	\N
8855	413	30	4	\N	\N	\N	\N
8856	413	31	3	\N	\N	\N	\N
8857	413	32	4	\N	\N	\N	\N
8858	413	33	4	\N	\N	\N	\N
8859	413	34	2	\N	\N	\N	\N
8860	413	35	3	\N	\N	\N	\N
8861	413	36	1	\N	\N	\N	\N
8862	413	37	2	\N	\N	\N	\N
8863	413	38	2	\N	\N	\N	\N
8864	413	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.941	MODELO
8865	413	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.978	MODELO
8866	412	18	3	\N	\N	\N	\N
8867	412	19	4	\N	\N	\N	\N
8868	412	20	4	\N	\N	\N	\N
8869	412	21	2	\N	\N	\N	\N
8870	412	22	4	\N	\N	\N	\N
8871	412	23	4	\N	\N	\N	\N
8872	412	24	4	\N	\N	\N	\N
8873	412	27	3	\N	\N	\N	\N
8874	412	28	4	\N	\N	\N	\N
8875	412	29	3	\N	\N	\N	\N
8876	412	30	3	\N	\N	\N	\N
8877	412	31	3	\N	\N	\N	\N
8878	412	32	4	\N	\N	\N	\N
8879	412	33	4	\N	\N	\N	\N
8880	412	34	3	\N	\N	\N	\N
8881	412	35	3	\N	\N	\N	\N
8882	412	36	4	\N	\N	\N	\N
8883	412	37	4	\N	\N	\N	\N
8884	412	38	3	\N	\N	\N	\N
8885	412	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.612	MODELO
8886	412	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.842	MODELO
8887	411	18	4	\N	\N	\N	\N
8888	411	19	2	\N	\N	\N	\N
8889	411	20	3	\N	\N	\N	\N
8890	411	21	3	\N	\N	\N	\N
8891	411	22	3	\N	\N	\N	\N
8892	411	23	3	\N	\N	\N	\N
8893	411	24	4	\N	\N	\N	\N
8894	411	27	3	\N	\N	\N	\N
8895	411	28	2	\N	\N	\N	\N
8896	411	29	3	\N	\N	\N	\N
8897	411	30	2	\N	\N	\N	\N
8898	411	31	3	\N	\N	\N	\N
8899	411	32	3	\N	\N	\N	\N
8900	411	33	3	\N	\N	\N	\N
8901	411	34	3	\N	\N	\N	\N
8902	411	35	4	\N	\N	\N	\N
8903	411	36	3	\N	\N	\N	\N
8904	411	37	3	\N	\N	\N	\N
8905	411	38	4	\N	\N	\N	\N
8906	411	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.801	MODELO
8907	411	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.828	MODELO
8908	410	18	3	\N	\N	\N	\N
8909	410	19	3	\N	\N	\N	\N
8910	410	20	4	\N	\N	\N	\N
8911	410	21	4	\N	\N	\N	\N
8912	410	22	3	\N	\N	\N	\N
8913	410	23	2	\N	\N	\N	\N
8914	410	24	3	\N	\N	\N	\N
8915	410	27	3	\N	\N	\N	\N
8916	410	28	4	\N	\N	\N	\N
8917	410	29	3	\N	\N	\N	\N
8918	410	30	3	\N	\N	\N	\N
8919	410	31	3	\N	\N	\N	\N
8920	410	32	2	\N	\N	\N	\N
8921	410	33	3	\N	\N	\N	\N
8922	410	34	1	\N	\N	\N	\N
8923	410	35	4	\N	\N	\N	\N
8924	410	36	4	\N	\N	\N	\N
8925	410	37	3	\N	\N	\N	\N
8926	410	38	3	\N	\N	\N	\N
8927	410	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.701	MODELO
8928	410	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.833	MODELO
8929	409	18	4	\N	\N	\N	\N
8930	409	19	2	\N	\N	\N	\N
8931	409	20	3	\N	\N	\N	\N
8932	409	21	3	\N	\N	\N	\N
8933	409	22	4	\N	\N	\N	\N
8934	409	23	3	\N	\N	\N	\N
8935	409	24	4	\N	\N	\N	\N
8936	409	27	2	\N	\N	\N	\N
8937	409	28	4	\N	\N	\N	\N
8938	409	29	4	\N	\N	\N	\N
8939	409	30	2	\N	\N	\N	\N
8940	409	31	2	\N	\N	\N	\N
8941	409	32	4	\N	\N	\N	\N
8942	409	33	3	\N	\N	\N	\N
8943	409	34	4	\N	\N	\N	\N
8944	409	35	3	\N	\N	\N	\N
8945	409	36	3	\N	\N	\N	\N
8946	409	37	3	\N	\N	\N	\N
8947	409	38	3	\N	\N	\N	\N
8948	409	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.869	MODELO
8949	409	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.904	MODELO
8950	408	18	2	\N	\N	\N	\N
8951	408	19	3	\N	\N	\N	\N
8952	408	20	2	\N	\N	\N	\N
8953	408	21	3	\N	\N	\N	\N
8954	408	22	3	\N	\N	\N	\N
8955	408	23	4	\N	\N	\N	\N
8956	408	24	4	\N	\N	\N	\N
8957	408	27	4	\N	\N	\N	\N
8958	408	28	2	\N	\N	\N	\N
8959	408	29	3	\N	\N	\N	\N
8960	408	30	4	\N	\N	\N	\N
8961	408	31	3	\N	\N	\N	\N
8962	408	32	3	\N	\N	\N	\N
8963	408	33	3	\N	\N	\N	\N
8964	408	34	4	\N	\N	\N	\N
8965	408	35	4	\N	\N	\N	\N
8966	408	36	4	\N	\N	\N	\N
8967	408	37	3	\N	\N	\N	\N
8968	408	38	4	\N	\N	\N	\N
8969	408	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.805	MODELO
8970	408	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.593	MODELO
8971	407	18	4	\N	\N	\N	\N
8972	407	19	3	\N	\N	\N	\N
8973	407	20	3	\N	\N	\N	\N
8974	407	21	3	\N	\N	\N	\N
8975	407	22	3	\N	\N	\N	\N
8976	407	23	4	\N	\N	\N	\N
8977	407	24	3	\N	\N	\N	\N
8978	407	27	4	\N	\N	\N	\N
8979	407	28	4	\N	\N	\N	\N
8980	407	29	1	\N	\N	\N	\N
8981	407	30	3	\N	\N	\N	\N
8982	407	31	3	\N	\N	\N	\N
8983	407	32	4	\N	\N	\N	\N
8984	407	33	3	\N	\N	\N	\N
8985	407	34	3	\N	\N	\N	\N
8986	407	35	4	\N	\N	\N	\N
8987	407	36	4	\N	\N	\N	\N
8988	407	37	1	\N	\N	\N	\N
8989	407	38	2	\N	\N	\N	\N
8990	407	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.896	MODELO
8991	407	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.545	MODELO
8992	406	18	4	\N	\N	\N	\N
8993	406	19	2	\N	\N	\N	\N
8994	406	20	4	\N	\N	\N	\N
8995	406	21	2	\N	\N	\N	\N
8996	406	22	4	\N	\N	\N	\N
8997	406	23	4	\N	\N	\N	\N
8998	406	24	1	\N	\N	\N	\N
8999	406	27	4	\N	\N	\N	\N
9000	406	28	1	\N	\N	\N	\N
9001	406	29	1	\N	\N	\N	\N
9002	406	30	4	\N	\N	\N	\N
9003	406	31	2	\N	\N	\N	\N
9004	406	32	4	\N	\N	\N	\N
9005	406	33	3	\N	\N	\N	\N
9006	406	34	3	\N	\N	\N	\N
9007	406	35	3	\N	\N	\N	\N
9008	406	36	3	\N	\N	\N	\N
9009	406	37	4	\N	\N	\N	\N
9010	406	38	4	\N	\N	\N	\N
9011	406	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.582	MODELO
9012	406	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.733	MODELO
9013	405	18	3	\N	\N	\N	\N
9014	405	19	3	\N	\N	\N	\N
9015	405	20	3	\N	\N	\N	\N
9016	405	21	3	\N	\N	\N	\N
9017	405	22	4	\N	\N	\N	\N
9018	405	23	3	\N	\N	\N	\N
9019	405	24	3	\N	\N	\N	\N
9020	405	27	3	\N	\N	\N	\N
9021	405	28	3	\N	\N	\N	\N
9022	405	29	3	\N	\N	\N	\N
9023	405	30	3	\N	\N	\N	\N
9024	405	31	2	\N	\N	\N	\N
9025	405	32	3	\N	\N	\N	\N
9026	405	33	4	\N	\N	\N	\N
9027	405	34	3	\N	\N	\N	\N
9028	405	35	4	\N	\N	\N	\N
9029	405	36	3	\N	\N	\N	\N
9030	405	37	3	\N	\N	\N	\N
9031	405	38	4	\N	\N	\N	\N
9032	405	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.717	MODELO
9033	405	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.717	MODELO
9034	404	18	4	\N	\N	\N	\N
9035	404	19	2	\N	\N	\N	\N
9036	404	20	3	\N	\N	\N	\N
9037	404	21	4	\N	\N	\N	\N
9038	404	22	4	\N	\N	\N	\N
9039	404	23	4	\N	\N	\N	\N
9040	404	24	4	\N	\N	\N	\N
9041	404	27	3	\N	\N	\N	\N
9042	404	28	3	\N	\N	\N	\N
9043	404	29	3	\N	\N	\N	\N
9044	404	30	2	\N	\N	\N	\N
9045	404	31	3	\N	\N	\N	\N
9046	404	32	4	\N	\N	\N	\N
9047	404	33	4	\N	\N	\N	\N
9048	404	34	3	\N	\N	\N	\N
9049	404	35	3	\N	\N	\N	\N
9050	404	36	3	\N	\N	\N	\N
9051	404	37	2	\N	\N	\N	\N
9052	404	38	3	\N	\N	\N	\N
9053	404	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.792	MODELO
9054	404	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.714	MODELO
9055	403	18	3	\N	\N	\N	\N
9056	403	19	4	\N	\N	\N	\N
9057	403	20	3	\N	\N	\N	\N
9058	403	21	4	\N	\N	\N	\N
9059	403	22	2	\N	\N	\N	\N
9060	403	23	4	\N	\N	\N	\N
9061	403	24	3	\N	\N	\N	\N
9062	403	27	3	\N	\N	\N	\N
9063	403	28	3	\N	\N	\N	\N
9064	403	29	3	\N	\N	\N	\N
9065	403	30	2	\N	\N	\N	\N
9066	403	31	3	\N	\N	\N	\N
9067	403	32	4	\N	\N	\N	\N
9068	403	33	3	\N	\N	\N	\N
9069	403	34	4	\N	\N	\N	\N
9070	403	35	3	\N	\N	\N	\N
9071	403	36	3	\N	\N	\N	\N
9072	403	37	3	\N	\N	\N	\N
9073	403	38	4	\N	\N	\N	\N
9074	403	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.729	MODELO
9075	403	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.94	MODELO
9076	402	18	3	\N	\N	\N	\N
9077	402	19	4	\N	\N	\N	\N
9078	402	20	2	\N	\N	\N	\N
9079	402	21	4	\N	\N	\N	\N
9080	402	22	3	\N	\N	\N	\N
9081	402	23	1	\N	\N	\N	\N
9082	402	24	4	\N	\N	\N	\N
9083	402	27	2	\N	\N	\N	\N
9084	402	28	2	\N	\N	\N	\N
9085	402	29	4	\N	\N	\N	\N
9086	402	30	4	\N	\N	\N	\N
9087	402	31	2	\N	\N	\N	\N
9088	402	32	1	\N	\N	\N	\N
9089	402	33	4	\N	\N	\N	\N
9090	402	34	2	\N	\N	\N	\N
9091	402	35	3	\N	\N	\N	\N
9092	402	36	4	\N	\N	\N	\N
9093	402	37	3	\N	\N	\N	\N
9094	402	38	4	\N	\N	\N	\N
9095	402	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.925	MODELO
9096	402	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.865	MODELO
9097	401	18	4	\N	\N	\N	\N
9098	401	19	3	\N	\N	\N	\N
9099	401	20	2	\N	\N	\N	\N
9100	401	21	3	\N	\N	\N	\N
9101	401	22	4	\N	\N	\N	\N
9102	401	23	4	\N	\N	\N	\N
9103	401	24	3	\N	\N	\N	\N
9104	401	27	4	\N	\N	\N	\N
9105	401	28	3	\N	\N	\N	\N
9106	401	29	4	\N	\N	\N	\N
9107	401	30	3	\N	\N	\N	\N
9108	401	31	3	\N	\N	\N	\N
9109	401	32	4	\N	\N	\N	\N
9110	401	33	4	\N	\N	\N	\N
9111	401	34	2	\N	\N	\N	\N
9112	401	35	3	\N	\N	\N	\N
9113	401	36	1	\N	\N	\N	\N
9114	401	37	4	\N	\N	\N	\N
9115	401	38	4	\N	\N	\N	\N
9116	401	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.979	MODELO
9117	401	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.66	MODELO
9118	400	18	4	\N	\N	\N	\N
9119	400	19	4	\N	\N	\N	\N
9120	400	20	3	\N	\N	\N	\N
9121	400	21	4	\N	\N	\N	\N
9122	400	22	4	\N	\N	\N	\N
9123	400	23	4	\N	\N	\N	\N
9124	400	24	4	\N	\N	\N	\N
9125	400	27	3	\N	\N	\N	\N
9126	400	28	4	\N	\N	\N	\N
9127	400	29	3	\N	\N	\N	\N
9128	400	30	3	\N	\N	\N	\N
9129	400	31	4	\N	\N	\N	\N
9130	400	32	3	\N	\N	\N	\N
9131	400	33	2	\N	\N	\N	\N
9132	400	34	3	\N	\N	\N	\N
9133	400	35	3	\N	\N	\N	\N
9134	400	36	3	\N	\N	\N	\N
9135	400	37	4	\N	\N	\N	\N
9136	400	38	3	\N	\N	\N	\N
9137	400	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.599	MODELO
9138	400	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.74	MODELO
9139	399	18	3	\N	\N	\N	\N
9140	399	19	3	\N	\N	\N	\N
9141	399	20	3	\N	\N	\N	\N
9142	399	21	4	\N	\N	\N	\N
9143	399	22	1	\N	\N	\N	\N
9144	399	23	3	\N	\N	\N	\N
9145	399	24	3	\N	\N	\N	\N
9146	399	27	3	\N	\N	\N	\N
9147	399	28	3	\N	\N	\N	\N
9148	399	29	3	\N	\N	\N	\N
9149	399	30	3	\N	\N	\N	\N
9150	399	31	3	\N	\N	\N	\N
9151	399	32	3	\N	\N	\N	\N
9152	399	33	1	\N	\N	\N	\N
9153	399	34	3	\N	\N	\N	\N
9154	399	35	4	\N	\N	\N	\N
9155	399	36	4	\N	\N	\N	\N
9156	399	37	4	\N	\N	\N	\N
9157	399	38	2	\N	\N	\N	\N
9158	399	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.914	MODELO
9159	399	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.868	MODELO
9160	398	18	4	\N	\N	\N	\N
9161	398	19	4	\N	\N	\N	\N
9162	398	20	4	\N	\N	\N	\N
9163	398	21	3	\N	\N	\N	\N
9164	398	22	2	\N	\N	\N	\N
9165	398	23	3	\N	\N	\N	\N
9166	398	24	4	\N	\N	\N	\N
9167	398	27	3	\N	\N	\N	\N
9168	398	28	4	\N	\N	\N	\N
9169	398	29	4	\N	\N	\N	\N
9170	398	30	4	\N	\N	\N	\N
9171	398	31	3	\N	\N	\N	\N
9172	398	32	4	\N	\N	\N	\N
9173	398	33	3	\N	\N	\N	\N
9174	398	34	3	\N	\N	\N	\N
9175	398	35	4	\N	\N	\N	\N
9176	398	36	3	\N	\N	\N	\N
9177	398	37	3	\N	\N	\N	\N
9178	398	38	3	\N	\N	\N	\N
9179	398	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.755	MODELO
9180	398	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.86	MODELO
9181	397	18	3	\N	\N	\N	\N
9182	397	19	4	\N	\N	\N	\N
9183	397	20	3	\N	\N	\N	\N
9184	397	21	4	\N	\N	\N	\N
9185	397	22	3	\N	\N	\N	\N
9186	397	23	4	\N	\N	\N	\N
9187	397	24	3	\N	\N	\N	\N
9188	397	27	3	\N	\N	\N	\N
9189	397	28	4	\N	\N	\N	\N
9190	397	29	3	\N	\N	\N	\N
9191	397	30	3	\N	\N	\N	\N
9192	397	31	4	\N	\N	\N	\N
9193	397	32	3	\N	\N	\N	\N
9194	397	33	4	\N	\N	\N	\N
9195	397	34	3	\N	\N	\N	\N
9196	397	35	3	\N	\N	\N	\N
9197	397	36	4	\N	\N	\N	\N
9198	397	37	3	\N	\N	\N	\N
9199	397	38	2	\N	\N	\N	\N
9200	397	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.826	MODELO
9201	397	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.686	MODELO
9202	396	18	3	\N	\N	\N	\N
9203	396	19	4	\N	\N	\N	\N
9204	396	20	3	\N	\N	\N	\N
9205	396	21	3	\N	\N	\N	\N
9206	396	22	3	\N	\N	\N	\N
9207	396	23	2	\N	\N	\N	\N
9208	396	24	3	\N	\N	\N	\N
9209	396	27	3	\N	\N	\N	\N
9210	396	28	4	\N	\N	\N	\N
9211	396	29	3	\N	\N	\N	\N
9212	396	30	3	\N	\N	\N	\N
9213	396	31	3	\N	\N	\N	\N
9214	396	32	2	\N	\N	\N	\N
9215	396	33	3	\N	\N	\N	\N
9216	396	34	4	\N	\N	\N	\N
9217	396	35	4	\N	\N	\N	\N
9218	396	36	2	\N	\N	\N	\N
9219	396	37	2	\N	\N	\N	\N
9220	396	38	3	\N	\N	\N	\N
9221	396	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.961	MODELO
9222	396	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.846	MODELO
9223	395	18	3	\N	\N	\N	\N
9224	395	19	3	\N	\N	\N	\N
9225	395	20	2	\N	\N	\N	\N
9226	395	21	2	\N	\N	\N	\N
9227	395	22	4	\N	\N	\N	\N
9228	395	23	4	\N	\N	\N	\N
9229	395	24	4	\N	\N	\N	\N
9230	395	27	2	\N	\N	\N	\N
9231	395	28	2	\N	\N	\N	\N
9232	395	29	4	\N	\N	\N	\N
9233	395	30	2	\N	\N	\N	\N
9234	395	31	4	\N	\N	\N	\N
9235	395	32	2	\N	\N	\N	\N
9236	395	33	3	\N	\N	\N	\N
9237	395	34	2	\N	\N	\N	\N
9238	395	35	4	\N	\N	\N	\N
9239	395	36	3	\N	\N	\N	\N
9240	395	37	3	\N	\N	\N	\N
9241	395	38	4	\N	\N	\N	\N
9242	395	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.74	MODELO
9243	395	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.851	MODELO
9244	394	18	3	\N	\N	\N	\N
9245	394	19	2	\N	\N	\N	\N
9246	394	20	3	\N	\N	\N	\N
9247	394	21	3	\N	\N	\N	\N
9248	394	22	3	\N	\N	\N	\N
9249	394	23	3	\N	\N	\N	\N
9250	394	24	3	\N	\N	\N	\N
9251	394	27	3	\N	\N	\N	\N
9252	394	28	3	\N	\N	\N	\N
9253	394	29	3	\N	\N	\N	\N
9254	394	30	4	\N	\N	\N	\N
9255	394	31	3	\N	\N	\N	\N
9256	394	32	4	\N	\N	\N	\N
9257	394	33	3	\N	\N	\N	\N
9258	394	34	4	\N	\N	\N	\N
9259	394	35	4	\N	\N	\N	\N
9260	394	36	3	\N	\N	\N	\N
9261	394	37	4	\N	\N	\N	\N
9262	394	38	4	\N	\N	\N	\N
9263	394	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.741	MODELO
9264	394	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.655	MODELO
9265	393	18	4	\N	\N	\N	\N
9266	393	19	3	\N	\N	\N	\N
9267	393	20	3	\N	\N	\N	\N
9268	393	21	4	\N	\N	\N	\N
9269	393	22	1	\N	\N	\N	\N
9270	393	23	3	\N	\N	\N	\N
9271	393	24	4	\N	\N	\N	\N
9272	393	27	3	\N	\N	\N	\N
9273	393	28	4	\N	\N	\N	\N
9274	393	29	4	\N	\N	\N	\N
9275	393	30	3	\N	\N	\N	\N
9276	393	31	2	\N	\N	\N	\N
9277	393	32	3	\N	\N	\N	\N
9278	393	33	4	\N	\N	\N	\N
9279	393	34	4	\N	\N	\N	\N
9280	393	35	4	\N	\N	\N	\N
9281	393	36	3	\N	\N	\N	\N
9282	393	37	4	\N	\N	\N	\N
9283	393	38	2	\N	\N	\N	\N
9284	393	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.726	MODELO
9285	393	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.594	MODELO
9286	392	18	4	\N	\N	\N	\N
9287	392	19	3	\N	\N	\N	\N
9288	392	20	2	\N	\N	\N	\N
9289	392	21	3	\N	\N	\N	\N
9290	392	22	4	\N	\N	\N	\N
9291	392	23	3	\N	\N	\N	\N
9292	392	24	3	\N	\N	\N	\N
9293	392	27	4	\N	\N	\N	\N
9294	392	28	3	\N	\N	\N	\N
9295	392	29	3	\N	\N	\N	\N
9296	392	30	2	\N	\N	\N	\N
9297	392	31	3	\N	\N	\N	\N
9298	392	32	3	\N	\N	\N	\N
9299	392	33	4	\N	\N	\N	\N
9300	392	34	3	\N	\N	\N	\N
9301	392	35	3	\N	\N	\N	\N
9302	392	36	3	\N	\N	\N	\N
9303	392	37	4	\N	\N	\N	\N
9304	392	38	4	\N	\N	\N	\N
9305	392	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.784	MODELO
9306	392	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.619	MODELO
9307	391	18	1	\N	\N	\N	\N
9308	391	19	3	\N	\N	\N	\N
9309	391	20	3	\N	\N	\N	\N
9310	391	21	3	\N	\N	\N	\N
9311	391	22	4	\N	\N	\N	\N
9312	391	23	4	\N	\N	\N	\N
9313	391	24	4	\N	\N	\N	\N
9314	391	27	4	\N	\N	\N	\N
9315	391	28	4	\N	\N	\N	\N
9316	391	29	3	\N	\N	\N	\N
9317	391	30	4	\N	\N	\N	\N
9318	391	31	3	\N	\N	\N	\N
9319	391	32	3	\N	\N	\N	\N
9320	391	33	3	\N	\N	\N	\N
9321	391	34	3	\N	\N	\N	\N
9322	391	35	4	\N	\N	\N	\N
9323	391	36	3	\N	\N	\N	\N
9324	391	37	3	\N	\N	\N	\N
9325	391	38	3	\N	\N	\N	\N
9326	391	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.963	MODELO
9327	391	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.64	MODELO
9328	390	18	3	\N	\N	\N	\N
9329	390	19	3	\N	\N	\N	\N
9330	390	20	3	\N	\N	\N	\N
9331	390	21	3	\N	\N	\N	\N
9332	390	22	4	\N	\N	\N	\N
9333	390	23	4	\N	\N	\N	\N
9334	390	24	3	\N	\N	\N	\N
9335	390	27	3	\N	\N	\N	\N
9336	390	28	4	\N	\N	\N	\N
9337	390	29	3	\N	\N	\N	\N
9338	390	30	3	\N	\N	\N	\N
9339	390	31	1	\N	\N	\N	\N
9340	390	32	4	\N	\N	\N	\N
9341	390	33	4	\N	\N	\N	\N
9342	390	34	4	\N	\N	\N	\N
9343	390	35	3	\N	\N	\N	\N
9344	390	36	4	\N	\N	\N	\N
9345	390	37	4	\N	\N	\N	\N
9346	390	38	3	\N	\N	\N	\N
9347	390	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.868	MODELO
9348	390	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.582	MODELO
9349	389	18	3	\N	\N	\N	\N
9350	389	19	4	\N	\N	\N	\N
9351	389	20	3	\N	\N	\N	\N
9352	389	21	3	\N	\N	\N	\N
9353	389	22	3	\N	\N	\N	\N
9354	389	23	3	\N	\N	\N	\N
9355	389	24	4	\N	\N	\N	\N
9356	389	27	3	\N	\N	\N	\N
9357	389	28	2	\N	\N	\N	\N
9358	389	29	3	\N	\N	\N	\N
9359	389	30	2	\N	\N	\N	\N
9360	389	31	4	\N	\N	\N	\N
9361	389	32	4	\N	\N	\N	\N
9362	389	33	4	\N	\N	\N	\N
9363	389	34	4	\N	\N	\N	\N
9364	389	35	4	\N	\N	\N	\N
9365	389	36	4	\N	\N	\N	\N
9366	389	37	4	\N	\N	\N	\N
9367	389	38	3	\N	\N	\N	\N
9368	389	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.816	MODELO
9369	389	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.767	MODELO
9370	388	18	2	\N	\N	\N	\N
9371	388	19	2	\N	\N	\N	\N
9372	388	20	3	\N	\N	\N	\N
9373	388	21	3	\N	\N	\N	\N
9374	388	22	4	\N	\N	\N	\N
9375	388	23	4	\N	\N	\N	\N
9376	388	24	3	\N	\N	\N	\N
9377	388	27	3	\N	\N	\N	\N
9378	388	28	4	\N	\N	\N	\N
9379	388	29	4	\N	\N	\N	\N
9380	388	30	3	\N	\N	\N	\N
9381	388	31	2	\N	\N	\N	\N
9382	388	32	4	\N	\N	\N	\N
9383	388	33	2	\N	\N	\N	\N
9384	388	34	3	\N	\N	\N	\N
9385	388	35	4	\N	\N	\N	\N
9386	388	36	4	\N	\N	\N	\N
9387	388	37	4	\N	\N	\N	\N
9388	388	38	4	\N	\N	\N	\N
9389	388	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.928	MODELO
9390	388	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.976	MODELO
9391	387	18	4	\N	\N	\N	\N
9392	387	19	4	\N	\N	\N	\N
9393	387	20	3	\N	\N	\N	\N
9394	387	21	3	\N	\N	\N	\N
9395	387	22	4	\N	\N	\N	\N
9396	387	23	2	\N	\N	\N	\N
9397	387	24	4	\N	\N	\N	\N
9398	387	27	1	\N	\N	\N	\N
9399	387	28	4	\N	\N	\N	\N
9400	387	29	4	\N	\N	\N	\N
9401	387	30	2	\N	\N	\N	\N
9402	387	31	4	\N	\N	\N	\N
9403	387	32	2	\N	\N	\N	\N
9404	387	33	4	\N	\N	\N	\N
9405	387	34	4	\N	\N	\N	\N
9406	387	35	4	\N	\N	\N	\N
9407	387	36	3	\N	\N	\N	\N
9408	387	37	3	\N	\N	\N	\N
9409	387	38	4	\N	\N	\N	\N
9410	387	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.77	MODELO
9411	387	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.913	MODELO
9412	386	18	3	\N	\N	\N	\N
9413	386	19	4	\N	\N	\N	\N
9414	386	20	3	\N	\N	\N	\N
9415	386	21	4	\N	\N	\N	\N
9416	386	22	4	\N	\N	\N	\N
9417	386	23	3	\N	\N	\N	\N
9418	386	24	3	\N	\N	\N	\N
9419	386	27	3	\N	\N	\N	\N
9420	386	28	3	\N	\N	\N	\N
9421	386	29	4	\N	\N	\N	\N
9422	386	30	3	\N	\N	\N	\N
9423	386	31	4	\N	\N	\N	\N
9424	386	32	4	\N	\N	\N	\N
9425	386	33	3	\N	\N	\N	\N
9426	386	34	3	\N	\N	\N	\N
9427	386	35	4	\N	\N	\N	\N
9428	386	36	3	\N	\N	\N	\N
9429	386	37	3	\N	\N	\N	\N
9430	386	38	4	\N	\N	\N	\N
9431	386	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.83	MODELO
9432	386	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.566	MODELO
9433	385	18	4	\N	\N	\N	\N
9434	385	19	4	\N	\N	\N	\N
9435	385	20	3	\N	\N	\N	\N
9436	385	21	3	\N	\N	\N	\N
9437	385	22	3	\N	\N	\N	\N
9438	385	23	3	\N	\N	\N	\N
9439	385	24	1	\N	\N	\N	\N
9440	385	27	4	\N	\N	\N	\N
9441	385	28	4	\N	\N	\N	\N
9442	385	29	3	\N	\N	\N	\N
9443	385	30	3	\N	\N	\N	\N
9444	385	31	3	\N	\N	\N	\N
9445	385	32	4	\N	\N	\N	\N
9446	385	33	2	\N	\N	\N	\N
9447	385	34	4	\N	\N	\N	\N
9448	385	35	2	\N	\N	\N	\N
9449	385	36	3	\N	\N	\N	\N
9450	385	37	3	\N	\N	\N	\N
9451	385	38	1	\N	\N	\N	\N
9452	385	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.921	MODELO
9453	385	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.961	MODELO
9454	384	18	3	\N	\N	\N	\N
9455	384	19	4	\N	\N	\N	\N
9456	384	20	3	\N	\N	\N	\N
9457	384	21	2	\N	\N	\N	\N
9458	384	22	3	\N	\N	\N	\N
9459	384	23	3	\N	\N	\N	\N
9460	384	24	4	\N	\N	\N	\N
9461	384	27	3	\N	\N	\N	\N
9462	384	28	4	\N	\N	\N	\N
9463	384	29	4	\N	\N	\N	\N
9464	384	30	4	\N	\N	\N	\N
9465	384	31	4	\N	\N	\N	\N
9466	384	32	4	\N	\N	\N	\N
9467	384	33	3	\N	\N	\N	\N
9468	384	34	4	\N	\N	\N	\N
9469	384	35	3	\N	\N	\N	\N
9470	384	36	3	\N	\N	\N	\N
9471	384	37	3	\N	\N	\N	\N
9472	384	38	3	\N	\N	\N	\N
9473	384	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.712	MODELO
9474	384	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.782	MODELO
9475	383	18	4	\N	\N	\N	\N
9476	383	19	4	\N	\N	\N	\N
9477	383	20	3	\N	\N	\N	\N
9478	383	21	3	\N	\N	\N	\N
9479	383	22	3	\N	\N	\N	\N
9480	383	23	2	\N	\N	\N	\N
9481	383	24	4	\N	\N	\N	\N
9482	383	27	1	\N	\N	\N	\N
9483	383	28	3	\N	\N	\N	\N
9484	383	29	2	\N	\N	\N	\N
9485	383	30	4	\N	\N	\N	\N
9486	383	31	4	\N	\N	\N	\N
9487	383	32	2	\N	\N	\N	\N
9488	383	33	3	\N	\N	\N	\N
9489	383	34	3	\N	\N	\N	\N
9490	383	35	3	\N	\N	\N	\N
9491	383	36	4	\N	\N	\N	\N
9492	383	37	4	\N	\N	\N	\N
9493	383	38	3	\N	\N	\N	\N
9494	383	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.907	MODELO
9495	383	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.72	MODELO
9496	382	18	4	\N	\N	\N	\N
9497	382	19	4	\N	\N	\N	\N
9498	382	20	4	\N	\N	\N	\N
9499	382	21	2	\N	\N	\N	\N
9500	382	22	1	\N	\N	\N	\N
9501	382	23	4	\N	\N	\N	\N
9502	382	24	3	\N	\N	\N	\N
9503	382	27	3	\N	\N	\N	\N
9504	382	28	2	\N	\N	\N	\N
9505	382	29	3	\N	\N	\N	\N
9506	382	30	3	\N	\N	\N	\N
9507	382	31	3	\N	\N	\N	\N
9508	382	32	3	\N	\N	\N	\N
9509	382	33	3	\N	\N	\N	\N
9510	382	34	3	\N	\N	\N	\N
9511	382	35	4	\N	\N	\N	\N
9512	382	36	4	\N	\N	\N	\N
9513	382	37	3	\N	\N	\N	\N
9514	382	38	2	\N	\N	\N	\N
9515	382	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.772	MODELO
9516	382	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.863	MODELO
9517	381	18	3	\N	\N	\N	\N
9518	381	19	3	\N	\N	\N	\N
9519	381	20	3	\N	\N	\N	\N
9520	381	21	3	\N	\N	\N	\N
9521	381	22	3	\N	\N	\N	\N
9522	381	23	3	\N	\N	\N	\N
9523	381	24	4	\N	\N	\N	\N
9524	381	27	3	\N	\N	\N	\N
9525	381	28	4	\N	\N	\N	\N
9526	381	29	4	\N	\N	\N	\N
9527	381	30	4	\N	\N	\N	\N
9528	381	31	3	\N	\N	\N	\N
9529	381	32	4	\N	\N	\N	\N
9530	381	33	2	\N	\N	\N	\N
9531	381	34	3	\N	\N	\N	\N
9532	381	35	2	\N	\N	\N	\N
9533	381	36	4	\N	\N	\N	\N
9534	381	37	4	\N	\N	\N	\N
9535	381	38	3	\N	\N	\N	\N
9536	381	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.772	MODELO
9537	381	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.816	MODELO
9538	380	18	1	\N	\N	\N	\N
9539	380	19	4	\N	\N	\N	\N
9540	380	20	4	\N	\N	\N	\N
9541	380	21	4	\N	\N	\N	\N
9542	380	22	4	\N	\N	\N	\N
9543	380	23	4	\N	\N	\N	\N
9544	380	24	4	\N	\N	\N	\N
9545	380	27	3	\N	\N	\N	\N
9546	380	28	3	\N	\N	\N	\N
9547	380	29	3	\N	\N	\N	\N
9548	380	30	3	\N	\N	\N	\N
9549	380	31	1	\N	\N	\N	\N
9550	380	32	1	\N	\N	\N	\N
9551	380	33	1	\N	\N	\N	\N
9552	380	34	4	\N	\N	\N	\N
9553	380	35	3	\N	\N	\N	\N
9554	380	36	4	\N	\N	\N	\N
9555	380	37	4	\N	\N	\N	\N
9556	380	38	3	\N	\N	\N	\N
9676	374	32	4	\N	\N	\N	\N
9677	374	33	2	\N	\N	\N	\N
9557	380	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.82	MODELO
9558	380	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.793	MODELO
9559	379	18	3	\N	\N	\N	\N
9560	379	19	3	\N	\N	\N	\N
9561	379	20	4	\N	\N	\N	\N
9562	379	21	2	\N	\N	\N	\N
9563	379	22	4	\N	\N	\N	\N
9564	379	23	3	\N	\N	\N	\N
9565	379	24	3	\N	\N	\N	\N
9566	379	27	3	\N	\N	\N	\N
9567	379	28	3	\N	\N	\N	\N
9568	379	29	3	\N	\N	\N	\N
9569	379	30	4	\N	\N	\N	\N
9570	379	31	3	\N	\N	\N	\N
9571	379	32	4	\N	\N	\N	\N
9572	379	33	4	\N	\N	\N	\N
9573	379	34	2	\N	\N	\N	\N
9574	379	35	4	\N	\N	\N	\N
9575	379	36	3	\N	\N	\N	\N
9576	379	37	4	\N	\N	\N	\N
9577	379	38	2	\N	\N	\N	\N
9578	379	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.769	MODELO
9579	379	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.714	MODELO
9580	378	18	3	\N	\N	\N	\N
9581	378	19	3	\N	\N	\N	\N
9582	378	20	3	\N	\N	\N	\N
9583	378	21	3	\N	\N	\N	\N
9584	378	22	4	\N	\N	\N	\N
9585	378	23	4	\N	\N	\N	\N
9586	378	24	4	\N	\N	\N	\N
9587	378	27	3	\N	\N	\N	\N
9588	378	28	2	\N	\N	\N	\N
9589	378	29	2	\N	\N	\N	\N
9590	378	30	4	\N	\N	\N	\N
9591	378	31	4	\N	\N	\N	\N
9592	378	32	3	\N	\N	\N	\N
9593	378	33	2	\N	\N	\N	\N
9594	378	34	4	\N	\N	\N	\N
9595	378	35	3	\N	\N	\N	\N
9596	378	36	2	\N	\N	\N	\N
9597	378	37	4	\N	\N	\N	\N
9598	378	38	4	\N	\N	\N	\N
9599	378	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.862	MODELO
9600	378	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.753	MODELO
9601	377	18	4	\N	\N	\N	\N
9602	377	19	1	\N	\N	\N	\N
9603	377	20	3	\N	\N	\N	\N
9604	377	21	3	\N	\N	\N	\N
9605	377	22	4	\N	\N	\N	\N
9606	377	23	4	\N	\N	\N	\N
9607	377	24	3	\N	\N	\N	\N
9608	377	27	3	\N	\N	\N	\N
9609	377	28	3	\N	\N	\N	\N
9610	377	29	3	\N	\N	\N	\N
9611	377	30	2	\N	\N	\N	\N
9612	377	31	3	\N	\N	\N	\N
9613	377	32	3	\N	\N	\N	\N
9614	377	33	3	\N	\N	\N	\N
9615	377	34	3	\N	\N	\N	\N
9616	377	35	3	\N	\N	\N	\N
9617	377	36	3	\N	\N	\N	\N
9618	377	37	3	\N	\N	\N	\N
9619	377	38	1	\N	\N	\N	\N
9620	377	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.888	MODELO
9621	377	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.973	MODELO
9622	376	18	3	\N	\N	\N	\N
9623	376	19	3	\N	\N	\N	\N
9624	376	20	1	\N	\N	\N	\N
9625	376	21	2	\N	\N	\N	\N
9626	376	22	2	\N	\N	\N	\N
9627	376	23	4	\N	\N	\N	\N
9628	376	24	2	\N	\N	\N	\N
9629	376	27	4	\N	\N	\N	\N
9630	376	28	3	\N	\N	\N	\N
9631	376	29	3	\N	\N	\N	\N
9632	376	30	3	\N	\N	\N	\N
9633	376	31	2	\N	\N	\N	\N
9634	376	32	3	\N	\N	\N	\N
9635	376	33	3	\N	\N	\N	\N
9636	376	34	3	\N	\N	\N	\N
9637	376	35	4	\N	\N	\N	\N
9638	376	36	4	\N	\N	\N	\N
9639	376	37	4	\N	\N	\N	\N
9640	376	38	2	\N	\N	\N	\N
9641	376	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.707	MODELO
9642	376	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.607	MODELO
9643	375	18	4	\N	\N	\N	\N
9644	375	19	4	\N	\N	\N	\N
9645	375	20	4	\N	\N	\N	\N
9646	375	21	2	\N	\N	\N	\N
9647	375	22	3	\N	\N	\N	\N
9648	375	23	3	\N	\N	\N	\N
9649	375	24	4	\N	\N	\N	\N
9650	375	27	3	\N	\N	\N	\N
9651	375	28	4	\N	\N	\N	\N
9652	375	29	3	\N	\N	\N	\N
9653	375	30	3	\N	\N	\N	\N
9654	375	31	2	\N	\N	\N	\N
9655	375	32	3	\N	\N	\N	\N
9656	375	33	3	\N	\N	\N	\N
9657	375	34	2	\N	\N	\N	\N
9658	375	35	3	\N	\N	\N	\N
9659	375	36	3	\N	\N	\N	\N
9660	375	37	3	\N	\N	\N	\N
9661	375	38	3	\N	\N	\N	\N
9662	375	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.756	MODELO
9663	375	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.634	MODELO
9664	374	18	4	\N	\N	\N	\N
9665	374	19	3	\N	\N	\N	\N
9666	374	20	3	\N	\N	\N	\N
9667	374	21	3	\N	\N	\N	\N
9668	374	22	3	\N	\N	\N	\N
9669	374	23	4	\N	\N	\N	\N
9670	374	24	3	\N	\N	\N	\N
9671	374	27	3	\N	\N	\N	\N
9672	374	28	3	\N	\N	\N	\N
9673	374	29	1	\N	\N	\N	\N
9674	374	30	4	\N	\N	\N	\N
9675	374	31	4	\N	\N	\N	\N
9678	374	34	3	\N	\N	\N	\N
9679	374	35	3	\N	\N	\N	\N
9680	374	36	4	\N	\N	\N	\N
9681	374	37	4	\N	\N	\N	\N
9682	374	38	2	\N	\N	\N	\N
9683	374	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.975	MODELO
9684	374	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.799	MODELO
9685	373	18	2	\N	\N	\N	\N
9686	373	19	4	\N	\N	\N	\N
9687	373	20	4	\N	\N	\N	\N
9688	373	21	3	\N	\N	\N	\N
9689	373	22	3	\N	\N	\N	\N
9690	373	23	3	\N	\N	\N	\N
9691	373	24	4	\N	\N	\N	\N
9692	373	27	3	\N	\N	\N	\N
9693	373	28	3	\N	\N	\N	\N
9694	373	29	3	\N	\N	\N	\N
9695	373	30	3	\N	\N	\N	\N
9696	373	31	4	\N	\N	\N	\N
9697	373	32	3	\N	\N	\N	\N
9698	373	33	2	\N	\N	\N	\N
9699	373	34	4	\N	\N	\N	\N
9700	373	35	3	\N	\N	\N	\N
9701	373	36	4	\N	\N	\N	\N
9702	373	37	4	\N	\N	\N	\N
9703	373	38	3	\N	\N	\N	\N
9704	373	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.843	MODELO
9705	373	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.96	MODELO
9706	372	18	1	\N	\N	\N	\N
9707	372	19	4	\N	\N	\N	\N
9708	372	20	4	\N	\N	\N	\N
9709	372	21	3	\N	\N	\N	\N
9710	372	22	4	\N	\N	\N	\N
9711	372	23	3	\N	\N	\N	\N
9712	372	24	4	\N	\N	\N	\N
9713	372	27	4	\N	\N	\N	\N
9714	372	28	4	\N	\N	\N	\N
9715	372	29	2	\N	\N	\N	\N
9716	372	30	4	\N	\N	\N	\N
9717	372	31	4	\N	\N	\N	\N
9718	372	32	3	\N	\N	\N	\N
9719	372	33	3	\N	\N	\N	\N
9720	372	34	3	\N	\N	\N	\N
9721	372	35	4	\N	\N	\N	\N
9722	372	36	3	\N	\N	\N	\N
9723	372	37	4	\N	\N	\N	\N
9724	372	38	4	\N	\N	\N	\N
9725	372	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.736	MODELO
9726	372	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.507	MODELO
9727	1008	18	4	\N	\N	\N	\N
9728	1008	19	4	\N	\N	\N	\N
9729	1008	20	3	\N	\N	\N	\N
9730	1008	21	3	\N	\N	\N	\N
9731	1008	22	4	\N	\N	\N	\N
9732	1008	23	3	\N	\N	\N	\N
9733	1008	24	3	\N	\N	\N	\N
9734	1008	27	3	\N	\N	\N	\N
9735	1008	28	3	\N	\N	\N	\N
9736	1008	29	4	\N	\N	\N	\N
9737	1008	30	3	\N	\N	\N	\N
9738	1008	31	3	\N	\N	\N	\N
9739	1008	32	3	\N	\N	\N	\N
9740	1008	33	3	\N	\N	\N	\N
9741	1008	34	2	\N	\N	\N	\N
9742	1008	35	4	\N	\N	\N	\N
9743	1008	36	3	\N	\N	\N	\N
9744	1008	37	2	\N	\N	\N	\N
9745	1008	38	3	\N	\N	\N	\N
9746	1008	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.767	MODELO
9747	1008	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.893	MODELO
9748	1007	18	4	\N	\N	\N	\N
9749	1007	19	3	\N	\N	\N	\N
9750	1007	20	4	\N	\N	\N	\N
9751	1007	21	4	\N	\N	\N	\N
9752	1007	22	3	\N	\N	\N	\N
9753	1007	23	2	\N	\N	\N	\N
9754	1007	24	3	\N	\N	\N	\N
9755	1007	27	4	\N	\N	\N	\N
9756	1007	28	4	\N	\N	\N	\N
9757	1007	29	3	\N	\N	\N	\N
9758	1007	30	4	\N	\N	\N	\N
9759	1007	31	4	\N	\N	\N	\N
9760	1007	32	2	\N	\N	\N	\N
9761	1007	33	3	\N	\N	\N	\N
9762	1007	34	4	\N	\N	\N	\N
9763	1007	35	3	\N	\N	\N	\N
9764	1007	36	3	\N	\N	\N	\N
9765	1007	37	3	\N	\N	\N	\N
9766	1007	38	1	\N	\N	\N	\N
9767	1007	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.968	MODELO
9768	1007	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.823	MODELO
9769	1006	18	2	\N	\N	\N	\N
9770	1006	19	4	\N	\N	\N	\N
9771	1006	20	3	\N	\N	\N	\N
9772	1006	21	1	\N	\N	\N	\N
9773	1006	22	3	\N	\N	\N	\N
9774	1006	23	3	\N	\N	\N	\N
9775	1006	24	4	\N	\N	\N	\N
9776	1006	27	4	\N	\N	\N	\N
9777	1006	28	3	\N	\N	\N	\N
9778	1006	29	3	\N	\N	\N	\N
9779	1006	30	2	\N	\N	\N	\N
9780	1006	31	4	\N	\N	\N	\N
9781	1006	32	3	\N	\N	\N	\N
9782	1006	33	3	\N	\N	\N	\N
9783	1006	34	3	\N	\N	\N	\N
9784	1006	35	3	\N	\N	\N	\N
9785	1006	36	2	\N	\N	\N	\N
9786	1006	37	4	\N	\N	\N	\N
9787	1006	38	3	\N	\N	\N	\N
9788	1006	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.815	MODELO
9789	1006	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.851	MODELO
9790	1005	18	4	\N	\N	\N	\N
9791	1005	19	1	\N	\N	\N	\N
9792	1005	20	3	\N	\N	\N	\N
9793	1005	21	3	\N	\N	\N	\N
9794	1005	22	3	\N	\N	\N	\N
9795	1005	23	2	\N	\N	\N	\N
9796	1005	24	4	\N	\N	\N	\N
9797	1005	27	1	\N	\N	\N	\N
9798	1005	28	3	\N	\N	\N	\N
9799	1005	29	4	\N	\N	\N	\N
9800	1005	30	3	\N	\N	\N	\N
9801	1005	31	4	\N	\N	\N	\N
9802	1005	32	3	\N	\N	\N	\N
9803	1005	33	3	\N	\N	\N	\N
9804	1005	34	4	\N	\N	\N	\N
9805	1005	35	2	\N	\N	\N	\N
9806	1005	36	4	\N	\N	\N	\N
9807	1005	37	3	\N	\N	\N	\N
9808	1005	38	3	\N	\N	\N	\N
9809	1005	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.72	MODELO
9810	1005	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.737	MODELO
9811	1004	18	4	\N	\N	\N	\N
9812	1004	19	2	\N	\N	\N	\N
9813	1004	20	3	\N	\N	\N	\N
9814	1004	21	2	\N	\N	\N	\N
9815	1004	22	2	\N	\N	\N	\N
9816	1004	23	3	\N	\N	\N	\N
9817	1004	24	4	\N	\N	\N	\N
9818	1004	27	3	\N	\N	\N	\N
9819	1004	28	4	\N	\N	\N	\N
9820	1004	29	3	\N	\N	\N	\N
9821	1004	30	3	\N	\N	\N	\N
9822	1004	31	1	\N	\N	\N	\N
9823	1004	32	3	\N	\N	\N	\N
9824	1004	33	3	\N	\N	\N	\N
9825	1004	34	3	\N	\N	\N	\N
9826	1004	35	2	\N	\N	\N	\N
9827	1004	36	3	\N	\N	\N	\N
9828	1004	37	4	\N	\N	\N	\N
9829	1004	38	3	\N	\N	\N	\N
9830	1004	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.913	MODELO
9831	1004	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.847	MODELO
9832	1003	18	3	\N	\N	\N	\N
9833	1003	19	1	\N	\N	\N	\N
9834	1003	20	4	\N	\N	\N	\N
9835	1003	21	4	\N	\N	\N	\N
9836	1003	22	4	\N	\N	\N	\N
9837	1003	23	2	\N	\N	\N	\N
9838	1003	24	2	\N	\N	\N	\N
9839	1003	27	4	\N	\N	\N	\N
9840	1003	28	3	\N	\N	\N	\N
9841	1003	29	4	\N	\N	\N	\N
9842	1003	30	2	\N	\N	\N	\N
9843	1003	31	4	\N	\N	\N	\N
9844	1003	32	3	\N	\N	\N	\N
9845	1003	33	2	\N	\N	\N	\N
9846	1003	34	3	\N	\N	\N	\N
9847	1003	35	4	\N	\N	\N	\N
9848	1003	36	4	\N	\N	\N	\N
9849	1003	37	3	\N	\N	\N	\N
9850	1003	38	3	\N	\N	\N	\N
9851	1003	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.789	MODELO
9852	1003	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.934	MODELO
9853	1002	18	3	\N	\N	\N	\N
9854	1002	19	2	\N	\N	\N	\N
9855	1002	20	3	\N	\N	\N	\N
9856	1002	21	3	\N	\N	\N	\N
9857	1002	22	3	\N	\N	\N	\N
9858	1002	23	3	\N	\N	\N	\N
9859	1002	24	3	\N	\N	\N	\N
9860	1002	27	3	\N	\N	\N	\N
9861	1002	28	1	\N	\N	\N	\N
9862	1002	29	3	\N	\N	\N	\N
9863	1002	30	4	\N	\N	\N	\N
9864	1002	31	3	\N	\N	\N	\N
9865	1002	32	3	\N	\N	\N	\N
9866	1002	33	4	\N	\N	\N	\N
9867	1002	34	4	\N	\N	\N	\N
9868	1002	35	4	\N	\N	\N	\N
9869	1002	36	4	\N	\N	\N	\N
9870	1002	37	3	\N	\N	\N	\N
9871	1002	38	4	\N	\N	\N	\N
9872	1002	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.716	MODELO
9873	1002	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.59	MODELO
9874	1001	18	3	\N	\N	\N	\N
9875	1001	19	3	\N	\N	\N	\N
9876	1001	20	1	\N	\N	\N	\N
9877	1001	21	3	\N	\N	\N	\N
9878	1001	22	4	\N	\N	\N	\N
9879	1001	23	3	\N	\N	\N	\N
9880	1001	24	2	\N	\N	\N	\N
9881	1001	27	4	\N	\N	\N	\N
9882	1001	28	3	\N	\N	\N	\N
9883	1001	29	4	\N	\N	\N	\N
9884	1001	30	3	\N	\N	\N	\N
9885	1001	31	3	\N	\N	\N	\N
9886	1001	32	3	\N	\N	\N	\N
9887	1001	33	3	\N	\N	\N	\N
9888	1001	34	4	\N	\N	\N	\N
9889	1001	35	4	\N	\N	\N	\N
9890	1001	36	2	\N	\N	\N	\N
9891	1001	37	3	\N	\N	\N	\N
9892	1001	38	4	\N	\N	\N	\N
9893	1001	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.743	MODELO
9894	1001	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.824	MODELO
9895	1000	18	3	\N	\N	\N	\N
9896	1000	19	4	\N	\N	\N	\N
9897	1000	20	3	\N	\N	\N	\N
9898	1000	21	2	\N	\N	\N	\N
9899	1000	22	3	\N	\N	\N	\N
9900	1000	23	4	\N	\N	\N	\N
9901	1000	24	3	\N	\N	\N	\N
9902	1000	27	3	\N	\N	\N	\N
9903	1000	28	3	\N	\N	\N	\N
9904	1000	29	4	\N	\N	\N	\N
9905	1000	30	4	\N	\N	\N	\N
9906	1000	31	4	\N	\N	\N	\N
9907	1000	32	3	\N	\N	\N	\N
9908	1000	33	3	\N	\N	\N	\N
9909	1000	34	4	\N	\N	\N	\N
9910	1000	35	3	\N	\N	\N	\N
9911	1000	36	2	\N	\N	\N	\N
9912	1000	37	3	\N	\N	\N	\N
9913	1000	38	3	\N	\N	\N	\N
9914	1000	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.705	MODELO
9915	1000	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.73	MODELO
9916	999	18	4	\N	\N	\N	\N
9917	999	19	4	\N	\N	\N	\N
9918	999	20	2	\N	\N	\N	\N
9919	999	21	3	\N	\N	\N	\N
9920	999	22	3	\N	\N	\N	\N
9921	999	23	3	\N	\N	\N	\N
9922	999	24	3	\N	\N	\N	\N
9923	999	27	3	\N	\N	\N	\N
9924	999	28	4	\N	\N	\N	\N
9925	999	29	3	\N	\N	\N	\N
9926	999	30	1	\N	\N	\N	\N
9927	999	31	4	\N	\N	\N	\N
9928	999	32	4	\N	\N	\N	\N
9929	999	33	4	\N	\N	\N	\N
9930	999	34	3	\N	\N	\N	\N
9931	999	35	3	\N	\N	\N	\N
9932	999	36	4	\N	\N	\N	\N
9933	999	37	3	\N	\N	\N	\N
9934	999	38	2	\N	\N	\N	\N
9935	999	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.715	MODELO
9936	999	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.788	MODELO
9937	998	18	4	\N	\N	\N	\N
9938	998	19	3	\N	\N	\N	\N
9939	998	20	3	\N	\N	\N	\N
9940	998	21	3	\N	\N	\N	\N
9941	998	22	3	\N	\N	\N	\N
9942	998	23	3	\N	\N	\N	\N
9943	998	24	3	\N	\N	\N	\N
9944	998	27	3	\N	\N	\N	\N
9945	998	28	3	\N	\N	\N	\N
9946	998	29	3	\N	\N	\N	\N
9947	998	30	3	\N	\N	\N	\N
9948	998	31	3	\N	\N	\N	\N
9949	998	32	1	\N	\N	\N	\N
9950	998	33	4	\N	\N	\N	\N
9951	998	34	3	\N	\N	\N	\N
9952	998	35	3	\N	\N	\N	\N
9953	998	36	3	\N	\N	\N	\N
9954	998	37	3	\N	\N	\N	\N
9955	998	38	3	\N	\N	\N	\N
9956	998	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.501	MODELO
9957	998	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.664	MODELO
9958	997	18	4	\N	\N	\N	\N
9959	997	19	3	\N	\N	\N	\N
9960	997	20	3	\N	\N	\N	\N
9961	997	21	4	\N	\N	\N	\N
9962	997	22	4	\N	\N	\N	\N
9963	997	23	4	\N	\N	\N	\N
9964	997	24	3	\N	\N	\N	\N
9965	997	27	3	\N	\N	\N	\N
9966	997	28	3	\N	\N	\N	\N
9967	997	29	3	\N	\N	\N	\N
9968	997	30	4	\N	\N	\N	\N
9969	997	31	1	\N	\N	\N	\N
9970	997	32	4	\N	\N	\N	\N
9971	997	33	2	\N	\N	\N	\N
9972	997	34	3	\N	\N	\N	\N
9973	997	35	4	\N	\N	\N	\N
9974	997	36	4	\N	\N	\N	\N
9975	997	37	4	\N	\N	\N	\N
9976	997	38	3	\N	\N	\N	\N
9977	997	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.723	MODELO
9978	997	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.548	MODELO
9979	996	18	4	\N	\N	\N	\N
9980	996	19	3	\N	\N	\N	\N
9981	996	20	3	\N	\N	\N	\N
9982	996	21	4	\N	\N	\N	\N
9983	996	22	3	\N	\N	\N	\N
9984	996	23	3	\N	\N	\N	\N
9985	996	24	3	\N	\N	\N	\N
9986	996	27	3	\N	\N	\N	\N
9987	996	28	4	\N	\N	\N	\N
9988	996	29	4	\N	\N	\N	\N
9989	996	30	4	\N	\N	\N	\N
9990	996	31	1	\N	\N	\N	\N
9991	996	32	4	\N	\N	\N	\N
9992	996	33	1	\N	\N	\N	\N
9993	996	34	3	\N	\N	\N	\N
9994	996	35	3	\N	\N	\N	\N
9995	996	36	4	\N	\N	\N	\N
9996	996	37	3	\N	\N	\N	\N
9997	996	38	3	\N	\N	\N	\N
9998	996	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.929	MODELO
9999	996	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.681	MODELO
10000	995	18	4	\N	\N	\N	\N
10001	995	19	4	\N	\N	\N	\N
10002	995	20	3	\N	\N	\N	\N
10003	995	21	2	\N	\N	\N	\N
10004	995	22	3	\N	\N	\N	\N
10005	995	23	3	\N	\N	\N	\N
10006	995	24	4	\N	\N	\N	\N
10007	995	27	4	\N	\N	\N	\N
10008	995	28	4	\N	\N	\N	\N
10009	995	29	4	\N	\N	\N	\N
10010	995	30	4	\N	\N	\N	\N
10011	995	31	3	\N	\N	\N	\N
10012	995	32	4	\N	\N	\N	\N
10013	995	33	3	\N	\N	\N	\N
10014	995	34	4	\N	\N	\N	\N
10015	995	35	4	\N	\N	\N	\N
10016	995	36	4	\N	\N	\N	\N
10017	995	37	2	\N	\N	\N	\N
10018	995	38	4	\N	\N	\N	\N
10019	995	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.845	MODELO
10020	995	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.802	MODELO
10021	994	18	3	\N	\N	\N	\N
10022	994	19	3	\N	\N	\N	\N
10023	994	20	4	\N	\N	\N	\N
10024	994	21	3	\N	\N	\N	\N
10025	994	22	3	\N	\N	\N	\N
10026	994	23	4	\N	\N	\N	\N
10027	994	24	3	\N	\N	\N	\N
10028	994	27	3	\N	\N	\N	\N
10029	994	28	3	\N	\N	\N	\N
10030	994	29	4	\N	\N	\N	\N
10031	994	30	3	\N	\N	\N	\N
10032	994	31	2	\N	\N	\N	\N
10033	994	32	2	\N	\N	\N	\N
10034	994	33	2	\N	\N	\N	\N
10035	994	34	3	\N	\N	\N	\N
10036	994	35	3	\N	\N	\N	\N
10037	994	36	3	\N	\N	\N	\N
10038	994	37	1	\N	\N	\N	\N
10039	994	38	4	\N	\N	\N	\N
10040	994	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.955	MODELO
10041	994	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.694	MODELO
10042	993	18	3	\N	\N	\N	\N
10043	993	19	1	\N	\N	\N	\N
10044	993	20	4	\N	\N	\N	\N
10045	993	21	2	\N	\N	\N	\N
10046	993	22	3	\N	\N	\N	\N
10047	993	23	4	\N	\N	\N	\N
10048	993	24	4	\N	\N	\N	\N
10049	993	27	4	\N	\N	\N	\N
10050	993	28	2	\N	\N	\N	\N
10051	993	29	4	\N	\N	\N	\N
10052	993	30	3	\N	\N	\N	\N
10053	993	31	3	\N	\N	\N	\N
10054	993	32	3	\N	\N	\N	\N
10055	993	33	3	\N	\N	\N	\N
10056	993	34	3	\N	\N	\N	\N
10057	993	35	3	\N	\N	\N	\N
10058	993	36	4	\N	\N	\N	\N
10059	993	37	3	\N	\N	\N	\N
10060	993	38	4	\N	\N	\N	\N
10061	993	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.965	MODELO
10062	993	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.589	MODELO
10063	992	18	3	\N	\N	\N	\N
10064	992	19	3	\N	\N	\N	\N
10065	992	20	3	\N	\N	\N	\N
10066	992	21	3	\N	\N	\N	\N
10067	992	22	3	\N	\N	\N	\N
10068	992	23	4	\N	\N	\N	\N
10069	992	24	3	\N	\N	\N	\N
10070	992	27	3	\N	\N	\N	\N
10071	992	28	2	\N	\N	\N	\N
10072	992	29	3	\N	\N	\N	\N
10073	992	30	4	\N	\N	\N	\N
10074	992	31	4	\N	\N	\N	\N
10075	992	32	3	\N	\N	\N	\N
10076	992	33	2	\N	\N	\N	\N
10077	992	34	4	\N	\N	\N	\N
10078	992	35	4	\N	\N	\N	\N
10079	992	36	2	\N	\N	\N	\N
10080	992	37	4	\N	\N	\N	\N
10081	992	38	3	\N	\N	\N	\N
10082	992	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.74	MODELO
10083	992	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.91	MODELO
10084	991	18	4	\N	\N	\N	\N
10085	991	19	4	\N	\N	\N	\N
10086	991	20	4	\N	\N	\N	\N
10087	991	21	3	\N	\N	\N	\N
10088	991	22	4	\N	\N	\N	\N
10089	991	23	1	\N	\N	\N	\N
10090	991	24	4	\N	\N	\N	\N
10091	991	27	4	\N	\N	\N	\N
10092	991	28	3	\N	\N	\N	\N
10093	991	29	3	\N	\N	\N	\N
10094	991	30	3	\N	\N	\N	\N
10095	991	31	4	\N	\N	\N	\N
10096	991	32	3	\N	\N	\N	\N
10097	991	33	4	\N	\N	\N	\N
10098	991	34	3	\N	\N	\N	\N
10099	991	35	3	\N	\N	\N	\N
10100	991	36	3	\N	\N	\N	\N
10101	991	37	3	\N	\N	\N	\N
10102	991	38	3	\N	\N	\N	\N
10103	991	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.702	MODELO
10104	991	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.928	MODELO
10105	990	18	3	\N	\N	\N	\N
10106	990	19	1	\N	\N	\N	\N
10107	990	20	4	\N	\N	\N	\N
10108	990	21	2	\N	\N	\N	\N
10109	990	22	3	\N	\N	\N	\N
10110	990	23	4	\N	\N	\N	\N
10111	990	24	3	\N	\N	\N	\N
10112	990	27	3	\N	\N	\N	\N
10113	990	28	3	\N	\N	\N	\N
10114	990	29	4	\N	\N	\N	\N
10115	990	30	2	\N	\N	\N	\N
10116	990	31	3	\N	\N	\N	\N
10117	990	32	4	\N	\N	\N	\N
10118	990	33	3	\N	\N	\N	\N
10119	990	34	3	\N	\N	\N	\N
10120	990	35	3	\N	\N	\N	\N
10121	990	36	4	\N	\N	\N	\N
10122	990	37	4	\N	\N	\N	\N
10123	990	38	2	\N	\N	\N	\N
10124	990	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.869	MODELO
10125	990	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.737	MODELO
10126	989	18	4	\N	\N	\N	\N
10127	989	19	3	\N	\N	\N	\N
10128	989	20	3	\N	\N	\N	\N
10129	989	21	2	\N	\N	\N	\N
10130	989	22	2	\N	\N	\N	\N
10131	989	23	1	\N	\N	\N	\N
10132	989	24	3	\N	\N	\N	\N
10133	989	27	4	\N	\N	\N	\N
10134	989	28	3	\N	\N	\N	\N
10135	989	29	4	\N	\N	\N	\N
10136	989	30	1	\N	\N	\N	\N
10137	989	31	3	\N	\N	\N	\N
10138	989	32	4	\N	\N	\N	\N
10139	989	33	3	\N	\N	\N	\N
10140	989	34	3	\N	\N	\N	\N
10141	989	35	4	\N	\N	\N	\N
10142	989	36	3	\N	\N	\N	\N
10143	989	37	3	\N	\N	\N	\N
10144	989	38	4	\N	\N	\N	\N
10145	989	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.819	MODELO
10264	983	32	2	\N	\N	\N	\N
10146	989	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.857	MODELO
10147	988	18	4	\N	\N	\N	\N
10148	988	19	2	\N	\N	\N	\N
10149	988	20	3	\N	\N	\N	\N
10150	988	21	3	\N	\N	\N	\N
10151	988	22	4	\N	\N	\N	\N
10152	988	23	4	\N	\N	\N	\N
10153	988	24	3	\N	\N	\N	\N
10154	988	27	2	\N	\N	\N	\N
10155	988	28	2	\N	\N	\N	\N
10156	988	29	3	\N	\N	\N	\N
10157	988	30	3	\N	\N	\N	\N
10158	988	31	2	\N	\N	\N	\N
10159	988	32	3	\N	\N	\N	\N
10160	988	33	4	\N	\N	\N	\N
10161	988	34	3	\N	\N	\N	\N
10162	988	35	3	\N	\N	\N	\N
10163	988	36	4	\N	\N	\N	\N
10164	988	37	3	\N	\N	\N	\N
10165	988	38	4	\N	\N	\N	\N
10166	988	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.932	MODELO
10167	988	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.864	MODELO
10168	987	18	3	\N	\N	\N	\N
10169	987	19	3	\N	\N	\N	\N
10170	987	20	3	\N	\N	\N	\N
10171	987	21	4	\N	\N	\N	\N
10172	987	22	4	\N	\N	\N	\N
10173	987	23	3	\N	\N	\N	\N
10174	987	24	3	\N	\N	\N	\N
10175	987	27	3	\N	\N	\N	\N
10176	987	28	3	\N	\N	\N	\N
10177	987	29	4	\N	\N	\N	\N
10178	987	30	4	\N	\N	\N	\N
10179	987	31	3	\N	\N	\N	\N
10180	987	32	3	\N	\N	\N	\N
10181	987	33	3	\N	\N	\N	\N
10182	987	34	3	\N	\N	\N	\N
10183	987	35	4	\N	\N	\N	\N
10184	987	36	4	\N	\N	\N	\N
10185	987	37	2	\N	\N	\N	\N
10186	987	38	3	\N	\N	\N	\N
10187	987	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.912	MODELO
10188	987	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.862	MODELO
10189	986	18	3	\N	\N	\N	\N
10190	986	19	3	\N	\N	\N	\N
10191	986	20	3	\N	\N	\N	\N
10192	986	21	2	\N	\N	\N	\N
10193	986	22	4	\N	\N	\N	\N
10194	986	23	4	\N	\N	\N	\N
10195	986	24	3	\N	\N	\N	\N
10196	986	27	4	\N	\N	\N	\N
10197	986	28	1	\N	\N	\N	\N
10198	986	29	4	\N	\N	\N	\N
10199	986	30	4	\N	\N	\N	\N
10200	986	31	4	\N	\N	\N	\N
10201	986	32	4	\N	\N	\N	\N
10202	986	33	4	\N	\N	\N	\N
10203	986	34	3	\N	\N	\N	\N
10204	986	35	3	\N	\N	\N	\N
10205	986	36	4	\N	\N	\N	\N
10206	986	37	4	\N	\N	\N	\N
10207	986	38	3	\N	\N	\N	\N
10208	986	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.73	MODELO
10209	986	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.778	MODELO
10210	985	18	3	\N	\N	\N	\N
10211	985	19	3	\N	\N	\N	\N
10212	985	20	4	\N	\N	\N	\N
10213	985	21	3	\N	\N	\N	\N
10214	985	22	3	\N	\N	\N	\N
10215	985	23	2	\N	\N	\N	\N
10216	985	24	4	\N	\N	\N	\N
10217	985	27	4	\N	\N	\N	\N
10218	985	28	3	\N	\N	\N	\N
10219	985	29	3	\N	\N	\N	\N
10220	985	30	4	\N	\N	\N	\N
10221	985	31	3	\N	\N	\N	\N
10222	985	32	4	\N	\N	\N	\N
10223	985	33	4	\N	\N	\N	\N
10224	985	34	3	\N	\N	\N	\N
10225	985	35	3	\N	\N	\N	\N
10226	985	36	2	\N	\N	\N	\N
10227	985	37	4	\N	\N	\N	\N
10228	985	38	3	\N	\N	\N	\N
10229	985	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.823	MODELO
10230	985	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.735	MODELO
10231	984	18	3	\N	\N	\N	\N
10232	984	19	4	\N	\N	\N	\N
10233	984	20	4	\N	\N	\N	\N
10234	984	21	3	\N	\N	\N	\N
10235	984	22	3	\N	\N	\N	\N
10236	984	23	3	\N	\N	\N	\N
10237	984	24	3	\N	\N	\N	\N
10238	984	27	3	\N	\N	\N	\N
10239	984	28	4	\N	\N	\N	\N
10240	984	29	3	\N	\N	\N	\N
10241	984	30	4	\N	\N	\N	\N
10242	984	31	4	\N	\N	\N	\N
10243	984	32	3	\N	\N	\N	\N
10244	984	33	2	\N	\N	\N	\N
10245	984	34	4	\N	\N	\N	\N
10246	984	35	2	\N	\N	\N	\N
10247	984	36	3	\N	\N	\N	\N
10248	984	37	3	\N	\N	\N	\N
10249	984	38	4	\N	\N	\N	\N
10250	984	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.778	MODELO
10251	984	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.858	MODELO
10252	983	18	4	\N	\N	\N	\N
10253	983	19	3	\N	\N	\N	\N
10254	983	20	3	\N	\N	\N	\N
10255	983	21	2	\N	\N	\N	\N
10256	983	22	4	\N	\N	\N	\N
10257	983	23	3	\N	\N	\N	\N
10258	983	24	3	\N	\N	\N	\N
10259	983	27	3	\N	\N	\N	\N
10260	983	28	1	\N	\N	\N	\N
10261	983	29	4	\N	\N	\N	\N
10262	983	30	2	\N	\N	\N	\N
10263	983	31	4	\N	\N	\N	\N
10265	983	33	3	\N	\N	\N	\N
10266	983	34	2	\N	\N	\N	\N
10267	983	35	4	\N	\N	\N	\N
10268	983	36	3	\N	\N	\N	\N
10269	983	37	4	\N	\N	\N	\N
10270	983	38	3	\N	\N	\N	\N
10271	983	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.935	MODELO
10272	983	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.915	MODELO
10273	982	18	2	\N	\N	\N	\N
10274	982	19	3	\N	\N	\N	\N
10275	982	20	4	\N	\N	\N	\N
10276	982	21	3	\N	\N	\N	\N
10277	982	22	4	\N	\N	\N	\N
10278	982	23	3	\N	\N	\N	\N
10279	982	24	2	\N	\N	\N	\N
10280	982	27	3	\N	\N	\N	\N
10281	982	28	4	\N	\N	\N	\N
10282	982	29	2	\N	\N	\N	\N
10283	982	30	1	\N	\N	\N	\N
10284	982	31	4	\N	\N	\N	\N
10285	982	32	4	\N	\N	\N	\N
10286	982	33	3	\N	\N	\N	\N
10287	982	34	4	\N	\N	\N	\N
10288	982	35	4	\N	\N	\N	\N
10289	982	36	3	\N	\N	\N	\N
10290	982	37	1	\N	\N	\N	\N
10291	982	38	1	\N	\N	\N	\N
10292	982	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.736	MODELO
10293	982	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.724	MODELO
10294	981	18	3	\N	\N	\N	\N
10295	981	19	4	\N	\N	\N	\N
10296	981	20	2	\N	\N	\N	\N
10297	981	21	3	\N	\N	\N	\N
10298	981	22	4	\N	\N	\N	\N
10299	981	23	3	\N	\N	\N	\N
10300	981	24	3	\N	\N	\N	\N
10301	981	27	3	\N	\N	\N	\N
10302	981	28	1	\N	\N	\N	\N
10303	981	29	4	\N	\N	\N	\N
10304	981	30	3	\N	\N	\N	\N
10305	981	31	4	\N	\N	\N	\N
10306	981	32	1	\N	\N	\N	\N
10307	981	33	4	\N	\N	\N	\N
10308	981	34	3	\N	\N	\N	\N
10309	981	35	3	\N	\N	\N	\N
10310	981	36	4	\N	\N	\N	\N
10311	981	37	3	\N	\N	\N	\N
10312	981	38	4	\N	\N	\N	\N
10313	981	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.875	MODELO
10314	981	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.707	MODELO
10315	980	18	3	\N	\N	\N	\N
10316	980	19	4	\N	\N	\N	\N
10317	980	20	3	\N	\N	\N	\N
10318	980	21	4	\N	\N	\N	\N
10319	980	22	4	\N	\N	\N	\N
10320	980	23	4	\N	\N	\N	\N
10321	980	24	2	\N	\N	\N	\N
10322	980	27	4	\N	\N	\N	\N
10323	980	28	2	\N	\N	\N	\N
10324	980	29	3	\N	\N	\N	\N
10325	980	30	4	\N	\N	\N	\N
10326	980	31	3	\N	\N	\N	\N
10327	980	32	3	\N	\N	\N	\N
10328	980	33	2	\N	\N	\N	\N
10329	980	34	3	\N	\N	\N	\N
10330	980	35	4	\N	\N	\N	\N
10331	980	36	2	\N	\N	\N	\N
10332	980	37	3	\N	\N	\N	\N
10333	980	38	3	\N	\N	\N	\N
10334	980	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.743	MODELO
10335	980	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.946	MODELO
10336	979	18	2	\N	\N	\N	\N
10337	979	19	3	\N	\N	\N	\N
10338	979	20	4	\N	\N	\N	\N
10339	979	21	4	\N	\N	\N	\N
10340	979	22	4	\N	\N	\N	\N
10341	979	23	4	\N	\N	\N	\N
10342	979	24	3	\N	\N	\N	\N
10343	979	27	4	\N	\N	\N	\N
10344	979	28	4	\N	\N	\N	\N
10345	979	29	3	\N	\N	\N	\N
10346	979	30	4	\N	\N	\N	\N
10347	979	31	3	\N	\N	\N	\N
10348	979	32	4	\N	\N	\N	\N
10349	979	33	3	\N	\N	\N	\N
10350	979	34	4	\N	\N	\N	\N
10351	979	35	3	\N	\N	\N	\N
10352	979	36	3	\N	\N	\N	\N
10353	979	37	4	\N	\N	\N	\N
10354	979	38	3	\N	\N	\N	\N
10355	979	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.939	MODELO
10356	979	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.533	MODELO
10357	978	18	3	\N	\N	\N	\N
10358	978	19	2	\N	\N	\N	\N
10359	978	20	1	\N	\N	\N	\N
10360	978	21	3	\N	\N	\N	\N
10361	978	22	2	\N	\N	\N	\N
10362	978	23	3	\N	\N	\N	\N
10363	978	24	3	\N	\N	\N	\N
10364	978	27	3	\N	\N	\N	\N
10365	978	28	2	\N	\N	\N	\N
10366	978	29	3	\N	\N	\N	\N
10367	978	30	3	\N	\N	\N	\N
10368	978	31	3	\N	\N	\N	\N
10369	978	32	3	\N	\N	\N	\N
10370	978	33	4	\N	\N	\N	\N
10371	978	34	3	\N	\N	\N	\N
10372	978	35	4	\N	\N	\N	\N
10373	978	36	3	\N	\N	\N	\N
10374	978	37	3	\N	\N	\N	\N
10375	978	38	3	\N	\N	\N	\N
10376	978	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.736	MODELO
10377	978	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.817	MODELO
10378	977	18	2	\N	\N	\N	\N
10379	977	19	2	\N	\N	\N	\N
10380	977	20	4	\N	\N	\N	\N
10381	977	21	4	\N	\N	\N	\N
10382	977	22	3	\N	\N	\N	\N
10383	977	23	4	\N	\N	\N	\N
10384	977	24	3	\N	\N	\N	\N
10385	977	27	4	\N	\N	\N	\N
10386	977	28	4	\N	\N	\N	\N
10387	977	29	3	\N	\N	\N	\N
10388	977	30	2	\N	\N	\N	\N
10389	977	31	3	\N	\N	\N	\N
10390	977	32	3	\N	\N	\N	\N
10391	977	33	3	\N	\N	\N	\N
10392	977	34	4	\N	\N	\N	\N
10393	977	35	3	\N	\N	\N	\N
10394	977	36	2	\N	\N	\N	\N
10395	977	37	2	\N	\N	\N	\N
10396	977	38	2	\N	\N	\N	\N
10397	977	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.854	MODELO
10398	977	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.779	MODELO
10399	976	18	3	\N	\N	\N	\N
10400	976	19	3	\N	\N	\N	\N
10401	976	20	4	\N	\N	\N	\N
10402	976	21	4	\N	\N	\N	\N
10403	976	22	3	\N	\N	\N	\N
10404	976	23	3	\N	\N	\N	\N
10405	976	24	4	\N	\N	\N	\N
10406	976	27	4	\N	\N	\N	\N
10407	976	28	4	\N	\N	\N	\N
10408	976	29	3	\N	\N	\N	\N
10409	976	30	3	\N	\N	\N	\N
10410	976	31	3	\N	\N	\N	\N
10411	976	32	3	\N	\N	\N	\N
10412	976	33	1	\N	\N	\N	\N
10413	976	34	3	\N	\N	\N	\N
10414	976	35	3	\N	\N	\N	\N
10415	976	36	3	\N	\N	\N	\N
10416	976	37	4	\N	\N	\N	\N
10417	976	38	2	\N	\N	\N	\N
10418	976	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.886	MODELO
10419	976	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.686	MODELO
10420	975	18	3	\N	\N	\N	\N
10421	975	19	4	\N	\N	\N	\N
10422	975	20	3	\N	\N	\N	\N
10423	975	21	4	\N	\N	\N	\N
10424	975	22	4	\N	\N	\N	\N
10425	975	23	4	\N	\N	\N	\N
10426	975	24	4	\N	\N	\N	\N
10427	975	27	2	\N	\N	\N	\N
10428	975	28	3	\N	\N	\N	\N
10429	975	29	1	\N	\N	\N	\N
10430	975	30	4	\N	\N	\N	\N
10431	975	31	4	\N	\N	\N	\N
10432	975	32	2	\N	\N	\N	\N
10433	975	33	3	\N	\N	\N	\N
10434	975	34	3	\N	\N	\N	\N
10435	975	35	1	\N	\N	\N	\N
10436	975	36	3	\N	\N	\N	\N
10437	975	37	4	\N	\N	\N	\N
10438	975	38	3	\N	\N	\N	\N
10439	975	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.734	MODELO
10440	975	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.575	MODELO
10441	974	18	3	\N	\N	\N	\N
10442	974	19	4	\N	\N	\N	\N
10443	974	20	3	\N	\N	\N	\N
10444	974	21	3	\N	\N	\N	\N
10445	974	22	3	\N	\N	\N	\N
10446	974	23	3	\N	\N	\N	\N
10447	974	24	4	\N	\N	\N	\N
10448	974	27	4	\N	\N	\N	\N
10449	974	28	4	\N	\N	\N	\N
10450	974	29	4	\N	\N	\N	\N
10451	974	30	3	\N	\N	\N	\N
10452	974	31	4	\N	\N	\N	\N
10453	974	32	4	\N	\N	\N	\N
10454	974	33	2	\N	\N	\N	\N
10455	974	34	4	\N	\N	\N	\N
10456	974	35	4	\N	\N	\N	\N
10457	974	36	4	\N	\N	\N	\N
10458	974	37	3	\N	\N	\N	\N
10459	974	38	3	\N	\N	\N	\N
10460	974	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.724	MODELO
10461	974	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.768	MODELO
10462	973	18	2	\N	\N	\N	\N
10463	973	19	4	\N	\N	\N	\N
10464	973	20	2	\N	\N	\N	\N
10465	973	21	3	\N	\N	\N	\N
10466	973	22	3	\N	\N	\N	\N
10467	973	23	2	\N	\N	\N	\N
10468	973	24	3	\N	\N	\N	\N
10469	973	27	4	\N	\N	\N	\N
10470	973	28	1	\N	\N	\N	\N
10471	973	29	4	\N	\N	\N	\N
10472	973	30	4	\N	\N	\N	\N
10473	973	31	3	\N	\N	\N	\N
10474	973	32	3	\N	\N	\N	\N
10475	973	33	3	\N	\N	\N	\N
10476	973	34	2	\N	\N	\N	\N
10477	973	35	4	\N	\N	\N	\N
10478	973	36	1	\N	\N	\N	\N
10479	973	37	4	\N	\N	\N	\N
10480	973	38	3	\N	\N	\N	\N
10481	973	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.833	MODELO
10482	973	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.745	MODELO
10483	972	18	1	\N	\N	\N	\N
10484	972	19	3	\N	\N	\N	\N
10485	972	20	4	\N	\N	\N	\N
10486	972	21	3	\N	\N	\N	\N
10487	972	22	1	\N	\N	\N	\N
10488	972	23	4	\N	\N	\N	\N
10489	972	24	3	\N	\N	\N	\N
10490	972	27	4	\N	\N	\N	\N
10491	972	28	4	\N	\N	\N	\N
10492	972	29	4	\N	\N	\N	\N
10493	972	30	3	\N	\N	\N	\N
10494	972	31	4	\N	\N	\N	\N
10495	972	32	4	\N	\N	\N	\N
10496	972	33	4	\N	\N	\N	\N
10497	972	34	4	\N	\N	\N	\N
10498	972	35	4	\N	\N	\N	\N
10499	972	36	2	\N	\N	\N	\N
10500	972	37	4	\N	\N	\N	\N
10501	972	38	1	\N	\N	\N	\N
10502	972	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.924	MODELO
10503	972	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.851	MODELO
10504	971	18	2	\N	\N	\N	\N
10505	971	19	3	\N	\N	\N	\N
10506	971	20	3	\N	\N	\N	\N
10507	971	21	3	\N	\N	\N	\N
10508	971	22	3	\N	\N	\N	\N
10509	971	23	4	\N	\N	\N	\N
10510	971	24	3	\N	\N	\N	\N
10511	971	27	4	\N	\N	\N	\N
10512	971	28	2	\N	\N	\N	\N
10513	971	29	4	\N	\N	\N	\N
10514	971	30	4	\N	\N	\N	\N
10515	971	31	3	\N	\N	\N	\N
10516	971	32	4	\N	\N	\N	\N
10517	971	33	3	\N	\N	\N	\N
10518	971	34	4	\N	\N	\N	\N
10519	971	35	3	\N	\N	\N	\N
10520	971	36	3	\N	\N	\N	\N
10521	971	37	3	\N	\N	\N	\N
10522	971	38	2	\N	\N	\N	\N
10523	971	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.54	MODELO
10524	971	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.834	MODELO
10525	970	18	4	\N	\N	\N	\N
10526	970	19	4	\N	\N	\N	\N
10527	970	20	4	\N	\N	\N	\N
10528	970	21	2	\N	\N	\N	\N
10529	970	22	4	\N	\N	\N	\N
10530	970	23	4	\N	\N	\N	\N
10531	970	24	3	\N	\N	\N	\N
10532	970	27	4	\N	\N	\N	\N
10533	970	28	4	\N	\N	\N	\N
10534	970	29	3	\N	\N	\N	\N
10535	970	30	4	\N	\N	\N	\N
10536	970	31	3	\N	\N	\N	\N
10537	970	32	3	\N	\N	\N	\N
10538	970	33	4	\N	\N	\N	\N
10539	970	34	4	\N	\N	\N	\N
10540	970	35	4	\N	\N	\N	\N
10541	970	36	3	\N	\N	\N	\N
10542	970	37	4	\N	\N	\N	\N
10543	970	38	3	\N	\N	\N	\N
10544	970	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.629	MODELO
10545	970	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.648	MODELO
10546	969	18	4	\N	\N	\N	\N
10547	969	19	4	\N	\N	\N	\N
10548	969	20	3	\N	\N	\N	\N
10549	969	21	4	\N	\N	\N	\N
10550	969	22	4	\N	\N	\N	\N
10551	969	23	3	\N	\N	\N	\N
10552	969	24	4	\N	\N	\N	\N
10553	969	27	4	\N	\N	\N	\N
10554	969	28	3	\N	\N	\N	\N
10555	969	29	3	\N	\N	\N	\N
10556	969	30	1	\N	\N	\N	\N
10557	969	31	4	\N	\N	\N	\N
10558	969	32	2	\N	\N	\N	\N
10559	969	33	4	\N	\N	\N	\N
10560	969	34	3	\N	\N	\N	\N
10561	969	35	2	\N	\N	\N	\N
10562	969	36	4	\N	\N	\N	\N
10563	969	37	3	\N	\N	\N	\N
10564	969	38	3	\N	\N	\N	\N
10565	969	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.664	MODELO
10566	969	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.548	MODELO
10567	968	18	4	\N	\N	\N	\N
10568	968	19	3	\N	\N	\N	\N
10569	968	20	2	\N	\N	\N	\N
10570	968	21	3	\N	\N	\N	\N
10571	968	22	3	\N	\N	\N	\N
10572	968	23	4	\N	\N	\N	\N
10573	968	24	4	\N	\N	\N	\N
10574	968	27	3	\N	\N	\N	\N
10575	968	28	4	\N	\N	\N	\N
10576	968	29	3	\N	\N	\N	\N
10577	968	30	3	\N	\N	\N	\N
10578	968	31	4	\N	\N	\N	\N
10579	968	32	3	\N	\N	\N	\N
10580	968	33	3	\N	\N	\N	\N
10581	968	34	3	\N	\N	\N	\N
10582	968	35	4	\N	\N	\N	\N
10583	968	36	2	\N	\N	\N	\N
10584	968	37	4	\N	\N	\N	\N
10585	968	38	3	\N	\N	\N	\N
10586	968	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.865	MODELO
10587	968	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.914	MODELO
10588	967	18	4	\N	\N	\N	\N
10589	967	19	2	\N	\N	\N	\N
10590	967	20	3	\N	\N	\N	\N
10591	967	21	3	\N	\N	\N	\N
10592	967	22	3	\N	\N	\N	\N
10593	967	23	4	\N	\N	\N	\N
10594	967	24	2	\N	\N	\N	\N
10595	967	27	3	\N	\N	\N	\N
10596	967	28	3	\N	\N	\N	\N
10597	967	29	4	\N	\N	\N	\N
10598	967	30	4	\N	\N	\N	\N
10599	967	31	4	\N	\N	\N	\N
10600	967	32	3	\N	\N	\N	\N
10601	967	33	2	\N	\N	\N	\N
10602	967	34	4	\N	\N	\N	\N
10603	967	35	3	\N	\N	\N	\N
10604	967	36	4	\N	\N	\N	\N
10605	967	37	3	\N	\N	\N	\N
10606	967	38	3	\N	\N	\N	\N
10607	967	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.86	MODELO
10608	967	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.77	MODELO
10609	531	18	2	\N	\N	\N	\N
10610	531	19	4	\N	\N	\N	\N
10611	531	20	1	\N	\N	\N	\N
10612	531	21	2	\N	\N	\N	\N
10613	531	22	2	\N	\N	\N	\N
10614	531	23	1	\N	\N	\N	\N
10615	531	24	2	\N	\N	\N	\N
10616	531	27	2	\N	\N	\N	\N
10617	531	28	3	\N	\N	\N	\N
10618	531	29	1	\N	\N	\N	\N
10619	531	30	3	\N	\N	\N	\N
10620	531	31	1	\N	\N	\N	\N
10621	531	32	2	\N	\N	\N	\N
10622	531	33	1	\N	\N	\N	\N
10623	531	34	2	\N	\N	\N	\N
10624	531	35	1	\N	\N	\N	\N
10625	531	36	4	\N	\N	\N	\N
10626	531	37	1	\N	\N	\N	\N
10627	531	38	3	\N	\N	\N	\N
10628	531	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.804	MODELO
10629	531	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.812	MODELO
10630	530	18	4	\N	\N	\N	\N
10631	530	19	2	\N	\N	\N	\N
10632	530	20	1	\N	\N	\N	\N
10633	530	21	2	\N	\N	\N	\N
10634	530	22	2	\N	\N	\N	\N
10635	530	23	3	\N	\N	\N	\N
10636	530	24	1	\N	\N	\N	\N
10637	530	27	3	\N	\N	\N	\N
10638	530	28	1	\N	\N	\N	\N
10639	530	29	4	\N	\N	\N	\N
10640	530	30	2	\N	\N	\N	\N
10641	530	31	1	\N	\N	\N	\N
10642	530	32	4	\N	\N	\N	\N
10643	530	33	2	\N	\N	\N	\N
10644	530	34	1	\N	\N	\N	\N
10645	530	35	2	\N	\N	\N	\N
10646	530	36	1	\N	\N	\N	\N
10647	530	37	2	\N	\N	\N	\N
10648	530	38	1	\N	\N	\N	\N
10649	530	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.593	MODELO
10650	530	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.848	MODELO
10651	529	18	1	\N	\N	\N	\N
10652	529	19	1	\N	\N	\N	\N
10653	529	20	3	\N	\N	\N	\N
10654	529	21	2	\N	\N	\N	\N
10655	529	22	2	\N	\N	\N	\N
10656	529	23	3	\N	\N	\N	\N
10657	529	24	1	\N	\N	\N	\N
10658	529	27	1	\N	\N	\N	\N
10659	529	28	1	\N	\N	\N	\N
10660	529	29	2	\N	\N	\N	\N
10661	529	30	4	\N	\N	\N	\N
10662	529	31	1	\N	\N	\N	\N
10663	529	32	1	\N	\N	\N	\N
10664	529	33	1	\N	\N	\N	\N
10665	529	34	3	\N	\N	\N	\N
10666	529	35	1	\N	\N	\N	\N
10667	529	36	2	\N	\N	\N	\N
10668	529	37	2	\N	\N	\N	\N
10669	529	38	1	\N	\N	\N	\N
10670	529	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.79	MODELO
10671	529	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.774	MODELO
10672	528	18	2	\N	\N	\N	\N
10673	528	19	1	\N	\N	\N	\N
10674	528	20	1	\N	\N	\N	\N
10675	528	21	1	\N	\N	\N	\N
10676	528	22	4	\N	\N	\N	\N
10677	528	23	1	\N	\N	\N	\N
10678	528	24	2	\N	\N	\N	\N
10679	528	27	1	\N	\N	\N	\N
10680	528	28	2	\N	\N	\N	\N
10681	528	29	1	\N	\N	\N	\N
10682	528	30	2	\N	\N	\N	\N
10683	528	31	2	\N	\N	\N	\N
10684	528	32	4	\N	\N	\N	\N
10685	528	33	3	\N	\N	\N	\N
10686	528	34	2	\N	\N	\N	\N
10687	528	35	1	\N	\N	\N	\N
10688	528	36	1	\N	\N	\N	\N
10689	528	37	2	\N	\N	\N	\N
10690	528	38	1	\N	\N	\N	\N
10691	528	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.503	MODELO
10692	528	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.934	MODELO
10693	527	18	1	\N	\N	\N	\N
10694	527	19	2	\N	\N	\N	\N
10695	527	20	1	\N	\N	\N	\N
10696	527	21	1	\N	\N	\N	\N
10697	527	22	2	\N	\N	\N	\N
10698	527	23	3	\N	\N	\N	\N
10699	527	24	1	\N	\N	\N	\N
10700	527	27	2	\N	\N	\N	\N
10701	527	28	2	\N	\N	\N	\N
10702	527	29	1	\N	\N	\N	\N
10703	527	30	1	\N	\N	\N	\N
10704	527	31	2	\N	\N	\N	\N
10705	527	32	1	\N	\N	\N	\N
10706	527	33	4	\N	\N	\N	\N
10707	527	34	2	\N	\N	\N	\N
10708	527	35	1	\N	\N	\N	\N
10709	527	36	2	\N	\N	\N	\N
10710	527	37	2	\N	\N	\N	\N
10711	527	38	1	\N	\N	\N	\N
10712	527	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.758	MODELO
10713	527	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.88	MODELO
10714	526	18	1	\N	\N	\N	\N
10715	526	19	1	\N	\N	\N	\N
10716	526	20	1	\N	\N	\N	\N
10717	526	21	2	\N	\N	\N	\N
10718	526	22	2	\N	\N	\N	\N
10719	526	23	3	\N	\N	\N	\N
10720	526	24	1	\N	\N	\N	\N
10721	526	27	1	\N	\N	\N	\N
10722	526	28	1	\N	\N	\N	\N
10723	526	29	2	\N	\N	\N	\N
10724	526	30	2	\N	\N	\N	\N
10725	526	31	1	\N	\N	\N	\N
10726	526	32	2	\N	\N	\N	\N
10727	526	33	1	\N	\N	\N	\N
10728	526	34	2	\N	\N	\N	\N
10729	526	35	3	\N	\N	\N	\N
10730	526	36	1	\N	\N	\N	\N
10731	526	37	1	\N	\N	\N	\N
10732	526	38	2	\N	\N	\N	\N
10733	526	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.974	MODELO
10734	526	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.82	MODELO
10735	525	18	1	\N	\N	\N	\N
10736	525	19	1	\N	\N	\N	\N
10737	525	20	1	\N	\N	\N	\N
10738	525	21	2	\N	\N	\N	\N
10739	525	22	2	\N	\N	\N	\N
10740	525	23	2	\N	\N	\N	\N
10741	525	24	2	\N	\N	\N	\N
10742	525	27	1	\N	\N	\N	\N
10743	525	28	1	\N	\N	\N	\N
10744	525	29	3	\N	\N	\N	\N
10745	525	30	3	\N	\N	\N	\N
10746	525	31	4	\N	\N	\N	\N
10747	525	32	4	\N	\N	\N	\N
10748	525	33	2	\N	\N	\N	\N
10749	525	34	1	\N	\N	\N	\N
10750	525	35	3	\N	\N	\N	\N
10751	525	36	1	\N	\N	\N	\N
10752	525	37	2	\N	\N	\N	\N
10753	525	38	2	\N	\N	\N	\N
10754	525	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.581	MODELO
10755	525	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.83	MODELO
10756	524	18	2	\N	\N	\N	\N
10757	524	19	3	\N	\N	\N	\N
10758	524	20	3	\N	\N	\N	\N
10759	524	21	2	\N	\N	\N	\N
10760	524	22	4	\N	\N	\N	\N
10761	524	23	1	\N	\N	\N	\N
10762	524	24	1	\N	\N	\N	\N
10763	524	27	1	\N	\N	\N	\N
10764	524	28	1	\N	\N	\N	\N
10765	524	29	2	\N	\N	\N	\N
10766	524	30	1	\N	\N	\N	\N
10767	524	31	2	\N	\N	\N	\N
10768	524	32	2	\N	\N	\N	\N
10769	524	33	1	\N	\N	\N	\N
10770	524	34	2	\N	\N	\N	\N
10771	524	35	2	\N	\N	\N	\N
10772	524	36	2	\N	\N	\N	\N
10773	524	37	1	\N	\N	\N	\N
10774	524	38	1	\N	\N	\N	\N
10775	524	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.65	MODELO
10776	524	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.945	MODELO
10777	523	18	1	\N	\N	\N	\N
10778	523	19	1	\N	\N	\N	\N
10779	523	20	3	\N	\N	\N	\N
10780	523	21	2	\N	\N	\N	\N
10781	523	22	2	\N	\N	\N	\N
10782	523	23	1	\N	\N	\N	\N
10783	523	24	2	\N	\N	\N	\N
10784	523	27	2	\N	\N	\N	\N
10785	523	28	2	\N	\N	\N	\N
10786	523	29	3	\N	\N	\N	\N
10787	523	30	1	\N	\N	\N	\N
10788	523	31	2	\N	\N	\N	\N
10789	523	32	2	\N	\N	\N	\N
10790	523	33	2	\N	\N	\N	\N
10791	523	34	1	\N	\N	\N	\N
10792	523	35	1	\N	\N	\N	\N
10793	523	36	2	\N	\N	\N	\N
10794	523	37	3	\N	\N	\N	\N
10795	523	38	1	\N	\N	\N	\N
10796	523	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.817	MODELO
10797	523	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.525	MODELO
10798	522	18	1	\N	\N	\N	\N
10799	522	19	2	\N	\N	\N	\N
10800	522	20	1	\N	\N	\N	\N
10801	522	21	2	\N	\N	\N	\N
10802	522	22	1	\N	\N	\N	\N
10803	522	23	2	\N	\N	\N	\N
10804	522	24	1	\N	\N	\N	\N
10805	522	27	1	\N	\N	\N	\N
10806	522	28	2	\N	\N	\N	\N
10807	522	29	1	\N	\N	\N	\N
10808	522	30	1	\N	\N	\N	\N
10809	522	31	3	\N	\N	\N	\N
10810	522	32	1	\N	\N	\N	\N
10811	522	33	2	\N	\N	\N	\N
10812	522	34	1	\N	\N	\N	\N
10813	522	35	1	\N	\N	\N	\N
10814	522	36	4	\N	\N	\N	\N
10815	522	37	1	\N	\N	\N	\N
10816	522	38	1	\N	\N	\N	\N
10817	522	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.858	MODELO
10818	522	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.742	MODELO
10819	521	18	3	\N	\N	\N	\N
10820	521	19	2	\N	\N	\N	\N
10821	521	20	2	\N	\N	\N	\N
10822	521	21	2	\N	\N	\N	\N
10823	521	22	1	\N	\N	\N	\N
10824	521	23	1	\N	\N	\N	\N
10825	521	24	2	\N	\N	\N	\N
10826	521	27	2	\N	\N	\N	\N
10827	521	28	2	\N	\N	\N	\N
10828	521	29	1	\N	\N	\N	\N
10829	521	30	2	\N	\N	\N	\N
10830	521	31	1	\N	\N	\N	\N
10831	521	32	2	\N	\N	\N	\N
10832	521	33	2	\N	\N	\N	\N
10833	521	34	1	\N	\N	\N	\N
10834	521	35	1	\N	\N	\N	\N
10835	521	36	1	\N	\N	\N	\N
10836	521	37	2	\N	\N	\N	\N
10837	521	38	1	\N	\N	\N	\N
10838	521	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.903	MODELO
10839	521	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.739	MODELO
10840	520	18	1	\N	\N	\N	\N
10841	520	19	1	\N	\N	\N	\N
10842	520	20	1	\N	\N	\N	\N
10843	520	21	3	\N	\N	\N	\N
10844	520	22	1	\N	\N	\N	\N
10845	520	23	2	\N	\N	\N	\N
10846	520	24	2	\N	\N	\N	\N
10847	520	27	1	\N	\N	\N	\N
10848	520	28	1	\N	\N	\N	\N
10849	520	29	1	\N	\N	\N	\N
10850	520	30	1	\N	\N	\N	\N
10851	520	31	1	\N	\N	\N	\N
10852	520	32	3	\N	\N	\N	\N
10853	520	33	1	\N	\N	\N	\N
10854	520	34	2	\N	\N	\N	\N
10855	520	35	2	\N	\N	\N	\N
10856	520	36	2	\N	\N	\N	\N
10857	520	37	1	\N	\N	\N	\N
10858	520	38	1	\N	\N	\N	\N
10859	520	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.794	MODELO
10860	520	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.925	MODELO
10861	519	18	1	\N	\N	\N	\N
10862	519	19	2	\N	\N	\N	\N
10863	519	20	2	\N	\N	\N	\N
10864	519	21	2	\N	\N	\N	\N
10865	519	22	2	\N	\N	\N	\N
10866	519	23	2	\N	\N	\N	\N
10867	519	24	1	\N	\N	\N	\N
10868	519	27	2	\N	\N	\N	\N
10869	519	28	3	\N	\N	\N	\N
10870	519	29	2	\N	\N	\N	\N
10871	519	30	1	\N	\N	\N	\N
10872	519	31	3	\N	\N	\N	\N
10873	519	32	1	\N	\N	\N	\N
10874	519	33	2	\N	\N	\N	\N
10875	519	34	1	\N	\N	\N	\N
10876	519	35	1	\N	\N	\N	\N
10877	519	36	2	\N	\N	\N	\N
10878	519	37	2	\N	\N	\N	\N
10879	519	38	2	\N	\N	\N	\N
10880	519	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.798	MODELO
10881	519	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.707	MODELO
10882	518	18	1	\N	\N	\N	\N
10883	518	19	2	\N	\N	\N	\N
10884	518	20	1	\N	\N	\N	\N
10885	518	21	1	\N	\N	\N	\N
10886	518	22	1	\N	\N	\N	\N
10887	518	23	2	\N	\N	\N	\N
10888	518	24	2	\N	\N	\N	\N
10889	518	27	1	\N	\N	\N	\N
10890	518	28	2	\N	\N	\N	\N
10891	518	29	2	\N	\N	\N	\N
10892	518	30	1	\N	\N	\N	\N
10893	518	31	4	\N	\N	\N	\N
10894	518	32	1	\N	\N	\N	\N
10895	518	33	2	\N	\N	\N	\N
10896	518	34	1	\N	\N	\N	\N
10897	518	35	1	\N	\N	\N	\N
10898	518	36	1	\N	\N	\N	\N
10899	518	37	2	\N	\N	\N	\N
10900	518	38	2	\N	\N	\N	\N
10901	518	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.716	MODELO
10902	518	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.938	MODELO
10903	517	18	2	\N	\N	\N	\N
10904	517	19	2	\N	\N	\N	\N
10905	517	20	1	\N	\N	\N	\N
10906	517	21	2	\N	\N	\N	\N
10907	517	22	2	\N	\N	\N	\N
10908	517	23	2	\N	\N	\N	\N
10909	517	24	1	\N	\N	\N	\N
10910	517	27	1	\N	\N	\N	\N
10911	517	28	2	\N	\N	\N	\N
10912	517	29	1	\N	\N	\N	\N
10913	517	30	1	\N	\N	\N	\N
10914	517	31	1	\N	\N	\N	\N
10915	517	32	2	\N	\N	\N	\N
10916	517	33	2	\N	\N	\N	\N
10917	517	34	2	\N	\N	\N	\N
10918	517	35	1	\N	\N	\N	\N
10919	517	36	1	\N	\N	\N	\N
10920	517	37	4	\N	\N	\N	\N
10921	517	38	2	\N	\N	\N	\N
10922	517	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.873	MODELO
10923	517	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.955	MODELO
10924	516	18	1	\N	\N	\N	\N
10925	516	19	2	\N	\N	\N	\N
10926	516	20	1	\N	\N	\N	\N
10927	516	21	1	\N	\N	\N	\N
10928	516	22	2	\N	\N	\N	\N
10929	516	23	2	\N	\N	\N	\N
10930	516	24	1	\N	\N	\N	\N
10931	516	27	1	\N	\N	\N	\N
10932	516	28	1	\N	\N	\N	\N
10933	516	29	3	\N	\N	\N	\N
10934	516	30	4	\N	\N	\N	\N
10935	516	31	2	\N	\N	\N	\N
10936	516	32	3	\N	\N	\N	\N
10937	516	33	2	\N	\N	\N	\N
10938	516	34	1	\N	\N	\N	\N
10939	516	35	2	\N	\N	\N	\N
10940	516	36	1	\N	\N	\N	\N
10941	516	37	4	\N	\N	\N	\N
10942	516	38	3	\N	\N	\N	\N
10943	516	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.907	MODELO
10944	516	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.922	MODELO
10945	515	18	2	\N	\N	\N	\N
10946	515	19	2	\N	\N	\N	\N
10947	515	20	1	\N	\N	\N	\N
10948	515	21	2	\N	\N	\N	\N
10949	515	22	1	\N	\N	\N	\N
10950	515	23	2	\N	\N	\N	\N
10951	515	24	1	\N	\N	\N	\N
10952	515	27	2	\N	\N	\N	\N
10953	515	28	2	\N	\N	\N	\N
10954	515	29	1	\N	\N	\N	\N
10955	515	30	1	\N	\N	\N	\N
10956	515	31	1	\N	\N	\N	\N
10957	515	32	1	\N	\N	\N	\N
10958	515	33	2	\N	\N	\N	\N
10959	515	34	4	\N	\N	\N	\N
10960	515	35	1	\N	\N	\N	\N
10961	515	36	3	\N	\N	\N	\N
10962	515	37	1	\N	\N	\N	\N
10963	515	38	2	\N	\N	\N	\N
10964	515	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.824	MODELO
10965	515	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.938	MODELO
10966	514	18	2	\N	\N	\N	\N
10967	514	19	3	\N	\N	\N	\N
10968	514	20	2	\N	\N	\N	\N
10969	514	21	3	\N	\N	\N	\N
10970	514	22	3	\N	\N	\N	\N
10971	514	23	1	\N	\N	\N	\N
10972	514	24	2	\N	\N	\N	\N
10973	514	27	1	\N	\N	\N	\N
10974	514	28	1	\N	\N	\N	\N
10975	514	29	2	\N	\N	\N	\N
10976	514	30	2	\N	\N	\N	\N
10977	514	31	1	\N	\N	\N	\N
10978	514	32	1	\N	\N	\N	\N
10979	514	33	1	\N	\N	\N	\N
10980	514	34	1	\N	\N	\N	\N
10981	514	35	3	\N	\N	\N	\N
10982	514	36	2	\N	\N	\N	\N
10983	514	37	2	\N	\N	\N	\N
10984	514	38	1	\N	\N	\N	\N
10985	514	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.649	MODELO
10986	514	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.79	MODELO
10987	513	18	2	\N	\N	\N	\N
10988	513	19	2	\N	\N	\N	\N
10989	513	20	1	\N	\N	\N	\N
10990	513	21	1	\N	\N	\N	\N
10991	513	22	4	\N	\N	\N	\N
10992	513	23	1	\N	\N	\N	\N
10993	513	24	3	\N	\N	\N	\N
10994	513	27	1	\N	\N	\N	\N
10995	513	28	2	\N	\N	\N	\N
10996	513	29	1	\N	\N	\N	\N
10997	513	30	1	\N	\N	\N	\N
10998	513	31	1	\N	\N	\N	\N
10999	513	32	2	\N	\N	\N	\N
11000	513	33	1	\N	\N	\N	\N
11001	513	34	1	\N	\N	\N	\N
11002	513	35	2	\N	\N	\N	\N
11003	513	36	3	\N	\N	\N	\N
11004	513	37	2	\N	\N	\N	\N
11005	513	38	2	\N	\N	\N	\N
11006	513	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.705	MODELO
11007	513	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.922	MODELO
11008	512	18	2	\N	\N	\N	\N
11009	512	19	1	\N	\N	\N	\N
11010	512	20	1	\N	\N	\N	\N
11011	512	21	3	\N	\N	\N	\N
11012	512	22	1	\N	\N	\N	\N
11013	512	23	1	\N	\N	\N	\N
11014	512	24	2	\N	\N	\N	\N
11015	512	27	1	\N	\N	\N	\N
11016	512	28	1	\N	\N	\N	\N
11017	512	29	1	\N	\N	\N	\N
11018	512	30	1	\N	\N	\N	\N
11019	512	31	1	\N	\N	\N	\N
11020	512	32	1	\N	\N	\N	\N
11021	512	33	2	\N	\N	\N	\N
11022	512	34	1	\N	\N	\N	\N
11023	512	35	1	\N	\N	\N	\N
11024	512	36	1	\N	\N	\N	\N
11025	512	37	1	\N	\N	\N	\N
11026	512	38	2	\N	\N	\N	\N
11027	512	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.527	MODELO
11028	512	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.976	MODELO
11029	511	18	1	\N	\N	\N	\N
11030	511	19	1	\N	\N	\N	\N
11031	511	20	1	\N	\N	\N	\N
11032	511	21	4	\N	\N	\N	\N
11033	511	22	4	\N	\N	\N	\N
11034	511	23	3	\N	\N	\N	\N
11035	511	24	2	\N	\N	\N	\N
11036	511	27	3	\N	\N	\N	\N
11037	511	28	3	\N	\N	\N	\N
11038	511	29	2	\N	\N	\N	\N
11039	511	30	1	\N	\N	\N	\N
11040	511	31	3	\N	\N	\N	\N
11041	511	32	2	\N	\N	\N	\N
11042	511	33	1	\N	\N	\N	\N
11043	511	34	3	\N	\N	\N	\N
11044	511	35	2	\N	\N	\N	\N
11045	511	36	1	\N	\N	\N	\N
11046	511	37	2	\N	\N	\N	\N
11047	511	38	2	\N	\N	\N	\N
11048	511	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.928	MODELO
11049	511	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.665	MODELO
11050	510	18	2	\N	\N	\N	\N
11051	510	19	1	\N	\N	\N	\N
11052	510	20	2	\N	\N	\N	\N
11053	510	21	1	\N	\N	\N	\N
11054	510	22	2	\N	\N	\N	\N
11055	510	23	1	\N	\N	\N	\N
11056	510	24	1	\N	\N	\N	\N
11057	510	27	1	\N	\N	\N	\N
11058	510	28	3	\N	\N	\N	\N
11059	510	29	2	\N	\N	\N	\N
11060	510	30	2	\N	\N	\N	\N
11061	510	31	2	\N	\N	\N	\N
11062	510	32	1	\N	\N	\N	\N
11063	510	33	1	\N	\N	\N	\N
11064	510	34	1	\N	\N	\N	\N
11065	510	35	2	\N	\N	\N	\N
11066	510	36	1	\N	\N	\N	\N
11067	510	37	4	\N	\N	\N	\N
11068	510	38	1	\N	\N	\N	\N
11069	510	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.723	MODELO
11070	510	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.952	MODELO
11071	509	18	1	\N	\N	\N	\N
11072	509	19	2	\N	\N	\N	\N
11073	509	20	2	\N	\N	\N	\N
11074	509	21	1	\N	\N	\N	\N
11075	509	22	1	\N	\N	\N	\N
11076	509	23	1	\N	\N	\N	\N
11077	509	24	3	\N	\N	\N	\N
11078	509	27	2	\N	\N	\N	\N
11079	509	28	1	\N	\N	\N	\N
11080	509	29	2	\N	\N	\N	\N
11081	509	30	2	\N	\N	\N	\N
11082	509	31	1	\N	\N	\N	\N
11083	509	32	1	\N	\N	\N	\N
11084	509	33	4	\N	\N	\N	\N
11085	509	34	1	\N	\N	\N	\N
11086	509	35	4	\N	\N	\N	\N
11087	509	36	3	\N	\N	\N	\N
11088	509	37	1	\N	\N	\N	\N
11089	509	38	1	\N	\N	\N	\N
11090	509	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.788	MODELO
11091	509	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.867	MODELO
11092	508	18	2	\N	\N	\N	\N
11093	508	19	1	\N	\N	\N	\N
11094	508	20	2	\N	\N	\N	\N
11095	508	21	2	\N	\N	\N	\N
11096	508	22	1	\N	\N	\N	\N
11097	508	23	2	\N	\N	\N	\N
11098	508	24	1	\N	\N	\N	\N
11099	508	27	3	\N	\N	\N	\N
11100	508	28	2	\N	\N	\N	\N
11101	508	29	1	\N	\N	\N	\N
11102	508	30	2	\N	\N	\N	\N
11103	508	31	2	\N	\N	\N	\N
11104	508	32	1	\N	\N	\N	\N
11105	508	33	1	\N	\N	\N	\N
11106	508	34	1	\N	\N	\N	\N
11107	508	35	2	\N	\N	\N	\N
11108	508	36	3	\N	\N	\N	\N
11109	508	37	1	\N	\N	\N	\N
11110	508	38	3	\N	\N	\N	\N
11111	508	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.709	MODELO
11112	508	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.651	MODELO
11113	507	18	2	\N	\N	\N	\N
11114	507	19	2	\N	\N	\N	\N
11115	507	20	1	\N	\N	\N	\N
11116	507	21	3	\N	\N	\N	\N
11117	507	22	2	\N	\N	\N	\N
11118	507	23	2	\N	\N	\N	\N
11119	507	24	2	\N	\N	\N	\N
11120	507	27	2	\N	\N	\N	\N
11121	507	28	1	\N	\N	\N	\N
11122	507	29	2	\N	\N	\N	\N
11123	507	30	2	\N	\N	\N	\N
11124	507	31	1	\N	\N	\N	\N
11125	507	32	2	\N	\N	\N	\N
11126	507	33	1	\N	\N	\N	\N
11127	507	34	2	\N	\N	\N	\N
11128	507	35	2	\N	\N	\N	\N
11129	507	36	2	\N	\N	\N	\N
11130	507	37	2	\N	\N	\N	\N
11131	507	38	2	\N	\N	\N	\N
11132	507	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.787	MODELO
11133	507	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.823	MODELO
11134	506	18	1	\N	\N	\N	\N
11135	506	19	3	\N	\N	\N	\N
11136	506	20	1	\N	\N	\N	\N
11137	506	21	2	\N	\N	\N	\N
11138	506	22	1	\N	\N	\N	\N
11139	506	23	3	\N	\N	\N	\N
11140	506	24	1	\N	\N	\N	\N
11141	506	27	2	\N	\N	\N	\N
11142	506	28	2	\N	\N	\N	\N
11143	506	29	2	\N	\N	\N	\N
11144	506	30	3	\N	\N	\N	\N
11145	506	31	1	\N	\N	\N	\N
11146	506	32	3	\N	\N	\N	\N
11147	506	33	1	\N	\N	\N	\N
11148	506	34	1	\N	\N	\N	\N
11149	506	35	3	\N	\N	\N	\N
11150	506	36	1	\N	\N	\N	\N
11151	506	37	1	\N	\N	\N	\N
11152	506	38	2	\N	\N	\N	\N
11153	506	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.505	MODELO
11154	506	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.923	MODELO
11155	505	18	2	\N	\N	\N	\N
11156	505	19	2	\N	\N	\N	\N
11157	505	20	4	\N	\N	\N	\N
11158	505	21	2	\N	\N	\N	\N
11159	505	22	1	\N	\N	\N	\N
11160	505	23	1	\N	\N	\N	\N
11161	505	24	1	\N	\N	\N	\N
11162	505	27	3	\N	\N	\N	\N
11163	505	28	2	\N	\N	\N	\N
11164	505	29	2	\N	\N	\N	\N
11165	505	30	2	\N	\N	\N	\N
11166	505	31	1	\N	\N	\N	\N
11167	505	32	2	\N	\N	\N	\N
11168	505	33	1	\N	\N	\N	\N
11169	505	34	1	\N	\N	\N	\N
11170	505	35	2	\N	\N	\N	\N
11171	505	36	2	\N	\N	\N	\N
11172	505	37	1	\N	\N	\N	\N
11173	505	38	2	\N	\N	\N	\N
11174	505	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.948	MODELO
11175	505	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.929	MODELO
11176	504	18	2	\N	\N	\N	\N
11177	504	19	4	\N	\N	\N	\N
11178	504	20	1	\N	\N	\N	\N
11179	504	21	1	\N	\N	\N	\N
11180	504	22	2	\N	\N	\N	\N
11181	504	23	1	\N	\N	\N	\N
11182	504	24	1	\N	\N	\N	\N
11183	504	27	1	\N	\N	\N	\N
11184	504	28	1	\N	\N	\N	\N
11185	504	29	3	\N	\N	\N	\N
11186	504	30	4	\N	\N	\N	\N
11187	504	31	2	\N	\N	\N	\N
11188	504	32	1	\N	\N	\N	\N
11189	504	33	2	\N	\N	\N	\N
11190	504	34	1	\N	\N	\N	\N
11191	504	35	2	\N	\N	\N	\N
11192	504	36	1	\N	\N	\N	\N
11193	504	37	2	\N	\N	\N	\N
11194	504	38	2	\N	\N	\N	\N
11195	504	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.969	MODELO
11196	504	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.82	MODELO
11197	503	18	2	\N	\N	\N	\N
11198	503	19	1	\N	\N	\N	\N
11199	503	20	1	\N	\N	\N	\N
11200	503	21	1	\N	\N	\N	\N
11201	503	22	1	\N	\N	\N	\N
11202	503	23	3	\N	\N	\N	\N
11203	503	24	1	\N	\N	\N	\N
11204	503	27	1	\N	\N	\N	\N
11205	503	28	3	\N	\N	\N	\N
11206	503	29	1	\N	\N	\N	\N
11207	503	30	2	\N	\N	\N	\N
11208	503	31	2	\N	\N	\N	\N
11209	503	32	3	\N	\N	\N	\N
11210	503	33	1	\N	\N	\N	\N
11211	503	34	2	\N	\N	\N	\N
11212	503	35	2	\N	\N	\N	\N
11213	503	36	1	\N	\N	\N	\N
11214	503	37	4	\N	\N	\N	\N
11215	503	38	2	\N	\N	\N	\N
11216	503	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.808	MODELO
11217	503	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.965	MODELO
11218	502	18	1	\N	\N	\N	\N
11219	502	19	2	\N	\N	\N	\N
11220	502	20	1	\N	\N	\N	\N
11221	502	21	1	\N	\N	\N	\N
11222	502	22	3	\N	\N	\N	\N
11223	502	23	1	\N	\N	\N	\N
11224	502	24	2	\N	\N	\N	\N
11225	502	27	2	\N	\N	\N	\N
11226	502	28	2	\N	\N	\N	\N
11227	502	29	1	\N	\N	\N	\N
11228	502	30	1	\N	\N	\N	\N
11229	502	31	1	\N	\N	\N	\N
11230	502	32	2	\N	\N	\N	\N
11231	502	33	2	\N	\N	\N	\N
11232	502	34	1	\N	\N	\N	\N
11233	502	35	3	\N	\N	\N	\N
11234	502	36	1	\N	\N	\N	\N
11235	502	37	2	\N	\N	\N	\N
11236	502	38	1	\N	\N	\N	\N
11237	502	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.717	MODELO
11238	502	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.938	MODELO
11239	501	18	1	\N	\N	\N	\N
11240	501	19	2	\N	\N	\N	\N
11241	501	20	3	\N	\N	\N	\N
11242	501	21	1	\N	\N	\N	\N
11243	501	22	2	\N	\N	\N	\N
11244	501	23	3	\N	\N	\N	\N
11245	501	24	1	\N	\N	\N	\N
11246	501	27	1	\N	\N	\N	\N
11247	501	28	4	\N	\N	\N	\N
11248	501	29	1	\N	\N	\N	\N
11249	501	30	4	\N	\N	\N	\N
11250	501	31	2	\N	\N	\N	\N
11251	501	32	2	\N	\N	\N	\N
11252	501	33	3	\N	\N	\N	\N
11253	501	34	1	\N	\N	\N	\N
11254	501	35	2	\N	\N	\N	\N
11255	501	36	1	\N	\N	\N	\N
11256	501	37	1	\N	\N	\N	\N
11257	501	38	1	\N	\N	\N	\N
11258	501	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.886	MODELO
11259	501	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.936	MODELO
11260	500	18	1	\N	\N	\N	\N
11261	500	19	1	\N	\N	\N	\N
11262	500	20	2	\N	\N	\N	\N
11263	500	21	1	\N	\N	\N	\N
11264	500	22	1	\N	\N	\N	\N
11265	500	23	1	\N	\N	\N	\N
11266	500	24	2	\N	\N	\N	\N
11267	500	27	3	\N	\N	\N	\N
11268	500	28	2	\N	\N	\N	\N
11269	500	29	2	\N	\N	\N	\N
11270	500	30	1	\N	\N	\N	\N
11271	500	31	2	\N	\N	\N	\N
11272	500	32	2	\N	\N	\N	\N
11273	500	33	1	\N	\N	\N	\N
11274	500	34	4	\N	\N	\N	\N
11275	500	35	2	\N	\N	\N	\N
11276	500	36	1	\N	\N	\N	\N
11277	500	37	3	\N	\N	\N	\N
11278	500	38	2	\N	\N	\N	\N
11279	500	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.912	MODELO
11280	500	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.723	MODELO
11281	499	18	1	\N	\N	\N	\N
11282	499	19	3	\N	\N	\N	\N
11283	499	20	1	\N	\N	\N	\N
11284	499	21	2	\N	\N	\N	\N
11285	499	22	1	\N	\N	\N	\N
11286	499	23	1	\N	\N	\N	\N
11287	499	24	2	\N	\N	\N	\N
11288	499	27	4	\N	\N	\N	\N
11289	499	28	1	\N	\N	\N	\N
11290	499	29	2	\N	\N	\N	\N
11291	499	30	3	\N	\N	\N	\N
11292	499	31	3	\N	\N	\N	\N
11293	499	32	1	\N	\N	\N	\N
11294	499	33	1	\N	\N	\N	\N
11295	499	34	4	\N	\N	\N	\N
11296	499	35	2	\N	\N	\N	\N
11297	499	36	1	\N	\N	\N	\N
11298	499	37	3	\N	\N	\N	\N
11299	499	38	1	\N	\N	\N	\N
11300	499	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.82	MODELO
11301	499	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.837	MODELO
11302	498	18	1	\N	\N	\N	\N
11303	498	19	2	\N	\N	\N	\N
11304	498	20	2	\N	\N	\N	\N
11305	498	21	2	\N	\N	\N	\N
11306	498	22	3	\N	\N	\N	\N
11307	498	23	2	\N	\N	\N	\N
11308	498	24	1	\N	\N	\N	\N
11309	498	27	1	\N	\N	\N	\N
11310	498	28	2	\N	\N	\N	\N
11311	498	29	1	\N	\N	\N	\N
11312	498	30	1	\N	\N	\N	\N
11313	498	31	1	\N	\N	\N	\N
11314	498	32	4	\N	\N	\N	\N
11315	498	33	3	\N	\N	\N	\N
11316	498	34	2	\N	\N	\N	\N
11317	498	35	1	\N	\N	\N	\N
11318	498	36	1	\N	\N	\N	\N
11319	498	37	1	\N	\N	\N	\N
11320	498	38	1	\N	\N	\N	\N
11321	498	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.929	MODELO
11322	498	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.918	MODELO
11323	497	18	1	\N	\N	\N	\N
11324	497	19	2	\N	\N	\N	\N
11325	497	20	1	\N	\N	\N	\N
11326	497	21	3	\N	\N	\N	\N
11327	497	22	1	\N	\N	\N	\N
11328	497	23	1	\N	\N	\N	\N
11329	497	24	1	\N	\N	\N	\N
11330	497	27	1	\N	\N	\N	\N
11331	497	28	1	\N	\N	\N	\N
11332	497	29	2	\N	\N	\N	\N
11333	497	30	2	\N	\N	\N	\N
11334	497	31	3	\N	\N	\N	\N
11335	497	32	3	\N	\N	\N	\N
11336	497	33	1	\N	\N	\N	\N
11337	497	34	4	\N	\N	\N	\N
11338	497	35	3	\N	\N	\N	\N
11339	497	36	2	\N	\N	\N	\N
11340	497	37	1	\N	\N	\N	\N
11341	497	38	3	\N	\N	\N	\N
11342	497	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.726	MODELO
11343	497	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.887	MODELO
11344	496	18	1	\N	\N	\N	\N
11345	496	19	2	\N	\N	\N	\N
11346	496	20	2	\N	\N	\N	\N
11347	496	21	1	\N	\N	\N	\N
11348	496	22	1	\N	\N	\N	\N
11349	496	23	1	\N	\N	\N	\N
11350	496	24	2	\N	\N	\N	\N
11351	496	27	2	\N	\N	\N	\N
11352	496	28	1	\N	\N	\N	\N
11353	496	29	1	\N	\N	\N	\N
11354	496	30	1	\N	\N	\N	\N
11355	496	31	1	\N	\N	\N	\N
11356	496	32	1	\N	\N	\N	\N
11357	496	33	2	\N	\N	\N	\N
11358	496	34	1	\N	\N	\N	\N
11359	496	35	3	\N	\N	\N	\N
11360	496	36	2	\N	\N	\N	\N
11361	496	37	2	\N	\N	\N	\N
11362	496	38	2	\N	\N	\N	\N
11363	496	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.876	MODELO
11364	496	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.919	MODELO
11365	495	18	1	\N	\N	\N	\N
11366	495	19	2	\N	\N	\N	\N
11367	495	20	1	\N	\N	\N	\N
11368	495	21	1	\N	\N	\N	\N
11369	495	22	2	\N	\N	\N	\N
11370	495	23	2	\N	\N	\N	\N
11371	495	24	2	\N	\N	\N	\N
11372	495	27	1	\N	\N	\N	\N
11373	495	28	1	\N	\N	\N	\N
11374	495	29	2	\N	\N	\N	\N
11375	495	30	1	\N	\N	\N	\N
11376	495	31	1	\N	\N	\N	\N
11377	495	32	1	\N	\N	\N	\N
11378	495	33	3	\N	\N	\N	\N
11379	495	34	2	\N	\N	\N	\N
11380	495	35	2	\N	\N	\N	\N
11381	495	36	1	\N	\N	\N	\N
11382	495	37	1	\N	\N	\N	\N
11383	495	38	3	\N	\N	\N	\N
11384	495	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.518	MODELO
11385	495	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.805	MODELO
11386	494	18	2	\N	\N	\N	\N
11387	494	19	1	\N	\N	\N	\N
11388	494	20	2	\N	\N	\N	\N
11389	494	21	1	\N	\N	\N	\N
11390	494	22	1	\N	\N	\N	\N
11391	494	23	2	\N	\N	\N	\N
11392	494	24	1	\N	\N	\N	\N
11393	494	27	1	\N	\N	\N	\N
11394	494	28	1	\N	\N	\N	\N
11395	494	29	2	\N	\N	\N	\N
11396	494	30	1	\N	\N	\N	\N
11397	494	31	2	\N	\N	\N	\N
11398	494	32	1	\N	\N	\N	\N
11399	494	33	1	\N	\N	\N	\N
11400	494	34	3	\N	\N	\N	\N
11401	494	35	2	\N	\N	\N	\N
11402	494	36	2	\N	\N	\N	\N
11403	494	37	2	\N	\N	\N	\N
11404	494	38	2	\N	\N	\N	\N
11405	494	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.851	MODELO
11406	494	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.707	MODELO
11407	493	18	1	\N	\N	\N	\N
11408	493	19	2	\N	\N	\N	\N
11409	493	20	2	\N	\N	\N	\N
11410	493	21	1	\N	\N	\N	\N
11411	493	22	1	\N	\N	\N	\N
11412	493	23	2	\N	\N	\N	\N
11413	493	24	2	\N	\N	\N	\N
11414	493	27	3	\N	\N	\N	\N
11415	493	28	3	\N	\N	\N	\N
11416	493	29	4	\N	\N	\N	\N
11417	493	30	4	\N	\N	\N	\N
11418	493	31	1	\N	\N	\N	\N
11419	493	32	2	\N	\N	\N	\N
11420	493	33	4	\N	\N	\N	\N
11421	493	34	1	\N	\N	\N	\N
11422	493	35	3	\N	\N	\N	\N
11423	493	36	3	\N	\N	\N	\N
11424	493	37	1	\N	\N	\N	\N
11425	493	38	1	\N	\N	\N	\N
11426	493	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.979	MODELO
11427	493	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.691	MODELO
11428	492	18	1	\N	\N	\N	\N
11429	492	19	1	\N	\N	\N	\N
11430	492	20	2	\N	\N	\N	\N
11431	492	21	3	\N	\N	\N	\N
11432	492	22	2	\N	\N	\N	\N
11433	492	23	1	\N	\N	\N	\N
11434	492	24	1	\N	\N	\N	\N
11435	492	27	2	\N	\N	\N	\N
11436	492	28	1	\N	\N	\N	\N
11437	492	29	2	\N	\N	\N	\N
11438	492	30	1	\N	\N	\N	\N
11439	492	31	2	\N	\N	\N	\N
11440	492	32	2	\N	\N	\N	\N
11441	492	33	1	\N	\N	\N	\N
11442	492	34	2	\N	\N	\N	\N
11443	492	35	2	\N	\N	\N	\N
11444	492	36	2	\N	\N	\N	\N
11445	492	37	4	\N	\N	\N	\N
11446	492	38	1	\N	\N	\N	\N
11447	492	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.876	MODELO
11448	492	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.878	MODELO
11449	491	18	1	\N	\N	\N	\N
11450	491	19	2	\N	\N	\N	\N
11451	491	20	1	\N	\N	\N	\N
11452	491	21	2	\N	\N	\N	\N
11453	491	22	2	\N	\N	\N	\N
11454	491	23	2	\N	\N	\N	\N
11455	491	24	1	\N	\N	\N	\N
11456	491	27	2	\N	\N	\N	\N
11457	491	28	2	\N	\N	\N	\N
11458	491	29	1	\N	\N	\N	\N
11459	491	30	1	\N	\N	\N	\N
11460	491	31	2	\N	\N	\N	\N
11461	491	32	3	\N	\N	\N	\N
11462	491	33	1	\N	\N	\N	\N
11463	491	34	2	\N	\N	\N	\N
11464	491	35	2	\N	\N	\N	\N
11465	491	36	2	\N	\N	\N	\N
11466	491	37	2	\N	\N	\N	\N
11467	491	38	2	\N	\N	\N	\N
11468	491	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.779	MODELO
11469	491	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.804	MODELO
11470	490	18	1	\N	\N	\N	\N
11471	490	19	1	\N	\N	\N	\N
11472	490	20	3	\N	\N	\N	\N
11473	490	21	1	\N	\N	\N	\N
11474	490	22	3	\N	\N	\N	\N
11475	490	23	3	\N	\N	\N	\N
11476	490	24	1	\N	\N	\N	\N
11477	490	27	2	\N	\N	\N	\N
11478	490	28	4	\N	\N	\N	\N
11479	490	29	1	\N	\N	\N	\N
11480	490	30	2	\N	\N	\N	\N
11481	490	31	1	\N	\N	\N	\N
11482	490	32	3	\N	\N	\N	\N
11483	490	33	1	\N	\N	\N	\N
11484	490	34	3	\N	\N	\N	\N
11485	490	35	1	\N	\N	\N	\N
11486	490	36	1	\N	\N	\N	\N
11487	490	37	2	\N	\N	\N	\N
11488	490	38	3	\N	\N	\N	\N
11489	490	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.732	MODELO
11490	490	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.86	MODELO
11491	489	18	1	\N	\N	\N	\N
11492	489	19	1	\N	\N	\N	\N
11493	489	20	2	\N	\N	\N	\N
11494	489	21	1	\N	\N	\N	\N
11495	489	22	1	\N	\N	\N	\N
11496	489	23	2	\N	\N	\N	\N
11497	489	24	1	\N	\N	\N	\N
11498	489	27	2	\N	\N	\N	\N
11499	489	28	1	\N	\N	\N	\N
11500	489	29	1	\N	\N	\N	\N
11501	489	30	2	\N	\N	\N	\N
11502	489	31	3	\N	\N	\N	\N
11503	489	32	1	\N	\N	\N	\N
11504	489	33	1	\N	\N	\N	\N
11505	489	34	1	\N	\N	\N	\N
11506	489	35	1	\N	\N	\N	\N
11507	489	36	1	\N	\N	\N	\N
11508	489	37	3	\N	\N	\N	\N
11509	489	38	3	\N	\N	\N	\N
11510	489	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.796	MODELO
11511	489	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.889	MODELO
11512	488	18	1	\N	\N	\N	\N
11513	488	19	1	\N	\N	\N	\N
11514	488	20	1	\N	\N	\N	\N
11515	488	21	2	\N	\N	\N	\N
11516	488	22	3	\N	\N	\N	\N
11517	488	23	2	\N	\N	\N	\N
11518	488	24	1	\N	\N	\N	\N
11519	488	27	1	\N	\N	\N	\N
11520	488	28	4	\N	\N	\N	\N
11521	488	29	2	\N	\N	\N	\N
11522	488	30	1	\N	\N	\N	\N
11523	488	31	3	\N	\N	\N	\N
11524	488	32	2	\N	\N	\N	\N
11525	488	33	1	\N	\N	\N	\N
11526	488	34	1	\N	\N	\N	\N
11527	488	35	3	\N	\N	\N	\N
11528	488	36	1	\N	\N	\N	\N
11529	488	37	4	\N	\N	\N	\N
11530	488	38	1	\N	\N	\N	\N
11531	488	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.735	MODELO
11532	488	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.847	MODELO
11533	487	18	3	\N	\N	\N	\N
11534	487	19	3	\N	\N	\N	\N
11535	487	20	2	\N	\N	\N	\N
11536	487	21	2	\N	\N	\N	\N
11537	487	22	1	\N	\N	\N	\N
11538	487	23	1	\N	\N	\N	\N
11539	487	24	2	\N	\N	\N	\N
11540	487	27	3	\N	\N	\N	\N
11541	487	28	1	\N	\N	\N	\N
11542	487	29	2	\N	\N	\N	\N
11543	487	30	2	\N	\N	\N	\N
11544	487	31	1	\N	\N	\N	\N
11545	487	32	1	\N	\N	\N	\N
11546	487	33	2	\N	\N	\N	\N
11547	487	34	1	\N	\N	\N	\N
11548	487	35	1	\N	\N	\N	\N
11549	487	36	1	\N	\N	\N	\N
11550	487	37	1	\N	\N	\N	\N
11551	487	38	2	\N	\N	\N	\N
11552	487	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.747	MODELO
11553	487	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.933	MODELO
11554	486	18	1	\N	\N	\N	\N
11555	486	19	2	\N	\N	\N	\N
11556	486	20	2	\N	\N	\N	\N
11557	486	21	4	\N	\N	\N	\N
11558	486	22	2	\N	\N	\N	\N
11559	486	23	2	\N	\N	\N	\N
11560	486	24	1	\N	\N	\N	\N
11561	486	27	1	\N	\N	\N	\N
11562	486	28	1	\N	\N	\N	\N
11563	486	29	1	\N	\N	\N	\N
11564	486	30	1	\N	\N	\N	\N
11565	486	31	1	\N	\N	\N	\N
11566	486	32	2	\N	\N	\N	\N
11567	486	33	2	\N	\N	\N	\N
11568	486	34	1	\N	\N	\N	\N
11569	486	35	2	\N	\N	\N	\N
11570	486	36	1	\N	\N	\N	\N
11571	486	37	1	\N	\N	\N	\N
11572	486	38	1	\N	\N	\N	\N
11573	486	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.877	MODELO
11574	486	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.842	MODELO
11575	485	18	1	\N	\N	\N	\N
11576	485	19	1	\N	\N	\N	\N
11577	485	20	1	\N	\N	\N	\N
11578	485	21	1	\N	\N	\N	\N
11579	485	22	2	\N	\N	\N	\N
11580	485	23	1	\N	\N	\N	\N
11581	485	24	1	\N	\N	\N	\N
11582	485	27	1	\N	\N	\N	\N
11583	485	28	2	\N	\N	\N	\N
11584	485	29	1	\N	\N	\N	\N
11585	485	30	1	\N	\N	\N	\N
11586	485	31	2	\N	\N	\N	\N
11587	485	32	3	\N	\N	\N	\N
11588	485	33	1	\N	\N	\N	\N
11589	485	34	2	\N	\N	\N	\N
11590	485	35	2	\N	\N	\N	\N
11591	485	36	2	\N	\N	\N	\N
11592	485	37	2	\N	\N	\N	\N
11593	485	38	1	\N	\N	\N	\N
11594	485	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.96	MODELO
11595	485	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.925	MODELO
11596	484	18	3	\N	\N	\N	\N
11597	484	19	1	\N	\N	\N	\N
11598	484	20	1	\N	\N	\N	\N
11599	484	21	2	\N	\N	\N	\N
11600	484	22	3	\N	\N	\N	\N
11601	484	23	2	\N	\N	\N	\N
11602	484	24	2	\N	\N	\N	\N
11603	484	27	3	\N	\N	\N	\N
11604	484	28	1	\N	\N	\N	\N
11605	484	29	1	\N	\N	\N	\N
11606	484	30	1	\N	\N	\N	\N
11607	484	31	2	\N	\N	\N	\N
11608	484	32	1	\N	\N	\N	\N
11609	484	33	1	\N	\N	\N	\N
11610	484	34	1	\N	\N	\N	\N
11611	484	35	1	\N	\N	\N	\N
11612	484	36	1	\N	\N	\N	\N
11613	484	37	1	\N	\N	\N	\N
11614	484	38	1	\N	\N	\N	\N
11615	484	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.944	MODELO
11616	484	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.842	MODELO
11617	483	18	1	\N	\N	\N	\N
11618	483	19	1	\N	\N	\N	\N
11619	483	20	1	\N	\N	\N	\N
11620	483	21	1	\N	\N	\N	\N
11621	483	22	2	\N	\N	\N	\N
11622	483	23	2	\N	\N	\N	\N
11623	483	24	1	\N	\N	\N	\N
11624	483	27	2	\N	\N	\N	\N
11625	483	28	1	\N	\N	\N	\N
11626	483	29	2	\N	\N	\N	\N
11627	483	30	3	\N	\N	\N	\N
11628	483	31	4	\N	\N	\N	\N
11629	483	32	1	\N	\N	\N	\N
11630	483	33	1	\N	\N	\N	\N
11631	483	34	2	\N	\N	\N	\N
11632	483	35	2	\N	\N	\N	\N
11633	483	36	3	\N	\N	\N	\N
11634	483	37	3	\N	\N	\N	\N
11635	483	38	1	\N	\N	\N	\N
11636	483	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.726	MODELO
11637	483	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.877	MODELO
11638	482	18	2	\N	\N	\N	\N
11639	482	19	2	\N	\N	\N	\N
11640	482	20	1	\N	\N	\N	\N
11641	482	21	4	\N	\N	\N	\N
11642	482	22	1	\N	\N	\N	\N
11643	482	23	3	\N	\N	\N	\N
11644	482	24	1	\N	\N	\N	\N
11645	482	27	3	\N	\N	\N	\N
11646	482	28	3	\N	\N	\N	\N
11647	482	29	2	\N	\N	\N	\N
11648	482	30	3	\N	\N	\N	\N
11649	482	31	2	\N	\N	\N	\N
11650	482	32	2	\N	\N	\N	\N
11651	482	33	2	\N	\N	\N	\N
11652	482	34	2	\N	\N	\N	\N
11653	482	35	3	\N	\N	\N	\N
11654	482	36	3	\N	\N	\N	\N
11655	482	37	3	\N	\N	\N	\N
11656	482	38	2	\N	\N	\N	\N
11657	482	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.946	MODELO
11658	482	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.744	MODELO
11659	481	18	3	\N	\N	\N	\N
11660	481	19	4	\N	\N	\N	\N
11661	481	20	1	\N	\N	\N	\N
11662	481	21	3	\N	\N	\N	\N
11663	481	22	2	\N	\N	\N	\N
11664	481	23	1	\N	\N	\N	\N
11665	481	24	1	\N	\N	\N	\N
11666	481	27	1	\N	\N	\N	\N
11667	481	28	1	\N	\N	\N	\N
11668	481	29	1	\N	\N	\N	\N
11669	481	30	1	\N	\N	\N	\N
11670	481	31	2	\N	\N	\N	\N
11671	481	32	3	\N	\N	\N	\N
11672	481	33	1	\N	\N	\N	\N
11673	481	34	1	\N	\N	\N	\N
11674	481	35	2	\N	\N	\N	\N
11675	481	36	1	\N	\N	\N	\N
11676	481	37	1	\N	\N	\N	\N
11677	481	38	1	\N	\N	\N	\N
11678	481	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.85	MODELO
11679	481	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.901	MODELO
11680	480	18	2	\N	\N	\N	\N
11681	480	19	2	\N	\N	\N	\N
11682	480	20	1	\N	\N	\N	\N
11683	480	21	2	\N	\N	\N	\N
11684	480	22	1	\N	\N	\N	\N
11685	480	23	3	\N	\N	\N	\N
11686	480	24	2	\N	\N	\N	\N
11687	480	27	2	\N	\N	\N	\N
11688	480	28	1	\N	\N	\N	\N
11689	480	29	1	\N	\N	\N	\N
11690	480	30	2	\N	\N	\N	\N
11691	480	31	1	\N	\N	\N	\N
11692	480	32	1	\N	\N	\N	\N
11693	480	33	2	\N	\N	\N	\N
11694	480	34	2	\N	\N	\N	\N
11695	480	35	1	\N	\N	\N	\N
11696	480	36	2	\N	\N	\N	\N
11697	480	37	1	\N	\N	\N	\N
11698	480	38	1	\N	\N	\N	\N
11699	480	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.602	MODELO
11700	480	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.734	MODELO
11701	479	18	2	\N	\N	\N	\N
11702	479	19	1	\N	\N	\N	\N
11703	479	20	1	\N	\N	\N	\N
11704	479	21	1	\N	\N	\N	\N
11705	479	22	2	\N	\N	\N	\N
11706	479	23	4	\N	\N	\N	\N
11707	479	24	2	\N	\N	\N	\N
11708	479	27	2	\N	\N	\N	\N
11709	479	28	4	\N	\N	\N	\N
11710	479	29	1	\N	\N	\N	\N
11711	479	30	2	\N	\N	\N	\N
11712	479	31	1	\N	\N	\N	\N
11713	479	32	1	\N	\N	\N	\N
11714	479	33	1	\N	\N	\N	\N
11715	479	34	4	\N	\N	\N	\N
11716	479	35	2	\N	\N	\N	\N
11717	479	36	2	\N	\N	\N	\N
11718	479	37	1	\N	\N	\N	\N
11719	479	38	1	\N	\N	\N	\N
11720	479	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.59	MODELO
11721	479	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.787	MODELO
11722	478	18	1	\N	\N	\N	\N
11723	478	19	4	\N	\N	\N	\N
11724	478	20	1	\N	\N	\N	\N
11725	478	21	1	\N	\N	\N	\N
11726	478	22	1	\N	\N	\N	\N
11727	478	23	1	\N	\N	\N	\N
11728	478	24	1	\N	\N	\N	\N
11729	478	27	1	\N	\N	\N	\N
11730	478	28	2	\N	\N	\N	\N
11731	478	29	1	\N	\N	\N	\N
11732	478	30	2	\N	\N	\N	\N
11733	478	31	1	\N	\N	\N	\N
11734	478	32	4	\N	\N	\N	\N
11735	478	33	1	\N	\N	\N	\N
11736	478	34	1	\N	\N	\N	\N
11737	478	35	2	\N	\N	\N	\N
11738	478	36	1	\N	\N	\N	\N
11739	478	37	1	\N	\N	\N	\N
11740	478	38	2	\N	\N	\N	\N
11741	478	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.808	MODELO
11742	478	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.874	MODELO
11743	477	18	3	\N	\N	\N	\N
11744	477	19	3	\N	\N	\N	\N
11745	477	20	1	\N	\N	\N	\N
11746	477	21	2	\N	\N	\N	\N
11747	477	22	1	\N	\N	\N	\N
11748	477	23	1	\N	\N	\N	\N
11749	477	24	1	\N	\N	\N	\N
11750	477	27	3	\N	\N	\N	\N
11751	477	28	3	\N	\N	\N	\N
11752	477	29	1	\N	\N	\N	\N
11753	477	30	1	\N	\N	\N	\N
11754	477	31	2	\N	\N	\N	\N
11755	477	32	1	\N	\N	\N	\N
11756	477	33	1	\N	\N	\N	\N
11757	477	34	4	\N	\N	\N	\N
11758	477	35	3	\N	\N	\N	\N
11759	477	36	1	\N	\N	\N	\N
11760	477	37	1	\N	\N	\N	\N
11761	477	38	3	\N	\N	\N	\N
11762	477	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.855	MODELO
11763	477	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.961	MODELO
11764	476	18	1	\N	\N	\N	\N
11765	476	19	1	\N	\N	\N	\N
11766	476	20	1	\N	\N	\N	\N
11767	476	21	1	\N	\N	\N	\N
11768	476	22	2	\N	\N	\N	\N
11769	476	23	1	\N	\N	\N	\N
11770	476	24	3	\N	\N	\N	\N
11771	476	27	1	\N	\N	\N	\N
11772	476	28	2	\N	\N	\N	\N
11773	476	29	1	\N	\N	\N	\N
11774	476	30	2	\N	\N	\N	\N
11775	476	31	3	\N	\N	\N	\N
11776	476	32	2	\N	\N	\N	\N
11777	476	33	2	\N	\N	\N	\N
11778	476	34	1	\N	\N	\N	\N
11779	476	35	1	\N	\N	\N	\N
11780	476	36	1	\N	\N	\N	\N
11781	476	37	1	\N	\N	\N	\N
11782	476	38	2	\N	\N	\N	\N
11783	476	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.959	MODELO
11784	476	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.961	MODELO
11785	475	18	1	\N	\N	\N	\N
11786	475	19	1	\N	\N	\N	\N
11787	475	20	3	\N	\N	\N	\N
11788	475	21	3	\N	\N	\N	\N
11789	475	22	1	\N	\N	\N	\N
11790	475	23	2	\N	\N	\N	\N
11791	475	24	2	\N	\N	\N	\N
11792	475	27	1	\N	\N	\N	\N
11793	475	28	2	\N	\N	\N	\N
11794	475	29	1	\N	\N	\N	\N
11795	475	30	1	\N	\N	\N	\N
11796	475	31	3	\N	\N	\N	\N
11797	475	32	2	\N	\N	\N	\N
11798	475	33	2	\N	\N	\N	\N
11799	475	34	1	\N	\N	\N	\N
11800	475	35	3	\N	\N	\N	\N
11801	475	36	1	\N	\N	\N	\N
11802	475	37	2	\N	\N	\N	\N
11803	475	38	2	\N	\N	\N	\N
11920	469	29	2	\N	\N	\N	\N
11804	475	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.952	MODELO
11805	475	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.852	MODELO
11806	474	18	1	\N	\N	\N	\N
11807	474	19	1	\N	\N	\N	\N
11808	474	20	2	\N	\N	\N	\N
11809	474	21	2	\N	\N	\N	\N
11810	474	22	2	\N	\N	\N	\N
11811	474	23	2	\N	\N	\N	\N
11812	474	24	2	\N	\N	\N	\N
11813	474	27	3	\N	\N	\N	\N
11814	474	28	2	\N	\N	\N	\N
11815	474	29	2	\N	\N	\N	\N
11816	474	30	1	\N	\N	\N	\N
11817	474	31	1	\N	\N	\N	\N
11818	474	32	2	\N	\N	\N	\N
11819	474	33	4	\N	\N	\N	\N
11820	474	34	3	\N	\N	\N	\N
11821	474	35	1	\N	\N	\N	\N
11822	474	36	2	\N	\N	\N	\N
11823	474	37	1	\N	\N	\N	\N
11824	474	38	2	\N	\N	\N	\N
11825	474	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.543	MODELO
11826	474	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.831	MODELO
11827	473	18	1	\N	\N	\N	\N
11828	473	19	1	\N	\N	\N	\N
11829	473	20	1	\N	\N	\N	\N
11830	473	21	1	\N	\N	\N	\N
11831	473	22	3	\N	\N	\N	\N
11832	473	23	1	\N	\N	\N	\N
11833	473	24	2	\N	\N	\N	\N
11834	473	27	1	\N	\N	\N	\N
11835	473	28	1	\N	\N	\N	\N
11836	473	29	1	\N	\N	\N	\N
11837	473	30	2	\N	\N	\N	\N
11838	473	31	2	\N	\N	\N	\N
11839	473	32	1	\N	\N	\N	\N
11840	473	33	2	\N	\N	\N	\N
11841	473	34	1	\N	\N	\N	\N
11842	473	35	1	\N	\N	\N	\N
11843	473	36	2	\N	\N	\N	\N
11844	473	37	3	\N	\N	\N	\N
11845	473	38	4	\N	\N	\N	\N
11846	473	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.629	MODELO
11847	473	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.766	MODELO
11848	472	18	4	\N	\N	\N	\N
11849	472	19	3	\N	\N	\N	\N
11850	472	20	2	\N	\N	\N	\N
11851	472	21	2	\N	\N	\N	\N
11852	472	22	2	\N	\N	\N	\N
11853	472	23	2	\N	\N	\N	\N
11854	472	24	3	\N	\N	\N	\N
11855	472	27	1	\N	\N	\N	\N
11856	472	28	2	\N	\N	\N	\N
11857	472	29	3	\N	\N	\N	\N
11858	472	30	1	\N	\N	\N	\N
11859	472	31	2	\N	\N	\N	\N
11860	472	32	4	\N	\N	\N	\N
11861	472	33	1	\N	\N	\N	\N
11862	472	34	2	\N	\N	\N	\N
11863	472	35	1	\N	\N	\N	\N
11864	472	36	1	\N	\N	\N	\N
11865	472	37	2	\N	\N	\N	\N
11866	472	38	2	\N	\N	\N	\N
11867	472	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.574	MODELO
11868	472	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.77	MODELO
11869	471	18	1	\N	\N	\N	\N
11870	471	19	1	\N	\N	\N	\N
11871	471	20	2	\N	\N	\N	\N
11872	471	21	3	\N	\N	\N	\N
11873	471	22	1	\N	\N	\N	\N
11874	471	23	1	\N	\N	\N	\N
11875	471	24	1	\N	\N	\N	\N
11876	471	27	2	\N	\N	\N	\N
11877	471	28	1	\N	\N	\N	\N
11878	471	29	1	\N	\N	\N	\N
11879	471	30	1	\N	\N	\N	\N
11880	471	31	1	\N	\N	\N	\N
11881	471	32	2	\N	\N	\N	\N
11882	471	33	2	\N	\N	\N	\N
11883	471	34	1	\N	\N	\N	\N
11884	471	35	2	\N	\N	\N	\N
11885	471	36	1	\N	\N	\N	\N
11886	471	37	1	\N	\N	\N	\N
11887	471	38	2	\N	\N	\N	\N
11888	471	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.778	MODELO
11889	471	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.93	MODELO
11890	470	18	4	\N	\N	\N	\N
11891	470	19	3	\N	\N	\N	\N
11892	470	20	1	\N	\N	\N	\N
11893	470	21	1	\N	\N	\N	\N
11894	470	22	1	\N	\N	\N	\N
11895	470	23	2	\N	\N	\N	\N
11896	470	24	2	\N	\N	\N	\N
11897	470	27	1	\N	\N	\N	\N
11898	470	28	2	\N	\N	\N	\N
11899	470	29	3	\N	\N	\N	\N
11900	470	30	3	\N	\N	\N	\N
11901	470	31	3	\N	\N	\N	\N
11902	470	32	2	\N	\N	\N	\N
11903	470	33	2	\N	\N	\N	\N
11904	470	34	1	\N	\N	\N	\N
11905	470	35	1	\N	\N	\N	\N
11906	470	36	2	\N	\N	\N	\N
11907	470	37	2	\N	\N	\N	\N
11908	470	38	2	\N	\N	\N	\N
11909	470	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.803	MODELO
11910	470	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.706	MODELO
11911	469	18	1	\N	\N	\N	\N
11912	469	19	1	\N	\N	\N	\N
11913	469	20	1	\N	\N	\N	\N
11914	469	21	2	\N	\N	\N	\N
11915	469	22	1	\N	\N	\N	\N
11916	469	23	2	\N	\N	\N	\N
11917	469	24	1	\N	\N	\N	\N
11918	469	27	1	\N	\N	\N	\N
11919	469	28	3	\N	\N	\N	\N
11921	469	30	2	\N	\N	\N	\N
11922	469	31	2	\N	\N	\N	\N
11923	469	32	2	\N	\N	\N	\N
11924	469	33	2	\N	\N	\N	\N
11925	469	34	2	\N	\N	\N	\N
11926	469	35	2	\N	\N	\N	\N
11927	469	36	2	\N	\N	\N	\N
11928	469	37	1	\N	\N	\N	\N
11929	469	38	4	\N	\N	\N	\N
11930	469	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.594	MODELO
11931	469	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.883	MODELO
11932	468	18	2	\N	\N	\N	\N
11933	468	19	1	\N	\N	\N	\N
11934	468	20	1	\N	\N	\N	\N
11935	468	21	2	\N	\N	\N	\N
11936	468	22	1	\N	\N	\N	\N
11937	468	23	1	\N	\N	\N	\N
11938	468	24	2	\N	\N	\N	\N
11939	468	27	1	\N	\N	\N	\N
11940	468	28	1	\N	\N	\N	\N
11941	468	29	1	\N	\N	\N	\N
11942	468	30	2	\N	\N	\N	\N
11943	468	31	1	\N	\N	\N	\N
11944	468	32	2	\N	\N	\N	\N
11945	468	33	3	\N	\N	\N	\N
11946	468	34	1	\N	\N	\N	\N
11947	468	35	1	\N	\N	\N	\N
11948	468	36	2	\N	\N	\N	\N
11949	468	37	2	\N	\N	\N	\N
11950	468	38	1	\N	\N	\N	\N
11951	468	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.685	MODELO
11952	468	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.626	MODELO
11953	467	18	3	\N	\N	\N	\N
11954	467	19	2	\N	\N	\N	\N
11955	467	20	1	\N	\N	\N	\N
11956	467	21	1	\N	\N	\N	\N
11957	467	22	2	\N	\N	\N	\N
11958	467	23	4	\N	\N	\N	\N
11959	467	24	2	\N	\N	\N	\N
11960	467	27	1	\N	\N	\N	\N
11961	467	28	2	\N	\N	\N	\N
11962	467	29	1	\N	\N	\N	\N
11963	467	30	2	\N	\N	\N	\N
11964	467	31	2	\N	\N	\N	\N
11965	467	32	1	\N	\N	\N	\N
11966	467	33	2	\N	\N	\N	\N
11967	467	34	4	\N	\N	\N	\N
11968	467	35	1	\N	\N	\N	\N
11969	467	36	2	\N	\N	\N	\N
11970	467	37	1	\N	\N	\N	\N
11971	467	38	1	\N	\N	\N	\N
11972	467	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.506	MODELO
11973	467	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.888	MODELO
11974	466	18	1	\N	\N	\N	\N
11975	466	19	2	\N	\N	\N	\N
11976	466	20	1	\N	\N	\N	\N
11977	466	21	2	\N	\N	\N	\N
11978	466	22	1	\N	\N	\N	\N
11979	466	23	3	\N	\N	\N	\N
11980	466	24	2	\N	\N	\N	\N
11981	466	27	2	\N	\N	\N	\N
11982	466	28	1	\N	\N	\N	\N
11983	466	29	1	\N	\N	\N	\N
11984	466	30	3	\N	\N	\N	\N
11985	466	31	2	\N	\N	\N	\N
11986	466	32	2	\N	\N	\N	\N
11987	466	33	2	\N	\N	\N	\N
11988	466	34	1	\N	\N	\N	\N
11989	466	35	2	\N	\N	\N	\N
11990	466	36	3	\N	\N	\N	\N
11991	466	37	2	\N	\N	\N	\N
11992	466	38	1	\N	\N	\N	\N
11993	466	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.818	MODELO
11994	466	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.624	MODELO
11995	465	18	3	\N	\N	\N	\N
11996	465	19	4	\N	\N	\N	\N
11997	465	20	2	\N	\N	\N	\N
11998	465	21	2	\N	\N	\N	\N
11999	465	22	1	\N	\N	\N	\N
12000	465	23	1	\N	\N	\N	\N
12001	465	24	1	\N	\N	\N	\N
12002	465	27	2	\N	\N	\N	\N
12003	465	28	1	\N	\N	\N	\N
12004	465	29	3	\N	\N	\N	\N
12005	465	30	3	\N	\N	\N	\N
12006	465	31	3	\N	\N	\N	\N
12007	465	32	3	\N	\N	\N	\N
12008	465	33	1	\N	\N	\N	\N
12009	465	34	3	\N	\N	\N	\N
12010	465	35	1	\N	\N	\N	\N
12011	465	36	2	\N	\N	\N	\N
12012	465	37	2	\N	\N	\N	\N
12013	465	38	1	\N	\N	\N	\N
12014	465	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.731	MODELO
12015	465	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.832	MODELO
12016	464	18	2	\N	\N	\N	\N
12017	464	19	1	\N	\N	\N	\N
12018	464	20	3	\N	\N	\N	\N
12019	464	21	1	\N	\N	\N	\N
12020	464	22	4	\N	\N	\N	\N
12021	464	23	2	\N	\N	\N	\N
12022	464	24	2	\N	\N	\N	\N
12023	464	27	3	\N	\N	\N	\N
12024	464	28	1	\N	\N	\N	\N
12025	464	29	1	\N	\N	\N	\N
12026	464	30	2	\N	\N	\N	\N
12027	464	31	2	\N	\N	\N	\N
12028	464	32	1	\N	\N	\N	\N
12029	464	33	3	\N	\N	\N	\N
12030	464	34	2	\N	\N	\N	\N
12031	464	35	1	\N	\N	\N	\N
12032	464	36	3	\N	\N	\N	\N
12033	464	37	3	\N	\N	\N	\N
12034	464	38	1	\N	\N	\N	\N
12035	464	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.862	MODELO
12036	464	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.788	MODELO
12037	463	18	3	\N	\N	\N	\N
12038	463	19	1	\N	\N	\N	\N
12039	463	20	3	\N	\N	\N	\N
12040	463	21	3	\N	\N	\N	\N
12041	463	22	4	\N	\N	\N	\N
12042	463	23	2	\N	\N	\N	\N
12043	463	24	1	\N	\N	\N	\N
12044	463	27	2	\N	\N	\N	\N
12045	463	28	1	\N	\N	\N	\N
12046	463	29	2	\N	\N	\N	\N
12047	463	30	1	\N	\N	\N	\N
12048	463	31	2	\N	\N	\N	\N
12049	463	32	2	\N	\N	\N	\N
12050	463	33	3	\N	\N	\N	\N
12051	463	34	1	\N	\N	\N	\N
12052	463	35	2	\N	\N	\N	\N
12053	463	36	1	\N	\N	\N	\N
12054	463	37	2	\N	\N	\N	\N
12055	463	38	2	\N	\N	\N	\N
12056	463	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.8	MODELO
12057	463	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.738	MODELO
12058	462	18	1	\N	\N	\N	\N
12059	462	19	2	\N	\N	\N	\N
12060	462	20	2	\N	\N	\N	\N
12061	462	21	1	\N	\N	\N	\N
12062	462	22	1	\N	\N	\N	\N
12063	462	23	2	\N	\N	\N	\N
12064	462	24	1	\N	\N	\N	\N
12065	462	27	3	\N	\N	\N	\N
12066	462	28	1	\N	\N	\N	\N
12067	462	29	2	\N	\N	\N	\N
12068	462	30	2	\N	\N	\N	\N
12069	462	31	2	\N	\N	\N	\N
12070	462	32	1	\N	\N	\N	\N
12071	462	33	1	\N	\N	\N	\N
12072	462	34	1	\N	\N	\N	\N
12073	462	35	1	\N	\N	\N	\N
12074	462	36	1	\N	\N	\N	\N
12075	462	37	1	\N	\N	\N	\N
12076	462	38	1	\N	\N	\N	\N
12077	462	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.654	MODELO
12078	462	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.86	MODELO
12079	461	18	2	\N	\N	\N	\N
12080	461	19	2	\N	\N	\N	\N
12081	461	20	3	\N	\N	\N	\N
12082	461	21	1	\N	\N	\N	\N
12083	461	22	1	\N	\N	\N	\N
12084	461	23	2	\N	\N	\N	\N
12085	461	24	4	\N	\N	\N	\N
12086	461	27	2	\N	\N	\N	\N
12087	461	28	2	\N	\N	\N	\N
12088	461	29	1	\N	\N	\N	\N
12089	461	30	2	\N	\N	\N	\N
12090	461	31	1	\N	\N	\N	\N
12091	461	32	2	\N	\N	\N	\N
12092	461	33	2	\N	\N	\N	\N
12093	461	34	3	\N	\N	\N	\N
12094	461	35	2	\N	\N	\N	\N
12095	461	36	2	\N	\N	\N	\N
12096	461	37	1	\N	\N	\N	\N
12097	461	38	1	\N	\N	\N	\N
12098	461	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.504	MODELO
12099	461	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.776	MODELO
12100	460	18	2	\N	\N	\N	\N
12101	460	19	1	\N	\N	\N	\N
12102	460	20	1	\N	\N	\N	\N
12103	460	21	1	\N	\N	\N	\N
12104	460	22	1	\N	\N	\N	\N
12105	460	23	1	\N	\N	\N	\N
12106	460	24	1	\N	\N	\N	\N
12107	460	27	2	\N	\N	\N	\N
12108	460	28	1	\N	\N	\N	\N
12109	460	29	1	\N	\N	\N	\N
12110	460	30	3	\N	\N	\N	\N
12111	460	31	3	\N	\N	\N	\N
12112	460	32	1	\N	\N	\N	\N
12113	460	33	2	\N	\N	\N	\N
12114	460	34	2	\N	\N	\N	\N
12115	460	35	1	\N	\N	\N	\N
12116	460	36	1	\N	\N	\N	\N
12117	460	37	4	\N	\N	\N	\N
12118	460	38	3	\N	\N	\N	\N
12119	460	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.855	MODELO
12120	460	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.828	MODELO
12121	459	18	2	\N	\N	\N	\N
12122	459	19	2	\N	\N	\N	\N
12123	459	20	1	\N	\N	\N	\N
12124	459	21	2	\N	\N	\N	\N
12125	459	22	4	\N	\N	\N	\N
12126	459	23	1	\N	\N	\N	\N
12127	459	24	1	\N	\N	\N	\N
12128	459	27	3	\N	\N	\N	\N
12129	459	28	1	\N	\N	\N	\N
12130	459	29	2	\N	\N	\N	\N
12131	459	30	3	\N	\N	\N	\N
12132	459	31	3	\N	\N	\N	\N
12133	459	32	1	\N	\N	\N	\N
12134	459	33	2	\N	\N	\N	\N
12135	459	34	1	\N	\N	\N	\N
12136	459	35	2	\N	\N	\N	\N
12137	459	36	2	\N	\N	\N	\N
12138	459	37	1	\N	\N	\N	\N
12139	459	38	1	\N	\N	\N	\N
12140	459	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.516	MODELO
12141	459	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.82	MODELO
12142	458	18	1	\N	\N	\N	\N
12143	458	19	3	\N	\N	\N	\N
12144	458	20	2	\N	\N	\N	\N
12145	458	21	1	\N	\N	\N	\N
12146	458	22	1	\N	\N	\N	\N
12147	458	23	2	\N	\N	\N	\N
12148	458	24	1	\N	\N	\N	\N
12149	458	27	1	\N	\N	\N	\N
12150	458	28	2	\N	\N	\N	\N
12151	458	29	2	\N	\N	\N	\N
12152	458	30	2	\N	\N	\N	\N
12153	458	31	1	\N	\N	\N	\N
12154	458	32	1	\N	\N	\N	\N
12155	458	33	2	\N	\N	\N	\N
12156	458	34	3	\N	\N	\N	\N
12157	458	35	1	\N	\N	\N	\N
12158	458	36	1	\N	\N	\N	\N
12159	458	37	3	\N	\N	\N	\N
12160	458	38	1	\N	\N	\N	\N
12161	458	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.953	MODELO
12162	458	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.977	MODELO
12163	457	18	2	\N	\N	\N	\N
12164	457	19	1	\N	\N	\N	\N
12165	457	20	2	\N	\N	\N	\N
12166	457	21	2	\N	\N	\N	\N
12167	457	22	2	\N	\N	\N	\N
12168	457	23	2	\N	\N	\N	\N
12169	457	24	1	\N	\N	\N	\N
12170	457	27	1	\N	\N	\N	\N
12171	457	28	1	\N	\N	\N	\N
12172	457	29	1	\N	\N	\N	\N
12173	457	30	1	\N	\N	\N	\N
12174	457	31	2	\N	\N	\N	\N
12175	457	32	1	\N	\N	\N	\N
12176	457	33	2	\N	\N	\N	\N
12177	457	34	1	\N	\N	\N	\N
12178	457	35	3	\N	\N	\N	\N
12179	457	36	1	\N	\N	\N	\N
12180	457	37	4	\N	\N	\N	\N
12181	457	38	2	\N	\N	\N	\N
12182	457	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.633	MODELO
12183	457	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.859	MODELO
12184	456	18	4	\N	\N	\N	\N
12185	456	19	2	\N	\N	\N	\N
12186	456	20	2	\N	\N	\N	\N
12187	456	21	3	\N	\N	\N	\N
12188	456	22	1	\N	\N	\N	\N
12189	456	23	1	\N	\N	\N	\N
12190	456	24	1	\N	\N	\N	\N
12191	456	27	3	\N	\N	\N	\N
12192	456	28	4	\N	\N	\N	\N
12193	456	29	2	\N	\N	\N	\N
12194	456	30	1	\N	\N	\N	\N
12195	456	31	2	\N	\N	\N	\N
12196	456	32	2	\N	\N	\N	\N
12197	456	33	3	\N	\N	\N	\N
12198	456	34	1	\N	\N	\N	\N
12199	456	35	1	\N	\N	\N	\N
12200	456	36	2	\N	\N	\N	\N
12201	456	37	1	\N	\N	\N	\N
12202	456	38	2	\N	\N	\N	\N
12203	456	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.565	MODELO
12204	456	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.729	MODELO
12205	455	18	2	\N	\N	\N	\N
12206	455	19	3	\N	\N	\N	\N
12207	455	20	2	\N	\N	\N	\N
12208	455	21	2	\N	\N	\N	\N
12209	455	22	1	\N	\N	\N	\N
12210	455	23	2	\N	\N	\N	\N
12211	455	24	1	\N	\N	\N	\N
12212	455	27	1	\N	\N	\N	\N
12213	455	28	3	\N	\N	\N	\N
12214	455	29	1	\N	\N	\N	\N
12215	455	30	1	\N	\N	\N	\N
12216	455	31	1	\N	\N	\N	\N
12217	455	32	2	\N	\N	\N	\N
12218	455	33	1	\N	\N	\N	\N
12219	455	34	1	\N	\N	\N	\N
12220	455	35	2	\N	\N	\N	\N
12221	455	36	1	\N	\N	\N	\N
12222	455	37	2	\N	\N	\N	\N
12223	455	38	2	\N	\N	\N	\N
12224	455	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.901	MODELO
12225	455	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.746	MODELO
12226	454	18	1	\N	\N	\N	\N
12227	454	19	1	\N	\N	\N	\N
12228	454	20	2	\N	\N	\N	\N
12229	454	21	1	\N	\N	\N	\N
12230	454	22	1	\N	\N	\N	\N
12231	454	23	1	\N	\N	\N	\N
12232	454	24	2	\N	\N	\N	\N
12233	454	27	1	\N	\N	\N	\N
12234	454	28	2	\N	\N	\N	\N
12235	454	29	2	\N	\N	\N	\N
12236	454	30	3	\N	\N	\N	\N
12237	454	31	3	\N	\N	\N	\N
12238	454	32	2	\N	\N	\N	\N
12239	454	33	3	\N	\N	\N	\N
12240	454	34	2	\N	\N	\N	\N
12241	454	35	1	\N	\N	\N	\N
12242	454	36	4	\N	\N	\N	\N
12243	454	37	2	\N	\N	\N	\N
12244	454	38	1	\N	\N	\N	\N
12245	454	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.934	MODELO
12246	454	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.644	MODELO
12247	453	18	3	\N	\N	\N	\N
12248	453	19	2	\N	\N	\N	\N
12249	453	20	3	\N	\N	\N	\N
12250	453	21	1	\N	\N	\N	\N
12251	453	22	2	\N	\N	\N	\N
12252	453	23	1	\N	\N	\N	\N
12253	453	24	1	\N	\N	\N	\N
12254	453	27	1	\N	\N	\N	\N
12255	453	28	1	\N	\N	\N	\N
12256	453	29	2	\N	\N	\N	\N
12257	453	30	1	\N	\N	\N	\N
12258	453	31	3	\N	\N	\N	\N
12259	453	32	1	\N	\N	\N	\N
12260	453	33	2	\N	\N	\N	\N
12261	453	34	1	\N	\N	\N	\N
12262	453	35	4	\N	\N	\N	\N
12263	453	36	2	\N	\N	\N	\N
12264	453	37	1	\N	\N	\N	\N
12265	453	38	1	\N	\N	\N	\N
12266	453	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.731	MODELO
12267	453	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.792	MODELO
12268	452	18	1	\N	\N	\N	\N
12269	452	19	2	\N	\N	\N	\N
12270	452	20	2	\N	\N	\N	\N
12271	452	21	2	\N	\N	\N	\N
12272	452	22	4	\N	\N	\N	\N
12273	452	23	2	\N	\N	\N	\N
12274	452	24	1	\N	\N	\N	\N
12275	452	27	1	\N	\N	\N	\N
12276	452	28	1	\N	\N	\N	\N
12277	452	29	2	\N	\N	\N	\N
12278	452	30	1	\N	\N	\N	\N
12279	452	31	2	\N	\N	\N	\N
12280	452	32	2	\N	\N	\N	\N
12281	452	33	3	\N	\N	\N	\N
12282	452	34	2	\N	\N	\N	\N
12283	452	35	2	\N	\N	\N	\N
12284	452	36	2	\N	\N	\N	\N
12285	452	37	1	\N	\N	\N	\N
12286	452	38	4	\N	\N	\N	\N
12287	452	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.961	MODELO
12288	452	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.901	MODELO
12289	1047	18	1	\N	\N	\N	\N
12290	1047	19	3	\N	\N	\N	\N
12291	1047	20	1	\N	\N	\N	\N
12292	1047	21	3	\N	\N	\N	\N
12293	1047	22	2	\N	\N	\N	\N
12294	1047	23	1	\N	\N	\N	\N
12295	1047	24	2	\N	\N	\N	\N
12296	1047	27	1	\N	\N	\N	\N
12297	1047	28	1	\N	\N	\N	\N
12298	1047	29	2	\N	\N	\N	\N
12299	1047	30	3	\N	\N	\N	\N
12300	1047	31	2	\N	\N	\N	\N
12301	1047	32	1	\N	\N	\N	\N
12302	1047	33	1	\N	\N	\N	\N
12303	1047	34	1	\N	\N	\N	\N
12304	1047	35	2	\N	\N	\N	\N
12305	1047	36	2	\N	\N	\N	\N
12306	1047	37	2	\N	\N	\N	\N
12307	1047	38	2	\N	\N	\N	\N
12308	1047	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.897	MODELO
12309	1047	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.736	MODELO
12310	1046	18	2	\N	\N	\N	\N
12311	1046	19	1	\N	\N	\N	\N
12312	1046	20	1	\N	\N	\N	\N
12313	1046	21	2	\N	\N	\N	\N
12314	1046	22	1	\N	\N	\N	\N
12315	1046	23	1	\N	\N	\N	\N
12316	1046	24	2	\N	\N	\N	\N
12317	1046	27	1	\N	\N	\N	\N
12318	1046	28	1	\N	\N	\N	\N
12319	1046	29	1	\N	\N	\N	\N
12320	1046	30	3	\N	\N	\N	\N
12321	1046	31	3	\N	\N	\N	\N
12322	1046	32	1	\N	\N	\N	\N
12323	1046	33	3	\N	\N	\N	\N
12324	1046	34	3	\N	\N	\N	\N
12325	1046	35	1	\N	\N	\N	\N
12326	1046	36	1	\N	\N	\N	\N
12327	1046	37	1	\N	\N	\N	\N
12328	1046	38	2	\N	\N	\N	\N
12329	1046	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.665	MODELO
12330	1046	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.727	MODELO
12331	1045	18	3	\N	\N	\N	\N
12332	1045	19	3	\N	\N	\N	\N
12333	1045	20	1	\N	\N	\N	\N
12334	1045	21	2	\N	\N	\N	\N
12335	1045	22	2	\N	\N	\N	\N
12336	1045	23	2	\N	\N	\N	\N
12337	1045	24	2	\N	\N	\N	\N
12338	1045	27	1	\N	\N	\N	\N
12339	1045	28	2	\N	\N	\N	\N
12340	1045	29	1	\N	\N	\N	\N
12341	1045	30	2	\N	\N	\N	\N
12342	1045	31	1	\N	\N	\N	\N
12343	1045	32	1	\N	\N	\N	\N
12344	1045	33	1	\N	\N	\N	\N
12345	1045	34	1	\N	\N	\N	\N
12346	1045	35	2	\N	\N	\N	\N
12347	1045	36	1	\N	\N	\N	\N
12348	1045	37	1	\N	\N	\N	\N
12349	1045	38	1	\N	\N	\N	\N
12350	1045	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.823	MODELO
12351	1045	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.935	MODELO
12352	1044	18	1	\N	\N	\N	\N
12353	1044	19	1	\N	\N	\N	\N
12354	1044	20	1	\N	\N	\N	\N
12355	1044	21	1	\N	\N	\N	\N
12356	1044	22	3	\N	\N	\N	\N
12357	1044	23	2	\N	\N	\N	\N
12358	1044	24	1	\N	\N	\N	\N
12359	1044	27	1	\N	\N	\N	\N
12360	1044	28	2	\N	\N	\N	\N
12361	1044	29	1	\N	\N	\N	\N
12362	1044	30	1	\N	\N	\N	\N
12363	1044	31	2	\N	\N	\N	\N
12364	1044	32	2	\N	\N	\N	\N
12365	1044	33	2	\N	\N	\N	\N
12366	1044	34	3	\N	\N	\N	\N
12367	1044	35	1	\N	\N	\N	\N
12368	1044	36	2	\N	\N	\N	\N
12369	1044	37	2	\N	\N	\N	\N
12370	1044	38	2	\N	\N	\N	\N
12371	1044	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.924	MODELO
12372	1044	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.896	MODELO
12373	1043	18	1	\N	\N	\N	\N
12374	1043	19	3	\N	\N	\N	\N
12375	1043	20	1	\N	\N	\N	\N
12376	1043	21	4	\N	\N	\N	\N
12377	1043	22	1	\N	\N	\N	\N
12378	1043	23	1	\N	\N	\N	\N
12379	1043	24	1	\N	\N	\N	\N
12380	1043	27	2	\N	\N	\N	\N
12381	1043	28	4	\N	\N	\N	\N
12382	1043	29	1	\N	\N	\N	\N
12383	1043	30	2	\N	\N	\N	\N
12384	1043	31	1	\N	\N	\N	\N
12385	1043	32	2	\N	\N	\N	\N
12386	1043	33	2	\N	\N	\N	\N
12387	1043	34	2	\N	\N	\N	\N
12388	1043	35	2	\N	\N	\N	\N
12389	1043	36	1	\N	\N	\N	\N
12390	1043	37	1	\N	\N	\N	\N
12391	1043	38	1	\N	\N	\N	\N
12392	1043	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.893	MODELO
12393	1043	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.756	MODELO
12394	1042	18	1	\N	\N	\N	\N
12395	1042	19	1	\N	\N	\N	\N
12396	1042	20	2	\N	\N	\N	\N
12397	1042	21	3	\N	\N	\N	\N
12398	1042	22	1	\N	\N	\N	\N
12399	1042	23	1	\N	\N	\N	\N
12400	1042	24	2	\N	\N	\N	\N
12401	1042	27	2	\N	\N	\N	\N
12402	1042	28	2	\N	\N	\N	\N
12403	1042	29	3	\N	\N	\N	\N
12404	1042	30	1	\N	\N	\N	\N
12405	1042	31	3	\N	\N	\N	\N
12406	1042	32	2	\N	\N	\N	\N
12407	1042	33	4	\N	\N	\N	\N
12408	1042	34	2	\N	\N	\N	\N
12409	1042	35	3	\N	\N	\N	\N
12410	1042	36	1	\N	\N	\N	\N
12411	1042	37	1	\N	\N	\N	\N
12412	1042	38	4	\N	\N	\N	\N
12413	1042	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.757	MODELO
12414	1042	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.882	MODELO
12415	1041	18	1	\N	\N	\N	\N
12416	1041	19	2	\N	\N	\N	\N
12417	1041	20	2	\N	\N	\N	\N
12418	1041	21	1	\N	\N	\N	\N
12419	1041	22	3	\N	\N	\N	\N
12420	1041	23	1	\N	\N	\N	\N
12421	1041	24	1	\N	\N	\N	\N
12422	1041	27	2	\N	\N	\N	\N
12423	1041	28	1	\N	\N	\N	\N
12424	1041	29	1	\N	\N	\N	\N
12425	1041	30	2	\N	\N	\N	\N
12426	1041	31	1	\N	\N	\N	\N
12427	1041	32	1	\N	\N	\N	\N
12428	1041	33	2	\N	\N	\N	\N
12429	1041	34	2	\N	\N	\N	\N
12430	1041	35	2	\N	\N	\N	\N
12431	1041	36	1	\N	\N	\N	\N
12432	1041	37	3	\N	\N	\N	\N
12433	1041	38	2	\N	\N	\N	\N
12434	1041	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.787	MODELO
12435	1041	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.853	MODELO
12436	1040	18	2	\N	\N	\N	\N
12437	1040	19	4	\N	\N	\N	\N
12438	1040	20	2	\N	\N	\N	\N
12439	1040	21	2	\N	\N	\N	\N
12440	1040	22	2	\N	\N	\N	\N
12441	1040	23	1	\N	\N	\N	\N
12442	1040	24	1	\N	\N	\N	\N
12443	1040	27	2	\N	\N	\N	\N
12444	1040	28	1	\N	\N	\N	\N
12445	1040	29	2	\N	\N	\N	\N
12446	1040	30	3	\N	\N	\N	\N
12447	1040	31	3	\N	\N	\N	\N
12448	1040	32	3	\N	\N	\N	\N
12449	1040	33	3	\N	\N	\N	\N
12450	1040	34	2	\N	\N	\N	\N
12451	1040	35	2	\N	\N	\N	\N
12452	1040	36	2	\N	\N	\N	\N
12453	1040	37	3	\N	\N	\N	\N
12454	1040	38	2	\N	\N	\N	\N
12455	1040	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.882	MODELO
12456	1040	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.52	MODELO
12457	1039	18	3	\N	\N	\N	\N
12458	1039	19	2	\N	\N	\N	\N
12459	1039	20	1	\N	\N	\N	\N
12460	1039	21	2	\N	\N	\N	\N
12461	1039	22	2	\N	\N	\N	\N
12462	1039	23	1	\N	\N	\N	\N
12463	1039	24	1	\N	\N	\N	\N
12464	1039	27	1	\N	\N	\N	\N
12465	1039	28	2	\N	\N	\N	\N
12466	1039	29	1	\N	\N	\N	\N
12467	1039	30	1	\N	\N	\N	\N
12468	1039	31	1	\N	\N	\N	\N
12469	1039	32	2	\N	\N	\N	\N
12470	1039	33	2	\N	\N	\N	\N
12471	1039	34	2	\N	\N	\N	\N
12472	1039	35	2	\N	\N	\N	\N
12473	1039	36	2	\N	\N	\N	\N
12474	1039	37	1	\N	\N	\N	\N
12475	1039	38	2	\N	\N	\N	\N
12476	1039	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.893	MODELO
12477	1039	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.766	MODELO
12478	1038	18	3	\N	\N	\N	\N
12479	1038	19	1	\N	\N	\N	\N
12480	1038	20	1	\N	\N	\N	\N
12481	1038	21	1	\N	\N	\N	\N
12482	1038	22	2	\N	\N	\N	\N
12483	1038	23	3	\N	\N	\N	\N
12484	1038	24	1	\N	\N	\N	\N
12485	1038	27	1	\N	\N	\N	\N
12486	1038	28	2	\N	\N	\N	\N
12487	1038	29	2	\N	\N	\N	\N
12488	1038	30	2	\N	\N	\N	\N
12489	1038	31	2	\N	\N	\N	\N
12490	1038	32	3	\N	\N	\N	\N
12491	1038	33	2	\N	\N	\N	\N
12492	1038	34	2	\N	\N	\N	\N
12493	1038	35	1	\N	\N	\N	\N
12494	1038	36	1	\N	\N	\N	\N
12495	1038	37	1	\N	\N	\N	\N
12496	1038	38	4	\N	\N	\N	\N
12497	1038	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.908	MODELO
12498	1038	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.845	MODELO
12499	1037	18	2	\N	\N	\N	\N
12500	1037	19	2	\N	\N	\N	\N
12501	1037	20	2	\N	\N	\N	\N
12502	1037	21	1	\N	\N	\N	\N
12503	1037	22	4	\N	\N	\N	\N
12504	1037	23	1	\N	\N	\N	\N
12505	1037	24	2	\N	\N	\N	\N
12506	1037	27	1	\N	\N	\N	\N
12507	1037	28	2	\N	\N	\N	\N
12508	1037	29	1	\N	\N	\N	\N
12509	1037	30	2	\N	\N	\N	\N
12510	1037	31	1	\N	\N	\N	\N
12511	1037	32	1	\N	\N	\N	\N
12512	1037	33	1	\N	\N	\N	\N
12513	1037	34	2	\N	\N	\N	\N
12514	1037	35	3	\N	\N	\N	\N
12515	1037	36	2	\N	\N	\N	\N
12516	1037	37	1	\N	\N	\N	\N
12517	1037	38	2	\N	\N	\N	\N
12518	1037	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.963	MODELO
12519	1037	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.736	MODELO
12520	1036	18	2	\N	\N	\N	\N
12521	1036	19	2	\N	\N	\N	\N
12522	1036	20	2	\N	\N	\N	\N
12523	1036	21	1	\N	\N	\N	\N
12524	1036	22	2	\N	\N	\N	\N
12525	1036	23	2	\N	\N	\N	\N
12526	1036	24	2	\N	\N	\N	\N
12527	1036	27	3	\N	\N	\N	\N
12528	1036	28	2	\N	\N	\N	\N
12529	1036	29	2	\N	\N	\N	\N
12530	1036	30	2	\N	\N	\N	\N
12531	1036	31	1	\N	\N	\N	\N
12532	1036	32	1	\N	\N	\N	\N
12533	1036	33	4	\N	\N	\N	\N
12534	1036	34	1	\N	\N	\N	\N
12535	1036	35	1	\N	\N	\N	\N
12536	1036	36	2	\N	\N	\N	\N
12537	1036	37	1	\N	\N	\N	\N
12538	1036	38	1	\N	\N	\N	\N
12539	1036	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.863	MODELO
12540	1036	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.773	MODELO
12541	1035	18	4	\N	\N	\N	\N
12542	1035	19	2	\N	\N	\N	\N
12543	1035	20	2	\N	\N	\N	\N
12544	1035	21	2	\N	\N	\N	\N
12545	1035	22	1	\N	\N	\N	\N
12546	1035	23	2	\N	\N	\N	\N
12547	1035	24	2	\N	\N	\N	\N
12548	1035	27	2	\N	\N	\N	\N
12549	1035	28	1	\N	\N	\N	\N
12550	1035	29	1	\N	\N	\N	\N
12551	1035	30	2	\N	\N	\N	\N
12552	1035	31	1	\N	\N	\N	\N
12553	1035	32	1	\N	\N	\N	\N
12554	1035	33	2	\N	\N	\N	\N
12555	1035	34	3	\N	\N	\N	\N
12556	1035	35	2	\N	\N	\N	\N
12557	1035	36	1	\N	\N	\N	\N
12558	1035	37	1	\N	\N	\N	\N
12559	1035	38	2	\N	\N	\N	\N
12560	1035	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.751	MODELO
12561	1035	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.764	MODELO
12562	1034	18	2	\N	\N	\N	\N
12563	1034	19	1	\N	\N	\N	\N
12564	1034	20	1	\N	\N	\N	\N
12565	1034	21	1	\N	\N	\N	\N
12566	1034	22	1	\N	\N	\N	\N
12567	1034	23	2	\N	\N	\N	\N
12568	1034	24	3	\N	\N	\N	\N
12569	1034	27	4	\N	\N	\N	\N
12570	1034	28	3	\N	\N	\N	\N
12571	1034	29	1	\N	\N	\N	\N
12572	1034	30	1	\N	\N	\N	\N
12573	1034	31	1	\N	\N	\N	\N
12574	1034	32	1	\N	\N	\N	\N
12575	1034	33	1	\N	\N	\N	\N
12576	1034	34	1	\N	\N	\N	\N
12577	1034	35	4	\N	\N	\N	\N
12578	1034	36	2	\N	\N	\N	\N
12579	1034	37	2	\N	\N	\N	\N
12580	1034	38	4	\N	\N	\N	\N
12581	1034	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.719	MODELO
12582	1034	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.938	MODELO
12583	1033	18	1	\N	\N	\N	\N
12584	1033	19	2	\N	\N	\N	\N
12585	1033	20	1	\N	\N	\N	\N
12586	1033	21	1	\N	\N	\N	\N
12587	1033	22	3	\N	\N	\N	\N
12588	1033	23	4	\N	\N	\N	\N
12589	1033	24	1	\N	\N	\N	\N
12590	1033	27	2	\N	\N	\N	\N
12591	1033	28	1	\N	\N	\N	\N
12592	1033	29	3	\N	\N	\N	\N
12593	1033	30	3	\N	\N	\N	\N
12594	1033	31	3	\N	\N	\N	\N
12595	1033	32	1	\N	\N	\N	\N
12596	1033	33	3	\N	\N	\N	\N
12597	1033	34	1	\N	\N	\N	\N
12598	1033	35	2	\N	\N	\N	\N
12599	1033	36	2	\N	\N	\N	\N
12600	1033	37	2	\N	\N	\N	\N
12601	1033	38	1	\N	\N	\N	\N
12602	1033	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.794	MODELO
12603	1033	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.945	MODELO
12604	1032	18	2	\N	\N	\N	\N
12605	1032	19	2	\N	\N	\N	\N
12606	1032	20	3	\N	\N	\N	\N
12607	1032	21	2	\N	\N	\N	\N
12608	1032	22	2	\N	\N	\N	\N
12609	1032	23	2	\N	\N	\N	\N
12610	1032	24	4	\N	\N	\N	\N
12611	1032	27	1	\N	\N	\N	\N
12612	1032	28	1	\N	\N	\N	\N
12613	1032	29	1	\N	\N	\N	\N
12614	1032	30	1	\N	\N	\N	\N
12615	1032	31	2	\N	\N	\N	\N
12616	1032	32	2	\N	\N	\N	\N
12617	1032	33	1	\N	\N	\N	\N
12618	1032	34	1	\N	\N	\N	\N
12619	1032	35	2	\N	\N	\N	\N
12620	1032	36	1	\N	\N	\N	\N
12621	1032	37	2	\N	\N	\N	\N
12622	1032	38	2	\N	\N	\N	\N
12623	1032	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.565	MODELO
12624	1032	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.916	MODELO
12625	1031	18	1	\N	\N	\N	\N
12626	1031	19	4	\N	\N	\N	\N
12627	1031	20	1	\N	\N	\N	\N
12628	1031	21	3	\N	\N	\N	\N
12629	1031	22	2	\N	\N	\N	\N
12630	1031	23	1	\N	\N	\N	\N
12631	1031	24	2	\N	\N	\N	\N
12632	1031	27	1	\N	\N	\N	\N
12633	1031	28	1	\N	\N	\N	\N
12634	1031	29	1	\N	\N	\N	\N
12635	1031	30	1	\N	\N	\N	\N
12636	1031	31	3	\N	\N	\N	\N
12637	1031	32	1	\N	\N	\N	\N
12638	1031	33	1	\N	\N	\N	\N
12639	1031	34	1	\N	\N	\N	\N
12640	1031	35	1	\N	\N	\N	\N
12641	1031	36	1	\N	\N	\N	\N
12642	1031	37	1	\N	\N	\N	\N
12643	1031	38	2	\N	\N	\N	\N
12644	1031	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.897	MODELO
12645	1031	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.81	MODELO
12646	1030	18	1	\N	\N	\N	\N
12647	1030	19	2	\N	\N	\N	\N
12648	1030	20	2	\N	\N	\N	\N
12649	1030	21	3	\N	\N	\N	\N
12650	1030	22	2	\N	\N	\N	\N
12651	1030	23	2	\N	\N	\N	\N
12652	1030	24	3	\N	\N	\N	\N
12653	1030	27	2	\N	\N	\N	\N
12654	1030	28	1	\N	\N	\N	\N
12655	1030	29	2	\N	\N	\N	\N
12656	1030	30	3	\N	\N	\N	\N
12657	1030	31	1	\N	\N	\N	\N
12658	1030	32	2	\N	\N	\N	\N
12659	1030	33	1	\N	\N	\N	\N
12660	1030	34	1	\N	\N	\N	\N
12661	1030	35	3	\N	\N	\N	\N
12662	1030	36	2	\N	\N	\N	\N
12663	1030	37	2	\N	\N	\N	\N
12664	1030	38	2	\N	\N	\N	\N
12665	1030	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.972	MODELO
12666	1030	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.808	MODELO
12667	1029	18	2	\N	\N	\N	\N
12668	1029	19	2	\N	\N	\N	\N
12669	1029	20	1	\N	\N	\N	\N
12670	1029	21	2	\N	\N	\N	\N
12671	1029	22	2	\N	\N	\N	\N
12672	1029	23	1	\N	\N	\N	\N
12673	1029	24	1	\N	\N	\N	\N
12674	1029	27	2	\N	\N	\N	\N
12675	1029	28	2	\N	\N	\N	\N
12676	1029	29	1	\N	\N	\N	\N
12677	1029	30	2	\N	\N	\N	\N
12678	1029	31	1	\N	\N	\N	\N
12679	1029	32	1	\N	\N	\N	\N
12680	1029	33	2	\N	\N	\N	\N
12681	1029	34	1	\N	\N	\N	\N
12682	1029	35	2	\N	\N	\N	\N
12683	1029	36	2	\N	\N	\N	\N
12684	1029	37	1	\N	\N	\N	\N
12685	1029	38	4	\N	\N	\N	\N
12686	1029	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.945	MODELO
12687	1029	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.965	MODELO
12688	1028	18	3	\N	\N	\N	\N
12689	1028	19	2	\N	\N	\N	\N
12690	1028	20	3	\N	\N	\N	\N
12691	1028	21	3	\N	\N	\N	\N
12692	1028	22	3	\N	\N	\N	\N
12693	1028	23	1	\N	\N	\N	\N
12694	1028	24	2	\N	\N	\N	\N
12695	1028	27	2	\N	\N	\N	\N
12696	1028	28	1	\N	\N	\N	\N
12697	1028	29	1	\N	\N	\N	\N
12698	1028	30	2	\N	\N	\N	\N
12699	1028	31	1	\N	\N	\N	\N
12700	1028	32	1	\N	\N	\N	\N
12701	1028	33	2	\N	\N	\N	\N
12702	1028	34	1	\N	\N	\N	\N
12703	1028	35	1	\N	\N	\N	\N
12704	1028	36	1	\N	\N	\N	\N
12705	1028	37	4	\N	\N	\N	\N
12706	1028	38	3	\N	\N	\N	\N
12707	1028	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.729	MODELO
12708	1028	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.615	MODELO
12709	1027	18	4	\N	\N	\N	\N
12710	1027	19	1	\N	\N	\N	\N
12711	1027	20	1	\N	\N	\N	\N
12712	1027	21	1	\N	\N	\N	\N
12713	1027	22	1	\N	\N	\N	\N
12714	1027	23	3	\N	\N	\N	\N
12715	1027	24	1	\N	\N	\N	\N
12716	1027	27	2	\N	\N	\N	\N
12717	1027	28	1	\N	\N	\N	\N
12718	1027	29	1	\N	\N	\N	\N
12719	1027	30	1	\N	\N	\N	\N
12720	1027	31	2	\N	\N	\N	\N
12721	1027	32	1	\N	\N	\N	\N
12722	1027	33	2	\N	\N	\N	\N
12723	1027	34	2	\N	\N	\N	\N
12724	1027	35	4	\N	\N	\N	\N
12725	1027	36	1	\N	\N	\N	\N
12726	1027	37	3	\N	\N	\N	\N
12727	1027	38	3	\N	\N	\N	\N
12728	1027	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.978	MODELO
12729	1027	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.556	MODELO
12730	1026	18	2	\N	\N	\N	\N
12731	1026	19	1	\N	\N	\N	\N
12732	1026	20	3	\N	\N	\N	\N
12733	1026	21	2	\N	\N	\N	\N
12734	1026	22	2	\N	\N	\N	\N
12735	1026	23	2	\N	\N	\N	\N
12736	1026	24	1	\N	\N	\N	\N
12737	1026	27	1	\N	\N	\N	\N
12738	1026	28	1	\N	\N	\N	\N
12739	1026	29	2	\N	\N	\N	\N
12740	1026	30	1	\N	\N	\N	\N
12741	1026	31	3	\N	\N	\N	\N
12742	1026	32	2	\N	\N	\N	\N
12743	1026	33	2	\N	\N	\N	\N
12744	1026	34	2	\N	\N	\N	\N
12745	1026	35	2	\N	\N	\N	\N
12746	1026	36	2	\N	\N	\N	\N
12747	1026	37	2	\N	\N	\N	\N
12748	1026	38	1	\N	\N	\N	\N
12867	1020	31	1	\N	\N	\N	\N
12749	1026	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.747	MODELO
12750	1026	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.824	MODELO
12751	1025	18	1	\N	\N	\N	\N
12752	1025	19	1	\N	\N	\N	\N
12753	1025	20	1	\N	\N	\N	\N
12754	1025	21	1	\N	\N	\N	\N
12755	1025	22	1	\N	\N	\N	\N
12756	1025	23	2	\N	\N	\N	\N
12757	1025	24	1	\N	\N	\N	\N
12758	1025	27	3	\N	\N	\N	\N
12759	1025	28	1	\N	\N	\N	\N
12760	1025	29	1	\N	\N	\N	\N
12761	1025	30	1	\N	\N	\N	\N
12762	1025	31	1	\N	\N	\N	\N
12763	1025	32	2	\N	\N	\N	\N
12764	1025	33	1	\N	\N	\N	\N
12765	1025	34	3	\N	\N	\N	\N
12766	1025	35	1	\N	\N	\N	\N
12767	1025	36	1	\N	\N	\N	\N
12768	1025	37	1	\N	\N	\N	\N
12769	1025	38	3	\N	\N	\N	\N
12770	1025	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.748	MODELO
12771	1025	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.67	MODELO
12772	1024	18	2	\N	\N	\N	\N
12773	1024	19	3	\N	\N	\N	\N
12774	1024	20	2	\N	\N	\N	\N
12775	1024	21	1	\N	\N	\N	\N
12776	1024	22	1	\N	\N	\N	\N
12777	1024	23	1	\N	\N	\N	\N
12778	1024	24	1	\N	\N	\N	\N
12779	1024	27	1	\N	\N	\N	\N
12780	1024	28	2	\N	\N	\N	\N
12781	1024	29	1	\N	\N	\N	\N
12782	1024	30	2	\N	\N	\N	\N
12783	1024	31	2	\N	\N	\N	\N
12784	1024	32	3	\N	\N	\N	\N
12785	1024	33	1	\N	\N	\N	\N
12786	1024	34	1	\N	\N	\N	\N
12787	1024	35	2	\N	\N	\N	\N
12788	1024	36	1	\N	\N	\N	\N
12789	1024	37	2	\N	\N	\N	\N
12790	1024	38	2	\N	\N	\N	\N
12791	1024	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.814	MODELO
12792	1024	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.805	MODELO
12793	1023	18	2	\N	\N	\N	\N
12794	1023	19	4	\N	\N	\N	\N
12795	1023	20	3	\N	\N	\N	\N
12796	1023	21	3	\N	\N	\N	\N
12797	1023	22	1	\N	\N	\N	\N
12798	1023	23	1	\N	\N	\N	\N
12799	1023	24	1	\N	\N	\N	\N
12800	1023	27	1	\N	\N	\N	\N
12801	1023	28	1	\N	\N	\N	\N
12802	1023	29	2	\N	\N	\N	\N
12803	1023	30	1	\N	\N	\N	\N
12804	1023	31	2	\N	\N	\N	\N
12805	1023	32	3	\N	\N	\N	\N
12806	1023	33	1	\N	\N	\N	\N
12807	1023	34	4	\N	\N	\N	\N
12808	1023	35	1	\N	\N	\N	\N
12809	1023	36	1	\N	\N	\N	\N
12810	1023	37	2	\N	\N	\N	\N
12811	1023	38	1	\N	\N	\N	\N
12812	1023	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.751	MODELO
12813	1023	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.826	MODELO
12814	1022	18	3	\N	\N	\N	\N
12815	1022	19	2	\N	\N	\N	\N
12816	1022	20	2	\N	\N	\N	\N
12817	1022	21	2	\N	\N	\N	\N
12818	1022	22	1	\N	\N	\N	\N
12819	1022	23	1	\N	\N	\N	\N
12820	1022	24	3	\N	\N	\N	\N
12821	1022	27	1	\N	\N	\N	\N
12822	1022	28	1	\N	\N	\N	\N
12823	1022	29	1	\N	\N	\N	\N
12824	1022	30	1	\N	\N	\N	\N
12825	1022	31	2	\N	\N	\N	\N
12826	1022	32	1	\N	\N	\N	\N
12827	1022	33	2	\N	\N	\N	\N
12828	1022	34	1	\N	\N	\N	\N
12829	1022	35	1	\N	\N	\N	\N
12830	1022	36	1	\N	\N	\N	\N
12831	1022	37	1	\N	\N	\N	\N
12832	1022	38	1	\N	\N	\N	\N
12833	1022	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.938	MODELO
12834	1022	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.976	MODELO
12835	1021	18	2	\N	\N	\N	\N
12836	1021	19	2	\N	\N	\N	\N
12837	1021	20	2	\N	\N	\N	\N
12838	1021	21	2	\N	\N	\N	\N
12839	1021	22	1	\N	\N	\N	\N
12840	1021	23	1	\N	\N	\N	\N
12841	1021	24	1	\N	\N	\N	\N
12842	1021	27	2	\N	\N	\N	\N
12843	1021	28	1	\N	\N	\N	\N
12844	1021	29	1	\N	\N	\N	\N
12845	1021	30	2	\N	\N	\N	\N
12846	1021	31	3	\N	\N	\N	\N
12847	1021	32	3	\N	\N	\N	\N
12848	1021	33	1	\N	\N	\N	\N
12849	1021	34	2	\N	\N	\N	\N
12850	1021	35	2	\N	\N	\N	\N
12851	1021	36	2	\N	\N	\N	\N
12852	1021	37	1	\N	\N	\N	\N
12853	1021	38	1	\N	\N	\N	\N
12854	1021	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.579	MODELO
12855	1021	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.774	MODELO
12856	1020	18	4	\N	\N	\N	\N
12857	1020	19	3	\N	\N	\N	\N
12858	1020	20	1	\N	\N	\N	\N
12859	1020	21	4	\N	\N	\N	\N
12860	1020	22	1	\N	\N	\N	\N
12861	1020	23	1	\N	\N	\N	\N
12862	1020	24	2	\N	\N	\N	\N
12863	1020	27	1	\N	\N	\N	\N
12864	1020	28	1	\N	\N	\N	\N
12865	1020	29	1	\N	\N	\N	\N
12866	1020	30	2	\N	\N	\N	\N
12868	1020	32	1	\N	\N	\N	\N
12869	1020	33	2	\N	\N	\N	\N
12870	1020	34	3	\N	\N	\N	\N
12871	1020	35	1	\N	\N	\N	\N
12872	1020	36	2	\N	\N	\N	\N
12873	1020	37	1	\N	\N	\N	\N
12874	1020	38	1	\N	\N	\N	\N
12875	1020	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.818	MODELO
12876	1020	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.822	MODELO
12877	1019	18	4	\N	\N	\N	\N
12878	1019	19	2	\N	\N	\N	\N
12879	1019	20	2	\N	\N	\N	\N
12880	1019	21	2	\N	\N	\N	\N
12881	1019	22	1	\N	\N	\N	\N
12882	1019	23	1	\N	\N	\N	\N
12883	1019	24	1	\N	\N	\N	\N
12884	1019	27	1	\N	\N	\N	\N
12885	1019	28	1	\N	\N	\N	\N
12886	1019	29	1	\N	\N	\N	\N
12887	1019	30	3	\N	\N	\N	\N
12888	1019	31	2	\N	\N	\N	\N
12889	1019	32	1	\N	\N	\N	\N
12890	1019	33	1	\N	\N	\N	\N
12891	1019	34	1	\N	\N	\N	\N
12892	1019	35	1	\N	\N	\N	\N
12893	1019	36	1	\N	\N	\N	\N
12894	1019	37	1	\N	\N	\N	\N
12895	1019	38	1	\N	\N	\N	\N
12896	1019	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.783	MODELO
12897	1019	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.81	MODELO
12898	1018	18	1	\N	\N	\N	\N
12899	1018	19	2	\N	\N	\N	\N
12900	1018	20	2	\N	\N	\N	\N
12901	1018	21	1	\N	\N	\N	\N
12902	1018	22	2	\N	\N	\N	\N
12903	1018	23	3	\N	\N	\N	\N
12904	1018	24	4	\N	\N	\N	\N
12905	1018	27	1	\N	\N	\N	\N
12906	1018	28	4	\N	\N	\N	\N
12907	1018	29	1	\N	\N	\N	\N
12908	1018	30	1	\N	\N	\N	\N
12909	1018	31	1	\N	\N	\N	\N
12910	1018	32	2	\N	\N	\N	\N
12911	1018	33	3	\N	\N	\N	\N
12912	1018	34	2	\N	\N	\N	\N
12913	1018	35	2	\N	\N	\N	\N
12914	1018	36	1	\N	\N	\N	\N
12915	1018	37	3	\N	\N	\N	\N
12916	1018	38	1	\N	\N	\N	\N
12917	1018	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.719	MODELO
12918	1018	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.71	MODELO
12919	1017	18	2	\N	\N	\N	\N
12920	1017	19	1	\N	\N	\N	\N
12921	1017	20	3	\N	\N	\N	\N
12922	1017	21	3	\N	\N	\N	\N
12923	1017	22	3	\N	\N	\N	\N
12924	1017	23	1	\N	\N	\N	\N
12925	1017	24	1	\N	\N	\N	\N
12926	1017	27	2	\N	\N	\N	\N
12927	1017	28	3	\N	\N	\N	\N
12928	1017	29	3	\N	\N	\N	\N
12929	1017	30	2	\N	\N	\N	\N
12930	1017	31	2	\N	\N	\N	\N
12931	1017	32	1	\N	\N	\N	\N
12932	1017	33	1	\N	\N	\N	\N
12933	1017	34	1	\N	\N	\N	\N
12934	1017	35	2	\N	\N	\N	\N
12935	1017	36	3	\N	\N	\N	\N
12936	1017	37	1	\N	\N	\N	\N
12937	1017	38	2	\N	\N	\N	\N
12938	1017	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.783	MODELO
12939	1017	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.725	MODELO
12940	1016	18	2	\N	\N	\N	\N
12941	1016	19	3	\N	\N	\N	\N
12942	1016	20	2	\N	\N	\N	\N
12943	1016	21	2	\N	\N	\N	\N
12944	1016	22	3	\N	\N	\N	\N
12945	1016	23	1	\N	\N	\N	\N
12946	1016	24	3	\N	\N	\N	\N
12947	1016	27	1	\N	\N	\N	\N
12948	1016	28	3	\N	\N	\N	\N
12949	1016	29	1	\N	\N	\N	\N
12950	1016	30	2	\N	\N	\N	\N
12951	1016	31	1	\N	\N	\N	\N
12952	1016	32	1	\N	\N	\N	\N
12953	1016	33	2	\N	\N	\N	\N
12954	1016	34	1	\N	\N	\N	\N
12955	1016	35	1	\N	\N	\N	\N
12956	1016	36	4	\N	\N	\N	\N
12957	1016	37	1	\N	\N	\N	\N
12958	1016	38	3	\N	\N	\N	\N
12959	1016	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.872	MODELO
12960	1016	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.926	MODELO
12961	1015	18	2	\N	\N	\N	\N
12962	1015	19	1	\N	\N	\N	\N
12963	1015	20	2	\N	\N	\N	\N
12964	1015	21	1	\N	\N	\N	\N
12965	1015	22	1	\N	\N	\N	\N
12966	1015	23	3	\N	\N	\N	\N
12967	1015	24	1	\N	\N	\N	\N
12968	1015	27	1	\N	\N	\N	\N
12969	1015	28	1	\N	\N	\N	\N
12970	1015	29	2	\N	\N	\N	\N
12971	1015	30	1	\N	\N	\N	\N
12972	1015	31	4	\N	\N	\N	\N
12973	1015	32	2	\N	\N	\N	\N
12974	1015	33	1	\N	\N	\N	\N
12975	1015	34	1	\N	\N	\N	\N
12976	1015	35	3	\N	\N	\N	\N
12977	1015	36	1	\N	\N	\N	\N
12978	1015	37	2	\N	\N	\N	\N
12979	1015	38	3	\N	\N	\N	\N
12980	1015	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.906	MODELO
12981	1015	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.762	MODELO
12982	1014	18	1	\N	\N	\N	\N
12983	1014	19	1	\N	\N	\N	\N
12984	1014	20	1	\N	\N	\N	\N
12985	1014	21	2	\N	\N	\N	\N
12986	1014	22	1	\N	\N	\N	\N
12987	1014	23	1	\N	\N	\N	\N
12988	1014	24	1	\N	\N	\N	\N
12989	1014	27	4	\N	\N	\N	\N
12990	1014	28	1	\N	\N	\N	\N
12991	1014	29	1	\N	\N	\N	\N
12992	1014	30	1	\N	\N	\N	\N
12993	1014	31	1	\N	\N	\N	\N
12994	1014	32	1	\N	\N	\N	\N
12995	1014	33	2	\N	\N	\N	\N
12996	1014	34	1	\N	\N	\N	\N
12997	1014	35	3	\N	\N	\N	\N
12998	1014	36	2	\N	\N	\N	\N
12999	1014	37	2	\N	\N	\N	\N
13000	1014	38	1	\N	\N	\N	\N
13001	1014	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.877	MODELO
13002	1014	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.943	MODELO
13003	1013	18	2	\N	\N	\N	\N
13004	1013	19	1	\N	\N	\N	\N
13005	1013	20	1	\N	\N	\N	\N
13006	1013	21	2	\N	\N	\N	\N
13007	1013	22	3	\N	\N	\N	\N
13008	1013	23	3	\N	\N	\N	\N
13009	1013	24	4	\N	\N	\N	\N
13010	1013	27	1	\N	\N	\N	\N
13011	1013	28	2	\N	\N	\N	\N
13012	1013	29	1	\N	\N	\N	\N
13013	1013	30	1	\N	\N	\N	\N
13014	1013	31	3	\N	\N	\N	\N
13015	1013	32	2	\N	\N	\N	\N
13016	1013	33	1	\N	\N	\N	\N
13017	1013	34	1	\N	\N	\N	\N
13018	1013	35	2	\N	\N	\N	\N
13019	1013	36	1	\N	\N	\N	\N
13020	1013	37	3	\N	\N	\N	\N
13021	1013	38	1	\N	\N	\N	\N
13022	1013	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.866	MODELO
13023	1013	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.821	MODELO
13024	1012	18	3	\N	\N	\N	\N
13025	1012	19	1	\N	\N	\N	\N
13026	1012	20	2	\N	\N	\N	\N
13027	1012	21	1	\N	\N	\N	\N
13028	1012	22	1	\N	\N	\N	\N
13029	1012	23	1	\N	\N	\N	\N
13030	1012	24	1	\N	\N	\N	\N
13031	1012	27	3	\N	\N	\N	\N
13032	1012	28	1	\N	\N	\N	\N
13033	1012	29	2	\N	\N	\N	\N
13034	1012	30	2	\N	\N	\N	\N
13035	1012	31	2	\N	\N	\N	\N
13036	1012	32	1	\N	\N	\N	\N
13037	1012	33	2	\N	\N	\N	\N
13038	1012	34	1	\N	\N	\N	\N
13039	1012	35	1	\N	\N	\N	\N
13040	1012	36	2	\N	\N	\N	\N
13041	1012	37	1	\N	\N	\N	\N
13042	1012	38	2	\N	\N	\N	\N
13043	1012	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.808	MODELO
13044	1012	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.75	MODELO
13045	1011	18	1	\N	\N	\N	\N
13046	1011	19	2	\N	\N	\N	\N
13047	1011	20	2	\N	\N	\N	\N
13048	1011	21	2	\N	\N	\N	\N
13049	1011	22	2	\N	\N	\N	\N
13050	1011	23	3	\N	\N	\N	\N
13051	1011	24	1	\N	\N	\N	\N
13052	1011	27	1	\N	\N	\N	\N
13053	1011	28	1	\N	\N	\N	\N
13054	1011	29	1	\N	\N	\N	\N
13055	1011	30	1	\N	\N	\N	\N
13056	1011	31	3	\N	\N	\N	\N
13057	1011	32	1	\N	\N	\N	\N
13058	1011	33	4	\N	\N	\N	\N
13059	1011	34	1	\N	\N	\N	\N
13060	1011	35	2	\N	\N	\N	\N
13061	1011	36	1	\N	\N	\N	\N
13062	1011	37	1	\N	\N	\N	\N
13063	1011	38	2	\N	\N	\N	\N
13064	1011	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.889	MODELO
13065	1011	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.848	MODELO
13066	1010	18	2	\N	\N	\N	\N
13067	1010	19	1	\N	\N	\N	\N
13068	1010	20	1	\N	\N	\N	\N
13069	1010	21	2	\N	\N	\N	\N
13070	1010	22	1	\N	\N	\N	\N
13071	1010	23	1	\N	\N	\N	\N
13072	1010	24	1	\N	\N	\N	\N
13073	1010	27	1	\N	\N	\N	\N
13074	1010	28	3	\N	\N	\N	\N
13075	1010	29	2	\N	\N	\N	\N
13076	1010	30	1	\N	\N	\N	\N
13077	1010	31	1	\N	\N	\N	\N
13078	1010	32	3	\N	\N	\N	\N
13079	1010	33	1	\N	\N	\N	\N
13080	1010	34	2	\N	\N	\N	\N
13081	1010	35	3	\N	\N	\N	\N
13082	1010	36	1	\N	\N	\N	\N
13083	1010	37	2	\N	\N	\N	\N
13084	1010	38	1	\N	\N	\N	\N
13085	1010	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.75	MODELO
13086	1010	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.845	MODELO
13087	1009	18	2	\N	\N	\N	\N
13088	1009	19	1	\N	\N	\N	\N
13089	1009	20	2	\N	\N	\N	\N
13090	1009	21	1	\N	\N	\N	\N
13091	1009	22	4	\N	\N	\N	\N
13092	1009	23	2	\N	\N	\N	\N
13093	1009	24	2	\N	\N	\N	\N
13094	1009	27	2	\N	\N	\N	\N
13095	1009	28	1	\N	\N	\N	\N
13096	1009	29	1	\N	\N	\N	\N
13097	1009	30	1	\N	\N	\N	\N
13098	1009	31	4	\N	\N	\N	\N
13099	1009	32	2	\N	\N	\N	\N
13100	1009	33	4	\N	\N	\N	\N
13101	1009	34	1	\N	\N	\N	\N
13102	1009	35	1	\N	\N	\N	\N
13103	1009	36	1	\N	\N	\N	\N
13104	1009	37	2	\N	\N	\N	\N
13105	1009	38	1	\N	\N	\N	\N
13106	1009	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.717	MODELO
13107	1009	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.912	MODELO
13108	611	18	2	\N	\N	\N	\N
13109	611	19	1	\N	\N	\N	\N
13110	611	20	3	\N	\N	\N	\N
13111	611	21	3	\N	\N	\N	\N
13112	611	22	3	\N	\N	\N	\N
13113	611	23	3	\N	\N	\N	\N
13114	611	24	2	\N	\N	\N	\N
13115	611	27	1	\N	\N	\N	\N
13116	611	28	3	\N	\N	\N	\N
13117	611	29	4	\N	\N	\N	\N
13118	611	30	3	\N	\N	\N	\N
13119	611	31	2	\N	\N	\N	\N
13120	611	32	4	\N	\N	\N	\N
13121	611	33	2	\N	\N	\N	\N
13122	611	34	4	\N	\N	\N	\N
13123	611	35	3	\N	\N	\N	\N
13124	611	36	3	\N	\N	\N	\N
13125	611	37	3	\N	\N	\N	\N
13126	611	38	3	\N	\N	\N	\N
13127	611	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.862	MODELO
13128	611	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.865	MODELO
13129	610	18	1	\N	\N	\N	\N
13130	610	19	2	\N	\N	\N	\N
13131	610	20	3	\N	\N	\N	\N
13132	610	21	2	\N	\N	\N	\N
13133	610	22	3	\N	\N	\N	\N
13134	610	23	3	\N	\N	\N	\N
13135	610	24	3	\N	\N	\N	\N
13136	610	27	2	\N	\N	\N	\N
13137	610	28	4	\N	\N	\N	\N
13138	610	29	1	\N	\N	\N	\N
13139	610	30	4	\N	\N	\N	\N
13140	610	31	1	\N	\N	\N	\N
13141	610	32	1	\N	\N	\N	\N
13142	610	33	4	\N	\N	\N	\N
13143	610	34	2	\N	\N	\N	\N
13144	610	35	3	\N	\N	\N	\N
13145	610	36	2	\N	\N	\N	\N
13146	610	37	2	\N	\N	\N	\N
13147	610	38	2	\N	\N	\N	\N
13148	610	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.977	MODELO
13149	610	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.601	MODELO
13150	609	18	3	\N	\N	\N	\N
13151	609	19	3	\N	\N	\N	\N
13152	609	20	3	\N	\N	\N	\N
13153	609	21	3	\N	\N	\N	\N
13154	609	22	2	\N	\N	\N	\N
13155	609	23	2	\N	\N	\N	\N
13156	609	24	2	\N	\N	\N	\N
13157	609	27	2	\N	\N	\N	\N
13158	609	28	2	\N	\N	\N	\N
13159	609	29	3	\N	\N	\N	\N
13160	609	30	3	\N	\N	\N	\N
13161	609	31	3	\N	\N	\N	\N
13162	609	32	3	\N	\N	\N	\N
13163	609	33	2	\N	\N	\N	\N
13164	609	34	4	\N	\N	\N	\N
13165	609	35	2	\N	\N	\N	\N
13166	609	36	2	\N	\N	\N	\N
13167	609	37	2	\N	\N	\N	\N
13168	609	38	2	\N	\N	\N	\N
13169	609	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.742	MODELO
13170	609	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.88	MODELO
13171	608	18	4	\N	\N	\N	\N
13172	608	19	2	\N	\N	\N	\N
13173	608	20	3	\N	\N	\N	\N
13174	608	21	2	\N	\N	\N	\N
13175	608	22	2	\N	\N	\N	\N
13176	608	23	2	\N	\N	\N	\N
13177	608	24	4	\N	\N	\N	\N
13178	608	27	2	\N	\N	\N	\N
13179	608	28	2	\N	\N	\N	\N
13180	608	29	3	\N	\N	\N	\N
13181	608	30	2	\N	\N	\N	\N
13182	608	31	3	\N	\N	\N	\N
13183	608	32	2	\N	\N	\N	\N
13184	608	33	2	\N	\N	\N	\N
13185	608	34	3	\N	\N	\N	\N
13186	608	35	2	\N	\N	\N	\N
13187	608	36	3	\N	\N	\N	\N
13188	608	37	4	\N	\N	\N	\N
13189	608	38	4	\N	\N	\N	\N
13190	608	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.849	MODELO
13191	608	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.622	MODELO
13192	607	18	1	\N	\N	\N	\N
13193	607	19	2	\N	\N	\N	\N
13194	607	20	3	\N	\N	\N	\N
13195	607	21	3	\N	\N	\N	\N
13196	607	22	2	\N	\N	\N	\N
13197	607	23	3	\N	\N	\N	\N
13198	607	24	3	\N	\N	\N	\N
13199	607	27	2	\N	\N	\N	\N
13200	607	28	2	\N	\N	\N	\N
13201	607	29	3	\N	\N	\N	\N
13202	607	30	2	\N	\N	\N	\N
13203	607	31	2	\N	\N	\N	\N
13204	607	32	3	\N	\N	\N	\N
13205	607	33	2	\N	\N	\N	\N
13206	607	34	2	\N	\N	\N	\N
13207	607	35	3	\N	\N	\N	\N
13208	607	36	1	\N	\N	\N	\N
13209	607	37	3	\N	\N	\N	\N
13210	607	38	3	\N	\N	\N	\N
13211	607	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.81	MODELO
13212	607	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.938	MODELO
13213	606	18	1	\N	\N	\N	\N
13214	606	19	2	\N	\N	\N	\N
13215	606	20	2	\N	\N	\N	\N
13216	606	21	4	\N	\N	\N	\N
13217	606	22	2	\N	\N	\N	\N
13218	606	23	3	\N	\N	\N	\N
13219	606	24	2	\N	\N	\N	\N
13220	606	27	4	\N	\N	\N	\N
13221	606	28	3	\N	\N	\N	\N
13222	606	29	2	\N	\N	\N	\N
13223	606	30	2	\N	\N	\N	\N
13224	606	31	4	\N	\N	\N	\N
13225	606	32	2	\N	\N	\N	\N
13226	606	33	3	\N	\N	\N	\N
13227	606	34	2	\N	\N	\N	\N
13228	606	35	3	\N	\N	\N	\N
13229	606	36	4	\N	\N	\N	\N
13230	606	37	3	\N	\N	\N	\N
13231	606	38	3	\N	\N	\N	\N
13232	606	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.966	MODELO
13233	606	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.707	MODELO
13234	605	18	3	\N	\N	\N	\N
13235	605	19	2	\N	\N	\N	\N
13236	605	20	2	\N	\N	\N	\N
13237	605	21	4	\N	\N	\N	\N
13238	605	22	3	\N	\N	\N	\N
13239	605	23	2	\N	\N	\N	\N
13240	605	24	3	\N	\N	\N	\N
13241	605	27	3	\N	\N	\N	\N
13242	605	28	3	\N	\N	\N	\N
13243	605	29	4	\N	\N	\N	\N
13244	605	30	2	\N	\N	\N	\N
13245	605	31	3	\N	\N	\N	\N
13246	605	32	3	\N	\N	\N	\N
13247	605	33	2	\N	\N	\N	\N
13248	605	34	2	\N	\N	\N	\N
13249	605	35	2	\N	\N	\N	\N
13250	605	36	3	\N	\N	\N	\N
13251	605	37	2	\N	\N	\N	\N
13252	605	38	2	\N	\N	\N	\N
13253	605	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.867	MODELO
13254	605	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.536	MODELO
13255	604	18	4	\N	\N	\N	\N
13256	604	19	3	\N	\N	\N	\N
13257	604	20	3	\N	\N	\N	\N
13258	604	21	2	\N	\N	\N	\N
13259	604	22	3	\N	\N	\N	\N
13260	604	23	2	\N	\N	\N	\N
13261	604	24	3	\N	\N	\N	\N
13262	604	27	3	\N	\N	\N	\N
13263	604	28	2	\N	\N	\N	\N
13264	604	29	1	\N	\N	\N	\N
13265	604	30	2	\N	\N	\N	\N
13266	604	31	4	\N	\N	\N	\N
13267	604	32	3	\N	\N	\N	\N
13268	604	33	1	\N	\N	\N	\N
13269	604	34	3	\N	\N	\N	\N
13270	604	35	2	\N	\N	\N	\N
13271	604	36	4	\N	\N	\N	\N
13272	604	37	3	\N	\N	\N	\N
13273	604	38	3	\N	\N	\N	\N
13274	604	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.905	MODELO
13275	604	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.682	MODELO
13276	603	18	2	\N	\N	\N	\N
13277	603	19	1	\N	\N	\N	\N
13278	603	20	3	\N	\N	\N	\N
13279	603	21	3	\N	\N	\N	\N
13280	603	22	2	\N	\N	\N	\N
13281	603	23	3	\N	\N	\N	\N
13282	603	24	2	\N	\N	\N	\N
13283	603	27	2	\N	\N	\N	\N
13284	603	28	2	\N	\N	\N	\N
13285	603	29	1	\N	\N	\N	\N
13286	603	30	1	\N	\N	\N	\N
13287	603	31	2	\N	\N	\N	\N
13288	603	32	2	\N	\N	\N	\N
13289	603	33	3	\N	\N	\N	\N
13290	603	34	2	\N	\N	\N	\N
13291	603	35	2	\N	\N	\N	\N
13292	603	36	3	\N	\N	\N	\N
13293	603	37	4	\N	\N	\N	\N
13294	603	38	3	\N	\N	\N	\N
13295	603	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.766	MODELO
13296	603	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.622	MODELO
13297	602	18	1	\N	\N	\N	\N
13298	602	19	3	\N	\N	\N	\N
13299	602	20	3	\N	\N	\N	\N
13300	602	21	3	\N	\N	\N	\N
13301	602	22	2	\N	\N	\N	\N
13302	602	23	2	\N	\N	\N	\N
13303	602	24	4	\N	\N	\N	\N
13304	602	27	1	\N	\N	\N	\N
13305	602	28	3	\N	\N	\N	\N
13306	602	29	3	\N	\N	\N	\N
13307	602	30	3	\N	\N	\N	\N
13308	602	31	1	\N	\N	\N	\N
13309	602	32	3	\N	\N	\N	\N
13310	602	33	3	\N	\N	\N	\N
13311	602	34	2	\N	\N	\N	\N
13312	602	35	3	\N	\N	\N	\N
13313	602	36	2	\N	\N	\N	\N
13314	602	37	3	\N	\N	\N	\N
13315	602	38	2	\N	\N	\N	\N
13316	602	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.896	MODELO
13317	602	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.918	MODELO
13318	601	18	3	\N	\N	\N	\N
13319	601	19	2	\N	\N	\N	\N
13320	601	20	3	\N	\N	\N	\N
13321	601	21	2	\N	\N	\N	\N
13322	601	22	2	\N	\N	\N	\N
13323	601	23	4	\N	\N	\N	\N
13324	601	24	3	\N	\N	\N	\N
13325	601	27	2	\N	\N	\N	\N
13326	601	28	4	\N	\N	\N	\N
13327	601	29	2	\N	\N	\N	\N
13328	601	30	3	\N	\N	\N	\N
13329	601	31	3	\N	\N	\N	\N
13330	601	32	4	\N	\N	\N	\N
13331	601	33	2	\N	\N	\N	\N
13332	601	34	4	\N	\N	\N	\N
13333	601	35	2	\N	\N	\N	\N
13334	601	36	3	\N	\N	\N	\N
13335	601	37	2	\N	\N	\N	\N
13336	601	38	2	\N	\N	\N	\N
13337	601	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.882	MODELO
13455	595	31	2	\N	\N	\N	\N
13456	595	32	1	\N	\N	\N	\N
13338	601	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.94	MODELO
13339	600	18	2	\N	\N	\N	\N
13340	600	19	2	\N	\N	\N	\N
13341	600	20	4	\N	\N	\N	\N
13342	600	21	2	\N	\N	\N	\N
13343	600	22	3	\N	\N	\N	\N
13344	600	23	3	\N	\N	\N	\N
13345	600	24	3	\N	\N	\N	\N
13346	600	27	4	\N	\N	\N	\N
13347	600	28	3	\N	\N	\N	\N
13348	600	29	2	\N	\N	\N	\N
13349	600	30	2	\N	\N	\N	\N
13350	600	31	1	\N	\N	\N	\N
13351	600	32	2	\N	\N	\N	\N
13352	600	33	2	\N	\N	\N	\N
13353	600	34	2	\N	\N	\N	\N
13354	600	35	2	\N	\N	\N	\N
13355	600	36	3	\N	\N	\N	\N
13356	600	37	2	\N	\N	\N	\N
13357	600	38	2	\N	\N	\N	\N
13358	600	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.966	MODELO
13359	600	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.557	MODELO
13360	599	18	2	\N	\N	\N	\N
13361	599	19	2	\N	\N	\N	\N
13362	599	20	2	\N	\N	\N	\N
13363	599	21	3	\N	\N	\N	\N
13364	599	22	2	\N	\N	\N	\N
13365	599	23	4	\N	\N	\N	\N
13366	599	24	3	\N	\N	\N	\N
13367	599	27	2	\N	\N	\N	\N
13368	599	28	1	\N	\N	\N	\N
13369	599	29	3	\N	\N	\N	\N
13370	599	30	2	\N	\N	\N	\N
13371	599	31	2	\N	\N	\N	\N
13372	599	32	2	\N	\N	\N	\N
13373	599	33	3	\N	\N	\N	\N
13374	599	34	1	\N	\N	\N	\N
13375	599	35	2	\N	\N	\N	\N
13376	599	36	3	\N	\N	\N	\N
13377	599	37	2	\N	\N	\N	\N
13378	599	38	3	\N	\N	\N	\N
13379	599	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.901	MODELO
13380	599	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.612	MODELO
13381	598	18	2	\N	\N	\N	\N
13382	598	19	2	\N	\N	\N	\N
13383	598	20	3	\N	\N	\N	\N
13384	598	21	3	\N	\N	\N	\N
13385	598	22	4	\N	\N	\N	\N
13386	598	23	3	\N	\N	\N	\N
13387	598	24	3	\N	\N	\N	\N
13388	598	27	2	\N	\N	\N	\N
13389	598	28	2	\N	\N	\N	\N
13390	598	29	3	\N	\N	\N	\N
13391	598	30	3	\N	\N	\N	\N
13392	598	31	3	\N	\N	\N	\N
13393	598	32	1	\N	\N	\N	\N
13394	598	33	2	\N	\N	\N	\N
13395	598	34	3	\N	\N	\N	\N
13396	598	35	3	\N	\N	\N	\N
13397	598	36	3	\N	\N	\N	\N
13398	598	37	3	\N	\N	\N	\N
13399	598	38	3	\N	\N	\N	\N
13400	598	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.725	MODELO
13401	598	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.989	MODELO
13402	597	18	2	\N	\N	\N	\N
13403	597	19	4	\N	\N	\N	\N
13404	597	20	2	\N	\N	\N	\N
13405	597	21	4	\N	\N	\N	\N
13406	597	22	1	\N	\N	\N	\N
13407	597	23	3	\N	\N	\N	\N
13408	597	24	3	\N	\N	\N	\N
13409	597	27	3	\N	\N	\N	\N
13410	597	28	2	\N	\N	\N	\N
13411	597	29	3	\N	\N	\N	\N
13412	597	30	3	\N	\N	\N	\N
13413	597	31	3	\N	\N	\N	\N
13414	597	32	3	\N	\N	\N	\N
13415	597	33	4	\N	\N	\N	\N
13416	597	34	3	\N	\N	\N	\N
13417	597	35	3	\N	\N	\N	\N
13418	597	36	2	\N	\N	\N	\N
13419	597	37	3	\N	\N	\N	\N
13420	597	38	4	\N	\N	\N	\N
13421	597	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.722	MODELO
13422	597	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.702	MODELO
13423	596	18	1	\N	\N	\N	\N
13424	596	19	3	\N	\N	\N	\N
13425	596	20	2	\N	\N	\N	\N
13426	596	21	3	\N	\N	\N	\N
13427	596	22	2	\N	\N	\N	\N
13428	596	23	3	\N	\N	\N	\N
13429	596	24	2	\N	\N	\N	\N
13430	596	27	3	\N	\N	\N	\N
13431	596	28	2	\N	\N	\N	\N
13432	596	29	4	\N	\N	\N	\N
13433	596	30	2	\N	\N	\N	\N
13434	596	31	2	\N	\N	\N	\N
13435	596	32	1	\N	\N	\N	\N
13436	596	33	2	\N	\N	\N	\N
13437	596	34	4	\N	\N	\N	\N
13438	596	35	4	\N	\N	\N	\N
13439	596	36	3	\N	\N	\N	\N
13440	596	37	2	\N	\N	\N	\N
13441	596	38	4	\N	\N	\N	\N
13442	596	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.912	MODELO
13443	596	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.971	MODELO
13444	595	18	3	\N	\N	\N	\N
13445	595	19	4	\N	\N	\N	\N
13446	595	20	2	\N	\N	\N	\N
13447	595	21	2	\N	\N	\N	\N
13448	595	22	2	\N	\N	\N	\N
13449	595	23	2	\N	\N	\N	\N
13450	595	24	3	\N	\N	\N	\N
13451	595	27	3	\N	\N	\N	\N
13452	595	28	3	\N	\N	\N	\N
13453	595	29	3	\N	\N	\N	\N
13454	595	30	2	\N	\N	\N	\N
13457	595	33	1	\N	\N	\N	\N
13458	595	34	1	\N	\N	\N	\N
13459	595	35	2	\N	\N	\N	\N
13460	595	36	4	\N	\N	\N	\N
13461	595	37	2	\N	\N	\N	\N
13462	595	38	3	\N	\N	\N	\N
13463	595	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.771	MODELO
13464	595	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.875	MODELO
13465	594	18	3	\N	\N	\N	\N
13466	594	19	2	\N	\N	\N	\N
13467	594	20	2	\N	\N	\N	\N
13468	594	21	1	\N	\N	\N	\N
13469	594	22	3	\N	\N	\N	\N
13470	594	23	1	\N	\N	\N	\N
13471	594	24	2	\N	\N	\N	\N
13472	594	27	3	\N	\N	\N	\N
13473	594	28	2	\N	\N	\N	\N
13474	594	29	4	\N	\N	\N	\N
13475	594	30	4	\N	\N	\N	\N
13476	594	31	2	\N	\N	\N	\N
13477	594	32	1	\N	\N	\N	\N
13478	594	33	2	\N	\N	\N	\N
13479	594	34	3	\N	\N	\N	\N
13480	594	35	4	\N	\N	\N	\N
13481	594	36	1	\N	\N	\N	\N
13482	594	37	4	\N	\N	\N	\N
13483	594	38	2	\N	\N	\N	\N
13484	594	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.858	MODELO
13485	594	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.55	MODELO
13486	593	18	3	\N	\N	\N	\N
13487	593	19	3	\N	\N	\N	\N
13488	593	20	2	\N	\N	\N	\N
13489	593	21	3	\N	\N	\N	\N
13490	593	22	4	\N	\N	\N	\N
13491	593	23	3	\N	\N	\N	\N
13492	593	24	2	\N	\N	\N	\N
13493	593	27	2	\N	\N	\N	\N
13494	593	28	3	\N	\N	\N	\N
13495	593	29	3	\N	\N	\N	\N
13496	593	30	3	\N	\N	\N	\N
13497	593	31	1	\N	\N	\N	\N
13498	593	32	3	\N	\N	\N	\N
13499	593	33	3	\N	\N	\N	\N
13500	593	34	3	\N	\N	\N	\N
13501	593	35	4	\N	\N	\N	\N
13502	593	36	2	\N	\N	\N	\N
13503	593	37	4	\N	\N	\N	\N
13504	593	38	1	\N	\N	\N	\N
13505	593	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.594	MODELO
13506	593	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.541	MODELO
13507	592	18	2	\N	\N	\N	\N
13508	592	19	3	\N	\N	\N	\N
13509	592	20	3	\N	\N	\N	\N
13510	592	21	2	\N	\N	\N	\N
13511	592	22	2	\N	\N	\N	\N
13512	592	23	4	\N	\N	\N	\N
13513	592	24	4	\N	\N	\N	\N
13514	592	27	1	\N	\N	\N	\N
13515	592	28	2	\N	\N	\N	\N
13516	592	29	3	\N	\N	\N	\N
13517	592	30	3	\N	\N	\N	\N
13518	592	31	3	\N	\N	\N	\N
13519	592	32	3	\N	\N	\N	\N
13520	592	33	1	\N	\N	\N	\N
13521	592	34	4	\N	\N	\N	\N
13522	592	35	2	\N	\N	\N	\N
13523	592	36	4	\N	\N	\N	\N
13524	592	37	4	\N	\N	\N	\N
13525	592	38	1	\N	\N	\N	\N
13526	592	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.722	MODELO
13527	592	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.82	MODELO
13528	591	18	3	\N	\N	\N	\N
13529	591	19	2	\N	\N	\N	\N
13530	591	20	3	\N	\N	\N	\N
13531	591	21	2	\N	\N	\N	\N
13532	591	22	2	\N	\N	\N	\N
13533	591	23	2	\N	\N	\N	\N
13534	591	24	2	\N	\N	\N	\N
13535	591	27	3	\N	\N	\N	\N
13536	591	28	3	\N	\N	\N	\N
13537	591	29	3	\N	\N	\N	\N
13538	591	30	3	\N	\N	\N	\N
13539	591	31	3	\N	\N	\N	\N
13540	591	32	2	\N	\N	\N	\N
13541	591	33	4	\N	\N	\N	\N
13542	591	34	2	\N	\N	\N	\N
13543	591	35	2	\N	\N	\N	\N
13544	591	36	3	\N	\N	\N	\N
13545	591	37	4	\N	\N	\N	\N
13546	591	38	2	\N	\N	\N	\N
13547	591	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.811	MODELO
13548	591	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.602	MODELO
13549	590	18	3	\N	\N	\N	\N
13550	590	19	3	\N	\N	\N	\N
13551	590	20	1	\N	\N	\N	\N
13552	590	21	3	\N	\N	\N	\N
13553	590	22	3	\N	\N	\N	\N
13554	590	23	4	\N	\N	\N	\N
13555	590	24	3	\N	\N	\N	\N
13556	590	27	4	\N	\N	\N	\N
13557	590	28	2	\N	\N	\N	\N
13558	590	29	2	\N	\N	\N	\N
13559	590	30	3	\N	\N	\N	\N
13560	590	31	4	\N	\N	\N	\N
13561	590	32	3	\N	\N	\N	\N
13562	590	33	3	\N	\N	\N	\N
13563	590	34	1	\N	\N	\N	\N
13564	590	35	2	\N	\N	\N	\N
13565	590	36	3	\N	\N	\N	\N
13566	590	37	3	\N	\N	\N	\N
13567	590	38	3	\N	\N	\N	\N
13568	590	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.946	MODELO
13569	590	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.718	MODELO
13570	589	18	2	\N	\N	\N	\N
13571	589	19	3	\N	\N	\N	\N
13572	589	20	3	\N	\N	\N	\N
13573	589	21	1	\N	\N	\N	\N
13574	589	22	2	\N	\N	\N	\N
13575	589	23	2	\N	\N	\N	\N
13576	589	24	3	\N	\N	\N	\N
13577	589	27	1	\N	\N	\N	\N
13578	589	28	3	\N	\N	\N	\N
13579	589	29	3	\N	\N	\N	\N
13580	589	30	3	\N	\N	\N	\N
13581	589	31	4	\N	\N	\N	\N
13582	589	32	3	\N	\N	\N	\N
13583	589	33	2	\N	\N	\N	\N
13584	589	34	3	\N	\N	\N	\N
13585	589	35	3	\N	\N	\N	\N
13586	589	36	3	\N	\N	\N	\N
13587	589	37	3	\N	\N	\N	\N
13588	589	38	2	\N	\N	\N	\N
13589	589	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.633	MODELO
13590	589	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.714	MODELO
13591	588	18	3	\N	\N	\N	\N
13592	588	19	3	\N	\N	\N	\N
13593	588	20	3	\N	\N	\N	\N
13594	588	21	3	\N	\N	\N	\N
13595	588	22	3	\N	\N	\N	\N
13596	588	23	4	\N	\N	\N	\N
13597	588	24	2	\N	\N	\N	\N
13598	588	27	2	\N	\N	\N	\N
13599	588	28	2	\N	\N	\N	\N
13600	588	29	4	\N	\N	\N	\N
13601	588	30	3	\N	\N	\N	\N
13602	588	31	3	\N	\N	\N	\N
13603	588	32	3	\N	\N	\N	\N
13604	588	33	3	\N	\N	\N	\N
13605	588	34	4	\N	\N	\N	\N
13606	588	35	3	\N	\N	\N	\N
13607	588	36	2	\N	\N	\N	\N
13608	588	37	4	\N	\N	\N	\N
13609	588	38	3	\N	\N	\N	\N
13610	588	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.704	MODELO
13611	588	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.757	MODELO
13612	587	18	2	\N	\N	\N	\N
13613	587	19	3	\N	\N	\N	\N
13614	587	20	3	\N	\N	\N	\N
13615	587	21	2	\N	\N	\N	\N
13616	587	22	3	\N	\N	\N	\N
13617	587	23	2	\N	\N	\N	\N
13618	587	24	1	\N	\N	\N	\N
13619	587	27	3	\N	\N	\N	\N
13620	587	28	2	\N	\N	\N	\N
13621	587	29	4	\N	\N	\N	\N
13622	587	30	3	\N	\N	\N	\N
13623	587	31	2	\N	\N	\N	\N
13624	587	32	2	\N	\N	\N	\N
13625	587	33	3	\N	\N	\N	\N
13626	587	34	4	\N	\N	\N	\N
13627	587	35	2	\N	\N	\N	\N
13628	587	36	3	\N	\N	\N	\N
13629	587	37	3	\N	\N	\N	\N
13630	587	38	2	\N	\N	\N	\N
13631	587	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.946	MODELO
13632	587	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.863	MODELO
13633	586	18	3	\N	\N	\N	\N
13634	586	19	2	\N	\N	\N	\N
13635	586	20	4	\N	\N	\N	\N
13636	586	21	3	\N	\N	\N	\N
13637	586	22	1	\N	\N	\N	\N
13638	586	23	3	\N	\N	\N	\N
13639	586	24	3	\N	\N	\N	\N
13640	586	27	4	\N	\N	\N	\N
13641	586	28	3	\N	\N	\N	\N
13642	586	29	2	\N	\N	\N	\N
13643	586	30	2	\N	\N	\N	\N
13644	586	31	2	\N	\N	\N	\N
13645	586	32	3	\N	\N	\N	\N
13646	586	33	2	\N	\N	\N	\N
13647	586	34	2	\N	\N	\N	\N
13648	586	35	3	\N	\N	\N	\N
13649	586	36	4	\N	\N	\N	\N
13650	586	37	3	\N	\N	\N	\N
13651	586	38	3	\N	\N	\N	\N
13652	586	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.956	MODELO
13653	586	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.913	MODELO
13654	585	18	3	\N	\N	\N	\N
13655	585	19	4	\N	\N	\N	\N
13656	585	20	3	\N	\N	\N	\N
13657	585	21	4	\N	\N	\N	\N
13658	585	22	3	\N	\N	\N	\N
13659	585	23	2	\N	\N	\N	\N
13660	585	24	1	\N	\N	\N	\N
13661	585	27	4	\N	\N	\N	\N
13662	585	28	4	\N	\N	\N	\N
13663	585	29	1	\N	\N	\N	\N
13664	585	30	4	\N	\N	\N	\N
13665	585	31	3	\N	\N	\N	\N
13666	585	32	2	\N	\N	\N	\N
13667	585	33	2	\N	\N	\N	\N
13668	585	34	4	\N	\N	\N	\N
13669	585	35	3	\N	\N	\N	\N
13670	585	36	4	\N	\N	\N	\N
13671	585	37	3	\N	\N	\N	\N
13672	585	38	2	\N	\N	\N	\N
13673	585	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.744	MODELO
13674	585	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.734	MODELO
13675	584	18	4	\N	\N	\N	\N
13676	584	19	3	\N	\N	\N	\N
13677	584	20	4	\N	\N	\N	\N
13678	584	21	3	\N	\N	\N	\N
13679	584	22	3	\N	\N	\N	\N
13680	584	23	1	\N	\N	\N	\N
13681	584	24	3	\N	\N	\N	\N
13682	584	27	3	\N	\N	\N	\N
13683	584	28	2	\N	\N	\N	\N
13684	584	29	2	\N	\N	\N	\N
13685	584	30	3	\N	\N	\N	\N
13686	584	31	2	\N	\N	\N	\N
13687	584	32	2	\N	\N	\N	\N
13688	584	33	2	\N	\N	\N	\N
13689	584	34	2	\N	\N	\N	\N
13690	584	35	2	\N	\N	\N	\N
13691	584	36	3	\N	\N	\N	\N
13692	584	37	3	\N	\N	\N	\N
13693	584	38	3	\N	\N	\N	\N
13811	578	30	1	\N	\N	\N	\N
13812	578	31	4	\N	\N	\N	\N
13694	584	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.688	MODELO
13695	584	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.785	MODELO
13696	583	18	3	\N	\N	\N	\N
13697	583	19	3	\N	\N	\N	\N
13698	583	20	3	\N	\N	\N	\N
13699	583	21	2	\N	\N	\N	\N
13700	583	22	3	\N	\N	\N	\N
13701	583	23	4	\N	\N	\N	\N
13702	583	24	3	\N	\N	\N	\N
13703	583	27	3	\N	\N	\N	\N
13704	583	28	2	\N	\N	\N	\N
13705	583	29	4	\N	\N	\N	\N
13706	583	30	3	\N	\N	\N	\N
13707	583	31	1	\N	\N	\N	\N
13708	583	32	1	\N	\N	\N	\N
13709	583	33	3	\N	\N	\N	\N
13710	583	34	4	\N	\N	\N	\N
13711	583	35	3	\N	\N	\N	\N
13712	583	36	3	\N	\N	\N	\N
13713	583	37	1	\N	\N	\N	\N
13714	583	38	3	\N	\N	\N	\N
13715	583	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.567	MODELO
13716	583	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.609	MODELO
13717	582	18	2	\N	\N	\N	\N
13718	582	19	2	\N	\N	\N	\N
13719	582	20	2	\N	\N	\N	\N
13720	582	21	3	\N	\N	\N	\N
13721	582	22	2	\N	\N	\N	\N
13722	582	23	2	\N	\N	\N	\N
13723	582	24	2	\N	\N	\N	\N
13724	582	27	3	\N	\N	\N	\N
13725	582	28	2	\N	\N	\N	\N
13726	582	29	3	\N	\N	\N	\N
13727	582	30	3	\N	\N	\N	\N
13728	582	31	3	\N	\N	\N	\N
13729	582	32	2	\N	\N	\N	\N
13730	582	33	3	\N	\N	\N	\N
13731	582	34	3	\N	\N	\N	\N
13732	582	35	3	\N	\N	\N	\N
13733	582	36	3	\N	\N	\N	\N
13734	582	37	4	\N	\N	\N	\N
13735	582	38	2	\N	\N	\N	\N
13736	582	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.717	MODELO
13737	582	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.8	MODELO
13738	581	18	2	\N	\N	\N	\N
13739	581	19	4	\N	\N	\N	\N
13740	581	20	2	\N	\N	\N	\N
13741	581	21	2	\N	\N	\N	\N
13742	581	22	3	\N	\N	\N	\N
13743	581	23	2	\N	\N	\N	\N
13744	581	24	3	\N	\N	\N	\N
13745	581	27	2	\N	\N	\N	\N
13746	581	28	2	\N	\N	\N	\N
13747	581	29	3	\N	\N	\N	\N
13748	581	30	2	\N	\N	\N	\N
13749	581	31	2	\N	\N	\N	\N
13750	581	32	3	\N	\N	\N	\N
13751	581	33	3	\N	\N	\N	\N
13752	581	34	3	\N	\N	\N	\N
13753	581	35	4	\N	\N	\N	\N
13754	581	36	2	\N	\N	\N	\N
13755	581	37	2	\N	\N	\N	\N
13756	581	38	2	\N	\N	\N	\N
13757	581	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.686	MODELO
13758	581	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.897	MODELO
13759	580	18	3	\N	\N	\N	\N
13760	580	19	2	\N	\N	\N	\N
13761	580	20	2	\N	\N	\N	\N
13762	580	21	3	\N	\N	\N	\N
13763	580	22	3	\N	\N	\N	\N
13764	580	23	3	\N	\N	\N	\N
13765	580	24	3	\N	\N	\N	\N
13766	580	27	3	\N	\N	\N	\N
13767	580	28	2	\N	\N	\N	\N
13768	580	29	4	\N	\N	\N	\N
13769	580	30	4	\N	\N	\N	\N
13770	580	31	2	\N	\N	\N	\N
13771	580	32	2	\N	\N	\N	\N
13772	580	33	3	\N	\N	\N	\N
13773	580	34	2	\N	\N	\N	\N
13774	580	35	4	\N	\N	\N	\N
13775	580	36	3	\N	\N	\N	\N
13776	580	37	2	\N	\N	\N	\N
13777	580	38	1	\N	\N	\N	\N
13778	580	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.803	MODELO
13779	580	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.625	MODELO
13780	579	18	2	\N	\N	\N	\N
13781	579	19	4	\N	\N	\N	\N
13782	579	20	1	\N	\N	\N	\N
13783	579	21	2	\N	\N	\N	\N
13784	579	22	2	\N	\N	\N	\N
13785	579	23	1	\N	\N	\N	\N
13786	579	24	3	\N	\N	\N	\N
13787	579	27	3	\N	\N	\N	\N
13788	579	28	2	\N	\N	\N	\N
13789	579	29	4	\N	\N	\N	\N
13790	579	30	1	\N	\N	\N	\N
13791	579	31	2	\N	\N	\N	\N
13792	579	32	2	\N	\N	\N	\N
13793	579	33	1	\N	\N	\N	\N
13794	579	34	2	\N	\N	\N	\N
13795	579	35	3	\N	\N	\N	\N
13796	579	36	2	\N	\N	\N	\N
13797	579	37	3	\N	\N	\N	\N
13798	579	38	2	\N	\N	\N	\N
13799	579	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.93	MODELO
13800	579	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.831	MODELO
13801	578	18	2	\N	\N	\N	\N
13802	578	19	4	\N	\N	\N	\N
13803	578	20	1	\N	\N	\N	\N
13804	578	21	2	\N	\N	\N	\N
13805	578	22	2	\N	\N	\N	\N
13806	578	23	4	\N	\N	\N	\N
13807	578	24	3	\N	\N	\N	\N
13808	578	27	3	\N	\N	\N	\N
13809	578	28	1	\N	\N	\N	\N
13810	578	29	2	\N	\N	\N	\N
13813	578	32	2	\N	\N	\N	\N
13814	578	33	2	\N	\N	\N	\N
13815	578	34	3	\N	\N	\N	\N
13816	578	35	4	\N	\N	\N	\N
13817	578	36	2	\N	\N	\N	\N
13818	578	37	2	\N	\N	\N	\N
13819	578	38	2	\N	\N	\N	\N
13820	578	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.949	MODELO
13821	578	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.746	MODELO
13822	577	18	4	\N	\N	\N	\N
13823	577	19	4	\N	\N	\N	\N
13824	577	20	4	\N	\N	\N	\N
13825	577	21	1	\N	\N	\N	\N
13826	577	22	2	\N	\N	\N	\N
13827	577	23	2	\N	\N	\N	\N
13828	577	24	3	\N	\N	\N	\N
13829	577	27	1	\N	\N	\N	\N
13830	577	28	2	\N	\N	\N	\N
13831	577	29	2	\N	\N	\N	\N
13832	577	30	4	\N	\N	\N	\N
13833	577	31	4	\N	\N	\N	\N
13834	577	32	3	\N	\N	\N	\N
13835	577	33	2	\N	\N	\N	\N
13836	577	34	4	\N	\N	\N	\N
13837	577	35	3	\N	\N	\N	\N
13838	577	36	3	\N	\N	\N	\N
13839	577	37	2	\N	\N	\N	\N
13840	577	38	4	\N	\N	\N	\N
13841	577	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.754	MODELO
13842	577	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.974	MODELO
13843	576	18	3	\N	\N	\N	\N
13844	576	19	3	\N	\N	\N	\N
13845	576	20	4	\N	\N	\N	\N
13846	576	21	3	\N	\N	\N	\N
13847	576	22	3	\N	\N	\N	\N
13848	576	23	2	\N	\N	\N	\N
13849	576	24	1	\N	\N	\N	\N
13850	576	27	3	\N	\N	\N	\N
13851	576	28	3	\N	\N	\N	\N
13852	576	29	2	\N	\N	\N	\N
13853	576	30	4	\N	\N	\N	\N
13854	576	31	3	\N	\N	\N	\N
13855	576	32	4	\N	\N	\N	\N
13856	576	33	2	\N	\N	\N	\N
13857	576	34	2	\N	\N	\N	\N
13858	576	35	3	\N	\N	\N	\N
13859	576	36	2	\N	\N	\N	\N
13860	576	37	3	\N	\N	\N	\N
13861	576	38	2	\N	\N	\N	\N
13862	576	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.976	MODELO
13863	576	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.685	MODELO
13864	575	18	3	\N	\N	\N	\N
13865	575	19	3	\N	\N	\N	\N
13866	575	20	2	\N	\N	\N	\N
13867	575	21	3	\N	\N	\N	\N
13868	575	22	2	\N	\N	\N	\N
13869	575	23	2	\N	\N	\N	\N
13870	575	24	3	\N	\N	\N	\N
13871	575	27	1	\N	\N	\N	\N
13872	575	28	3	\N	\N	\N	\N
13873	575	29	2	\N	\N	\N	\N
13874	575	30	2	\N	\N	\N	\N
13875	575	31	2	\N	\N	\N	\N
13876	575	32	2	\N	\N	\N	\N
13877	575	33	4	\N	\N	\N	\N
13878	575	34	3	\N	\N	\N	\N
13879	575	35	2	\N	\N	\N	\N
13880	575	36	2	\N	\N	\N	\N
13881	575	37	3	\N	\N	\N	\N
13882	575	38	2	\N	\N	\N	\N
13883	575	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.507	MODELO
13884	575	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.717	MODELO
13885	574	18	2	\N	\N	\N	\N
13886	574	19	2	\N	\N	\N	\N
13887	574	20	1	\N	\N	\N	\N
13888	574	21	2	\N	\N	\N	\N
13889	574	22	3	\N	\N	\N	\N
13890	574	23	2	\N	\N	\N	\N
13891	574	24	2	\N	\N	\N	\N
13892	574	27	3	\N	\N	\N	\N
13893	574	28	1	\N	\N	\N	\N
13894	574	29	1	\N	\N	\N	\N
13895	574	30	2	\N	\N	\N	\N
13896	574	31	2	\N	\N	\N	\N
13897	574	32	2	\N	\N	\N	\N
13898	574	33	2	\N	\N	\N	\N
13899	574	34	2	\N	\N	\N	\N
13900	574	35	3	\N	\N	\N	\N
13901	574	36	2	\N	\N	\N	\N
13902	574	37	3	\N	\N	\N	\N
13903	574	38	2	\N	\N	\N	\N
13904	574	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.75	MODELO
13905	574	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.978	MODELO
13906	573	18	2	\N	\N	\N	\N
13907	573	19	2	\N	\N	\N	\N
13908	573	20	3	\N	\N	\N	\N
13909	573	21	3	\N	\N	\N	\N
13910	573	22	3	\N	\N	\N	\N
13911	573	23	4	\N	\N	\N	\N
13912	573	24	2	\N	\N	\N	\N
13913	573	27	2	\N	\N	\N	\N
13914	573	28	3	\N	\N	\N	\N
13915	573	29	2	\N	\N	\N	\N
13916	573	30	2	\N	\N	\N	\N
13917	573	31	2	\N	\N	\N	\N
13918	573	32	2	\N	\N	\N	\N
13919	573	33	2	\N	\N	\N	\N
13920	573	34	2	\N	\N	\N	\N
13921	573	35	4	\N	\N	\N	\N
13922	573	36	2	\N	\N	\N	\N
13923	573	37	3	\N	\N	\N	\N
13924	573	38	3	\N	\N	\N	\N
13925	573	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.864	MODELO
13926	573	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.532	MODELO
13927	572	18	2	\N	\N	\N	\N
13928	572	19	4	\N	\N	\N	\N
13929	572	20	3	\N	\N	\N	\N
13930	572	21	3	\N	\N	\N	\N
13931	572	22	2	\N	\N	\N	\N
13932	572	23	4	\N	\N	\N	\N
13933	572	24	2	\N	\N	\N	\N
13934	572	27	3	\N	\N	\N	\N
13935	572	28	4	\N	\N	\N	\N
13936	572	29	2	\N	\N	\N	\N
13937	572	30	4	\N	\N	\N	\N
13938	572	31	3	\N	\N	\N	\N
13939	572	32	2	\N	\N	\N	\N
13940	572	33	2	\N	\N	\N	\N
13941	572	34	2	\N	\N	\N	\N
13942	572	35	1	\N	\N	\N	\N
13943	572	36	4	\N	\N	\N	\N
13944	572	37	3	\N	\N	\N	\N
13945	572	38	3	\N	\N	\N	\N
13946	572	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.948	MODELO
13947	572	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.98	MODELO
13948	571	18	3	\N	\N	\N	\N
13949	571	19	4	\N	\N	\N	\N
13950	571	20	4	\N	\N	\N	\N
13951	571	21	3	\N	\N	\N	\N
13952	571	22	3	\N	\N	\N	\N
13953	571	23	2	\N	\N	\N	\N
13954	571	24	4	\N	\N	\N	\N
13955	571	27	2	\N	\N	\N	\N
13956	571	28	4	\N	\N	\N	\N
13957	571	29	3	\N	\N	\N	\N
13958	571	30	3	\N	\N	\N	\N
13959	571	31	4	\N	\N	\N	\N
13960	571	32	3	\N	\N	\N	\N
13961	571	33	3	\N	\N	\N	\N
13962	571	34	2	\N	\N	\N	\N
13963	571	35	2	\N	\N	\N	\N
13964	571	36	2	\N	\N	\N	\N
13965	571	37	3	\N	\N	\N	\N
13966	571	38	3	\N	\N	\N	\N
13967	571	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.725	MODELO
13968	571	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.564	MODELO
13969	570	18	4	\N	\N	\N	\N
13970	570	19	2	\N	\N	\N	\N
13971	570	20	1	\N	\N	\N	\N
13972	570	21	2	\N	\N	\N	\N
13973	570	22	3	\N	\N	\N	\N
13974	570	23	3	\N	\N	\N	\N
13975	570	24	3	\N	\N	\N	\N
13976	570	27	2	\N	\N	\N	\N
13977	570	28	3	\N	\N	\N	\N
13978	570	29	4	\N	\N	\N	\N
13979	570	30	3	\N	\N	\N	\N
13980	570	31	2	\N	\N	\N	\N
13981	570	32	2	\N	\N	\N	\N
13982	570	33	2	\N	\N	\N	\N
13983	570	34	2	\N	\N	\N	\N
13984	570	35	2	\N	\N	\N	\N
13985	570	36	2	\N	\N	\N	\N
13986	570	37	2	\N	\N	\N	\N
13987	570	38	4	\N	\N	\N	\N
13988	570	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.706	MODELO
13989	570	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.764	MODELO
13990	569	18	3	\N	\N	\N	\N
13991	569	19	3	\N	\N	\N	\N
13992	569	20	3	\N	\N	\N	\N
13993	569	21	4	\N	\N	\N	\N
13994	569	22	3	\N	\N	\N	\N
13995	569	23	2	\N	\N	\N	\N
13996	569	24	2	\N	\N	\N	\N
13997	569	27	4	\N	\N	\N	\N
13998	569	28	3	\N	\N	\N	\N
13999	569	29	2	\N	\N	\N	\N
14000	569	30	2	\N	\N	\N	\N
14001	569	31	4	\N	\N	\N	\N
14002	569	32	1	\N	\N	\N	\N
14003	569	33	3	\N	\N	\N	\N
14004	569	34	4	\N	\N	\N	\N
14005	569	35	3	\N	\N	\N	\N
14006	569	36	3	\N	\N	\N	\N
14007	569	37	2	\N	\N	\N	\N
14008	569	38	1	\N	\N	\N	\N
14009	569	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.554	MODELO
14010	569	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.934	MODELO
14011	568	18	3	\N	\N	\N	\N
14012	568	19	3	\N	\N	\N	\N
14013	568	20	3	\N	\N	\N	\N
14014	568	21	3	\N	\N	\N	\N
14015	568	22	4	\N	\N	\N	\N
14016	568	23	3	\N	\N	\N	\N
14017	568	24	2	\N	\N	\N	\N
14018	568	27	4	\N	\N	\N	\N
14019	568	28	2	\N	\N	\N	\N
14020	568	29	1	\N	\N	\N	\N
14021	568	30	3	\N	\N	\N	\N
14022	568	31	3	\N	\N	\N	\N
14023	568	32	2	\N	\N	\N	\N
14024	568	33	3	\N	\N	\N	\N
14025	568	34	3	\N	\N	\N	\N
14026	568	35	1	\N	\N	\N	\N
14027	568	36	2	\N	\N	\N	\N
14028	568	37	1	\N	\N	\N	\N
14029	568	38	1	\N	\N	\N	\N
14030	568	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.786	MODELO
14031	568	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.658	MODELO
14032	567	18	4	\N	\N	\N	\N
14033	567	19	4	\N	\N	\N	\N
14034	567	20	3	\N	\N	\N	\N
14035	567	21	2	\N	\N	\N	\N
14036	567	22	3	\N	\N	\N	\N
14037	567	23	2	\N	\N	\N	\N
14038	567	24	4	\N	\N	\N	\N
14039	567	27	3	\N	\N	\N	\N
14040	567	28	4	\N	\N	\N	\N
14041	567	29	2	\N	\N	\N	\N
14042	567	30	3	\N	\N	\N	\N
14043	567	31	3	\N	\N	\N	\N
14044	567	32	2	\N	\N	\N	\N
14045	567	33	3	\N	\N	\N	\N
14046	567	34	4	\N	\N	\N	\N
14047	567	35	2	\N	\N	\N	\N
14048	567	36	3	\N	\N	\N	\N
14049	567	37	3	\N	\N	\N	\N
14050	567	38	3	\N	\N	\N	\N
14051	567	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.766	MODELO
14052	567	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.731	MODELO
14053	566	18	2	\N	\N	\N	\N
14054	566	19	2	\N	\N	\N	\N
14055	566	20	2	\N	\N	\N	\N
14056	566	21	4	\N	\N	\N	\N
14057	566	22	1	\N	\N	\N	\N
14058	566	23	4	\N	\N	\N	\N
14059	566	24	2	\N	\N	\N	\N
14060	566	27	4	\N	\N	\N	\N
14061	566	28	2	\N	\N	\N	\N
14062	566	29	2	\N	\N	\N	\N
14063	566	30	1	\N	\N	\N	\N
14064	566	31	3	\N	\N	\N	\N
14065	566	32	1	\N	\N	\N	\N
14066	566	33	3	\N	\N	\N	\N
14067	566	34	4	\N	\N	\N	\N
14068	566	35	3	\N	\N	\N	\N
14069	566	36	3	\N	\N	\N	\N
14070	566	37	3	\N	\N	\N	\N
14071	566	38	3	\N	\N	\N	\N
14072	566	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.897	MODELO
14073	566	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.644	MODELO
14074	565	18	2	\N	\N	\N	\N
14075	565	19	3	\N	\N	\N	\N
14076	565	20	2	\N	\N	\N	\N
14077	565	21	2	\N	\N	\N	\N
14078	565	22	3	\N	\N	\N	\N
14079	565	23	2	\N	\N	\N	\N
14080	565	24	3	\N	\N	\N	\N
14081	565	27	2	\N	\N	\N	\N
14082	565	28	2	\N	\N	\N	\N
14083	565	29	3	\N	\N	\N	\N
14084	565	30	2	\N	\N	\N	\N
14085	565	31	1	\N	\N	\N	\N
14086	565	32	4	\N	\N	\N	\N
14087	565	33	1	\N	\N	\N	\N
14088	565	34	1	\N	\N	\N	\N
14089	565	35	3	\N	\N	\N	\N
14090	565	36	2	\N	\N	\N	\N
14091	565	37	2	\N	\N	\N	\N
14092	565	38	3	\N	\N	\N	\N
14093	565	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.709	MODELO
14094	565	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.691	MODELO
14095	564	18	3	\N	\N	\N	\N
14096	564	19	2	\N	\N	\N	\N
14097	564	20	3	\N	\N	\N	\N
14098	564	21	2	\N	\N	\N	\N
14099	564	22	3	\N	\N	\N	\N
14100	564	23	2	\N	\N	\N	\N
14101	564	24	3	\N	\N	\N	\N
14102	564	27	3	\N	\N	\N	\N
14103	564	28	3	\N	\N	\N	\N
14104	564	29	3	\N	\N	\N	\N
14105	564	30	2	\N	\N	\N	\N
14106	564	31	3	\N	\N	\N	\N
14107	564	32	2	\N	\N	\N	\N
14108	564	33	3	\N	\N	\N	\N
14109	564	34	2	\N	\N	\N	\N
14110	564	35	4	\N	\N	\N	\N
14111	564	36	2	\N	\N	\N	\N
14112	564	37	2	\N	\N	\N	\N
14113	564	38	2	\N	\N	\N	\N
14114	564	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.718	MODELO
14115	564	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.716	MODELO
14116	563	18	2	\N	\N	\N	\N
14117	563	19	2	\N	\N	\N	\N
14118	563	20	2	\N	\N	\N	\N
14119	563	21	2	\N	\N	\N	\N
14120	563	22	2	\N	\N	\N	\N
14121	563	23	2	\N	\N	\N	\N
14122	563	24	1	\N	\N	\N	\N
14123	563	27	3	\N	\N	\N	\N
14124	563	28	4	\N	\N	\N	\N
14125	563	29	3	\N	\N	\N	\N
14126	563	30	2	\N	\N	\N	\N
14127	563	31	3	\N	\N	\N	\N
14128	563	32	4	\N	\N	\N	\N
14129	563	33	2	\N	\N	\N	\N
14130	563	34	2	\N	\N	\N	\N
14131	563	35	4	\N	\N	\N	\N
14132	563	36	2	\N	\N	\N	\N
14133	563	37	2	\N	\N	\N	\N
14134	563	38	2	\N	\N	\N	\N
14135	563	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.626	MODELO
14136	563	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.785	MODELO
14137	562	18	3	\N	\N	\N	\N
14138	562	19	4	\N	\N	\N	\N
14139	562	20	3	\N	\N	\N	\N
14140	562	21	3	\N	\N	\N	\N
14141	562	22	1	\N	\N	\N	\N
14142	562	23	2	\N	\N	\N	\N
14143	562	24	2	\N	\N	\N	\N
14144	562	27	3	\N	\N	\N	\N
14145	562	28	2	\N	\N	\N	\N
14146	562	29	4	\N	\N	\N	\N
14147	562	30	2	\N	\N	\N	\N
14148	562	31	1	\N	\N	\N	\N
14149	562	32	3	\N	\N	\N	\N
14150	562	33	1	\N	\N	\N	\N
14151	562	34	2	\N	\N	\N	\N
14152	562	35	3	\N	\N	\N	\N
14153	562	36	1	\N	\N	\N	\N
14154	562	37	3	\N	\N	\N	\N
14155	562	38	2	\N	\N	\N	\N
14156	562	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.922	MODELO
14157	562	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.928	MODELO
14158	561	18	3	\N	\N	\N	\N
14159	561	19	4	\N	\N	\N	\N
14160	561	20	3	\N	\N	\N	\N
14161	561	21	3	\N	\N	\N	\N
14162	561	22	2	\N	\N	\N	\N
14163	561	23	3	\N	\N	\N	\N
14164	561	24	2	\N	\N	\N	\N
14165	561	27	3	\N	\N	\N	\N
14166	561	28	4	\N	\N	\N	\N
14167	561	29	1	\N	\N	\N	\N
14168	561	30	3	\N	\N	\N	\N
14169	561	31	4	\N	\N	\N	\N
14170	561	32	3	\N	\N	\N	\N
14171	561	33	3	\N	\N	\N	\N
14172	561	34	2	\N	\N	\N	\N
14173	561	35	3	\N	\N	\N	\N
14174	561	36	3	\N	\N	\N	\N
14175	561	37	2	\N	\N	\N	\N
14176	561	38	3	\N	\N	\N	\N
14177	561	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.958	MODELO
14178	561	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.891	MODELO
14179	560	18	4	\N	\N	\N	\N
14180	560	19	2	\N	\N	\N	\N
14181	560	20	3	\N	\N	\N	\N
14182	560	21	2	\N	\N	\N	\N
14183	560	22	1	\N	\N	\N	\N
14184	560	23	4	\N	\N	\N	\N
14185	560	24	3	\N	\N	\N	\N
14186	560	27	2	\N	\N	\N	\N
14187	560	28	2	\N	\N	\N	\N
14188	560	29	4	\N	\N	\N	\N
14189	560	30	4	\N	\N	\N	\N
14190	560	31	2	\N	\N	\N	\N
14191	560	32	2	\N	\N	\N	\N
14192	560	33	3	\N	\N	\N	\N
14193	560	34	2	\N	\N	\N	\N
14194	560	35	3	\N	\N	\N	\N
14195	560	36	4	\N	\N	\N	\N
14196	560	37	3	\N	\N	\N	\N
14197	560	38	4	\N	\N	\N	\N
14198	560	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.718	MODELO
14199	560	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.656	MODELO
14200	559	18	3	\N	\N	\N	\N
14201	559	19	2	\N	\N	\N	\N
14202	559	20	1	\N	\N	\N	\N
14203	559	21	2	\N	\N	\N	\N
14204	559	22	4	\N	\N	\N	\N
14205	559	23	3	\N	\N	\N	\N
14206	559	24	3	\N	\N	\N	\N
14207	559	27	2	\N	\N	\N	\N
14208	559	28	3	\N	\N	\N	\N
14209	559	29	2	\N	\N	\N	\N
14210	559	30	4	\N	\N	\N	\N
14211	559	31	2	\N	\N	\N	\N
14212	559	32	2	\N	\N	\N	\N
14213	559	33	1	\N	\N	\N	\N
14214	559	34	2	\N	\N	\N	\N
14215	559	35	3	\N	\N	\N	\N
14216	559	36	3	\N	\N	\N	\N
14217	559	37	2	\N	\N	\N	\N
14218	559	38	2	\N	\N	\N	\N
14219	559	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.764	MODELO
14220	559	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.564	MODELO
14221	558	18	3	\N	\N	\N	\N
14222	558	19	3	\N	\N	\N	\N
14223	558	20	1	\N	\N	\N	\N
14224	558	21	1	\N	\N	\N	\N
14225	558	22	2	\N	\N	\N	\N
14226	558	23	2	\N	\N	\N	\N
14227	558	24	2	\N	\N	\N	\N
14228	558	27	1	\N	\N	\N	\N
14229	558	28	3	\N	\N	\N	\N
14230	558	29	1	\N	\N	\N	\N
14231	558	30	2	\N	\N	\N	\N
14232	558	31	2	\N	\N	\N	\N
14233	558	32	3	\N	\N	\N	\N
14234	558	33	2	\N	\N	\N	\N
14235	558	34	2	\N	\N	\N	\N
14236	558	35	3	\N	\N	\N	\N
14237	558	36	2	\N	\N	\N	\N
14238	558	37	3	\N	\N	\N	\N
14239	558	38	3	\N	\N	\N	\N
14240	558	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.936	MODELO
14241	558	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.789	MODELO
14242	557	18	3	\N	\N	\N	\N
14243	557	19	3	\N	\N	\N	\N
14244	557	20	1	\N	\N	\N	\N
14245	557	21	4	\N	\N	\N	\N
14246	557	22	1	\N	\N	\N	\N
14247	557	23	3	\N	\N	\N	\N
14248	557	24	2	\N	\N	\N	\N
14249	557	27	2	\N	\N	\N	\N
14250	557	28	3	\N	\N	\N	\N
14251	557	29	4	\N	\N	\N	\N
14252	557	30	3	\N	\N	\N	\N
14253	557	31	4	\N	\N	\N	\N
14254	557	32	2	\N	\N	\N	\N
14255	557	33	1	\N	\N	\N	\N
14256	557	34	3	\N	\N	\N	\N
14257	557	35	2	\N	\N	\N	\N
14258	557	36	4	\N	\N	\N	\N
14259	557	37	3	\N	\N	\N	\N
14260	557	38	3	\N	\N	\N	\N
14261	557	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.752	MODELO
14262	557	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.731	MODELO
14263	556	18	2	\N	\N	\N	\N
14264	556	19	2	\N	\N	\N	\N
14265	556	20	2	\N	\N	\N	\N
14266	556	21	4	\N	\N	\N	\N
14267	556	22	3	\N	\N	\N	\N
14268	556	23	3	\N	\N	\N	\N
14269	556	24	2	\N	\N	\N	\N
14270	556	27	1	\N	\N	\N	\N
14271	556	28	2	\N	\N	\N	\N
14272	556	29	3	\N	\N	\N	\N
14273	556	30	2	\N	\N	\N	\N
14274	556	31	1	\N	\N	\N	\N
14275	556	32	2	\N	\N	\N	\N
14276	556	33	3	\N	\N	\N	\N
14277	556	34	3	\N	\N	\N	\N
14278	556	35	3	\N	\N	\N	\N
14279	556	36	3	\N	\N	\N	\N
14280	556	37	2	\N	\N	\N	\N
14281	556	38	2	\N	\N	\N	\N
14282	556	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.724	MODELO
14283	556	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.929	MODELO
14284	555	18	1	\N	\N	\N	\N
14285	555	19	2	\N	\N	\N	\N
14286	555	20	2	\N	\N	\N	\N
14287	555	21	2	\N	\N	\N	\N
14288	555	22	2	\N	\N	\N	\N
14289	555	23	3	\N	\N	\N	\N
14290	555	24	2	\N	\N	\N	\N
14291	555	27	2	\N	\N	\N	\N
14292	555	28	2	\N	\N	\N	\N
14293	555	29	3	\N	\N	\N	\N
14294	555	30	3	\N	\N	\N	\N
14295	555	31	2	\N	\N	\N	\N
14296	555	32	2	\N	\N	\N	\N
14297	555	33	3	\N	\N	\N	\N
14298	555	34	2	\N	\N	\N	\N
14299	555	35	2	\N	\N	\N	\N
14300	555	36	4	\N	\N	\N	\N
14301	555	37	2	\N	\N	\N	\N
14302	555	38	2	\N	\N	\N	\N
14303	555	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.762	MODELO
14304	555	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.523	MODELO
14305	554	18	3	\N	\N	\N	\N
14306	554	19	4	\N	\N	\N	\N
14307	554	20	3	\N	\N	\N	\N
14308	554	21	2	\N	\N	\N	\N
14309	554	22	1	\N	\N	\N	\N
14310	554	23	3	\N	\N	\N	\N
14311	554	24	3	\N	\N	\N	\N
14312	554	27	2	\N	\N	\N	\N
14313	554	28	3	\N	\N	\N	\N
14314	554	29	2	\N	\N	\N	\N
14315	554	30	3	\N	\N	\N	\N
14316	554	31	4	\N	\N	\N	\N
14317	554	32	1	\N	\N	\N	\N
14318	554	33	3	\N	\N	\N	\N
14319	554	34	2	\N	\N	\N	\N
14320	554	35	3	\N	\N	\N	\N
14321	554	36	1	\N	\N	\N	\N
14322	554	37	1	\N	\N	\N	\N
14323	554	38	3	\N	\N	\N	\N
14324	554	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.523	MODELO
14325	554	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.83	MODELO
14326	553	18	2	\N	\N	\N	\N
14327	553	19	1	\N	\N	\N	\N
14328	553	20	4	\N	\N	\N	\N
14329	553	21	2	\N	\N	\N	\N
14330	553	22	3	\N	\N	\N	\N
14331	553	23	1	\N	\N	\N	\N
14332	553	24	3	\N	\N	\N	\N
14333	553	27	4	\N	\N	\N	\N
14334	553	28	2	\N	\N	\N	\N
14335	553	29	3	\N	\N	\N	\N
14336	553	30	3	\N	\N	\N	\N
14337	553	31	2	\N	\N	\N	\N
14338	553	32	1	\N	\N	\N	\N
14339	553	33	3	\N	\N	\N	\N
14340	553	34	3	\N	\N	\N	\N
14341	553	35	2	\N	\N	\N	\N
14342	553	36	2	\N	\N	\N	\N
14343	553	37	2	\N	\N	\N	\N
14344	553	38	4	\N	\N	\N	\N
14345	553	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.728	MODELO
14346	553	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.587	MODELO
14347	552	18	3	\N	\N	\N	\N
14348	552	19	3	\N	\N	\N	\N
14349	552	20	2	\N	\N	\N	\N
14350	552	21	2	\N	\N	\N	\N
14351	552	22	3	\N	\N	\N	\N
14352	552	23	2	\N	\N	\N	\N
14353	552	24	2	\N	\N	\N	\N
14354	552	27	2	\N	\N	\N	\N
14355	552	28	1	\N	\N	\N	\N
14356	552	29	3	\N	\N	\N	\N
14357	552	30	2	\N	\N	\N	\N
14358	552	31	3	\N	\N	\N	\N
14359	552	32	2	\N	\N	\N	\N
14360	552	33	2	\N	\N	\N	\N
14361	552	34	3	\N	\N	\N	\N
14362	552	35	4	\N	\N	\N	\N
14363	552	36	2	\N	\N	\N	\N
14364	552	37	1	\N	\N	\N	\N
14365	552	38	2	\N	\N	\N	\N
14366	552	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.984	MODELO
14367	552	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.714	MODELO
14368	551	18	2	\N	\N	\N	\N
14369	551	19	3	\N	\N	\N	\N
14370	551	20	3	\N	\N	\N	\N
14371	551	21	2	\N	\N	\N	\N
14372	551	22	3	\N	\N	\N	\N
14373	551	23	3	\N	\N	\N	\N
14374	551	24	2	\N	\N	\N	\N
14375	551	27	2	\N	\N	\N	\N
14376	551	28	2	\N	\N	\N	\N
14377	551	29	3	\N	\N	\N	\N
14378	551	30	4	\N	\N	\N	\N
14379	551	31	2	\N	\N	\N	\N
14380	551	32	1	\N	\N	\N	\N
14381	551	33	3	\N	\N	\N	\N
14382	551	34	1	\N	\N	\N	\N
14383	551	35	4	\N	\N	\N	\N
14384	551	36	4	\N	\N	\N	\N
14385	551	37	3	\N	\N	\N	\N
14386	551	38	2	\N	\N	\N	\N
14387	551	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.927	MODELO
14388	551	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.847	MODELO
14389	550	18	3	\N	\N	\N	\N
14390	550	19	3	\N	\N	\N	\N
14391	550	20	3	\N	\N	\N	\N
14392	550	21	3	\N	\N	\N	\N
14393	550	22	2	\N	\N	\N	\N
14394	550	23	2	\N	\N	\N	\N
14395	550	24	3	\N	\N	\N	\N
14396	550	27	4	\N	\N	\N	\N
14397	550	28	4	\N	\N	\N	\N
14398	550	29	3	\N	\N	\N	\N
14399	550	30	2	\N	\N	\N	\N
14400	550	31	4	\N	\N	\N	\N
14401	550	32	3	\N	\N	\N	\N
14402	550	33	1	\N	\N	\N	\N
14403	550	34	3	\N	\N	\N	\N
14404	550	35	3	\N	\N	\N	\N
14405	550	36	3	\N	\N	\N	\N
14406	550	37	1	\N	\N	\N	\N
14407	550	38	2	\N	\N	\N	\N
14408	550	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.969	MODELO
14409	550	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.642	MODELO
14410	549	18	3	\N	\N	\N	\N
14411	549	19	2	\N	\N	\N	\N
14412	549	20	3	\N	\N	\N	\N
14413	549	21	3	\N	\N	\N	\N
14414	549	22	2	\N	\N	\N	\N
14415	549	23	4	\N	\N	\N	\N
14416	549	24	3	\N	\N	\N	\N
14417	549	27	3	\N	\N	\N	\N
14418	549	28	3	\N	\N	\N	\N
14419	549	29	3	\N	\N	\N	\N
14420	549	30	2	\N	\N	\N	\N
14421	549	31	3	\N	\N	\N	\N
14422	549	32	3	\N	\N	\N	\N
14423	549	33	4	\N	\N	\N	\N
14424	549	34	4	\N	\N	\N	\N
14425	549	35	4	\N	\N	\N	\N
14426	549	36	4	\N	\N	\N	\N
14427	549	37	2	\N	\N	\N	\N
14428	549	38	3	\N	\N	\N	\N
14429	549	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.882	MODELO
14430	549	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.682	MODELO
14431	548	18	3	\N	\N	\N	\N
14432	548	19	1	\N	\N	\N	\N
14433	548	20	3	\N	\N	\N	\N
14434	548	21	3	\N	\N	\N	\N
14435	548	22	4	\N	\N	\N	\N
14436	548	23	1	\N	\N	\N	\N
14437	548	24	3	\N	\N	\N	\N
14438	548	27	3	\N	\N	\N	\N
14439	548	28	3	\N	\N	\N	\N
14440	548	29	2	\N	\N	\N	\N
14441	548	30	4	\N	\N	\N	\N
14442	548	31	2	\N	\N	\N	\N
14443	548	32	3	\N	\N	\N	\N
14444	548	33	3	\N	\N	\N	\N
14445	548	34	2	\N	\N	\N	\N
14446	548	35	2	\N	\N	\N	\N
14447	548	36	2	\N	\N	\N	\N
14448	548	37	3	\N	\N	\N	\N
14449	548	38	2	\N	\N	\N	\N
14450	548	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.703	MODELO
14451	548	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.854	MODELO
14452	547	18	1	\N	\N	\N	\N
14453	547	19	2	\N	\N	\N	\N
14454	547	20	4	\N	\N	\N	\N
14455	547	21	3	\N	\N	\N	\N
14456	547	22	3	\N	\N	\N	\N
14457	547	23	2	\N	\N	\N	\N
14458	547	24	4	\N	\N	\N	\N
14459	547	27	1	\N	\N	\N	\N
14460	547	28	2	\N	\N	\N	\N
14461	547	29	2	\N	\N	\N	\N
14462	547	30	2	\N	\N	\N	\N
14463	547	31	3	\N	\N	\N	\N
14464	547	32	4	\N	\N	\N	\N
14465	547	33	3	\N	\N	\N	\N
14466	547	34	3	\N	\N	\N	\N
14467	547	35	2	\N	\N	\N	\N
14468	547	36	2	\N	\N	\N	\N
14469	547	37	2	\N	\N	\N	\N
14470	547	38	1	\N	\N	\N	\N
14471	547	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.794	MODELO
14472	547	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.865	MODELO
14473	546	18	3	\N	\N	\N	\N
14474	546	19	3	\N	\N	\N	\N
14475	546	20	3	\N	\N	\N	\N
14476	546	21	2	\N	\N	\N	\N
14477	546	22	1	\N	\N	\N	\N
14478	546	23	3	\N	\N	\N	\N
14479	546	24	3	\N	\N	\N	\N
14480	546	27	2	\N	\N	\N	\N
14481	546	28	2	\N	\N	\N	\N
14482	546	29	2	\N	\N	\N	\N
14483	546	30	4	\N	\N	\N	\N
14484	546	31	2	\N	\N	\N	\N
14485	546	32	2	\N	\N	\N	\N
14486	546	33	2	\N	\N	\N	\N
14487	546	34	2	\N	\N	\N	\N
14488	546	35	1	\N	\N	\N	\N
14489	546	36	1	\N	\N	\N	\N
14490	546	37	3	\N	\N	\N	\N
14491	546	38	4	\N	\N	\N	\N
14492	546	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.874	MODELO
14493	546	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.813	MODELO
14494	545	18	1	\N	\N	\N	\N
14495	545	19	2	\N	\N	\N	\N
14496	545	20	4	\N	\N	\N	\N
14497	545	21	2	\N	\N	\N	\N
14498	545	22	2	\N	\N	\N	\N
14499	545	23	3	\N	\N	\N	\N
14500	545	24	3	\N	\N	\N	\N
14501	545	27	3	\N	\N	\N	\N
14502	545	28	3	\N	\N	\N	\N
14503	545	29	1	\N	\N	\N	\N
14504	545	30	2	\N	\N	\N	\N
14505	545	31	3	\N	\N	\N	\N
14506	545	32	3	\N	\N	\N	\N
14507	545	33	1	\N	\N	\N	\N
14508	545	34	2	\N	\N	\N	\N
14509	545	35	2	\N	\N	\N	\N
14510	545	36	4	\N	\N	\N	\N
14511	545	37	2	\N	\N	\N	\N
14512	545	38	2	\N	\N	\N	\N
14513	545	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.775	MODELO
14514	545	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.888	MODELO
14515	544	18	3	\N	\N	\N	\N
14516	544	19	3	\N	\N	\N	\N
14517	544	20	3	\N	\N	\N	\N
14518	544	21	4	\N	\N	\N	\N
14519	544	22	3	\N	\N	\N	\N
14520	544	23	2	\N	\N	\N	\N
14521	544	24	2	\N	\N	\N	\N
14522	544	27	3	\N	\N	\N	\N
14523	544	28	1	\N	\N	\N	\N
14524	544	29	2	\N	\N	\N	\N
14525	544	30	2	\N	\N	\N	\N
14526	544	31	4	\N	\N	\N	\N
14527	544	32	3	\N	\N	\N	\N
14528	544	33	3	\N	\N	\N	\N
14529	544	34	3	\N	\N	\N	\N
14530	544	35	2	\N	\N	\N	\N
14531	544	36	2	\N	\N	\N	\N
14532	544	37	3	\N	\N	\N	\N
14533	544	38	3	\N	\N	\N	\N
14534	544	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.776	MODELO
14535	544	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.808	MODELO
14536	543	18	2	\N	\N	\N	\N
14537	543	19	3	\N	\N	\N	\N
14538	543	20	3	\N	\N	\N	\N
14539	543	21	3	\N	\N	\N	\N
14540	543	22	3	\N	\N	\N	\N
14541	543	23	2	\N	\N	\N	\N
14542	543	24	3	\N	\N	\N	\N
14543	543	27	3	\N	\N	\N	\N
14544	543	28	4	\N	\N	\N	\N
14545	543	29	2	\N	\N	\N	\N
14546	543	30	3	\N	\N	\N	\N
14547	543	31	1	\N	\N	\N	\N
14548	543	32	2	\N	\N	\N	\N
14549	543	33	3	\N	\N	\N	\N
14550	543	34	3	\N	\N	\N	\N
14551	543	35	4	\N	\N	\N	\N
14552	543	36	2	\N	\N	\N	\N
14553	543	37	4	\N	\N	\N	\N
14554	543	38	2	\N	\N	\N	\N
14555	543	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.674	MODELO
14556	543	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.8	MODELO
14557	542	18	4	\N	\N	\N	\N
14558	542	19	2	\N	\N	\N	\N
14559	542	20	2	\N	\N	\N	\N
14560	542	21	3	\N	\N	\N	\N
14561	542	22	1	\N	\N	\N	\N
14562	542	23	2	\N	\N	\N	\N
14563	542	24	2	\N	\N	\N	\N
14564	542	27	4	\N	\N	\N	\N
14565	542	28	3	\N	\N	\N	\N
14566	542	29	2	\N	\N	\N	\N
14567	542	30	2	\N	\N	\N	\N
14568	542	31	3	\N	\N	\N	\N
14569	542	32	2	\N	\N	\N	\N
14570	542	33	2	\N	\N	\N	\N
14571	542	34	4	\N	\N	\N	\N
14572	542	35	3	\N	\N	\N	\N
14573	542	36	2	\N	\N	\N	\N
14574	542	37	4	\N	\N	\N	\N
14575	542	38	3	\N	\N	\N	\N
14576	542	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.785	MODELO
14577	542	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.815	MODELO
14578	541	18	2	\N	\N	\N	\N
14579	541	19	4	\N	\N	\N	\N
14580	541	20	4	\N	\N	\N	\N
14581	541	21	3	\N	\N	\N	\N
14582	541	22	3	\N	\N	\N	\N
14583	541	23	3	\N	\N	\N	\N
14584	541	24	4	\N	\N	\N	\N
14585	541	27	3	\N	\N	\N	\N
14586	541	28	3	\N	\N	\N	\N
14587	541	29	1	\N	\N	\N	\N
14588	541	30	2	\N	\N	\N	\N
14589	541	31	2	\N	\N	\N	\N
14590	541	32	3	\N	\N	\N	\N
14591	541	33	4	\N	\N	\N	\N
14592	541	34	3	\N	\N	\N	\N
14593	541	35	4	\N	\N	\N	\N
14594	541	36	2	\N	\N	\N	\N
14595	541	37	2	\N	\N	\N	\N
14596	541	38	4	\N	\N	\N	\N
14597	541	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.78	MODELO
14598	541	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.504	MODELO
14599	540	18	2	\N	\N	\N	\N
14600	540	19	3	\N	\N	\N	\N
14601	540	20	3	\N	\N	\N	\N
14602	540	21	2	\N	\N	\N	\N
14603	540	22	3	\N	\N	\N	\N
14604	540	23	4	\N	\N	\N	\N
14605	540	24	2	\N	\N	\N	\N
14606	540	27	1	\N	\N	\N	\N
14607	540	28	2	\N	\N	\N	\N
14608	540	29	3	\N	\N	\N	\N
14609	540	30	3	\N	\N	\N	\N
14610	540	31	3	\N	\N	\N	\N
14611	540	32	2	\N	\N	\N	\N
14612	540	33	2	\N	\N	\N	\N
14613	540	34	3	\N	\N	\N	\N
14614	540	35	2	\N	\N	\N	\N
14615	540	36	2	\N	\N	\N	\N
14616	540	37	3	\N	\N	\N	\N
14617	540	38	3	\N	\N	\N	\N
14618	540	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.813	MODELO
14619	540	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.588	MODELO
14620	539	18	3	\N	\N	\N	\N
14621	539	19	4	\N	\N	\N	\N
14622	539	20	2	\N	\N	\N	\N
14623	539	21	3	\N	\N	\N	\N
14624	539	22	3	\N	\N	\N	\N
14625	539	23	3	\N	\N	\N	\N
14626	539	24	3	\N	\N	\N	\N
14627	539	27	2	\N	\N	\N	\N
14628	539	28	3	\N	\N	\N	\N
14629	539	29	3	\N	\N	\N	\N
14630	539	30	1	\N	\N	\N	\N
14631	539	31	3	\N	\N	\N	\N
14632	539	32	2	\N	\N	\N	\N
14633	539	33	2	\N	\N	\N	\N
14634	539	34	3	\N	\N	\N	\N
14635	539	35	2	\N	\N	\N	\N
14636	539	36	1	\N	\N	\N	\N
14637	539	37	2	\N	\N	\N	\N
14638	539	38	3	\N	\N	\N	\N
14756	533	30	4	\N	\N	\N	\N
14757	533	31	2	\N	\N	\N	\N
14639	539	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.9	MODELO
14640	539	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.976	MODELO
14641	538	18	3	\N	\N	\N	\N
14642	538	19	3	\N	\N	\N	\N
14643	538	20	2	\N	\N	\N	\N
14644	538	21	3	\N	\N	\N	\N
14645	538	22	2	\N	\N	\N	\N
14646	538	23	4	\N	\N	\N	\N
14647	538	24	2	\N	\N	\N	\N
14648	538	27	2	\N	\N	\N	\N
14649	538	28	3	\N	\N	\N	\N
14650	538	29	3	\N	\N	\N	\N
14651	538	30	3	\N	\N	\N	\N
14652	538	31	2	\N	\N	\N	\N
14653	538	32	3	\N	\N	\N	\N
14654	538	33	2	\N	\N	\N	\N
14655	538	34	4	\N	\N	\N	\N
14656	538	35	2	\N	\N	\N	\N
14657	538	36	1	\N	\N	\N	\N
14658	538	37	3	\N	\N	\N	\N
14659	538	38	2	\N	\N	\N	\N
14660	538	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.887	MODELO
14661	538	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.817	MODELO
14662	537	18	3	\N	\N	\N	\N
14663	537	19	4	\N	\N	\N	\N
14664	537	20	3	\N	\N	\N	\N
14665	537	21	3	\N	\N	\N	\N
14666	537	22	4	\N	\N	\N	\N
14667	537	23	3	\N	\N	\N	\N
14668	537	24	4	\N	\N	\N	\N
14669	537	27	3	\N	\N	\N	\N
14670	537	28	4	\N	\N	\N	\N
14671	537	29	4	\N	\N	\N	\N
14672	537	30	2	\N	\N	\N	\N
14673	537	31	4	\N	\N	\N	\N
14674	537	32	3	\N	\N	\N	\N
14675	537	33	1	\N	\N	\N	\N
14676	537	34	3	\N	\N	\N	\N
14677	537	35	2	\N	\N	\N	\N
14678	537	36	3	\N	\N	\N	\N
14679	537	37	3	\N	\N	\N	\N
14680	537	38	3	\N	\N	\N	\N
14681	537	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.647	MODELO
14682	537	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.795	MODELO
14683	536	18	3	\N	\N	\N	\N
14684	536	19	2	\N	\N	\N	\N
14685	536	20	4	\N	\N	\N	\N
14686	536	21	3	\N	\N	\N	\N
14687	536	22	3	\N	\N	\N	\N
14688	536	23	1	\N	\N	\N	\N
14689	536	24	4	\N	\N	\N	\N
14690	536	27	3	\N	\N	\N	\N
14691	536	28	3	\N	\N	\N	\N
14692	536	29	2	\N	\N	\N	\N
14693	536	30	1	\N	\N	\N	\N
14694	536	31	4	\N	\N	\N	\N
14695	536	32	3	\N	\N	\N	\N
14696	536	33	2	\N	\N	\N	\N
14697	536	34	3	\N	\N	\N	\N
14698	536	35	3	\N	\N	\N	\N
14699	536	36	2	\N	\N	\N	\N
14700	536	37	3	\N	\N	\N	\N
14701	536	38	3	\N	\N	\N	\N
14702	536	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.916	MODELO
14703	536	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.858	MODELO
14704	535	18	3	\N	\N	\N	\N
14705	535	19	2	\N	\N	\N	\N
14706	535	20	1	\N	\N	\N	\N
14707	535	21	4	\N	\N	\N	\N
14708	535	22	2	\N	\N	\N	\N
14709	535	23	1	\N	\N	\N	\N
14710	535	24	3	\N	\N	\N	\N
14711	535	27	3	\N	\N	\N	\N
14712	535	28	2	\N	\N	\N	\N
14713	535	29	1	\N	\N	\N	\N
14714	535	30	4	\N	\N	\N	\N
14715	535	31	3	\N	\N	\N	\N
14716	535	32	1	\N	\N	\N	\N
14717	535	33	3	\N	\N	\N	\N
14718	535	34	2	\N	\N	\N	\N
14719	535	35	2	\N	\N	\N	\N
14720	535	36	4	\N	\N	\N	\N
14721	535	37	2	\N	\N	\N	\N
14722	535	38	3	\N	\N	\N	\N
14723	535	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.782	MODELO
14724	535	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.681	MODELO
14725	534	18	2	\N	\N	\N	\N
14726	534	19	2	\N	\N	\N	\N
14727	534	20	4	\N	\N	\N	\N
14728	534	21	3	\N	\N	\N	\N
14729	534	22	3	\N	\N	\N	\N
14730	534	23	3	\N	\N	\N	\N
14731	534	24	3	\N	\N	\N	\N
14732	534	27	3	\N	\N	\N	\N
14733	534	28	3	\N	\N	\N	\N
14734	534	29	3	\N	\N	\N	\N
14735	534	30	2	\N	\N	\N	\N
14736	534	31	2	\N	\N	\N	\N
14737	534	32	4	\N	\N	\N	\N
14738	534	33	3	\N	\N	\N	\N
14739	534	34	2	\N	\N	\N	\N
14740	534	35	2	\N	\N	\N	\N
14741	534	36	3	\N	\N	\N	\N
14742	534	37	4	\N	\N	\N	\N
14743	534	38	3	\N	\N	\N	\N
14744	534	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.92	MODELO
14745	534	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.559	MODELO
14746	533	18	2	\N	\N	\N	\N
14747	533	19	2	\N	\N	\N	\N
14748	533	20	3	\N	\N	\N	\N
14749	533	21	3	\N	\N	\N	\N
14750	533	22	1	\N	\N	\N	\N
14751	533	23	2	\N	\N	\N	\N
14752	533	24	2	\N	\N	\N	\N
14753	533	27	2	\N	\N	\N	\N
14754	533	28	2	\N	\N	\N	\N
14755	533	29	3	\N	\N	\N	\N
14758	533	32	3	\N	\N	\N	\N
14759	533	33	3	\N	\N	\N	\N
14760	533	34	2	\N	\N	\N	\N
14761	533	35	1	\N	\N	\N	\N
14762	533	36	2	\N	\N	\N	\N
14763	533	37	1	\N	\N	\N	\N
14764	533	38	3	\N	\N	\N	\N
14765	533	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.55	MODELO
14766	533	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.792	MODELO
14767	532	18	3	\N	\N	\N	\N
14768	532	19	3	\N	\N	\N	\N
14769	532	20	2	\N	\N	\N	\N
14770	532	21	4	\N	\N	\N	\N
14771	532	22	3	\N	\N	\N	\N
14772	532	23	3	\N	\N	\N	\N
14773	532	24	1	\N	\N	\N	\N
14774	532	27	2	\N	\N	\N	\N
14775	532	28	2	\N	\N	\N	\N
14776	532	29	2	\N	\N	\N	\N
14777	532	30	4	\N	\N	\N	\N
14778	532	31	3	\N	\N	\N	\N
14779	532	32	2	\N	\N	\N	\N
14780	532	33	3	\N	\N	\N	\N
14781	532	34	2	\N	\N	\N	\N
14782	532	35	2	\N	\N	\N	\N
14783	532	36	3	\N	\N	\N	\N
14784	532	37	2	\N	\N	\N	\N
14785	532	38	3	\N	\N	\N	\N
14786	532	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.824	MODELO
14787	532	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.747	MODELO
14788	1087	18	1	\N	\N	\N	\N
14789	1087	19	3	\N	\N	\N	\N
14790	1087	20	3	\N	\N	\N	\N
14791	1087	21	4	\N	\N	\N	\N
14792	1087	22	3	\N	\N	\N	\N
14793	1087	23	1	\N	\N	\N	\N
14794	1087	24	3	\N	\N	\N	\N
14795	1087	27	2	\N	\N	\N	\N
14796	1087	28	3	\N	\N	\N	\N
14797	1087	29	4	\N	\N	\N	\N
14798	1087	30	2	\N	\N	\N	\N
14799	1087	31	4	\N	\N	\N	\N
14800	1087	32	4	\N	\N	\N	\N
14801	1087	33	3	\N	\N	\N	\N
14802	1087	34	2	\N	\N	\N	\N
14803	1087	35	3	\N	\N	\N	\N
14804	1087	36	3	\N	\N	\N	\N
14805	1087	37	3	\N	\N	\N	\N
14806	1087	38	3	\N	\N	\N	\N
14807	1087	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.788	MODELO
14808	1087	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.706	MODELO
14809	1086	18	3	\N	\N	\N	\N
14810	1086	19	2	\N	\N	\N	\N
14811	1086	20	3	\N	\N	\N	\N
14812	1086	21	3	\N	\N	\N	\N
14813	1086	22	3	\N	\N	\N	\N
14814	1086	23	2	\N	\N	\N	\N
14815	1086	24	4	\N	\N	\N	\N
14816	1086	27	4	\N	\N	\N	\N
14817	1086	28	3	\N	\N	\N	\N
14818	1086	29	2	\N	\N	\N	\N
14819	1086	30	3	\N	\N	\N	\N
14820	1086	31	1	\N	\N	\N	\N
14821	1086	32	2	\N	\N	\N	\N
14822	1086	33	2	\N	\N	\N	\N
14823	1086	34	3	\N	\N	\N	\N
14824	1086	35	3	\N	\N	\N	\N
14825	1086	36	2	\N	\N	\N	\N
14826	1086	37	1	\N	\N	\N	\N
14827	1086	38	2	\N	\N	\N	\N
14828	1086	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.734	MODELO
14829	1086	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.883	MODELO
14830	1085	18	3	\N	\N	\N	\N
14831	1085	19	4	\N	\N	\N	\N
14832	1085	20	2	\N	\N	\N	\N
14833	1085	21	1	\N	\N	\N	\N
14834	1085	22	1	\N	\N	\N	\N
14835	1085	23	2	\N	\N	\N	\N
14836	1085	24	2	\N	\N	\N	\N
14837	1085	27	3	\N	\N	\N	\N
14838	1085	28	3	\N	\N	\N	\N
14839	1085	29	4	\N	\N	\N	\N
14840	1085	30	2	\N	\N	\N	\N
14841	1085	31	3	\N	\N	\N	\N
14842	1085	32	2	\N	\N	\N	\N
14843	1085	33	2	\N	\N	\N	\N
14844	1085	34	3	\N	\N	\N	\N
14845	1085	35	2	\N	\N	\N	\N
14846	1085	36	2	\N	\N	\N	\N
14847	1085	37	4	\N	\N	\N	\N
14848	1085	38	2	\N	\N	\N	\N
14849	1085	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.505	MODELO
14850	1085	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.757	MODELO
14851	1084	18	2	\N	\N	\N	\N
14852	1084	19	3	\N	\N	\N	\N
14853	1084	20	1	\N	\N	\N	\N
14854	1084	21	1	\N	\N	\N	\N
14855	1084	22	2	\N	\N	\N	\N
14856	1084	23	3	\N	\N	\N	\N
14857	1084	24	3	\N	\N	\N	\N
14858	1084	27	3	\N	\N	\N	\N
14859	1084	28	2	\N	\N	\N	\N
14860	1084	29	3	\N	\N	\N	\N
14861	1084	30	3	\N	\N	\N	\N
14862	1084	31	3	\N	\N	\N	\N
14863	1084	32	4	\N	\N	\N	\N
14864	1084	33	3	\N	\N	\N	\N
14865	1084	34	2	\N	\N	\N	\N
14866	1084	35	2	\N	\N	\N	\N
14867	1084	36	1	\N	\N	\N	\N
14868	1084	37	4	\N	\N	\N	\N
14869	1084	38	2	\N	\N	\N	\N
14870	1084	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.893	MODELO
14871	1084	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.72	MODELO
14872	1083	18	2	\N	\N	\N	\N
14873	1083	19	2	\N	\N	\N	\N
14874	1083	20	2	\N	\N	\N	\N
14875	1083	21	3	\N	\N	\N	\N
14876	1083	22	2	\N	\N	\N	\N
14877	1083	23	3	\N	\N	\N	\N
14878	1083	24	4	\N	\N	\N	\N
14879	1083	27	2	\N	\N	\N	\N
14880	1083	28	4	\N	\N	\N	\N
14881	1083	29	4	\N	\N	\N	\N
14882	1083	30	2	\N	\N	\N	\N
14883	1083	31	3	\N	\N	\N	\N
14884	1083	32	2	\N	\N	\N	\N
14885	1083	33	3	\N	\N	\N	\N
14886	1083	34	4	\N	\N	\N	\N
14887	1083	35	2	\N	\N	\N	\N
14888	1083	36	3	\N	\N	\N	\N
14889	1083	37	3	\N	\N	\N	\N
14890	1083	38	2	\N	\N	\N	\N
14891	1083	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.853	MODELO
14892	1083	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.724	MODELO
14893	1082	18	3	\N	\N	\N	\N
14894	1082	19	3	\N	\N	\N	\N
14895	1082	20	3	\N	\N	\N	\N
14896	1082	21	2	\N	\N	\N	\N
14897	1082	22	3	\N	\N	\N	\N
14898	1082	23	1	\N	\N	\N	\N
14899	1082	24	3	\N	\N	\N	\N
14900	1082	27	1	\N	\N	\N	\N
14901	1082	28	2	\N	\N	\N	\N
14902	1082	29	3	\N	\N	\N	\N
14903	1082	30	3	\N	\N	\N	\N
14904	1082	31	2	\N	\N	\N	\N
14905	1082	32	3	\N	\N	\N	\N
14906	1082	33	2	\N	\N	\N	\N
14907	1082	34	3	\N	\N	\N	\N
14908	1082	35	2	\N	\N	\N	\N
14909	1082	36	2	\N	\N	\N	\N
14910	1082	37	1	\N	\N	\N	\N
14911	1082	38	2	\N	\N	\N	\N
14912	1082	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.859	MODELO
14913	1082	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.721	MODELO
14914	1081	18	3	\N	\N	\N	\N
14915	1081	19	2	\N	\N	\N	\N
14916	1081	20	3	\N	\N	\N	\N
14917	1081	21	3	\N	\N	\N	\N
14918	1081	22	2	\N	\N	\N	\N
14919	1081	23	2	\N	\N	\N	\N
14920	1081	24	3	\N	\N	\N	\N
14921	1081	27	4	\N	\N	\N	\N
14922	1081	28	2	\N	\N	\N	\N
14923	1081	29	3	\N	\N	\N	\N
14924	1081	30	3	\N	\N	\N	\N
14925	1081	31	3	\N	\N	\N	\N
14926	1081	32	3	\N	\N	\N	\N
14927	1081	33	1	\N	\N	\N	\N
14928	1081	34	3	\N	\N	\N	\N
14929	1081	35	2	\N	\N	\N	\N
14930	1081	36	1	\N	\N	\N	\N
14931	1081	37	2	\N	\N	\N	\N
14932	1081	38	3	\N	\N	\N	\N
14933	1081	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.554	MODELO
14934	1081	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.975	MODELO
14935	1080	18	2	\N	\N	\N	\N
14936	1080	19	3	\N	\N	\N	\N
14937	1080	20	4	\N	\N	\N	\N
14938	1080	21	3	\N	\N	\N	\N
14939	1080	22	2	\N	\N	\N	\N
14940	1080	23	2	\N	\N	\N	\N
14941	1080	24	3	\N	\N	\N	\N
14942	1080	27	3	\N	\N	\N	\N
14943	1080	28	3	\N	\N	\N	\N
14944	1080	29	3	\N	\N	\N	\N
14945	1080	30	2	\N	\N	\N	\N
14946	1080	31	3	\N	\N	\N	\N
14947	1080	32	3	\N	\N	\N	\N
14948	1080	33	3	\N	\N	\N	\N
14949	1080	34	2	\N	\N	\N	\N
14950	1080	35	3	\N	\N	\N	\N
14951	1080	36	3	\N	\N	\N	\N
14952	1080	37	3	\N	\N	\N	\N
14953	1080	38	2	\N	\N	\N	\N
14954	1080	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.97	MODELO
14955	1080	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.811	MODELO
14956	1079	18	3	\N	\N	\N	\N
14957	1079	19	4	\N	\N	\N	\N
14958	1079	20	2	\N	\N	\N	\N
14959	1079	21	2	\N	\N	\N	\N
14960	1079	22	2	\N	\N	\N	\N
14961	1079	23	1	\N	\N	\N	\N
14962	1079	24	2	\N	\N	\N	\N
14963	1079	27	2	\N	\N	\N	\N
14964	1079	28	4	\N	\N	\N	\N
14965	1079	29	2	\N	\N	\N	\N
14966	1079	30	4	\N	\N	\N	\N
14967	1079	31	2	\N	\N	\N	\N
14968	1079	32	2	\N	\N	\N	\N
14969	1079	33	3	\N	\N	\N	\N
14970	1079	34	3	\N	\N	\N	\N
14971	1079	35	2	\N	\N	\N	\N
14972	1079	36	2	\N	\N	\N	\N
14973	1079	37	2	\N	\N	\N	\N
14974	1079	38	2	\N	\N	\N	\N
14975	1079	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.945	MODELO
14976	1079	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.968	MODELO
14977	1078	18	2	\N	\N	\N	\N
14978	1078	19	3	\N	\N	\N	\N
14979	1078	20	2	\N	\N	\N	\N
14980	1078	21	3	\N	\N	\N	\N
14981	1078	22	3	\N	\N	\N	\N
14982	1078	23	1	\N	\N	\N	\N
14983	1078	24	3	\N	\N	\N	\N
14984	1078	27	2	\N	\N	\N	\N
14985	1078	28	3	\N	\N	\N	\N
14986	1078	29	3	\N	\N	\N	\N
14987	1078	30	1	\N	\N	\N	\N
14988	1078	31	2	\N	\N	\N	\N
14989	1078	32	3	\N	\N	\N	\N
14990	1078	33	4	\N	\N	\N	\N
14991	1078	34	3	\N	\N	\N	\N
14992	1078	35	3	\N	\N	\N	\N
14993	1078	36	3	\N	\N	\N	\N
14994	1078	37	2	\N	\N	\N	\N
14995	1078	38	4	\N	\N	\N	\N
14996	1078	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.889	MODELO
14997	1078	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.697	MODELO
14998	1077	18	4	\N	\N	\N	\N
14999	1077	19	2	\N	\N	\N	\N
15000	1077	20	3	\N	\N	\N	\N
15001	1077	21	2	\N	\N	\N	\N
15002	1077	22	2	\N	\N	\N	\N
15003	1077	23	3	\N	\N	\N	\N
15004	1077	24	4	\N	\N	\N	\N
15005	1077	27	2	\N	\N	\N	\N
15006	1077	28	1	\N	\N	\N	\N
15007	1077	29	3	\N	\N	\N	\N
15008	1077	30	1	\N	\N	\N	\N
15009	1077	31	2	\N	\N	\N	\N
15010	1077	32	1	\N	\N	\N	\N
15011	1077	33	2	\N	\N	\N	\N
15012	1077	34	4	\N	\N	\N	\N
15013	1077	35	3	\N	\N	\N	\N
15014	1077	36	2	\N	\N	\N	\N
15015	1077	37	1	\N	\N	\N	\N
15016	1077	38	2	\N	\N	\N	\N
15017	1077	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.905	MODELO
15018	1077	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.896	MODELO
15019	1076	18	4	\N	\N	\N	\N
15020	1076	19	2	\N	\N	\N	\N
15021	1076	20	3	\N	\N	\N	\N
15022	1076	21	3	\N	\N	\N	\N
15023	1076	22	2	\N	\N	\N	\N
15024	1076	23	1	\N	\N	\N	\N
15025	1076	24	4	\N	\N	\N	\N
15026	1076	27	3	\N	\N	\N	\N
15027	1076	28	3	\N	\N	\N	\N
15028	1076	29	2	\N	\N	\N	\N
15029	1076	30	3	\N	\N	\N	\N
15030	1076	31	2	\N	\N	\N	\N
15031	1076	32	3	\N	\N	\N	\N
15032	1076	33	1	\N	\N	\N	\N
15033	1076	34	3	\N	\N	\N	\N
15034	1076	35	3	\N	\N	\N	\N
15035	1076	36	1	\N	\N	\N	\N
15036	1076	37	3	\N	\N	\N	\N
15037	1076	38	1	\N	\N	\N	\N
15038	1076	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.718	MODELO
15039	1076	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.706	MODELO
15040	1075	18	3	\N	\N	\N	\N
15041	1075	19	3	\N	\N	\N	\N
15042	1075	20	2	\N	\N	\N	\N
15043	1075	21	3	\N	\N	\N	\N
15044	1075	22	2	\N	\N	\N	\N
15045	1075	23	2	\N	\N	\N	\N
15046	1075	24	3	\N	\N	\N	\N
15047	1075	27	3	\N	\N	\N	\N
15048	1075	28	1	\N	\N	\N	\N
15049	1075	29	3	\N	\N	\N	\N
15050	1075	30	2	\N	\N	\N	\N
15051	1075	31	3	\N	\N	\N	\N
15052	1075	32	3	\N	\N	\N	\N
15053	1075	33	3	\N	\N	\N	\N
15054	1075	34	2	\N	\N	\N	\N
15055	1075	35	2	\N	\N	\N	\N
15056	1075	36	3	\N	\N	\N	\N
15057	1075	37	3	\N	\N	\N	\N
15058	1075	38	4	\N	\N	\N	\N
15059	1075	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.912	MODELO
15060	1075	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.57	MODELO
15061	1074	18	3	\N	\N	\N	\N
15062	1074	19	2	\N	\N	\N	\N
15063	1074	20	3	\N	\N	\N	\N
15064	1074	21	3	\N	\N	\N	\N
15065	1074	22	2	\N	\N	\N	\N
15066	1074	23	3	\N	\N	\N	\N
15067	1074	24	4	\N	\N	\N	\N
15068	1074	27	4	\N	\N	\N	\N
15069	1074	28	2	\N	\N	\N	\N
15070	1074	29	3	\N	\N	\N	\N
15071	1074	30	2	\N	\N	\N	\N
15072	1074	31	2	\N	\N	\N	\N
15073	1074	32	2	\N	\N	\N	\N
15074	1074	33	3	\N	\N	\N	\N
15075	1074	34	2	\N	\N	\N	\N
15076	1074	35	3	\N	\N	\N	\N
15077	1074	36	1	\N	\N	\N	\N
15078	1074	37	4	\N	\N	\N	\N
15079	1074	38	3	\N	\N	\N	\N
15080	1074	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.786	MODELO
15081	1074	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.954	MODELO
15082	1073	18	3	\N	\N	\N	\N
15083	1073	19	3	\N	\N	\N	\N
15084	1073	20	3	\N	\N	\N	\N
15085	1073	21	2	\N	\N	\N	\N
15086	1073	22	3	\N	\N	\N	\N
15087	1073	23	2	\N	\N	\N	\N
15088	1073	24	3	\N	\N	\N	\N
15089	1073	27	1	\N	\N	\N	\N
15090	1073	28	2	\N	\N	\N	\N
15091	1073	29	3	\N	\N	\N	\N
15092	1073	30	3	\N	\N	\N	\N
15093	1073	31	2	\N	\N	\N	\N
15094	1073	32	4	\N	\N	\N	\N
15095	1073	33	3	\N	\N	\N	\N
15096	1073	34	1	\N	\N	\N	\N
15097	1073	35	3	\N	\N	\N	\N
15098	1073	36	3	\N	\N	\N	\N
15099	1073	37	3	\N	\N	\N	\N
15100	1073	38	3	\N	\N	\N	\N
15101	1073	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.704	MODELO
15102	1073	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.753	MODELO
15103	1072	18	4	\N	\N	\N	\N
15104	1072	19	2	\N	\N	\N	\N
15105	1072	20	3	\N	\N	\N	\N
15106	1072	21	2	\N	\N	\N	\N
15107	1072	22	3	\N	\N	\N	\N
15108	1072	23	3	\N	\N	\N	\N
15109	1072	24	2	\N	\N	\N	\N
15110	1072	27	2	\N	\N	\N	\N
15111	1072	28	2	\N	\N	\N	\N
15112	1072	29	3	\N	\N	\N	\N
15113	1072	30	3	\N	\N	\N	\N
15114	1072	31	3	\N	\N	\N	\N
15115	1072	32	3	\N	\N	\N	\N
15116	1072	33	3	\N	\N	\N	\N
15117	1072	34	2	\N	\N	\N	\N
15118	1072	35	2	\N	\N	\N	\N
15119	1072	36	3	\N	\N	\N	\N
15120	1072	37	1	\N	\N	\N	\N
15121	1072	38	4	\N	\N	\N	\N
15122	1072	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.742	MODELO
15123	1072	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.756	MODELO
15124	1071	18	3	\N	\N	\N	\N
15125	1071	19	3	\N	\N	\N	\N
15126	1071	20	3	\N	\N	\N	\N
15127	1071	21	2	\N	\N	\N	\N
15128	1071	22	3	\N	\N	\N	\N
15129	1071	23	2	\N	\N	\N	\N
15130	1071	24	3	\N	\N	\N	\N
15131	1071	27	2	\N	\N	\N	\N
15132	1071	28	4	\N	\N	\N	\N
15133	1071	29	1	\N	\N	\N	\N
15134	1071	30	3	\N	\N	\N	\N
15135	1071	31	3	\N	\N	\N	\N
15136	1071	32	4	\N	\N	\N	\N
15137	1071	33	2	\N	\N	\N	\N
15138	1071	34	2	\N	\N	\N	\N
15139	1071	35	2	\N	\N	\N	\N
15140	1071	36	1	\N	\N	\N	\N
15141	1071	37	4	\N	\N	\N	\N
15142	1071	38	4	\N	\N	\N	\N
15143	1071	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.644	MODELO
15144	1071	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.806	MODELO
15145	1070	18	2	\N	\N	\N	\N
15146	1070	19	2	\N	\N	\N	\N
15147	1070	20	2	\N	\N	\N	\N
15148	1070	21	2	\N	\N	\N	\N
15149	1070	22	4	\N	\N	\N	\N
15150	1070	23	3	\N	\N	\N	\N
15151	1070	24	3	\N	\N	\N	\N
15152	1070	27	2	\N	\N	\N	\N
15153	1070	28	4	\N	\N	\N	\N
15154	1070	29	2	\N	\N	\N	\N
15155	1070	30	3	\N	\N	\N	\N
15156	1070	31	3	\N	\N	\N	\N
15157	1070	32	2	\N	\N	\N	\N
15158	1070	33	3	\N	\N	\N	\N
15159	1070	34	3	\N	\N	\N	\N
15160	1070	35	1	\N	\N	\N	\N
15161	1070	36	2	\N	\N	\N	\N
15162	1070	37	3	\N	\N	\N	\N
15163	1070	38	2	\N	\N	\N	\N
15164	1070	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.847	MODELO
15165	1070	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.924	MODELO
15166	1069	18	2	\N	\N	\N	\N
15167	1069	19	4	\N	\N	\N	\N
15168	1069	20	3	\N	\N	\N	\N
15169	1069	21	1	\N	\N	\N	\N
15170	1069	22	4	\N	\N	\N	\N
15171	1069	23	2	\N	\N	\N	\N
15172	1069	24	2	\N	\N	\N	\N
15173	1069	27	1	\N	\N	\N	\N
15174	1069	28	4	\N	\N	\N	\N
15175	1069	29	3	\N	\N	\N	\N
15176	1069	30	2	\N	\N	\N	\N
15177	1069	31	2	\N	\N	\N	\N
15178	1069	32	2	\N	\N	\N	\N
15179	1069	33	3	\N	\N	\N	\N
15180	1069	34	4	\N	\N	\N	\N
15181	1069	35	4	\N	\N	\N	\N
15182	1069	36	3	\N	\N	\N	\N
15183	1069	37	2	\N	\N	\N	\N
15184	1069	38	3	\N	\N	\N	\N
15185	1069	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.766	MODELO
15186	1069	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.68	MODELO
15187	1068	18	3	\N	\N	\N	\N
15188	1068	19	1	\N	\N	\N	\N
15189	1068	20	1	\N	\N	\N	\N
15190	1068	21	4	\N	\N	\N	\N
15191	1068	22	2	\N	\N	\N	\N
15192	1068	23	2	\N	\N	\N	\N
15193	1068	24	2	\N	\N	\N	\N
15194	1068	27	3	\N	\N	\N	\N
15195	1068	28	3	\N	\N	\N	\N
15196	1068	29	3	\N	\N	\N	\N
15197	1068	30	3	\N	\N	\N	\N
15198	1068	31	2	\N	\N	\N	\N
15199	1068	32	1	\N	\N	\N	\N
15200	1068	33	2	\N	\N	\N	\N
15201	1068	34	3	\N	\N	\N	\N
15202	1068	35	2	\N	\N	\N	\N
15203	1068	36	2	\N	\N	\N	\N
15204	1068	37	2	\N	\N	\N	\N
15205	1068	38	3	\N	\N	\N	\N
15206	1068	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.607	MODELO
15207	1068	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.55	MODELO
15208	1067	18	2	\N	\N	\N	\N
15209	1067	19	2	\N	\N	\N	\N
15210	1067	20	2	\N	\N	\N	\N
15211	1067	21	2	\N	\N	\N	\N
15212	1067	22	1	\N	\N	\N	\N
15213	1067	23	4	\N	\N	\N	\N
15214	1067	24	4	\N	\N	\N	\N
15215	1067	27	2	\N	\N	\N	\N
15216	1067	28	2	\N	\N	\N	\N
15217	1067	29	2	\N	\N	\N	\N
15218	1067	30	3	\N	\N	\N	\N
15219	1067	31	4	\N	\N	\N	\N
15220	1067	32	2	\N	\N	\N	\N
15221	1067	33	3	\N	\N	\N	\N
15222	1067	34	4	\N	\N	\N	\N
15223	1067	35	3	\N	\N	\N	\N
15224	1067	36	3	\N	\N	\N	\N
15225	1067	37	2	\N	\N	\N	\N
15226	1067	38	3	\N	\N	\N	\N
15227	1067	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.522	MODELO
15346	1061	32	3	\N	\N	\N	\N
15228	1067	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.729	MODELO
15229	1066	18	2	\N	\N	\N	\N
15230	1066	19	1	\N	\N	\N	\N
15231	1066	20	3	\N	\N	\N	\N
15232	1066	21	1	\N	\N	\N	\N
15233	1066	22	3	\N	\N	\N	\N
15234	1066	23	2	\N	\N	\N	\N
15235	1066	24	2	\N	\N	\N	\N
15236	1066	27	3	\N	\N	\N	\N
15237	1066	28	4	\N	\N	\N	\N
15238	1066	29	2	\N	\N	\N	\N
15239	1066	30	2	\N	\N	\N	\N
15240	1066	31	1	\N	\N	\N	\N
15241	1066	32	1	\N	\N	\N	\N
15242	1066	33	3	\N	\N	\N	\N
15243	1066	34	2	\N	\N	\N	\N
15244	1066	35	2	\N	\N	\N	\N
15245	1066	36	3	\N	\N	\N	\N
15246	1066	37	2	\N	\N	\N	\N
15247	1066	38	3	\N	\N	\N	\N
15248	1066	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.867	MODELO
15249	1066	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.826	MODELO
15250	1065	18	2	\N	\N	\N	\N
15251	1065	19	2	\N	\N	\N	\N
15252	1065	20	4	\N	\N	\N	\N
15253	1065	21	2	\N	\N	\N	\N
15254	1065	22	2	\N	\N	\N	\N
15255	1065	23	3	\N	\N	\N	\N
15256	1065	24	3	\N	\N	\N	\N
15257	1065	27	3	\N	\N	\N	\N
15258	1065	28	2	\N	\N	\N	\N
15259	1065	29	3	\N	\N	\N	\N
15260	1065	30	3	\N	\N	\N	\N
15261	1065	31	3	\N	\N	\N	\N
15262	1065	32	3	\N	\N	\N	\N
15263	1065	33	3	\N	\N	\N	\N
15264	1065	34	3	\N	\N	\N	\N
15265	1065	35	2	\N	\N	\N	\N
15266	1065	36	3	\N	\N	\N	\N
15267	1065	37	1	\N	\N	\N	\N
15268	1065	38	2	\N	\N	\N	\N
15269	1065	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.828	MODELO
15270	1065	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.965	MODELO
15271	1064	18	2	\N	\N	\N	\N
15272	1064	19	2	\N	\N	\N	\N
15273	1064	20	4	\N	\N	\N	\N
15274	1064	21	2	\N	\N	\N	\N
15275	1064	22	3	\N	\N	\N	\N
15276	1064	23	2	\N	\N	\N	\N
15277	1064	24	2	\N	\N	\N	\N
15278	1064	27	2	\N	\N	\N	\N
15279	1064	28	1	\N	\N	\N	\N
15280	1064	29	1	\N	\N	\N	\N
15281	1064	30	3	\N	\N	\N	\N
15282	1064	31	3	\N	\N	\N	\N
15283	1064	32	3	\N	\N	\N	\N
15284	1064	33	4	\N	\N	\N	\N
15285	1064	34	4	\N	\N	\N	\N
15286	1064	35	2	\N	\N	\N	\N
15287	1064	36	3	\N	\N	\N	\N
15288	1064	37	4	\N	\N	\N	\N
15289	1064	38	3	\N	\N	\N	\N
15290	1064	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.795	MODELO
15291	1064	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.568	MODELO
15292	1063	18	2	\N	\N	\N	\N
15293	1063	19	2	\N	\N	\N	\N
15294	1063	20	3	\N	\N	\N	\N
15295	1063	21	3	\N	\N	\N	\N
15296	1063	22	2	\N	\N	\N	\N
15297	1063	23	2	\N	\N	\N	\N
15298	1063	24	2	\N	\N	\N	\N
15299	1063	27	3	\N	\N	\N	\N
15300	1063	28	2	\N	\N	\N	\N
15301	1063	29	3	\N	\N	\N	\N
15302	1063	30	4	\N	\N	\N	\N
15303	1063	31	2	\N	\N	\N	\N
15304	1063	32	3	\N	\N	\N	\N
15305	1063	33	3	\N	\N	\N	\N
15306	1063	34	2	\N	\N	\N	\N
15307	1063	35	3	\N	\N	\N	\N
15308	1063	36	3	\N	\N	\N	\N
15309	1063	37	3	\N	\N	\N	\N
15310	1063	38	2	\N	\N	\N	\N
15311	1063	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.723	MODELO
15312	1063	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.92	MODELO
15313	1062	18	4	\N	\N	\N	\N
15314	1062	19	2	\N	\N	\N	\N
15315	1062	20	3	\N	\N	\N	\N
15316	1062	21	4	\N	\N	\N	\N
15317	1062	22	2	\N	\N	\N	\N
15318	1062	23	2	\N	\N	\N	\N
15319	1062	24	1	\N	\N	\N	\N
15320	1062	27	3	\N	\N	\N	\N
15321	1062	28	4	\N	\N	\N	\N
15322	1062	29	1	\N	\N	\N	\N
15323	1062	30	2	\N	\N	\N	\N
15324	1062	31	3	\N	\N	\N	\N
15325	1062	32	2	\N	\N	\N	\N
15326	1062	33	2	\N	\N	\N	\N
15327	1062	34	3	\N	\N	\N	\N
15328	1062	35	4	\N	\N	\N	\N
15329	1062	36	3	\N	\N	\N	\N
15330	1062	37	3	\N	\N	\N	\N
15331	1062	38	4	\N	\N	\N	\N
15332	1062	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.849	MODELO
15333	1062	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.791	MODELO
15334	1061	18	3	\N	\N	\N	\N
15335	1061	19	3	\N	\N	\N	\N
15336	1061	20	2	\N	\N	\N	\N
15337	1061	21	3	\N	\N	\N	\N
15338	1061	22	2	\N	\N	\N	\N
15339	1061	23	3	\N	\N	\N	\N
15340	1061	24	3	\N	\N	\N	\N
15341	1061	27	3	\N	\N	\N	\N
15342	1061	28	3	\N	\N	\N	\N
15343	1061	29	2	\N	\N	\N	\N
15344	1061	30	2	\N	\N	\N	\N
15345	1061	31	3	\N	\N	\N	\N
15347	1061	33	2	\N	\N	\N	\N
15348	1061	34	4	\N	\N	\N	\N
15349	1061	35	1	\N	\N	\N	\N
15350	1061	36	3	\N	\N	\N	\N
15351	1061	37	3	\N	\N	\N	\N
15352	1061	38	3	\N	\N	\N	\N
15353	1061	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.924	MODELO
15354	1061	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.537	MODELO
15355	1060	18	3	\N	\N	\N	\N
15356	1060	19	1	\N	\N	\N	\N
15357	1060	20	2	\N	\N	\N	\N
15358	1060	21	3	\N	\N	\N	\N
15359	1060	22	2	\N	\N	\N	\N
15360	1060	23	2	\N	\N	\N	\N
15361	1060	24	3	\N	\N	\N	\N
15362	1060	27	3	\N	\N	\N	\N
15363	1060	28	3	\N	\N	\N	\N
15364	1060	29	3	\N	\N	\N	\N
15365	1060	30	4	\N	\N	\N	\N
15366	1060	31	2	\N	\N	\N	\N
15367	1060	32	3	\N	\N	\N	\N
15368	1060	33	4	\N	\N	\N	\N
15369	1060	34	2	\N	\N	\N	\N
15370	1060	35	3	\N	\N	\N	\N
15371	1060	36	2	\N	\N	\N	\N
15372	1060	37	3	\N	\N	\N	\N
15373	1060	38	4	\N	\N	\N	\N
15374	1060	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.988	MODELO
15375	1060	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.909	MODELO
15376	1059	18	2	\N	\N	\N	\N
15377	1059	19	3	\N	\N	\N	\N
15378	1059	20	3	\N	\N	\N	\N
15379	1059	21	3	\N	\N	\N	\N
15380	1059	22	2	\N	\N	\N	\N
15381	1059	23	1	\N	\N	\N	\N
15382	1059	24	3	\N	\N	\N	\N
15383	1059	27	3	\N	\N	\N	\N
15384	1059	28	2	\N	\N	\N	\N
15385	1059	29	3	\N	\N	\N	\N
15386	1059	30	4	\N	\N	\N	\N
15387	1059	31	4	\N	\N	\N	\N
15388	1059	32	3	\N	\N	\N	\N
15389	1059	33	2	\N	\N	\N	\N
15390	1059	34	3	\N	\N	\N	\N
15391	1059	35	4	\N	\N	\N	\N
15392	1059	36	3	\N	\N	\N	\N
15393	1059	37	4	\N	\N	\N	\N
15394	1059	38	2	\N	\N	\N	\N
15395	1059	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.758	MODELO
15396	1059	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.739	MODELO
15397	1058	18	3	\N	\N	\N	\N
15398	1058	19	2	\N	\N	\N	\N
15399	1058	20	4	\N	\N	\N	\N
15400	1058	21	2	\N	\N	\N	\N
15401	1058	22	3	\N	\N	\N	\N
15402	1058	23	2	\N	\N	\N	\N
15403	1058	24	2	\N	\N	\N	\N
15404	1058	27	2	\N	\N	\N	\N
15405	1058	28	2	\N	\N	\N	\N
15406	1058	29	2	\N	\N	\N	\N
15407	1058	30	3	\N	\N	\N	\N
15408	1058	31	3	\N	\N	\N	\N
15409	1058	32	3	\N	\N	\N	\N
15410	1058	33	2	\N	\N	\N	\N
15411	1058	34	2	\N	\N	\N	\N
15412	1058	35	2	\N	\N	\N	\N
15413	1058	36	1	\N	\N	\N	\N
15414	1058	37	4	\N	\N	\N	\N
15415	1058	38	1	\N	\N	\N	\N
15416	1058	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.527	MODELO
15417	1058	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.542	MODELO
15418	1057	18	2	\N	\N	\N	\N
15419	1057	19	4	\N	\N	\N	\N
15420	1057	20	2	\N	\N	\N	\N
15421	1057	21	3	\N	\N	\N	\N
15422	1057	22	4	\N	\N	\N	\N
15423	1057	23	1	\N	\N	\N	\N
15424	1057	24	2	\N	\N	\N	\N
15425	1057	27	4	\N	\N	\N	\N
15426	1057	28	2	\N	\N	\N	\N
15427	1057	29	4	\N	\N	\N	\N
15428	1057	30	2	\N	\N	\N	\N
15429	1057	31	3	\N	\N	\N	\N
15430	1057	32	3	\N	\N	\N	\N
15431	1057	33	3	\N	\N	\N	\N
15432	1057	34	3	\N	\N	\N	\N
15433	1057	35	3	\N	\N	\N	\N
15434	1057	36	3	\N	\N	\N	\N
15435	1057	37	2	\N	\N	\N	\N
15436	1057	38	2	\N	\N	\N	\N
15437	1057	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.856	MODELO
15438	1057	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.956	MODELO
15439	1056	18	3	\N	\N	\N	\N
15440	1056	19	3	\N	\N	\N	\N
15441	1056	20	4	\N	\N	\N	\N
15442	1056	21	3	\N	\N	\N	\N
15443	1056	22	3	\N	\N	\N	\N
15444	1056	23	4	\N	\N	\N	\N
15445	1056	24	2	\N	\N	\N	\N
15446	1056	27	2	\N	\N	\N	\N
15447	1056	28	2	\N	\N	\N	\N
15448	1056	29	2	\N	\N	\N	\N
15449	1056	30	3	\N	\N	\N	\N
15450	1056	31	2	\N	\N	\N	\N
15451	1056	32	2	\N	\N	\N	\N
15452	1056	33	3	\N	\N	\N	\N
15453	1056	34	4	\N	\N	\N	\N
15454	1056	35	2	\N	\N	\N	\N
15455	1056	36	2	\N	\N	\N	\N
15456	1056	37	2	\N	\N	\N	\N
15457	1056	38	4	\N	\N	\N	\N
15458	1056	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.738	MODELO
15459	1056	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.82	MODELO
15460	1055	18	3	\N	\N	\N	\N
15461	1055	19	3	\N	\N	\N	\N
15462	1055	20	2	\N	\N	\N	\N
15463	1055	21	3	\N	\N	\N	\N
15464	1055	22	3	\N	\N	\N	\N
15465	1055	23	3	\N	\N	\N	\N
15466	1055	24	4	\N	\N	\N	\N
15467	1055	27	3	\N	\N	\N	\N
15468	1055	28	3	\N	\N	\N	\N
15469	1055	29	3	\N	\N	\N	\N
15470	1055	30	3	\N	\N	\N	\N
15471	1055	31	3	\N	\N	\N	\N
15472	1055	32	2	\N	\N	\N	\N
15473	1055	33	2	\N	\N	\N	\N
15474	1055	34	4	\N	\N	\N	\N
15475	1055	35	2	\N	\N	\N	\N
15476	1055	36	2	\N	\N	\N	\N
15477	1055	37	3	\N	\N	\N	\N
15478	1055	38	2	\N	\N	\N	\N
15479	1055	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.799	MODELO
15480	1055	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.57	MODELO
15481	1054	18	2	\N	\N	\N	\N
15482	1054	19	1	\N	\N	\N	\N
15483	1054	20	1	\N	\N	\N	\N
15484	1054	21	3	\N	\N	\N	\N
15485	1054	22	3	\N	\N	\N	\N
15486	1054	23	3	\N	\N	\N	\N
15487	1054	24	2	\N	\N	\N	\N
15488	1054	27	2	\N	\N	\N	\N
15489	1054	28	3	\N	\N	\N	\N
15490	1054	29	3	\N	\N	\N	\N
15491	1054	30	2	\N	\N	\N	\N
15492	1054	31	2	\N	\N	\N	\N
15493	1054	32	3	\N	\N	\N	\N
15494	1054	33	4	\N	\N	\N	\N
15495	1054	34	3	\N	\N	\N	\N
15496	1054	35	4	\N	\N	\N	\N
15497	1054	36	3	\N	\N	\N	\N
15498	1054	37	2	\N	\N	\N	\N
15499	1054	38	2	\N	\N	\N	\N
15500	1054	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.701	MODELO
15501	1054	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.774	MODELO
15502	1053	18	3	\N	\N	\N	\N
15503	1053	19	2	\N	\N	\N	\N
15504	1053	20	3	\N	\N	\N	\N
15505	1053	21	1	\N	\N	\N	\N
15506	1053	22	4	\N	\N	\N	\N
15507	1053	23	3	\N	\N	\N	\N
15508	1053	24	3	\N	\N	\N	\N
15509	1053	27	2	\N	\N	\N	\N
15510	1053	28	2	\N	\N	\N	\N
15511	1053	29	3	\N	\N	\N	\N
15512	1053	30	3	\N	\N	\N	\N
15513	1053	31	2	\N	\N	\N	\N
15514	1053	32	3	\N	\N	\N	\N
15515	1053	33	2	\N	\N	\N	\N
15516	1053	34	1	\N	\N	\N	\N
15517	1053	35	3	\N	\N	\N	\N
15518	1053	36	4	\N	\N	\N	\N
15519	1053	37	4	\N	\N	\N	\N
15520	1053	38	3	\N	\N	\N	\N
15521	1053	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.903	MODELO
15522	1053	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.854	MODELO
15523	1052	18	3	\N	\N	\N	\N
15524	1052	19	2	\N	\N	\N	\N
15525	1052	20	2	\N	\N	\N	\N
15526	1052	21	4	\N	\N	\N	\N
15527	1052	22	2	\N	\N	\N	\N
15528	1052	23	2	\N	\N	\N	\N
15529	1052	24	2	\N	\N	\N	\N
15530	1052	27	2	\N	\N	\N	\N
15531	1052	28	1	\N	\N	\N	\N
15532	1052	29	2	\N	\N	\N	\N
15533	1052	30	4	\N	\N	\N	\N
15534	1052	31	3	\N	\N	\N	\N
15535	1052	32	2	\N	\N	\N	\N
15536	1052	33	3	\N	\N	\N	\N
15537	1052	34	2	\N	\N	\N	\N
15538	1052	35	4	\N	\N	\N	\N
15539	1052	36	3	\N	\N	\N	\N
15540	1052	37	1	\N	\N	\N	\N
15541	1052	38	2	\N	\N	\N	\N
15542	1052	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.943	MODELO
15543	1052	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.78	MODELO
15544	1051	18	3	\N	\N	\N	\N
15545	1051	19	4	\N	\N	\N	\N
15546	1051	20	3	\N	\N	\N	\N
15547	1051	21	3	\N	\N	\N	\N
15548	1051	22	3	\N	\N	\N	\N
15549	1051	23	1	\N	\N	\N	\N
15550	1051	24	3	\N	\N	\N	\N
15551	1051	27	1	\N	\N	\N	\N
15552	1051	28	3	\N	\N	\N	\N
15553	1051	29	3	\N	\N	\N	\N
15554	1051	30	3	\N	\N	\N	\N
15555	1051	31	1	\N	\N	\N	\N
15556	1051	32	3	\N	\N	\N	\N
15557	1051	33	3	\N	\N	\N	\N
15558	1051	34	3	\N	\N	\N	\N
15559	1051	35	4	\N	\N	\N	\N
15560	1051	36	3	\N	\N	\N	\N
15561	1051	37	3	\N	\N	\N	\N
15562	1051	38	3	\N	\N	\N	\N
15563	1051	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.686	MODELO
15564	1051	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.522	MODELO
15565	1050	18	3	\N	\N	\N	\N
15566	1050	19	2	\N	\N	\N	\N
15567	1050	20	2	\N	\N	\N	\N
15568	1050	21	3	\N	\N	\N	\N
15569	1050	22	3	\N	\N	\N	\N
15570	1050	23	4	\N	\N	\N	\N
15571	1050	24	2	\N	\N	\N	\N
15572	1050	27	1	\N	\N	\N	\N
15573	1050	28	1	\N	\N	\N	\N
15574	1050	29	2	\N	\N	\N	\N
15575	1050	30	4	\N	\N	\N	\N
15576	1050	31	2	\N	\N	\N	\N
15577	1050	32	3	\N	\N	\N	\N
15578	1050	33	2	\N	\N	\N	\N
15579	1050	34	3	\N	\N	\N	\N
15580	1050	35	3	\N	\N	\N	\N
15581	1050	36	2	\N	\N	\N	\N
15582	1050	37	2	\N	\N	\N	\N
15583	1050	38	4	\N	\N	\N	\N
15584	1050	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.913	MODELO
15585	1050	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.532	MODELO
15586	1049	18	3	\N	\N	\N	\N
15587	1049	19	4	\N	\N	\N	\N
15588	1049	20	4	\N	\N	\N	\N
15589	1049	21	2	\N	\N	\N	\N
15590	1049	22	2	\N	\N	\N	\N
15591	1049	23	3	\N	\N	\N	\N
15592	1049	24	4	\N	\N	\N	\N
15593	1049	27	4	\N	\N	\N	\N
15594	1049	28	2	\N	\N	\N	\N
15595	1049	29	4	\N	\N	\N	\N
15596	1049	30	3	\N	\N	\N	\N
15597	1049	31	2	\N	\N	\N	\N
15598	1049	32	4	\N	\N	\N	\N
15599	1049	33	3	\N	\N	\N	\N
15600	1049	34	1	\N	\N	\N	\N
15601	1049	35	3	\N	\N	\N	\N
15602	1049	36	2	\N	\N	\N	\N
15603	1049	37	4	\N	\N	\N	\N
15604	1049	38	2	\N	\N	\N	\N
15605	1049	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.853	MODELO
15606	1049	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.941	MODELO
15607	1048	18	3	\N	\N	\N	\N
15608	1048	19	3	\N	\N	\N	\N
15609	1048	20	2	\N	\N	\N	\N
15610	1048	21	2	\N	\N	\N	\N
15611	1048	22	2	\N	\N	\N	\N
15612	1048	23	3	\N	\N	\N	\N
15613	1048	24	1	\N	\N	\N	\N
15614	1048	27	1	\N	\N	\N	\N
15615	1048	28	1	\N	\N	\N	\N
15616	1048	29	2	\N	\N	\N	\N
15617	1048	30	2	\N	\N	\N	\N
15618	1048	31	3	\N	\N	\N	\N
15619	1048	32	1	\N	\N	\N	\N
15620	1048	33	3	\N	\N	\N	\N
15621	1048	34	3	\N	\N	\N	\N
15622	1048	35	3	\N	\N	\N	\N
15623	1048	36	1	\N	\N	\N	\N
15624	1048	37	2	\N	\N	\N	\N
15625	1048	38	4	\N	\N	\N	\N
15626	1048	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.741	MODELO
15627	1048	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.643	MODELO
15628	691	18	1	\N	\N	\N	\N
15629	691	19	1	\N	\N	\N	\N
15630	691	20	3	\N	\N	\N	\N
15631	691	21	3	\N	\N	\N	\N
15632	691	22	2	\N	\N	\N	\N
15633	691	23	1	\N	\N	\N	\N
15634	691	24	2	\N	\N	\N	\N
15635	691	27	1	\N	\N	\N	\N
15636	691	28	3	\N	\N	\N	\N
15637	691	29	1	\N	\N	\N	\N
15638	691	30	1	\N	\N	\N	\N
15639	691	31	1	\N	\N	\N	\N
15640	691	32	2	\N	\N	\N	\N
15641	691	33	2	\N	\N	\N	\N
15642	691	34	2	\N	\N	\N	\N
15643	691	35	1	\N	\N	\N	\N
15644	691	36	3	\N	\N	\N	\N
15645	691	37	2	\N	\N	\N	\N
15646	691	38	2	\N	\N	\N	\N
15647	691	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.947	MODELO
15648	691	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.873	MODELO
15649	690	18	2	\N	\N	\N	\N
15650	690	19	1	\N	\N	\N	\N
15651	690	20	1	\N	\N	\N	\N
15652	690	21	3	\N	\N	\N	\N
15653	690	22	1	\N	\N	\N	\N
15654	690	23	2	\N	\N	\N	\N
15655	690	24	2	\N	\N	\N	\N
15656	690	27	1	\N	\N	\N	\N
15657	690	28	1	\N	\N	\N	\N
15658	690	29	1	\N	\N	\N	\N
15659	690	30	4	\N	\N	\N	\N
15660	690	31	2	\N	\N	\N	\N
15661	690	32	3	\N	\N	\N	\N
15662	690	33	2	\N	\N	\N	\N
15663	690	34	2	\N	\N	\N	\N
15664	690	35	2	\N	\N	\N	\N
15665	690	36	3	\N	\N	\N	\N
15666	690	37	2	\N	\N	\N	\N
15667	690	38	3	\N	\N	\N	\N
15668	690	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.672	MODELO
15669	690	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.956	MODELO
15670	689	18	1	\N	\N	\N	\N
15671	689	19	1	\N	\N	\N	\N
15672	689	20	2	\N	\N	\N	\N
15673	689	21	2	\N	\N	\N	\N
15674	689	22	3	\N	\N	\N	\N
15675	689	23	2	\N	\N	\N	\N
15676	689	24	1	\N	\N	\N	\N
15677	689	27	1	\N	\N	\N	\N
15678	689	28	2	\N	\N	\N	\N
15679	689	29	3	\N	\N	\N	\N
15680	689	30	1	\N	\N	\N	\N
15681	689	31	1	\N	\N	\N	\N
15682	689	32	2	\N	\N	\N	\N
15683	689	33	4	\N	\N	\N	\N
15684	689	34	2	\N	\N	\N	\N
15685	689	35	1	\N	\N	\N	\N
15686	689	36	2	\N	\N	\N	\N
15687	689	37	1	\N	\N	\N	\N
15688	689	38	1	\N	\N	\N	\N
15689	689	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.597	MODELO
15690	689	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.902	MODELO
15691	688	18	1	\N	\N	\N	\N
15692	688	19	1	\N	\N	\N	\N
15693	688	20	1	\N	\N	\N	\N
15694	688	21	3	\N	\N	\N	\N
15695	688	22	1	\N	\N	\N	\N
15696	688	23	3	\N	\N	\N	\N
15697	688	24	2	\N	\N	\N	\N
15698	688	27	3	\N	\N	\N	\N
15699	688	28	4	\N	\N	\N	\N
15700	688	29	1	\N	\N	\N	\N
15701	688	30	1	\N	\N	\N	\N
15702	688	31	1	\N	\N	\N	\N
15703	688	32	1	\N	\N	\N	\N
15704	688	33	1	\N	\N	\N	\N
15705	688	34	1	\N	\N	\N	\N
15706	688	35	2	\N	\N	\N	\N
15707	688	36	2	\N	\N	\N	\N
15708	688	37	3	\N	\N	\N	\N
15709	688	38	2	\N	\N	\N	\N
15710	688	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.938	MODELO
15711	688	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.947	MODELO
15712	687	18	1	\N	\N	\N	\N
15713	687	19	2	\N	\N	\N	\N
15714	687	20	2	\N	\N	\N	\N
15715	687	21	3	\N	\N	\N	\N
15716	687	22	2	\N	\N	\N	\N
15717	687	23	1	\N	\N	\N	\N
15718	687	24	4	\N	\N	\N	\N
15719	687	27	1	\N	\N	\N	\N
15720	687	28	3	\N	\N	\N	\N
15721	687	29	1	\N	\N	\N	\N
15722	687	30	2	\N	\N	\N	\N
15723	687	31	4	\N	\N	\N	\N
15724	687	32	1	\N	\N	\N	\N
15725	687	33	1	\N	\N	\N	\N
15726	687	34	3	\N	\N	\N	\N
15727	687	35	3	\N	\N	\N	\N
15728	687	36	3	\N	\N	\N	\N
15729	687	37	1	\N	\N	\N	\N
15730	687	38	1	\N	\N	\N	\N
15731	687	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.755	MODELO
15732	687	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.938	MODELO
15733	686	18	1	\N	\N	\N	\N
15734	686	19	2	\N	\N	\N	\N
15735	686	20	2	\N	\N	\N	\N
15736	686	21	1	\N	\N	\N	\N
15737	686	22	2	\N	\N	\N	\N
15738	686	23	3	\N	\N	\N	\N
15739	686	24	2	\N	\N	\N	\N
15740	686	27	1	\N	\N	\N	\N
15741	686	28	1	\N	\N	\N	\N
15742	686	29	1	\N	\N	\N	\N
15743	686	30	2	\N	\N	\N	\N
15744	686	31	1	\N	\N	\N	\N
15745	686	32	1	\N	\N	\N	\N
15746	686	33	3	\N	\N	\N	\N
15747	686	34	2	\N	\N	\N	\N
15748	686	35	1	\N	\N	\N	\N
15749	686	36	3	\N	\N	\N	\N
15750	686	37	2	\N	\N	\N	\N
15751	686	38	1	\N	\N	\N	\N
15752	686	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.663	MODELO
15753	686	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.978	MODELO
15754	685	18	2	\N	\N	\N	\N
15755	685	19	2	\N	\N	\N	\N
15756	685	20	2	\N	\N	\N	\N
15757	685	21	2	\N	\N	\N	\N
15758	685	22	3	\N	\N	\N	\N
15759	685	23	1	\N	\N	\N	\N
15760	685	24	4	\N	\N	\N	\N
15761	685	27	1	\N	\N	\N	\N
15762	685	28	1	\N	\N	\N	\N
15763	685	29	1	\N	\N	\N	\N
15764	685	30	1	\N	\N	\N	\N
15765	685	31	2	\N	\N	\N	\N
15766	685	32	1	\N	\N	\N	\N
15767	685	33	1	\N	\N	\N	\N
15768	685	34	1	\N	\N	\N	\N
15769	685	35	1	\N	\N	\N	\N
15770	685	36	2	\N	\N	\N	\N
15771	685	37	2	\N	\N	\N	\N
15772	685	38	2	\N	\N	\N	\N
15773	685	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.655	MODELO
15774	685	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.812	MODELO
15775	684	18	1	\N	\N	\N	\N
15776	684	19	1	\N	\N	\N	\N
15777	684	20	1	\N	\N	\N	\N
15778	684	21	2	\N	\N	\N	\N
15779	684	22	1	\N	\N	\N	\N
15780	684	23	2	\N	\N	\N	\N
15781	684	24	2	\N	\N	\N	\N
15782	684	27	1	\N	\N	\N	\N
15783	684	28	2	\N	\N	\N	\N
15784	684	29	2	\N	\N	\N	\N
15785	684	30	2	\N	\N	\N	\N
15786	684	31	2	\N	\N	\N	\N
15787	684	32	2	\N	\N	\N	\N
15788	684	33	2	\N	\N	\N	\N
15789	684	34	2	\N	\N	\N	\N
15790	684	35	2	\N	\N	\N	\N
15791	684	36	2	\N	\N	\N	\N
15792	684	37	2	\N	\N	\N	\N
15793	684	38	2	\N	\N	\N	\N
15794	684	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.852	MODELO
15795	684	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.842	MODELO
15796	683	18	1	\N	\N	\N	\N
15797	683	19	1	\N	\N	\N	\N
15798	683	20	2	\N	\N	\N	\N
15799	683	21	3	\N	\N	\N	\N
15800	683	22	3	\N	\N	\N	\N
15801	683	23	1	\N	\N	\N	\N
15802	683	24	1	\N	\N	\N	\N
15803	683	27	2	\N	\N	\N	\N
15804	683	28	2	\N	\N	\N	\N
15805	683	29	2	\N	\N	\N	\N
15806	683	30	1	\N	\N	\N	\N
15807	683	31	1	\N	\N	\N	\N
15808	683	32	3	\N	\N	\N	\N
15809	683	33	4	\N	\N	\N	\N
15810	683	34	4	\N	\N	\N	\N
15811	683	35	1	\N	\N	\N	\N
15812	683	36	2	\N	\N	\N	\N
15813	683	37	1	\N	\N	\N	\N
15814	683	38	2	\N	\N	\N	\N
15815	683	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.71	MODELO
15816	683	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.516	MODELO
15817	682	18	1	\N	\N	\N	\N
15818	682	19	4	\N	\N	\N	\N
15819	682	20	2	\N	\N	\N	\N
15820	682	21	2	\N	\N	\N	\N
15821	682	22	2	\N	\N	\N	\N
15822	682	23	1	\N	\N	\N	\N
15823	682	24	1	\N	\N	\N	\N
15824	682	27	1	\N	\N	\N	\N
15825	682	28	2	\N	\N	\N	\N
15826	682	29	1	\N	\N	\N	\N
15827	682	30	2	\N	\N	\N	\N
15828	682	31	1	\N	\N	\N	\N
15829	682	32	2	\N	\N	\N	\N
15830	682	33	2	\N	\N	\N	\N
15831	682	34	1	\N	\N	\N	\N
15832	682	35	1	\N	\N	\N	\N
15833	682	36	1	\N	\N	\N	\N
15834	682	37	2	\N	\N	\N	\N
15835	682	38	1	\N	\N	\N	\N
15836	682	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.553	MODELO
15837	682	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.732	MODELO
15838	681	18	1	\N	\N	\N	\N
15839	681	19	1	\N	\N	\N	\N
15840	681	20	1	\N	\N	\N	\N
15841	681	21	1	\N	\N	\N	\N
15842	681	22	3	\N	\N	\N	\N
15843	681	23	3	\N	\N	\N	\N
15844	681	24	1	\N	\N	\N	\N
15845	681	27	3	\N	\N	\N	\N
15846	681	28	2	\N	\N	\N	\N
15847	681	29	1	\N	\N	\N	\N
15848	681	30	2	\N	\N	\N	\N
15849	681	31	2	\N	\N	\N	\N
15850	681	32	1	\N	\N	\N	\N
15851	681	33	3	\N	\N	\N	\N
15852	681	34	1	\N	\N	\N	\N
15853	681	35	3	\N	\N	\N	\N
15854	681	36	2	\N	\N	\N	\N
15855	681	37	1	\N	\N	\N	\N
15856	681	38	1	\N	\N	\N	\N
15857	681	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.935	MODELO
15858	681	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.819	MODELO
15859	680	18	3	\N	\N	\N	\N
15860	680	19	3	\N	\N	\N	\N
15861	680	20	2	\N	\N	\N	\N
15862	680	21	3	\N	\N	\N	\N
15863	680	22	1	\N	\N	\N	\N
15864	680	23	1	\N	\N	\N	\N
15865	680	24	3	\N	\N	\N	\N
15866	680	27	2	\N	\N	\N	\N
15867	680	28	1	\N	\N	\N	\N
15868	680	29	2	\N	\N	\N	\N
15869	680	30	2	\N	\N	\N	\N
15870	680	31	1	\N	\N	\N	\N
15871	680	32	1	\N	\N	\N	\N
15872	680	33	1	\N	\N	\N	\N
15873	680	34	3	\N	\N	\N	\N
15874	680	35	1	\N	\N	\N	\N
15875	680	36	2	\N	\N	\N	\N
15876	680	37	1	\N	\N	\N	\N
15877	680	38	1	\N	\N	\N	\N
15878	680	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.863	MODELO
15879	680	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.948	MODELO
15880	679	18	1	\N	\N	\N	\N
15881	679	19	1	\N	\N	\N	\N
15882	679	20	1	\N	\N	\N	\N
15883	679	21	2	\N	\N	\N	\N
15884	679	22	2	\N	\N	\N	\N
15885	679	23	2	\N	\N	\N	\N
15886	679	24	4	\N	\N	\N	\N
15887	679	27	2	\N	\N	\N	\N
15888	679	28	1	\N	\N	\N	\N
15889	679	29	1	\N	\N	\N	\N
15890	679	30	3	\N	\N	\N	\N
15891	679	31	1	\N	\N	\N	\N
15892	679	32	1	\N	\N	\N	\N
15893	679	33	2	\N	\N	\N	\N
15894	679	34	2	\N	\N	\N	\N
15895	679	35	2	\N	\N	\N	\N
15896	679	36	1	\N	\N	\N	\N
15897	679	37	2	\N	\N	\N	\N
15898	679	38	3	\N	\N	\N	\N
15899	679	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.839	MODELO
15900	679	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.962	MODELO
15901	678	18	2	\N	\N	\N	\N
15902	678	19	2	\N	\N	\N	\N
15903	678	20	1	\N	\N	\N	\N
15904	678	21	1	\N	\N	\N	\N
15905	678	22	1	\N	\N	\N	\N
15906	678	23	1	\N	\N	\N	\N
15907	678	24	2	\N	\N	\N	\N
15908	678	27	1	\N	\N	\N	\N
15909	678	28	1	\N	\N	\N	\N
15910	678	29	1	\N	\N	\N	\N
15911	678	30	1	\N	\N	\N	\N
15912	678	31	3	\N	\N	\N	\N
15913	678	32	2	\N	\N	\N	\N
15914	678	33	1	\N	\N	\N	\N
15915	678	34	2	\N	\N	\N	\N
15916	678	35	3	\N	\N	\N	\N
15917	678	36	1	\N	\N	\N	\N
15918	678	37	2	\N	\N	\N	\N
15919	678	38	3	\N	\N	\N	\N
15920	678	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.604	MODELO
15921	678	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.703	MODELO
15922	677	18	2	\N	\N	\N	\N
15923	677	19	2	\N	\N	\N	\N
15924	677	20	2	\N	\N	\N	\N
15925	677	21	2	\N	\N	\N	\N
15926	677	22	2	\N	\N	\N	\N
15927	677	23	2	\N	\N	\N	\N
15928	677	24	2	\N	\N	\N	\N
15929	677	27	1	\N	\N	\N	\N
15930	677	28	3	\N	\N	\N	\N
15931	677	29	1	\N	\N	\N	\N
15932	677	30	3	\N	\N	\N	\N
15933	677	31	3	\N	\N	\N	\N
15934	677	32	1	\N	\N	\N	\N
15935	677	33	2	\N	\N	\N	\N
15936	677	34	3	\N	\N	\N	\N
15937	677	35	2	\N	\N	\N	\N
15938	677	36	2	\N	\N	\N	\N
15939	677	37	1	\N	\N	\N	\N
15940	677	38	1	\N	\N	\N	\N
15941	677	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.896	MODELO
15942	677	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.968	MODELO
15943	676	18	1	\N	\N	\N	\N
15944	676	19	2	\N	\N	\N	\N
15945	676	20	2	\N	\N	\N	\N
15946	676	21	2	\N	\N	\N	\N
15947	676	22	2	\N	\N	\N	\N
15948	676	23	1	\N	\N	\N	\N
15949	676	24	1	\N	\N	\N	\N
15950	676	27	2	\N	\N	\N	\N
15951	676	28	1	\N	\N	\N	\N
15952	676	29	3	\N	\N	\N	\N
15953	676	30	1	\N	\N	\N	\N
15954	676	31	2	\N	\N	\N	\N
15955	676	32	2	\N	\N	\N	\N
15956	676	33	2	\N	\N	\N	\N
15957	676	34	1	\N	\N	\N	\N
15958	676	35	2	\N	\N	\N	\N
15959	676	36	2	\N	\N	\N	\N
15960	676	37	1	\N	\N	\N	\N
15961	676	38	4	\N	\N	\N	\N
15962	676	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.975	MODELO
15963	676	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.748	MODELO
15964	675	18	1	\N	\N	\N	\N
15965	675	19	1	\N	\N	\N	\N
15966	675	20	1	\N	\N	\N	\N
15967	675	21	2	\N	\N	\N	\N
15968	675	22	1	\N	\N	\N	\N
15969	675	23	2	\N	\N	\N	\N
15970	675	24	2	\N	\N	\N	\N
15971	675	27	2	\N	\N	\N	\N
15972	675	28	1	\N	\N	\N	\N
15973	675	29	2	\N	\N	\N	\N
15974	675	30	2	\N	\N	\N	\N
15975	675	31	2	\N	\N	\N	\N
15976	675	32	2	\N	\N	\N	\N
15977	675	33	3	\N	\N	\N	\N
15978	675	34	2	\N	\N	\N	\N
15979	675	35	2	\N	\N	\N	\N
15980	675	36	1	\N	\N	\N	\N
15981	675	37	1	\N	\N	\N	\N
15982	675	38	3	\N	\N	\N	\N
15983	675	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.959	MODELO
15984	675	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.733	MODELO
15985	674	18	1	\N	\N	\N	\N
15986	674	19	1	\N	\N	\N	\N
15987	674	20	1	\N	\N	\N	\N
15988	674	21	1	\N	\N	\N	\N
15989	674	22	1	\N	\N	\N	\N
15990	674	23	1	\N	\N	\N	\N
15991	674	24	2	\N	\N	\N	\N
15992	674	27	1	\N	\N	\N	\N
15993	674	28	1	\N	\N	\N	\N
15994	674	29	2	\N	\N	\N	\N
15995	674	30	1	\N	\N	\N	\N
15996	674	31	1	\N	\N	\N	\N
15997	674	32	2	\N	\N	\N	\N
15998	674	33	1	\N	\N	\N	\N
15999	674	34	1	\N	\N	\N	\N
16000	674	35	2	\N	\N	\N	\N
16001	674	36	2	\N	\N	\N	\N
16002	674	37	1	\N	\N	\N	\N
16003	674	38	2	\N	\N	\N	\N
16004	674	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.561	MODELO
16005	674	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.824	MODELO
16006	673	18	3	\N	\N	\N	\N
16007	673	19	2	\N	\N	\N	\N
16008	673	20	3	\N	\N	\N	\N
16009	673	21	2	\N	\N	\N	\N
16010	673	22	1	\N	\N	\N	\N
16011	673	23	1	\N	\N	\N	\N
16012	673	24	2	\N	\N	\N	\N
16013	673	27	2	\N	\N	\N	\N
16014	673	28	1	\N	\N	\N	\N
16015	673	29	1	\N	\N	\N	\N
16016	673	30	3	\N	\N	\N	\N
16017	673	31	1	\N	\N	\N	\N
16018	673	32	2	\N	\N	\N	\N
16019	673	33	2	\N	\N	\N	\N
16020	673	34	2	\N	\N	\N	\N
16021	673	35	1	\N	\N	\N	\N
16022	673	36	1	\N	\N	\N	\N
16023	673	37	2	\N	\N	\N	\N
16024	673	38	2	\N	\N	\N	\N
16025	673	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.785	MODELO
16026	673	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.768	MODELO
16027	672	18	2	\N	\N	\N	\N
16028	672	19	1	\N	\N	\N	\N
16029	672	20	1	\N	\N	\N	\N
16030	672	21	4	\N	\N	\N	\N
16031	672	22	1	\N	\N	\N	\N
16032	672	23	1	\N	\N	\N	\N
16033	672	24	2	\N	\N	\N	\N
16034	672	27	1	\N	\N	\N	\N
16035	672	28	3	\N	\N	\N	\N
16036	672	29	2	\N	\N	\N	\N
16037	672	30	2	\N	\N	\N	\N
16038	672	31	1	\N	\N	\N	\N
16039	672	32	2	\N	\N	\N	\N
16040	672	33	1	\N	\N	\N	\N
16041	672	34	1	\N	\N	\N	\N
16042	672	35	1	\N	\N	\N	\N
16043	672	36	2	\N	\N	\N	\N
16044	672	37	1	\N	\N	\N	\N
16045	672	38	1	\N	\N	\N	\N
16046	672	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.715	MODELO
16047	672	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.841	MODELO
16048	671	18	2	\N	\N	\N	\N
16049	671	19	1	\N	\N	\N	\N
16050	671	20	1	\N	\N	\N	\N
16051	671	21	1	\N	\N	\N	\N
16052	671	22	1	\N	\N	\N	\N
16053	671	23	1	\N	\N	\N	\N
16054	671	24	1	\N	\N	\N	\N
16055	671	27	1	\N	\N	\N	\N
16056	671	28	1	\N	\N	\N	\N
16057	671	29	2	\N	\N	\N	\N
16058	671	30	2	\N	\N	\N	\N
16059	671	31	3	\N	\N	\N	\N
16060	671	32	3	\N	\N	\N	\N
16061	671	33	3	\N	\N	\N	\N
16062	671	34	1	\N	\N	\N	\N
16063	671	35	2	\N	\N	\N	\N
16064	671	36	4	\N	\N	\N	\N
16065	671	37	1	\N	\N	\N	\N
16066	671	38	3	\N	\N	\N	\N
16067	671	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.943	MODELO
16068	671	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.955	MODELO
16069	670	18	2	\N	\N	\N	\N
16070	670	19	1	\N	\N	\N	\N
16071	670	20	1	\N	\N	\N	\N
16072	670	21	1	\N	\N	\N	\N
16073	670	22	2	\N	\N	\N	\N
16074	670	23	2	\N	\N	\N	\N
16075	670	24	1	\N	\N	\N	\N
16076	670	27	2	\N	\N	\N	\N
16077	670	28	1	\N	\N	\N	\N
16078	670	29	2	\N	\N	\N	\N
16079	670	30	2	\N	\N	\N	\N
16080	670	31	1	\N	\N	\N	\N
16081	670	32	4	\N	\N	\N	\N
16082	670	33	1	\N	\N	\N	\N
16083	670	34	1	\N	\N	\N	\N
16084	670	35	1	\N	\N	\N	\N
16085	670	36	1	\N	\N	\N	\N
16086	670	37	2	\N	\N	\N	\N
16087	670	38	1	\N	\N	\N	\N
16088	670	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.672	MODELO
16089	670	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.676	MODELO
16090	669	18	1	\N	\N	\N	\N
16091	669	19	2	\N	\N	\N	\N
16092	669	20	1	\N	\N	\N	\N
16093	669	21	2	\N	\N	\N	\N
16094	669	22	2	\N	\N	\N	\N
16095	669	23	4	\N	\N	\N	\N
16096	669	24	1	\N	\N	\N	\N
16097	669	27	1	\N	\N	\N	\N
16098	669	28	1	\N	\N	\N	\N
16099	669	29	1	\N	\N	\N	\N
16100	669	30	2	\N	\N	\N	\N
16101	669	31	1	\N	\N	\N	\N
16102	669	32	1	\N	\N	\N	\N
16103	669	33	3	\N	\N	\N	\N
16104	669	34	3	\N	\N	\N	\N
16105	669	35	3	\N	\N	\N	\N
16106	669	36	2	\N	\N	\N	\N
16107	669	37	1	\N	\N	\N	\N
16108	669	38	4	\N	\N	\N	\N
16109	669	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.78	MODELO
16110	669	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.754	MODELO
16111	668	18	2	\N	\N	\N	\N
16112	668	19	2	\N	\N	\N	\N
16113	668	20	4	\N	\N	\N	\N
16114	668	21	1	\N	\N	\N	\N
16115	668	22	2	\N	\N	\N	\N
16116	668	23	1	\N	\N	\N	\N
16117	668	24	1	\N	\N	\N	\N
16118	668	27	4	\N	\N	\N	\N
16119	668	28	1	\N	\N	\N	\N
16120	668	29	1	\N	\N	\N	\N
16121	668	30	3	\N	\N	\N	\N
16122	668	31	1	\N	\N	\N	\N
16123	668	32	2	\N	\N	\N	\N
16124	668	33	1	\N	\N	\N	\N
16125	668	34	4	\N	\N	\N	\N
16126	668	35	2	\N	\N	\N	\N
16127	668	36	3	\N	\N	\N	\N
16128	668	37	3	\N	\N	\N	\N
16129	668	38	1	\N	\N	\N	\N
16130	668	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.749	MODELO
16131	668	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.717	MODELO
16132	667	18	1	\N	\N	\N	\N
16133	667	19	3	\N	\N	\N	\N
16134	667	20	1	\N	\N	\N	\N
16135	667	21	1	\N	\N	\N	\N
16136	667	22	2	\N	\N	\N	\N
16137	667	23	2	\N	\N	\N	\N
16138	667	24	1	\N	\N	\N	\N
16139	667	27	1	\N	\N	\N	\N
16140	667	28	4	\N	\N	\N	\N
16141	667	29	1	\N	\N	\N	\N
16142	667	30	1	\N	\N	\N	\N
16143	667	31	1	\N	\N	\N	\N
16144	667	32	2	\N	\N	\N	\N
16145	667	33	1	\N	\N	\N	\N
16146	667	34	1	\N	\N	\N	\N
16147	667	35	1	\N	\N	\N	\N
16148	667	36	1	\N	\N	\N	\N
16149	667	37	1	\N	\N	\N	\N
16150	667	38	3	\N	\N	\N	\N
16151	667	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.629	MODELO
16152	667	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.887	MODELO
16153	666	18	1	\N	\N	\N	\N
16154	666	19	2	\N	\N	\N	\N
16155	666	20	1	\N	\N	\N	\N
16156	666	21	4	\N	\N	\N	\N
16157	666	22	2	\N	\N	\N	\N
16158	666	23	3	\N	\N	\N	\N
16159	666	24	2	\N	\N	\N	\N
16160	666	27	2	\N	\N	\N	\N
16161	666	28	1	\N	\N	\N	\N
16162	666	29	1	\N	\N	\N	\N
16163	666	30	1	\N	\N	\N	\N
16164	666	31	2	\N	\N	\N	\N
16165	666	32	2	\N	\N	\N	\N
16166	666	33	2	\N	\N	\N	\N
16167	666	34	1	\N	\N	\N	\N
16168	666	35	1	\N	\N	\N	\N
16169	666	36	1	\N	\N	\N	\N
16170	666	37	2	\N	\N	\N	\N
16171	666	38	1	\N	\N	\N	\N
16172	666	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.727	MODELO
16173	666	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.841	MODELO
16174	665	18	1	\N	\N	\N	\N
16175	665	19	1	\N	\N	\N	\N
16176	665	20	1	\N	\N	\N	\N
16177	665	21	3	\N	\N	\N	\N
16178	665	22	2	\N	\N	\N	\N
16179	665	23	4	\N	\N	\N	\N
16180	665	24	1	\N	\N	\N	\N
16181	665	27	2	\N	\N	\N	\N
16182	665	28	1	\N	\N	\N	\N
16183	665	29	1	\N	\N	\N	\N
16184	665	30	2	\N	\N	\N	\N
16185	665	31	1	\N	\N	\N	\N
16186	665	32	2	\N	\N	\N	\N
16187	665	33	2	\N	\N	\N	\N
16188	665	34	2	\N	\N	\N	\N
16189	665	35	1	\N	\N	\N	\N
16190	665	36	1	\N	\N	\N	\N
16191	665	37	1	\N	\N	\N	\N
16192	665	38	2	\N	\N	\N	\N
16193	665	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.725	MODELO
16194	665	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.795	MODELO
16195	664	18	1	\N	\N	\N	\N
16196	664	19	1	\N	\N	\N	\N
16197	664	20	1	\N	\N	\N	\N
16198	664	21	1	\N	\N	\N	\N
16199	664	22	1	\N	\N	\N	\N
16200	664	23	2	\N	\N	\N	\N
16201	664	24	1	\N	\N	\N	\N
16202	664	27	2	\N	\N	\N	\N
16203	664	28	2	\N	\N	\N	\N
16204	664	29	3	\N	\N	\N	\N
16205	664	30	1	\N	\N	\N	\N
16206	664	31	1	\N	\N	\N	\N
16207	664	32	2	\N	\N	\N	\N
16208	664	33	2	\N	\N	\N	\N
16209	664	34	1	\N	\N	\N	\N
16210	664	35	1	\N	\N	\N	\N
16211	664	36	1	\N	\N	\N	\N
16212	664	37	2	\N	\N	\N	\N
16213	664	38	1	\N	\N	\N	\N
16214	664	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.869	MODELO
16215	664	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.699	MODELO
16216	663	18	1	\N	\N	\N	\N
16217	663	19	2	\N	\N	\N	\N
16218	663	20	1	\N	\N	\N	\N
16219	663	21	1	\N	\N	\N	\N
16220	663	22	3	\N	\N	\N	\N
16221	663	23	1	\N	\N	\N	\N
16222	663	24	3	\N	\N	\N	\N
16223	663	27	3	\N	\N	\N	\N
16224	663	28	2	\N	\N	\N	\N
16225	663	29	3	\N	\N	\N	\N
16226	663	30	1	\N	\N	\N	\N
16227	663	31	2	\N	\N	\N	\N
16228	663	32	1	\N	\N	\N	\N
16229	663	33	1	\N	\N	\N	\N
16230	663	34	2	\N	\N	\N	\N
16231	663	35	3	\N	\N	\N	\N
16232	663	36	2	\N	\N	\N	\N
16233	663	37	1	\N	\N	\N	\N
16234	663	38	1	\N	\N	\N	\N
16235	663	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.892	MODELO
16236	663	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.719	MODELO
16237	662	18	3	\N	\N	\N	\N
16238	662	19	3	\N	\N	\N	\N
16239	662	20	2	\N	\N	\N	\N
16240	662	21	2	\N	\N	\N	\N
16241	662	22	2	\N	\N	\N	\N
16242	662	23	2	\N	\N	\N	\N
16243	662	24	2	\N	\N	\N	\N
16244	662	27	3	\N	\N	\N	\N
16245	662	28	2	\N	\N	\N	\N
16246	662	29	2	\N	\N	\N	\N
16247	662	30	2	\N	\N	\N	\N
16248	662	31	1	\N	\N	\N	\N
16249	662	32	2	\N	\N	\N	\N
16250	662	33	2	\N	\N	\N	\N
16251	662	34	3	\N	\N	\N	\N
16252	662	35	2	\N	\N	\N	\N
16253	662	36	1	\N	\N	\N	\N
16254	662	37	1	\N	\N	\N	\N
16255	662	38	1	\N	\N	\N	\N
16256	662	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.633	MODELO
16257	662	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.627	MODELO
16258	661	18	1	\N	\N	\N	\N
16259	661	19	2	\N	\N	\N	\N
16260	661	20	1	\N	\N	\N	\N
16261	661	21	1	\N	\N	\N	\N
16262	661	22	2	\N	\N	\N	\N
16263	661	23	1	\N	\N	\N	\N
16264	661	24	3	\N	\N	\N	\N
16265	661	27	1	\N	\N	\N	\N
16266	661	28	3	\N	\N	\N	\N
16267	661	29	1	\N	\N	\N	\N
16268	661	30	1	\N	\N	\N	\N
16269	661	31	2	\N	\N	\N	\N
16270	661	32	3	\N	\N	\N	\N
16271	661	33	3	\N	\N	\N	\N
16272	661	34	2	\N	\N	\N	\N
16273	661	35	1	\N	\N	\N	\N
16274	661	36	2	\N	\N	\N	\N
16275	661	37	3	\N	\N	\N	\N
16276	661	38	1	\N	\N	\N	\N
16277	661	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.884	MODELO
16278	661	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.659	MODELO
16279	660	18	2	\N	\N	\N	\N
16280	660	19	2	\N	\N	\N	\N
16281	660	20	1	\N	\N	\N	\N
16282	660	21	1	\N	\N	\N	\N
16283	660	22	1	\N	\N	\N	\N
16284	660	23	1	\N	\N	\N	\N
16285	660	24	2	\N	\N	\N	\N
16286	660	27	1	\N	\N	\N	\N
16287	660	28	3	\N	\N	\N	\N
16288	660	29	2	\N	\N	\N	\N
16289	660	30	2	\N	\N	\N	\N
16290	660	31	2	\N	\N	\N	\N
16291	660	32	1	\N	\N	\N	\N
16292	660	33	1	\N	\N	\N	\N
16293	660	34	3	\N	\N	\N	\N
16294	660	35	1	\N	\N	\N	\N
16295	660	36	2	\N	\N	\N	\N
16296	660	37	4	\N	\N	\N	\N
16297	660	38	1	\N	\N	\N	\N
16298	660	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.954	MODELO
16299	660	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.911	MODELO
16300	659	18	1	\N	\N	\N	\N
16301	659	19	1	\N	\N	\N	\N
16302	659	20	1	\N	\N	\N	\N
16303	659	21	1	\N	\N	\N	\N
16304	659	22	3	\N	\N	\N	\N
16305	659	23	1	\N	\N	\N	\N
16306	659	24	2	\N	\N	\N	\N
16307	659	27	1	\N	\N	\N	\N
16308	659	28	4	\N	\N	\N	\N
16309	659	29	3	\N	\N	\N	\N
16310	659	30	1	\N	\N	\N	\N
16311	659	31	1	\N	\N	\N	\N
16312	659	32	3	\N	\N	\N	\N
16313	659	33	2	\N	\N	\N	\N
16314	659	34	1	\N	\N	\N	\N
16315	659	35	1	\N	\N	\N	\N
16316	659	36	1	\N	\N	\N	\N
16317	659	37	1	\N	\N	\N	\N
16318	659	38	2	\N	\N	\N	\N
16319	659	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.699	MODELO
16320	659	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.745	MODELO
16321	658	18	2	\N	\N	\N	\N
16322	658	19	1	\N	\N	\N	\N
16323	658	20	2	\N	\N	\N	\N
16324	658	21	1	\N	\N	\N	\N
16325	658	22	2	\N	\N	\N	\N
16326	658	23	3	\N	\N	\N	\N
16327	658	24	1	\N	\N	\N	\N
16328	658	27	2	\N	\N	\N	\N
16329	658	28	1	\N	\N	\N	\N
16330	658	29	1	\N	\N	\N	\N
16331	658	30	2	\N	\N	\N	\N
16332	658	31	3	\N	\N	\N	\N
16333	658	32	2	\N	\N	\N	\N
16334	658	33	1	\N	\N	\N	\N
16335	658	34	2	\N	\N	\N	\N
16336	658	35	1	\N	\N	\N	\N
16337	658	36	1	\N	\N	\N	\N
16338	658	37	2	\N	\N	\N	\N
16339	658	38	1	\N	\N	\N	\N
16340	658	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.706	MODELO
16341	658	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.952	MODELO
16342	657	18	2	\N	\N	\N	\N
16343	657	19	1	\N	\N	\N	\N
16344	657	20	1	\N	\N	\N	\N
16345	657	21	2	\N	\N	\N	\N
16346	657	22	2	\N	\N	\N	\N
16347	657	23	4	\N	\N	\N	\N
16348	657	24	3	\N	\N	\N	\N
16349	657	27	2	\N	\N	\N	\N
16350	657	28	1	\N	\N	\N	\N
16351	657	29	3	\N	\N	\N	\N
16352	657	30	3	\N	\N	\N	\N
16353	657	31	1	\N	\N	\N	\N
16354	657	32	2	\N	\N	\N	\N
16355	657	33	2	\N	\N	\N	\N
16356	657	34	2	\N	\N	\N	\N
16357	657	35	1	\N	\N	\N	\N
16358	657	36	2	\N	\N	\N	\N
16359	657	37	1	\N	\N	\N	\N
16360	657	38	3	\N	\N	\N	\N
16361	657	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.81	MODELO
16362	657	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.822	MODELO
16363	656	18	2	\N	\N	\N	\N
16364	656	19	2	\N	\N	\N	\N
16365	656	20	1	\N	\N	\N	\N
16366	656	21	1	\N	\N	\N	\N
16367	656	22	1	\N	\N	\N	\N
16368	656	23	2	\N	\N	\N	\N
16369	656	24	1	\N	\N	\N	\N
16370	656	27	1	\N	\N	\N	\N
16371	656	28	1	\N	\N	\N	\N
16372	656	29	2	\N	\N	\N	\N
16373	656	30	2	\N	\N	\N	\N
16374	656	31	2	\N	\N	\N	\N
16375	656	32	2	\N	\N	\N	\N
16376	656	33	2	\N	\N	\N	\N
16377	656	34	4	\N	\N	\N	\N
16378	656	35	1	\N	\N	\N	\N
16379	656	36	3	\N	\N	\N	\N
16380	656	37	1	\N	\N	\N	\N
16381	656	38	3	\N	\N	\N	\N
16382	656	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.962	MODELO
16383	656	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.732	MODELO
16384	655	18	2	\N	\N	\N	\N
16385	655	19	2	\N	\N	\N	\N
16386	655	20	3	\N	\N	\N	\N
16387	655	21	1	\N	\N	\N	\N
16388	655	22	1	\N	\N	\N	\N
16389	655	23	2	\N	\N	\N	\N
16390	655	24	1	\N	\N	\N	\N
16391	655	27	2	\N	\N	\N	\N
16392	655	28	3	\N	\N	\N	\N
16393	655	29	1	\N	\N	\N	\N
16394	655	30	2	\N	\N	\N	\N
16395	655	31	2	\N	\N	\N	\N
16396	655	32	1	\N	\N	\N	\N
16397	655	33	2	\N	\N	\N	\N
16398	655	34	1	\N	\N	\N	\N
16399	655	35	1	\N	\N	\N	\N
16400	655	36	2	\N	\N	\N	\N
16401	655	37	1	\N	\N	\N	\N
16402	655	38	2	\N	\N	\N	\N
16403	655	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.818	MODELO
16404	655	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.808	MODELO
16405	654	18	1	\N	\N	\N	\N
16406	654	19	2	\N	\N	\N	\N
16407	654	20	2	\N	\N	\N	\N
16408	654	21	1	\N	\N	\N	\N
16409	654	22	3	\N	\N	\N	\N
16410	654	23	2	\N	\N	\N	\N
16411	654	24	2	\N	\N	\N	\N
16412	654	27	1	\N	\N	\N	\N
16413	654	28	3	\N	\N	\N	\N
16414	654	29	2	\N	\N	\N	\N
16415	654	30	3	\N	\N	\N	\N
16416	654	31	2	\N	\N	\N	\N
16417	654	32	3	\N	\N	\N	\N
16418	654	33	1	\N	\N	\N	\N
16419	654	34	4	\N	\N	\N	\N
16420	654	35	1	\N	\N	\N	\N
16421	654	36	1	\N	\N	\N	\N
16422	654	37	1	\N	\N	\N	\N
16423	654	38	1	\N	\N	\N	\N
16424	654	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.715	MODELO
16425	654	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.76	MODELO
16426	653	18	2	\N	\N	\N	\N
16427	653	19	2	\N	\N	\N	\N
16428	653	20	2	\N	\N	\N	\N
16429	653	21	1	\N	\N	\N	\N
16430	653	22	2	\N	\N	\N	\N
16431	653	23	1	\N	\N	\N	\N
16432	653	24	2	\N	\N	\N	\N
16433	653	27	4	\N	\N	\N	\N
16434	653	28	1	\N	\N	\N	\N
16435	653	29	1	\N	\N	\N	\N
16436	653	30	2	\N	\N	\N	\N
16437	653	31	2	\N	\N	\N	\N
16438	653	32	2	\N	\N	\N	\N
16439	653	33	1	\N	\N	\N	\N
16440	653	34	2	\N	\N	\N	\N
16441	653	35	2	\N	\N	\N	\N
16442	653	36	1	\N	\N	\N	\N
16443	653	37	1	\N	\N	\N	\N
16444	653	38	3	\N	\N	\N	\N
16445	653	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.937	MODELO
16446	653	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.804	MODELO
16447	652	18	2	\N	\N	\N	\N
16448	652	19	3	\N	\N	\N	\N
16449	652	20	1	\N	\N	\N	\N
16450	652	21	3	\N	\N	\N	\N
16451	652	22	2	\N	\N	\N	\N
16452	652	23	3	\N	\N	\N	\N
16453	652	24	3	\N	\N	\N	\N
16454	652	27	2	\N	\N	\N	\N
16455	652	28	2	\N	\N	\N	\N
16456	652	29	2	\N	\N	\N	\N
16457	652	30	2	\N	\N	\N	\N
16458	652	31	3	\N	\N	\N	\N
16459	652	32	1	\N	\N	\N	\N
16460	652	33	1	\N	\N	\N	\N
16461	652	34	3	\N	\N	\N	\N
16462	652	35	1	\N	\N	\N	\N
16463	652	36	2	\N	\N	\N	\N
16464	652	37	1	\N	\N	\N	\N
16465	652	38	3	\N	\N	\N	\N
16466	652	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.839	MODELO
16467	652	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.956	MODELO
16468	651	18	1	\N	\N	\N	\N
16469	651	19	2	\N	\N	\N	\N
16470	651	20	1	\N	\N	\N	\N
16471	651	21	1	\N	\N	\N	\N
16472	651	22	3	\N	\N	\N	\N
16473	651	23	2	\N	\N	\N	\N
16474	651	24	1	\N	\N	\N	\N
16475	651	27	3	\N	\N	\N	\N
16476	651	28	4	\N	\N	\N	\N
16477	651	29	2	\N	\N	\N	\N
16478	651	30	1	\N	\N	\N	\N
16479	651	31	1	\N	\N	\N	\N
16480	651	32	2	\N	\N	\N	\N
16481	651	33	1	\N	\N	\N	\N
16482	651	34	1	\N	\N	\N	\N
16483	651	35	3	\N	\N	\N	\N
16484	651	36	2	\N	\N	\N	\N
16485	651	37	3	\N	\N	\N	\N
16486	651	38	4	\N	\N	\N	\N
16487	651	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.826	MODELO
16488	651	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.946	MODELO
16489	650	18	1	\N	\N	\N	\N
16490	650	19	1	\N	\N	\N	\N
16491	650	20	2	\N	\N	\N	\N
16492	650	21	2	\N	\N	\N	\N
16493	650	22	2	\N	\N	\N	\N
16494	650	23	2	\N	\N	\N	\N
16495	650	24	1	\N	\N	\N	\N
16496	650	27	3	\N	\N	\N	\N
16497	650	28	3	\N	\N	\N	\N
16498	650	29	3	\N	\N	\N	\N
16499	650	30	2	\N	\N	\N	\N
16500	650	31	2	\N	\N	\N	\N
16501	650	32	2	\N	\N	\N	\N
16502	650	33	3	\N	\N	\N	\N
16503	650	34	1	\N	\N	\N	\N
16504	650	35	3	\N	\N	\N	\N
16505	650	36	1	\N	\N	\N	\N
16506	650	37	1	\N	\N	\N	\N
16507	650	38	2	\N	\N	\N	\N
16508	650	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.902	MODELO
16509	650	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.903	MODELO
16510	649	18	1	\N	\N	\N	\N
16511	649	19	1	\N	\N	\N	\N
16512	649	20	1	\N	\N	\N	\N
16513	649	21	1	\N	\N	\N	\N
16514	649	22	1	\N	\N	\N	\N
16515	649	23	1	\N	\N	\N	\N
16516	649	24	1	\N	\N	\N	\N
16517	649	27	2	\N	\N	\N	\N
16518	649	28	2	\N	\N	\N	\N
16519	649	29	4	\N	\N	\N	\N
16520	649	30	1	\N	\N	\N	\N
16521	649	31	3	\N	\N	\N	\N
16522	649	32	1	\N	\N	\N	\N
16523	649	33	3	\N	\N	\N	\N
16524	649	34	2	\N	\N	\N	\N
16525	649	35	1	\N	\N	\N	\N
16526	649	36	1	\N	\N	\N	\N
16527	649	37	2	\N	\N	\N	\N
16528	649	38	1	\N	\N	\N	\N
16529	649	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.924	MODELO
16530	649	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.616	MODELO
16531	648	18	1	\N	\N	\N	\N
16532	648	19	2	\N	\N	\N	\N
16533	648	20	2	\N	\N	\N	\N
16534	648	21	1	\N	\N	\N	\N
16535	648	22	2	\N	\N	\N	\N
16536	648	23	2	\N	\N	\N	\N
16537	648	24	2	\N	\N	\N	\N
16538	648	27	1	\N	\N	\N	\N
16539	648	28	2	\N	\N	\N	\N
16540	648	29	2	\N	\N	\N	\N
16541	648	30	3	\N	\N	\N	\N
16542	648	31	1	\N	\N	\N	\N
16543	648	32	2	\N	\N	\N	\N
16544	648	33	2	\N	\N	\N	\N
16545	648	34	2	\N	\N	\N	\N
16546	648	35	2	\N	\N	\N	\N
16547	648	36	1	\N	\N	\N	\N
16548	648	37	2	\N	\N	\N	\N
16549	648	38	2	\N	\N	\N	\N
16550	648	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.741	MODELO
16551	648	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.854	MODELO
16552	647	18	2	\N	\N	\N	\N
16553	647	19	2	\N	\N	\N	\N
16554	647	20	1	\N	\N	\N	\N
16555	647	21	4	\N	\N	\N	\N
16556	647	22	2	\N	\N	\N	\N
16557	647	23	1	\N	\N	\N	\N
16558	647	24	3	\N	\N	\N	\N
16559	647	27	2	\N	\N	\N	\N
16560	647	28	4	\N	\N	\N	\N
16561	647	29	1	\N	\N	\N	\N
16562	647	30	2	\N	\N	\N	\N
16563	647	31	2	\N	\N	\N	\N
16564	647	32	2	\N	\N	\N	\N
16565	647	33	2	\N	\N	\N	\N
16566	647	34	1	\N	\N	\N	\N
16567	647	35	3	\N	\N	\N	\N
16568	647	36	1	\N	\N	\N	\N
16569	647	37	3	\N	\N	\N	\N
16570	647	38	3	\N	\N	\N	\N
16571	647	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.848	MODELO
16572	647	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.545	MODELO
16573	646	18	2	\N	\N	\N	\N
16574	646	19	1	\N	\N	\N	\N
16575	646	20	1	\N	\N	\N	\N
16576	646	21	1	\N	\N	\N	\N
16577	646	22	1	\N	\N	\N	\N
16578	646	23	2	\N	\N	\N	\N
16579	646	24	1	\N	\N	\N	\N
16580	646	27	3	\N	\N	\N	\N
16581	646	28	3	\N	\N	\N	\N
16582	646	29	3	\N	\N	\N	\N
16583	646	30	4	\N	\N	\N	\N
16584	646	31	1	\N	\N	\N	\N
16585	646	32	2	\N	\N	\N	\N
16586	646	33	3	\N	\N	\N	\N
16587	646	34	1	\N	\N	\N	\N
16588	646	35	2	\N	\N	\N	\N
16589	646	36	1	\N	\N	\N	\N
16590	646	37	1	\N	\N	\N	\N
16591	646	38	1	\N	\N	\N	\N
16592	646	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.584	MODELO
16593	646	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.751	MODELO
16594	645	18	1	\N	\N	\N	\N
16595	645	19	1	\N	\N	\N	\N
16596	645	20	2	\N	\N	\N	\N
16597	645	21	1	\N	\N	\N	\N
16598	645	22	2	\N	\N	\N	\N
16599	645	23	2	\N	\N	\N	\N
16600	645	24	2	\N	\N	\N	\N
16601	645	27	1	\N	\N	\N	\N
16602	645	28	4	\N	\N	\N	\N
16603	645	29	1	\N	\N	\N	\N
16604	645	30	1	\N	\N	\N	\N
16605	645	31	2	\N	\N	\N	\N
16606	645	32	1	\N	\N	\N	\N
16607	645	33	2	\N	\N	\N	\N
16608	645	34	3	\N	\N	\N	\N
16609	645	35	1	\N	\N	\N	\N
16610	645	36	1	\N	\N	\N	\N
16611	645	37	1	\N	\N	\N	\N
16612	645	38	1	\N	\N	\N	\N
16613	645	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.64	MODELO
16614	645	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.753	MODELO
16615	644	18	1	\N	\N	\N	\N
16616	644	19	2	\N	\N	\N	\N
16617	644	20	2	\N	\N	\N	\N
16618	644	21	1	\N	\N	\N	\N
16619	644	22	1	\N	\N	\N	\N
16620	644	23	1	\N	\N	\N	\N
16621	644	24	1	\N	\N	\N	\N
16622	644	27	1	\N	\N	\N	\N
16623	644	28	3	\N	\N	\N	\N
16624	644	29	1	\N	\N	\N	\N
16625	644	30	2	\N	\N	\N	\N
16626	644	31	4	\N	\N	\N	\N
16627	644	32	1	\N	\N	\N	\N
16628	644	33	4	\N	\N	\N	\N
16629	644	34	1	\N	\N	\N	\N
16630	644	35	1	\N	\N	\N	\N
16631	644	36	2	\N	\N	\N	\N
16632	644	37	2	\N	\N	\N	\N
16633	644	38	3	\N	\N	\N	\N
16634	644	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.779	MODELO
16635	644	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.772	MODELO
16636	643	18	2	\N	\N	\N	\N
16637	643	19	2	\N	\N	\N	\N
16638	643	20	3	\N	\N	\N	\N
16639	643	21	1	\N	\N	\N	\N
16640	643	22	2	\N	\N	\N	\N
16641	643	23	1	\N	\N	\N	\N
16642	643	24	1	\N	\N	\N	\N
16643	643	27	1	\N	\N	\N	\N
16644	643	28	1	\N	\N	\N	\N
16645	643	29	1	\N	\N	\N	\N
16646	643	30	1	\N	\N	\N	\N
16647	643	31	1	\N	\N	\N	\N
16648	643	32	4	\N	\N	\N	\N
16649	643	33	1	\N	\N	\N	\N
16650	643	34	1	\N	\N	\N	\N
16651	643	35	1	\N	\N	\N	\N
16652	643	36	3	\N	\N	\N	\N
16653	643	37	2	\N	\N	\N	\N
16654	643	38	1	\N	\N	\N	\N
16655	643	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.695	MODELO
16656	643	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.785	MODELO
16657	642	18	1	\N	\N	\N	\N
16658	642	19	1	\N	\N	\N	\N
16659	642	20	2	\N	\N	\N	\N
16660	642	21	1	\N	\N	\N	\N
16661	642	22	2	\N	\N	\N	\N
16662	642	23	1	\N	\N	\N	\N
16663	642	24	2	\N	\N	\N	\N
16664	642	27	1	\N	\N	\N	\N
16665	642	28	2	\N	\N	\N	\N
16666	642	29	1	\N	\N	\N	\N
16667	642	30	3	\N	\N	\N	\N
16668	642	31	2	\N	\N	\N	\N
16669	642	32	1	\N	\N	\N	\N
16670	642	33	3	\N	\N	\N	\N
16671	642	34	1	\N	\N	\N	\N
16672	642	35	1	\N	\N	\N	\N
16673	642	36	1	\N	\N	\N	\N
16674	642	37	1	\N	\N	\N	\N
16675	642	38	4	\N	\N	\N	\N
16676	642	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.863	MODELO
16677	642	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.765	MODELO
16678	641	18	2	\N	\N	\N	\N
16679	641	19	4	\N	\N	\N	\N
16680	641	20	1	\N	\N	\N	\N
16681	641	21	1	\N	\N	\N	\N
16682	641	22	1	\N	\N	\N	\N
16683	641	23	1	\N	\N	\N	\N
16684	641	24	3	\N	\N	\N	\N
16685	641	27	2	\N	\N	\N	\N
16686	641	28	1	\N	\N	\N	\N
16687	641	29	3	\N	\N	\N	\N
16688	641	30	3	\N	\N	\N	\N
16689	641	31	3	\N	\N	\N	\N
16690	641	32	1	\N	\N	\N	\N
16691	641	33	2	\N	\N	\N	\N
16692	641	34	2	\N	\N	\N	\N
16693	641	35	1	\N	\N	\N	\N
16694	641	36	1	\N	\N	\N	\N
16695	641	37	1	\N	\N	\N	\N
16696	641	38	1	\N	\N	\N	\N
16697	641	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.789	MODELO
16698	641	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.726	MODELO
16699	640	18	1	\N	\N	\N	\N
16700	640	19	2	\N	\N	\N	\N
16701	640	20	4	\N	\N	\N	\N
16702	640	21	1	\N	\N	\N	\N
16703	640	22	2	\N	\N	\N	\N
16704	640	23	1	\N	\N	\N	\N
16705	640	24	3	\N	\N	\N	\N
16706	640	27	1	\N	\N	\N	\N
16707	640	28	4	\N	\N	\N	\N
16708	640	29	2	\N	\N	\N	\N
16709	640	30	1	\N	\N	\N	\N
16710	640	31	1	\N	\N	\N	\N
16711	640	32	3	\N	\N	\N	\N
16712	640	33	1	\N	\N	\N	\N
16713	640	34	2	\N	\N	\N	\N
16714	640	35	1	\N	\N	\N	\N
16715	640	36	1	\N	\N	\N	\N
16716	640	37	2	\N	\N	\N	\N
16717	640	38	3	\N	\N	\N	\N
16718	640	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.949	MODELO
16719	640	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.513	MODELO
16720	639	18	1	\N	\N	\N	\N
16721	639	19	3	\N	\N	\N	\N
16722	639	20	3	\N	\N	\N	\N
16723	639	21	1	\N	\N	\N	\N
16724	639	22	2	\N	\N	\N	\N
16725	639	23	1	\N	\N	\N	\N
16726	639	24	2	\N	\N	\N	\N
16727	639	27	3	\N	\N	\N	\N
16728	639	28	2	\N	\N	\N	\N
16729	639	29	3	\N	\N	\N	\N
16730	639	30	2	\N	\N	\N	\N
16731	639	31	2	\N	\N	\N	\N
16732	639	32	1	\N	\N	\N	\N
16733	639	33	3	\N	\N	\N	\N
16734	639	34	2	\N	\N	\N	\N
16735	639	35	1	\N	\N	\N	\N
16736	639	36	2	\N	\N	\N	\N
16737	639	37	3	\N	\N	\N	\N
16738	639	38	2	\N	\N	\N	\N
16739	639	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.916	MODELO
16740	639	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.605	MODELO
16741	638	18	1	\N	\N	\N	\N
16742	638	19	3	\N	\N	\N	\N
16743	638	20	1	\N	\N	\N	\N
16744	638	21	1	\N	\N	\N	\N
16745	638	22	2	\N	\N	\N	\N
16746	638	23	2	\N	\N	\N	\N
16747	638	24	3	\N	\N	\N	\N
16748	638	27	1	\N	\N	\N	\N
16749	638	28	1	\N	\N	\N	\N
16750	638	29	1	\N	\N	\N	\N
16751	638	30	2	\N	\N	\N	\N
16752	638	31	2	\N	\N	\N	\N
16753	638	32	2	\N	\N	\N	\N
16754	638	33	1	\N	\N	\N	\N
16755	638	34	1	\N	\N	\N	\N
16756	638	35	2	\N	\N	\N	\N
16757	638	36	1	\N	\N	\N	\N
16758	638	37	2	\N	\N	\N	\N
16759	638	38	1	\N	\N	\N	\N
16760	638	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.968	MODELO
16761	638	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.85	MODELO
16762	637	18	1	\N	\N	\N	\N
16763	637	19	2	\N	\N	\N	\N
16764	637	20	2	\N	\N	\N	\N
16765	637	21	2	\N	\N	\N	\N
16766	637	22	2	\N	\N	\N	\N
16767	637	23	2	\N	\N	\N	\N
16768	637	24	3	\N	\N	\N	\N
16769	637	27	3	\N	\N	\N	\N
16770	637	28	2	\N	\N	\N	\N
16771	637	29	1	\N	\N	\N	\N
16772	637	30	1	\N	\N	\N	\N
16773	637	31	2	\N	\N	\N	\N
16774	637	32	1	\N	\N	\N	\N
16775	637	33	2	\N	\N	\N	\N
16776	637	34	1	\N	\N	\N	\N
16777	637	35	2	\N	\N	\N	\N
16778	637	36	4	\N	\N	\N	\N
16779	637	37	1	\N	\N	\N	\N
16780	637	38	2	\N	\N	\N	\N
16781	637	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.776	MODELO
16782	637	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.892	MODELO
16783	636	18	2	\N	\N	\N	\N
16784	636	19	2	\N	\N	\N	\N
16785	636	20	2	\N	\N	\N	\N
16786	636	21	1	\N	\N	\N	\N
16787	636	22	1	\N	\N	\N	\N
16788	636	23	3	\N	\N	\N	\N
16789	636	24	2	\N	\N	\N	\N
16790	636	27	1	\N	\N	\N	\N
16791	636	28	2	\N	\N	\N	\N
16792	636	29	1	\N	\N	\N	\N
16793	636	30	1	\N	\N	\N	\N
16794	636	31	2	\N	\N	\N	\N
16795	636	32	1	\N	\N	\N	\N
16796	636	33	2	\N	\N	\N	\N
16797	636	34	3	\N	\N	\N	\N
16798	636	35	2	\N	\N	\N	\N
16799	636	36	2	\N	\N	\N	\N
16800	636	37	2	\N	\N	\N	\N
16801	636	38	1	\N	\N	\N	\N
16802	636	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.684	MODELO
16803	636	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.78	MODELO
16804	635	18	3	\N	\N	\N	\N
16805	635	19	2	\N	\N	\N	\N
16806	635	20	1	\N	\N	\N	\N
16807	635	21	1	\N	\N	\N	\N
16808	635	22	3	\N	\N	\N	\N
16809	635	23	2	\N	\N	\N	\N
16810	635	24	1	\N	\N	\N	\N
16811	635	27	2	\N	\N	\N	\N
16812	635	28	1	\N	\N	\N	\N
16813	635	29	2	\N	\N	\N	\N
16814	635	30	3	\N	\N	\N	\N
16815	635	31	1	\N	\N	\N	\N
16816	635	32	2	\N	\N	\N	\N
16817	635	33	3	\N	\N	\N	\N
16818	635	34	2	\N	\N	\N	\N
16819	635	35	2	\N	\N	\N	\N
16820	635	36	2	\N	\N	\N	\N
16821	635	37	2	\N	\N	\N	\N
16822	635	38	2	\N	\N	\N	\N
16823	635	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.944	MODELO
16824	635	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.829	MODELO
16825	634	18	2	\N	\N	\N	\N
16826	634	19	4	\N	\N	\N	\N
16827	634	20	1	\N	\N	\N	\N
16828	634	21	3	\N	\N	\N	\N
16829	634	22	1	\N	\N	\N	\N
16830	634	23	1	\N	\N	\N	\N
16831	634	24	2	\N	\N	\N	\N
16832	634	27	2	\N	\N	\N	\N
16833	634	28	2	\N	\N	\N	\N
16834	634	29	2	\N	\N	\N	\N
16835	634	30	1	\N	\N	\N	\N
16836	634	31	2	\N	\N	\N	\N
16837	634	32	1	\N	\N	\N	\N
16838	634	33	3	\N	\N	\N	\N
16839	634	34	2	\N	\N	\N	\N
16840	634	35	1	\N	\N	\N	\N
16841	634	36	1	\N	\N	\N	\N
16842	634	37	1	\N	\N	\N	\N
16843	634	38	1	\N	\N	\N	\N
16844	634	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.704	MODELO
16845	634	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.502	MODELO
16846	633	18	2	\N	\N	\N	\N
16847	633	19	3	\N	\N	\N	\N
16848	633	20	1	\N	\N	\N	\N
16849	633	21	2	\N	\N	\N	\N
16850	633	22	2	\N	\N	\N	\N
16851	633	23	1	\N	\N	\N	\N
16852	633	24	3	\N	\N	\N	\N
16853	633	27	2	\N	\N	\N	\N
16854	633	28	2	\N	\N	\N	\N
16855	633	29	2	\N	\N	\N	\N
16856	633	30	4	\N	\N	\N	\N
16857	633	31	1	\N	\N	\N	\N
16858	633	32	2	\N	\N	\N	\N
16859	633	33	2	\N	\N	\N	\N
16860	633	34	1	\N	\N	\N	\N
16861	633	35	2	\N	\N	\N	\N
16862	633	36	3	\N	\N	\N	\N
16863	633	37	3	\N	\N	\N	\N
16864	633	38	2	\N	\N	\N	\N
16865	633	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.815	MODELO
16866	633	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.67	MODELO
16867	632	18	2	\N	\N	\N	\N
16868	632	19	2	\N	\N	\N	\N
16869	632	20	1	\N	\N	\N	\N
16870	632	21	2	\N	\N	\N	\N
16871	632	22	4	\N	\N	\N	\N
16872	632	23	2	\N	\N	\N	\N
16873	632	24	2	\N	\N	\N	\N
16874	632	27	1	\N	\N	\N	\N
16875	632	28	1	\N	\N	\N	\N
16876	632	29	3	\N	\N	\N	\N
16877	632	30	2	\N	\N	\N	\N
16878	632	31	2	\N	\N	\N	\N
16879	632	32	3	\N	\N	\N	\N
16880	632	33	1	\N	\N	\N	\N
16881	632	34	2	\N	\N	\N	\N
16882	632	35	3	\N	\N	\N	\N
16883	632	36	2	\N	\N	\N	\N
16884	632	37	2	\N	\N	\N	\N
16885	632	38	1	\N	\N	\N	\N
16886	632	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.889	MODELO
16887	632	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.901	MODELO
16888	631	18	3	\N	\N	\N	\N
16889	631	19	2	\N	\N	\N	\N
16890	631	20	1	\N	\N	\N	\N
16891	631	21	1	\N	\N	\N	\N
16892	631	22	2	\N	\N	\N	\N
16893	631	23	1	\N	\N	\N	\N
16894	631	24	1	\N	\N	\N	\N
16895	631	27	3	\N	\N	\N	\N
16896	631	28	1	\N	\N	\N	\N
16897	631	29	1	\N	\N	\N	\N
16898	631	30	2	\N	\N	\N	\N
16899	631	31	2	\N	\N	\N	\N
16900	631	32	2	\N	\N	\N	\N
16901	631	33	1	\N	\N	\N	\N
16902	631	34	2	\N	\N	\N	\N
16903	631	35	1	\N	\N	\N	\N
16904	631	36	3	\N	\N	\N	\N
16905	631	37	2	\N	\N	\N	\N
16906	631	38	2	\N	\N	\N	\N
16907	631	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.604	MODELO
16908	631	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.719	MODELO
16909	630	18	1	\N	\N	\N	\N
16910	630	19	3	\N	\N	\N	\N
16911	630	20	1	\N	\N	\N	\N
16912	630	21	1	\N	\N	\N	\N
16913	630	22	4	\N	\N	\N	\N
16914	630	23	3	\N	\N	\N	\N
16915	630	24	1	\N	\N	\N	\N
16916	630	27	3	\N	\N	\N	\N
16917	630	28	1	\N	\N	\N	\N
16918	630	29	2	\N	\N	\N	\N
16919	630	30	1	\N	\N	\N	\N
16920	630	31	1	\N	\N	\N	\N
16921	630	32	2	\N	\N	\N	\N
16922	630	33	2	\N	\N	\N	\N
16923	630	34	1	\N	\N	\N	\N
16924	630	35	3	\N	\N	\N	\N
16925	630	36	1	\N	\N	\N	\N
16926	630	37	2	\N	\N	\N	\N
16927	630	38	2	\N	\N	\N	\N
16928	630	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.729	MODELO
16929	630	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.914	MODELO
16930	629	18	1	\N	\N	\N	\N
16931	629	19	1	\N	\N	\N	\N
16932	629	20	4	\N	\N	\N	\N
16933	629	21	3	\N	\N	\N	\N
16934	629	22	1	\N	\N	\N	\N
16935	629	23	3	\N	\N	\N	\N
16936	629	24	1	\N	\N	\N	\N
16937	629	27	1	\N	\N	\N	\N
16938	629	28	2	\N	\N	\N	\N
16939	629	29	1	\N	\N	\N	\N
16940	629	30	3	\N	\N	\N	\N
16941	629	31	1	\N	\N	\N	\N
16942	629	32	2	\N	\N	\N	\N
16943	629	33	2	\N	\N	\N	\N
16944	629	34	1	\N	\N	\N	\N
16945	629	35	1	\N	\N	\N	\N
16946	629	36	1	\N	\N	\N	\N
16947	629	37	1	\N	\N	\N	\N
16948	629	38	3	\N	\N	\N	\N
16949	629	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.778	MODELO
16950	629	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.864	MODELO
16951	628	18	1	\N	\N	\N	\N
16952	628	19	1	\N	\N	\N	\N
16953	628	20	4	\N	\N	\N	\N
16954	628	21	2	\N	\N	\N	\N
16955	628	22	1	\N	\N	\N	\N
16956	628	23	2	\N	\N	\N	\N
16957	628	24	1	\N	\N	\N	\N
16958	628	27	1	\N	\N	\N	\N
16959	628	28	1	\N	\N	\N	\N
16960	628	29	4	\N	\N	\N	\N
16961	628	30	1	\N	\N	\N	\N
16962	628	31	4	\N	\N	\N	\N
16963	628	32	1	\N	\N	\N	\N
16964	628	33	1	\N	\N	\N	\N
16965	628	34	2	\N	\N	\N	\N
16966	628	35	2	\N	\N	\N	\N
16967	628	36	1	\N	\N	\N	\N
16968	628	37	2	\N	\N	\N	\N
16969	628	38	3	\N	\N	\N	\N
16970	628	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.818	MODELO
16971	628	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.898	MODELO
16972	627	18	1	\N	\N	\N	\N
16973	627	19	1	\N	\N	\N	\N
16974	627	20	4	\N	\N	\N	\N
16975	627	21	2	\N	\N	\N	\N
16976	627	22	3	\N	\N	\N	\N
16977	627	23	2	\N	\N	\N	\N
16978	627	24	1	\N	\N	\N	\N
16979	627	27	2	\N	\N	\N	\N
16980	627	28	1	\N	\N	\N	\N
16981	627	29	3	\N	\N	\N	\N
16982	627	30	1	\N	\N	\N	\N
16983	627	31	1	\N	\N	\N	\N
16984	627	32	4	\N	\N	\N	\N
16985	627	33	1	\N	\N	\N	\N
16986	627	34	3	\N	\N	\N	\N
16987	627	35	2	\N	\N	\N	\N
16988	627	36	3	\N	\N	\N	\N
16989	627	37	2	\N	\N	\N	\N
16990	627	38	1	\N	\N	\N	\N
16991	627	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.894	MODELO
16992	627	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.738	MODELO
16993	626	18	2	\N	\N	\N	\N
16994	626	19	1	\N	\N	\N	\N
16995	626	20	2	\N	\N	\N	\N
16996	626	21	3	\N	\N	\N	\N
16997	626	22	3	\N	\N	\N	\N
16998	626	23	1	\N	\N	\N	\N
16999	626	24	2	\N	\N	\N	\N
17000	626	27	1	\N	\N	\N	\N
17001	626	28	3	\N	\N	\N	\N
17002	626	29	1	\N	\N	\N	\N
17003	626	30	2	\N	\N	\N	\N
17004	626	31	1	\N	\N	\N	\N
17005	626	32	2	\N	\N	\N	\N
17006	626	33	2	\N	\N	\N	\N
17007	626	34	1	\N	\N	\N	\N
17008	626	35	3	\N	\N	\N	\N
17009	626	36	1	\N	\N	\N	\N
17010	626	37	3	\N	\N	\N	\N
17011	626	38	3	\N	\N	\N	\N
17012	626	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.941	MODELO
17013	626	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.706	MODELO
17014	625	18	1	\N	\N	\N	\N
17015	625	19	2	\N	\N	\N	\N
17016	625	20	2	\N	\N	\N	\N
17017	625	21	2	\N	\N	\N	\N
17018	625	22	2	\N	\N	\N	\N
17019	625	23	2	\N	\N	\N	\N
17020	625	24	2	\N	\N	\N	\N
17021	625	27	2	\N	\N	\N	\N
17022	625	28	1	\N	\N	\N	\N
17023	625	29	3	\N	\N	\N	\N
17024	625	30	1	\N	\N	\N	\N
17025	625	31	2	\N	\N	\N	\N
17026	625	32	3	\N	\N	\N	\N
17027	625	33	1	\N	\N	\N	\N
17028	625	34	2	\N	\N	\N	\N
17029	625	35	1	\N	\N	\N	\N
17030	625	36	2	\N	\N	\N	\N
17031	625	37	3	\N	\N	\N	\N
17032	625	38	2	\N	\N	\N	\N
17033	625	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.9	MODELO
17034	625	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.7	MODELO
17035	624	18	2	\N	\N	\N	\N
17036	624	19	1	\N	\N	\N	\N
17037	624	20	3	\N	\N	\N	\N
17038	624	21	2	\N	\N	\N	\N
17039	624	22	3	\N	\N	\N	\N
17040	624	23	2	\N	\N	\N	\N
17041	624	24	1	\N	\N	\N	\N
17042	624	27	2	\N	\N	\N	\N
17043	624	28	1	\N	\N	\N	\N
17044	624	29	4	\N	\N	\N	\N
17045	624	30	2	\N	\N	\N	\N
17046	624	31	3	\N	\N	\N	\N
17047	624	32	3	\N	\N	\N	\N
17048	624	33	1	\N	\N	\N	\N
17049	624	34	1	\N	\N	\N	\N
17050	624	35	1	\N	\N	\N	\N
17051	624	36	1	\N	\N	\N	\N
17052	624	37	1	\N	\N	\N	\N
17053	624	38	1	\N	\N	\N	\N
17054	624	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.658	MODELO
17055	624	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.92	MODELO
17056	623	18	2	\N	\N	\N	\N
17057	623	19	2	\N	\N	\N	\N
17058	623	20	2	\N	\N	\N	\N
17059	623	21	3	\N	\N	\N	\N
17060	623	22	1	\N	\N	\N	\N
17061	623	23	3	\N	\N	\N	\N
17062	623	24	1	\N	\N	\N	\N
17063	623	27	1	\N	\N	\N	\N
17064	623	28	2	\N	\N	\N	\N
17065	623	29	1	\N	\N	\N	\N
17066	623	30	1	\N	\N	\N	\N
17067	623	31	1	\N	\N	\N	\N
17068	623	32	2	\N	\N	\N	\N
17069	623	33	1	\N	\N	\N	\N
17070	623	34	1	\N	\N	\N	\N
17071	623	35	2	\N	\N	\N	\N
17072	623	36	4	\N	\N	\N	\N
17073	623	37	1	\N	\N	\N	\N
17074	623	38	1	\N	\N	\N	\N
17075	623	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.964	MODELO
17076	623	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.956	MODELO
17077	622	18	1	\N	\N	\N	\N
17078	622	19	1	\N	\N	\N	\N
17079	622	20	1	\N	\N	\N	\N
17080	622	21	2	\N	\N	\N	\N
17081	622	22	3	\N	\N	\N	\N
17082	622	23	2	\N	\N	\N	\N
17083	622	24	2	\N	\N	\N	\N
17084	622	27	3	\N	\N	\N	\N
17085	622	28	3	\N	\N	\N	\N
17086	622	29	2	\N	\N	\N	\N
17087	622	30	2	\N	\N	\N	\N
17088	622	31	1	\N	\N	\N	\N
17089	622	32	1	\N	\N	\N	\N
17090	622	33	3	\N	\N	\N	\N
17091	622	34	2	\N	\N	\N	\N
17092	622	35	4	\N	\N	\N	\N
17093	622	36	1	\N	\N	\N	\N
17094	622	37	3	\N	\N	\N	\N
17095	622	38	3	\N	\N	\N	\N
17096	622	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.783	MODELO
17097	622	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.584	MODELO
17098	621	18	1	\N	\N	\N	\N
17099	621	19	2	\N	\N	\N	\N
17100	621	20	1	\N	\N	\N	\N
17101	621	21	2	\N	\N	\N	\N
17102	621	22	2	\N	\N	\N	\N
17103	621	23	1	\N	\N	\N	\N
17104	621	24	1	\N	\N	\N	\N
17105	621	27	2	\N	\N	\N	\N
17106	621	28	1	\N	\N	\N	\N
17107	621	29	3	\N	\N	\N	\N
17108	621	30	1	\N	\N	\N	\N
17109	621	31	1	\N	\N	\N	\N
17110	621	32	2	\N	\N	\N	\N
17111	621	33	1	\N	\N	\N	\N
17112	621	34	3	\N	\N	\N	\N
17113	621	35	2	\N	\N	\N	\N
17114	621	36	1	\N	\N	\N	\N
17115	621	37	2	\N	\N	\N	\N
17116	621	38	3	\N	\N	\N	\N
17117	621	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.708	MODELO
17118	621	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.887	MODELO
17119	620	18	1	\N	\N	\N	\N
17120	620	19	1	\N	\N	\N	\N
17121	620	20	1	\N	\N	\N	\N
17122	620	21	3	\N	\N	\N	\N
17123	620	22	2	\N	\N	\N	\N
17124	620	23	1	\N	\N	\N	\N
17125	620	24	2	\N	\N	\N	\N
17126	620	27	2	\N	\N	\N	\N
17127	620	28	2	\N	\N	\N	\N
17128	620	29	1	\N	\N	\N	\N
17129	620	30	2	\N	\N	\N	\N
17130	620	31	2	\N	\N	\N	\N
17131	620	32	1	\N	\N	\N	\N
17132	620	33	2	\N	\N	\N	\N
17133	620	34	1	\N	\N	\N	\N
17134	620	35	3	\N	\N	\N	\N
17135	620	36	1	\N	\N	\N	\N
17136	620	37	2	\N	\N	\N	\N
17137	620	38	1	\N	\N	\N	\N
17138	620	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.929	MODELO
17139	620	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.822	MODELO
17140	619	18	1	\N	\N	\N	\N
17141	619	19	3	\N	\N	\N	\N
17142	619	20	1	\N	\N	\N	\N
17143	619	21	1	\N	\N	\N	\N
17144	619	22	1	\N	\N	\N	\N
17145	619	23	3	\N	\N	\N	\N
17146	619	24	1	\N	\N	\N	\N
17147	619	27	1	\N	\N	\N	\N
17148	619	28	4	\N	\N	\N	\N
17149	619	29	1	\N	\N	\N	\N
17150	619	30	2	\N	\N	\N	\N
17151	619	31	1	\N	\N	\N	\N
17152	619	32	1	\N	\N	\N	\N
17153	619	33	2	\N	\N	\N	\N
17154	619	34	1	\N	\N	\N	\N
17155	619	35	1	\N	\N	\N	\N
17156	619	36	1	\N	\N	\N	\N
17157	619	37	2	\N	\N	\N	\N
17158	619	38	1	\N	\N	\N	\N
17159	619	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.502	MODELO
17160	619	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.816	MODELO
17161	618	18	1	\N	\N	\N	\N
17162	618	19	1	\N	\N	\N	\N
17163	618	20	1	\N	\N	\N	\N
17164	618	21	3	\N	\N	\N	\N
17165	618	22	3	\N	\N	\N	\N
17166	618	23	2	\N	\N	\N	\N
17167	618	24	1	\N	\N	\N	\N
17168	618	27	2	\N	\N	\N	\N
17169	618	28	2	\N	\N	\N	\N
17170	618	29	1	\N	\N	\N	\N
17171	618	30	3	\N	\N	\N	\N
17172	618	31	1	\N	\N	\N	\N
17173	618	32	2	\N	\N	\N	\N
17174	618	33	2	\N	\N	\N	\N
17175	618	34	3	\N	\N	\N	\N
17176	618	35	1	\N	\N	\N	\N
17177	618	36	1	\N	\N	\N	\N
17178	618	37	2	\N	\N	\N	\N
17179	618	38	1	\N	\N	\N	\N
17180	618	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.95	MODELO
17181	618	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.763	MODELO
17182	617	18	2	\N	\N	\N	\N
17183	617	19	2	\N	\N	\N	\N
17184	617	20	1	\N	\N	\N	\N
17185	617	21	1	\N	\N	\N	\N
17186	617	22	2	\N	\N	\N	\N
17187	617	23	4	\N	\N	\N	\N
17188	617	24	2	\N	\N	\N	\N
17189	617	27	2	\N	\N	\N	\N
17190	617	28	2	\N	\N	\N	\N
17191	617	29	3	\N	\N	\N	\N
17192	617	30	2	\N	\N	\N	\N
17193	617	31	2	\N	\N	\N	\N
17194	617	32	2	\N	\N	\N	\N
17195	617	33	2	\N	\N	\N	\N
17196	617	34	2	\N	\N	\N	\N
17197	617	35	1	\N	\N	\N	\N
17198	617	36	2	\N	\N	\N	\N
17199	617	37	1	\N	\N	\N	\N
17200	617	38	1	\N	\N	\N	\N
17201	617	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.764	MODELO
17202	617	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.971	MODELO
17203	616	18	2	\N	\N	\N	\N
17204	616	19	1	\N	\N	\N	\N
17205	616	20	2	\N	\N	\N	\N
17206	616	21	2	\N	\N	\N	\N
17207	616	22	3	\N	\N	\N	\N
17208	616	23	2	\N	\N	\N	\N
17209	616	24	2	\N	\N	\N	\N
17210	616	27	2	\N	\N	\N	\N
17211	616	28	1	\N	\N	\N	\N
17212	616	29	3	\N	\N	\N	\N
17213	616	30	3	\N	\N	\N	\N
17214	616	31	1	\N	\N	\N	\N
17215	616	32	1	\N	\N	\N	\N
17216	616	33	2	\N	\N	\N	\N
17217	616	34	1	\N	\N	\N	\N
17218	616	35	2	\N	\N	\N	\N
17219	616	36	1	\N	\N	\N	\N
17220	616	37	1	\N	\N	\N	\N
17221	616	38	1	\N	\N	\N	\N
17222	616	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.641	MODELO
17223	616	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.976	MODELO
17224	615	18	1	\N	\N	\N	\N
17225	615	19	1	\N	\N	\N	\N
17226	615	20	1	\N	\N	\N	\N
17227	615	21	1	\N	\N	\N	\N
17228	615	22	2	\N	\N	\N	\N
17229	615	23	1	\N	\N	\N	\N
17230	615	24	1	\N	\N	\N	\N
17231	615	27	1	\N	\N	\N	\N
17232	615	28	1	\N	\N	\N	\N
17233	615	29	2	\N	\N	\N	\N
17234	615	30	2	\N	\N	\N	\N
17235	615	31	2	\N	\N	\N	\N
17236	615	32	2	\N	\N	\N	\N
17237	615	33	4	\N	\N	\N	\N
17238	615	34	1	\N	\N	\N	\N
17239	615	35	1	\N	\N	\N	\N
17240	615	36	1	\N	\N	\N	\N
17241	615	37	1	\N	\N	\N	\N
17242	615	38	3	\N	\N	\N	\N
17243	615	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.85	MODELO
17244	615	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.549	MODELO
17245	614	18	1	\N	\N	\N	\N
17246	614	19	2	\N	\N	\N	\N
17247	614	20	3	\N	\N	\N	\N
17248	614	21	1	\N	\N	\N	\N
17249	614	22	2	\N	\N	\N	\N
17250	614	23	3	\N	\N	\N	\N
17251	614	24	1	\N	\N	\N	\N
17252	614	27	2	\N	\N	\N	\N
17253	614	28	2	\N	\N	\N	\N
17254	614	29	2	\N	\N	\N	\N
17255	614	30	1	\N	\N	\N	\N
17256	614	31	1	\N	\N	\N	\N
17257	614	32	1	\N	\N	\N	\N
17258	614	33	2	\N	\N	\N	\N
17259	614	34	2	\N	\N	\N	\N
17260	614	35	1	\N	\N	\N	\N
17261	614	36	1	\N	\N	\N	\N
17262	614	37	2	\N	\N	\N	\N
17263	614	38	1	\N	\N	\N	\N
17264	614	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.677	MODELO
17265	614	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.817	MODELO
17266	613	18	1	\N	\N	\N	\N
17267	613	19	2	\N	\N	\N	\N
17268	613	20	2	\N	\N	\N	\N
17269	613	21	3	\N	\N	\N	\N
17270	613	22	4	\N	\N	\N	\N
17271	613	23	1	\N	\N	\N	\N
17272	613	24	1	\N	\N	\N	\N
17273	613	27	3	\N	\N	\N	\N
17274	613	28	3	\N	\N	\N	\N
17275	613	29	2	\N	\N	\N	\N
17276	613	30	2	\N	\N	\N	\N
17277	613	31	1	\N	\N	\N	\N
17278	613	32	1	\N	\N	\N	\N
17279	613	33	1	\N	\N	\N	\N
17280	613	34	1	\N	\N	\N	\N
17281	613	35	2	\N	\N	\N	\N
17282	613	36	3	\N	\N	\N	\N
17283	613	37	1	\N	\N	\N	\N
17284	613	38	1	\N	\N	\N	\N
17285	613	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.87	MODELO
17286	613	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.913	MODELO
17287	612	18	1	\N	\N	\N	\N
17288	612	19	1	\N	\N	\N	\N
17289	612	20	1	\N	\N	\N	\N
17290	612	21	2	\N	\N	\N	\N
17291	612	22	1	\N	\N	\N	\N
17292	612	23	1	\N	\N	\N	\N
17293	612	24	1	\N	\N	\N	\N
17294	612	27	1	\N	\N	\N	\N
17295	612	28	2	\N	\N	\N	\N
17296	612	29	1	\N	\N	\N	\N
17297	612	30	2	\N	\N	\N	\N
17298	612	31	3	\N	\N	\N	\N
17299	612	32	1	\N	\N	\N	\N
17300	612	33	2	\N	\N	\N	\N
17301	612	34	1	\N	\N	\N	\N
17302	612	35	1	\N	\N	\N	\N
17303	612	36	1	\N	\N	\N	\N
17304	612	37	1	\N	\N	\N	\N
17305	612	38	1	\N	\N	\N	\N
17306	612	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.781	MODELO
17307	612	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.921	MODELO
17308	1125	18	2	\N	\N	\N	\N
17309	1125	19	2	\N	\N	\N	\N
17310	1125	20	1	\N	\N	\N	\N
17311	1125	21	2	\N	\N	\N	\N
17312	1125	22	1	\N	\N	\N	\N
17313	1125	23	2	\N	\N	\N	\N
17314	1125	24	1	\N	\N	\N	\N
17315	1125	27	1	\N	\N	\N	\N
17316	1125	28	2	\N	\N	\N	\N
17317	1125	29	2	\N	\N	\N	\N
17318	1125	30	2	\N	\N	\N	\N
17319	1125	31	1	\N	\N	\N	\N
17320	1125	32	3	\N	\N	\N	\N
17321	1125	33	3	\N	\N	\N	\N
17322	1125	34	1	\N	\N	\N	\N
17323	1125	35	1	\N	\N	\N	\N
17324	1125	36	1	\N	\N	\N	\N
17325	1125	37	1	\N	\N	\N	\N
17326	1125	38	2	\N	\N	\N	\N
17327	1125	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.962	MODELO
17328	1125	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.84	MODELO
17329	1124	18	2	\N	\N	\N	\N
17330	1124	19	2	\N	\N	\N	\N
17331	1124	20	1	\N	\N	\N	\N
17332	1124	21	1	\N	\N	\N	\N
17333	1124	22	1	\N	\N	\N	\N
17334	1124	23	1	\N	\N	\N	\N
17335	1124	24	2	\N	\N	\N	\N
17336	1124	27	2	\N	\N	\N	\N
17337	1124	28	1	\N	\N	\N	\N
17338	1124	29	1	\N	\N	\N	\N
17339	1124	30	1	\N	\N	\N	\N
17340	1124	31	1	\N	\N	\N	\N
17341	1124	32	2	\N	\N	\N	\N
17342	1124	33	1	\N	\N	\N	\N
17343	1124	34	2	\N	\N	\N	\N
17344	1124	35	1	\N	\N	\N	\N
17345	1124	36	2	\N	\N	\N	\N
17346	1124	37	2	\N	\N	\N	\N
17347	1124	38	1	\N	\N	\N	\N
17348	1124	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.965	MODELO
17349	1124	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.835	MODELO
17350	1123	18	2	\N	\N	\N	\N
17351	1123	19	2	\N	\N	\N	\N
17352	1123	20	3	\N	\N	\N	\N
17353	1123	21	1	\N	\N	\N	\N
17354	1123	22	4	\N	\N	\N	\N
17355	1123	23	3	\N	\N	\N	\N
17356	1123	24	3	\N	\N	\N	\N
17357	1123	27	2	\N	\N	\N	\N
17358	1123	28	1	\N	\N	\N	\N
17359	1123	29	1	\N	\N	\N	\N
17360	1123	30	1	\N	\N	\N	\N
17361	1123	31	2	\N	\N	\N	\N
17362	1123	32	4	\N	\N	\N	\N
17363	1123	33	1	\N	\N	\N	\N
17364	1123	34	1	\N	\N	\N	\N
17365	1123	35	1	\N	\N	\N	\N
17366	1123	36	1	\N	\N	\N	\N
17367	1123	37	1	\N	\N	\N	\N
17368	1123	38	2	\N	\N	\N	\N
17369	1123	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.724	MODELO
17370	1123	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.91	MODELO
17371	1122	18	1	\N	\N	\N	\N
17372	1122	19	2	\N	\N	\N	\N
17373	1122	20	1	\N	\N	\N	\N
17374	1122	21	3	\N	\N	\N	\N
17375	1122	22	3	\N	\N	\N	\N
17376	1122	23	1	\N	\N	\N	\N
17377	1122	24	1	\N	\N	\N	\N
17378	1122	27	2	\N	\N	\N	\N
17379	1122	28	4	\N	\N	\N	\N
17380	1122	29	3	\N	\N	\N	\N
17381	1122	30	4	\N	\N	\N	\N
17382	1122	31	3	\N	\N	\N	\N
17383	1122	32	1	\N	\N	\N	\N
17384	1122	33	2	\N	\N	\N	\N
17385	1122	34	1	\N	\N	\N	\N
17386	1122	35	2	\N	\N	\N	\N
17387	1122	36	1	\N	\N	\N	\N
17388	1122	37	2	\N	\N	\N	\N
17389	1122	38	2	\N	\N	\N	\N
17390	1122	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.934	MODELO
17391	1122	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.812	MODELO
17392	1121	18	1	\N	\N	\N	\N
17393	1121	19	2	\N	\N	\N	\N
17394	1121	20	1	\N	\N	\N	\N
17395	1121	21	1	\N	\N	\N	\N
17396	1121	22	4	\N	\N	\N	\N
17397	1121	23	3	\N	\N	\N	\N
17398	1121	24	1	\N	\N	\N	\N
17399	1121	27	1	\N	\N	\N	\N
17400	1121	28	2	\N	\N	\N	\N
17401	1121	29	1	\N	\N	\N	\N
17402	1121	30	2	\N	\N	\N	\N
17403	1121	31	1	\N	\N	\N	\N
17404	1121	32	1	\N	\N	\N	\N
17405	1121	33	2	\N	\N	\N	\N
17406	1121	34	2	\N	\N	\N	\N
17407	1121	35	1	\N	\N	\N	\N
17408	1121	36	2	\N	\N	\N	\N
17409	1121	37	2	\N	\N	\N	\N
17410	1121	38	2	\N	\N	\N	\N
17411	1121	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.619	MODELO
17412	1121	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.51	MODELO
17413	1120	18	3	\N	\N	\N	\N
17414	1120	19	1	\N	\N	\N	\N
17415	1120	20	1	\N	\N	\N	\N
17416	1120	21	2	\N	\N	\N	\N
17417	1120	22	1	\N	\N	\N	\N
17418	1120	23	1	\N	\N	\N	\N
17419	1120	24	1	\N	\N	\N	\N
17420	1120	27	2	\N	\N	\N	\N
17421	1120	28	1	\N	\N	\N	\N
17422	1120	29	2	\N	\N	\N	\N
17423	1120	30	1	\N	\N	\N	\N
17424	1120	31	2	\N	\N	\N	\N
17425	1120	32	3	\N	\N	\N	\N
17426	1120	33	1	\N	\N	\N	\N
17427	1120	34	1	\N	\N	\N	\N
17428	1120	35	2	\N	\N	\N	\N
17429	1120	36	1	\N	\N	\N	\N
17430	1120	37	1	\N	\N	\N	\N
17431	1120	38	2	\N	\N	\N	\N
17432	1120	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.755	MODELO
17433	1120	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.726	MODELO
17434	1119	18	2	\N	\N	\N	\N
17435	1119	19	2	\N	\N	\N	\N
17436	1119	20	2	\N	\N	\N	\N
17437	1119	21	3	\N	\N	\N	\N
17438	1119	22	1	\N	\N	\N	\N
17439	1119	23	2	\N	\N	\N	\N
17440	1119	24	2	\N	\N	\N	\N
17441	1119	27	2	\N	\N	\N	\N
17442	1119	28	1	\N	\N	\N	\N
17443	1119	29	1	\N	\N	\N	\N
17444	1119	30	1	\N	\N	\N	\N
17445	1119	31	2	\N	\N	\N	\N
17446	1119	32	2	\N	\N	\N	\N
17447	1119	33	1	\N	\N	\N	\N
17448	1119	34	1	\N	\N	\N	\N
17449	1119	35	2	\N	\N	\N	\N
17450	1119	36	2	\N	\N	\N	\N
17451	1119	37	2	\N	\N	\N	\N
17452	1119	38	1	\N	\N	\N	\N
17453	1119	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.759	MODELO
17454	1119	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.78	MODELO
17455	1118	18	2	\N	\N	\N	\N
17456	1118	19	1	\N	\N	\N	\N
17457	1118	20	1	\N	\N	\N	\N
17458	1118	21	1	\N	\N	\N	\N
17459	1118	22	1	\N	\N	\N	\N
17460	1118	23	1	\N	\N	\N	\N
17461	1118	24	1	\N	\N	\N	\N
17462	1118	27	1	\N	\N	\N	\N
17463	1118	28	1	\N	\N	\N	\N
17464	1118	29	4	\N	\N	\N	\N
17465	1118	30	1	\N	\N	\N	\N
17466	1118	31	2	\N	\N	\N	\N
17467	1118	32	1	\N	\N	\N	\N
17468	1118	33	1	\N	\N	\N	\N
17469	1118	34	1	\N	\N	\N	\N
17470	1118	35	1	\N	\N	\N	\N
17471	1118	36	2	\N	\N	\N	\N
17472	1118	37	3	\N	\N	\N	\N
17473	1118	38	1	\N	\N	\N	\N
17474	1118	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.792	MODELO
17475	1118	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.837	MODELO
17476	1117	18	1	\N	\N	\N	\N
17477	1117	19	1	\N	\N	\N	\N
17478	1117	20	2	\N	\N	\N	\N
17479	1117	21	2	\N	\N	\N	\N
17480	1117	22	1	\N	\N	\N	\N
17481	1117	23	2	\N	\N	\N	\N
17482	1117	24	3	\N	\N	\N	\N
17483	1117	27	2	\N	\N	\N	\N
17484	1117	28	2	\N	\N	\N	\N
17485	1117	29	3	\N	\N	\N	\N
17486	1117	30	1	\N	\N	\N	\N
17487	1117	31	1	\N	\N	\N	\N
17488	1117	32	3	\N	\N	\N	\N
17489	1117	33	2	\N	\N	\N	\N
17490	1117	34	1	\N	\N	\N	\N
17491	1117	35	1	\N	\N	\N	\N
17492	1117	36	1	\N	\N	\N	\N
17493	1117	37	2	\N	\N	\N	\N
17494	1117	38	3	\N	\N	\N	\N
17495	1117	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.547	MODELO
17496	1117	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.758	MODELO
17497	1116	18	2	\N	\N	\N	\N
17498	1116	19	2	\N	\N	\N	\N
17499	1116	20	3	\N	\N	\N	\N
17500	1116	21	4	\N	\N	\N	\N
17501	1116	22	1	\N	\N	\N	\N
17502	1116	23	1	\N	\N	\N	\N
17503	1116	24	2	\N	\N	\N	\N
17504	1116	27	1	\N	\N	\N	\N
17505	1116	28	4	\N	\N	\N	\N
17506	1116	29	1	\N	\N	\N	\N
17507	1116	30	1	\N	\N	\N	\N
17508	1116	31	1	\N	\N	\N	\N
17509	1116	32	2	\N	\N	\N	\N
17510	1116	33	2	\N	\N	\N	\N
17511	1116	34	2	\N	\N	\N	\N
17512	1116	35	1	\N	\N	\N	\N
17513	1116	36	1	\N	\N	\N	\N
17514	1116	37	1	\N	\N	\N	\N
17515	1116	38	1	\N	\N	\N	\N
17516	1116	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.702	MODELO
17517	1116	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.749	MODELO
17518	1115	18	1	\N	\N	\N	\N
17519	1115	19	2	\N	\N	\N	\N
17520	1115	20	2	\N	\N	\N	\N
17521	1115	21	1	\N	\N	\N	\N
17522	1115	22	1	\N	\N	\N	\N
17523	1115	23	1	\N	\N	\N	\N
17524	1115	24	1	\N	\N	\N	\N
17525	1115	27	2	\N	\N	\N	\N
17526	1115	28	1	\N	\N	\N	\N
17527	1115	29	1	\N	\N	\N	\N
17528	1115	30	1	\N	\N	\N	\N
17529	1115	31	4	\N	\N	\N	\N
17530	1115	32	2	\N	\N	\N	\N
17531	1115	33	2	\N	\N	\N	\N
17532	1115	34	2	\N	\N	\N	\N
17533	1115	35	3	\N	\N	\N	\N
17534	1115	36	2	\N	\N	\N	\N
17535	1115	37	1	\N	\N	\N	\N
17536	1115	38	2	\N	\N	\N	\N
17537	1115	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.844	MODELO
17538	1115	26	\N	No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.	NEGATIVO	0.878	MODELO
17539	1114	18	2	\N	\N	\N	\N
17540	1114	19	1	\N	\N	\N	\N
17541	1114	20	1	\N	\N	\N	\N
17542	1114	21	2	\N	\N	\N	\N
17543	1114	22	2	\N	\N	\N	\N
17544	1114	23	4	\N	\N	\N	\N
17545	1114	24	2	\N	\N	\N	\N
17546	1114	27	2	\N	\N	\N	\N
17547	1114	28	2	\N	\N	\N	\N
17548	1114	29	2	\N	\N	\N	\N
17549	1114	30	2	\N	\N	\N	\N
17550	1114	31	3	\N	\N	\N	\N
17551	1114	32	2	\N	\N	\N	\N
17552	1114	33	2	\N	\N	\N	\N
17553	1114	34	2	\N	\N	\N	\N
17554	1114	35	4	\N	\N	\N	\N
17555	1114	36	1	\N	\N	\N	\N
17556	1114	37	3	\N	\N	\N	\N
17557	1114	38	1	\N	\N	\N	\N
17558	1114	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.767	MODELO
17559	1114	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.979	MODELO
17560	1113	18	2	\N	\N	\N	\N
17561	1113	19	3	\N	\N	\N	\N
17562	1113	20	2	\N	\N	\N	\N
17563	1113	21	2	\N	\N	\N	\N
17564	1113	22	1	\N	\N	\N	\N
17565	1113	23	1	\N	\N	\N	\N
17566	1113	24	2	\N	\N	\N	\N
17567	1113	27	1	\N	\N	\N	\N
17568	1113	28	1	\N	\N	\N	\N
17569	1113	29	2	\N	\N	\N	\N
17570	1113	30	1	\N	\N	\N	\N
17571	1113	31	1	\N	\N	\N	\N
17572	1113	32	1	\N	\N	\N	\N
17573	1113	33	1	\N	\N	\N	\N
17574	1113	34	1	\N	\N	\N	\N
17575	1113	35	2	\N	\N	\N	\N
17576	1113	36	1	\N	\N	\N	\N
17577	1113	37	2	\N	\N	\N	\N
17578	1113	38	1	\N	\N	\N	\N
17579	1113	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.863	MODELO
17580	1113	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.734	MODELO
17581	1112	18	1	\N	\N	\N	\N
17582	1112	19	1	\N	\N	\N	\N
17583	1112	20	1	\N	\N	\N	\N
17584	1112	21	2	\N	\N	\N	\N
17585	1112	22	2	\N	\N	\N	\N
17586	1112	23	2	\N	\N	\N	\N
17587	1112	24	2	\N	\N	\N	\N
17588	1112	27	3	\N	\N	\N	\N
17589	1112	28	1	\N	\N	\N	\N
17590	1112	29	2	\N	\N	\N	\N
17591	1112	30	1	\N	\N	\N	\N
17592	1112	31	3	\N	\N	\N	\N
17593	1112	32	2	\N	\N	\N	\N
17594	1112	33	3	\N	\N	\N	\N
17595	1112	34	1	\N	\N	\N	\N
17596	1112	35	1	\N	\N	\N	\N
17597	1112	36	1	\N	\N	\N	\N
17598	1112	37	2	\N	\N	\N	\N
17599	1112	38	3	\N	\N	\N	\N
17600	1112	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.768	MODELO
17601	1112	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.815	MODELO
17602	1111	18	3	\N	\N	\N	\N
17603	1111	19	3	\N	\N	\N	\N
17604	1111	20	1	\N	\N	\N	\N
17605	1111	21	2	\N	\N	\N	\N
17606	1111	22	3	\N	\N	\N	\N
17607	1111	23	1	\N	\N	\N	\N
17608	1111	24	1	\N	\N	\N	\N
17609	1111	27	1	\N	\N	\N	\N
17610	1111	28	1	\N	\N	\N	\N
17611	1111	29	2	\N	\N	\N	\N
17612	1111	30	1	\N	\N	\N	\N
17613	1111	31	3	\N	\N	\N	\N
17614	1111	32	1	\N	\N	\N	\N
17615	1111	33	1	\N	\N	\N	\N
17616	1111	34	2	\N	\N	\N	\N
17617	1111	35	2	\N	\N	\N	\N
17618	1111	36	2	\N	\N	\N	\N
17619	1111	37	2	\N	\N	\N	\N
17620	1111	38	4	\N	\N	\N	\N
17621	1111	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.85	MODELO
17622	1111	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.768	MODELO
17623	1110	18	2	\N	\N	\N	\N
17624	1110	19	1	\N	\N	\N	\N
17625	1110	20	2	\N	\N	\N	\N
17626	1110	21	1	\N	\N	\N	\N
17627	1110	22	2	\N	\N	\N	\N
17628	1110	23	2	\N	\N	\N	\N
17629	1110	24	1	\N	\N	\N	\N
17630	1110	27	2	\N	\N	\N	\N
17631	1110	28	1	\N	\N	\N	\N
17632	1110	29	2	\N	\N	\N	\N
17633	1110	30	1	\N	\N	\N	\N
17634	1110	31	4	\N	\N	\N	\N
17635	1110	32	4	\N	\N	\N	\N
17636	1110	33	1	\N	\N	\N	\N
17637	1110	34	1	\N	\N	\N	\N
17638	1110	35	4	\N	\N	\N	\N
17639	1110	36	2	\N	\N	\N	\N
17640	1110	37	3	\N	\N	\N	\N
17641	1110	38	1	\N	\N	\N	\N
17642	1110	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.818	MODELO
17643	1110	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.822	MODELO
17644	1109	18	3	\N	\N	\N	\N
17645	1109	19	1	\N	\N	\N	\N
17646	1109	20	3	\N	\N	\N	\N
17647	1109	21	1	\N	\N	\N	\N
17648	1109	22	2	\N	\N	\N	\N
17649	1109	23	1	\N	\N	\N	\N
17650	1109	24	1	\N	\N	\N	\N
17651	1109	27	2	\N	\N	\N	\N
17652	1109	28	3	\N	\N	\N	\N
17653	1109	29	3	\N	\N	\N	\N
17654	1109	30	4	\N	\N	\N	\N
17655	1109	31	1	\N	\N	\N	\N
17656	1109	32	2	\N	\N	\N	\N
17657	1109	33	1	\N	\N	\N	\N
17658	1109	34	1	\N	\N	\N	\N
17659	1109	35	2	\N	\N	\N	\N
17660	1109	36	3	\N	\N	\N	\N
17661	1109	37	2	\N	\N	\N	\N
17662	1109	38	2	\N	\N	\N	\N
17663	1109	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.555	MODELO
17664	1109	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.869	MODELO
17665	1108	18	3	\N	\N	\N	\N
17666	1108	19	2	\N	\N	\N	\N
17667	1108	20	3	\N	\N	\N	\N
17668	1108	21	1	\N	\N	\N	\N
17669	1108	22	1	\N	\N	\N	\N
17670	1108	23	1	\N	\N	\N	\N
17671	1108	24	3	\N	\N	\N	\N
17672	1108	27	4	\N	\N	\N	\N
17673	1108	28	2	\N	\N	\N	\N
17674	1108	29	1	\N	\N	\N	\N
17675	1108	30	2	\N	\N	\N	\N
17676	1108	31	2	\N	\N	\N	\N
17677	1108	32	1	\N	\N	\N	\N
17678	1108	33	4	\N	\N	\N	\N
17679	1108	34	3	\N	\N	\N	\N
17680	1108	35	2	\N	\N	\N	\N
17681	1108	36	2	\N	\N	\N	\N
17682	1108	37	1	\N	\N	\N	\N
17683	1108	38	1	\N	\N	\N	\N
17684	1108	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.755	MODELO
17685	1108	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.788	MODELO
17686	1107	18	2	\N	\N	\N	\N
17687	1107	19	1	\N	\N	\N	\N
17688	1107	20	2	\N	\N	\N	\N
17689	1107	21	2	\N	\N	\N	\N
17690	1107	22	1	\N	\N	\N	\N
17691	1107	23	1	\N	\N	\N	\N
17692	1107	24	1	\N	\N	\N	\N
17693	1107	27	2	\N	\N	\N	\N
17694	1107	28	2	\N	\N	\N	\N
17695	1107	29	1	\N	\N	\N	\N
17696	1107	30	1	\N	\N	\N	\N
17697	1107	31	1	\N	\N	\N	\N
17698	1107	32	1	\N	\N	\N	\N
17699	1107	33	1	\N	\N	\N	\N
17700	1107	34	4	\N	\N	\N	\N
17701	1107	35	1	\N	\N	\N	\N
17702	1107	36	4	\N	\N	\N	\N
17703	1107	37	2	\N	\N	\N	\N
17704	1107	38	1	\N	\N	\N	\N
17705	1107	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.542	MODELO
17706	1107	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.772	MODELO
17707	1106	18	1	\N	\N	\N	\N
17708	1106	19	1	\N	\N	\N	\N
17709	1106	20	2	\N	\N	\N	\N
17710	1106	21	2	\N	\N	\N	\N
17711	1106	22	2	\N	\N	\N	\N
17712	1106	23	1	\N	\N	\N	\N
17713	1106	24	2	\N	\N	\N	\N
17714	1106	27	1	\N	\N	\N	\N
17715	1106	28	1	\N	\N	\N	\N
17716	1106	29	1	\N	\N	\N	\N
17717	1106	30	2	\N	\N	\N	\N
17718	1106	31	1	\N	\N	\N	\N
17719	1106	32	1	\N	\N	\N	\N
17720	1106	33	1	\N	\N	\N	\N
17721	1106	34	2	\N	\N	\N	\N
17722	1106	35	1	\N	\N	\N	\N
17723	1106	36	2	\N	\N	\N	\N
17724	1106	37	1	\N	\N	\N	\N
17725	1106	38	3	\N	\N	\N	\N
17726	1106	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.876	MODELO
17727	1106	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.715	MODELO
17728	1105	18	2	\N	\N	\N	\N
17729	1105	19	2	\N	\N	\N	\N
17730	1105	20	1	\N	\N	\N	\N
17731	1105	21	1	\N	\N	\N	\N
17732	1105	22	1	\N	\N	\N	\N
17733	1105	23	1	\N	\N	\N	\N
17734	1105	24	2	\N	\N	\N	\N
17735	1105	27	1	\N	\N	\N	\N
17736	1105	28	1	\N	\N	\N	\N
17737	1105	29	1	\N	\N	\N	\N
17738	1105	30	1	\N	\N	\N	\N
17739	1105	31	1	\N	\N	\N	\N
17740	1105	32	1	\N	\N	\N	\N
17741	1105	33	1	\N	\N	\N	\N
17742	1105	34	1	\N	\N	\N	\N
17743	1105	35	1	\N	\N	\N	\N
17744	1105	36	2	\N	\N	\N	\N
17745	1105	37	1	\N	\N	\N	\N
17746	1105	38	2	\N	\N	\N	\N
17747	1105	25	\N	No noté fortalezas, espero que tome correctivos el próximo periodo.	NEGATIVO	0.889	MODELO
17748	1105	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.939	MODELO
17749	1104	18	2	\N	\N	\N	\N
17750	1104	19	4	\N	\N	\N	\N
17751	1104	20	1	\N	\N	\N	\N
17752	1104	21	3	\N	\N	\N	\N
17753	1104	22	1	\N	\N	\N	\N
17754	1104	23	1	\N	\N	\N	\N
17755	1104	24	2	\N	\N	\N	\N
17756	1104	27	1	\N	\N	\N	\N
17757	1104	28	1	\N	\N	\N	\N
17758	1104	29	2	\N	\N	\N	\N
17759	1104	30	1	\N	\N	\N	\N
17760	1104	31	2	\N	\N	\N	\N
17761	1104	32	4	\N	\N	\N	\N
17762	1104	33	3	\N	\N	\N	\N
17763	1104	34	3	\N	\N	\N	\N
17764	1104	35	1	\N	\N	\N	\N
17765	1104	36	1	\N	\N	\N	\N
17766	1104	37	1	\N	\N	\N	\N
17767	1104	38	2	\N	\N	\N	\N
17768	1104	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.658	MODELO
17769	1104	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.809	MODELO
17770	1103	18	1	\N	\N	\N	\N
17771	1103	19	2	\N	\N	\N	\N
17772	1103	20	1	\N	\N	\N	\N
17773	1103	21	1	\N	\N	\N	\N
17774	1103	22	2	\N	\N	\N	\N
17775	1103	23	3	\N	\N	\N	\N
17776	1103	24	2	\N	\N	\N	\N
17777	1103	27	1	\N	\N	\N	\N
17778	1103	28	2	\N	\N	\N	\N
17779	1103	29	1	\N	\N	\N	\N
17780	1103	30	2	\N	\N	\N	\N
17781	1103	31	1	\N	\N	\N	\N
17782	1103	32	2	\N	\N	\N	\N
17783	1103	33	2	\N	\N	\N	\N
17784	1103	34	1	\N	\N	\N	\N
17785	1103	35	3	\N	\N	\N	\N
17786	1103	36	3	\N	\N	\N	\N
17787	1103	37	2	\N	\N	\N	\N
17788	1103	38	1	\N	\N	\N	\N
17789	1103	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.604	MODELO
17790	1103	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.935	MODELO
17791	1102	18	1	\N	\N	\N	\N
17792	1102	19	1	\N	\N	\N	\N
17793	1102	20	3	\N	\N	\N	\N
17794	1102	21	2	\N	\N	\N	\N
17795	1102	22	3	\N	\N	\N	\N
17796	1102	23	2	\N	\N	\N	\N
17797	1102	24	3	\N	\N	\N	\N
17798	1102	27	2	\N	\N	\N	\N
17799	1102	28	1	\N	\N	\N	\N
17800	1102	29	1	\N	\N	\N	\N
17801	1102	30	1	\N	\N	\N	\N
17802	1102	31	1	\N	\N	\N	\N
17803	1102	32	2	\N	\N	\N	\N
17804	1102	33	1	\N	\N	\N	\N
17805	1102	34	1	\N	\N	\N	\N
17806	1102	35	3	\N	\N	\N	\N
17807	1102	36	2	\N	\N	\N	\N
17808	1102	37	2	\N	\N	\N	\N
17809	1102	38	1	\N	\N	\N	\N
17810	1102	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.715	MODELO
17811	1102	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.962	MODELO
17812	1101	18	2	\N	\N	\N	\N
17813	1101	19	1	\N	\N	\N	\N
17814	1101	20	2	\N	\N	\N	\N
17815	1101	21	1	\N	\N	\N	\N
17816	1101	22	1	\N	\N	\N	\N
17817	1101	23	2	\N	\N	\N	\N
17818	1101	24	2	\N	\N	\N	\N
17819	1101	27	2	\N	\N	\N	\N
17820	1101	28	1	\N	\N	\N	\N
17821	1101	29	2	\N	\N	\N	\N
17822	1101	30	1	\N	\N	\N	\N
17823	1101	31	2	\N	\N	\N	\N
17824	1101	32	1	\N	\N	\N	\N
17825	1101	33	1	\N	\N	\N	\N
17826	1101	34	3	\N	\N	\N	\N
17827	1101	35	1	\N	\N	\N	\N
17828	1101	36	1	\N	\N	\N	\N
17829	1101	37	2	\N	\N	\N	\N
17830	1101	38	2	\N	\N	\N	\N
17831	1101	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.679	MODELO
17832	1101	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.742	MODELO
17833	1100	18	1	\N	\N	\N	\N
17834	1100	19	1	\N	\N	\N	\N
17835	1100	20	2	\N	\N	\N	\N
17836	1100	21	1	\N	\N	\N	\N
17837	1100	22	2	\N	\N	\N	\N
17838	1100	23	2	\N	\N	\N	\N
17839	1100	24	1	\N	\N	\N	\N
17840	1100	27	4	\N	\N	\N	\N
17841	1100	28	2	\N	\N	\N	\N
17842	1100	29	1	\N	\N	\N	\N
17843	1100	30	1	\N	\N	\N	\N
17844	1100	31	3	\N	\N	\N	\N
17845	1100	32	2	\N	\N	\N	\N
17846	1100	33	2	\N	\N	\N	\N
17847	1100	34	3	\N	\N	\N	\N
17848	1100	35	3	\N	\N	\N	\N
17849	1100	36	1	\N	\N	\N	\N
17850	1100	37	2	\N	\N	\N	\N
17851	1100	38	2	\N	\N	\N	\N
17852	1100	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.787	MODELO
17853	1100	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.922	MODELO
17854	1099	18	1	\N	\N	\N	\N
17855	1099	19	3	\N	\N	\N	\N
17856	1099	20	2	\N	\N	\N	\N
17857	1099	21	1	\N	\N	\N	\N
17858	1099	22	2	\N	\N	\N	\N
17859	1099	23	2	\N	\N	\N	\N
17860	1099	24	2	\N	\N	\N	\N
17861	1099	27	1	\N	\N	\N	\N
17862	1099	28	4	\N	\N	\N	\N
17863	1099	29	2	\N	\N	\N	\N
17864	1099	30	1	\N	\N	\N	\N
17865	1099	31	1	\N	\N	\N	\N
17866	1099	32	3	\N	\N	\N	\N
17867	1099	33	1	\N	\N	\N	\N
17868	1099	34	2	\N	\N	\N	\N
17869	1099	35	1	\N	\N	\N	\N
17870	1099	36	3	\N	\N	\N	\N
17871	1099	37	1	\N	\N	\N	\N
17872	1099	38	1	\N	\N	\N	\N
17873	1099	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.797	MODELO
17874	1099	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.899	MODELO
17875	1098	18	2	\N	\N	\N	\N
17876	1098	19	2	\N	\N	\N	\N
17877	1098	20	2	\N	\N	\N	\N
17878	1098	21	2	\N	\N	\N	\N
17879	1098	22	2	\N	\N	\N	\N
17880	1098	23	1	\N	\N	\N	\N
17881	1098	24	2	\N	\N	\N	\N
17882	1098	27	4	\N	\N	\N	\N
17883	1098	28	1	\N	\N	\N	\N
17884	1098	29	1	\N	\N	\N	\N
17885	1098	30	1	\N	\N	\N	\N
17886	1098	31	1	\N	\N	\N	\N
17887	1098	32	4	\N	\N	\N	\N
17888	1098	33	1	\N	\N	\N	\N
17889	1098	34	1	\N	\N	\N	\N
17890	1098	35	1	\N	\N	\N	\N
17891	1098	36	2	\N	\N	\N	\N
17892	1098	37	1	\N	\N	\N	\N
17893	1098	38	3	\N	\N	\N	\N
17894	1098	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.923	MODELO
17895	1098	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.793	MODELO
17896	1097	18	1	\N	\N	\N	\N
17897	1097	19	1	\N	\N	\N	\N
17898	1097	20	1	\N	\N	\N	\N
17899	1097	21	3	\N	\N	\N	\N
17900	1097	22	3	\N	\N	\N	\N
17901	1097	23	1	\N	\N	\N	\N
17902	1097	24	2	\N	\N	\N	\N
17903	1097	27	3	\N	\N	\N	\N
17904	1097	28	1	\N	\N	\N	\N
17905	1097	29	1	\N	\N	\N	\N
17906	1097	30	2	\N	\N	\N	\N
17907	1097	31	2	\N	\N	\N	\N
17908	1097	32	2	\N	\N	\N	\N
17909	1097	33	1	\N	\N	\N	\N
17910	1097	34	4	\N	\N	\N	\N
17911	1097	35	1	\N	\N	\N	\N
17912	1097	36	3	\N	\N	\N	\N
17913	1097	37	1	\N	\N	\N	\N
17914	1097	38	2	\N	\N	\N	\N
17915	1097	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.91	MODELO
17916	1097	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.979	MODELO
17917	1096	18	2	\N	\N	\N	\N
17918	1096	19	1	\N	\N	\N	\N
17919	1096	20	3	\N	\N	\N	\N
17920	1096	21	2	\N	\N	\N	\N
17921	1096	22	1	\N	\N	\N	\N
17922	1096	23	2	\N	\N	\N	\N
17923	1096	24	1	\N	\N	\N	\N
17924	1096	27	2	\N	\N	\N	\N
17925	1096	28	1	\N	\N	\N	\N
17926	1096	29	2	\N	\N	\N	\N
17927	1096	30	1	\N	\N	\N	\N
17928	1096	31	1	\N	\N	\N	\N
17929	1096	32	1	\N	\N	\N	\N
17930	1096	33	3	\N	\N	\N	\N
17931	1096	34	2	\N	\N	\N	\N
17932	1096	35	4	\N	\N	\N	\N
17933	1096	36	1	\N	\N	\N	\N
17934	1096	37	3	\N	\N	\N	\N
17935	1096	38	1	\N	\N	\N	\N
17936	1096	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.525	MODELO
17937	1096	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.524	MODELO
17938	1095	18	1	\N	\N	\N	\N
17939	1095	19	3	\N	\N	\N	\N
17940	1095	20	2	\N	\N	\N	\N
17941	1095	21	1	\N	\N	\N	\N
17942	1095	22	1	\N	\N	\N	\N
17943	1095	23	1	\N	\N	\N	\N
17944	1095	24	1	\N	\N	\N	\N
17945	1095	27	1	\N	\N	\N	\N
17946	1095	28	1	\N	\N	\N	\N
17947	1095	29	1	\N	\N	\N	\N
17948	1095	30	1	\N	\N	\N	\N
17949	1095	31	1	\N	\N	\N	\N
17950	1095	32	1	\N	\N	\N	\N
17951	1095	33	2	\N	\N	\N	\N
17952	1095	34	1	\N	\N	\N	\N
17953	1095	35	2	\N	\N	\N	\N
17954	1095	36	1	\N	\N	\N	\N
17955	1095	37	2	\N	\N	\N	\N
17956	1095	38	1	\N	\N	\N	\N
17957	1095	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.96	MODELO
17958	1095	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.811	MODELO
17959	1094	18	2	\N	\N	\N	\N
17960	1094	19	1	\N	\N	\N	\N
17961	1094	20	1	\N	\N	\N	\N
17962	1094	21	1	\N	\N	\N	\N
17963	1094	22	3	\N	\N	\N	\N
17964	1094	23	2	\N	\N	\N	\N
17965	1094	24	2	\N	\N	\N	\N
17966	1094	27	2	\N	\N	\N	\N
17967	1094	28	4	\N	\N	\N	\N
17968	1094	29	3	\N	\N	\N	\N
17969	1094	30	2	\N	\N	\N	\N
17970	1094	31	2	\N	\N	\N	\N
17971	1094	32	3	\N	\N	\N	\N
17972	1094	33	2	\N	\N	\N	\N
17973	1094	34	1	\N	\N	\N	\N
17974	1094	35	1	\N	\N	\N	\N
17975	1094	36	1	\N	\N	\N	\N
17976	1094	37	1	\N	\N	\N	\N
17977	1094	38	2	\N	\N	\N	\N
17978	1094	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.865	MODELO
17979	1094	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.735	MODELO
17980	1093	18	2	\N	\N	\N	\N
17981	1093	19	1	\N	\N	\N	\N
17982	1093	20	1	\N	\N	\N	\N
17983	1093	21	1	\N	\N	\N	\N
17984	1093	22	1	\N	\N	\N	\N
17985	1093	23	3	\N	\N	\N	\N
17986	1093	24	2	\N	\N	\N	\N
17987	1093	27	2	\N	\N	\N	\N
17988	1093	28	3	\N	\N	\N	\N
17989	1093	29	1	\N	\N	\N	\N
17990	1093	30	1	\N	\N	\N	\N
17991	1093	31	2	\N	\N	\N	\N
17992	1093	32	1	\N	\N	\N	\N
17993	1093	33	1	\N	\N	\N	\N
17994	1093	34	2	\N	\N	\N	\N
17995	1093	35	1	\N	\N	\N	\N
17996	1093	36	2	\N	\N	\N	\N
17997	1093	37	2	\N	\N	\N	\N
17998	1093	38	3	\N	\N	\N	\N
17999	1093	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.859	MODELO
18000	1093	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.93	MODELO
18001	1092	18	2	\N	\N	\N	\N
18002	1092	19	2	\N	\N	\N	\N
18003	1092	20	2	\N	\N	\N	\N
18004	1092	21	1	\N	\N	\N	\N
18005	1092	22	1	\N	\N	\N	\N
18006	1092	23	4	\N	\N	\N	\N
18007	1092	24	1	\N	\N	\N	\N
18008	1092	27	1	\N	\N	\N	\N
18009	1092	28	1	\N	\N	\N	\N
18010	1092	29	2	\N	\N	\N	\N
18011	1092	30	1	\N	\N	\N	\N
18012	1092	31	2	\N	\N	\N	\N
18013	1092	32	2	\N	\N	\N	\N
18014	1092	33	2	\N	\N	\N	\N
18015	1092	34	2	\N	\N	\N	\N
18016	1092	35	1	\N	\N	\N	\N
18017	1092	36	2	\N	\N	\N	\N
18018	1092	37	2	\N	\N	\N	\N
18019	1092	38	3	\N	\N	\N	\N
18020	1092	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.914	MODELO
18021	1092	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.731	MODELO
18022	1091	18	2	\N	\N	\N	\N
18023	1091	19	2	\N	\N	\N	\N
18024	1091	20	3	\N	\N	\N	\N
18025	1091	21	4	\N	\N	\N	\N
18026	1091	22	2	\N	\N	\N	\N
18027	1091	23	2	\N	\N	\N	\N
18028	1091	24	1	\N	\N	\N	\N
18029	1091	27	1	\N	\N	\N	\N
18030	1091	28	2	\N	\N	\N	\N
18031	1091	29	3	\N	\N	\N	\N
18032	1091	30	1	\N	\N	\N	\N
18033	1091	31	2	\N	\N	\N	\N
18034	1091	32	1	\N	\N	\N	\N
18035	1091	33	2	\N	\N	\N	\N
18036	1091	34	2	\N	\N	\N	\N
18037	1091	35	3	\N	\N	\N	\N
18038	1091	36	2	\N	\N	\N	\N
18039	1091	37	2	\N	\N	\N	\N
18040	1091	38	2	\N	\N	\N	\N
18041	1091	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.76	MODELO
18042	1091	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.876	MODELO
18043	1090	18	2	\N	\N	\N	\N
18044	1090	19	3	\N	\N	\N	\N
18045	1090	20	3	\N	\N	\N	\N
18046	1090	21	1	\N	\N	\N	\N
18047	1090	22	2	\N	\N	\N	\N
18048	1090	23	1	\N	\N	\N	\N
18049	1090	24	1	\N	\N	\N	\N
18050	1090	27	1	\N	\N	\N	\N
18051	1090	28	1	\N	\N	\N	\N
18052	1090	29	2	\N	\N	\N	\N
18053	1090	30	1	\N	\N	\N	\N
18054	1090	31	1	\N	\N	\N	\N
18055	1090	32	2	\N	\N	\N	\N
18056	1090	33	2	\N	\N	\N	\N
18057	1090	34	3	\N	\N	\N	\N
18058	1090	35	1	\N	\N	\N	\N
18059	1090	36	2	\N	\N	\N	\N
18060	1090	37	4	\N	\N	\N	\N
18061	1090	38	1	\N	\N	\N	\N
18062	1090	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.859	MODELO
18063	1090	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.915	MODELO
18064	1089	18	1	\N	\N	\N	\N
18065	1089	19	3	\N	\N	\N	\N
18066	1089	20	2	\N	\N	\N	\N
18067	1089	21	2	\N	\N	\N	\N
18068	1089	22	3	\N	\N	\N	\N
18069	1089	23	2	\N	\N	\N	\N
18070	1089	24	2	\N	\N	\N	\N
18071	1089	27	2	\N	\N	\N	\N
18072	1089	28	1	\N	\N	\N	\N
18073	1089	29	2	\N	\N	\N	\N
18074	1089	30	2	\N	\N	\N	\N
18075	1089	31	1	\N	\N	\N	\N
18076	1089	32	3	\N	\N	\N	\N
18077	1089	33	3	\N	\N	\N	\N
18078	1089	34	2	\N	\N	\N	\N
18079	1089	35	3	\N	\N	\N	\N
18080	1089	36	1	\N	\N	\N	\N
18081	1089	37	1	\N	\N	\N	\N
18082	1089	38	3	\N	\N	\N	\N
18083	1089	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.867	MODELO
18084	1089	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.544	MODELO
18085	1088	18	2	\N	\N	\N	\N
18086	1088	19	1	\N	\N	\N	\N
18087	1088	20	2	\N	\N	\N	\N
18088	1088	21	3	\N	\N	\N	\N
18089	1088	22	1	\N	\N	\N	\N
18090	1088	23	2	\N	\N	\N	\N
18091	1088	24	2	\N	\N	\N	\N
18092	1088	27	3	\N	\N	\N	\N
18093	1088	28	1	\N	\N	\N	\N
18094	1088	29	2	\N	\N	\N	\N
18095	1088	30	2	\N	\N	\N	\N
18096	1088	31	3	\N	\N	\N	\N
18097	1088	32	1	\N	\N	\N	\N
18098	1088	33	4	\N	\N	\N	\N
18099	1088	34	1	\N	\N	\N	\N
18100	1088	35	1	\N	\N	\N	\N
18101	1088	36	1	\N	\N	\N	\N
18102	1088	37	3	\N	\N	\N	\N
18103	1088	38	1	\N	\N	\N	\N
18104	1088	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.739	MODELO
18105	1088	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.884	MODELO
18106	771	18	4	\N	\N	\N	\N
18107	771	19	3	\N	\N	\N	\N
18108	771	20	2	\N	\N	\N	\N
18109	771	21	3	\N	\N	\N	\N
18110	771	22	4	\N	\N	\N	\N
18111	771	23	4	\N	\N	\N	\N
18112	771	24	3	\N	\N	\N	\N
18113	771	27	2	\N	\N	\N	\N
18114	771	28	3	\N	\N	\N	\N
18115	771	29	3	\N	\N	\N	\N
18116	771	30	4	\N	\N	\N	\N
18117	771	31	3	\N	\N	\N	\N
18118	771	32	4	\N	\N	\N	\N
18119	771	33	3	\N	\N	\N	\N
18120	771	34	3	\N	\N	\N	\N
18121	771	35	3	\N	\N	\N	\N
18122	771	36	3	\N	\N	\N	\N
18123	771	37	3	\N	\N	\N	\N
18124	771	38	3	\N	\N	\N	\N
18125	771	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.92	MODELO
18126	771	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.767	MODELO
18127	770	18	3	\N	\N	\N	\N
18128	770	19	4	\N	\N	\N	\N
18129	770	20	2	\N	\N	\N	\N
18130	770	21	3	\N	\N	\N	\N
18131	770	22	3	\N	\N	\N	\N
18132	770	23	3	\N	\N	\N	\N
18133	770	24	4	\N	\N	\N	\N
18134	770	27	4	\N	\N	\N	\N
18135	770	28	4	\N	\N	\N	\N
18136	770	29	3	\N	\N	\N	\N
18137	770	30	3	\N	\N	\N	\N
18138	770	31	3	\N	\N	\N	\N
18139	770	32	2	\N	\N	\N	\N
18140	770	33	2	\N	\N	\N	\N
18141	770	34	4	\N	\N	\N	\N
18142	770	35	3	\N	\N	\N	\N
18143	770	36	3	\N	\N	\N	\N
18144	770	37	2	\N	\N	\N	\N
18145	770	38	4	\N	\N	\N	\N
18146	770	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.923	MODELO
18147	770	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.729	MODELO
18148	769	18	3	\N	\N	\N	\N
18149	769	19	4	\N	\N	\N	\N
18150	769	20	4	\N	\N	\N	\N
18151	769	21	4	\N	\N	\N	\N
18152	769	22	3	\N	\N	\N	\N
18153	769	23	2	\N	\N	\N	\N
18154	769	24	4	\N	\N	\N	\N
18155	769	27	3	\N	\N	\N	\N
18156	769	28	4	\N	\N	\N	\N
18157	769	29	3	\N	\N	\N	\N
18158	769	30	4	\N	\N	\N	\N
18159	769	31	4	\N	\N	\N	\N
18160	769	32	3	\N	\N	\N	\N
18161	769	33	3	\N	\N	\N	\N
18162	769	34	3	\N	\N	\N	\N
18163	769	35	4	\N	\N	\N	\N
18164	769	36	4	\N	\N	\N	\N
18165	769	37	4	\N	\N	\N	\N
18166	769	38	3	\N	\N	\N	\N
18167	769	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.988	MODELO
18168	769	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.766	MODELO
18169	768	18	4	\N	\N	\N	\N
18170	768	19	3	\N	\N	\N	\N
18171	768	20	3	\N	\N	\N	\N
18172	768	21	4	\N	\N	\N	\N
18173	768	22	4	\N	\N	\N	\N
18174	768	23	3	\N	\N	\N	\N
18175	768	24	3	\N	\N	\N	\N
18176	768	27	4	\N	\N	\N	\N
18177	768	28	4	\N	\N	\N	\N
18178	768	29	3	\N	\N	\N	\N
18179	768	30	4	\N	\N	\N	\N
18180	768	31	4	\N	\N	\N	\N
18181	768	32	3	\N	\N	\N	\N
18182	768	33	2	\N	\N	\N	\N
18183	768	34	4	\N	\N	\N	\N
18184	768	35	4	\N	\N	\N	\N
18185	768	36	3	\N	\N	\N	\N
18186	768	37	4	\N	\N	\N	\N
18187	768	38	3	\N	\N	\N	\N
18306	762	31	3	\N	\N	\N	\N
18307	762	32	3	\N	\N	\N	\N
18188	768	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.847	MODELO
18189	768	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.846	MODELO
18190	767	18	3	\N	\N	\N	\N
18191	767	19	2	\N	\N	\N	\N
18192	767	20	3	\N	\N	\N	\N
18193	767	21	3	\N	\N	\N	\N
18194	767	22	4	\N	\N	\N	\N
18195	767	23	2	\N	\N	\N	\N
18196	767	24	3	\N	\N	\N	\N
18197	767	27	4	\N	\N	\N	\N
18198	767	28	3	\N	\N	\N	\N
18199	767	29	3	\N	\N	\N	\N
18200	767	30	2	\N	\N	\N	\N
18201	767	31	4	\N	\N	\N	\N
18202	767	32	3	\N	\N	\N	\N
18203	767	33	3	\N	\N	\N	\N
18204	767	34	4	\N	\N	\N	\N
18205	767	35	4	\N	\N	\N	\N
18206	767	36	3	\N	\N	\N	\N
18207	767	37	4	\N	\N	\N	\N
18208	767	38	3	\N	\N	\N	\N
18209	767	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.913	MODELO
18210	767	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.529	MODELO
18211	766	18	4	\N	\N	\N	\N
18212	766	19	3	\N	\N	\N	\N
18213	766	20	3	\N	\N	\N	\N
18214	766	21	1	\N	\N	\N	\N
18215	766	22	3	\N	\N	\N	\N
18216	766	23	4	\N	\N	\N	\N
18217	766	24	3	\N	\N	\N	\N
18218	766	27	4	\N	\N	\N	\N
18219	766	28	3	\N	\N	\N	\N
18220	766	29	2	\N	\N	\N	\N
18221	766	30	3	\N	\N	\N	\N
18222	766	31	3	\N	\N	\N	\N
18223	766	32	4	\N	\N	\N	\N
18224	766	33	4	\N	\N	\N	\N
18225	766	34	4	\N	\N	\N	\N
18226	766	35	3	\N	\N	\N	\N
18227	766	36	4	\N	\N	\N	\N
18228	766	37	4	\N	\N	\N	\N
18229	766	38	3	\N	\N	\N	\N
18230	766	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.99	MODELO
18231	766	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.891	MODELO
18232	765	18	2	\N	\N	\N	\N
18233	765	19	3	\N	\N	\N	\N
18234	765	20	3	\N	\N	\N	\N
18235	765	21	4	\N	\N	\N	\N
18236	765	22	4	\N	\N	\N	\N
18237	765	23	2	\N	\N	\N	\N
18238	765	24	2	\N	\N	\N	\N
18239	765	27	3	\N	\N	\N	\N
18240	765	28	3	\N	\N	\N	\N
18241	765	29	3	\N	\N	\N	\N
18242	765	30	4	\N	\N	\N	\N
18243	765	31	4	\N	\N	\N	\N
18244	765	32	3	\N	\N	\N	\N
18245	765	33	4	\N	\N	\N	\N
18246	765	34	4	\N	\N	\N	\N
18247	765	35	2	\N	\N	\N	\N
18248	765	36	2	\N	\N	\N	\N
18249	765	37	4	\N	\N	\N	\N
18250	765	38	3	\N	\N	\N	\N
18251	765	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.811	MODELO
18252	765	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.911	MODELO
18253	764	18	4	\N	\N	\N	\N
18254	764	19	3	\N	\N	\N	\N
18255	764	20	4	\N	\N	\N	\N
18256	764	21	4	\N	\N	\N	\N
18257	764	22	3	\N	\N	\N	\N
18258	764	23	1	\N	\N	\N	\N
18259	764	24	2	\N	\N	\N	\N
18260	764	27	4	\N	\N	\N	\N
18261	764	28	4	\N	\N	\N	\N
18262	764	29	3	\N	\N	\N	\N
18263	764	30	4	\N	\N	\N	\N
18264	764	31	4	\N	\N	\N	\N
18265	764	32	3	\N	\N	\N	\N
18266	764	33	3	\N	\N	\N	\N
18267	764	34	3	\N	\N	\N	\N
18268	764	35	3	\N	\N	\N	\N
18269	764	36	3	\N	\N	\N	\N
18270	764	37	3	\N	\N	\N	\N
18271	764	38	4	\N	\N	\N	\N
18272	764	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.965	MODELO
18273	764	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.573	MODELO
18274	763	18	4	\N	\N	\N	\N
18275	763	19	4	\N	\N	\N	\N
18276	763	20	3	\N	\N	\N	\N
18277	763	21	3	\N	\N	\N	\N
18278	763	22	2	\N	\N	\N	\N
18279	763	23	3	\N	\N	\N	\N
18280	763	24	4	\N	\N	\N	\N
18281	763	27	2	\N	\N	\N	\N
18282	763	28	3	\N	\N	\N	\N
18283	763	29	3	\N	\N	\N	\N
18284	763	30	4	\N	\N	\N	\N
18285	763	31	3	\N	\N	\N	\N
18286	763	32	3	\N	\N	\N	\N
18287	763	33	3	\N	\N	\N	\N
18288	763	34	4	\N	\N	\N	\N
18289	763	35	2	\N	\N	\N	\N
18290	763	36	4	\N	\N	\N	\N
18291	763	37	3	\N	\N	\N	\N
18292	763	38	3	\N	\N	\N	\N
18293	763	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.811	MODELO
18294	763	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.701	MODELO
18295	762	18	3	\N	\N	\N	\N
18296	762	19	2	\N	\N	\N	\N
18297	762	20	4	\N	\N	\N	\N
18298	762	21	4	\N	\N	\N	\N
18299	762	22	4	\N	\N	\N	\N
18300	762	23	2	\N	\N	\N	\N
18301	762	24	3	\N	\N	\N	\N
18302	762	27	4	\N	\N	\N	\N
18303	762	28	4	\N	\N	\N	\N
18304	762	29	2	\N	\N	\N	\N
18305	762	30	3	\N	\N	\N	\N
18308	762	33	3	\N	\N	\N	\N
18309	762	34	3	\N	\N	\N	\N
18310	762	35	3	\N	\N	\N	\N
18311	762	36	3	\N	\N	\N	\N
18312	762	37	4	\N	\N	\N	\N
18313	762	38	3	\N	\N	\N	\N
18314	762	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.864	MODELO
18315	762	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.834	MODELO
18316	761	18	2	\N	\N	\N	\N
18317	761	19	3	\N	\N	\N	\N
18318	761	20	4	\N	\N	\N	\N
18319	761	21	3	\N	\N	\N	\N
18320	761	22	3	\N	\N	\N	\N
18321	761	23	4	\N	\N	\N	\N
18322	761	24	4	\N	\N	\N	\N
18323	761	27	3	\N	\N	\N	\N
18324	761	28	4	\N	\N	\N	\N
18325	761	29	3	\N	\N	\N	\N
18326	761	30	1	\N	\N	\N	\N
18327	761	31	4	\N	\N	\N	\N
18328	761	32	3	\N	\N	\N	\N
18329	761	33	3	\N	\N	\N	\N
18330	761	34	3	\N	\N	\N	\N
18331	761	35	4	\N	\N	\N	\N
18332	761	36	3	\N	\N	\N	\N
18333	761	37	2	\N	\N	\N	\N
18334	761	38	4	\N	\N	\N	\N
18335	761	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.717	MODELO
18336	761	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.717	MODELO
18337	760	18	3	\N	\N	\N	\N
18338	760	19	3	\N	\N	\N	\N
18339	760	20	3	\N	\N	\N	\N
18340	760	21	3	\N	\N	\N	\N
18341	760	22	3	\N	\N	\N	\N
18342	760	23	4	\N	\N	\N	\N
18343	760	24	3	\N	\N	\N	\N
18344	760	27	4	\N	\N	\N	\N
18345	760	28	3	\N	\N	\N	\N
18346	760	29	4	\N	\N	\N	\N
18347	760	30	2	\N	\N	\N	\N
18348	760	31	3	\N	\N	\N	\N
18349	760	32	4	\N	\N	\N	\N
18350	760	33	4	\N	\N	\N	\N
18351	760	34	2	\N	\N	\N	\N
18352	760	35	3	\N	\N	\N	\N
18353	760	36	3	\N	\N	\N	\N
18354	760	37	2	\N	\N	\N	\N
18355	760	38	3	\N	\N	\N	\N
18356	760	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.712	MODELO
18357	760	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.783	MODELO
18358	759	18	4	\N	\N	\N	\N
18359	759	19	4	\N	\N	\N	\N
18360	759	20	4	\N	\N	\N	\N
18361	759	21	4	\N	\N	\N	\N
18362	759	22	4	\N	\N	\N	\N
18363	759	23	1	\N	\N	\N	\N
18364	759	24	4	\N	\N	\N	\N
18365	759	27	3	\N	\N	\N	\N
18366	759	28	4	\N	\N	\N	\N
18367	759	29	3	\N	\N	\N	\N
18368	759	30	2	\N	\N	\N	\N
18369	759	31	3	\N	\N	\N	\N
18370	759	32	3	\N	\N	\N	\N
18371	759	33	4	\N	\N	\N	\N
18372	759	34	4	\N	\N	\N	\N
18373	759	35	2	\N	\N	\N	\N
18374	759	36	4	\N	\N	\N	\N
18375	759	37	3	\N	\N	\N	\N
18376	759	38	3	\N	\N	\N	\N
18377	759	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.763	MODELO
18378	759	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.725	MODELO
18379	758	18	4	\N	\N	\N	\N
18380	758	19	1	\N	\N	\N	\N
18381	758	20	4	\N	\N	\N	\N
18382	758	21	3	\N	\N	\N	\N
18383	758	22	3	\N	\N	\N	\N
18384	758	23	3	\N	\N	\N	\N
18385	758	24	4	\N	\N	\N	\N
18386	758	27	4	\N	\N	\N	\N
18387	758	28	3	\N	\N	\N	\N
18388	758	29	3	\N	\N	\N	\N
18389	758	30	3	\N	\N	\N	\N
18390	758	31	4	\N	\N	\N	\N
18391	758	32	3	\N	\N	\N	\N
18392	758	33	3	\N	\N	\N	\N
18393	758	34	3	\N	\N	\N	\N
18394	758	35	3	\N	\N	\N	\N
18395	758	36	4	\N	\N	\N	\N
18396	758	37	3	\N	\N	\N	\N
18397	758	38	3	\N	\N	\N	\N
18398	758	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.83	MODELO
18399	758	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.535	MODELO
18400	757	18	4	\N	\N	\N	\N
18401	757	19	4	\N	\N	\N	\N
18402	757	20	4	\N	\N	\N	\N
18403	757	21	4	\N	\N	\N	\N
18404	757	22	4	\N	\N	\N	\N
18405	757	23	4	\N	\N	\N	\N
18406	757	24	3	\N	\N	\N	\N
18407	757	27	3	\N	\N	\N	\N
18408	757	28	2	\N	\N	\N	\N
18409	757	29	4	\N	\N	\N	\N
18410	757	30	3	\N	\N	\N	\N
18411	757	31	4	\N	\N	\N	\N
18412	757	32	2	\N	\N	\N	\N
18413	757	33	3	\N	\N	\N	\N
18414	757	34	3	\N	\N	\N	\N
18415	757	35	1	\N	\N	\N	\N
18416	757	36	4	\N	\N	\N	\N
18417	757	37	3	\N	\N	\N	\N
18418	757	38	3	\N	\N	\N	\N
18419	757	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.929	MODELO
18420	757	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.746	MODELO
18421	756	18	4	\N	\N	\N	\N
18422	756	19	3	\N	\N	\N	\N
18423	756	20	3	\N	\N	\N	\N
18424	756	21	2	\N	\N	\N	\N
18425	756	22	3	\N	\N	\N	\N
18426	756	23	3	\N	\N	\N	\N
18427	756	24	4	\N	\N	\N	\N
18428	756	27	2	\N	\N	\N	\N
18429	756	28	3	\N	\N	\N	\N
18430	756	29	3	\N	\N	\N	\N
18431	756	30	3	\N	\N	\N	\N
18432	756	31	4	\N	\N	\N	\N
18433	756	32	4	\N	\N	\N	\N
18434	756	33	2	\N	\N	\N	\N
18435	756	34	2	\N	\N	\N	\N
18436	756	35	4	\N	\N	\N	\N
18437	756	36	3	\N	\N	\N	\N
18438	756	37	3	\N	\N	\N	\N
18439	756	38	3	\N	\N	\N	\N
18440	756	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.751	MODELO
18441	756	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.727	MODELO
18442	755	18	3	\N	\N	\N	\N
18443	755	19	2	\N	\N	\N	\N
18444	755	20	4	\N	\N	\N	\N
18445	755	21	4	\N	\N	\N	\N
18446	755	22	2	\N	\N	\N	\N
18447	755	23	4	\N	\N	\N	\N
18448	755	24	4	\N	\N	\N	\N
18449	755	27	4	\N	\N	\N	\N
18450	755	28	3	\N	\N	\N	\N
18451	755	29	3	\N	\N	\N	\N
18452	755	30	4	\N	\N	\N	\N
18453	755	31	4	\N	\N	\N	\N
18454	755	32	4	\N	\N	\N	\N
18455	755	33	4	\N	\N	\N	\N
18456	755	34	2	\N	\N	\N	\N
18457	755	35	3	\N	\N	\N	\N
18458	755	36	1	\N	\N	\N	\N
18459	755	37	3	\N	\N	\N	\N
18460	755	38	2	\N	\N	\N	\N
18461	755	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.974	MODELO
18462	755	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.543	MODELO
18463	754	18	3	\N	\N	\N	\N
18464	754	19	4	\N	\N	\N	\N
18465	754	20	3	\N	\N	\N	\N
18466	754	21	4	\N	\N	\N	\N
18467	754	22	3	\N	\N	\N	\N
18468	754	23	4	\N	\N	\N	\N
18469	754	24	4	\N	\N	\N	\N
18470	754	27	3	\N	\N	\N	\N
18471	754	28	3	\N	\N	\N	\N
18472	754	29	4	\N	\N	\N	\N
18473	754	30	3	\N	\N	\N	\N
18474	754	31	3	\N	\N	\N	\N
18475	754	32	4	\N	\N	\N	\N
18476	754	33	3	\N	\N	\N	\N
18477	754	34	3	\N	\N	\N	\N
18478	754	35	4	\N	\N	\N	\N
18479	754	36	3	\N	\N	\N	\N
18480	754	37	4	\N	\N	\N	\N
18481	754	38	2	\N	\N	\N	\N
18482	754	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.832	MODELO
18483	754	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.954	MODELO
18484	753	18	4	\N	\N	\N	\N
18485	753	19	4	\N	\N	\N	\N
18486	753	20	3	\N	\N	\N	\N
18487	753	21	4	\N	\N	\N	\N
18488	753	22	3	\N	\N	\N	\N
18489	753	23	3	\N	\N	\N	\N
18490	753	24	3	\N	\N	\N	\N
18491	753	27	4	\N	\N	\N	\N
18492	753	28	4	\N	\N	\N	\N
18493	753	29	4	\N	\N	\N	\N
18494	753	30	4	\N	\N	\N	\N
18495	753	31	3	\N	\N	\N	\N
18496	753	32	4	\N	\N	\N	\N
18497	753	33	3	\N	\N	\N	\N
18498	753	34	3	\N	\N	\N	\N
18499	753	35	3	\N	\N	\N	\N
18500	753	36	3	\N	\N	\N	\N
18501	753	37	2	\N	\N	\N	\N
18502	753	38	3	\N	\N	\N	\N
18503	753	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.87	MODELO
18504	753	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.88	MODELO
18505	752	18	3	\N	\N	\N	\N
18506	752	19	4	\N	\N	\N	\N
18507	752	20	3	\N	\N	\N	\N
18508	752	21	3	\N	\N	\N	\N
18509	752	22	3	\N	\N	\N	\N
18510	752	23	3	\N	\N	\N	\N
18511	752	24	2	\N	\N	\N	\N
18512	752	27	2	\N	\N	\N	\N
18513	752	28	1	\N	\N	\N	\N
18514	752	29	3	\N	\N	\N	\N
18515	752	30	4	\N	\N	\N	\N
18516	752	31	2	\N	\N	\N	\N
18517	752	32	3	\N	\N	\N	\N
18518	752	33	4	\N	\N	\N	\N
18519	752	34	3	\N	\N	\N	\N
18520	752	35	3	\N	\N	\N	\N
18521	752	36	3	\N	\N	\N	\N
18522	752	37	3	\N	\N	\N	\N
18523	752	38	3	\N	\N	\N	\N
18524	752	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.705	MODELO
18525	752	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.759	MODELO
18526	751	18	1	\N	\N	\N	\N
18527	751	19	3	\N	\N	\N	\N
18528	751	20	4	\N	\N	\N	\N
18529	751	21	3	\N	\N	\N	\N
18530	751	22	3	\N	\N	\N	\N
18531	751	23	3	\N	\N	\N	\N
18532	751	24	4	\N	\N	\N	\N
18533	751	27	2	\N	\N	\N	\N
18534	751	28	3	\N	\N	\N	\N
18535	751	29	4	\N	\N	\N	\N
18536	751	30	3	\N	\N	\N	\N
18537	751	31	3	\N	\N	\N	\N
18538	751	32	2	\N	\N	\N	\N
18539	751	33	3	\N	\N	\N	\N
18540	751	34	3	\N	\N	\N	\N
18541	751	35	3	\N	\N	\N	\N
18542	751	36	4	\N	\N	\N	\N
18543	751	37	4	\N	\N	\N	\N
18544	751	38	2	\N	\N	\N	\N
18545	751	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.922	MODELO
18546	751	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.575	MODELO
18547	750	18	3	\N	\N	\N	\N
18548	750	19	3	\N	\N	\N	\N
18549	750	20	4	\N	\N	\N	\N
18550	750	21	4	\N	\N	\N	\N
18551	750	22	3	\N	\N	\N	\N
18552	750	23	3	\N	\N	\N	\N
18553	750	24	4	\N	\N	\N	\N
18554	750	27	4	\N	\N	\N	\N
18555	750	28	4	\N	\N	\N	\N
18556	750	29	4	\N	\N	\N	\N
18557	750	30	4	\N	\N	\N	\N
18558	750	31	4	\N	\N	\N	\N
18559	750	32	4	\N	\N	\N	\N
18560	750	33	4	\N	\N	\N	\N
18561	750	34	1	\N	\N	\N	\N
18562	750	35	1	\N	\N	\N	\N
18563	750	36	3	\N	\N	\N	\N
18564	750	37	1	\N	\N	\N	\N
18565	750	38	4	\N	\N	\N	\N
18566	750	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.811	MODELO
18567	750	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.644	MODELO
18568	749	18	4	\N	\N	\N	\N
18569	749	19	3	\N	\N	\N	\N
18570	749	20	4	\N	\N	\N	\N
18571	749	21	2	\N	\N	\N	\N
18572	749	22	3	\N	\N	\N	\N
18573	749	23	3	\N	\N	\N	\N
18574	749	24	4	\N	\N	\N	\N
18575	749	27	2	\N	\N	\N	\N
18576	749	28	4	\N	\N	\N	\N
18577	749	29	3	\N	\N	\N	\N
18578	749	30	4	\N	\N	\N	\N
18579	749	31	3	\N	\N	\N	\N
18580	749	32	3	\N	\N	\N	\N
18581	749	33	3	\N	\N	\N	\N
18582	749	34	4	\N	\N	\N	\N
18583	749	35	3	\N	\N	\N	\N
18584	749	36	2	\N	\N	\N	\N
18585	749	37	3	\N	\N	\N	\N
18586	749	38	3	\N	\N	\N	\N
18587	749	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.956	MODELO
18588	749	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.894	MODELO
18589	748	18	3	\N	\N	\N	\N
18590	748	19	4	\N	\N	\N	\N
18591	748	20	3	\N	\N	\N	\N
18592	748	21	4	\N	\N	\N	\N
18593	748	22	2	\N	\N	\N	\N
18594	748	23	3	\N	\N	\N	\N
18595	748	24	3	\N	\N	\N	\N
18596	748	27	4	\N	\N	\N	\N
18597	748	28	3	\N	\N	\N	\N
18598	748	29	3	\N	\N	\N	\N
18599	748	30	4	\N	\N	\N	\N
18600	748	31	4	\N	\N	\N	\N
18601	748	32	3	\N	\N	\N	\N
18602	748	33	3	\N	\N	\N	\N
18603	748	34	4	\N	\N	\N	\N
18604	748	35	2	\N	\N	\N	\N
18605	748	36	3	\N	\N	\N	\N
18606	748	37	4	\N	\N	\N	\N
18607	748	38	4	\N	\N	\N	\N
18608	748	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.568	MODELO
18609	748	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.793	MODELO
18610	747	18	3	\N	\N	\N	\N
18611	747	19	3	\N	\N	\N	\N
18612	747	20	4	\N	\N	\N	\N
18613	747	21	2	\N	\N	\N	\N
18614	747	22	3	\N	\N	\N	\N
18615	747	23	2	\N	\N	\N	\N
18616	747	24	4	\N	\N	\N	\N
18617	747	27	1	\N	\N	\N	\N
18618	747	28	3	\N	\N	\N	\N
18619	747	29	2	\N	\N	\N	\N
18620	747	30	2	\N	\N	\N	\N
18621	747	31	3	\N	\N	\N	\N
18622	747	32	4	\N	\N	\N	\N
18623	747	33	2	\N	\N	\N	\N
18624	747	34	4	\N	\N	\N	\N
18625	747	35	4	\N	\N	\N	\N
18626	747	36	4	\N	\N	\N	\N
18627	747	37	4	\N	\N	\N	\N
18628	747	38	2	\N	\N	\N	\N
18629	747	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.789	MODELO
18630	747	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.889	MODELO
18631	746	18	3	\N	\N	\N	\N
18632	746	19	4	\N	\N	\N	\N
18633	746	20	3	\N	\N	\N	\N
18634	746	21	3	\N	\N	\N	\N
18635	746	22	4	\N	\N	\N	\N
18636	746	23	3	\N	\N	\N	\N
18637	746	24	3	\N	\N	\N	\N
18638	746	27	3	\N	\N	\N	\N
18639	746	28	3	\N	\N	\N	\N
18640	746	29	4	\N	\N	\N	\N
18641	746	30	3	\N	\N	\N	\N
18642	746	31	1	\N	\N	\N	\N
18643	746	32	4	\N	\N	\N	\N
18644	746	33	4	\N	\N	\N	\N
18645	746	34	3	\N	\N	\N	\N
18646	746	35	3	\N	\N	\N	\N
18647	746	36	4	\N	\N	\N	\N
18648	746	37	4	\N	\N	\N	\N
18649	746	38	3	\N	\N	\N	\N
18650	746	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.707	MODELO
18651	746	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.54	MODELO
18652	745	18	4	\N	\N	\N	\N
18653	745	19	3	\N	\N	\N	\N
18654	745	20	4	\N	\N	\N	\N
18655	745	21	3	\N	\N	\N	\N
18656	745	22	3	\N	\N	\N	\N
18657	745	23	3	\N	\N	\N	\N
18658	745	24	3	\N	\N	\N	\N
18659	745	27	2	\N	\N	\N	\N
18660	745	28	2	\N	\N	\N	\N
18661	745	29	3	\N	\N	\N	\N
18662	745	30	4	\N	\N	\N	\N
18663	745	31	3	\N	\N	\N	\N
18664	745	32	3	\N	\N	\N	\N
18665	745	33	3	\N	\N	\N	\N
18666	745	34	2	\N	\N	\N	\N
18667	745	35	3	\N	\N	\N	\N
18668	745	36	1	\N	\N	\N	\N
18669	745	37	3	\N	\N	\N	\N
18670	745	38	4	\N	\N	\N	\N
18671	745	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.923	MODELO
18672	745	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.589	MODELO
18673	744	18	3	\N	\N	\N	\N
18674	744	19	2	\N	\N	\N	\N
18675	744	20	3	\N	\N	\N	\N
18676	744	21	2	\N	\N	\N	\N
18677	744	22	4	\N	\N	\N	\N
18678	744	23	3	\N	\N	\N	\N
18679	744	24	3	\N	\N	\N	\N
18680	744	27	4	\N	\N	\N	\N
18681	744	28	3	\N	\N	\N	\N
18682	744	29	3	\N	\N	\N	\N
18683	744	30	3	\N	\N	\N	\N
18684	744	31	3	\N	\N	\N	\N
18685	744	32	3	\N	\N	\N	\N
18686	744	33	2	\N	\N	\N	\N
18687	744	34	2	\N	\N	\N	\N
18688	744	35	3	\N	\N	\N	\N
18689	744	36	3	\N	\N	\N	\N
18690	744	37	3	\N	\N	\N	\N
18691	744	38	3	\N	\N	\N	\N
18692	744	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.893	MODELO
18693	744	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.552	MODELO
18694	743	18	2	\N	\N	\N	\N
18695	743	19	3	\N	\N	\N	\N
18696	743	20	3	\N	\N	\N	\N
18697	743	21	4	\N	\N	\N	\N
18698	743	22	2	\N	\N	\N	\N
18699	743	23	3	\N	\N	\N	\N
18700	743	24	2	\N	\N	\N	\N
18701	743	27	3	\N	\N	\N	\N
18702	743	28	3	\N	\N	\N	\N
18703	743	29	3	\N	\N	\N	\N
18704	743	30	2	\N	\N	\N	\N
18705	743	31	4	\N	\N	\N	\N
18706	743	32	3	\N	\N	\N	\N
18707	743	33	2	\N	\N	\N	\N
18708	743	34	4	\N	\N	\N	\N
18709	743	35	4	\N	\N	\N	\N
18710	743	36	4	\N	\N	\N	\N
18711	743	37	4	\N	\N	\N	\N
18712	743	38	3	\N	\N	\N	\N
18713	743	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.968	MODELO
18714	743	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.961	MODELO
18715	742	18	3	\N	\N	\N	\N
18716	742	19	3	\N	\N	\N	\N
18717	742	20	3	\N	\N	\N	\N
18718	742	21	3	\N	\N	\N	\N
18719	742	22	4	\N	\N	\N	\N
18720	742	23	4	\N	\N	\N	\N
18721	742	24	4	\N	\N	\N	\N
18722	742	27	3	\N	\N	\N	\N
18723	742	28	4	\N	\N	\N	\N
18724	742	29	3	\N	\N	\N	\N
18725	742	30	3	\N	\N	\N	\N
18726	742	31	3	\N	\N	\N	\N
18727	742	32	3	\N	\N	\N	\N
18728	742	33	3	\N	\N	\N	\N
18729	742	34	4	\N	\N	\N	\N
18730	742	35	3	\N	\N	\N	\N
18731	742	36	4	\N	\N	\N	\N
18732	742	37	3	\N	\N	\N	\N
18733	742	38	4	\N	\N	\N	\N
18734	742	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.768	MODELO
18735	742	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.699	MODELO
18736	741	18	4	\N	\N	\N	\N
18737	741	19	4	\N	\N	\N	\N
18738	741	20	4	\N	\N	\N	\N
18739	741	21	2	\N	\N	\N	\N
18740	741	22	3	\N	\N	\N	\N
18741	741	23	4	\N	\N	\N	\N
18742	741	24	3	\N	\N	\N	\N
18743	741	27	4	\N	\N	\N	\N
18744	741	28	3	\N	\N	\N	\N
18745	741	29	3	\N	\N	\N	\N
18746	741	30	4	\N	\N	\N	\N
18747	741	31	3	\N	\N	\N	\N
18748	741	32	4	\N	\N	\N	\N
18749	741	33	3	\N	\N	\N	\N
18750	741	34	4	\N	\N	\N	\N
18751	741	35	4	\N	\N	\N	\N
18752	741	36	1	\N	\N	\N	\N
18753	741	37	2	\N	\N	\N	\N
18754	741	38	2	\N	\N	\N	\N
18755	741	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.84	MODELO
18756	741	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.58	MODELO
18757	740	18	3	\N	\N	\N	\N
18758	740	19	3	\N	\N	\N	\N
18759	740	20	3	\N	\N	\N	\N
18760	740	21	3	\N	\N	\N	\N
18761	740	22	4	\N	\N	\N	\N
18762	740	23	4	\N	\N	\N	\N
18763	740	24	2	\N	\N	\N	\N
18764	740	27	4	\N	\N	\N	\N
18765	740	28	2	\N	\N	\N	\N
18766	740	29	3	\N	\N	\N	\N
18767	740	30	3	\N	\N	\N	\N
18768	740	31	4	\N	\N	\N	\N
18769	740	32	3	\N	\N	\N	\N
18770	740	33	4	\N	\N	\N	\N
18771	740	34	4	\N	\N	\N	\N
18772	740	35	3	\N	\N	\N	\N
18773	740	36	2	\N	\N	\N	\N
18774	740	37	4	\N	\N	\N	\N
18775	740	38	3	\N	\N	\N	\N
18776	740	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.735	MODELO
18893	734	30	2	\N	\N	\N	\N
18777	740	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.585	MODELO
18778	739	18	4	\N	\N	\N	\N
18779	739	19	2	\N	\N	\N	\N
18780	739	20	3	\N	\N	\N	\N
18781	739	21	3	\N	\N	\N	\N
18782	739	22	3	\N	\N	\N	\N
18783	739	23	4	\N	\N	\N	\N
18784	739	24	3	\N	\N	\N	\N
18785	739	27	4	\N	\N	\N	\N
18786	739	28	4	\N	\N	\N	\N
18787	739	29	4	\N	\N	\N	\N
18788	739	30	4	\N	\N	\N	\N
18789	739	31	3	\N	\N	\N	\N
18790	739	32	4	\N	\N	\N	\N
18791	739	33	4	\N	\N	\N	\N
18792	739	34	2	\N	\N	\N	\N
18793	739	35	1	\N	\N	\N	\N
18794	739	36	3	\N	\N	\N	\N
18795	739	37	4	\N	\N	\N	\N
18796	739	38	2	\N	\N	\N	\N
18797	739	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.745	MODELO
18798	739	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.8	MODELO
18799	738	18	4	\N	\N	\N	\N
18800	738	19	3	\N	\N	\N	\N
18801	738	20	3	\N	\N	\N	\N
18802	738	21	3	\N	\N	\N	\N
18803	738	22	3	\N	\N	\N	\N
18804	738	23	3	\N	\N	\N	\N
18805	738	24	3	\N	\N	\N	\N
18806	738	27	3	\N	\N	\N	\N
18807	738	28	3	\N	\N	\N	\N
18808	738	29	3	\N	\N	\N	\N
18809	738	30	4	\N	\N	\N	\N
18810	738	31	3	\N	\N	\N	\N
18811	738	32	3	\N	\N	\N	\N
18812	738	33	3	\N	\N	\N	\N
18813	738	34	4	\N	\N	\N	\N
18814	738	35	4	\N	\N	\N	\N
18815	738	36	2	\N	\N	\N	\N
18816	738	37	2	\N	\N	\N	\N
18817	738	38	4	\N	\N	\N	\N
18818	738	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.723	MODELO
18819	738	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.63	MODELO
18820	737	18	1	\N	\N	\N	\N
18821	737	19	4	\N	\N	\N	\N
18822	737	20	3	\N	\N	\N	\N
18823	737	21	4	\N	\N	\N	\N
18824	737	22	4	\N	\N	\N	\N
18825	737	23	3	\N	\N	\N	\N
18826	737	24	2	\N	\N	\N	\N
18827	737	27	4	\N	\N	\N	\N
18828	737	28	4	\N	\N	\N	\N
18829	737	29	4	\N	\N	\N	\N
18830	737	30	4	\N	\N	\N	\N
18831	737	31	3	\N	\N	\N	\N
18832	737	32	3	\N	\N	\N	\N
18833	737	33	3	\N	\N	\N	\N
18834	737	34	3	\N	\N	\N	\N
18835	737	35	4	\N	\N	\N	\N
18836	737	36	4	\N	\N	\N	\N
18837	737	37	3	\N	\N	\N	\N
18838	737	38	4	\N	\N	\N	\N
18839	737	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.873	MODELO
18840	737	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.506	MODELO
18841	736	18	4	\N	\N	\N	\N
18842	736	19	3	\N	\N	\N	\N
18843	736	20	4	\N	\N	\N	\N
18844	736	21	3	\N	\N	\N	\N
18845	736	22	3	\N	\N	\N	\N
18846	736	23	4	\N	\N	\N	\N
18847	736	24	3	\N	\N	\N	\N
18848	736	27	3	\N	\N	\N	\N
18849	736	28	2	\N	\N	\N	\N
18850	736	29	3	\N	\N	\N	\N
18851	736	30	3	\N	\N	\N	\N
18852	736	31	4	\N	\N	\N	\N
18853	736	32	1	\N	\N	\N	\N
18854	736	33	4	\N	\N	\N	\N
18855	736	34	2	\N	\N	\N	\N
18856	736	35	2	\N	\N	\N	\N
18857	736	36	3	\N	\N	\N	\N
18858	736	37	3	\N	\N	\N	\N
18859	736	38	3	\N	\N	\N	\N
18860	736	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.847	MODELO
18861	736	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.785	MODELO
18862	735	18	4	\N	\N	\N	\N
18863	735	19	4	\N	\N	\N	\N
18864	735	20	2	\N	\N	\N	\N
18865	735	21	4	\N	\N	\N	\N
18866	735	22	4	\N	\N	\N	\N
18867	735	23	4	\N	\N	\N	\N
18868	735	24	3	\N	\N	\N	\N
18869	735	27	3	\N	\N	\N	\N
18870	735	28	3	\N	\N	\N	\N
18871	735	29	4	\N	\N	\N	\N
18872	735	30	4	\N	\N	\N	\N
18873	735	31	3	\N	\N	\N	\N
18874	735	32	3	\N	\N	\N	\N
18875	735	33	3	\N	\N	\N	\N
18876	735	34	3	\N	\N	\N	\N
18877	735	35	3	\N	\N	\N	\N
18878	735	36	4	\N	\N	\N	\N
18879	735	37	4	\N	\N	\N	\N
18880	735	38	3	\N	\N	\N	\N
18881	735	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.871	MODELO
18882	735	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.59	MODELO
18883	734	18	3	\N	\N	\N	\N
18884	734	19	3	\N	\N	\N	\N
18885	734	20	4	\N	\N	\N	\N
18886	734	21	4	\N	\N	\N	\N
18887	734	22	4	\N	\N	\N	\N
18888	734	23	2	\N	\N	\N	\N
18889	734	24	4	\N	\N	\N	\N
18890	734	27	3	\N	\N	\N	\N
18891	734	28	4	\N	\N	\N	\N
18892	734	29	4	\N	\N	\N	\N
18894	734	31	2	\N	\N	\N	\N
18895	734	32	4	\N	\N	\N	\N
18896	734	33	3	\N	\N	\N	\N
18897	734	34	3	\N	\N	\N	\N
18898	734	35	4	\N	\N	\N	\N
18899	734	36	3	\N	\N	\N	\N
18900	734	37	2	\N	\N	\N	\N
18901	734	38	3	\N	\N	\N	\N
18902	734	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.868	MODELO
18903	734	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.726	MODELO
18904	733	18	3	\N	\N	\N	\N
18905	733	19	4	\N	\N	\N	\N
18906	733	20	1	\N	\N	\N	\N
18907	733	21	3	\N	\N	\N	\N
18908	733	22	3	\N	\N	\N	\N
18909	733	23	4	\N	\N	\N	\N
18910	733	24	3	\N	\N	\N	\N
18911	733	27	2	\N	\N	\N	\N
18912	733	28	4	\N	\N	\N	\N
18913	733	29	4	\N	\N	\N	\N
18914	733	30	2	\N	\N	\N	\N
18915	733	31	3	\N	\N	\N	\N
18916	733	32	4	\N	\N	\N	\N
18917	733	33	4	\N	\N	\N	\N
18918	733	34	3	\N	\N	\N	\N
18919	733	35	3	\N	\N	\N	\N
18920	733	36	3	\N	\N	\N	\N
18921	733	37	3	\N	\N	\N	\N
18922	733	38	3	\N	\N	\N	\N
18923	733	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.85	MODELO
18924	733	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.886	MODELO
18925	732	18	4	\N	\N	\N	\N
18926	732	19	3	\N	\N	\N	\N
18927	732	20	3	\N	\N	\N	\N
18928	732	21	3	\N	\N	\N	\N
18929	732	22	4	\N	\N	\N	\N
18930	732	23	3	\N	\N	\N	\N
18931	732	24	4	\N	\N	\N	\N
18932	732	27	1	\N	\N	\N	\N
18933	732	28	2	\N	\N	\N	\N
18934	732	29	3	\N	\N	\N	\N
18935	732	30	2	\N	\N	\N	\N
18936	732	31	4	\N	\N	\N	\N
18937	732	32	3	\N	\N	\N	\N
18938	732	33	3	\N	\N	\N	\N
18939	732	34	3	\N	\N	\N	\N
18940	732	35	3	\N	\N	\N	\N
18941	732	36	1	\N	\N	\N	\N
18942	732	37	2	\N	\N	\N	\N
18943	732	38	4	\N	\N	\N	\N
18944	732	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.801	MODELO
18945	732	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.712	MODELO
18946	731	18	1	\N	\N	\N	\N
18947	731	19	4	\N	\N	\N	\N
18948	731	20	4	\N	\N	\N	\N
18949	731	21	4	\N	\N	\N	\N
18950	731	22	3	\N	\N	\N	\N
18951	731	23	4	\N	\N	\N	\N
18952	731	24	3	\N	\N	\N	\N
18953	731	27	3	\N	\N	\N	\N
18954	731	28	3	\N	\N	\N	\N
18955	731	29	4	\N	\N	\N	\N
18956	731	30	4	\N	\N	\N	\N
18957	731	31	4	\N	\N	\N	\N
18958	731	32	3	\N	\N	\N	\N
18959	731	33	4	\N	\N	\N	\N
18960	731	34	3	\N	\N	\N	\N
18961	731	35	3	\N	\N	\N	\N
18962	731	36	3	\N	\N	\N	\N
18963	731	37	3	\N	\N	\N	\N
18964	731	38	3	\N	\N	\N	\N
18965	731	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.92	MODELO
18966	731	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.508	MODELO
18967	730	18	1	\N	\N	\N	\N
18968	730	19	4	\N	\N	\N	\N
18969	730	20	3	\N	\N	\N	\N
18970	730	21	3	\N	\N	\N	\N
18971	730	22	4	\N	\N	\N	\N
18972	730	23	2	\N	\N	\N	\N
18973	730	24	1	\N	\N	\N	\N
18974	730	27	4	\N	\N	\N	\N
18975	730	28	2	\N	\N	\N	\N
18976	730	29	4	\N	\N	\N	\N
18977	730	30	3	\N	\N	\N	\N
18978	730	31	3	\N	\N	\N	\N
18979	730	32	4	\N	\N	\N	\N
18980	730	33	4	\N	\N	\N	\N
18981	730	34	4	\N	\N	\N	\N
18982	730	35	2	\N	\N	\N	\N
18983	730	36	2	\N	\N	\N	\N
18984	730	37	4	\N	\N	\N	\N
18985	730	38	3	\N	\N	\N	\N
18986	730	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.96	MODELO
18987	730	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.503	MODELO
18988	729	18	3	\N	\N	\N	\N
18989	729	19	2	\N	\N	\N	\N
18990	729	20	2	\N	\N	\N	\N
18991	729	21	4	\N	\N	\N	\N
18992	729	22	4	\N	\N	\N	\N
18993	729	23	3	\N	\N	\N	\N
18994	729	24	3	\N	\N	\N	\N
18995	729	27	4	\N	\N	\N	\N
18996	729	28	4	\N	\N	\N	\N
18997	729	29	3	\N	\N	\N	\N
18998	729	30	3	\N	\N	\N	\N
18999	729	31	3	\N	\N	\N	\N
19000	729	32	3	\N	\N	\N	\N
19001	729	33	3	\N	\N	\N	\N
19002	729	34	4	\N	\N	\N	\N
19003	729	35	2	\N	\N	\N	\N
19004	729	36	4	\N	\N	\N	\N
19005	729	37	3	\N	\N	\N	\N
19006	729	38	3	\N	\N	\N	\N
19007	729	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.975	MODELO
19008	729	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.943	MODELO
19009	728	18	4	\N	\N	\N	\N
19010	728	19	3	\N	\N	\N	\N
19011	728	20	3	\N	\N	\N	\N
19012	728	21	4	\N	\N	\N	\N
19013	728	22	4	\N	\N	\N	\N
19014	728	23	3	\N	\N	\N	\N
19015	728	24	4	\N	\N	\N	\N
19016	728	27	2	\N	\N	\N	\N
19017	728	28	4	\N	\N	\N	\N
19018	728	29	4	\N	\N	\N	\N
19019	728	30	3	\N	\N	\N	\N
19020	728	31	3	\N	\N	\N	\N
19021	728	32	4	\N	\N	\N	\N
19022	728	33	1	\N	\N	\N	\N
19023	728	34	3	\N	\N	\N	\N
19024	728	35	3	\N	\N	\N	\N
19025	728	36	3	\N	\N	\N	\N
19026	728	37	3	\N	\N	\N	\N
19027	728	38	2	\N	\N	\N	\N
19028	728	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.966	MODELO
19029	728	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.886	MODELO
19030	727	18	4	\N	\N	\N	\N
19031	727	19	3	\N	\N	\N	\N
19032	727	20	3	\N	\N	\N	\N
19033	727	21	3	\N	\N	\N	\N
19034	727	22	4	\N	\N	\N	\N
19035	727	23	4	\N	\N	\N	\N
19036	727	24	4	\N	\N	\N	\N
19037	727	27	3	\N	\N	\N	\N
19038	727	28	4	\N	\N	\N	\N
19039	727	29	4	\N	\N	\N	\N
19040	727	30	3	\N	\N	\N	\N
19041	727	31	4	\N	\N	\N	\N
19042	727	32	4	\N	\N	\N	\N
19043	727	33	2	\N	\N	\N	\N
19044	727	34	2	\N	\N	\N	\N
19045	727	35	4	\N	\N	\N	\N
19046	727	36	4	\N	\N	\N	\N
19047	727	37	4	\N	\N	\N	\N
19048	727	38	3	\N	\N	\N	\N
19049	727	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.63	MODELO
19050	727	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.707	MODELO
19051	726	18	3	\N	\N	\N	\N
19052	726	19	4	\N	\N	\N	\N
19053	726	20	3	\N	\N	\N	\N
19054	726	21	3	\N	\N	\N	\N
19055	726	22	4	\N	\N	\N	\N
19056	726	23	2	\N	\N	\N	\N
19057	726	24	4	\N	\N	\N	\N
19058	726	27	4	\N	\N	\N	\N
19059	726	28	2	\N	\N	\N	\N
19060	726	29	3	\N	\N	\N	\N
19061	726	30	3	\N	\N	\N	\N
19062	726	31	3	\N	\N	\N	\N
19063	726	32	3	\N	\N	\N	\N
19064	726	33	4	\N	\N	\N	\N
19065	726	34	3	\N	\N	\N	\N
19066	726	35	3	\N	\N	\N	\N
19067	726	36	3	\N	\N	\N	\N
19068	726	37	4	\N	\N	\N	\N
19069	726	38	1	\N	\N	\N	\N
19070	726	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.806	MODELO
19071	726	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.739	MODELO
19072	725	18	3	\N	\N	\N	\N
19073	725	19	3	\N	\N	\N	\N
19074	725	20	3	\N	\N	\N	\N
19075	725	21	4	\N	\N	\N	\N
19076	725	22	1	\N	\N	\N	\N
19077	725	23	3	\N	\N	\N	\N
19078	725	24	3	\N	\N	\N	\N
19079	725	27	3	\N	\N	\N	\N
19080	725	28	4	\N	\N	\N	\N
19081	725	29	4	\N	\N	\N	\N
19082	725	30	4	\N	\N	\N	\N
19083	725	31	3	\N	\N	\N	\N
19084	725	32	3	\N	\N	\N	\N
19085	725	33	4	\N	\N	\N	\N
19086	725	34	4	\N	\N	\N	\N
19087	725	35	3	\N	\N	\N	\N
19088	725	36	4	\N	\N	\N	\N
19089	725	37	3	\N	\N	\N	\N
19090	725	38	2	\N	\N	\N	\N
19091	725	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.81	MODELO
19092	725	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.707	MODELO
19093	724	18	3	\N	\N	\N	\N
19094	724	19	3	\N	\N	\N	\N
19095	724	20	3	\N	\N	\N	\N
19096	724	21	4	\N	\N	\N	\N
19097	724	22	4	\N	\N	\N	\N
19098	724	23	4	\N	\N	\N	\N
19099	724	24	4	\N	\N	\N	\N
19100	724	27	3	\N	\N	\N	\N
19101	724	28	4	\N	\N	\N	\N
19102	724	29	3	\N	\N	\N	\N
19103	724	30	2	\N	\N	\N	\N
19104	724	31	3	\N	\N	\N	\N
19105	724	32	2	\N	\N	\N	\N
19106	724	33	3	\N	\N	\N	\N
19107	724	34	4	\N	\N	\N	\N
19108	724	35	4	\N	\N	\N	\N
19109	724	36	4	\N	\N	\N	\N
19110	724	37	3	\N	\N	\N	\N
19111	724	38	4	\N	\N	\N	\N
19112	724	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.834	MODELO
19113	724	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.931	MODELO
19114	723	18	4	\N	\N	\N	\N
19115	723	19	4	\N	\N	\N	\N
19116	723	20	3	\N	\N	\N	\N
19117	723	21	3	\N	\N	\N	\N
19118	723	22	3	\N	\N	\N	\N
19119	723	23	3	\N	\N	\N	\N
19120	723	24	2	\N	\N	\N	\N
19121	723	27	4	\N	\N	\N	\N
19122	723	28	4	\N	\N	\N	\N
19123	723	29	4	\N	\N	\N	\N
19124	723	30	2	\N	\N	\N	\N
19125	723	31	4	\N	\N	\N	\N
19126	723	32	4	\N	\N	\N	\N
19127	723	33	4	\N	\N	\N	\N
19128	723	34	3	\N	\N	\N	\N
19129	723	35	4	\N	\N	\N	\N
19130	723	36	4	\N	\N	\N	\N
19131	723	37	4	\N	\N	\N	\N
19132	723	38	4	\N	\N	\N	\N
19133	723	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.982	MODELO
19134	723	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.954	MODELO
19135	722	18	1	\N	\N	\N	\N
19136	722	19	3	\N	\N	\N	\N
19137	722	20	3	\N	\N	\N	\N
19138	722	21	3	\N	\N	\N	\N
19139	722	22	3	\N	\N	\N	\N
19140	722	23	3	\N	\N	\N	\N
19141	722	24	3	\N	\N	\N	\N
19142	722	27	4	\N	\N	\N	\N
19143	722	28	4	\N	\N	\N	\N
19144	722	29	3	\N	\N	\N	\N
19145	722	30	4	\N	\N	\N	\N
19146	722	31	3	\N	\N	\N	\N
19147	722	32	4	\N	\N	\N	\N
19148	722	33	4	\N	\N	\N	\N
19149	722	34	4	\N	\N	\N	\N
19150	722	35	3	\N	\N	\N	\N
19151	722	36	2	\N	\N	\N	\N
19152	722	37	4	\N	\N	\N	\N
19153	722	38	2	\N	\N	\N	\N
19154	722	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.715	MODELO
19155	722	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.905	MODELO
19156	721	18	3	\N	\N	\N	\N
19157	721	19	4	\N	\N	\N	\N
19158	721	20	4	\N	\N	\N	\N
19159	721	21	3	\N	\N	\N	\N
19160	721	22	4	\N	\N	\N	\N
19161	721	23	3	\N	\N	\N	\N
19162	721	24	4	\N	\N	\N	\N
19163	721	27	3	\N	\N	\N	\N
19164	721	28	3	\N	\N	\N	\N
19165	721	29	2	\N	\N	\N	\N
19166	721	30	4	\N	\N	\N	\N
19167	721	31	3	\N	\N	\N	\N
19168	721	32	4	\N	\N	\N	\N
19169	721	33	4	\N	\N	\N	\N
19170	721	34	3	\N	\N	\N	\N
19171	721	35	4	\N	\N	\N	\N
19172	721	36	3	\N	\N	\N	\N
19173	721	37	3	\N	\N	\N	\N
19174	721	38	4	\N	\N	\N	\N
19175	721	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.943	MODELO
19176	721	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.516	MODELO
19177	720	18	2	\N	\N	\N	\N
19178	720	19	4	\N	\N	\N	\N
19179	720	20	3	\N	\N	\N	\N
19180	720	21	2	\N	\N	\N	\N
19181	720	22	3	\N	\N	\N	\N
19182	720	23	4	\N	\N	\N	\N
19183	720	24	4	\N	\N	\N	\N
19184	720	27	4	\N	\N	\N	\N
19185	720	28	3	\N	\N	\N	\N
19186	720	29	4	\N	\N	\N	\N
19187	720	30	3	\N	\N	\N	\N
19188	720	31	4	\N	\N	\N	\N
19189	720	32	4	\N	\N	\N	\N
19190	720	33	4	\N	\N	\N	\N
19191	720	34	3	\N	\N	\N	\N
19192	720	35	3	\N	\N	\N	\N
19193	720	36	4	\N	\N	\N	\N
19194	720	37	3	\N	\N	\N	\N
19195	720	38	3	\N	\N	\N	\N
19196	720	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.724	MODELO
19197	720	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.684	MODELO
19198	719	18	4	\N	\N	\N	\N
19199	719	19	4	\N	\N	\N	\N
19200	719	20	1	\N	\N	\N	\N
19201	719	21	3	\N	\N	\N	\N
19202	719	22	3	\N	\N	\N	\N
19203	719	23	3	\N	\N	\N	\N
19204	719	24	3	\N	\N	\N	\N
19205	719	27	3	\N	\N	\N	\N
19206	719	28	3	\N	\N	\N	\N
19207	719	29	3	\N	\N	\N	\N
19208	719	30	3	\N	\N	\N	\N
19209	719	31	3	\N	\N	\N	\N
19210	719	32	3	\N	\N	\N	\N
19211	719	33	3	\N	\N	\N	\N
19212	719	34	3	\N	\N	\N	\N
19213	719	35	2	\N	\N	\N	\N
19214	719	36	3	\N	\N	\N	\N
19215	719	37	4	\N	\N	\N	\N
19216	719	38	2	\N	\N	\N	\N
19217	719	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.629	MODELO
19218	719	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.753	MODELO
19219	718	18	3	\N	\N	\N	\N
19220	718	19	3	\N	\N	\N	\N
19221	718	20	4	\N	\N	\N	\N
19222	718	21	4	\N	\N	\N	\N
19223	718	22	3	\N	\N	\N	\N
19224	718	23	4	\N	\N	\N	\N
19225	718	24	3	\N	\N	\N	\N
19226	718	27	3	\N	\N	\N	\N
19227	718	28	4	\N	\N	\N	\N
19228	718	29	4	\N	\N	\N	\N
19229	718	30	3	\N	\N	\N	\N
19230	718	31	4	\N	\N	\N	\N
19231	718	32	3	\N	\N	\N	\N
19232	718	33	4	\N	\N	\N	\N
19233	718	34	4	\N	\N	\N	\N
19234	718	35	3	\N	\N	\N	\N
19235	718	36	4	\N	\N	\N	\N
19236	718	37	4	\N	\N	\N	\N
19237	718	38	3	\N	\N	\N	\N
19238	718	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.85	MODELO
19239	718	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.52	MODELO
19240	717	18	3	\N	\N	\N	\N
19241	717	19	4	\N	\N	\N	\N
19242	717	20	4	\N	\N	\N	\N
19243	717	21	4	\N	\N	\N	\N
19244	717	22	3	\N	\N	\N	\N
19245	717	23	1	\N	\N	\N	\N
19246	717	24	4	\N	\N	\N	\N
19247	717	27	4	\N	\N	\N	\N
19248	717	28	4	\N	\N	\N	\N
19249	717	29	3	\N	\N	\N	\N
19250	717	30	1	\N	\N	\N	\N
19251	717	31	4	\N	\N	\N	\N
19252	717	32	3	\N	\N	\N	\N
19253	717	33	3	\N	\N	\N	\N
19254	717	34	1	\N	\N	\N	\N
19255	717	35	4	\N	\N	\N	\N
19256	717	36	3	\N	\N	\N	\N
19257	717	37	4	\N	\N	\N	\N
19258	717	38	3	\N	\N	\N	\N
19259	717	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.734	MODELO
19260	717	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.964	MODELO
19261	716	18	3	\N	\N	\N	\N
19262	716	19	1	\N	\N	\N	\N
19263	716	20	2	\N	\N	\N	\N
19264	716	21	3	\N	\N	\N	\N
19265	716	22	3	\N	\N	\N	\N
19266	716	23	2	\N	\N	\N	\N
19267	716	24	3	\N	\N	\N	\N
19268	716	27	4	\N	\N	\N	\N
19269	716	28	4	\N	\N	\N	\N
19270	716	29	3	\N	\N	\N	\N
19271	716	30	2	\N	\N	\N	\N
19272	716	31	4	\N	\N	\N	\N
19273	716	32	4	\N	\N	\N	\N
19274	716	33	3	\N	\N	\N	\N
19275	716	34	4	\N	\N	\N	\N
19276	716	35	1	\N	\N	\N	\N
19277	716	36	4	\N	\N	\N	\N
19278	716	37	4	\N	\N	\N	\N
19279	716	38	3	\N	\N	\N	\N
19280	716	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.975	MODELO
19281	716	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.718	MODELO
19282	715	18	3	\N	\N	\N	\N
19283	715	19	2	\N	\N	\N	\N
19284	715	20	2	\N	\N	\N	\N
19285	715	21	4	\N	\N	\N	\N
19286	715	22	3	\N	\N	\N	\N
19287	715	23	3	\N	\N	\N	\N
19288	715	24	2	\N	\N	\N	\N
19289	715	27	3	\N	\N	\N	\N
19290	715	28	3	\N	\N	\N	\N
19291	715	29	3	\N	\N	\N	\N
19292	715	30	3	\N	\N	\N	\N
19293	715	31	3	\N	\N	\N	\N
19294	715	32	4	\N	\N	\N	\N
19295	715	33	4	\N	\N	\N	\N
19296	715	34	4	\N	\N	\N	\N
19297	715	35	3	\N	\N	\N	\N
19298	715	36	4	\N	\N	\N	\N
19299	715	37	4	\N	\N	\N	\N
19300	715	38	4	\N	\N	\N	\N
19301	715	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.878	MODELO
19302	715	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.848	MODELO
19303	714	18	2	\N	\N	\N	\N
19304	714	19	4	\N	\N	\N	\N
19305	714	20	2	\N	\N	\N	\N
19306	714	21	3	\N	\N	\N	\N
19307	714	22	4	\N	\N	\N	\N
19308	714	23	3	\N	\N	\N	\N
19309	714	24	3	\N	\N	\N	\N
19310	714	27	4	\N	\N	\N	\N
19311	714	28	3	\N	\N	\N	\N
19312	714	29	3	\N	\N	\N	\N
19313	714	30	2	\N	\N	\N	\N
19314	714	31	1	\N	\N	\N	\N
19315	714	32	3	\N	\N	\N	\N
19316	714	33	4	\N	\N	\N	\N
19317	714	34	4	\N	\N	\N	\N
19318	714	35	3	\N	\N	\N	\N
19319	714	36	2	\N	\N	\N	\N
19320	714	37	1	\N	\N	\N	\N
19321	714	38	4	\N	\N	\N	\N
19322	714	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.645	MODELO
19323	714	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.632	MODELO
19324	713	18	4	\N	\N	\N	\N
19325	713	19	3	\N	\N	\N	\N
19326	713	20	3	\N	\N	\N	\N
19327	713	21	3	\N	\N	\N	\N
19328	713	22	3	\N	\N	\N	\N
19329	713	23	4	\N	\N	\N	\N
19330	713	24	4	\N	\N	\N	\N
19331	713	27	2	\N	\N	\N	\N
19332	713	28	3	\N	\N	\N	\N
19333	713	29	4	\N	\N	\N	\N
19334	713	30	4	\N	\N	\N	\N
19335	713	31	4	\N	\N	\N	\N
19336	713	32	4	\N	\N	\N	\N
19337	713	33	4	\N	\N	\N	\N
19338	713	34	3	\N	\N	\N	\N
19339	713	35	3	\N	\N	\N	\N
19340	713	36	4	\N	\N	\N	\N
19341	713	37	3	\N	\N	\N	\N
19342	713	38	3	\N	\N	\N	\N
19343	713	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.757	MODELO
19344	713	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.703	MODELO
19345	712	18	3	\N	\N	\N	\N
19346	712	19	4	\N	\N	\N	\N
19347	712	20	3	\N	\N	\N	\N
19348	712	21	4	\N	\N	\N	\N
19349	712	22	4	\N	\N	\N	\N
19350	712	23	3	\N	\N	\N	\N
19351	712	24	3	\N	\N	\N	\N
19352	712	27	4	\N	\N	\N	\N
19353	712	28	3	\N	\N	\N	\N
19354	712	29	4	\N	\N	\N	\N
19355	712	30	2	\N	\N	\N	\N
19356	712	31	3	\N	\N	\N	\N
19357	712	32	3	\N	\N	\N	\N
19358	712	33	4	\N	\N	\N	\N
19359	712	34	3	\N	\N	\N	\N
19360	712	35	3	\N	\N	\N	\N
19361	712	36	4	\N	\N	\N	\N
19362	712	37	4	\N	\N	\N	\N
19363	712	38	3	\N	\N	\N	\N
19364	712	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.891	MODELO
19485	706	34	3	\N	\N	\N	\N
19365	712	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.875	MODELO
19366	711	18	4	\N	\N	\N	\N
19367	711	19	3	\N	\N	\N	\N
19368	711	20	3	\N	\N	\N	\N
19369	711	21	3	\N	\N	\N	\N
19370	711	22	4	\N	\N	\N	\N
19371	711	23	3	\N	\N	\N	\N
19372	711	24	3	\N	\N	\N	\N
19373	711	27	3	\N	\N	\N	\N
19374	711	28	2	\N	\N	\N	\N
19375	711	29	3	\N	\N	\N	\N
19376	711	30	3	\N	\N	\N	\N
19377	711	31	3	\N	\N	\N	\N
19378	711	32	4	\N	\N	\N	\N
19379	711	33	3	\N	\N	\N	\N
19380	711	34	4	\N	\N	\N	\N
19381	711	35	3	\N	\N	\N	\N
19382	711	36	3	\N	\N	\N	\N
19383	711	37	4	\N	\N	\N	\N
19384	711	38	4	\N	\N	\N	\N
19385	711	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.802	MODELO
19386	711	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.696	MODELO
19387	710	18	4	\N	\N	\N	\N
19388	710	19	1	\N	\N	\N	\N
19389	710	20	4	\N	\N	\N	\N
19390	710	21	3	\N	\N	\N	\N
19391	710	22	3	\N	\N	\N	\N
19392	710	23	1	\N	\N	\N	\N
19393	710	24	4	\N	\N	\N	\N
19394	710	27	3	\N	\N	\N	\N
19395	710	28	3	\N	\N	\N	\N
19396	710	29	3	\N	\N	\N	\N
19397	710	30	4	\N	\N	\N	\N
19398	710	31	3	\N	\N	\N	\N
19399	710	32	1	\N	\N	\N	\N
19400	710	33	2	\N	\N	\N	\N
19401	710	34	3	\N	\N	\N	\N
19402	710	35	4	\N	\N	\N	\N
19403	710	36	4	\N	\N	\N	\N
19404	710	37	4	\N	\N	\N	\N
19405	710	38	3	\N	\N	\N	\N
19406	710	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.87	MODELO
19407	710	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.635	MODELO
19408	709	18	3	\N	\N	\N	\N
19409	709	19	1	\N	\N	\N	\N
19410	709	20	2	\N	\N	\N	\N
19411	709	21	3	\N	\N	\N	\N
19412	709	22	3	\N	\N	\N	\N
19413	709	23	3	\N	\N	\N	\N
19414	709	24	4	\N	\N	\N	\N
19415	709	27	4	\N	\N	\N	\N
19416	709	28	4	\N	\N	\N	\N
19417	709	29	4	\N	\N	\N	\N
19418	709	30	3	\N	\N	\N	\N
19419	709	31	3	\N	\N	\N	\N
19420	709	32	3	\N	\N	\N	\N
19421	709	33	3	\N	\N	\N	\N
19422	709	34	4	\N	\N	\N	\N
19423	709	35	3	\N	\N	\N	\N
19424	709	36	4	\N	\N	\N	\N
19425	709	37	4	\N	\N	\N	\N
19426	709	38	2	\N	\N	\N	\N
19427	709	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.841	MODELO
19428	709	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.683	MODELO
19429	708	18	3	\N	\N	\N	\N
19430	708	19	3	\N	\N	\N	\N
19431	708	20	4	\N	\N	\N	\N
19432	708	21	1	\N	\N	\N	\N
19433	708	22	2	\N	\N	\N	\N
19434	708	23	3	\N	\N	\N	\N
19435	708	24	3	\N	\N	\N	\N
19436	708	27	2	\N	\N	\N	\N
19437	708	28	3	\N	\N	\N	\N
19438	708	29	3	\N	\N	\N	\N
19439	708	30	4	\N	\N	\N	\N
19440	708	31	3	\N	\N	\N	\N
19441	708	32	3	\N	\N	\N	\N
19442	708	33	4	\N	\N	\N	\N
19443	708	34	3	\N	\N	\N	\N
19444	708	35	4	\N	\N	\N	\N
19445	708	36	1	\N	\N	\N	\N
19446	708	37	4	\N	\N	\N	\N
19447	708	38	4	\N	\N	\N	\N
19448	708	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.526	MODELO
19449	708	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.71	MODELO
19450	707	18	4	\N	\N	\N	\N
19451	707	19	2	\N	\N	\N	\N
19452	707	20	4	\N	\N	\N	\N
19453	707	21	3	\N	\N	\N	\N
19454	707	22	3	\N	\N	\N	\N
19455	707	23	3	\N	\N	\N	\N
19456	707	24	2	\N	\N	\N	\N
19457	707	27	3	\N	\N	\N	\N
19458	707	28	3	\N	\N	\N	\N
19459	707	29	2	\N	\N	\N	\N
19460	707	30	2	\N	\N	\N	\N
19461	707	31	3	\N	\N	\N	\N
19462	707	32	4	\N	\N	\N	\N
19463	707	33	3	\N	\N	\N	\N
19464	707	34	4	\N	\N	\N	\N
19465	707	35	4	\N	\N	\N	\N
19466	707	36	4	\N	\N	\N	\N
19467	707	37	4	\N	\N	\N	\N
19468	707	38	1	\N	\N	\N	\N
19469	707	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.855	MODELO
19470	707	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.88	MODELO
19471	706	18	4	\N	\N	\N	\N
19472	706	19	4	\N	\N	\N	\N
19473	706	20	4	\N	\N	\N	\N
19474	706	21	3	\N	\N	\N	\N
19475	706	22	3	\N	\N	\N	\N
19476	706	23	1	\N	\N	\N	\N
19477	706	24	2	\N	\N	\N	\N
19478	706	27	3	\N	\N	\N	\N
19479	706	28	2	\N	\N	\N	\N
19480	706	29	4	\N	\N	\N	\N
19481	706	30	4	\N	\N	\N	\N
19482	706	31	2	\N	\N	\N	\N
19483	706	32	4	\N	\N	\N	\N
19484	706	33	3	\N	\N	\N	\N
19486	706	35	3	\N	\N	\N	\N
19487	706	36	2	\N	\N	\N	\N
19488	706	37	3	\N	\N	\N	\N
19489	706	38	3	\N	\N	\N	\N
19490	706	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.733	MODELO
19491	706	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.912	MODELO
19492	705	18	4	\N	\N	\N	\N
19493	705	19	4	\N	\N	\N	\N
19494	705	20	2	\N	\N	\N	\N
19495	705	21	3	\N	\N	\N	\N
19496	705	22	4	\N	\N	\N	\N
19497	705	23	3	\N	\N	\N	\N
19498	705	24	2	\N	\N	\N	\N
19499	705	27	3	\N	\N	\N	\N
19500	705	28	3	\N	\N	\N	\N
19501	705	29	3	\N	\N	\N	\N
19502	705	30	4	\N	\N	\N	\N
19503	705	31	3	\N	\N	\N	\N
19504	705	32	4	\N	\N	\N	\N
19505	705	33	3	\N	\N	\N	\N
19506	705	34	4	\N	\N	\N	\N
19507	705	35	3	\N	\N	\N	\N
19508	705	36	2	\N	\N	\N	\N
19509	705	37	1	\N	\N	\N	\N
19510	705	38	4	\N	\N	\N	\N
19511	705	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.771	MODELO
19512	705	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.764	MODELO
19513	704	18	4	\N	\N	\N	\N
19514	704	19	3	\N	\N	\N	\N
19515	704	20	3	\N	\N	\N	\N
19516	704	21	4	\N	\N	\N	\N
19517	704	22	4	\N	\N	\N	\N
19518	704	23	3	\N	\N	\N	\N
19519	704	24	4	\N	\N	\N	\N
19520	704	27	3	\N	\N	\N	\N
19521	704	28	4	\N	\N	\N	\N
19522	704	29	3	\N	\N	\N	\N
19523	704	30	1	\N	\N	\N	\N
19524	704	31	3	\N	\N	\N	\N
19525	704	32	1	\N	\N	\N	\N
19526	704	33	2	\N	\N	\N	\N
19527	704	34	4	\N	\N	\N	\N
19528	704	35	4	\N	\N	\N	\N
19529	704	36	4	\N	\N	\N	\N
19530	704	37	3	\N	\N	\N	\N
19531	704	38	3	\N	\N	\N	\N
19532	704	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.714	MODELO
19533	704	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.708	MODELO
19534	703	18	4	\N	\N	\N	\N
19535	703	19	3	\N	\N	\N	\N
19536	703	20	4	\N	\N	\N	\N
19537	703	21	3	\N	\N	\N	\N
19538	703	22	4	\N	\N	\N	\N
19539	703	23	4	\N	\N	\N	\N
19540	703	24	1	\N	\N	\N	\N
19541	703	27	4	\N	\N	\N	\N
19542	703	28	2	\N	\N	\N	\N
19543	703	29	3	\N	\N	\N	\N
19544	703	30	1	\N	\N	\N	\N
19545	703	31	3	\N	\N	\N	\N
19546	703	32	4	\N	\N	\N	\N
19547	703	33	3	\N	\N	\N	\N
19548	703	34	1	\N	\N	\N	\N
19549	703	35	4	\N	\N	\N	\N
19550	703	36	3	\N	\N	\N	\N
19551	703	37	3	\N	\N	\N	\N
19552	703	38	3	\N	\N	\N	\N
19553	703	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.922	MODELO
19554	703	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.857	MODELO
19555	702	18	3	\N	\N	\N	\N
19556	702	19	4	\N	\N	\N	\N
19557	702	20	3	\N	\N	\N	\N
19558	702	21	3	\N	\N	\N	\N
19559	702	22	3	\N	\N	\N	\N
19560	702	23	4	\N	\N	\N	\N
19561	702	24	2	\N	\N	\N	\N
19562	702	27	4	\N	\N	\N	\N
19563	702	28	4	\N	\N	\N	\N
19564	702	29	3	\N	\N	\N	\N
19565	702	30	4	\N	\N	\N	\N
19566	702	31	4	\N	\N	\N	\N
19567	702	32	3	\N	\N	\N	\N
19568	702	33	3	\N	\N	\N	\N
19569	702	34	3	\N	\N	\N	\N
19570	702	35	3	\N	\N	\N	\N
19571	702	36	4	\N	\N	\N	\N
19572	702	37	3	\N	\N	\N	\N
19573	702	38	4	\N	\N	\N	\N
19574	702	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.948	MODELO
19575	702	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.972	MODELO
19576	701	18	4	\N	\N	\N	\N
19577	701	19	3	\N	\N	\N	\N
19578	701	20	3	\N	\N	\N	\N
19579	701	21	3	\N	\N	\N	\N
19580	701	22	4	\N	\N	\N	\N
19581	701	23	4	\N	\N	\N	\N
19582	701	24	4	\N	\N	\N	\N
19583	701	27	4	\N	\N	\N	\N
19584	701	28	2	\N	\N	\N	\N
19585	701	29	4	\N	\N	\N	\N
19586	701	30	4	\N	\N	\N	\N
19587	701	31	3	\N	\N	\N	\N
19588	701	32	3	\N	\N	\N	\N
19589	701	33	3	\N	\N	\N	\N
19590	701	34	4	\N	\N	\N	\N
19591	701	35	3	\N	\N	\N	\N
19592	701	36	3	\N	\N	\N	\N
19593	701	37	2	\N	\N	\N	\N
19594	701	38	4	\N	\N	\N	\N
19595	701	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.781	MODELO
19596	701	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.813	MODELO
19597	700	18	3	\N	\N	\N	\N
19598	700	19	4	\N	\N	\N	\N
19599	700	20	4	\N	\N	\N	\N
19600	700	21	3	\N	\N	\N	\N
19601	700	22	3	\N	\N	\N	\N
19602	700	23	3	\N	\N	\N	\N
19603	700	24	4	\N	\N	\N	\N
19604	700	27	3	\N	\N	\N	\N
19605	700	28	4	\N	\N	\N	\N
19606	700	29	4	\N	\N	\N	\N
19607	700	30	3	\N	\N	\N	\N
19608	700	31	3	\N	\N	\N	\N
19609	700	32	3	\N	\N	\N	\N
19610	700	33	4	\N	\N	\N	\N
19611	700	34	4	\N	\N	\N	\N
19612	700	35	3	\N	\N	\N	\N
19613	700	36	4	\N	\N	\N	\N
19614	700	37	1	\N	\N	\N	\N
19615	700	38	4	\N	\N	\N	\N
19616	700	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.707	MODELO
19617	700	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.614	MODELO
19618	699	18	3	\N	\N	\N	\N
19619	699	19	3	\N	\N	\N	\N
19620	699	20	3	\N	\N	\N	\N
19621	699	21	4	\N	\N	\N	\N
19622	699	22	4	\N	\N	\N	\N
19623	699	23	4	\N	\N	\N	\N
19624	699	24	4	\N	\N	\N	\N
19625	699	27	4	\N	\N	\N	\N
19626	699	28	4	\N	\N	\N	\N
19627	699	29	4	\N	\N	\N	\N
19628	699	30	3	\N	\N	\N	\N
19629	699	31	3	\N	\N	\N	\N
19630	699	32	3	\N	\N	\N	\N
19631	699	33	4	\N	\N	\N	\N
19632	699	34	3	\N	\N	\N	\N
19633	699	35	4	\N	\N	\N	\N
19634	699	36	3	\N	\N	\N	\N
19635	699	37	2	\N	\N	\N	\N
19636	699	38	3	\N	\N	\N	\N
19637	699	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.882	MODELO
19638	699	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.722	MODELO
19639	698	18	3	\N	\N	\N	\N
19640	698	19	3	\N	\N	\N	\N
19641	698	20	3	\N	\N	\N	\N
19642	698	21	3	\N	\N	\N	\N
19643	698	22	2	\N	\N	\N	\N
19644	698	23	3	\N	\N	\N	\N
19645	698	24	1	\N	\N	\N	\N
19646	698	27	3	\N	\N	\N	\N
19647	698	28	3	\N	\N	\N	\N
19648	698	29	3	\N	\N	\N	\N
19649	698	30	3	\N	\N	\N	\N
19650	698	31	4	\N	\N	\N	\N
19651	698	32	3	\N	\N	\N	\N
19652	698	33	4	\N	\N	\N	\N
19653	698	34	3	\N	\N	\N	\N
19654	698	35	4	\N	\N	\N	\N
19655	698	36	4	\N	\N	\N	\N
19656	698	37	4	\N	\N	\N	\N
19657	698	38	4	\N	\N	\N	\N
19658	698	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.784	MODELO
19659	698	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.879	MODELO
19660	697	18	3	\N	\N	\N	\N
19661	697	19	3	\N	\N	\N	\N
19662	697	20	4	\N	\N	\N	\N
19663	697	21	3	\N	\N	\N	\N
19664	697	22	4	\N	\N	\N	\N
19665	697	23	3	\N	\N	\N	\N
19666	697	24	4	\N	\N	\N	\N
19667	697	27	3	\N	\N	\N	\N
19668	697	28	3	\N	\N	\N	\N
19669	697	29	4	\N	\N	\N	\N
19670	697	30	2	\N	\N	\N	\N
19671	697	31	4	\N	\N	\N	\N
19672	697	32	3	\N	\N	\N	\N
19673	697	33	4	\N	\N	\N	\N
19674	697	34	2	\N	\N	\N	\N
19675	697	35	3	\N	\N	\N	\N
19676	697	36	4	\N	\N	\N	\N
19677	697	37	2	\N	\N	\N	\N
19678	697	38	3	\N	\N	\N	\N
19679	697	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.504	MODELO
19680	697	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.929	MODELO
19681	696	18	3	\N	\N	\N	\N
19682	696	19	3	\N	\N	\N	\N
19683	696	20	3	\N	\N	\N	\N
19684	696	21	3	\N	\N	\N	\N
19685	696	22	4	\N	\N	\N	\N
19686	696	23	4	\N	\N	\N	\N
19687	696	24	4	\N	\N	\N	\N
19688	696	27	3	\N	\N	\N	\N
19689	696	28	3	\N	\N	\N	\N
19690	696	29	4	\N	\N	\N	\N
19691	696	30	3	\N	\N	\N	\N
19692	696	31	3	\N	\N	\N	\N
19693	696	32	3	\N	\N	\N	\N
19694	696	33	4	\N	\N	\N	\N
19695	696	34	4	\N	\N	\N	\N
19696	696	35	4	\N	\N	\N	\N
19697	696	36	4	\N	\N	\N	\N
19698	696	37	2	\N	\N	\N	\N
19699	696	38	4	\N	\N	\N	\N
19700	696	25	\N	No me vienen a la mente, fue una experiencia bastante decepcionante.	NEGATIVO	0.822	MODELO
19701	696	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.695	MODELO
19702	695	18	4	\N	\N	\N	\N
19703	695	19	1	\N	\N	\N	\N
19704	695	20	3	\N	\N	\N	\N
19705	695	21	4	\N	\N	\N	\N
19706	695	22	3	\N	\N	\N	\N
19707	695	23	4	\N	\N	\N	\N
19708	695	24	1	\N	\N	\N	\N
19709	695	27	4	\N	\N	\N	\N
19710	695	28	3	\N	\N	\N	\N
19711	695	29	4	\N	\N	\N	\N
19712	695	30	4	\N	\N	\N	\N
19713	695	31	3	\N	\N	\N	\N
19714	695	32	2	\N	\N	\N	\N
19715	695	33	4	\N	\N	\N	\N
19716	695	34	3	\N	\N	\N	\N
19717	695	35	3	\N	\N	\N	\N
19718	695	36	3	\N	\N	\N	\N
19719	695	37	4	\N	\N	\N	\N
19720	695	38	3	\N	\N	\N	\N
19721	695	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.928	MODELO
19722	695	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.775	MODELO
19723	694	18	4	\N	\N	\N	\N
19724	694	19	3	\N	\N	\N	\N
19725	694	20	4	\N	\N	\N	\N
19726	694	21	3	\N	\N	\N	\N
19727	694	22	4	\N	\N	\N	\N
19728	694	23	4	\N	\N	\N	\N
19729	694	24	3	\N	\N	\N	\N
19730	694	27	3	\N	\N	\N	\N
19731	694	28	4	\N	\N	\N	\N
19732	694	29	4	\N	\N	\N	\N
19733	694	30	4	\N	\N	\N	\N
19734	694	31	3	\N	\N	\N	\N
19735	694	32	3	\N	\N	\N	\N
19736	694	33	3	\N	\N	\N	\N
19737	694	34	4	\N	\N	\N	\N
19738	694	35	4	\N	\N	\N	\N
19739	694	36	3	\N	\N	\N	\N
19740	694	37	3	\N	\N	\N	\N
19741	694	38	3	\N	\N	\N	\N
19742	694	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.919	MODELO
19743	694	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.711	MODELO
19744	693	18	3	\N	\N	\N	\N
19745	693	19	3	\N	\N	\N	\N
19746	693	20	2	\N	\N	\N	\N
19747	693	21	4	\N	\N	\N	\N
19748	693	22	3	\N	\N	\N	\N
19749	693	23	4	\N	\N	\N	\N
19750	693	24	3	\N	\N	\N	\N
19751	693	27	2	\N	\N	\N	\N
19752	693	28	4	\N	\N	\N	\N
19753	693	29	3	\N	\N	\N	\N
19754	693	30	4	\N	\N	\N	\N
19755	693	31	3	\N	\N	\N	\N
19756	693	32	3	\N	\N	\N	\N
19757	693	33	3	\N	\N	\N	\N
19758	693	34	3	\N	\N	\N	\N
19759	693	35	3	\N	\N	\N	\N
19760	693	36	3	\N	\N	\N	\N
19761	693	37	3	\N	\N	\N	\N
19762	693	38	3	\N	\N	\N	\N
19763	693	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.955	MODELO
19764	693	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.817	MODELO
19765	692	18	3	\N	\N	\N	\N
19766	692	19	4	\N	\N	\N	\N
19767	692	20	3	\N	\N	\N	\N
19768	692	21	3	\N	\N	\N	\N
19769	692	22	4	\N	\N	\N	\N
19770	692	23	4	\N	\N	\N	\N
19771	692	24	4	\N	\N	\N	\N
19772	692	27	3	\N	\N	\N	\N
19773	692	28	4	\N	\N	\N	\N
19774	692	29	3	\N	\N	\N	\N
19775	692	30	2	\N	\N	\N	\N
19776	692	31	3	\N	\N	\N	\N
19777	692	32	3	\N	\N	\N	\N
19778	692	33	2	\N	\N	\N	\N
19779	692	34	1	\N	\N	\N	\N
19780	692	35	4	\N	\N	\N	\N
19781	692	36	3	\N	\N	\N	\N
19782	692	37	1	\N	\N	\N	\N
19783	692	38	3	\N	\N	\N	\N
19784	692	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.819	MODELO
19785	692	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.823	MODELO
19786	1168	18	3	\N	\N	\N	\N
19787	1168	19	4	\N	\N	\N	\N
19788	1168	20	3	\N	\N	\N	\N
19789	1168	21	3	\N	\N	\N	\N
19790	1168	22	3	\N	\N	\N	\N
19791	1168	23	4	\N	\N	\N	\N
19792	1168	24	4	\N	\N	\N	\N
19793	1168	27	3	\N	\N	\N	\N
19794	1168	28	3	\N	\N	\N	\N
19795	1168	29	2	\N	\N	\N	\N
19796	1168	30	4	\N	\N	\N	\N
19797	1168	31	3	\N	\N	\N	\N
19798	1168	32	4	\N	\N	\N	\N
19799	1168	33	4	\N	\N	\N	\N
19800	1168	34	3	\N	\N	\N	\N
19801	1168	35	3	\N	\N	\N	\N
19802	1168	36	3	\N	\N	\N	\N
19803	1168	37	4	\N	\N	\N	\N
19804	1168	38	4	\N	\N	\N	\N
19805	1168	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.982	MODELO
19806	1168	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.856	MODELO
19807	1167	18	3	\N	\N	\N	\N
19808	1167	19	3	\N	\N	\N	\N
19809	1167	20	3	\N	\N	\N	\N
19810	1167	21	4	\N	\N	\N	\N
19811	1167	22	3	\N	\N	\N	\N
19812	1167	23	2	\N	\N	\N	\N
19813	1167	24	3	\N	\N	\N	\N
19814	1167	27	4	\N	\N	\N	\N
19815	1167	28	3	\N	\N	\N	\N
19816	1167	29	3	\N	\N	\N	\N
19817	1167	30	4	\N	\N	\N	\N
19818	1167	31	4	\N	\N	\N	\N
19819	1167	32	3	\N	\N	\N	\N
19820	1167	33	2	\N	\N	\N	\N
19821	1167	34	3	\N	\N	\N	\N
19822	1167	35	4	\N	\N	\N	\N
19823	1167	36	3	\N	\N	\N	\N
19824	1167	37	3	\N	\N	\N	\N
19825	1167	38	3	\N	\N	\N	\N
19826	1167	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.921	MODELO
19827	1167	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.828	MODELO
19828	1166	18	3	\N	\N	\N	\N
19829	1166	19	4	\N	\N	\N	\N
19830	1166	20	3	\N	\N	\N	\N
19831	1166	21	4	\N	\N	\N	\N
19832	1166	22	3	\N	\N	\N	\N
19833	1166	23	2	\N	\N	\N	\N
19834	1166	24	3	\N	\N	\N	\N
19835	1166	27	3	\N	\N	\N	\N
19836	1166	28	4	\N	\N	\N	\N
19837	1166	29	2	\N	\N	\N	\N
19838	1166	30	2	\N	\N	\N	\N
19839	1166	31	2	\N	\N	\N	\N
19840	1166	32	4	\N	\N	\N	\N
19841	1166	33	3	\N	\N	\N	\N
19842	1166	34	4	\N	\N	\N	\N
19843	1166	35	3	\N	\N	\N	\N
19844	1166	36	4	\N	\N	\N	\N
19845	1166	37	3	\N	\N	\N	\N
19846	1166	38	1	\N	\N	\N	\N
19847	1166	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.906	MODELO
19848	1166	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.612	MODELO
19849	1165	18	1	\N	\N	\N	\N
19850	1165	19	4	\N	\N	\N	\N
19851	1165	20	4	\N	\N	\N	\N
19852	1165	21	3	\N	\N	\N	\N
19853	1165	22	3	\N	\N	\N	\N
19854	1165	23	4	\N	\N	\N	\N
19855	1165	24	3	\N	\N	\N	\N
19856	1165	27	4	\N	\N	\N	\N
19857	1165	28	4	\N	\N	\N	\N
19858	1165	29	4	\N	\N	\N	\N
19859	1165	30	3	\N	\N	\N	\N
19860	1165	31	4	\N	\N	\N	\N
19861	1165	32	4	\N	\N	\N	\N
19862	1165	33	2	\N	\N	\N	\N
19863	1165	34	4	\N	\N	\N	\N
19864	1165	35	2	\N	\N	\N	\N
19865	1165	36	2	\N	\N	\N	\N
19866	1165	37	4	\N	\N	\N	\N
19867	1165	38	3	\N	\N	\N	\N
19868	1165	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.61	MODELO
19869	1165	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.65	MODELO
19870	1164	18	3	\N	\N	\N	\N
19871	1164	19	4	\N	\N	\N	\N
19872	1164	20	4	\N	\N	\N	\N
19873	1164	21	3	\N	\N	\N	\N
19874	1164	22	4	\N	\N	\N	\N
19875	1164	23	4	\N	\N	\N	\N
19876	1164	24	4	\N	\N	\N	\N
19877	1164	27	4	\N	\N	\N	\N
19878	1164	28	3	\N	\N	\N	\N
19879	1164	29	3	\N	\N	\N	\N
19880	1164	30	2	\N	\N	\N	\N
19881	1164	31	1	\N	\N	\N	\N
19882	1164	32	2	\N	\N	\N	\N
19883	1164	33	3	\N	\N	\N	\N
19884	1164	34	4	\N	\N	\N	\N
19885	1164	35	4	\N	\N	\N	\N
19886	1164	36	3	\N	\N	\N	\N
19887	1164	37	4	\N	\N	\N	\N
19888	1164	38	3	\N	\N	\N	\N
19889	1164	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.531	MODELO
19890	1164	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.754	MODELO
19891	1163	18	4	\N	\N	\N	\N
19892	1163	19	4	\N	\N	\N	\N
19893	1163	20	3	\N	\N	\N	\N
19894	1163	21	3	\N	\N	\N	\N
19895	1163	22	2	\N	\N	\N	\N
19896	1163	23	3	\N	\N	\N	\N
19897	1163	24	3	\N	\N	\N	\N
19898	1163	27	3	\N	\N	\N	\N
19899	1163	28	4	\N	\N	\N	\N
19900	1163	29	4	\N	\N	\N	\N
19901	1163	30	3	\N	\N	\N	\N
19902	1163	31	4	\N	\N	\N	\N
19903	1163	32	3	\N	\N	\N	\N
19904	1163	33	3	\N	\N	\N	\N
19905	1163	34	3	\N	\N	\N	\N
19906	1163	35	3	\N	\N	\N	\N
19907	1163	36	4	\N	\N	\N	\N
19908	1163	37	1	\N	\N	\N	\N
19909	1163	38	4	\N	\N	\N	\N
19910	1163	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.815	MODELO
19911	1163	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.743	MODELO
19912	1162	18	1	\N	\N	\N	\N
19913	1162	19	1	\N	\N	\N	\N
19914	1162	20	3	\N	\N	\N	\N
19915	1162	21	1	\N	\N	\N	\N
19916	1162	22	3	\N	\N	\N	\N
19917	1162	23	3	\N	\N	\N	\N
19918	1162	24	2	\N	\N	\N	\N
19919	1162	27	2	\N	\N	\N	\N
19920	1162	28	4	\N	\N	\N	\N
19921	1162	29	3	\N	\N	\N	\N
19922	1162	30	4	\N	\N	\N	\N
19923	1162	31	3	\N	\N	\N	\N
19924	1162	32	3	\N	\N	\N	\N
19925	1162	33	3	\N	\N	\N	\N
19926	1162	34	2	\N	\N	\N	\N
19927	1162	35	4	\N	\N	\N	\N
19928	1162	36	3	\N	\N	\N	\N
19929	1162	37	3	\N	\N	\N	\N
19930	1162	38	3	\N	\N	\N	\N
19931	1162	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.781	MODELO
19932	1162	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.685	MODELO
19933	1161	18	4	\N	\N	\N	\N
19934	1161	19	4	\N	\N	\N	\N
19935	1161	20	3	\N	\N	\N	\N
19936	1161	21	3	\N	\N	\N	\N
19937	1161	22	4	\N	\N	\N	\N
19938	1161	23	4	\N	\N	\N	\N
19939	1161	24	3	\N	\N	\N	\N
19940	1161	27	4	\N	\N	\N	\N
19941	1161	28	4	\N	\N	\N	\N
19942	1161	29	3	\N	\N	\N	\N
19943	1161	30	3	\N	\N	\N	\N
19944	1161	31	4	\N	\N	\N	\N
19945	1161	32	4	\N	\N	\N	\N
19946	1161	33	3	\N	\N	\N	\N
19947	1161	34	4	\N	\N	\N	\N
19948	1161	35	4	\N	\N	\N	\N
19949	1161	36	2	\N	\N	\N	\N
19950	1161	37	3	\N	\N	\N	\N
19951	1161	38	3	\N	\N	\N	\N
19952	1161	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.859	MODELO
19953	1161	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.869	MODELO
19954	1160	18	2	\N	\N	\N	\N
19955	1160	19	3	\N	\N	\N	\N
19956	1160	20	3	\N	\N	\N	\N
19957	1160	21	2	\N	\N	\N	\N
19958	1160	22	4	\N	\N	\N	\N
19959	1160	23	3	\N	\N	\N	\N
19960	1160	24	2	\N	\N	\N	\N
19961	1160	27	3	\N	\N	\N	\N
19962	1160	28	4	\N	\N	\N	\N
19963	1160	29	2	\N	\N	\N	\N
19964	1160	30	4	\N	\N	\N	\N
19965	1160	31	2	\N	\N	\N	\N
19966	1160	32	4	\N	\N	\N	\N
19967	1160	33	3	\N	\N	\N	\N
19968	1160	34	4	\N	\N	\N	\N
19969	1160	35	2	\N	\N	\N	\N
19970	1160	36	2	\N	\N	\N	\N
19971	1160	37	3	\N	\N	\N	\N
19972	1160	38	4	\N	\N	\N	\N
19973	1160	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.93	MODELO
19974	1160	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.975	MODELO
19975	1159	18	4	\N	\N	\N	\N
19976	1159	19	4	\N	\N	\N	\N
19977	1159	20	3	\N	\N	\N	\N
19978	1159	21	3	\N	\N	\N	\N
19979	1159	22	3	\N	\N	\N	\N
19980	1159	23	4	\N	\N	\N	\N
19981	1159	24	2	\N	\N	\N	\N
19982	1159	27	3	\N	\N	\N	\N
19983	1159	28	4	\N	\N	\N	\N
19984	1159	29	4	\N	\N	\N	\N
19985	1159	30	3	\N	\N	\N	\N
19986	1159	31	3	\N	\N	\N	\N
19987	1159	32	4	\N	\N	\N	\N
19988	1159	33	3	\N	\N	\N	\N
19989	1159	34	3	\N	\N	\N	\N
19990	1159	35	2	\N	\N	\N	\N
19991	1159	36	4	\N	\N	\N	\N
19992	1159	37	3	\N	\N	\N	\N
19993	1159	38	3	\N	\N	\N	\N
19994	1159	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.785	MODELO
19995	1159	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.926	MODELO
19996	1158	18	3	\N	\N	\N	\N
19997	1158	19	3	\N	\N	\N	\N
19998	1158	20	4	\N	\N	\N	\N
19999	1158	21	4	\N	\N	\N	\N
20000	1158	22	4	\N	\N	\N	\N
20001	1158	23	4	\N	\N	\N	\N
20002	1158	24	4	\N	\N	\N	\N
20003	1158	27	4	\N	\N	\N	\N
20004	1158	28	4	\N	\N	\N	\N
20005	1158	29	1	\N	\N	\N	\N
20006	1158	30	3	\N	\N	\N	\N
20007	1158	31	3	\N	\N	\N	\N
20008	1158	32	4	\N	\N	\N	\N
20009	1158	33	4	\N	\N	\N	\N
20010	1158	34	3	\N	\N	\N	\N
20011	1158	35	4	\N	\N	\N	\N
20012	1158	36	4	\N	\N	\N	\N
20013	1158	37	3	\N	\N	\N	\N
20014	1158	38	3	\N	\N	\N	\N
20015	1158	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.78	MODELO
20016	1158	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.775	MODELO
20017	1157	18	3	\N	\N	\N	\N
20018	1157	19	2	\N	\N	\N	\N
20019	1157	20	3	\N	\N	\N	\N
20020	1157	21	3	\N	\N	\N	\N
20021	1157	22	4	\N	\N	\N	\N
20022	1157	23	4	\N	\N	\N	\N
20023	1157	24	3	\N	\N	\N	\N
20024	1157	27	3	\N	\N	\N	\N
20025	1157	28	3	\N	\N	\N	\N
20026	1157	29	3	\N	\N	\N	\N
20027	1157	30	4	\N	\N	\N	\N
20028	1157	31	3	\N	\N	\N	\N
20029	1157	32	1	\N	\N	\N	\N
20030	1157	33	4	\N	\N	\N	\N
20031	1157	34	4	\N	\N	\N	\N
20032	1157	35	4	\N	\N	\N	\N
20033	1157	36	3	\N	\N	\N	\N
20034	1157	37	4	\N	\N	\N	\N
20035	1157	38	4	\N	\N	\N	\N
20036	1157	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.713	MODELO
20037	1157	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.698	MODELO
20038	1156	18	4	\N	\N	\N	\N
20039	1156	19	4	\N	\N	\N	\N
20040	1156	20	4	\N	\N	\N	\N
20041	1156	21	4	\N	\N	\N	\N
20042	1156	22	3	\N	\N	\N	\N
20043	1156	23	4	\N	\N	\N	\N
20044	1156	24	4	\N	\N	\N	\N
20045	1156	27	4	\N	\N	\N	\N
20046	1156	28	3	\N	\N	\N	\N
20047	1156	29	3	\N	\N	\N	\N
20048	1156	30	4	\N	\N	\N	\N
20049	1156	31	1	\N	\N	\N	\N
20050	1156	32	4	\N	\N	\N	\N
20051	1156	33	4	\N	\N	\N	\N
20052	1156	34	3	\N	\N	\N	\N
20053	1156	35	2	\N	\N	\N	\N
20054	1156	36	3	\N	\N	\N	\N
20055	1156	37	4	\N	\N	\N	\N
20056	1156	38	2	\N	\N	\N	\N
20057	1156	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.562	MODELO
20058	1156	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.766	MODELO
20059	1155	18	3	\N	\N	\N	\N
20060	1155	19	4	\N	\N	\N	\N
20061	1155	20	4	\N	\N	\N	\N
20062	1155	21	4	\N	\N	\N	\N
20063	1155	22	3	\N	\N	\N	\N
20064	1155	23	4	\N	\N	\N	\N
20065	1155	24	4	\N	\N	\N	\N
20066	1155	27	2	\N	\N	\N	\N
20067	1155	28	3	\N	\N	\N	\N
20068	1155	29	4	\N	\N	\N	\N
20069	1155	30	3	\N	\N	\N	\N
20070	1155	31	2	\N	\N	\N	\N
20071	1155	32	2	\N	\N	\N	\N
20072	1155	33	2	\N	\N	\N	\N
20073	1155	34	4	\N	\N	\N	\N
20074	1155	35	4	\N	\N	\N	\N
20075	1155	36	2	\N	\N	\N	\N
20076	1155	37	4	\N	\N	\N	\N
20077	1155	38	3	\N	\N	\N	\N
20078	1155	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.92	MODELO
20079	1155	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.822	MODELO
20080	1154	18	4	\N	\N	\N	\N
20081	1154	19	4	\N	\N	\N	\N
20082	1154	20	4	\N	\N	\N	\N
20083	1154	21	4	\N	\N	\N	\N
20084	1154	22	3	\N	\N	\N	\N
20085	1154	23	2	\N	\N	\N	\N
20086	1154	24	3	\N	\N	\N	\N
20087	1154	27	3	\N	\N	\N	\N
20088	1154	28	4	\N	\N	\N	\N
20089	1154	29	3	\N	\N	\N	\N
20090	1154	30	4	\N	\N	\N	\N
20091	1154	31	3	\N	\N	\N	\N
20092	1154	32	3	\N	\N	\N	\N
20093	1154	33	4	\N	\N	\N	\N
20094	1154	34	3	\N	\N	\N	\N
20095	1154	35	3	\N	\N	\N	\N
20096	1154	36	3	\N	\N	\N	\N
20097	1154	37	4	\N	\N	\N	\N
20098	1154	38	3	\N	\N	\N	\N
20099	1154	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.636	MODELO
20100	1154	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.602	MODELO
20101	1153	18	2	\N	\N	\N	\N
20102	1153	19	4	\N	\N	\N	\N
20103	1153	20	3	\N	\N	\N	\N
20104	1153	21	4	\N	\N	\N	\N
20105	1153	22	2	\N	\N	\N	\N
20106	1153	23	4	\N	\N	\N	\N
20107	1153	24	4	\N	\N	\N	\N
20108	1153	27	2	\N	\N	\N	\N
20109	1153	28	3	\N	\N	\N	\N
20110	1153	29	3	\N	\N	\N	\N
20111	1153	30	4	\N	\N	\N	\N
20112	1153	31	3	\N	\N	\N	\N
20113	1153	32	4	\N	\N	\N	\N
20114	1153	33	3	\N	\N	\N	\N
20115	1153	34	3	\N	\N	\N	\N
20116	1153	35	3	\N	\N	\N	\N
20117	1153	36	3	\N	\N	\N	\N
20118	1153	37	3	\N	\N	\N	\N
20119	1153	38	3	\N	\N	\N	\N
20120	1153	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.541	MODELO
20121	1153	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.866	MODELO
20122	1152	18	1	\N	\N	\N	\N
20123	1152	19	2	\N	\N	\N	\N
20124	1152	20	3	\N	\N	\N	\N
20125	1152	21	3	\N	\N	\N	\N
20126	1152	22	3	\N	\N	\N	\N
20127	1152	23	4	\N	\N	\N	\N
20128	1152	24	4	\N	\N	\N	\N
20129	1152	27	3	\N	\N	\N	\N
20130	1152	28	4	\N	\N	\N	\N
20131	1152	29	2	\N	\N	\N	\N
20132	1152	30	3	\N	\N	\N	\N
20133	1152	31	3	\N	\N	\N	\N
20134	1152	32	3	\N	\N	\N	\N
20135	1152	33	3	\N	\N	\N	\N
20136	1152	34	4	\N	\N	\N	\N
20137	1152	35	3	\N	\N	\N	\N
20138	1152	36	4	\N	\N	\N	\N
20139	1152	37	3	\N	\N	\N	\N
20140	1152	38	3	\N	\N	\N	\N
20141	1152	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.839	MODELO
20142	1152	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.813	MODELO
20143	1151	18	3	\N	\N	\N	\N
20144	1151	19	4	\N	\N	\N	\N
20145	1151	20	3	\N	\N	\N	\N
20146	1151	21	3	\N	\N	\N	\N
20147	1151	22	3	\N	\N	\N	\N
20148	1151	23	4	\N	\N	\N	\N
20149	1151	24	4	\N	\N	\N	\N
20150	1151	27	4	\N	\N	\N	\N
20151	1151	28	4	\N	\N	\N	\N
20152	1151	29	3	\N	\N	\N	\N
20153	1151	30	4	\N	\N	\N	\N
20154	1151	31	4	\N	\N	\N	\N
20155	1151	32	4	\N	\N	\N	\N
20156	1151	33	2	\N	\N	\N	\N
20157	1151	34	3	\N	\N	\N	\N
20158	1151	35	3	\N	\N	\N	\N
20159	1151	36	3	\N	\N	\N	\N
20160	1151	37	4	\N	\N	\N	\N
20161	1151	38	3	\N	\N	\N	\N
20162	1151	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.751	MODELO
20163	1151	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.962	MODELO
20164	1150	18	4	\N	\N	\N	\N
20165	1150	19	3	\N	\N	\N	\N
20166	1150	20	3	\N	\N	\N	\N
20167	1150	21	4	\N	\N	\N	\N
20168	1150	22	3	\N	\N	\N	\N
20169	1150	23	3	\N	\N	\N	\N
20170	1150	24	4	\N	\N	\N	\N
20171	1150	27	4	\N	\N	\N	\N
20172	1150	28	4	\N	\N	\N	\N
20173	1150	29	1	\N	\N	\N	\N
20174	1150	30	3	\N	\N	\N	\N
20175	1150	31	3	\N	\N	\N	\N
20176	1150	32	3	\N	\N	\N	\N
20177	1150	33	4	\N	\N	\N	\N
20178	1150	34	3	\N	\N	\N	\N
20179	1150	35	3	\N	\N	\N	\N
20180	1150	36	1	\N	\N	\N	\N
20181	1150	37	3	\N	\N	\N	\N
20182	1150	38	3	\N	\N	\N	\N
20183	1150	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.873	MODELO
20184	1150	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.511	MODELO
20185	1149	18	3	\N	\N	\N	\N
20186	1149	19	4	\N	\N	\N	\N
20187	1149	20	3	\N	\N	\N	\N
20188	1149	21	4	\N	\N	\N	\N
20189	1149	22	3	\N	\N	\N	\N
20190	1149	23	3	\N	\N	\N	\N
20191	1149	24	3	\N	\N	\N	\N
20192	1149	27	4	\N	\N	\N	\N
20193	1149	28	3	\N	\N	\N	\N
20194	1149	29	3	\N	\N	\N	\N
20195	1149	30	3	\N	\N	\N	\N
20196	1149	31	3	\N	\N	\N	\N
20197	1149	32	3	\N	\N	\N	\N
20198	1149	33	3	\N	\N	\N	\N
20199	1149	34	4	\N	\N	\N	\N
20200	1149	35	4	\N	\N	\N	\N
20201	1149	36	3	\N	\N	\N	\N
20202	1149	37	2	\N	\N	\N	\N
20203	1149	38	1	\N	\N	\N	\N
20204	1149	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.866	MODELO
20205	1149	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.814	MODELO
20206	1148	18	3	\N	\N	\N	\N
20207	1148	19	3	\N	\N	\N	\N
20208	1148	20	2	\N	\N	\N	\N
20209	1148	21	4	\N	\N	\N	\N
20210	1148	22	3	\N	\N	\N	\N
20211	1148	23	4	\N	\N	\N	\N
20212	1148	24	4	\N	\N	\N	\N
20213	1148	27	4	\N	\N	\N	\N
20214	1148	28	3	\N	\N	\N	\N
20215	1148	29	3	\N	\N	\N	\N
20216	1148	30	4	\N	\N	\N	\N
20217	1148	31	3	\N	\N	\N	\N
20218	1148	32	3	\N	\N	\N	\N
20219	1148	33	3	\N	\N	\N	\N
20220	1148	34	4	\N	\N	\N	\N
20221	1148	35	4	\N	\N	\N	\N
20222	1148	36	2	\N	\N	\N	\N
20223	1148	37	4	\N	\N	\N	\N
20224	1148	38	4	\N	\N	\N	\N
20225	1148	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.829	MODELO
20226	1148	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.859	MODELO
20227	1147	18	3	\N	\N	\N	\N
20228	1147	19	4	\N	\N	\N	\N
20229	1147	20	4	\N	\N	\N	\N
20230	1147	21	2	\N	\N	\N	\N
20231	1147	22	4	\N	\N	\N	\N
20232	1147	23	4	\N	\N	\N	\N
20233	1147	24	4	\N	\N	\N	\N
20234	1147	27	2	\N	\N	\N	\N
20235	1147	28	3	\N	\N	\N	\N
20236	1147	29	3	\N	\N	\N	\N
20237	1147	30	4	\N	\N	\N	\N
20238	1147	31	3	\N	\N	\N	\N
20239	1147	32	3	\N	\N	\N	\N
20240	1147	33	3	\N	\N	\N	\N
20241	1147	34	4	\N	\N	\N	\N
20242	1147	35	3	\N	\N	\N	\N
20243	1147	36	2	\N	\N	\N	\N
20244	1147	37	3	\N	\N	\N	\N
20245	1147	38	4	\N	\N	\N	\N
20246	1147	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.715	MODELO
20247	1147	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.62	MODELO
20248	1146	18	3	\N	\N	\N	\N
20249	1146	19	4	\N	\N	\N	\N
20250	1146	20	4	\N	\N	\N	\N
20251	1146	21	4	\N	\N	\N	\N
20252	1146	22	4	\N	\N	\N	\N
20253	1146	23	4	\N	\N	\N	\N
20254	1146	24	3	\N	\N	\N	\N
20255	1146	27	3	\N	\N	\N	\N
20256	1146	28	3	\N	\N	\N	\N
20257	1146	29	3	\N	\N	\N	\N
20258	1146	30	4	\N	\N	\N	\N
20259	1146	31	3	\N	\N	\N	\N
20260	1146	32	3	\N	\N	\N	\N
20261	1146	33	3	\N	\N	\N	\N
20262	1146	34	2	\N	\N	\N	\N
20263	1146	35	2	\N	\N	\N	\N
20264	1146	36	3	\N	\N	\N	\N
20265	1146	37	3	\N	\N	\N	\N
20266	1146	38	4	\N	\N	\N	\N
20267	1146	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.675	MODELO
20268	1146	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.683	MODELO
20269	1145	18	3	\N	\N	\N	\N
20270	1145	19	3	\N	\N	\N	\N
20271	1145	20	3	\N	\N	\N	\N
20272	1145	21	3	\N	\N	\N	\N
20273	1145	22	2	\N	\N	\N	\N
20274	1145	23	4	\N	\N	\N	\N
20275	1145	24	3	\N	\N	\N	\N
20276	1145	27	3	\N	\N	\N	\N
20277	1145	28	4	\N	\N	\N	\N
20278	1145	29	1	\N	\N	\N	\N
20279	1145	30	1	\N	\N	\N	\N
20280	1145	31	1	\N	\N	\N	\N
20281	1145	32	4	\N	\N	\N	\N
20282	1145	33	4	\N	\N	\N	\N
20283	1145	34	4	\N	\N	\N	\N
20284	1145	35	4	\N	\N	\N	\N
20285	1145	36	2	\N	\N	\N	\N
20286	1145	37	4	\N	\N	\N	\N
20287	1145	38	3	\N	\N	\N	\N
20288	1145	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.752	MODELO
20289	1145	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.89	MODELO
20290	1144	18	4	\N	\N	\N	\N
20291	1144	19	2	\N	\N	\N	\N
20292	1144	20	3	\N	\N	\N	\N
20293	1144	21	3	\N	\N	\N	\N
20294	1144	22	4	\N	\N	\N	\N
20295	1144	23	4	\N	\N	\N	\N
20296	1144	24	4	\N	\N	\N	\N
20297	1144	27	2	\N	\N	\N	\N
20298	1144	28	4	\N	\N	\N	\N
20299	1144	29	2	\N	\N	\N	\N
20300	1144	30	3	\N	\N	\N	\N
20301	1144	31	3	\N	\N	\N	\N
20302	1144	32	1	\N	\N	\N	\N
20303	1144	33	3	\N	\N	\N	\N
20304	1144	34	4	\N	\N	\N	\N
20305	1144	35	4	\N	\N	\N	\N
20306	1144	36	3	\N	\N	\N	\N
20307	1144	37	3	\N	\N	\N	\N
20308	1144	38	3	\N	\N	\N	\N
20309	1144	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.587	MODELO
20310	1144	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.596	MODELO
20311	1143	18	1	\N	\N	\N	\N
20312	1143	19	3	\N	\N	\N	\N
20313	1143	20	2	\N	\N	\N	\N
20314	1143	21	2	\N	\N	\N	\N
20315	1143	22	3	\N	\N	\N	\N
20316	1143	23	3	\N	\N	\N	\N
20317	1143	24	4	\N	\N	\N	\N
20318	1143	27	4	\N	\N	\N	\N
20319	1143	28	3	\N	\N	\N	\N
20320	1143	29	3	\N	\N	\N	\N
20321	1143	30	3	\N	\N	\N	\N
20322	1143	31	3	\N	\N	\N	\N
20323	1143	32	3	\N	\N	\N	\N
20324	1143	33	3	\N	\N	\N	\N
20325	1143	34	4	\N	\N	\N	\N
20326	1143	35	3	\N	\N	\N	\N
20327	1143	36	2	\N	\N	\N	\N
20328	1143	37	3	\N	\N	\N	\N
20329	1143	38	3	\N	\N	\N	\N
20330	1143	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.869	MODELO
20331	1143	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.732	MODELO
20332	1142	18	4	\N	\N	\N	\N
20333	1142	19	4	\N	\N	\N	\N
20334	1142	20	3	\N	\N	\N	\N
20335	1142	21	4	\N	\N	\N	\N
20336	1142	22	3	\N	\N	\N	\N
20337	1142	23	1	\N	\N	\N	\N
20338	1142	24	3	\N	\N	\N	\N
20339	1142	27	3	\N	\N	\N	\N
20340	1142	28	4	\N	\N	\N	\N
20341	1142	29	4	\N	\N	\N	\N
20342	1142	30	4	\N	\N	\N	\N
20343	1142	31	3	\N	\N	\N	\N
20344	1142	32	3	\N	\N	\N	\N
20345	1142	33	3	\N	\N	\N	\N
20346	1142	34	4	\N	\N	\N	\N
20347	1142	35	1	\N	\N	\N	\N
20348	1142	36	2	\N	\N	\N	\N
20349	1142	37	3	\N	\N	\N	\N
20350	1142	38	1	\N	\N	\N	\N
20351	1142	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.945	MODELO
20352	1142	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.974	MODELO
20353	1141	18	4	\N	\N	\N	\N
20354	1141	19	4	\N	\N	\N	\N
20355	1141	20	4	\N	\N	\N	\N
20356	1141	21	3	\N	\N	\N	\N
20357	1141	22	4	\N	\N	\N	\N
20358	1141	23	3	\N	\N	\N	\N
20359	1141	24	3	\N	\N	\N	\N
20360	1141	27	3	\N	\N	\N	\N
20361	1141	28	4	\N	\N	\N	\N
20362	1141	29	3	\N	\N	\N	\N
20363	1141	30	4	\N	\N	\N	\N
20364	1141	31	3	\N	\N	\N	\N
20365	1141	32	4	\N	\N	\N	\N
20366	1141	33	2	\N	\N	\N	\N
20367	1141	34	4	\N	\N	\N	\N
20368	1141	35	2	\N	\N	\N	\N
20369	1141	36	3	\N	\N	\N	\N
20370	1141	37	3	\N	\N	\N	\N
20371	1141	38	4	\N	\N	\N	\N
20372	1141	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.959	MODELO
20373	1141	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.678	MODELO
20374	1140	18	3	\N	\N	\N	\N
20375	1140	19	4	\N	\N	\N	\N
20376	1140	20	1	\N	\N	\N	\N
20377	1140	21	3	\N	\N	\N	\N
20378	1140	22	3	\N	\N	\N	\N
20379	1140	23	4	\N	\N	\N	\N
20380	1140	24	4	\N	\N	\N	\N
20381	1140	27	3	\N	\N	\N	\N
20382	1140	28	3	\N	\N	\N	\N
20383	1140	29	4	\N	\N	\N	\N
20384	1140	30	4	\N	\N	\N	\N
20385	1140	31	3	\N	\N	\N	\N
20386	1140	32	3	\N	\N	\N	\N
20387	1140	33	4	\N	\N	\N	\N
20388	1140	34	3	\N	\N	\N	\N
20389	1140	35	3	\N	\N	\N	\N
20390	1140	36	3	\N	\N	\N	\N
20391	1140	37	4	\N	\N	\N	\N
20392	1140	38	2	\N	\N	\N	\N
20393	1140	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.851	MODELO
20394	1140	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.731	MODELO
20395	1139	18	3	\N	\N	\N	\N
20396	1139	19	3	\N	\N	\N	\N
20397	1139	20	4	\N	\N	\N	\N
20398	1139	21	4	\N	\N	\N	\N
20399	1139	22	4	\N	\N	\N	\N
20400	1139	23	2	\N	\N	\N	\N
20401	1139	24	4	\N	\N	\N	\N
20402	1139	27	4	\N	\N	\N	\N
20403	1139	28	3	\N	\N	\N	\N
20404	1139	29	4	\N	\N	\N	\N
20405	1139	30	2	\N	\N	\N	\N
20406	1139	31	2	\N	\N	\N	\N
20407	1139	32	4	\N	\N	\N	\N
20408	1139	33	3	\N	\N	\N	\N
20409	1139	34	3	\N	\N	\N	\N
20410	1139	35	3	\N	\N	\N	\N
20411	1139	36	4	\N	\N	\N	\N
20412	1139	37	1	\N	\N	\N	\N
20413	1139	38	3	\N	\N	\N	\N
20414	1139	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.702	MODELO
20415	1139	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.56	MODELO
20416	1138	18	3	\N	\N	\N	\N
20417	1138	19	4	\N	\N	\N	\N
20418	1138	20	3	\N	\N	\N	\N
20419	1138	21	3	\N	\N	\N	\N
20420	1138	22	3	\N	\N	\N	\N
20421	1138	23	4	\N	\N	\N	\N
20422	1138	24	4	\N	\N	\N	\N
20423	1138	27	3	\N	\N	\N	\N
20424	1138	28	2	\N	\N	\N	\N
20425	1138	29	2	\N	\N	\N	\N
20426	1138	30	4	\N	\N	\N	\N
20427	1138	31	4	\N	\N	\N	\N
20428	1138	32	4	\N	\N	\N	\N
20429	1138	33	4	\N	\N	\N	\N
20430	1138	34	3	\N	\N	\N	\N
20431	1138	35	4	\N	\N	\N	\N
20432	1138	36	4	\N	\N	\N	\N
20433	1138	37	2	\N	\N	\N	\N
20434	1138	38	4	\N	\N	\N	\N
20435	1138	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.749	MODELO
20436	1138	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.857	MODELO
20437	1137	18	3	\N	\N	\N	\N
20438	1137	19	2	\N	\N	\N	\N
20439	1137	20	2	\N	\N	\N	\N
20440	1137	21	3	\N	\N	\N	\N
20441	1137	22	4	\N	\N	\N	\N
20442	1137	23	3	\N	\N	\N	\N
20443	1137	24	4	\N	\N	\N	\N
20444	1137	27	3	\N	\N	\N	\N
20445	1137	28	2	\N	\N	\N	\N
20446	1137	29	4	\N	\N	\N	\N
20447	1137	30	3	\N	\N	\N	\N
20448	1137	31	4	\N	\N	\N	\N
20449	1137	32	4	\N	\N	\N	\N
20450	1137	33	3	\N	\N	\N	\N
20451	1137	34	4	\N	\N	\N	\N
20452	1137	35	4	\N	\N	\N	\N
20453	1137	36	4	\N	\N	\N	\N
20454	1137	37	3	\N	\N	\N	\N
20455	1137	38	3	\N	\N	\N	\N
20456	1137	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.723	MODELO
20457	1137	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.797	MODELO
20458	1136	18	4	\N	\N	\N	\N
20459	1136	19	4	\N	\N	\N	\N
20460	1136	20	4	\N	\N	\N	\N
20461	1136	21	3	\N	\N	\N	\N
20462	1136	22	4	\N	\N	\N	\N
20463	1136	23	3	\N	\N	\N	\N
20464	1136	24	3	\N	\N	\N	\N
20465	1136	27	3	\N	\N	\N	\N
20466	1136	28	3	\N	\N	\N	\N
20467	1136	29	3	\N	\N	\N	\N
20468	1136	30	3	\N	\N	\N	\N
20469	1136	31	2	\N	\N	\N	\N
20470	1136	32	3	\N	\N	\N	\N
20471	1136	33	1	\N	\N	\N	\N
20472	1136	34	3	\N	\N	\N	\N
20473	1136	35	3	\N	\N	\N	\N
20474	1136	36	2	\N	\N	\N	\N
20475	1136	37	4	\N	\N	\N	\N
20476	1136	38	4	\N	\N	\N	\N
20477	1136	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.855	MODELO
20478	1136	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.761	MODELO
20479	1135	18	3	\N	\N	\N	\N
20480	1135	19	1	\N	\N	\N	\N
20481	1135	20	2	\N	\N	\N	\N
20482	1135	21	4	\N	\N	\N	\N
20483	1135	22	3	\N	\N	\N	\N
20484	1135	23	4	\N	\N	\N	\N
20485	1135	24	4	\N	\N	\N	\N
20486	1135	27	4	\N	\N	\N	\N
20487	1135	28	1	\N	\N	\N	\N
20488	1135	29	4	\N	\N	\N	\N
20489	1135	30	3	\N	\N	\N	\N
20490	1135	31	2	\N	\N	\N	\N
20491	1135	32	4	\N	\N	\N	\N
20492	1135	33	3	\N	\N	\N	\N
20493	1135	34	3	\N	\N	\N	\N
20494	1135	35	4	\N	\N	\N	\N
20495	1135	36	2	\N	\N	\N	\N
20496	1135	37	3	\N	\N	\N	\N
20497	1135	38	3	\N	\N	\N	\N
20498	1135	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.896	MODELO
20499	1135	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.787	MODELO
20500	1134	18	3	\N	\N	\N	\N
20501	1134	19	3	\N	\N	\N	\N
20502	1134	20	3	\N	\N	\N	\N
20503	1134	21	3	\N	\N	\N	\N
20504	1134	22	1	\N	\N	\N	\N
20505	1134	23	2	\N	\N	\N	\N
20506	1134	24	3	\N	\N	\N	\N
20507	1134	27	4	\N	\N	\N	\N
20508	1134	28	3	\N	\N	\N	\N
20509	1134	29	3	\N	\N	\N	\N
20510	1134	30	4	\N	\N	\N	\N
20511	1134	31	3	\N	\N	\N	\N
20512	1134	32	4	\N	\N	\N	\N
20513	1134	33	4	\N	\N	\N	\N
20514	1134	34	4	\N	\N	\N	\N
20515	1134	35	1	\N	\N	\N	\N
20516	1134	36	4	\N	\N	\N	\N
20517	1134	37	4	\N	\N	\N	\N
20518	1134	38	3	\N	\N	\N	\N
20519	1134	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.902	MODELO
20520	1134	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.672	MODELO
20521	1133	18	4	\N	\N	\N	\N
20522	1133	19	4	\N	\N	\N	\N
20523	1133	20	3	\N	\N	\N	\N
20524	1133	21	3	\N	\N	\N	\N
20525	1133	22	4	\N	\N	\N	\N
20526	1133	23	2	\N	\N	\N	\N
20527	1133	24	1	\N	\N	\N	\N
20528	1133	27	4	\N	\N	\N	\N
20529	1133	28	3	\N	\N	\N	\N
20530	1133	29	4	\N	\N	\N	\N
20531	1133	30	2	\N	\N	\N	\N
20532	1133	31	4	\N	\N	\N	\N
20533	1133	32	3	\N	\N	\N	\N
20534	1133	33	3	\N	\N	\N	\N
20535	1133	34	4	\N	\N	\N	\N
20536	1133	35	3	\N	\N	\N	\N
20537	1133	36	4	\N	\N	\N	\N
20538	1133	37	4	\N	\N	\N	\N
20539	1133	38	3	\N	\N	\N	\N
20540	1133	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.875	MODELO
20541	1133	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.901	MODELO
20542	1132	18	3	\N	\N	\N	\N
20543	1132	19	3	\N	\N	\N	\N
20544	1132	20	4	\N	\N	\N	\N
20545	1132	21	3	\N	\N	\N	\N
20546	1132	22	1	\N	\N	\N	\N
20547	1132	23	3	\N	\N	\N	\N
20548	1132	24	3	\N	\N	\N	\N
20549	1132	27	3	\N	\N	\N	\N
20550	1132	28	3	\N	\N	\N	\N
20551	1132	29	2	\N	\N	\N	\N
20552	1132	30	4	\N	\N	\N	\N
20553	1132	31	4	\N	\N	\N	\N
20554	1132	32	3	\N	\N	\N	\N
20555	1132	33	3	\N	\N	\N	\N
20556	1132	34	3	\N	\N	\N	\N
20557	1132	35	3	\N	\N	\N	\N
20558	1132	36	3	\N	\N	\N	\N
20559	1132	37	3	\N	\N	\N	\N
20560	1132	38	3	\N	\N	\N	\N
20561	1132	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.843	MODELO
20562	1132	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.919	MODELO
20563	1131	18	3	\N	\N	\N	\N
20564	1131	19	2	\N	\N	\N	\N
20565	1131	20	2	\N	\N	\N	\N
20566	1131	21	4	\N	\N	\N	\N
20567	1131	22	3	\N	\N	\N	\N
20568	1131	23	3	\N	\N	\N	\N
20569	1131	24	3	\N	\N	\N	\N
20570	1131	27	4	\N	\N	\N	\N
20571	1131	28	3	\N	\N	\N	\N
20572	1131	29	2	\N	\N	\N	\N
20573	1131	30	4	\N	\N	\N	\N
20574	1131	31	4	\N	\N	\N	\N
20575	1131	32	4	\N	\N	\N	\N
20576	1131	33	4	\N	\N	\N	\N
20577	1131	34	2	\N	\N	\N	\N
20578	1131	35	4	\N	\N	\N	\N
20579	1131	36	4	\N	\N	\N	\N
20580	1131	37	4	\N	\N	\N	\N
20581	1131	38	2	\N	\N	\N	\N
20582	1131	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.837	MODELO
20583	1131	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.782	MODELO
20584	1130	18	4	\N	\N	\N	\N
20585	1130	19	3	\N	\N	\N	\N
20586	1130	20	3	\N	\N	\N	\N
20587	1130	21	4	\N	\N	\N	\N
20588	1130	22	2	\N	\N	\N	\N
20589	1130	23	4	\N	\N	\N	\N
20590	1130	24	3	\N	\N	\N	\N
20591	1130	27	3	\N	\N	\N	\N
20592	1130	28	3	\N	\N	\N	\N
20593	1130	29	4	\N	\N	\N	\N
20594	1130	30	3	\N	\N	\N	\N
20595	1130	31	4	\N	\N	\N	\N
20596	1130	32	4	\N	\N	\N	\N
20597	1130	33	4	\N	\N	\N	\N
20598	1130	34	4	\N	\N	\N	\N
20599	1130	35	4	\N	\N	\N	\N
20600	1130	36	3	\N	\N	\N	\N
20601	1130	37	3	\N	\N	\N	\N
20602	1130	38	4	\N	\N	\N	\N
20603	1130	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.768	MODELO
20604	1130	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.793	MODELO
20605	1129	18	4	\N	\N	\N	\N
20606	1129	19	4	\N	\N	\N	\N
20607	1129	20	3	\N	\N	\N	\N
20608	1129	21	4	\N	\N	\N	\N
20609	1129	22	3	\N	\N	\N	\N
20610	1129	23	2	\N	\N	\N	\N
20611	1129	24	1	\N	\N	\N	\N
20612	1129	27	3	\N	\N	\N	\N
20613	1129	28	1	\N	\N	\N	\N
20614	1129	29	4	\N	\N	\N	\N
20615	1129	30	3	\N	\N	\N	\N
20616	1129	31	3	\N	\N	\N	\N
20617	1129	32	4	\N	\N	\N	\N
20618	1129	33	3	\N	\N	\N	\N
20619	1129	34	4	\N	\N	\N	\N
20620	1129	35	4	\N	\N	\N	\N
20621	1129	36	3	\N	\N	\N	\N
20622	1129	37	4	\N	\N	\N	\N
20623	1129	38	3	\N	\N	\N	\N
20624	1129	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.928	MODELO
20625	1129	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.785	MODELO
20626	1128	18	3	\N	\N	\N	\N
20627	1128	19	2	\N	\N	\N	\N
20628	1128	20	3	\N	\N	\N	\N
20629	1128	21	4	\N	\N	\N	\N
20630	1128	22	4	\N	\N	\N	\N
20631	1128	23	4	\N	\N	\N	\N
20632	1128	24	1	\N	\N	\N	\N
20633	1128	27	4	\N	\N	\N	\N
20634	1128	28	2	\N	\N	\N	\N
20635	1128	29	3	\N	\N	\N	\N
20636	1128	30	4	\N	\N	\N	\N
20637	1128	31	3	\N	\N	\N	\N
20638	1128	32	2	\N	\N	\N	\N
20639	1128	33	3	\N	\N	\N	\N
20640	1128	34	3	\N	\N	\N	\N
20641	1128	35	2	\N	\N	\N	\N
20642	1128	36	3	\N	\N	\N	\N
20643	1128	37	3	\N	\N	\N	\N
20644	1128	38	3	\N	\N	\N	\N
20645	1128	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.837	MODELO
20646	1128	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.71	MODELO
20647	1127	18	2	\N	\N	\N	\N
20648	1127	19	4	\N	\N	\N	\N
20649	1127	20	4	\N	\N	\N	\N
20650	1127	21	3	\N	\N	\N	\N
20651	1127	22	3	\N	\N	\N	\N
20652	1127	23	3	\N	\N	\N	\N
20653	1127	24	3	\N	\N	\N	\N
20654	1127	27	3	\N	\N	\N	\N
20655	1127	28	3	\N	\N	\N	\N
20656	1127	29	3	\N	\N	\N	\N
20657	1127	30	4	\N	\N	\N	\N
20658	1127	31	3	\N	\N	\N	\N
20659	1127	32	3	\N	\N	\N	\N
20660	1127	33	4	\N	\N	\N	\N
20661	1127	34	4	\N	\N	\N	\N
20662	1127	35	3	\N	\N	\N	\N
20663	1127	36	3	\N	\N	\N	\N
20664	1127	37	4	\N	\N	\N	\N
20665	1127	38	3	\N	\N	\N	\N
20666	1127	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.753	MODELO
20667	1127	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.905	MODELO
20668	1126	18	4	\N	\N	\N	\N
20669	1126	19	1	\N	\N	\N	\N
20670	1126	20	4	\N	\N	\N	\N
20671	1126	21	3	\N	\N	\N	\N
20672	1126	22	3	\N	\N	\N	\N
20673	1126	23	3	\N	\N	\N	\N
20674	1126	24	3	\N	\N	\N	\N
20675	1126	27	4	\N	\N	\N	\N
20676	1126	28	4	\N	\N	\N	\N
20677	1126	29	3	\N	\N	\N	\N
20678	1126	30	4	\N	\N	\N	\N
20679	1126	31	3	\N	\N	\N	\N
20680	1126	32	4	\N	\N	\N	\N
20681	1126	33	2	\N	\N	\N	\N
20682	1126	34	4	\N	\N	\N	\N
20683	1126	35	3	\N	\N	\N	\N
20684	1126	36	4	\N	\N	\N	\N
20685	1126	37	3	\N	\N	\N	\N
20686	1126	38	3	\N	\N	\N	\N
20687	1126	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.713	MODELO
20688	1126	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.778	MODELO
20689	851	18	4	\N	\N	\N	\N
20690	851	19	3	\N	\N	\N	\N
20691	851	20	4	\N	\N	\N	\N
20692	851	21	3	\N	\N	\N	\N
20693	851	22	3	\N	\N	\N	\N
20694	851	23	4	\N	\N	\N	\N
20695	851	24	3	\N	\N	\N	\N
20696	851	27	3	\N	\N	\N	\N
20697	851	28	4	\N	\N	\N	\N
20698	851	29	4	\N	\N	\N	\N
20699	851	30	4	\N	\N	\N	\N
20700	851	31	4	\N	\N	\N	\N
20701	851	32	4	\N	\N	\N	\N
20702	851	33	4	\N	\N	\N	\N
20703	851	34	4	\N	\N	\N	\N
20704	851	35	4	\N	\N	\N	\N
20705	851	36	3	\N	\N	\N	\N
20706	851	37	4	\N	\N	\N	\N
20707	851	38	4	\N	\N	\N	\N
20708	851	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.936	MODELO
20709	851	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.732	MODELO
20710	850	18	4	\N	\N	\N	\N
20711	850	19	4	\N	\N	\N	\N
20712	850	20	4	\N	\N	\N	\N
20713	850	21	4	\N	\N	\N	\N
20714	850	22	4	\N	\N	\N	\N
20715	850	23	3	\N	\N	\N	\N
20716	850	24	4	\N	\N	\N	\N
20717	850	27	4	\N	\N	\N	\N
20718	850	28	4	\N	\N	\N	\N
20719	850	29	4	\N	\N	\N	\N
20720	850	30	4	\N	\N	\N	\N
20721	850	31	4	\N	\N	\N	\N
20722	850	32	4	\N	\N	\N	\N
20723	850	33	4	\N	\N	\N	\N
20724	850	34	3	\N	\N	\N	\N
20725	850	35	4	\N	\N	\N	\N
20726	850	36	3	\N	\N	\N	\N
20727	850	37	4	\N	\N	\N	\N
20728	850	38	4	\N	\N	\N	\N
20729	850	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.636	MODELO
20730	850	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.555	MODELO
20731	849	18	4	\N	\N	\N	\N
20732	849	19	4	\N	\N	\N	\N
20733	849	20	4	\N	\N	\N	\N
20734	849	21	4	\N	\N	\N	\N
20735	849	22	4	\N	\N	\N	\N
20736	849	23	3	\N	\N	\N	\N
20737	849	24	4	\N	\N	\N	\N
20738	849	27	2	\N	\N	\N	\N
20739	849	28	4	\N	\N	\N	\N
20740	849	29	4	\N	\N	\N	\N
20741	849	30	4	\N	\N	\N	\N
20742	849	31	2	\N	\N	\N	\N
20743	849	32	4	\N	\N	\N	\N
20744	849	33	4	\N	\N	\N	\N
20745	849	34	2	\N	\N	\N	\N
20746	849	35	4	\N	\N	\N	\N
20747	849	36	4	\N	\N	\N	\N
20748	849	37	3	\N	\N	\N	\N
20749	849	38	2	\N	\N	\N	\N
20750	849	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.76	MODELO
20751	849	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.739	MODELO
20752	848	18	4	\N	\N	\N	\N
20753	848	19	4	\N	\N	\N	\N
20754	848	20	4	\N	\N	\N	\N
20755	848	21	4	\N	\N	\N	\N
20756	848	22	4	\N	\N	\N	\N
20757	848	23	4	\N	\N	\N	\N
20758	848	24	4	\N	\N	\N	\N
20759	848	27	4	\N	\N	\N	\N
20760	848	28	4	\N	\N	\N	\N
20761	848	29	3	\N	\N	\N	\N
20762	848	30	4	\N	\N	\N	\N
20763	848	31	3	\N	\N	\N	\N
20764	848	32	4	\N	\N	\N	\N
20765	848	33	3	\N	\N	\N	\N
20766	848	34	1	\N	\N	\N	\N
20767	848	35	4	\N	\N	\N	\N
20768	848	36	4	\N	\N	\N	\N
20769	848	37	4	\N	\N	\N	\N
20770	848	38	4	\N	\N	\N	\N
20771	848	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.938	MODELO
20772	848	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.577	MODELO
20773	847	18	4	\N	\N	\N	\N
20774	847	19	3	\N	\N	\N	\N
20775	847	20	4	\N	\N	\N	\N
20776	847	21	4	\N	\N	\N	\N
20777	847	22	4	\N	\N	\N	\N
20778	847	23	4	\N	\N	\N	\N
20779	847	24	4	\N	\N	\N	\N
20780	847	27	4	\N	\N	\N	\N
20781	847	28	3	\N	\N	\N	\N
20782	847	29	4	\N	\N	\N	\N
20783	847	30	4	\N	\N	\N	\N
20784	847	31	4	\N	\N	\N	\N
20785	847	32	4	\N	\N	\N	\N
20786	847	33	3	\N	\N	\N	\N
20787	847	34	4	\N	\N	\N	\N
20788	847	35	4	\N	\N	\N	\N
20789	847	36	4	\N	\N	\N	\N
20790	847	37	4	\N	\N	\N	\N
20791	847	38	4	\N	\N	\N	\N
20792	847	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.747	MODELO
20793	847	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.61	MODELO
20794	846	18	4	\N	\N	\N	\N
20795	846	19	4	\N	\N	\N	\N
20796	846	20	2	\N	\N	\N	\N
20797	846	21	1	\N	\N	\N	\N
20798	846	22	4	\N	\N	\N	\N
20799	846	23	3	\N	\N	\N	\N
20800	846	24	1	\N	\N	\N	\N
20801	846	27	4	\N	\N	\N	\N
20802	846	28	2	\N	\N	\N	\N
20803	846	29	2	\N	\N	\N	\N
20804	846	30	4	\N	\N	\N	\N
20805	846	31	3	\N	\N	\N	\N
20806	846	32	4	\N	\N	\N	\N
20807	846	33	2	\N	\N	\N	\N
20808	846	34	4	\N	\N	\N	\N
20809	846	35	4	\N	\N	\N	\N
20810	846	36	4	\N	\N	\N	\N
20811	846	37	4	\N	\N	\N	\N
20812	846	38	4	\N	\N	\N	\N
20813	846	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.752	MODELO
20814	846	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.745	MODELO
20815	845	18	4	\N	\N	\N	\N
20816	845	19	2	\N	\N	\N	\N
20817	845	20	4	\N	\N	\N	\N
20818	845	21	4	\N	\N	\N	\N
20819	845	22	2	\N	\N	\N	\N
20820	845	23	4	\N	\N	\N	\N
20821	845	24	3	\N	\N	\N	\N
20822	845	27	4	\N	\N	\N	\N
20823	845	28	3	\N	\N	\N	\N
20824	845	29	4	\N	\N	\N	\N
20825	845	30	4	\N	\N	\N	\N
20826	845	31	4	\N	\N	\N	\N
20827	845	32	3	\N	\N	\N	\N
20828	845	33	4	\N	\N	\N	\N
20829	845	34	3	\N	\N	\N	\N
20830	845	35	4	\N	\N	\N	\N
20831	845	36	4	\N	\N	\N	\N
20832	845	37	4	\N	\N	\N	\N
20833	845	38	4	\N	\N	\N	\N
20834	845	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.806	MODELO
20835	845	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.87	MODELO
20836	844	18	4	\N	\N	\N	\N
20837	844	19	3	\N	\N	\N	\N
20838	844	20	4	\N	\N	\N	\N
20839	844	21	4	\N	\N	\N	\N
20840	844	22	4	\N	\N	\N	\N
20841	844	23	4	\N	\N	\N	\N
20842	844	24	1	\N	\N	\N	\N
20843	844	27	2	\N	\N	\N	\N
20844	844	28	4	\N	\N	\N	\N
20845	844	29	4	\N	\N	\N	\N
20846	844	30	4	\N	\N	\N	\N
20847	844	31	4	\N	\N	\N	\N
20848	844	32	4	\N	\N	\N	\N
20849	844	33	4	\N	\N	\N	\N
20850	844	34	4	\N	\N	\N	\N
20851	844	35	1	\N	\N	\N	\N
20852	844	36	3	\N	\N	\N	\N
20853	844	37	4	\N	\N	\N	\N
20854	844	38	3	\N	\N	\N	\N
20855	844	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.722	MODELO
20856	844	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.743	MODELO
20857	843	18	4	\N	\N	\N	\N
20858	843	19	2	\N	\N	\N	\N
20859	843	20	4	\N	\N	\N	\N
20860	843	21	4	\N	\N	\N	\N
20861	843	22	3	\N	\N	\N	\N
20862	843	23	4	\N	\N	\N	\N
20863	843	24	4	\N	\N	\N	\N
20864	843	27	4	\N	\N	\N	\N
20865	843	28	4	\N	\N	\N	\N
20866	843	29	4	\N	\N	\N	\N
20867	843	30	4	\N	\N	\N	\N
20868	843	31	3	\N	\N	\N	\N
20869	843	32	4	\N	\N	\N	\N
20870	843	33	4	\N	\N	\N	\N
20871	843	34	4	\N	\N	\N	\N
20872	843	35	4	\N	\N	\N	\N
20873	843	36	3	\N	\N	\N	\N
20874	843	37	3	\N	\N	\N	\N
20875	843	38	4	\N	\N	\N	\N
20876	843	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.844	MODELO
20877	843	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.65	MODELO
20878	842	18	4	\N	\N	\N	\N
20879	842	19	4	\N	\N	\N	\N
20880	842	20	3	\N	\N	\N	\N
20881	842	21	4	\N	\N	\N	\N
20882	842	22	4	\N	\N	\N	\N
20883	842	23	4	\N	\N	\N	\N
20884	842	24	4	\N	\N	\N	\N
20885	842	27	4	\N	\N	\N	\N
20886	842	28	4	\N	\N	\N	\N
20887	842	29	3	\N	\N	\N	\N
20888	842	30	3	\N	\N	\N	\N
20889	842	31	4	\N	\N	\N	\N
20890	842	32	4	\N	\N	\N	\N
20891	842	33	2	\N	\N	\N	\N
20892	842	34	4	\N	\N	\N	\N
20893	842	35	4	\N	\N	\N	\N
20894	842	36	3	\N	\N	\N	\N
20895	842	37	4	\N	\N	\N	\N
20896	842	38	4	\N	\N	\N	\N
20897	842	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.843	MODELO
20898	842	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.832	MODELO
20899	841	18	4	\N	\N	\N	\N
20900	841	19	4	\N	\N	\N	\N
20901	841	20	4	\N	\N	\N	\N
20902	841	21	4	\N	\N	\N	\N
20903	841	22	4	\N	\N	\N	\N
20904	841	23	4	\N	\N	\N	\N
20905	841	24	4	\N	\N	\N	\N
20906	841	27	3	\N	\N	\N	\N
20907	841	28	3	\N	\N	\N	\N
20908	841	29	4	\N	\N	\N	\N
20909	841	30	3	\N	\N	\N	\N
20910	841	31	4	\N	\N	\N	\N
20911	841	32	4	\N	\N	\N	\N
20912	841	33	1	\N	\N	\N	\N
20913	841	34	4	\N	\N	\N	\N
20914	841	35	4	\N	\N	\N	\N
20915	841	36	3	\N	\N	\N	\N
20916	841	37	4	\N	\N	\N	\N
20917	841	38	4	\N	\N	\N	\N
20918	841	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.711	MODELO
20919	841	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.945	MODELO
20920	840	18	4	\N	\N	\N	\N
20921	840	19	4	\N	\N	\N	\N
20922	840	20	3	\N	\N	\N	\N
20923	840	21	3	\N	\N	\N	\N
20924	840	22	4	\N	\N	\N	\N
20925	840	23	3	\N	\N	\N	\N
20926	840	24	4	\N	\N	\N	\N
20927	840	27	4	\N	\N	\N	\N
20928	840	28	3	\N	\N	\N	\N
20929	840	29	4	\N	\N	\N	\N
20930	840	30	3	\N	\N	\N	\N
20931	840	31	2	\N	\N	\N	\N
20932	840	32	4	\N	\N	\N	\N
20933	840	33	4	\N	\N	\N	\N
20934	840	34	2	\N	\N	\N	\N
20935	840	35	4	\N	\N	\N	\N
20936	840	36	3	\N	\N	\N	\N
20937	840	37	4	\N	\N	\N	\N
20938	840	38	4	\N	\N	\N	\N
20939	840	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.735	MODELO
20940	840	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.74	MODELO
20941	839	18	2	\N	\N	\N	\N
20942	839	19	4	\N	\N	\N	\N
20943	839	20	4	\N	\N	\N	\N
20944	839	21	4	\N	\N	\N	\N
20945	839	22	1	\N	\N	\N	\N
20946	839	23	4	\N	\N	\N	\N
20947	839	24	4	\N	\N	\N	\N
20948	839	27	4	\N	\N	\N	\N
20949	839	28	3	\N	\N	\N	\N
20950	839	29	1	\N	\N	\N	\N
20951	839	30	4	\N	\N	\N	\N
20952	839	31	4	\N	\N	\N	\N
20953	839	32	3	\N	\N	\N	\N
20954	839	33	4	\N	\N	\N	\N
20955	839	34	4	\N	\N	\N	\N
20956	839	35	4	\N	\N	\N	\N
20957	839	36	2	\N	\N	\N	\N
20958	839	37	4	\N	\N	\N	\N
20959	839	38	4	\N	\N	\N	\N
20960	839	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.788	MODELO
20961	839	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.596	MODELO
20962	838	18	2	\N	\N	\N	\N
20963	838	19	4	\N	\N	\N	\N
20964	838	20	4	\N	\N	\N	\N
20965	838	21	3	\N	\N	\N	\N
20966	838	22	4	\N	\N	\N	\N
20967	838	23	4	\N	\N	\N	\N
20968	838	24	3	\N	\N	\N	\N
20969	838	27	4	\N	\N	\N	\N
20970	838	28	4	\N	\N	\N	\N
20971	838	29	3	\N	\N	\N	\N
20972	838	30	4	\N	\N	\N	\N
20973	838	31	4	\N	\N	\N	\N
20974	838	32	4	\N	\N	\N	\N
20975	838	33	4	\N	\N	\N	\N
20976	838	34	4	\N	\N	\N	\N
20977	838	35	1	\N	\N	\N	\N
20978	838	36	4	\N	\N	\N	\N
20979	838	37	4	\N	\N	\N	\N
20980	838	38	1	\N	\N	\N	\N
20981	838	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.932	MODELO
20982	838	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.5	MODELO
20983	837	18	1	\N	\N	\N	\N
20984	837	19	4	\N	\N	\N	\N
20985	837	20	4	\N	\N	\N	\N
20986	837	21	2	\N	\N	\N	\N
20987	837	22	3	\N	\N	\N	\N
20988	837	23	3	\N	\N	\N	\N
20989	837	24	3	\N	\N	\N	\N
20990	837	27	4	\N	\N	\N	\N
20991	837	28	4	\N	\N	\N	\N
20992	837	29	4	\N	\N	\N	\N
20993	837	30	4	\N	\N	\N	\N
20994	837	31	4	\N	\N	\N	\N
20995	837	32	4	\N	\N	\N	\N
20996	837	33	4	\N	\N	\N	\N
20997	837	34	4	\N	\N	\N	\N
20998	837	35	4	\N	\N	\N	\N
20999	837	36	4	\N	\N	\N	\N
21000	837	37	4	\N	\N	\N	\N
21001	837	38	2	\N	\N	\N	\N
21002	837	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.555	MODELO
21003	837	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.522	MODELO
21004	836	18	3	\N	\N	\N	\N
21005	836	19	3	\N	\N	\N	\N
21006	836	20	4	\N	\N	\N	\N
21007	836	21	4	\N	\N	\N	\N
21008	836	22	4	\N	\N	\N	\N
21009	836	23	4	\N	\N	\N	\N
21010	836	24	3	\N	\N	\N	\N
21011	836	27	4	\N	\N	\N	\N
21012	836	28	4	\N	\N	\N	\N
21013	836	29	4	\N	\N	\N	\N
21014	836	30	3	\N	\N	\N	\N
21015	836	31	4	\N	\N	\N	\N
21016	836	32	4	\N	\N	\N	\N
21017	836	33	4	\N	\N	\N	\N
21018	836	34	3	\N	\N	\N	\N
21019	836	35	1	\N	\N	\N	\N
21020	836	36	4	\N	\N	\N	\N
21021	836	37	4	\N	\N	\N	\N
21022	836	38	4	\N	\N	\N	\N
21023	836	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.941	MODELO
21024	836	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.521	MODELO
21025	835	18	4	\N	\N	\N	\N
21026	835	19	3	\N	\N	\N	\N
21027	835	20	3	\N	\N	\N	\N
21028	835	21	4	\N	\N	\N	\N
21029	835	22	4	\N	\N	\N	\N
21030	835	23	4	\N	\N	\N	\N
21031	835	24	3	\N	\N	\N	\N
21032	835	27	4	\N	\N	\N	\N
21033	835	28	4	\N	\N	\N	\N
21034	835	29	1	\N	\N	\N	\N
21035	835	30	4	\N	\N	\N	\N
21036	835	31	4	\N	\N	\N	\N
21037	835	32	4	\N	\N	\N	\N
21038	835	33	3	\N	\N	\N	\N
21039	835	34	4	\N	\N	\N	\N
21040	835	35	3	\N	\N	\N	\N
21041	835	36	4	\N	\N	\N	\N
21042	835	37	1	\N	\N	\N	\N
21043	835	38	4	\N	\N	\N	\N
21044	835	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.67	MODELO
21045	835	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.768	MODELO
21046	834	18	2	\N	\N	\N	\N
21047	834	19	3	\N	\N	\N	\N
21048	834	20	4	\N	\N	\N	\N
21049	834	21	4	\N	\N	\N	\N
21050	834	22	3	\N	\N	\N	\N
21051	834	23	3	\N	\N	\N	\N
21052	834	24	2	\N	\N	\N	\N
21053	834	27	4	\N	\N	\N	\N
21054	834	28	3	\N	\N	\N	\N
21055	834	29	4	\N	\N	\N	\N
21056	834	30	2	\N	\N	\N	\N
21057	834	31	3	\N	\N	\N	\N
21058	834	32	4	\N	\N	\N	\N
21059	834	33	4	\N	\N	\N	\N
21060	834	34	4	\N	\N	\N	\N
21061	834	35	4	\N	\N	\N	\N
21062	834	36	3	\N	\N	\N	\N
21063	834	37	3	\N	\N	\N	\N
21064	834	38	4	\N	\N	\N	\N
21065	834	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.969	MODELO
21066	834	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.976	MODELO
21067	833	18	4	\N	\N	\N	\N
21068	833	19	3	\N	\N	\N	\N
21069	833	20	4	\N	\N	\N	\N
21070	833	21	4	\N	\N	\N	\N
21071	833	22	3	\N	\N	\N	\N
21072	833	23	3	\N	\N	\N	\N
21073	833	24	4	\N	\N	\N	\N
21074	833	27	4	\N	\N	\N	\N
21075	833	28	4	\N	\N	\N	\N
21076	833	29	4	\N	\N	\N	\N
21077	833	30	4	\N	\N	\N	\N
21078	833	31	4	\N	\N	\N	\N
21079	833	32	4	\N	\N	\N	\N
21080	833	33	3	\N	\N	\N	\N
21081	833	34	1	\N	\N	\N	\N
21082	833	35	4	\N	\N	\N	\N
21083	833	36	4	\N	\N	\N	\N
21084	833	37	4	\N	\N	\N	\N
21085	833	38	4	\N	\N	\N	\N
21086	833	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.514	MODELO
21087	833	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.823	MODELO
21088	832	18	4	\N	\N	\N	\N
21089	832	19	4	\N	\N	\N	\N
21090	832	20	3	\N	\N	\N	\N
21091	832	21	4	\N	\N	\N	\N
21092	832	22	4	\N	\N	\N	\N
21093	832	23	4	\N	\N	\N	\N
21094	832	24	4	\N	\N	\N	\N
21095	832	27	2	\N	\N	\N	\N
21096	832	28	2	\N	\N	\N	\N
21097	832	29	4	\N	\N	\N	\N
21098	832	30	4	\N	\N	\N	\N
21099	832	31	4	\N	\N	\N	\N
21100	832	32	4	\N	\N	\N	\N
21101	832	33	1	\N	\N	\N	\N
21102	832	34	4	\N	\N	\N	\N
21103	832	35	4	\N	\N	\N	\N
21104	832	36	4	\N	\N	\N	\N
21105	832	37	1	\N	\N	\N	\N
21106	832	38	2	\N	\N	\N	\N
21107	832	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.926	MODELO
21108	832	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.502	MODELO
21109	831	18	3	\N	\N	\N	\N
21110	831	19	4	\N	\N	\N	\N
21111	831	20	4	\N	\N	\N	\N
21112	831	21	4	\N	\N	\N	\N
21113	831	22	4	\N	\N	\N	\N
21114	831	23	4	\N	\N	\N	\N
21115	831	24	4	\N	\N	\N	\N
21116	831	27	4	\N	\N	\N	\N
21117	831	28	4	\N	\N	\N	\N
21118	831	29	4	\N	\N	\N	\N
21119	831	30	3	\N	\N	\N	\N
21120	831	31	4	\N	\N	\N	\N
21121	831	32	2	\N	\N	\N	\N
21122	831	33	4	\N	\N	\N	\N
21123	831	34	4	\N	\N	\N	\N
21124	831	35	4	\N	\N	\N	\N
21125	831	36	4	\N	\N	\N	\N
21126	831	37	1	\N	\N	\N	\N
21127	831	38	2	\N	\N	\N	\N
21128	831	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.829	MODELO
21129	831	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.883	MODELO
21130	830	18	4	\N	\N	\N	\N
21131	830	19	4	\N	\N	\N	\N
21132	830	20	4	\N	\N	\N	\N
21133	830	21	3	\N	\N	\N	\N
21134	830	22	4	\N	\N	\N	\N
21135	830	23	4	\N	\N	\N	\N
21136	830	24	3	\N	\N	\N	\N
21137	830	27	4	\N	\N	\N	\N
21138	830	28	4	\N	\N	\N	\N
21139	830	29	4	\N	\N	\N	\N
21140	830	30	4	\N	\N	\N	\N
21141	830	31	4	\N	\N	\N	\N
21142	830	32	4	\N	\N	\N	\N
21143	830	33	4	\N	\N	\N	\N
21144	830	34	4	\N	\N	\N	\N
21145	830	35	4	\N	\N	\N	\N
21146	830	36	4	\N	\N	\N	\N
21147	830	37	2	\N	\N	\N	\N
21148	830	38	4	\N	\N	\N	\N
21149	830	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.887	MODELO
21150	830	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.677	MODELO
21151	829	18	4	\N	\N	\N	\N
21152	829	19	3	\N	\N	\N	\N
21153	829	20	4	\N	\N	\N	\N
21154	829	21	4	\N	\N	\N	\N
21155	829	22	4	\N	\N	\N	\N
21156	829	23	4	\N	\N	\N	\N
21157	829	24	4	\N	\N	\N	\N
21158	829	27	4	\N	\N	\N	\N
21159	829	28	2	\N	\N	\N	\N
21160	829	29	3	\N	\N	\N	\N
21161	829	30	4	\N	\N	\N	\N
21162	829	31	3	\N	\N	\N	\N
21163	829	32	3	\N	\N	\N	\N
21164	829	33	2	\N	\N	\N	\N
21165	829	34	4	\N	\N	\N	\N
21166	829	35	3	\N	\N	\N	\N
21167	829	36	4	\N	\N	\N	\N
21168	829	37	3	\N	\N	\N	\N
21169	829	38	1	\N	\N	\N	\N
21170	829	25	\N	Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.	NEUTRO	0.511	MODELO
21171	829	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.767	MODELO
21172	828	18	3	\N	\N	\N	\N
21173	828	19	4	\N	\N	\N	\N
21174	828	20	4	\N	\N	\N	\N
21175	828	21	4	\N	\N	\N	\N
21176	828	22	4	\N	\N	\N	\N
21177	828	23	3	\N	\N	\N	\N
21178	828	24	2	\N	\N	\N	\N
21179	828	27	4	\N	\N	\N	\N
21180	828	28	1	\N	\N	\N	\N
21181	828	29	4	\N	\N	\N	\N
21182	828	30	1	\N	\N	\N	\N
21183	828	31	4	\N	\N	\N	\N
21184	828	32	4	\N	\N	\N	\N
21185	828	33	4	\N	\N	\N	\N
21186	828	34	4	\N	\N	\N	\N
21187	828	35	3	\N	\N	\N	\N
21188	828	36	2	\N	\N	\N	\N
21189	828	37	3	\N	\N	\N	\N
21190	828	38	4	\N	\N	\N	\N
21191	828	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.735	MODELO
21192	828	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.706	MODELO
21193	827	18	1	\N	\N	\N	\N
21194	827	19	4	\N	\N	\N	\N
21195	827	20	4	\N	\N	\N	\N
21196	827	21	4	\N	\N	\N	\N
21197	827	22	4	\N	\N	\N	\N
21198	827	23	4	\N	\N	\N	\N
21199	827	24	4	\N	\N	\N	\N
21200	827	27	4	\N	\N	\N	\N
21201	827	28	4	\N	\N	\N	\N
21202	827	29	2	\N	\N	\N	\N
21203	827	30	4	\N	\N	\N	\N
21204	827	31	2	\N	\N	\N	\N
21205	827	32	4	\N	\N	\N	\N
21206	827	33	2	\N	\N	\N	\N
21207	827	34	4	\N	\N	\N	\N
21208	827	35	4	\N	\N	\N	\N
21209	827	36	3	\N	\N	\N	\N
21210	827	37	4	\N	\N	\N	\N
21211	827	38	4	\N	\N	\N	\N
21212	827	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.71	MODELO
21213	827	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.557	MODELO
21214	826	18	4	\N	\N	\N	\N
21215	826	19	4	\N	\N	\N	\N
21216	826	20	4	\N	\N	\N	\N
21217	826	21	4	\N	\N	\N	\N
21218	826	22	4	\N	\N	\N	\N
21219	826	23	4	\N	\N	\N	\N
21220	826	24	4	\N	\N	\N	\N
21221	826	27	4	\N	\N	\N	\N
21222	826	28	4	\N	\N	\N	\N
21223	826	29	4	\N	\N	\N	\N
21224	826	30	3	\N	\N	\N	\N
21225	826	31	4	\N	\N	\N	\N
21226	826	32	4	\N	\N	\N	\N
21227	826	33	4	\N	\N	\N	\N
21228	826	34	4	\N	\N	\N	\N
21229	826	35	4	\N	\N	\N	\N
21230	826	36	4	\N	\N	\N	\N
21231	826	37	3	\N	\N	\N	\N
21232	826	38	4	\N	\N	\N	\N
21233	826	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.889	MODELO
21234	826	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.579	MODELO
21235	825	18	4	\N	\N	\N	\N
21236	825	19	3	\N	\N	\N	\N
21237	825	20	4	\N	\N	\N	\N
21238	825	21	3	\N	\N	\N	\N
21239	825	22	4	\N	\N	\N	\N
21240	825	23	4	\N	\N	\N	\N
21241	825	24	4	\N	\N	\N	\N
21242	825	27	4	\N	\N	\N	\N
21243	825	28	2	\N	\N	\N	\N
21244	825	29	1	\N	\N	\N	\N
21245	825	30	3	\N	\N	\N	\N
21246	825	31	2	\N	\N	\N	\N
21247	825	32	4	\N	\N	\N	\N
21248	825	33	4	\N	\N	\N	\N
21249	825	34	4	\N	\N	\N	\N
21250	825	35	3	\N	\N	\N	\N
21251	825	36	4	\N	\N	\N	\N
21252	825	37	3	\N	\N	\N	\N
21253	825	38	3	\N	\N	\N	\N
21254	825	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.741	MODELO
21255	825	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.807	MODELO
21256	824	18	4	\N	\N	\N	\N
21257	824	19	3	\N	\N	\N	\N
21258	824	20	4	\N	\N	\N	\N
21259	824	21	4	\N	\N	\N	\N
21260	824	22	3	\N	\N	\N	\N
21261	824	23	4	\N	\N	\N	\N
21262	824	24	4	\N	\N	\N	\N
21263	824	27	4	\N	\N	\N	\N
21264	824	28	3	\N	\N	\N	\N
21265	824	29	1	\N	\N	\N	\N
21266	824	30	3	\N	\N	\N	\N
21267	824	31	2	\N	\N	\N	\N
21268	824	32	4	\N	\N	\N	\N
21269	824	33	3	\N	\N	\N	\N
21270	824	34	3	\N	\N	\N	\N
21271	824	35	4	\N	\N	\N	\N
21272	824	36	3	\N	\N	\N	\N
21273	824	37	4	\N	\N	\N	\N
21274	824	38	1	\N	\N	\N	\N
21275	824	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.853	MODELO
21276	824	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.686	MODELO
21277	823	18	4	\N	\N	\N	\N
21278	823	19	4	\N	\N	\N	\N
21279	823	20	3	\N	\N	\N	\N
21280	823	21	3	\N	\N	\N	\N
21281	823	22	4	\N	\N	\N	\N
21282	823	23	3	\N	\N	\N	\N
21283	823	24	4	\N	\N	\N	\N
21284	823	27	1	\N	\N	\N	\N
21285	823	28	4	\N	\N	\N	\N
21286	823	29	4	\N	\N	\N	\N
21287	823	30	3	\N	\N	\N	\N
21288	823	31	1	\N	\N	\N	\N
21289	823	32	3	\N	\N	\N	\N
21290	823	33	4	\N	\N	\N	\N
21291	823	34	4	\N	\N	\N	\N
21292	823	35	4	\N	\N	\N	\N
21293	823	36	3	\N	\N	\N	\N
21294	823	37	2	\N	\N	\N	\N
21295	823	38	4	\N	\N	\N	\N
21296	823	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.806	MODELO
21297	823	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.719	MODELO
21298	822	18	3	\N	\N	\N	\N
21299	822	19	4	\N	\N	\N	\N
21300	822	20	4	\N	\N	\N	\N
21301	822	21	4	\N	\N	\N	\N
21302	822	22	2	\N	\N	\N	\N
21303	822	23	4	\N	\N	\N	\N
21304	822	24	4	\N	\N	\N	\N
21305	822	27	3	\N	\N	\N	\N
21306	822	28	4	\N	\N	\N	\N
21307	822	29	1	\N	\N	\N	\N
21308	822	30	4	\N	\N	\N	\N
21309	822	31	4	\N	\N	\N	\N
21310	822	32	4	\N	\N	\N	\N
21311	822	33	4	\N	\N	\N	\N
21312	822	34	4	\N	\N	\N	\N
21313	822	35	4	\N	\N	\N	\N
21314	822	36	4	\N	\N	\N	\N
21315	822	37	3	\N	\N	\N	\N
21316	822	38	4	\N	\N	\N	\N
21317	822	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.706	MODELO
21318	822	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.855	MODELO
21319	821	18	4	\N	\N	\N	\N
21320	821	19	4	\N	\N	\N	\N
21321	821	20	4	\N	\N	\N	\N
21322	821	21	4	\N	\N	\N	\N
21323	821	22	4	\N	\N	\N	\N
21324	821	23	4	\N	\N	\N	\N
21325	821	24	4	\N	\N	\N	\N
21326	821	27	4	\N	\N	\N	\N
21327	821	28	4	\N	\N	\N	\N
21328	821	29	3	\N	\N	\N	\N
21329	821	30	4	\N	\N	\N	\N
21330	821	31	4	\N	\N	\N	\N
21331	821	32	4	\N	\N	\N	\N
21332	821	33	4	\N	\N	\N	\N
21333	821	34	4	\N	\N	\N	\N
21334	821	35	3	\N	\N	\N	\N
21335	821	36	4	\N	\N	\N	\N
21336	821	37	4	\N	\N	\N	\N
21337	821	38	4	\N	\N	\N	\N
21338	821	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.905	MODELO
21339	821	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.859	MODELO
21340	820	18	3	\N	\N	\N	\N
21341	820	19	3	\N	\N	\N	\N
21342	820	20	3	\N	\N	\N	\N
21343	820	21	4	\N	\N	\N	\N
21344	820	22	4	\N	\N	\N	\N
21345	820	23	3	\N	\N	\N	\N
21346	820	24	4	\N	\N	\N	\N
21347	820	27	4	\N	\N	\N	\N
21348	820	28	4	\N	\N	\N	\N
21349	820	29	4	\N	\N	\N	\N
21350	820	30	4	\N	\N	\N	\N
21351	820	31	4	\N	\N	\N	\N
21352	820	32	4	\N	\N	\N	\N
21353	820	33	4	\N	\N	\N	\N
21354	820	34	4	\N	\N	\N	\N
21355	820	35	3	\N	\N	\N	\N
21356	820	36	3	\N	\N	\N	\N
21357	820	37	3	\N	\N	\N	\N
21358	820	38	3	\N	\N	\N	\N
21359	820	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.799	MODELO
21360	820	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.834	MODELO
21361	819	18	4	\N	\N	\N	\N
21362	819	19	4	\N	\N	\N	\N
21363	819	20	4	\N	\N	\N	\N
21364	819	21	3	\N	\N	\N	\N
21365	819	22	3	\N	\N	\N	\N
21366	819	23	4	\N	\N	\N	\N
21367	819	24	4	\N	\N	\N	\N
21368	819	27	4	\N	\N	\N	\N
21369	819	28	4	\N	\N	\N	\N
21370	819	29	4	\N	\N	\N	\N
21371	819	30	3	\N	\N	\N	\N
21372	819	31	4	\N	\N	\N	\N
21373	819	32	4	\N	\N	\N	\N
21374	819	33	4	\N	\N	\N	\N
21375	819	34	3	\N	\N	\N	\N
21376	819	35	4	\N	\N	\N	\N
21377	819	36	4	\N	\N	\N	\N
21378	819	37	3	\N	\N	\N	\N
21379	819	38	4	\N	\N	\N	\N
21380	819	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.726	MODELO
21381	819	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.603	MODELO
21382	818	18	4	\N	\N	\N	\N
21383	818	19	4	\N	\N	\N	\N
21384	818	20	3	\N	\N	\N	\N
21385	818	21	4	\N	\N	\N	\N
21386	818	22	4	\N	\N	\N	\N
21387	818	23	4	\N	\N	\N	\N
21388	818	24	4	\N	\N	\N	\N
21389	818	27	4	\N	\N	\N	\N
21390	818	28	4	\N	\N	\N	\N
21391	818	29	3	\N	\N	\N	\N
21392	818	30	4	\N	\N	\N	\N
21393	818	31	3	\N	\N	\N	\N
21394	818	32	4	\N	\N	\N	\N
21395	818	33	3	\N	\N	\N	\N
21396	818	34	4	\N	\N	\N	\N
21397	818	35	4	\N	\N	\N	\N
21398	818	36	2	\N	\N	\N	\N
21399	818	37	4	\N	\N	\N	\N
21400	818	38	3	\N	\N	\N	\N
21401	818	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.96	MODELO
21402	818	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.715	MODELO
21403	817	18	4	\N	\N	\N	\N
21404	817	19	4	\N	\N	\N	\N
21405	817	20	4	\N	\N	\N	\N
21406	817	21	4	\N	\N	\N	\N
21407	817	22	3	\N	\N	\N	\N
21408	817	23	4	\N	\N	\N	\N
21409	817	24	4	\N	\N	\N	\N
21410	817	27	4	\N	\N	\N	\N
21411	817	28	4	\N	\N	\N	\N
21412	817	29	3	\N	\N	\N	\N
21413	817	30	3	\N	\N	\N	\N
21414	817	31	4	\N	\N	\N	\N
21415	817	32	4	\N	\N	\N	\N
21416	817	33	4	\N	\N	\N	\N
21417	817	34	4	\N	\N	\N	\N
21418	817	35	4	\N	\N	\N	\N
21419	817	36	3	\N	\N	\N	\N
21420	817	37	4	\N	\N	\N	\N
21421	817	38	4	\N	\N	\N	\N
21422	817	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.853	MODELO
21423	817	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.816	MODELO
21424	816	18	4	\N	\N	\N	\N
21425	816	19	2	\N	\N	\N	\N
21426	816	20	3	\N	\N	\N	\N
21427	816	21	4	\N	\N	\N	\N
21428	816	22	4	\N	\N	\N	\N
21429	816	23	4	\N	\N	\N	\N
21430	816	24	3	\N	\N	\N	\N
21431	816	27	4	\N	\N	\N	\N
21432	816	28	4	\N	\N	\N	\N
21433	816	29	4	\N	\N	\N	\N
21434	816	30	2	\N	\N	\N	\N
21435	816	31	2	\N	\N	\N	\N
21436	816	32	4	\N	\N	\N	\N
21437	816	33	4	\N	\N	\N	\N
21438	816	34	4	\N	\N	\N	\N
21439	816	35	3	\N	\N	\N	\N
21440	816	36	4	\N	\N	\N	\N
21441	816	37	4	\N	\N	\N	\N
21442	816	38	3	\N	\N	\N	\N
21443	816	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.903	MODELO
21444	816	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.771	MODELO
21445	815	18	4	\N	\N	\N	\N
21446	815	19	4	\N	\N	\N	\N
21447	815	20	4	\N	\N	\N	\N
21448	815	21	4	\N	\N	\N	\N
21449	815	22	4	\N	\N	\N	\N
21450	815	23	3	\N	\N	\N	\N
21451	815	24	4	\N	\N	\N	\N
21452	815	27	4	\N	\N	\N	\N
21453	815	28	4	\N	\N	\N	\N
21454	815	29	4	\N	\N	\N	\N
21455	815	30	3	\N	\N	\N	\N
21456	815	31	4	\N	\N	\N	\N
21457	815	32	4	\N	\N	\N	\N
21458	815	33	4	\N	\N	\N	\N
21459	815	34	4	\N	\N	\N	\N
21460	815	35	4	\N	\N	\N	\N
21461	815	36	4	\N	\N	\N	\N
21462	815	37	4	\N	\N	\N	\N
21463	815	38	2	\N	\N	\N	\N
21464	815	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.621	MODELO
21465	815	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.869	MODELO
21466	814	18	4	\N	\N	\N	\N
21467	814	19	2	\N	\N	\N	\N
21468	814	20	2	\N	\N	\N	\N
21469	814	21	4	\N	\N	\N	\N
21470	814	22	4	\N	\N	\N	\N
21471	814	23	4	\N	\N	\N	\N
21472	814	24	4	\N	\N	\N	\N
21473	814	27	1	\N	\N	\N	\N
21474	814	28	3	\N	\N	\N	\N
21475	814	29	3	\N	\N	\N	\N
21476	814	30	3	\N	\N	\N	\N
21477	814	31	4	\N	\N	\N	\N
21478	814	32	3	\N	\N	\N	\N
21479	814	33	4	\N	\N	\N	\N
21480	814	34	3	\N	\N	\N	\N
21481	814	35	4	\N	\N	\N	\N
21482	814	36	3	\N	\N	\N	\N
21483	814	37	4	\N	\N	\N	\N
21484	814	38	4	\N	\N	\N	\N
21601	808	29	4	\N	\N	\N	\N
21485	814	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.949	MODELO
21486	814	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.939	MODELO
21487	813	18	3	\N	\N	\N	\N
21488	813	19	4	\N	\N	\N	\N
21489	813	20	1	\N	\N	\N	\N
21490	813	21	4	\N	\N	\N	\N
21491	813	22	4	\N	\N	\N	\N
21492	813	23	3	\N	\N	\N	\N
21493	813	24	3	\N	\N	\N	\N
21494	813	27	4	\N	\N	\N	\N
21495	813	28	4	\N	\N	\N	\N
21496	813	29	4	\N	\N	\N	\N
21497	813	30	4	\N	\N	\N	\N
21498	813	31	4	\N	\N	\N	\N
21499	813	32	3	\N	\N	\N	\N
21500	813	33	4	\N	\N	\N	\N
21501	813	34	4	\N	\N	\N	\N
21502	813	35	4	\N	\N	\N	\N
21503	813	36	4	\N	\N	\N	\N
21504	813	37	4	\N	\N	\N	\N
21505	813	38	3	\N	\N	\N	\N
21506	813	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.87	MODELO
21507	813	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.658	MODELO
21508	812	18	4	\N	\N	\N	\N
21509	812	19	4	\N	\N	\N	\N
21510	812	20	2	\N	\N	\N	\N
21511	812	21	4	\N	\N	\N	\N
21512	812	22	3	\N	\N	\N	\N
21513	812	23	3	\N	\N	\N	\N
21514	812	24	4	\N	\N	\N	\N
21515	812	27	3	\N	\N	\N	\N
21516	812	28	3	\N	\N	\N	\N
21517	812	29	3	\N	\N	\N	\N
21518	812	30	3	\N	\N	\N	\N
21519	812	31	4	\N	\N	\N	\N
21520	812	32	3	\N	\N	\N	\N
21521	812	33	4	\N	\N	\N	\N
21522	812	34	2	\N	\N	\N	\N
21523	812	35	4	\N	\N	\N	\N
21524	812	36	3	\N	\N	\N	\N
21525	812	37	1	\N	\N	\N	\N
21526	812	38	3	\N	\N	\N	\N
21527	812	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.951	MODELO
21528	812	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.878	MODELO
21529	811	18	2	\N	\N	\N	\N
21530	811	19	3	\N	\N	\N	\N
21531	811	20	4	\N	\N	\N	\N
21532	811	21	4	\N	\N	\N	\N
21533	811	22	2	\N	\N	\N	\N
21534	811	23	3	\N	\N	\N	\N
21535	811	24	3	\N	\N	\N	\N
21536	811	27	2	\N	\N	\N	\N
21537	811	28	4	\N	\N	\N	\N
21538	811	29	4	\N	\N	\N	\N
21539	811	30	4	\N	\N	\N	\N
21540	811	31	3	\N	\N	\N	\N
21541	811	32	3	\N	\N	\N	\N
21542	811	33	4	\N	\N	\N	\N
21543	811	34	3	\N	\N	\N	\N
21544	811	35	4	\N	\N	\N	\N
21545	811	36	4	\N	\N	\N	\N
21546	811	37	4	\N	\N	\N	\N
21547	811	38	3	\N	\N	\N	\N
21548	811	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.876	MODELO
21549	811	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.805	MODELO
21550	810	18	4	\N	\N	\N	\N
21551	810	19	4	\N	\N	\N	\N
21552	810	20	4	\N	\N	\N	\N
21553	810	21	2	\N	\N	\N	\N
21554	810	22	4	\N	\N	\N	\N
21555	810	23	4	\N	\N	\N	\N
21556	810	24	3	\N	\N	\N	\N
21557	810	27	4	\N	\N	\N	\N
21558	810	28	4	\N	\N	\N	\N
21559	810	29	4	\N	\N	\N	\N
21560	810	30	4	\N	\N	\N	\N
21561	810	31	4	\N	\N	\N	\N
21562	810	32	4	\N	\N	\N	\N
21563	810	33	4	\N	\N	\N	\N
21564	810	34	4	\N	\N	\N	\N
21565	810	35	4	\N	\N	\N	\N
21566	810	36	4	\N	\N	\N	\N
21567	810	37	4	\N	\N	\N	\N
21568	810	38	4	\N	\N	\N	\N
21569	810	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.512	MODELO
21570	810	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.75	MODELO
21571	809	18	4	\N	\N	\N	\N
21572	809	19	3	\N	\N	\N	\N
21573	809	20	2	\N	\N	\N	\N
21574	809	21	4	\N	\N	\N	\N
21575	809	22	4	\N	\N	\N	\N
21576	809	23	4	\N	\N	\N	\N
21577	809	24	3	\N	\N	\N	\N
21578	809	27	4	\N	\N	\N	\N
21579	809	28	4	\N	\N	\N	\N
21580	809	29	4	\N	\N	\N	\N
21581	809	30	4	\N	\N	\N	\N
21582	809	31	3	\N	\N	\N	\N
21583	809	32	4	\N	\N	\N	\N
21584	809	33	4	\N	\N	\N	\N
21585	809	34	4	\N	\N	\N	\N
21586	809	35	4	\N	\N	\N	\N
21587	809	36	4	\N	\N	\N	\N
21588	809	37	3	\N	\N	\N	\N
21589	809	38	4	\N	\N	\N	\N
21590	809	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.743	MODELO
21591	809	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.608	MODELO
21592	808	18	3	\N	\N	\N	\N
21593	808	19	4	\N	\N	\N	\N
21594	808	20	4	\N	\N	\N	\N
21595	808	21	4	\N	\N	\N	\N
21596	808	22	4	\N	\N	\N	\N
21597	808	23	2	\N	\N	\N	\N
21598	808	24	4	\N	\N	\N	\N
21599	808	27	4	\N	\N	\N	\N
21600	808	28	3	\N	\N	\N	\N
21602	808	30	4	\N	\N	\N	\N
21603	808	31	4	\N	\N	\N	\N
21604	808	32	4	\N	\N	\N	\N
21605	808	33	2	\N	\N	\N	\N
21606	808	34	4	\N	\N	\N	\N
21607	808	35	3	\N	\N	\N	\N
21608	808	36	3	\N	\N	\N	\N
21609	808	37	3	\N	\N	\N	\N
21610	808	38	4	\N	\N	\N	\N
21611	808	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.809	MODELO
21612	808	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.758	MODELO
21613	807	18	4	\N	\N	\N	\N
21614	807	19	1	\N	\N	\N	\N
21615	807	20	4	\N	\N	\N	\N
21616	807	21	4	\N	\N	\N	\N
21617	807	22	4	\N	\N	\N	\N
21618	807	23	1	\N	\N	\N	\N
21619	807	24	4	\N	\N	\N	\N
21620	807	27	2	\N	\N	\N	\N
21621	807	28	3	\N	\N	\N	\N
21622	807	29	4	\N	\N	\N	\N
21623	807	30	3	\N	\N	\N	\N
21624	807	31	4	\N	\N	\N	\N
21625	807	32	4	\N	\N	\N	\N
21626	807	33	4	\N	\N	\N	\N
21627	807	34	2	\N	\N	\N	\N
21628	807	35	4	\N	\N	\N	\N
21629	807	36	4	\N	\N	\N	\N
21630	807	37	4	\N	\N	\N	\N
21631	807	38	4	\N	\N	\N	\N
21632	807	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.806	MODELO
21633	807	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.949	MODELO
21634	806	18	4	\N	\N	\N	\N
21635	806	19	4	\N	\N	\N	\N
21636	806	20	3	\N	\N	\N	\N
21637	806	21	1	\N	\N	\N	\N
21638	806	22	3	\N	\N	\N	\N
21639	806	23	4	\N	\N	\N	\N
21640	806	24	4	\N	\N	\N	\N
21641	806	27	3	\N	\N	\N	\N
21642	806	28	4	\N	\N	\N	\N
21643	806	29	3	\N	\N	\N	\N
21644	806	30	4	\N	\N	\N	\N
21645	806	31	3	\N	\N	\N	\N
21646	806	32	4	\N	\N	\N	\N
21647	806	33	4	\N	\N	\N	\N
21648	806	34	4	\N	\N	\N	\N
21649	806	35	4	\N	\N	\N	\N
21650	806	36	4	\N	\N	\N	\N
21651	806	37	4	\N	\N	\N	\N
21652	806	38	4	\N	\N	\N	\N
21653	806	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.971	MODELO
21654	806	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.726	MODELO
21655	805	18	4	\N	\N	\N	\N
21656	805	19	4	\N	\N	\N	\N
21657	805	20	4	\N	\N	\N	\N
21658	805	21	3	\N	\N	\N	\N
21659	805	22	3	\N	\N	\N	\N
21660	805	23	4	\N	\N	\N	\N
21661	805	24	4	\N	\N	\N	\N
21662	805	27	4	\N	\N	\N	\N
21663	805	28	4	\N	\N	\N	\N
21664	805	29	4	\N	\N	\N	\N
21665	805	30	4	\N	\N	\N	\N
21666	805	31	2	\N	\N	\N	\N
21667	805	32	4	\N	\N	\N	\N
21668	805	33	4	\N	\N	\N	\N
21669	805	34	3	\N	\N	\N	\N
21670	805	35	3	\N	\N	\N	\N
21671	805	36	3	\N	\N	\N	\N
21672	805	37	3	\N	\N	\N	\N
21673	805	38	3	\N	\N	\N	\N
21674	805	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.917	MODELO
21675	805	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.929	MODELO
21676	804	18	4	\N	\N	\N	\N
21677	804	19	3	\N	\N	\N	\N
21678	804	20	3	\N	\N	\N	\N
21679	804	21	4	\N	\N	\N	\N
21680	804	22	4	\N	\N	\N	\N
21681	804	23	4	\N	\N	\N	\N
21682	804	24	4	\N	\N	\N	\N
21683	804	27	3	\N	\N	\N	\N
21684	804	28	2	\N	\N	\N	\N
21685	804	29	4	\N	\N	\N	\N
21686	804	30	4	\N	\N	\N	\N
21687	804	31	1	\N	\N	\N	\N
21688	804	32	3	\N	\N	\N	\N
21689	804	33	2	\N	\N	\N	\N
21690	804	34	4	\N	\N	\N	\N
21691	804	35	4	\N	\N	\N	\N
21692	804	36	4	\N	\N	\N	\N
21693	804	37	2	\N	\N	\N	\N
21694	804	38	4	\N	\N	\N	\N
21695	804	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.831	MODELO
21696	804	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.689	MODELO
21697	803	18	3	\N	\N	\N	\N
21698	803	19	4	\N	\N	\N	\N
21699	803	20	4	\N	\N	\N	\N
21700	803	21	2	\N	\N	\N	\N
21701	803	22	4	\N	\N	\N	\N
21702	803	23	4	\N	\N	\N	\N
21703	803	24	4	\N	\N	\N	\N
21704	803	27	3	\N	\N	\N	\N
21705	803	28	2	\N	\N	\N	\N
21706	803	29	2	\N	\N	\N	\N
21707	803	30	3	\N	\N	\N	\N
21708	803	31	3	\N	\N	\N	\N
21709	803	32	4	\N	\N	\N	\N
21710	803	33	4	\N	\N	\N	\N
21711	803	34	4	\N	\N	\N	\N
21712	803	35	4	\N	\N	\N	\N
21713	803	36	1	\N	\N	\N	\N
21714	803	37	4	\N	\N	\N	\N
21715	803	38	3	\N	\N	\N	\N
21716	803	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.859	MODELO
21717	803	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.877	MODELO
21718	802	18	2	\N	\N	\N	\N
21719	802	19	4	\N	\N	\N	\N
21720	802	20	3	\N	\N	\N	\N
21721	802	21	1	\N	\N	\N	\N
21722	802	22	2	\N	\N	\N	\N
21723	802	23	4	\N	\N	\N	\N
21724	802	24	3	\N	\N	\N	\N
21725	802	27	4	\N	\N	\N	\N
21726	802	28	4	\N	\N	\N	\N
21727	802	29	2	\N	\N	\N	\N
21728	802	30	4	\N	\N	\N	\N
21729	802	31	4	\N	\N	\N	\N
21730	802	32	4	\N	\N	\N	\N
21731	802	33	4	\N	\N	\N	\N
21732	802	34	4	\N	\N	\N	\N
21733	802	35	4	\N	\N	\N	\N
21734	802	36	4	\N	\N	\N	\N
21735	802	37	4	\N	\N	\N	\N
21736	802	38	3	\N	\N	\N	\N
21737	802	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.748	MODELO
21738	802	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.744	MODELO
21739	801	18	4	\N	\N	\N	\N
21740	801	19	3	\N	\N	\N	\N
21741	801	20	4	\N	\N	\N	\N
21742	801	21	3	\N	\N	\N	\N
21743	801	22	4	\N	\N	\N	\N
21744	801	23	4	\N	\N	\N	\N
21745	801	24	4	\N	\N	\N	\N
21746	801	27	4	\N	\N	\N	\N
21747	801	28	4	\N	\N	\N	\N
21748	801	29	4	\N	\N	\N	\N
21749	801	30	3	\N	\N	\N	\N
21750	801	31	4	\N	\N	\N	\N
21751	801	32	4	\N	\N	\N	\N
21752	801	33	3	\N	\N	\N	\N
21753	801	34	4	\N	\N	\N	\N
21754	801	35	4	\N	\N	\N	\N
21755	801	36	4	\N	\N	\N	\N
21756	801	37	3	\N	\N	\N	\N
21757	801	38	4	\N	\N	\N	\N
21758	801	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.944	MODELO
21759	801	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.761	MODELO
21760	800	18	3	\N	\N	\N	\N
21761	800	19	3	\N	\N	\N	\N
21762	800	20	3	\N	\N	\N	\N
21763	800	21	4	\N	\N	\N	\N
21764	800	22	4	\N	\N	\N	\N
21765	800	23	4	\N	\N	\N	\N
21766	800	24	2	\N	\N	\N	\N
21767	800	27	4	\N	\N	\N	\N
21768	800	28	2	\N	\N	\N	\N
21769	800	29	2	\N	\N	\N	\N
21770	800	30	4	\N	\N	\N	\N
21771	800	31	4	\N	\N	\N	\N
21772	800	32	3	\N	\N	\N	\N
21773	800	33	4	\N	\N	\N	\N
21774	800	34	4	\N	\N	\N	\N
21775	800	35	3	\N	\N	\N	\N
21776	800	36	4	\N	\N	\N	\N
21777	800	37	2	\N	\N	\N	\N
21778	800	38	4	\N	\N	\N	\N
21779	800	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.846	MODELO
21780	800	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.78	MODELO
21781	799	18	4	\N	\N	\N	\N
21782	799	19	4	\N	\N	\N	\N
21783	799	20	4	\N	\N	\N	\N
21784	799	21	4	\N	\N	\N	\N
21785	799	22	3	\N	\N	\N	\N
21786	799	23	4	\N	\N	\N	\N
21787	799	24	4	\N	\N	\N	\N
21788	799	27	4	\N	\N	\N	\N
21789	799	28	4	\N	\N	\N	\N
21790	799	29	4	\N	\N	\N	\N
21791	799	30	2	\N	\N	\N	\N
21792	799	31	4	\N	\N	\N	\N
21793	799	32	4	\N	\N	\N	\N
21794	799	33	4	\N	\N	\N	\N
21795	799	34	4	\N	\N	\N	\N
21796	799	35	4	\N	\N	\N	\N
21797	799	36	4	\N	\N	\N	\N
21798	799	37	4	\N	\N	\N	\N
21799	799	38	3	\N	\N	\N	\N
21800	799	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.78	MODELO
21801	799	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.834	MODELO
21802	798	18	3	\N	\N	\N	\N
21803	798	19	3	\N	\N	\N	\N
21804	798	20	4	\N	\N	\N	\N
21805	798	21	4	\N	\N	\N	\N
21806	798	22	4	\N	\N	\N	\N
21807	798	23	3	\N	\N	\N	\N
21808	798	24	4	\N	\N	\N	\N
21809	798	27	4	\N	\N	\N	\N
21810	798	28	4	\N	\N	\N	\N
21811	798	29	4	\N	\N	\N	\N
21812	798	30	4	\N	\N	\N	\N
21813	798	31	2	\N	\N	\N	\N
21814	798	32	4	\N	\N	\N	\N
21815	798	33	3	\N	\N	\N	\N
21816	798	34	4	\N	\N	\N	\N
21817	798	35	4	\N	\N	\N	\N
21818	798	36	3	\N	\N	\N	\N
21819	798	37	4	\N	\N	\N	\N
21820	798	38	4	\N	\N	\N	\N
21821	798	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.853	MODELO
21822	798	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.759	MODELO
21823	797	18	2	\N	\N	\N	\N
21824	797	19	3	\N	\N	\N	\N
21825	797	20	4	\N	\N	\N	\N
21826	797	21	4	\N	\N	\N	\N
21827	797	22	4	\N	\N	\N	\N
21828	797	23	4	\N	\N	\N	\N
21829	797	24	4	\N	\N	\N	\N
21830	797	27	3	\N	\N	\N	\N
21831	797	28	4	\N	\N	\N	\N
21832	797	29	4	\N	\N	\N	\N
21833	797	30	4	\N	\N	\N	\N
21834	797	31	3	\N	\N	\N	\N
21835	797	32	4	\N	\N	\N	\N
21836	797	33	4	\N	\N	\N	\N
21837	797	34	3	\N	\N	\N	\N
21838	797	35	3	\N	\N	\N	\N
21839	797	36	4	\N	\N	\N	\N
21840	797	37	4	\N	\N	\N	\N
21841	797	38	4	\N	\N	\N	\N
21842	797	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.958	MODELO
21843	797	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.751	MODELO
21844	796	18	4	\N	\N	\N	\N
21845	796	19	4	\N	\N	\N	\N
21846	796	20	4	\N	\N	\N	\N
21847	796	21	3	\N	\N	\N	\N
21848	796	22	4	\N	\N	\N	\N
21849	796	23	4	\N	\N	\N	\N
21850	796	24	1	\N	\N	\N	\N
21851	796	27	3	\N	\N	\N	\N
21852	796	28	3	\N	\N	\N	\N
21853	796	29	3	\N	\N	\N	\N
21854	796	30	4	\N	\N	\N	\N
21855	796	31	4	\N	\N	\N	\N
21856	796	32	4	\N	\N	\N	\N
21857	796	33	3	\N	\N	\N	\N
21858	796	34	1	\N	\N	\N	\N
21859	796	35	4	\N	\N	\N	\N
21860	796	36	4	\N	\N	\N	\N
21861	796	37	3	\N	\N	\N	\N
21862	796	38	4	\N	\N	\N	\N
21863	796	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.785	MODELO
21864	796	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.929	MODELO
21865	795	18	4	\N	\N	\N	\N
21866	795	19	4	\N	\N	\N	\N
21867	795	20	4	\N	\N	\N	\N
21868	795	21	4	\N	\N	\N	\N
21869	795	22	4	\N	\N	\N	\N
21870	795	23	3	\N	\N	\N	\N
21871	795	24	4	\N	\N	\N	\N
21872	795	27	4	\N	\N	\N	\N
21873	795	28	4	\N	\N	\N	\N
21874	795	29	2	\N	\N	\N	\N
21875	795	30	4	\N	\N	\N	\N
21876	795	31	4	\N	\N	\N	\N
21877	795	32	4	\N	\N	\N	\N
21878	795	33	4	\N	\N	\N	\N
21879	795	34	4	\N	\N	\N	\N
21880	795	35	4	\N	\N	\N	\N
21881	795	36	3	\N	\N	\N	\N
21882	795	37	4	\N	\N	\N	\N
21883	795	38	4	\N	\N	\N	\N
21884	795	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.792	MODELO
21885	795	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.525	MODELO
21886	794	18	3	\N	\N	\N	\N
21887	794	19	3	\N	\N	\N	\N
21888	794	20	4	\N	\N	\N	\N
21889	794	21	4	\N	\N	\N	\N
21890	794	22	4	\N	\N	\N	\N
21891	794	23	4	\N	\N	\N	\N
21892	794	24	4	\N	\N	\N	\N
21893	794	27	4	\N	\N	\N	\N
21894	794	28	4	\N	\N	\N	\N
21895	794	29	1	\N	\N	\N	\N
21896	794	30	4	\N	\N	\N	\N
21897	794	31	3	\N	\N	\N	\N
21898	794	32	4	\N	\N	\N	\N
21899	794	33	4	\N	\N	\N	\N
21900	794	34	3	\N	\N	\N	\N
21901	794	35	4	\N	\N	\N	\N
21902	794	36	4	\N	\N	\N	\N
21903	794	37	3	\N	\N	\N	\N
21904	794	38	4	\N	\N	\N	\N
21905	794	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.868	MODELO
21906	794	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.712	MODELO
21907	793	18	4	\N	\N	\N	\N
21908	793	19	4	\N	\N	\N	\N
21909	793	20	3	\N	\N	\N	\N
21910	793	21	4	\N	\N	\N	\N
21911	793	22	4	\N	\N	\N	\N
21912	793	23	3	\N	\N	\N	\N
21913	793	24	4	\N	\N	\N	\N
21914	793	27	3	\N	\N	\N	\N
21915	793	28	4	\N	\N	\N	\N
21916	793	29	3	\N	\N	\N	\N
21917	793	30	4	\N	\N	\N	\N
21918	793	31	4	\N	\N	\N	\N
21919	793	32	4	\N	\N	\N	\N
21920	793	33	4	\N	\N	\N	\N
21921	793	34	4	\N	\N	\N	\N
21922	793	35	3	\N	\N	\N	\N
21923	793	36	4	\N	\N	\N	\N
21924	793	37	2	\N	\N	\N	\N
21925	793	38	3	\N	\N	\N	\N
21926	793	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.823	MODELO
21927	793	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.733	MODELO
21928	792	18	4	\N	\N	\N	\N
21929	792	19	4	\N	\N	\N	\N
21930	792	20	4	\N	\N	\N	\N
21931	792	21	4	\N	\N	\N	\N
21932	792	22	3	\N	\N	\N	\N
21933	792	23	4	\N	\N	\N	\N
21934	792	24	2	\N	\N	\N	\N
21935	792	27	4	\N	\N	\N	\N
21936	792	28	4	\N	\N	\N	\N
21937	792	29	3	\N	\N	\N	\N
21938	792	30	4	\N	\N	\N	\N
21939	792	31	4	\N	\N	\N	\N
21940	792	32	3	\N	\N	\N	\N
21941	792	33	4	\N	\N	\N	\N
21942	792	34	4	\N	\N	\N	\N
21943	792	35	4	\N	\N	\N	\N
21944	792	36	3	\N	\N	\N	\N
21945	792	37	3	\N	\N	\N	\N
21946	792	38	4	\N	\N	\N	\N
21947	792	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.717	MODELO
21948	792	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.925	MODELO
21949	791	18	3	\N	\N	\N	\N
21950	791	19	4	\N	\N	\N	\N
21951	791	20	3	\N	\N	\N	\N
21952	791	21	4	\N	\N	\N	\N
21953	791	22	1	\N	\N	\N	\N
21954	791	23	4	\N	\N	\N	\N
21955	791	24	4	\N	\N	\N	\N
21956	791	27	4	\N	\N	\N	\N
21957	791	28	4	\N	\N	\N	\N
21958	791	29	4	\N	\N	\N	\N
21959	791	30	4	\N	\N	\N	\N
21960	791	31	4	\N	\N	\N	\N
21961	791	32	4	\N	\N	\N	\N
21962	791	33	4	\N	\N	\N	\N
21963	791	34	4	\N	\N	\N	\N
21964	791	35	4	\N	\N	\N	\N
21965	791	36	4	\N	\N	\N	\N
21966	791	37	3	\N	\N	\N	\N
21967	791	38	4	\N	\N	\N	\N
21968	791	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.801	MODELO
21969	791	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.709	MODELO
21970	790	18	3	\N	\N	\N	\N
21971	790	19	4	\N	\N	\N	\N
21972	790	20	4	\N	\N	\N	\N
21973	790	21	3	\N	\N	\N	\N
21974	790	22	4	\N	\N	\N	\N
21975	790	23	4	\N	\N	\N	\N
21976	790	24	4	\N	\N	\N	\N
21977	790	27	3	\N	\N	\N	\N
21978	790	28	4	\N	\N	\N	\N
21979	790	29	4	\N	\N	\N	\N
21980	790	30	4	\N	\N	\N	\N
21981	790	31	4	\N	\N	\N	\N
21982	790	32	2	\N	\N	\N	\N
21983	790	33	4	\N	\N	\N	\N
21984	790	34	4	\N	\N	\N	\N
21985	790	35	3	\N	\N	\N	\N
21986	790	36	3	\N	\N	\N	\N
21987	790	37	4	\N	\N	\N	\N
21988	790	38	4	\N	\N	\N	\N
21989	790	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.733	MODELO
21990	790	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.817	MODELO
21991	789	18	2	\N	\N	\N	\N
21992	789	19	4	\N	\N	\N	\N
21993	789	20	4	\N	\N	\N	\N
21994	789	21	4	\N	\N	\N	\N
21995	789	22	2	\N	\N	\N	\N
21996	789	23	4	\N	\N	\N	\N
21997	789	24	4	\N	\N	\N	\N
21998	789	27	3	\N	\N	\N	\N
21999	789	28	4	\N	\N	\N	\N
22000	789	29	3	\N	\N	\N	\N
22001	789	30	4	\N	\N	\N	\N
22002	789	31	4	\N	\N	\N	\N
22003	789	32	4	\N	\N	\N	\N
22004	789	33	3	\N	\N	\N	\N
22005	789	34	3	\N	\N	\N	\N
22006	789	35	4	\N	\N	\N	\N
22007	789	36	4	\N	\N	\N	\N
22008	789	37	4	\N	\N	\N	\N
22009	789	38	4	\N	\N	\N	\N
22010	789	25	\N	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.892	MODELO
22011	789	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.822	MODELO
22012	788	18	3	\N	\N	\N	\N
22013	788	19	4	\N	\N	\N	\N
22014	788	20	2	\N	\N	\N	\N
22015	788	21	4	\N	\N	\N	\N
22016	788	22	4	\N	\N	\N	\N
22017	788	23	4	\N	\N	\N	\N
22018	788	24	4	\N	\N	\N	\N
22019	788	27	4	\N	\N	\N	\N
22020	788	28	4	\N	\N	\N	\N
22021	788	29	4	\N	\N	\N	\N
22022	788	30	3	\N	\N	\N	\N
22023	788	31	4	\N	\N	\N	\N
22024	788	32	3	\N	\N	\N	\N
22025	788	33	4	\N	\N	\N	\N
22026	788	34	4	\N	\N	\N	\N
22027	788	35	2	\N	\N	\N	\N
22028	788	36	4	\N	\N	\N	\N
22029	788	37	2	\N	\N	\N	\N
22030	788	38	4	\N	\N	\N	\N
22031	788	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.91	MODELO
22032	788	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.978	MODELO
22033	787	18	4	\N	\N	\N	\N
22034	787	19	3	\N	\N	\N	\N
22035	787	20	4	\N	\N	\N	\N
22036	787	21	3	\N	\N	\N	\N
22037	787	22	4	\N	\N	\N	\N
22038	787	23	3	\N	\N	\N	\N
22039	787	24	4	\N	\N	\N	\N
22040	787	27	3	\N	\N	\N	\N
22041	787	28	4	\N	\N	\N	\N
22042	787	29	4	\N	\N	\N	\N
22043	787	30	4	\N	\N	\N	\N
22044	787	31	4	\N	\N	\N	\N
22045	787	32	3	\N	\N	\N	\N
22046	787	33	4	\N	\N	\N	\N
22047	787	34	3	\N	\N	\N	\N
22048	787	35	4	\N	\N	\N	\N
22049	787	36	4	\N	\N	\N	\N
22050	787	37	4	\N	\N	\N	\N
22051	787	38	2	\N	\N	\N	\N
22052	787	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.728	MODELO
22053	787	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.604	MODELO
22054	786	18	4	\N	\N	\N	\N
22055	786	19	4	\N	\N	\N	\N
22056	786	20	4	\N	\N	\N	\N
22057	786	21	4	\N	\N	\N	\N
22058	786	22	2	\N	\N	\N	\N
22059	786	23	4	\N	\N	\N	\N
22060	786	24	4	\N	\N	\N	\N
22061	786	27	3	\N	\N	\N	\N
22062	786	28	3	\N	\N	\N	\N
22063	786	29	4	\N	\N	\N	\N
22064	786	30	3	\N	\N	\N	\N
22065	786	31	4	\N	\N	\N	\N
22066	786	32	4	\N	\N	\N	\N
22067	786	33	4	\N	\N	\N	\N
22068	786	34	4	\N	\N	\N	\N
22069	786	35	4	\N	\N	\N	\N
22070	786	36	4	\N	\N	\N	\N
22071	786	37	4	\N	\N	\N	\N
22072	786	38	3	\N	\N	\N	\N
22073	786	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.735	MODELO
22074	786	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.791	MODELO
22075	785	18	4	\N	\N	\N	\N
22076	785	19	4	\N	\N	\N	\N
22077	785	20	4	\N	\N	\N	\N
22078	785	21	4	\N	\N	\N	\N
22079	785	22	4	\N	\N	\N	\N
22080	785	23	3	\N	\N	\N	\N
22081	785	24	4	\N	\N	\N	\N
22082	785	27	4	\N	\N	\N	\N
22083	785	28	4	\N	\N	\N	\N
22084	785	29	4	\N	\N	\N	\N
22085	785	30	4	\N	\N	\N	\N
22086	785	31	4	\N	\N	\N	\N
22087	785	32	2	\N	\N	\N	\N
22088	785	33	4	\N	\N	\N	\N
22089	785	34	4	\N	\N	\N	\N
22090	785	35	4	\N	\N	\N	\N
22091	785	36	4	\N	\N	\N	\N
22092	785	37	4	\N	\N	\N	\N
22093	785	38	3	\N	\N	\N	\N
22094	785	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.783	MODELO
22095	785	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.816	MODELO
22096	784	18	1	\N	\N	\N	\N
22097	784	19	4	\N	\N	\N	\N
22098	784	20	4	\N	\N	\N	\N
22099	784	21	4	\N	\N	\N	\N
22100	784	22	4	\N	\N	\N	\N
22101	784	23	4	\N	\N	\N	\N
22102	784	24	4	\N	\N	\N	\N
22103	784	27	4	\N	\N	\N	\N
22104	784	28	4	\N	\N	\N	\N
22105	784	29	4	\N	\N	\N	\N
22106	784	30	4	\N	\N	\N	\N
22107	784	31	4	\N	\N	\N	\N
22108	784	32	4	\N	\N	\N	\N
22109	784	33	4	\N	\N	\N	\N
22110	784	34	4	\N	\N	\N	\N
22111	784	35	4	\N	\N	\N	\N
22112	784	36	4	\N	\N	\N	\N
22113	784	37	3	\N	\N	\N	\N
22114	784	38	4	\N	\N	\N	\N
22115	784	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.626	MODELO
22116	784	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.884	MODELO
22117	783	18	4	\N	\N	\N	\N
22118	783	19	4	\N	\N	\N	\N
22119	783	20	4	\N	\N	\N	\N
22120	783	21	4	\N	\N	\N	\N
22121	783	22	4	\N	\N	\N	\N
22122	783	23	4	\N	\N	\N	\N
22123	783	24	3	\N	\N	\N	\N
22124	783	27	4	\N	\N	\N	\N
22125	783	28	4	\N	\N	\N	\N
22126	783	29	2	\N	\N	\N	\N
22127	783	30	2	\N	\N	\N	\N
22128	783	31	4	\N	\N	\N	\N
22129	783	32	4	\N	\N	\N	\N
22130	783	33	3	\N	\N	\N	\N
22131	783	34	4	\N	\N	\N	\N
22132	783	35	3	\N	\N	\N	\N
22133	783	36	4	\N	\N	\N	\N
22134	783	37	4	\N	\N	\N	\N
22135	783	38	4	\N	\N	\N	\N
22136	783	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.796	MODELO
22137	783	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.723	MODELO
22138	782	18	2	\N	\N	\N	\N
22139	782	19	3	\N	\N	\N	\N
22140	782	20	2	\N	\N	\N	\N
22141	782	21	4	\N	\N	\N	\N
22142	782	22	4	\N	\N	\N	\N
22143	782	23	2	\N	\N	\N	\N
22144	782	24	3	\N	\N	\N	\N
22145	782	27	4	\N	\N	\N	\N
22146	782	28	4	\N	\N	\N	\N
22147	782	29	4	\N	\N	\N	\N
22148	782	30	4	\N	\N	\N	\N
22149	782	31	4	\N	\N	\N	\N
22150	782	32	4	\N	\N	\N	\N
22151	782	33	1	\N	\N	\N	\N
22152	782	34	4	\N	\N	\N	\N
22153	782	35	4	\N	\N	\N	\N
22154	782	36	4	\N	\N	\N	\N
22155	782	37	4	\N	\N	\N	\N
22156	782	38	4	\N	\N	\N	\N
22157	782	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.974	MODELO
22158	782	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.945	MODELO
22159	781	18	3	\N	\N	\N	\N
22160	781	19	4	\N	\N	\N	\N
22161	781	20	2	\N	\N	\N	\N
22162	781	21	4	\N	\N	\N	\N
22163	781	22	4	\N	\N	\N	\N
22164	781	23	4	\N	\N	\N	\N
22165	781	24	4	\N	\N	\N	\N
22166	781	27	3	\N	\N	\N	\N
22167	781	28	4	\N	\N	\N	\N
22168	781	29	4	\N	\N	\N	\N
22169	781	30	4	\N	\N	\N	\N
22170	781	31	4	\N	\N	\N	\N
22171	781	32	3	\N	\N	\N	\N
22172	781	33	4	\N	\N	\N	\N
22173	781	34	4	\N	\N	\N	\N
22174	781	35	4	\N	\N	\N	\N
22175	781	36	4	\N	\N	\N	\N
22176	781	37	1	\N	\N	\N	\N
22177	781	38	3	\N	\N	\N	\N
22178	781	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.925	MODELO
22179	781	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.99	MODELO
22180	780	18	4	\N	\N	\N	\N
22181	780	19	2	\N	\N	\N	\N
22182	780	20	4	\N	\N	\N	\N
22183	780	21	4	\N	\N	\N	\N
22184	780	22	4	\N	\N	\N	\N
22185	780	23	3	\N	\N	\N	\N
22186	780	24	4	\N	\N	\N	\N
22187	780	27	4	\N	\N	\N	\N
22188	780	28	4	\N	\N	\N	\N
22189	780	29	4	\N	\N	\N	\N
22190	780	30	4	\N	\N	\N	\N
22191	780	31	2	\N	\N	\N	\N
22192	780	32	4	\N	\N	\N	\N
22193	780	33	4	\N	\N	\N	\N
22194	780	34	4	\N	\N	\N	\N
22195	780	35	4	\N	\N	\N	\N
22196	780	36	4	\N	\N	\N	\N
22197	780	37	3	\N	\N	\N	\N
22198	780	38	3	\N	\N	\N	\N
22199	780	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.869	MODELO
22200	780	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.788	MODELO
22201	779	18	1	\N	\N	\N	\N
22202	779	19	4	\N	\N	\N	\N
22203	779	20	4	\N	\N	\N	\N
22204	779	21	3	\N	\N	\N	\N
22205	779	22	3	\N	\N	\N	\N
22206	779	23	4	\N	\N	\N	\N
22207	779	24	3	\N	\N	\N	\N
22208	779	27	4	\N	\N	\N	\N
22209	779	28	3	\N	\N	\N	\N
22210	779	29	4	\N	\N	\N	\N
22211	779	30	4	\N	\N	\N	\N
22212	779	31	4	\N	\N	\N	\N
22213	779	32	4	\N	\N	\N	\N
22214	779	33	4	\N	\N	\N	\N
22215	779	34	4	\N	\N	\N	\N
22216	779	35	3	\N	\N	\N	\N
22217	779	36	4	\N	\N	\N	\N
22218	779	37	3	\N	\N	\N	\N
22219	779	38	2	\N	\N	\N	\N
22220	779	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.927	MODELO
22221	779	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.91	MODELO
22222	778	18	3	\N	\N	\N	\N
22223	778	19	2	\N	\N	\N	\N
22224	778	20	3	\N	\N	\N	\N
22225	778	21	4	\N	\N	\N	\N
22226	778	22	2	\N	\N	\N	\N
22227	778	23	4	\N	\N	\N	\N
22228	778	24	4	\N	\N	\N	\N
22229	778	27	4	\N	\N	\N	\N
22230	778	28	4	\N	\N	\N	\N
22231	778	29	4	\N	\N	\N	\N
22232	778	30	4	\N	\N	\N	\N
22233	778	31	1	\N	\N	\N	\N
22234	778	32	3	\N	\N	\N	\N
22235	778	33	4	\N	\N	\N	\N
22236	778	34	4	\N	\N	\N	\N
22237	778	35	4	\N	\N	\N	\N
22238	778	36	4	\N	\N	\N	\N
22239	778	37	4	\N	\N	\N	\N
22240	778	38	4	\N	\N	\N	\N
22241	778	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.71	MODELO
22242	778	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.744	MODELO
22243	777	18	4	\N	\N	\N	\N
22244	777	19	4	\N	\N	\N	\N
22245	777	20	4	\N	\N	\N	\N
22246	777	21	3	\N	\N	\N	\N
22247	777	22	4	\N	\N	\N	\N
22248	777	23	3	\N	\N	\N	\N
22249	777	24	4	\N	\N	\N	\N
22250	777	27	4	\N	\N	\N	\N
22251	777	28	4	\N	\N	\N	\N
22252	777	29	2	\N	\N	\N	\N
22253	777	30	3	\N	\N	\N	\N
22254	777	31	4	\N	\N	\N	\N
22255	777	32	3	\N	\N	\N	\N
22256	777	33	4	\N	\N	\N	\N
22257	777	34	3	\N	\N	\N	\N
22258	777	35	4	\N	\N	\N	\N
22259	777	36	4	\N	\N	\N	\N
22260	777	37	4	\N	\N	\N	\N
22261	777	38	4	\N	\N	\N	\N
22262	777	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.818	MODELO
22263	777	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.697	MODELO
22264	776	18	4	\N	\N	\N	\N
22265	776	19	4	\N	\N	\N	\N
22266	776	20	4	\N	\N	\N	\N
22267	776	21	4	\N	\N	\N	\N
22268	776	22	4	\N	\N	\N	\N
22269	776	23	4	\N	\N	\N	\N
22270	776	24	4	\N	\N	\N	\N
22271	776	27	4	\N	\N	\N	\N
22272	776	28	4	\N	\N	\N	\N
22273	776	29	4	\N	\N	\N	\N
22274	776	30	3	\N	\N	\N	\N
22275	776	31	3	\N	\N	\N	\N
22276	776	32	3	\N	\N	\N	\N
22277	776	33	3	\N	\N	\N	\N
22278	776	34	3	\N	\N	\N	\N
22279	776	35	4	\N	\N	\N	\N
22280	776	36	4	\N	\N	\N	\N
22281	776	37	4	\N	\N	\N	\N
22282	776	38	2	\N	\N	\N	\N
22283	776	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.743	MODELO
22284	776	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.867	MODELO
22285	775	18	2	\N	\N	\N	\N
22286	775	19	4	\N	\N	\N	\N
22287	775	20	3	\N	\N	\N	\N
22288	775	21	4	\N	\N	\N	\N
22289	775	22	4	\N	\N	\N	\N
22290	775	23	4	\N	\N	\N	\N
22291	775	24	3	\N	\N	\N	\N
22292	775	27	3	\N	\N	\N	\N
22293	775	28	4	\N	\N	\N	\N
22294	775	29	4	\N	\N	\N	\N
22295	775	30	3	\N	\N	\N	\N
22296	775	31	4	\N	\N	\N	\N
22297	775	32	4	\N	\N	\N	\N
22298	775	33	4	\N	\N	\N	\N
22299	775	34	4	\N	\N	\N	\N
22300	775	35	3	\N	\N	\N	\N
22301	775	36	4	\N	\N	\N	\N
22302	775	37	4	\N	\N	\N	\N
22303	775	38	1	\N	\N	\N	\N
22304	775	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.79	MODELO
22423	1207	32	4	\N	\N	\N	\N
22305	775	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.752	MODELO
22306	774	18	3	\N	\N	\N	\N
22307	774	19	3	\N	\N	\N	\N
22308	774	20	4	\N	\N	\N	\N
22309	774	21	3	\N	\N	\N	\N
22310	774	22	2	\N	\N	\N	\N
22311	774	23	4	\N	\N	\N	\N
22312	774	24	4	\N	\N	\N	\N
22313	774	27	4	\N	\N	\N	\N
22314	774	28	3	\N	\N	\N	\N
22315	774	29	1	\N	\N	\N	\N
22316	774	30	1	\N	\N	\N	\N
22317	774	31	4	\N	\N	\N	\N
22318	774	32	4	\N	\N	\N	\N
22319	774	33	2	\N	\N	\N	\N
22320	774	34	4	\N	\N	\N	\N
22321	774	35	4	\N	\N	\N	\N
22322	774	36	3	\N	\N	\N	\N
22323	774	37	4	\N	\N	\N	\N
22324	774	38	2	\N	\N	\N	\N
22325	774	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.842	MODELO
22326	774	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.883	MODELO
22327	773	18	4	\N	\N	\N	\N
22328	773	19	4	\N	\N	\N	\N
22329	773	20	4	\N	\N	\N	\N
22330	773	21	4	\N	\N	\N	\N
22331	773	22	4	\N	\N	\N	\N
22332	773	23	1	\N	\N	\N	\N
22333	773	24	2	\N	\N	\N	\N
22334	773	27	4	\N	\N	\N	\N
22335	773	28	3	\N	\N	\N	\N
22336	773	29	4	\N	\N	\N	\N
22337	773	30	4	\N	\N	\N	\N
22338	773	31	3	\N	\N	\N	\N
22339	773	32	4	\N	\N	\N	\N
22340	773	33	4	\N	\N	\N	\N
22341	773	34	4	\N	\N	\N	\N
22342	773	35	3	\N	\N	\N	\N
22343	773	36	4	\N	\N	\N	\N
22344	773	37	3	\N	\N	\N	\N
22345	773	38	4	\N	\N	\N	\N
22346	773	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.828	MODELO
22347	773	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.885	MODELO
22348	772	18	3	\N	\N	\N	\N
22349	772	19	3	\N	\N	\N	\N
22350	772	20	4	\N	\N	\N	\N
22351	772	21	4	\N	\N	\N	\N
22352	772	22	4	\N	\N	\N	\N
22353	772	23	4	\N	\N	\N	\N
22354	772	24	4	\N	\N	\N	\N
22355	772	27	4	\N	\N	\N	\N
22356	772	28	4	\N	\N	\N	\N
22357	772	29	4	\N	\N	\N	\N
22358	772	30	4	\N	\N	\N	\N
22359	772	31	4	\N	\N	\N	\N
22360	772	32	3	\N	\N	\N	\N
22361	772	33	2	\N	\N	\N	\N
22362	772	34	3	\N	\N	\N	\N
22363	772	35	4	\N	\N	\N	\N
22364	772	36	2	\N	\N	\N	\N
22365	772	37	4	\N	\N	\N	\N
22366	772	38	3	\N	\N	\N	\N
22367	772	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.737	MODELO
22368	772	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.982	MODELO
22369	1209	18	4	\N	\N	\N	\N
22370	1209	19	3	\N	\N	\N	\N
22371	1209	20	4	\N	\N	\N	\N
22372	1209	21	4	\N	\N	\N	\N
22373	1209	22	4	\N	\N	\N	\N
22374	1209	23	4	\N	\N	\N	\N
22375	1209	24	4	\N	\N	\N	\N
22376	1209	27	3	\N	\N	\N	\N
22377	1209	28	3	\N	\N	\N	\N
22378	1209	29	4	\N	\N	\N	\N
22379	1209	30	3	\N	\N	\N	\N
22380	1209	31	4	\N	\N	\N	\N
22381	1209	32	4	\N	\N	\N	\N
22382	1209	33	4	\N	\N	\N	\N
22383	1209	34	4	\N	\N	\N	\N
22384	1209	35	4	\N	\N	\N	\N
22385	1209	36	3	\N	\N	\N	\N
22386	1209	37	4	\N	\N	\N	\N
22387	1209	38	4	\N	\N	\N	\N
22388	1209	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.855	MODELO
22389	1209	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.683	MODELO
22390	1208	18	1	\N	\N	\N	\N
22391	1208	19	4	\N	\N	\N	\N
22392	1208	20	4	\N	\N	\N	\N
22393	1208	21	3	\N	\N	\N	\N
22394	1208	22	4	\N	\N	\N	\N
22395	1208	23	4	\N	\N	\N	\N
22396	1208	24	4	\N	\N	\N	\N
22397	1208	27	4	\N	\N	\N	\N
22398	1208	28	3	\N	\N	\N	\N
22399	1208	29	4	\N	\N	\N	\N
22400	1208	30	4	\N	\N	\N	\N
22401	1208	31	3	\N	\N	\N	\N
22402	1208	32	4	\N	\N	\N	\N
22403	1208	33	4	\N	\N	\N	\N
22404	1208	34	4	\N	\N	\N	\N
22405	1208	35	4	\N	\N	\N	\N
22406	1208	36	4	\N	\N	\N	\N
22407	1208	37	1	\N	\N	\N	\N
22408	1208	38	4	\N	\N	\N	\N
22409	1208	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.813	MODELO
22410	1208	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.767	MODELO
22411	1207	18	4	\N	\N	\N	\N
22412	1207	19	4	\N	\N	\N	\N
22413	1207	20	4	\N	\N	\N	\N
22414	1207	21	4	\N	\N	\N	\N
22415	1207	22	4	\N	\N	\N	\N
22416	1207	23	2	\N	\N	\N	\N
22417	1207	24	4	\N	\N	\N	\N
22418	1207	27	4	\N	\N	\N	\N
22419	1207	28	3	\N	\N	\N	\N
22420	1207	29	4	\N	\N	\N	\N
22421	1207	30	1	\N	\N	\N	\N
22422	1207	31	3	\N	\N	\N	\N
22424	1207	33	3	\N	\N	\N	\N
22425	1207	34	4	\N	\N	\N	\N
22426	1207	35	4	\N	\N	\N	\N
22427	1207	36	2	\N	\N	\N	\N
22428	1207	37	4	\N	\N	\N	\N
22429	1207	38	2	\N	\N	\N	\N
22430	1207	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.812	MODELO
22431	1207	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.729	MODELO
22432	1206	18	4	\N	\N	\N	\N
22433	1206	19	4	\N	\N	\N	\N
22434	1206	20	3	\N	\N	\N	\N
22435	1206	21	4	\N	\N	\N	\N
22436	1206	22	4	\N	\N	\N	\N
22437	1206	23	4	\N	\N	\N	\N
22438	1206	24	4	\N	\N	\N	\N
22439	1206	27	3	\N	\N	\N	\N
22440	1206	28	4	\N	\N	\N	\N
22441	1206	29	4	\N	\N	\N	\N
22442	1206	30	1	\N	\N	\N	\N
22443	1206	31	2	\N	\N	\N	\N
22444	1206	32	4	\N	\N	\N	\N
22445	1206	33	3	\N	\N	\N	\N
22446	1206	34	3	\N	\N	\N	\N
22447	1206	35	2	\N	\N	\N	\N
22448	1206	36	4	\N	\N	\N	\N
22449	1206	37	3	\N	\N	\N	\N
22450	1206	38	4	\N	\N	\N	\N
22451	1206	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.928	MODELO
22452	1206	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.955	MODELO
22453	1205	18	3	\N	\N	\N	\N
22454	1205	19	4	\N	\N	\N	\N
22455	1205	20	4	\N	\N	\N	\N
22456	1205	21	4	\N	\N	\N	\N
22457	1205	22	4	\N	\N	\N	\N
22458	1205	23	4	\N	\N	\N	\N
22459	1205	24	3	\N	\N	\N	\N
22460	1205	27	4	\N	\N	\N	\N
22461	1205	28	4	\N	\N	\N	\N
22462	1205	29	4	\N	\N	\N	\N
22463	1205	30	3	\N	\N	\N	\N
22464	1205	31	1	\N	\N	\N	\N
22465	1205	32	4	\N	\N	\N	\N
22466	1205	33	3	\N	\N	\N	\N
22467	1205	34	3	\N	\N	\N	\N
22468	1205	35	2	\N	\N	\N	\N
22469	1205	36	4	\N	\N	\N	\N
22470	1205	37	3	\N	\N	\N	\N
22471	1205	38	4	\N	\N	\N	\N
22472	1205	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.707	MODELO
22473	1205	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.931	MODELO
22474	1204	18	3	\N	\N	\N	\N
22475	1204	19	4	\N	\N	\N	\N
22476	1204	20	3	\N	\N	\N	\N
22477	1204	21	3	\N	\N	\N	\N
22478	1204	22	4	\N	\N	\N	\N
22479	1204	23	1	\N	\N	\N	\N
22480	1204	24	2	\N	\N	\N	\N
22481	1204	27	4	\N	\N	\N	\N
22482	1204	28	4	\N	\N	\N	\N
22483	1204	29	4	\N	\N	\N	\N
22484	1204	30	4	\N	\N	\N	\N
22485	1204	31	4	\N	\N	\N	\N
22486	1204	32	4	\N	\N	\N	\N
22487	1204	33	3	\N	\N	\N	\N
22488	1204	34	4	\N	\N	\N	\N
22489	1204	35	4	\N	\N	\N	\N
22490	1204	36	3	\N	\N	\N	\N
22491	1204	37	3	\N	\N	\N	\N
22492	1204	38	2	\N	\N	\N	\N
22493	1204	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.905	MODELO
22494	1204	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.946	MODELO
22495	1203	18	4	\N	\N	\N	\N
22496	1203	19	4	\N	\N	\N	\N
22497	1203	20	4	\N	\N	\N	\N
22498	1203	21	4	\N	\N	\N	\N
22499	1203	22	4	\N	\N	\N	\N
22500	1203	23	3	\N	\N	\N	\N
22501	1203	24	3	\N	\N	\N	\N
22502	1203	27	4	\N	\N	\N	\N
22503	1203	28	4	\N	\N	\N	\N
22504	1203	29	4	\N	\N	\N	\N
22505	1203	30	4	\N	\N	\N	\N
22506	1203	31	4	\N	\N	\N	\N
22507	1203	32	4	\N	\N	\N	\N
22508	1203	33	2	\N	\N	\N	\N
22509	1203	34	3	\N	\N	\N	\N
22510	1203	35	2	\N	\N	\N	\N
22511	1203	36	4	\N	\N	\N	\N
22512	1203	37	2	\N	\N	\N	\N
22513	1203	38	4	\N	\N	\N	\N
22514	1203	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.868	MODELO
22515	1203	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.671	MODELO
22516	1202	18	2	\N	\N	\N	\N
22517	1202	19	4	\N	\N	\N	\N
22518	1202	20	2	\N	\N	\N	\N
22519	1202	21	4	\N	\N	\N	\N
22520	1202	22	4	\N	\N	\N	\N
22521	1202	23	4	\N	\N	\N	\N
22522	1202	24	4	\N	\N	\N	\N
22523	1202	27	4	\N	\N	\N	\N
22524	1202	28	3	\N	\N	\N	\N
22525	1202	29	2	\N	\N	\N	\N
22526	1202	30	2	\N	\N	\N	\N
22527	1202	31	4	\N	\N	\N	\N
22528	1202	32	3	\N	\N	\N	\N
22529	1202	33	3	\N	\N	\N	\N
22530	1202	34	4	\N	\N	\N	\N
22531	1202	35	4	\N	\N	\N	\N
22532	1202	36	4	\N	\N	\N	\N
22533	1202	37	4	\N	\N	\N	\N
22534	1202	38	3	\N	\N	\N	\N
22535	1202	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.817	MODELO
22536	1202	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.863	MODELO
22537	1201	18	3	\N	\N	\N	\N
22538	1201	19	3	\N	\N	\N	\N
22539	1201	20	4	\N	\N	\N	\N
22540	1201	21	4	\N	\N	\N	\N
22541	1201	22	4	\N	\N	\N	\N
22542	1201	23	4	\N	\N	\N	\N
22543	1201	24	4	\N	\N	\N	\N
22544	1201	27	4	\N	\N	\N	\N
22545	1201	28	4	\N	\N	\N	\N
22546	1201	29	4	\N	\N	\N	\N
22547	1201	30	3	\N	\N	\N	\N
22548	1201	31	4	\N	\N	\N	\N
22549	1201	32	4	\N	\N	\N	\N
22550	1201	33	4	\N	\N	\N	\N
22551	1201	34	4	\N	\N	\N	\N
22552	1201	35	4	\N	\N	\N	\N
22553	1201	36	1	\N	\N	\N	\N
22554	1201	37	3	\N	\N	\N	\N
22555	1201	38	2	\N	\N	\N	\N
22556	1201	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.784	MODELO
22557	1201	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.777	MODELO
22558	1200	18	4	\N	\N	\N	\N
22559	1200	19	4	\N	\N	\N	\N
22560	1200	20	4	\N	\N	\N	\N
22561	1200	21	4	\N	\N	\N	\N
22562	1200	22	3	\N	\N	\N	\N
22563	1200	23	1	\N	\N	\N	\N
22564	1200	24	4	\N	\N	\N	\N
22565	1200	27	3	\N	\N	\N	\N
22566	1200	28	4	\N	\N	\N	\N
22567	1200	29	4	\N	\N	\N	\N
22568	1200	30	3	\N	\N	\N	\N
22569	1200	31	4	\N	\N	\N	\N
22570	1200	32	4	\N	\N	\N	\N
22571	1200	33	4	\N	\N	\N	\N
22572	1200	34	4	\N	\N	\N	\N
22573	1200	35	2	\N	\N	\N	\N
22574	1200	36	3	\N	\N	\N	\N
22575	1200	37	4	\N	\N	\N	\N
22576	1200	38	4	\N	\N	\N	\N
22577	1200	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.799	MODELO
22578	1200	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.808	MODELO
22579	1199	18	4	\N	\N	\N	\N
22580	1199	19	4	\N	\N	\N	\N
22581	1199	20	3	\N	\N	\N	\N
22582	1199	21	4	\N	\N	\N	\N
22583	1199	22	2	\N	\N	\N	\N
22584	1199	23	4	\N	\N	\N	\N
22585	1199	24	4	\N	\N	\N	\N
22586	1199	27	4	\N	\N	\N	\N
22587	1199	28	4	\N	\N	\N	\N
22588	1199	29	4	\N	\N	\N	\N
22589	1199	30	3	\N	\N	\N	\N
22590	1199	31	4	\N	\N	\N	\N
22591	1199	32	4	\N	\N	\N	\N
22592	1199	33	3	\N	\N	\N	\N
22593	1199	34	4	\N	\N	\N	\N
22594	1199	35	4	\N	\N	\N	\N
22595	1199	36	4	\N	\N	\N	\N
22596	1199	37	2	\N	\N	\N	\N
22597	1199	38	3	\N	\N	\N	\N
22598	1199	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.989	MODELO
22599	1199	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.862	MODELO
22600	1198	18	4	\N	\N	\N	\N
22601	1198	19	1	\N	\N	\N	\N
22602	1198	20	4	\N	\N	\N	\N
22603	1198	21	3	\N	\N	\N	\N
22604	1198	22	4	\N	\N	\N	\N
22605	1198	23	4	\N	\N	\N	\N
22606	1198	24	4	\N	\N	\N	\N
22607	1198	27	1	\N	\N	\N	\N
22608	1198	28	4	\N	\N	\N	\N
22609	1198	29	4	\N	\N	\N	\N
22610	1198	30	4	\N	\N	\N	\N
22611	1198	31	4	\N	\N	\N	\N
22612	1198	32	4	\N	\N	\N	\N
22613	1198	33	3	\N	\N	\N	\N
22614	1198	34	3	\N	\N	\N	\N
22615	1198	35	4	\N	\N	\N	\N
22616	1198	36	4	\N	\N	\N	\N
22617	1198	37	4	\N	\N	\N	\N
22618	1198	38	1	\N	\N	\N	\N
22619	1198	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.657	MODELO
22620	1198	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.903	MODELO
22621	1197	18	3	\N	\N	\N	\N
22622	1197	19	4	\N	\N	\N	\N
22623	1197	20	4	\N	\N	\N	\N
22624	1197	21	4	\N	\N	\N	\N
22625	1197	22	4	\N	\N	\N	\N
22626	1197	23	4	\N	\N	\N	\N
22627	1197	24	4	\N	\N	\N	\N
22628	1197	27	4	\N	\N	\N	\N
22629	1197	28	4	\N	\N	\N	\N
22630	1197	29	3	\N	\N	\N	\N
22631	1197	30	3	\N	\N	\N	\N
22632	1197	31	4	\N	\N	\N	\N
22633	1197	32	4	\N	\N	\N	\N
22634	1197	33	1	\N	\N	\N	\N
22635	1197	34	4	\N	\N	\N	\N
22636	1197	35	4	\N	\N	\N	\N
22637	1197	36	4	\N	\N	\N	\N
22638	1197	37	4	\N	\N	\N	\N
22639	1197	38	3	\N	\N	\N	\N
22640	1197	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.773	MODELO
22641	1197	26	\N	Nada que destacar, solo seguir con la misma metodología.	POSITIVO	0.725	MODELO
22642	1196	18	4	\N	\N	\N	\N
22643	1196	19	4	\N	\N	\N	\N
22644	1196	20	4	\N	\N	\N	\N
22645	1196	21	3	\N	\N	\N	\N
22646	1196	22	4	\N	\N	\N	\N
22647	1196	23	4	\N	\N	\N	\N
22648	1196	24	4	\N	\N	\N	\N
22649	1196	27	4	\N	\N	\N	\N
22650	1196	28	4	\N	\N	\N	\N
22651	1196	29	3	\N	\N	\N	\N
22652	1196	30	4	\N	\N	\N	\N
22653	1196	31	3	\N	\N	\N	\N
22654	1196	32	2	\N	\N	\N	\N
22655	1196	33	4	\N	\N	\N	\N
22656	1196	34	4	\N	\N	\N	\N
22657	1196	35	4	\N	\N	\N	\N
22658	1196	36	4	\N	\N	\N	\N
22659	1196	37	3	\N	\N	\N	\N
22660	1196	38	4	\N	\N	\N	\N
22661	1196	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.865	MODELO
22662	1196	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.963	MODELO
22663	1195	18	4	\N	\N	\N	\N
22664	1195	19	4	\N	\N	\N	\N
22665	1195	20	4	\N	\N	\N	\N
22666	1195	21	4	\N	\N	\N	\N
22667	1195	22	1	\N	\N	\N	\N
22668	1195	23	4	\N	\N	\N	\N
22669	1195	24	4	\N	\N	\N	\N
22670	1195	27	4	\N	\N	\N	\N
22671	1195	28	3	\N	\N	\N	\N
22672	1195	29	4	\N	\N	\N	\N
22673	1195	30	4	\N	\N	\N	\N
22674	1195	31	4	\N	\N	\N	\N
22675	1195	32	4	\N	\N	\N	\N
22676	1195	33	4	\N	\N	\N	\N
22677	1195	34	4	\N	\N	\N	\N
22678	1195	35	4	\N	\N	\N	\N
22679	1195	36	4	\N	\N	\N	\N
22680	1195	37	4	\N	\N	\N	\N
22681	1195	38	2	\N	\N	\N	\N
22682	1195	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.8	MODELO
22683	1195	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.746	MODELO
22684	1194	18	4	\N	\N	\N	\N
22685	1194	19	2	\N	\N	\N	\N
22686	1194	20	4	\N	\N	\N	\N
22687	1194	21	4	\N	\N	\N	\N
22688	1194	22	4	\N	\N	\N	\N
22689	1194	23	1	\N	\N	\N	\N
22690	1194	24	4	\N	\N	\N	\N
22691	1194	27	4	\N	\N	\N	\N
22692	1194	28	4	\N	\N	\N	\N
22693	1194	29	3	\N	\N	\N	\N
22694	1194	30	4	\N	\N	\N	\N
22695	1194	31	3	\N	\N	\N	\N
22696	1194	32	3	\N	\N	\N	\N
22697	1194	33	4	\N	\N	\N	\N
22698	1194	34	4	\N	\N	\N	\N
22699	1194	35	4	\N	\N	\N	\N
22700	1194	36	4	\N	\N	\N	\N
22701	1194	37	4	\N	\N	\N	\N
22702	1194	38	4	\N	\N	\N	\N
22703	1194	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.964	MODELO
22704	1194	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.911	MODELO
22705	1193	18	3	\N	\N	\N	\N
22706	1193	19	4	\N	\N	\N	\N
22707	1193	20	4	\N	\N	\N	\N
22708	1193	21	2	\N	\N	\N	\N
22709	1193	22	3	\N	\N	\N	\N
22710	1193	23	4	\N	\N	\N	\N
22711	1193	24	3	\N	\N	\N	\N
22712	1193	27	4	\N	\N	\N	\N
22713	1193	28	4	\N	\N	\N	\N
22714	1193	29	3	\N	\N	\N	\N
22715	1193	30	4	\N	\N	\N	\N
22716	1193	31	4	\N	\N	\N	\N
22717	1193	32	4	\N	\N	\N	\N
22718	1193	33	4	\N	\N	\N	\N
22719	1193	34	3	\N	\N	\N	\N
22720	1193	35	3	\N	\N	\N	\N
22721	1193	36	4	\N	\N	\N	\N
22722	1193	37	4	\N	\N	\N	\N
22723	1193	38	4	\N	\N	\N	\N
22724	1193	25	\N	Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.	POSITIVO	0.986	MODELO
22725	1193	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.803	MODELO
22726	1192	18	4	\N	\N	\N	\N
22727	1192	19	4	\N	\N	\N	\N
22728	1192	20	4	\N	\N	\N	\N
22729	1192	21	4	\N	\N	\N	\N
22730	1192	22	4	\N	\N	\N	\N
22731	1192	23	2	\N	\N	\N	\N
22732	1192	24	4	\N	\N	\N	\N
22733	1192	27	3	\N	\N	\N	\N
22734	1192	28	1	\N	\N	\N	\N
22735	1192	29	3	\N	\N	\N	\N
22736	1192	30	4	\N	\N	\N	\N
22737	1192	31	3	\N	\N	\N	\N
22738	1192	32	4	\N	\N	\N	\N
22739	1192	33	4	\N	\N	\N	\N
22740	1192	34	4	\N	\N	\N	\N
22741	1192	35	4	\N	\N	\N	\N
22742	1192	36	3	\N	\N	\N	\N
22743	1192	37	4	\N	\N	\N	\N
22744	1192	38	4	\N	\N	\N	\N
22745	1192	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.986	MODELO
22746	1192	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.536	MODELO
22747	1191	18	4	\N	\N	\N	\N
22748	1191	19	4	\N	\N	\N	\N
22749	1191	20	2	\N	\N	\N	\N
22750	1191	21	4	\N	\N	\N	\N
22751	1191	22	4	\N	\N	\N	\N
22752	1191	23	4	\N	\N	\N	\N
22753	1191	24	2	\N	\N	\N	\N
22754	1191	27	3	\N	\N	\N	\N
22755	1191	28	3	\N	\N	\N	\N
22756	1191	29	3	\N	\N	\N	\N
22757	1191	30	4	\N	\N	\N	\N
22758	1191	31	4	\N	\N	\N	\N
22759	1191	32	4	\N	\N	\N	\N
22760	1191	33	4	\N	\N	\N	\N
22761	1191	34	4	\N	\N	\N	\N
22762	1191	35	4	\N	\N	\N	\N
22763	1191	36	4	\N	\N	\N	\N
22764	1191	37	4	\N	\N	\N	\N
22765	1191	38	4	\N	\N	\N	\N
22766	1191	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.71	MODELO
22767	1191	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.708	MODELO
22768	1190	18	4	\N	\N	\N	\N
22769	1190	19	3	\N	\N	\N	\N
22770	1190	20	4	\N	\N	\N	\N
22771	1190	21	4	\N	\N	\N	\N
22772	1190	22	2	\N	\N	\N	\N
22773	1190	23	4	\N	\N	\N	\N
22774	1190	24	4	\N	\N	\N	\N
22775	1190	27	4	\N	\N	\N	\N
22776	1190	28	4	\N	\N	\N	\N
22777	1190	29	2	\N	\N	\N	\N
22778	1190	30	4	\N	\N	\N	\N
22779	1190	31	3	\N	\N	\N	\N
22780	1190	32	4	\N	\N	\N	\N
22781	1190	33	4	\N	\N	\N	\N
22782	1190	34	4	\N	\N	\N	\N
22783	1190	35	4	\N	\N	\N	\N
22784	1190	36	4	\N	\N	\N	\N
22785	1190	37	4	\N	\N	\N	\N
22786	1190	38	4	\N	\N	\N	\N
22787	1190	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.81	MODELO
22788	1190	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.574	MODELO
22789	1189	18	4	\N	\N	\N	\N
22790	1189	19	4	\N	\N	\N	\N
22791	1189	20	3	\N	\N	\N	\N
22792	1189	21	3	\N	\N	\N	\N
22793	1189	22	4	\N	\N	\N	\N
22794	1189	23	3	\N	\N	\N	\N
22795	1189	24	4	\N	\N	\N	\N
22796	1189	27	4	\N	\N	\N	\N
22797	1189	28	4	\N	\N	\N	\N
22798	1189	29	2	\N	\N	\N	\N
22799	1189	30	4	\N	\N	\N	\N
22800	1189	31	4	\N	\N	\N	\N
22801	1189	32	4	\N	\N	\N	\N
22802	1189	33	4	\N	\N	\N	\N
22803	1189	34	4	\N	\N	\N	\N
22804	1189	35	4	\N	\N	\N	\N
22805	1189	36	4	\N	\N	\N	\N
22806	1189	37	4	\N	\N	\N	\N
22807	1189	38	4	\N	\N	\N	\N
22808	1189	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.78	MODELO
22809	1189	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.721	MODELO
22810	1188	18	4	\N	\N	\N	\N
22811	1188	19	4	\N	\N	\N	\N
22812	1188	20	4	\N	\N	\N	\N
22813	1188	21	4	\N	\N	\N	\N
22814	1188	22	3	\N	\N	\N	\N
22815	1188	23	4	\N	\N	\N	\N
22816	1188	24	4	\N	\N	\N	\N
22817	1188	27	4	\N	\N	\N	\N
22818	1188	28	3	\N	\N	\N	\N
22819	1188	29	3	\N	\N	\N	\N
22820	1188	30	3	\N	\N	\N	\N
22821	1188	31	3	\N	\N	\N	\N
22822	1188	32	4	\N	\N	\N	\N
22823	1188	33	4	\N	\N	\N	\N
22824	1188	34	4	\N	\N	\N	\N
22825	1188	35	1	\N	\N	\N	\N
22826	1188	36	4	\N	\N	\N	\N
22827	1188	37	3	\N	\N	\N	\N
22828	1188	38	2	\N	\N	\N	\N
22829	1188	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.851	MODELO
22830	1188	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.581	MODELO
22831	1187	18	4	\N	\N	\N	\N
22832	1187	19	4	\N	\N	\N	\N
22833	1187	20	3	\N	\N	\N	\N
22834	1187	21	2	\N	\N	\N	\N
22835	1187	22	4	\N	\N	\N	\N
22836	1187	23	4	\N	\N	\N	\N
22837	1187	24	3	\N	\N	\N	\N
22838	1187	27	3	\N	\N	\N	\N
22839	1187	28	4	\N	\N	\N	\N
22840	1187	29	4	\N	\N	\N	\N
22841	1187	30	3	\N	\N	\N	\N
22842	1187	31	4	\N	\N	\N	\N
22843	1187	32	4	\N	\N	\N	\N
22844	1187	33	3	\N	\N	\N	\N
22845	1187	34	4	\N	\N	\N	\N
22846	1187	35	3	\N	\N	\N	\N
22847	1187	36	3	\N	\N	\N	\N
22848	1187	37	4	\N	\N	\N	\N
22849	1187	38	4	\N	\N	\N	\N
22850	1187	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.868	MODELO
22851	1187	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.946	MODELO
22852	1186	18	4	\N	\N	\N	\N
22853	1186	19	4	\N	\N	\N	\N
22854	1186	20	4	\N	\N	\N	\N
22855	1186	21	4	\N	\N	\N	\N
22856	1186	22	4	\N	\N	\N	\N
22857	1186	23	2	\N	\N	\N	\N
22858	1186	24	4	\N	\N	\N	\N
22859	1186	27	4	\N	\N	\N	\N
22860	1186	28	4	\N	\N	\N	\N
22861	1186	29	4	\N	\N	\N	\N
22862	1186	30	3	\N	\N	\N	\N
22863	1186	31	4	\N	\N	\N	\N
22864	1186	32	4	\N	\N	\N	\N
22865	1186	33	4	\N	\N	\N	\N
22866	1186	34	3	\N	\N	\N	\N
22867	1186	35	2	\N	\N	\N	\N
22868	1186	36	4	\N	\N	\N	\N
22869	1186	37	1	\N	\N	\N	\N
22870	1186	38	4	\N	\N	\N	\N
22871	1186	25	\N	Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.	POSITIVO	0.89	MODELO
22872	1186	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.585	MODELO
22873	1185	18	3	\N	\N	\N	\N
22874	1185	19	4	\N	\N	\N	\N
22875	1185	20	4	\N	\N	\N	\N
22876	1185	21	4	\N	\N	\N	\N
22877	1185	22	4	\N	\N	\N	\N
22878	1185	23	4	\N	\N	\N	\N
22879	1185	24	3	\N	\N	\N	\N
22880	1185	27	4	\N	\N	\N	\N
22881	1185	28	4	\N	\N	\N	\N
22882	1185	29	4	\N	\N	\N	\N
22883	1185	30	3	\N	\N	\N	\N
22884	1185	31	4	\N	\N	\N	\N
22885	1185	32	3	\N	\N	\N	\N
22886	1185	33	4	\N	\N	\N	\N
22887	1185	34	4	\N	\N	\N	\N
22888	1185	35	3	\N	\N	\N	\N
22889	1185	36	3	\N	\N	\N	\N
22890	1185	37	4	\N	\N	\N	\N
22891	1185	38	4	\N	\N	\N	\N
22892	1185	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.872	MODELO
23011	1179	32	4	\N	\N	\N	\N
23012	1179	33	1	\N	\N	\N	\N
22893	1185	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.98	MODELO
22894	1184	18	3	\N	\N	\N	\N
22895	1184	19	4	\N	\N	\N	\N
22896	1184	20	3	\N	\N	\N	\N
22897	1184	21	4	\N	\N	\N	\N
22898	1184	22	4	\N	\N	\N	\N
22899	1184	23	3	\N	\N	\N	\N
22900	1184	24	3	\N	\N	\N	\N
22901	1184	27	3	\N	\N	\N	\N
22902	1184	28	4	\N	\N	\N	\N
22903	1184	29	4	\N	\N	\N	\N
22904	1184	30	4	\N	\N	\N	\N
22905	1184	31	4	\N	\N	\N	\N
22906	1184	32	4	\N	\N	\N	\N
22907	1184	33	4	\N	\N	\N	\N
22908	1184	34	4	\N	\N	\N	\N
22909	1184	35	3	\N	\N	\N	\N
22910	1184	36	4	\N	\N	\N	\N
22911	1184	37	4	\N	\N	\N	\N
22912	1184	38	4	\N	\N	\N	\N
22913	1184	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.712	MODELO
22914	1184	26	\N	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.946	MODELO
22915	1183	18	4	\N	\N	\N	\N
22916	1183	19	4	\N	\N	\N	\N
22917	1183	20	4	\N	\N	\N	\N
22918	1183	21	4	\N	\N	\N	\N
22919	1183	22	4	\N	\N	\N	\N
22920	1183	23	4	\N	\N	\N	\N
22921	1183	24	4	\N	\N	\N	\N
22922	1183	27	4	\N	\N	\N	\N
22923	1183	28	4	\N	\N	\N	\N
22924	1183	29	3	\N	\N	\N	\N
22925	1183	30	3	\N	\N	\N	\N
22926	1183	31	4	\N	\N	\N	\N
22927	1183	32	4	\N	\N	\N	\N
22928	1183	33	4	\N	\N	\N	\N
22929	1183	34	3	\N	\N	\N	\N
22930	1183	35	4	\N	\N	\N	\N
22931	1183	36	4	\N	\N	\N	\N
22932	1183	37	4	\N	\N	\N	\N
22933	1183	38	2	\N	\N	\N	\N
22934	1183	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.727	MODELO
22935	1183	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.966	MODELO
22936	1182	18	4	\N	\N	\N	\N
22937	1182	19	4	\N	\N	\N	\N
22938	1182	20	4	\N	\N	\N	\N
22939	1182	21	4	\N	\N	\N	\N
22940	1182	22	4	\N	\N	\N	\N
22941	1182	23	4	\N	\N	\N	\N
22942	1182	24	4	\N	\N	\N	\N
22943	1182	27	4	\N	\N	\N	\N
22944	1182	28	4	\N	\N	\N	\N
22945	1182	29	4	\N	\N	\N	\N
22946	1182	30	3	\N	\N	\N	\N
22947	1182	31	4	\N	\N	\N	\N
22948	1182	32	3	\N	\N	\N	\N
22949	1182	33	2	\N	\N	\N	\N
22950	1182	34	4	\N	\N	\N	\N
22951	1182	35	4	\N	\N	\N	\N
22952	1182	36	4	\N	\N	\N	\N
22953	1182	37	4	\N	\N	\N	\N
22954	1182	38	4	\N	\N	\N	\N
22955	1182	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.716	MODELO
22956	1182	26	\N	Nada en particular, mantener el mismo nivel.	POSITIVO	0.92	MODELO
22957	1181	18	4	\N	\N	\N	\N
22958	1181	19	4	\N	\N	\N	\N
22959	1181	20	4	\N	\N	\N	\N
22960	1181	21	4	\N	\N	\N	\N
22961	1181	22	4	\N	\N	\N	\N
22962	1181	23	4	\N	\N	\N	\N
22963	1181	24	1	\N	\N	\N	\N
22964	1181	27	4	\N	\N	\N	\N
22965	1181	28	4	\N	\N	\N	\N
22966	1181	29	2	\N	\N	\N	\N
22967	1181	30	4	\N	\N	\N	\N
22968	1181	31	4	\N	\N	\N	\N
22969	1181	32	4	\N	\N	\N	\N
22970	1181	33	1	\N	\N	\N	\N
22971	1181	34	4	\N	\N	\N	\N
22972	1181	35	4	\N	\N	\N	\N
22973	1181	36	4	\N	\N	\N	\N
22974	1181	37	4	\N	\N	\N	\N
22975	1181	38	4	\N	\N	\N	\N
22976	1181	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.796	MODELO
22977	1181	26	\N	Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.	POSITIVO	0.973	MODELO
22978	1180	18	1	\N	\N	\N	\N
22979	1180	19	4	\N	\N	\N	\N
22980	1180	20	3	\N	\N	\N	\N
22981	1180	21	2	\N	\N	\N	\N
22982	1180	22	4	\N	\N	\N	\N
22983	1180	23	4	\N	\N	\N	\N
22984	1180	24	4	\N	\N	\N	\N
22985	1180	27	1	\N	\N	\N	\N
22986	1180	28	3	\N	\N	\N	\N
22987	1180	29	4	\N	\N	\N	\N
22988	1180	30	3	\N	\N	\N	\N
22989	1180	31	3	\N	\N	\N	\N
22990	1180	32	4	\N	\N	\N	\N
22991	1180	33	4	\N	\N	\N	\N
22992	1180	34	4	\N	\N	\N	\N
22993	1180	35	4	\N	\N	\N	\N
22994	1180	36	4	\N	\N	\N	\N
22995	1180	37	4	\N	\N	\N	\N
22996	1180	38	4	\N	\N	\N	\N
22997	1180	25	\N	Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.	POSITIVO	0.801	MODELO
22998	1180	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.953	MODELO
22999	1179	18	4	\N	\N	\N	\N
23000	1179	19	3	\N	\N	\N	\N
23001	1179	20	4	\N	\N	\N	\N
23002	1179	21	3	\N	\N	\N	\N
23003	1179	22	4	\N	\N	\N	\N
23004	1179	23	2	\N	\N	\N	\N
23005	1179	24	3	\N	\N	\N	\N
23006	1179	27	4	\N	\N	\N	\N
23007	1179	28	4	\N	\N	\N	\N
23008	1179	29	4	\N	\N	\N	\N
23009	1179	30	4	\N	\N	\N	\N
23010	1179	31	4	\N	\N	\N	\N
23013	1179	34	4	\N	\N	\N	\N
23014	1179	35	4	\N	\N	\N	\N
23015	1179	36	4	\N	\N	\N	\N
23016	1179	37	3	\N	\N	\N	\N
23017	1179	38	1	\N	\N	\N	\N
23018	1179	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.705	MODELO
23019	1179	26	\N	Tal vez más talleres cortos, pero en general el curso estuvo muy bien.	POSITIVO	0.935	MODELO
23020	1178	18	4	\N	\N	\N	\N
23021	1178	19	4	\N	\N	\N	\N
23022	1178	20	4	\N	\N	\N	\N
23023	1178	21	4	\N	\N	\N	\N
23024	1178	22	4	\N	\N	\N	\N
23025	1178	23	2	\N	\N	\N	\N
23026	1178	24	4	\N	\N	\N	\N
23027	1178	27	3	\N	\N	\N	\N
23028	1178	28	4	\N	\N	\N	\N
23029	1178	29	3	\N	\N	\N	\N
23030	1178	30	4	\N	\N	\N	\N
23031	1178	31	4	\N	\N	\N	\N
23032	1178	32	4	\N	\N	\N	\N
23033	1178	33	4	\N	\N	\N	\N
23034	1178	34	4	\N	\N	\N	\N
23035	1178	35	2	\N	\N	\N	\N
23036	1178	36	4	\N	\N	\N	\N
23037	1178	37	4	\N	\N	\N	\N
23038	1178	38	3	\N	\N	\N	\N
23039	1178	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.954	MODELO
23040	1178	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.813	MODELO
23041	1177	18	4	\N	\N	\N	\N
23042	1177	19	4	\N	\N	\N	\N
23043	1177	20	4	\N	\N	\N	\N
23044	1177	21	3	\N	\N	\N	\N
23045	1177	22	4	\N	\N	\N	\N
23046	1177	23	4	\N	\N	\N	\N
23047	1177	24	4	\N	\N	\N	\N
23048	1177	27	4	\N	\N	\N	\N
23049	1177	28	4	\N	\N	\N	\N
23050	1177	29	4	\N	\N	\N	\N
23051	1177	30	4	\N	\N	\N	\N
23052	1177	31	3	\N	\N	\N	\N
23053	1177	32	4	\N	\N	\N	\N
23054	1177	33	4	\N	\N	\N	\N
23055	1177	34	4	\N	\N	\N	\N
23056	1177	35	3	\N	\N	\N	\N
23057	1177	36	2	\N	\N	\N	\N
23058	1177	37	3	\N	\N	\N	\N
23059	1177	38	4	\N	\N	\N	\N
23060	1177	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.724	MODELO
23061	1177	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.895	MODELO
23062	1176	18	4	\N	\N	\N	\N
23063	1176	19	4	\N	\N	\N	\N
23064	1176	20	3	\N	\N	\N	\N
23065	1176	21	4	\N	\N	\N	\N
23066	1176	22	2	\N	\N	\N	\N
23067	1176	23	4	\N	\N	\N	\N
23068	1176	24	4	\N	\N	\N	\N
23069	1176	27	3	\N	\N	\N	\N
23070	1176	28	2	\N	\N	\N	\N
23071	1176	29	4	\N	\N	\N	\N
23072	1176	30	4	\N	\N	\N	\N
23073	1176	31	4	\N	\N	\N	\N
23074	1176	32	2	\N	\N	\N	\N
23075	1176	33	4	\N	\N	\N	\N
23076	1176	34	4	\N	\N	\N	\N
23077	1176	35	4	\N	\N	\N	\N
23078	1176	36	3	\N	\N	\N	\N
23079	1176	37	4	\N	\N	\N	\N
23080	1176	38	4	\N	\N	\N	\N
23081	1176	25	\N	Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.	POSITIVO	0.857	MODELO
23082	1176	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.746	MODELO
23083	1175	18	4	\N	\N	\N	\N
23084	1175	19	3	\N	\N	\N	\N
23085	1175	20	4	\N	\N	\N	\N
23086	1175	21	4	\N	\N	\N	\N
23087	1175	22	4	\N	\N	\N	\N
23088	1175	23	3	\N	\N	\N	\N
23089	1175	24	4	\N	\N	\N	\N
23090	1175	27	3	\N	\N	\N	\N
23091	1175	28	3	\N	\N	\N	\N
23092	1175	29	3	\N	\N	\N	\N
23093	1175	30	4	\N	\N	\N	\N
23094	1175	31	4	\N	\N	\N	\N
23095	1175	32	4	\N	\N	\N	\N
23096	1175	33	3	\N	\N	\N	\N
23097	1175	34	1	\N	\N	\N	\N
23098	1175	35	4	\N	\N	\N	\N
23099	1175	36	4	\N	\N	\N	\N
23100	1175	37	3	\N	\N	\N	\N
23101	1175	38	4	\N	\N	\N	\N
23102	1175	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.655	MODELO
23103	1175	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.713	MODELO
23104	1174	18	4	\N	\N	\N	\N
23105	1174	19	4	\N	\N	\N	\N
23106	1174	20	4	\N	\N	\N	\N
23107	1174	21	3	\N	\N	\N	\N
23108	1174	22	3	\N	\N	\N	\N
23109	1174	23	4	\N	\N	\N	\N
23110	1174	24	4	\N	\N	\N	\N
23111	1174	27	4	\N	\N	\N	\N
23112	1174	28	3	\N	\N	\N	\N
23113	1174	29	2	\N	\N	\N	\N
23114	1174	30	4	\N	\N	\N	\N
23115	1174	31	4	\N	\N	\N	\N
23116	1174	32	3	\N	\N	\N	\N
23117	1174	33	4	\N	\N	\N	\N
23118	1174	34	4	\N	\N	\N	\N
23119	1174	35	4	\N	\N	\N	\N
23120	1174	36	4	\N	\N	\N	\N
23121	1174	37	4	\N	\N	\N	\N
23122	1174	38	4	\N	\N	\N	\N
23123	1174	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.717	MODELO
23124	1174	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.879	MODELO
23125	1173	18	4	\N	\N	\N	\N
23126	1173	19	4	\N	\N	\N	\N
23127	1173	20	4	\N	\N	\N	\N
23128	1173	21	3	\N	\N	\N	\N
23129	1173	22	3	\N	\N	\N	\N
23130	1173	23	4	\N	\N	\N	\N
23131	1173	24	3	\N	\N	\N	\N
23132	1173	27	4	\N	\N	\N	\N
23133	1173	28	4	\N	\N	\N	\N
23134	1173	29	3	\N	\N	\N	\N
23135	1173	30	4	\N	\N	\N	\N
23136	1173	31	4	\N	\N	\N	\N
23137	1173	32	1	\N	\N	\N	\N
23138	1173	33	4	\N	\N	\N	\N
23139	1173	34	4	\N	\N	\N	\N
23140	1173	35	4	\N	\N	\N	\N
23141	1173	36	4	\N	\N	\N	\N
23142	1173	37	4	\N	\N	\N	\N
23143	1173	38	4	\N	\N	\N	\N
23144	1173	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.717	MODELO
23145	1173	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.733	MODELO
23146	1172	18	3	\N	\N	\N	\N
23147	1172	19	2	\N	\N	\N	\N
23148	1172	20	4	\N	\N	\N	\N
23149	1172	21	3	\N	\N	\N	\N
23150	1172	22	4	\N	\N	\N	\N
23151	1172	23	4	\N	\N	\N	\N
23152	1172	24	4	\N	\N	\N	\N
23153	1172	27	4	\N	\N	\N	\N
23154	1172	28	3	\N	\N	\N	\N
23155	1172	29	4	\N	\N	\N	\N
23156	1172	30	4	\N	\N	\N	\N
23157	1172	31	4	\N	\N	\N	\N
23158	1172	32	4	\N	\N	\N	\N
23159	1172	33	4	\N	\N	\N	\N
23160	1172	34	2	\N	\N	\N	\N
23161	1172	35	3	\N	\N	\N	\N
23162	1172	36	1	\N	\N	\N	\N
23163	1172	37	4	\N	\N	\N	\N
23164	1172	38	4	\N	\N	\N	\N
23165	1172	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.709	MODELO
23166	1172	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.799	MODELO
23167	1171	18	4	\N	\N	\N	\N
23168	1171	19	4	\N	\N	\N	\N
23169	1171	20	4	\N	\N	\N	\N
23170	1171	21	3	\N	\N	\N	\N
23171	1171	22	4	\N	\N	\N	\N
23172	1171	23	4	\N	\N	\N	\N
23173	1171	24	4	\N	\N	\N	\N
23174	1171	27	4	\N	\N	\N	\N
23175	1171	28	4	\N	\N	\N	\N
23176	1171	29	4	\N	\N	\N	\N
23177	1171	30	4	\N	\N	\N	\N
23178	1171	31	3	\N	\N	\N	\N
23179	1171	32	2	\N	\N	\N	\N
23180	1171	33	4	\N	\N	\N	\N
23181	1171	34	2	\N	\N	\N	\N
23182	1171	35	4	\N	\N	\N	\N
23183	1171	36	4	\N	\N	\N	\N
23184	1171	37	4	\N	\N	\N	\N
23185	1171	38	4	\N	\N	\N	\N
23186	1171	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.84	MODELO
23187	1171	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.89	MODELO
23188	1170	18	4	\N	\N	\N	\N
23189	1170	19	4	\N	\N	\N	\N
23190	1170	20	3	\N	\N	\N	\N
23191	1170	21	4	\N	\N	\N	\N
23192	1170	22	4	\N	\N	\N	\N
23193	1170	23	4	\N	\N	\N	\N
23194	1170	24	4	\N	\N	\N	\N
23195	1170	27	4	\N	\N	\N	\N
23196	1170	28	4	\N	\N	\N	\N
23197	1170	29	4	\N	\N	\N	\N
23198	1170	30	3	\N	\N	\N	\N
23199	1170	31	4	\N	\N	\N	\N
23200	1170	32	4	\N	\N	\N	\N
23201	1170	33	4	\N	\N	\N	\N
23202	1170	34	4	\N	\N	\N	\N
23203	1170	35	3	\N	\N	\N	\N
23204	1170	36	1	\N	\N	\N	\N
23205	1170	37	4	\N	\N	\N	\N
23206	1170	38	4	\N	\N	\N	\N
23207	1170	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.883	MODELO
23208	1170	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.934	MODELO
23209	1169	18	4	\N	\N	\N	\N
23210	1169	19	1	\N	\N	\N	\N
23211	1169	20	4	\N	\N	\N	\N
23212	1169	21	4	\N	\N	\N	\N
23213	1169	22	3	\N	\N	\N	\N
23214	1169	23	4	\N	\N	\N	\N
23215	1169	24	3	\N	\N	\N	\N
23216	1169	27	4	\N	\N	\N	\N
23217	1169	28	1	\N	\N	\N	\N
23218	1169	29	4	\N	\N	\N	\N
23219	1169	30	3	\N	\N	\N	\N
23220	1169	31	4	\N	\N	\N	\N
23221	1169	32	3	\N	\N	\N	\N
23222	1169	33	4	\N	\N	\N	\N
23223	1169	34	4	\N	\N	\N	\N
23224	1169	35	4	\N	\N	\N	\N
23225	1169	36	4	\N	\N	\N	\N
23226	1169	37	2	\N	\N	\N	\N
23227	1169	38	3	\N	\N	\N	\N
23228	1169	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.739	MODELO
23229	1169	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.68	MODELO
23230	931	18	3	\N	\N	\N	\N
23231	931	19	3	\N	\N	\N	\N
23232	931	20	1	\N	\N	\N	\N
23233	931	21	1	\N	\N	\N	\N
23234	931	22	3	\N	\N	\N	\N
23235	931	23	3	\N	\N	\N	\N
23236	931	24	2	\N	\N	\N	\N
23237	931	27	4	\N	\N	\N	\N
23238	931	28	1	\N	\N	\N	\N
23239	931	29	3	\N	\N	\N	\N
23240	931	30	1	\N	\N	\N	\N
23241	931	31	3	\N	\N	\N	\N
23242	931	32	3	\N	\N	\N	\N
23243	931	33	4	\N	\N	\N	\N
23244	931	34	3	\N	\N	\N	\N
23245	931	35	2	\N	\N	\N	\N
23246	931	36	3	\N	\N	\N	\N
23247	931	37	4	\N	\N	\N	\N
23248	931	38	3	\N	\N	\N	\N
23249	931	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.838	MODELO
23250	931	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.805	MODELO
23251	930	18	3	\N	\N	\N	\N
23252	930	19	2	\N	\N	\N	\N
23253	930	20	2	\N	\N	\N	\N
23254	930	21	2	\N	\N	\N	\N
23255	930	22	3	\N	\N	\N	\N
23256	930	23	3	\N	\N	\N	\N
23257	930	24	4	\N	\N	\N	\N
23258	930	27	3	\N	\N	\N	\N
23259	930	28	3	\N	\N	\N	\N
23260	930	29	2	\N	\N	\N	\N
23261	930	30	2	\N	\N	\N	\N
23262	930	31	3	\N	\N	\N	\N
23263	930	32	3	\N	\N	\N	\N
23264	930	33	4	\N	\N	\N	\N
23265	930	34	2	\N	\N	\N	\N
23266	930	35	2	\N	\N	\N	\N
23267	930	36	2	\N	\N	\N	\N
23268	930	37	4	\N	\N	\N	\N
23269	930	38	2	\N	\N	\N	\N
23270	930	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.91	MODELO
23271	930	26	\N	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.921	MODELO
23272	929	18	3	\N	\N	\N	\N
23273	929	19	2	\N	\N	\N	\N
23274	929	20	4	\N	\N	\N	\N
23275	929	21	4	\N	\N	\N	\N
23276	929	22	1	\N	\N	\N	\N
23277	929	23	4	\N	\N	\N	\N
23278	929	24	3	\N	\N	\N	\N
23279	929	27	2	\N	\N	\N	\N
23280	929	28	1	\N	\N	\N	\N
23281	929	29	1	\N	\N	\N	\N
23282	929	30	4	\N	\N	\N	\N
23283	929	31	2	\N	\N	\N	\N
23284	929	32	2	\N	\N	\N	\N
23285	929	33	2	\N	\N	\N	\N
23286	929	34	3	\N	\N	\N	\N
23287	929	35	3	\N	\N	\N	\N
23288	929	36	2	\N	\N	\N	\N
23289	929	37	2	\N	\N	\N	\N
23290	929	38	3	\N	\N	\N	\N
23291	929	25	\N	Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.	POSITIVO	0.768	MODELO
23292	929	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.627	MODELO
23293	928	18	3	\N	\N	\N	\N
23294	928	19	4	\N	\N	\N	\N
23295	928	20	1	\N	\N	\N	\N
23296	928	21	2	\N	\N	\N	\N
23297	928	22	3	\N	\N	\N	\N
23298	928	23	3	\N	\N	\N	\N
23299	928	24	3	\N	\N	\N	\N
23300	928	27	2	\N	\N	\N	\N
23301	928	28	2	\N	\N	\N	\N
23302	928	29	1	\N	\N	\N	\N
23303	928	30	2	\N	\N	\N	\N
23304	928	31	3	\N	\N	\N	\N
23305	928	32	2	\N	\N	\N	\N
23306	928	33	4	\N	\N	\N	\N
23307	928	34	2	\N	\N	\N	\N
23308	928	35	1	\N	\N	\N	\N
23309	928	36	2	\N	\N	\N	\N
23310	928	37	3	\N	\N	\N	\N
23311	928	38	3	\N	\N	\N	\N
23312	928	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.733	MODELO
23313	928	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.712	MODELO
23314	927	18	3	\N	\N	\N	\N
23315	927	19	4	\N	\N	\N	\N
23316	927	20	2	\N	\N	\N	\N
23317	927	21	2	\N	\N	\N	\N
23318	927	22	3	\N	\N	\N	\N
23319	927	23	2	\N	\N	\N	\N
23320	927	24	2	\N	\N	\N	\N
23321	927	27	1	\N	\N	\N	\N
23322	927	28	3	\N	\N	\N	\N
23323	927	29	3	\N	\N	\N	\N
23324	927	30	3	\N	\N	\N	\N
23325	927	31	2	\N	\N	\N	\N
23326	927	32	2	\N	\N	\N	\N
23327	927	33	2	\N	\N	\N	\N
23328	927	34	3	\N	\N	\N	\N
23329	927	35	1	\N	\N	\N	\N
23330	927	36	3	\N	\N	\N	\N
23331	927	37	3	\N	\N	\N	\N
23332	927	38	4	\N	\N	\N	\N
23333	927	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.74	MODELO
23334	927	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.944	MODELO
23335	926	18	2	\N	\N	\N	\N
23336	926	19	1	\N	\N	\N	\N
23337	926	20	1	\N	\N	\N	\N
23338	926	21	2	\N	\N	\N	\N
23339	926	22	2	\N	\N	\N	\N
23340	926	23	2	\N	\N	\N	\N
23341	926	24	3	\N	\N	\N	\N
23342	926	27	2	\N	\N	\N	\N
23343	926	28	3	\N	\N	\N	\N
23344	926	29	3	\N	\N	\N	\N
23345	926	30	4	\N	\N	\N	\N
23346	926	31	2	\N	\N	\N	\N
23347	926	32	2	\N	\N	\N	\N
23348	926	33	2	\N	\N	\N	\N
23349	926	34	2	\N	\N	\N	\N
23350	926	35	2	\N	\N	\N	\N
23351	926	36	3	\N	\N	\N	\N
23352	926	37	3	\N	\N	\N	\N
23353	926	38	2	\N	\N	\N	\N
23354	926	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.629	MODELO
23355	926	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.86	MODELO
23356	925	18	1	\N	\N	\N	\N
23357	925	19	3	\N	\N	\N	\N
23358	925	20	2	\N	\N	\N	\N
23359	925	21	2	\N	\N	\N	\N
23360	925	22	3	\N	\N	\N	\N
23361	925	23	1	\N	\N	\N	\N
23362	925	24	4	\N	\N	\N	\N
23363	925	27	2	\N	\N	\N	\N
23364	925	28	2	\N	\N	\N	\N
23365	925	29	2	\N	\N	\N	\N
23366	925	30	1	\N	\N	\N	\N
23367	925	31	1	\N	\N	\N	\N
23368	925	32	3	\N	\N	\N	\N
23369	925	33	3	\N	\N	\N	\N
23370	925	34	3	\N	\N	\N	\N
23371	925	35	3	\N	\N	\N	\N
23372	925	36	3	\N	\N	\N	\N
23373	925	37	2	\N	\N	\N	\N
23374	925	38	4	\N	\N	\N	\N
23375	925	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.712	MODELO
23376	925	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.929	MODELO
23377	924	18	4	\N	\N	\N	\N
23378	924	19	1	\N	\N	\N	\N
23379	924	20	3	\N	\N	\N	\N
23380	924	21	4	\N	\N	\N	\N
23381	924	22	2	\N	\N	\N	\N
23382	924	23	2	\N	\N	\N	\N
23383	924	24	4	\N	\N	\N	\N
23384	924	27	3	\N	\N	\N	\N
23385	924	28	3	\N	\N	\N	\N
23386	924	29	2	\N	\N	\N	\N
23387	924	30	3	\N	\N	\N	\N
23388	924	31	3	\N	\N	\N	\N
23389	924	32	3	\N	\N	\N	\N
23390	924	33	3	\N	\N	\N	\N
23391	924	34	2	\N	\N	\N	\N
23392	924	35	3	\N	\N	\N	\N
23393	924	36	3	\N	\N	\N	\N
23394	924	37	3	\N	\N	\N	\N
23395	924	38	2	\N	\N	\N	\N
23396	924	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.893	MODELO
23397	924	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.61	MODELO
23398	923	18	4	\N	\N	\N	\N
23399	923	19	3	\N	\N	\N	\N
23400	923	20	1	\N	\N	\N	\N
23401	923	21	3	\N	\N	\N	\N
23402	923	22	4	\N	\N	\N	\N
23403	923	23	2	\N	\N	\N	\N
23404	923	24	2	\N	\N	\N	\N
23405	923	27	4	\N	\N	\N	\N
23406	923	28	3	\N	\N	\N	\N
23407	923	29	3	\N	\N	\N	\N
23408	923	30	4	\N	\N	\N	\N
23409	923	31	3	\N	\N	\N	\N
23410	923	32	4	\N	\N	\N	\N
23411	923	33	3	\N	\N	\N	\N
23412	923	34	2	\N	\N	\N	\N
23413	923	35	1	\N	\N	\N	\N
23414	923	36	3	\N	\N	\N	\N
23415	923	37	2	\N	\N	\N	\N
23416	923	38	2	\N	\N	\N	\N
23417	923	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.724	MODELO
23418	923	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.693	MODELO
23419	922	18	3	\N	\N	\N	\N
23420	922	19	3	\N	\N	\N	\N
23421	922	20	3	\N	\N	\N	\N
23422	922	21	2	\N	\N	\N	\N
23423	922	22	3	\N	\N	\N	\N
23424	922	23	1	\N	\N	\N	\N
23425	922	24	3	\N	\N	\N	\N
23426	922	27	3	\N	\N	\N	\N
23427	922	28	2	\N	\N	\N	\N
23428	922	29	3	\N	\N	\N	\N
23429	922	30	4	\N	\N	\N	\N
23430	922	31	2	\N	\N	\N	\N
23431	922	32	3	\N	\N	\N	\N
23432	922	33	2	\N	\N	\N	\N
23433	922	34	4	\N	\N	\N	\N
23434	922	35	2	\N	\N	\N	\N
23435	922	36	4	\N	\N	\N	\N
23436	922	37	3	\N	\N	\N	\N
23437	922	38	4	\N	\N	\N	\N
23438	922	25	\N	Es exigente pero justo, uno sale de la clase sabiendo de verdad.	POSITIVO	0.871	MODELO
23439	922	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.715	MODELO
23440	921	18	3	\N	\N	\N	\N
23441	921	19	2	\N	\N	\N	\N
23442	921	20	1	\N	\N	\N	\N
23443	921	21	2	\N	\N	\N	\N
23444	921	22	3	\N	\N	\N	\N
23445	921	23	4	\N	\N	\N	\N
23446	921	24	2	\N	\N	\N	\N
23447	921	27	2	\N	\N	\N	\N
23448	921	28	4	\N	\N	\N	\N
23449	921	29	4	\N	\N	\N	\N
23450	921	30	3	\N	\N	\N	\N
23451	921	31	2	\N	\N	\N	\N
23452	921	32	3	\N	\N	\N	\N
23453	921	33	2	\N	\N	\N	\N
23454	921	34	2	\N	\N	\N	\N
23455	921	35	3	\N	\N	\N	\N
23456	921	36	2	\N	\N	\N	\N
23457	921	37	4	\N	\N	\N	\N
23458	921	38	3	\N	\N	\N	\N
23459	921	25	\N	No sé, llegaba tarde, improvisaba y no respondía mensajes.	NEGATIVO	0.866	MODELO
23460	921	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.717	MODELO
23461	920	18	1	\N	\N	\N	\N
23462	920	19	4	\N	\N	\N	\N
23463	920	20	2	\N	\N	\N	\N
23464	920	21	2	\N	\N	\N	\N
23465	920	22	2	\N	\N	\N	\N
23466	920	23	2	\N	\N	\N	\N
23467	920	24	3	\N	\N	\N	\N
23468	920	27	3	\N	\N	\N	\N
23469	920	28	3	\N	\N	\N	\N
23470	920	29	3	\N	\N	\N	\N
23471	920	30	3	\N	\N	\N	\N
23472	920	31	1	\N	\N	\N	\N
23473	920	32	2	\N	\N	\N	\N
23474	920	33	1	\N	\N	\N	\N
23475	920	34	2	\N	\N	\N	\N
23476	920	35	3	\N	\N	\N	\N
23477	920	36	2	\N	\N	\N	\N
23478	920	37	3	\N	\N	\N	\N
23479	920	38	3	\N	\N	\N	\N
23480	920	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.763	MODELO
23481	920	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.805	MODELO
23482	919	18	3	\N	\N	\N	\N
23483	919	19	1	\N	\N	\N	\N
23484	919	20	3	\N	\N	\N	\N
23485	919	21	2	\N	\N	\N	\N
23486	919	22	4	\N	\N	\N	\N
23487	919	23	2	\N	\N	\N	\N
23488	919	24	3	\N	\N	\N	\N
23489	919	27	4	\N	\N	\N	\N
23490	919	28	3	\N	\N	\N	\N
23491	919	29	2	\N	\N	\N	\N
23492	919	30	4	\N	\N	\N	\N
23493	919	31	3	\N	\N	\N	\N
23494	919	32	4	\N	\N	\N	\N
23495	919	33	2	\N	\N	\N	\N
23496	919	34	4	\N	\N	\N	\N
23497	919	35	2	\N	\N	\N	\N
23498	919	36	3	\N	\N	\N	\N
23499	919	37	2	\N	\N	\N	\N
23500	919	38	3	\N	\N	\N	\N
23501	919	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.944	MODELO
23502	919	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.664	MODELO
23503	918	18	3	\N	\N	\N	\N
23504	918	19	3	\N	\N	\N	\N
23505	918	20	4	\N	\N	\N	\N
23506	918	21	3	\N	\N	\N	\N
23507	918	22	2	\N	\N	\N	\N
23508	918	23	2	\N	\N	\N	\N
23509	918	24	3	\N	\N	\N	\N
23510	918	27	2	\N	\N	\N	\N
23511	918	28	2	\N	\N	\N	\N
23512	918	29	2	\N	\N	\N	\N
23513	918	30	2	\N	\N	\N	\N
23514	918	31	2	\N	\N	\N	\N
23515	918	32	3	\N	\N	\N	\N
23516	918	33	3	\N	\N	\N	\N
23517	918	34	3	\N	\N	\N	\N
23518	918	35	2	\N	\N	\N	\N
23519	918	36	2	\N	\N	\N	\N
23520	918	37	1	\N	\N	\N	\N
23521	918	38	3	\N	\N	\N	\N
23522	918	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.844	MODELO
23523	918	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.529	MODELO
23524	917	18	2	\N	\N	\N	\N
23525	917	19	3	\N	\N	\N	\N
23526	917	20	2	\N	\N	\N	\N
23527	917	21	3	\N	\N	\N	\N
23528	917	22	1	\N	\N	\N	\N
23529	917	23	2	\N	\N	\N	\N
23530	917	24	4	\N	\N	\N	\N
23531	917	27	3	\N	\N	\N	\N
23532	917	28	3	\N	\N	\N	\N
23533	917	29	3	\N	\N	\N	\N
23534	917	30	3	\N	\N	\N	\N
23535	917	31	2	\N	\N	\N	\N
23536	917	32	3	\N	\N	\N	\N
23537	917	33	3	\N	\N	\N	\N
23538	917	34	2	\N	\N	\N	\N
23539	917	35	2	\N	\N	\N	\N
23540	917	36	3	\N	\N	\N	\N
23541	917	37	3	\N	\N	\N	\N
23542	917	38	3	\N	\N	\N	\N
23543	917	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.713	MODELO
23544	917	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.938	MODELO
23545	916	18	3	\N	\N	\N	\N
23546	916	19	2	\N	\N	\N	\N
23547	916	20	2	\N	\N	\N	\N
23548	916	21	3	\N	\N	\N	\N
23549	916	22	2	\N	\N	\N	\N
23550	916	23	3	\N	\N	\N	\N
23551	916	24	3	\N	\N	\N	\N
23552	916	27	4	\N	\N	\N	\N
23553	916	28	2	\N	\N	\N	\N
23554	916	29	3	\N	\N	\N	\N
23555	916	30	1	\N	\N	\N	\N
23556	916	31	4	\N	\N	\N	\N
23557	916	32	2	\N	\N	\N	\N
23558	916	33	2	\N	\N	\N	\N
23559	916	34	3	\N	\N	\N	\N
23560	916	35	2	\N	\N	\N	\N
23561	916	36	3	\N	\N	\N	\N
23562	916	37	3	\N	\N	\N	\N
23563	916	38	3	\N	\N	\N	\N
23564	916	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.716	MODELO
23565	916	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.765	MODELO
23566	915	18	1	\N	\N	\N	\N
23567	915	19	2	\N	\N	\N	\N
23568	915	20	4	\N	\N	\N	\N
23569	915	21	2	\N	\N	\N	\N
23570	915	22	2	\N	\N	\N	\N
23571	915	23	2	\N	\N	\N	\N
23572	915	24	3	\N	\N	\N	\N
23573	915	27	2	\N	\N	\N	\N
23574	915	28	2	\N	\N	\N	\N
23575	915	29	3	\N	\N	\N	\N
23576	915	30	3	\N	\N	\N	\N
23577	915	31	3	\N	\N	\N	\N
23578	915	32	2	\N	\N	\N	\N
23579	915	33	2	\N	\N	\N	\N
23580	915	34	3	\N	\N	\N	\N
23581	915	35	2	\N	\N	\N	\N
23582	915	36	2	\N	\N	\N	\N
23583	915	37	2	\N	\N	\N	\N
23584	915	38	4	\N	\N	\N	\N
23585	915	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.593	MODELO
23586	915	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.859	MODELO
23587	914	18	1	\N	\N	\N	\N
23588	914	19	1	\N	\N	\N	\N
23589	914	20	4	\N	\N	\N	\N
23590	914	21	3	\N	\N	\N	\N
23591	914	22	2	\N	\N	\N	\N
23592	914	23	1	\N	\N	\N	\N
23593	914	24	4	\N	\N	\N	\N
23594	914	27	3	\N	\N	\N	\N
23595	914	28	4	\N	\N	\N	\N
23596	914	29	3	\N	\N	\N	\N
23597	914	30	3	\N	\N	\N	\N
23598	914	31	3	\N	\N	\N	\N
23599	914	32	3	\N	\N	\N	\N
23600	914	33	3	\N	\N	\N	\N
23601	914	34	2	\N	\N	\N	\N
23602	914	35	3	\N	\N	\N	\N
23603	914	36	2	\N	\N	\N	\N
23604	914	37	2	\N	\N	\N	\N
23605	914	38	2	\N	\N	\N	\N
23606	914	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.875	MODELO
23607	914	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.766	MODELO
23608	913	18	2	\N	\N	\N	\N
23609	913	19	3	\N	\N	\N	\N
23610	913	20	3	\N	\N	\N	\N
23611	913	21	2	\N	\N	\N	\N
23612	913	22	1	\N	\N	\N	\N
23613	913	23	4	\N	\N	\N	\N
23614	913	24	2	\N	\N	\N	\N
23615	913	27	3	\N	\N	\N	\N
23616	913	28	1	\N	\N	\N	\N
23617	913	29	2	\N	\N	\N	\N
23618	913	30	2	\N	\N	\N	\N
23619	913	31	3	\N	\N	\N	\N
23620	913	32	2	\N	\N	\N	\N
23621	913	33	3	\N	\N	\N	\N
23622	913	34	4	\N	\N	\N	\N
23623	913	35	2	\N	\N	\N	\N
23624	913	36	2	\N	\N	\N	\N
23625	913	37	4	\N	\N	\N	\N
23626	913	38	2	\N	\N	\N	\N
23627	913	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.845	MODELO
23628	913	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.729	MODELO
23629	912	18	2	\N	\N	\N	\N
23630	912	19	4	\N	\N	\N	\N
23631	912	20	2	\N	\N	\N	\N
23632	912	21	4	\N	\N	\N	\N
23633	912	22	3	\N	\N	\N	\N
23634	912	23	3	\N	\N	\N	\N
23635	912	24	1	\N	\N	\N	\N
23636	912	27	2	\N	\N	\N	\N
23637	912	28	3	\N	\N	\N	\N
23638	912	29	3	\N	\N	\N	\N
23639	912	30	3	\N	\N	\N	\N
23640	912	31	2	\N	\N	\N	\N
23641	912	32	3	\N	\N	\N	\N
23642	912	33	2	\N	\N	\N	\N
23643	912	34	3	\N	\N	\N	\N
23644	912	35	2	\N	\N	\N	\N
23645	912	36	3	\N	\N	\N	\N
23646	912	37	3	\N	\N	\N	\N
23647	912	38	2	\N	\N	\N	\N
23648	912	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.74	MODELO
23649	912	26	\N	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.956	MODELO
23650	911	18	1	\N	\N	\N	\N
23651	911	19	2	\N	\N	\N	\N
23652	911	20	3	\N	\N	\N	\N
23653	911	21	2	\N	\N	\N	\N
23654	911	22	4	\N	\N	\N	\N
23655	911	23	3	\N	\N	\N	\N
23656	911	24	3	\N	\N	\N	\N
23657	911	27	2	\N	\N	\N	\N
23658	911	28	1	\N	\N	\N	\N
23659	911	29	1	\N	\N	\N	\N
23660	911	30	1	\N	\N	\N	\N
23661	911	31	2	\N	\N	\N	\N
23662	911	32	3	\N	\N	\N	\N
23663	911	33	3	\N	\N	\N	\N
23664	911	34	2	\N	\N	\N	\N
23665	911	35	3	\N	\N	\N	\N
23666	911	36	3	\N	\N	\N	\N
23667	911	37	3	\N	\N	\N	\N
23668	911	38	3	\N	\N	\N	\N
23669	911	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.713	MODELO
23670	911	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.775	MODELO
23671	910	18	4	\N	\N	\N	\N
23672	910	19	1	\N	\N	\N	\N
23673	910	20	2	\N	\N	\N	\N
23674	910	21	2	\N	\N	\N	\N
23675	910	22	2	\N	\N	\N	\N
23676	910	23	2	\N	\N	\N	\N
23677	910	24	3	\N	\N	\N	\N
23678	910	27	3	\N	\N	\N	\N
23679	910	28	2	\N	\N	\N	\N
23680	910	29	3	\N	\N	\N	\N
23681	910	30	3	\N	\N	\N	\N
23682	910	31	4	\N	\N	\N	\N
23683	910	32	2	\N	\N	\N	\N
23684	910	33	1	\N	\N	\N	\N
23685	910	34	3	\N	\N	\N	\N
23686	910	35	3	\N	\N	\N	\N
23687	910	36	3	\N	\N	\N	\N
23688	910	37	3	\N	\N	\N	\N
23689	910	38	2	\N	\N	\N	\N
23690	910	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.886	MODELO
23691	910	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.751	MODELO
23692	909	18	2	\N	\N	\N	\N
23693	909	19	2	\N	\N	\N	\N
23694	909	20	1	\N	\N	\N	\N
23695	909	21	3	\N	\N	\N	\N
23696	909	22	4	\N	\N	\N	\N
23697	909	23	3	\N	\N	\N	\N
23698	909	24	2	\N	\N	\N	\N
23699	909	27	3	\N	\N	\N	\N
23700	909	28	2	\N	\N	\N	\N
23701	909	29	3	\N	\N	\N	\N
23702	909	30	2	\N	\N	\N	\N
23703	909	31	3	\N	\N	\N	\N
23704	909	32	2	\N	\N	\N	\N
23705	909	33	2	\N	\N	\N	\N
23706	909	34	2	\N	\N	\N	\N
23707	909	35	1	\N	\N	\N	\N
23708	909	36	2	\N	\N	\N	\N
23709	909	37	3	\N	\N	\N	\N
23710	909	38	3	\N	\N	\N	\N
23711	909	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.745	MODELO
23712	909	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.972	MODELO
23713	908	18	3	\N	\N	\N	\N
23714	908	19	3	\N	\N	\N	\N
23715	908	20	2	\N	\N	\N	\N
23716	908	21	3	\N	\N	\N	\N
23717	908	22	2	\N	\N	\N	\N
23718	908	23	4	\N	\N	\N	\N
23719	908	24	1	\N	\N	\N	\N
23720	908	27	3	\N	\N	\N	\N
23721	908	28	2	\N	\N	\N	\N
23722	908	29	2	\N	\N	\N	\N
23723	908	30	3	\N	\N	\N	\N
23724	908	31	2	\N	\N	\N	\N
23725	908	32	4	\N	\N	\N	\N
23726	908	33	3	\N	\N	\N	\N
23727	908	34	4	\N	\N	\N	\N
23728	908	35	2	\N	\N	\N	\N
23729	908	36	4	\N	\N	\N	\N
23730	908	37	2	\N	\N	\N	\N
23731	908	38	3	\N	\N	\N	\N
23732	908	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.908	MODELO
23733	908	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.77	MODELO
23734	907	18	3	\N	\N	\N	\N
23735	907	19	3	\N	\N	\N	\N
23736	907	20	2	\N	\N	\N	\N
23737	907	21	3	\N	\N	\N	\N
23738	907	22	4	\N	\N	\N	\N
23739	907	23	2	\N	\N	\N	\N
23740	907	24	2	\N	\N	\N	\N
23741	907	27	3	\N	\N	\N	\N
23742	907	28	3	\N	\N	\N	\N
23743	907	29	3	\N	\N	\N	\N
23744	907	30	3	\N	\N	\N	\N
23745	907	31	2	\N	\N	\N	\N
23746	907	32	3	\N	\N	\N	\N
23747	907	33	4	\N	\N	\N	\N
23748	907	34	4	\N	\N	\N	\N
23749	907	35	2	\N	\N	\N	\N
23750	907	36	3	\N	\N	\N	\N
23751	907	37	4	\N	\N	\N	\N
23752	907	38	3	\N	\N	\N	\N
23753	907	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.895	MODELO
23754	907	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.96	MODELO
23755	906	18	3	\N	\N	\N	\N
23756	906	19	3	\N	\N	\N	\N
23757	906	20	2	\N	\N	\N	\N
23758	906	21	1	\N	\N	\N	\N
23759	906	22	2	\N	\N	\N	\N
23760	906	23	4	\N	\N	\N	\N
23761	906	24	4	\N	\N	\N	\N
23762	906	27	3	\N	\N	\N	\N
23763	906	28	2	\N	\N	\N	\N
23764	906	29	3	\N	\N	\N	\N
23765	906	30	3	\N	\N	\N	\N
23766	906	31	3	\N	\N	\N	\N
23767	906	32	3	\N	\N	\N	\N
23768	906	33	4	\N	\N	\N	\N
23769	906	34	3	\N	\N	\N	\N
23770	906	35	3	\N	\N	\N	\N
23771	906	36	3	\N	\N	\N	\N
23772	906	37	1	\N	\N	\N	\N
23773	906	38	3	\N	\N	\N	\N
23774	906	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.731	MODELO
23775	906	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.561	MODELO
23776	905	18	3	\N	\N	\N	\N
23777	905	19	2	\N	\N	\N	\N
23778	905	20	3	\N	\N	\N	\N
23779	905	21	1	\N	\N	\N	\N
23780	905	22	2	\N	\N	\N	\N
23781	905	23	3	\N	\N	\N	\N
23782	905	24	2	\N	\N	\N	\N
23783	905	27	3	\N	\N	\N	\N
23784	905	28	1	\N	\N	\N	\N
23785	905	29	3	\N	\N	\N	\N
23786	905	30	4	\N	\N	\N	\N
23787	905	31	3	\N	\N	\N	\N
23788	905	32	2	\N	\N	\N	\N
23789	905	33	3	\N	\N	\N	\N
23790	905	34	2	\N	\N	\N	\N
23791	905	35	4	\N	\N	\N	\N
23792	905	36	4	\N	\N	\N	\N
23793	905	37	3	\N	\N	\N	\N
23794	905	38	2	\N	\N	\N	\N
23795	905	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.51	MODELO
23796	905	26	\N	Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.	NEGATIVO	0.877	MODELO
23797	904	18	3	\N	\N	\N	\N
23798	904	19	2	\N	\N	\N	\N
23799	904	20	1	\N	\N	\N	\N
23800	904	21	3	\N	\N	\N	\N
23801	904	22	3	\N	\N	\N	\N
23802	904	23	3	\N	\N	\N	\N
23803	904	24	3	\N	\N	\N	\N
23804	904	27	3	\N	\N	\N	\N
23805	904	28	2	\N	\N	\N	\N
23806	904	29	3	\N	\N	\N	\N
23807	904	30	3	\N	\N	\N	\N
23808	904	31	2	\N	\N	\N	\N
23809	904	32	3	\N	\N	\N	\N
23810	904	33	1	\N	\N	\N	\N
23811	904	34	2	\N	\N	\N	\N
23812	904	35	3	\N	\N	\N	\N
23813	904	36	3	\N	\N	\N	\N
23814	904	37	2	\N	\N	\N	\N
23815	904	38	4	\N	\N	\N	\N
23816	904	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.849	MODELO
23817	904	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.975	MODELO
23818	903	18	3	\N	\N	\N	\N
23819	903	19	3	\N	\N	\N	\N
23820	903	20	3	\N	\N	\N	\N
23821	903	21	4	\N	\N	\N	\N
23822	903	22	3	\N	\N	\N	\N
23823	903	23	2	\N	\N	\N	\N
23824	903	24	1	\N	\N	\N	\N
23825	903	27	3	\N	\N	\N	\N
23826	903	28	2	\N	\N	\N	\N
23827	903	29	2	\N	\N	\N	\N
23828	903	30	4	\N	\N	\N	\N
23829	903	31	3	\N	\N	\N	\N
23830	903	32	3	\N	\N	\N	\N
23831	903	33	4	\N	\N	\N	\N
23832	903	34	3	\N	\N	\N	\N
23833	903	35	1	\N	\N	\N	\N
23834	903	36	2	\N	\N	\N	\N
23835	903	37	3	\N	\N	\N	\N
23836	903	38	4	\N	\N	\N	\N
23953	897	29	2	\N	\N	\N	\N
23954	897	30	3	\N	\N	\N	\N
23837	903	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.924	MODELO
23838	903	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.741	MODELO
23839	902	18	2	\N	\N	\N	\N
23840	902	19	2	\N	\N	\N	\N
23841	902	20	2	\N	\N	\N	\N
23842	902	21	2	\N	\N	\N	\N
23843	902	22	3	\N	\N	\N	\N
23844	902	23	3	\N	\N	\N	\N
23845	902	24	2	\N	\N	\N	\N
23846	902	27	1	\N	\N	\N	\N
23847	902	28	3	\N	\N	\N	\N
23848	902	29	3	\N	\N	\N	\N
23849	902	30	3	\N	\N	\N	\N
23850	902	31	3	\N	\N	\N	\N
23851	902	32	1	\N	\N	\N	\N
23852	902	33	4	\N	\N	\N	\N
23853	902	34	2	\N	\N	\N	\N
23854	902	35	2	\N	\N	\N	\N
23855	902	36	3	\N	\N	\N	\N
23856	902	37	3	\N	\N	\N	\N
23857	902	38	1	\N	\N	\N	\N
23858	902	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.662	MODELO
23859	902	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.846	MODELO
23860	901	18	3	\N	\N	\N	\N
23861	901	19	4	\N	\N	\N	\N
23862	901	20	2	\N	\N	\N	\N
23863	901	21	2	\N	\N	\N	\N
23864	901	22	2	\N	\N	\N	\N
23865	901	23	2	\N	\N	\N	\N
23866	901	24	3	\N	\N	\N	\N
23867	901	27	2	\N	\N	\N	\N
23868	901	28	2	\N	\N	\N	\N
23869	901	29	2	\N	\N	\N	\N
23870	901	30	3	\N	\N	\N	\N
23871	901	31	4	\N	\N	\N	\N
23872	901	32	3	\N	\N	\N	\N
23873	901	33	2	\N	\N	\N	\N
23874	901	34	1	\N	\N	\N	\N
23875	901	35	3	\N	\N	\N	\N
23876	901	36	2	\N	\N	\N	\N
23877	901	37	3	\N	\N	\N	\N
23878	901	38	4	\N	\N	\N	\N
23879	901	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.958	MODELO
23880	901	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.774	MODELO
23881	900	18	3	\N	\N	\N	\N
23882	900	19	3	\N	\N	\N	\N
23883	900	20	4	\N	\N	\N	\N
23884	900	21	2	\N	\N	\N	\N
23885	900	22	3	\N	\N	\N	\N
23886	900	23	4	\N	\N	\N	\N
23887	900	24	4	\N	\N	\N	\N
23888	900	27	3	\N	\N	\N	\N
23889	900	28	2	\N	\N	\N	\N
23890	900	29	4	\N	\N	\N	\N
23891	900	30	2	\N	\N	\N	\N
23892	900	31	3	\N	\N	\N	\N
23893	900	32	3	\N	\N	\N	\N
23894	900	33	1	\N	\N	\N	\N
23895	900	34	3	\N	\N	\N	\N
23896	900	35	2	\N	\N	\N	\N
23897	900	36	4	\N	\N	\N	\N
23898	900	37	3	\N	\N	\N	\N
23899	900	38	2	\N	\N	\N	\N
23900	900	25	\N	Permite repreguntar y eso está bien.	NEUTRO	0.661	MODELO
23901	900	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.776	MODELO
23902	899	18	3	\N	\N	\N	\N
23903	899	19	3	\N	\N	\N	\N
23904	899	20	2	\N	\N	\N	\N
23905	899	21	3	\N	\N	\N	\N
23906	899	22	3	\N	\N	\N	\N
23907	899	23	2	\N	\N	\N	\N
23908	899	24	3	\N	\N	\N	\N
23909	899	27	3	\N	\N	\N	\N
23910	899	28	2	\N	\N	\N	\N
23911	899	29	3	\N	\N	\N	\N
23912	899	30	1	\N	\N	\N	\N
23913	899	31	2	\N	\N	\N	\N
23914	899	32	2	\N	\N	\N	\N
23915	899	33	2	\N	\N	\N	\N
23916	899	34	1	\N	\N	\N	\N
23917	899	35	3	\N	\N	\N	\N
23918	899	36	3	\N	\N	\N	\N
23919	899	37	3	\N	\N	\N	\N
23920	899	38	4	\N	\N	\N	\N
23921	899	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.948	MODELO
23922	899	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.655	MODELO
23923	898	18	2	\N	\N	\N	\N
23924	898	19	3	\N	\N	\N	\N
23925	898	20	2	\N	\N	\N	\N
23926	898	21	4	\N	\N	\N	\N
23927	898	22	4	\N	\N	\N	\N
23928	898	23	3	\N	\N	\N	\N
23929	898	24	2	\N	\N	\N	\N
23930	898	27	2	\N	\N	\N	\N
23931	898	28	1	\N	\N	\N	\N
23932	898	29	2	\N	\N	\N	\N
23933	898	30	3	\N	\N	\N	\N
23934	898	31	2	\N	\N	\N	\N
23935	898	32	2	\N	\N	\N	\N
23936	898	33	2	\N	\N	\N	\N
23937	898	34	3	\N	\N	\N	\N
23938	898	35	2	\N	\N	\N	\N
23939	898	36	2	\N	\N	\N	\N
23940	898	37	3	\N	\N	\N	\N
23941	898	38	4	\N	\N	\N	\N
23942	898	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.975	MODELO
23943	898	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.839	MODELO
23944	897	18	4	\N	\N	\N	\N
23945	897	19	2	\N	\N	\N	\N
23946	897	20	3	\N	\N	\N	\N
23947	897	21	3	\N	\N	\N	\N
23948	897	22	1	\N	\N	\N	\N
23949	897	23	3	\N	\N	\N	\N
23950	897	24	4	\N	\N	\N	\N
23951	897	27	2	\N	\N	\N	\N
23952	897	28	4	\N	\N	\N	\N
23955	897	31	2	\N	\N	\N	\N
23956	897	32	3	\N	\N	\N	\N
23957	897	33	2	\N	\N	\N	\N
23958	897	34	2	\N	\N	\N	\N
23959	897	35	3	\N	\N	\N	\N
23960	897	36	2	\N	\N	\N	\N
23961	897	37	1	\N	\N	\N	\N
23962	897	38	4	\N	\N	\N	\N
23963	897	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.607	MODELO
23964	897	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.832	MODELO
23965	896	18	2	\N	\N	\N	\N
23966	896	19	3	\N	\N	\N	\N
23967	896	20	2	\N	\N	\N	\N
23968	896	21	2	\N	\N	\N	\N
23969	896	22	3	\N	\N	\N	\N
23970	896	23	2	\N	\N	\N	\N
23971	896	24	2	\N	\N	\N	\N
23972	896	27	2	\N	\N	\N	\N
23973	896	28	3	\N	\N	\N	\N
23974	896	29	3	\N	\N	\N	\N
23975	896	30	3	\N	\N	\N	\N
23976	896	31	2	\N	\N	\N	\N
23977	896	32	2	\N	\N	\N	\N
23978	896	33	3	\N	\N	\N	\N
23979	896	34	2	\N	\N	\N	\N
23980	896	35	4	\N	\N	\N	\N
23981	896	36	3	\N	\N	\N	\N
23982	896	37	1	\N	\N	\N	\N
23983	896	38	4	\N	\N	\N	\N
23984	896	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.635	MODELO
23985	896	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.581	MODELO
23986	895	18	2	\N	\N	\N	\N
23987	895	19	2	\N	\N	\N	\N
23988	895	20	3	\N	\N	\N	\N
23989	895	21	3	\N	\N	\N	\N
23990	895	22	3	\N	\N	\N	\N
23991	895	23	3	\N	\N	\N	\N
23992	895	24	2	\N	\N	\N	\N
23993	895	27	4	\N	\N	\N	\N
23994	895	28	4	\N	\N	\N	\N
23995	895	29	3	\N	\N	\N	\N
23996	895	30	2	\N	\N	\N	\N
23997	895	31	2	\N	\N	\N	\N
23998	895	32	4	\N	\N	\N	\N
23999	895	33	3	\N	\N	\N	\N
24000	895	34	1	\N	\N	\N	\N
24001	895	35	1	\N	\N	\N	\N
24002	895	36	3	\N	\N	\N	\N
24003	895	37	3	\N	\N	\N	\N
24004	895	38	2	\N	\N	\N	\N
24005	895	25	\N	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.785	MODELO
24006	895	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.889	MODELO
24007	894	18	3	\N	\N	\N	\N
24008	894	19	3	\N	\N	\N	\N
24009	894	20	3	\N	\N	\N	\N
24010	894	21	3	\N	\N	\N	\N
24011	894	22	4	\N	\N	\N	\N
24012	894	23	2	\N	\N	\N	\N
24013	894	24	3	\N	\N	\N	\N
24014	894	27	1	\N	\N	\N	\N
24015	894	28	3	\N	\N	\N	\N
24016	894	29	3	\N	\N	\N	\N
24017	894	30	2	\N	\N	\N	\N
24018	894	31	2	\N	\N	\N	\N
24019	894	32	3	\N	\N	\N	\N
24020	894	33	1	\N	\N	\N	\N
24021	894	34	3	\N	\N	\N	\N
24022	894	35	2	\N	\N	\N	\N
24023	894	36	3	\N	\N	\N	\N
24024	894	37	2	\N	\N	\N	\N
24025	894	38	3	\N	\N	\N	\N
24026	894	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.977	MODELO
24027	894	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.507	MODELO
24028	893	18	2	\N	\N	\N	\N
24029	893	19	4	\N	\N	\N	\N
24030	893	20	4	\N	\N	\N	\N
24031	893	21	3	\N	\N	\N	\N
24032	893	22	2	\N	\N	\N	\N
24033	893	23	3	\N	\N	\N	\N
24034	893	24	2	\N	\N	\N	\N
24035	893	27	3	\N	\N	\N	\N
24036	893	28	3	\N	\N	\N	\N
24037	893	29	2	\N	\N	\N	\N
24038	893	30	2	\N	\N	\N	\N
24039	893	31	3	\N	\N	\N	\N
24040	893	32	4	\N	\N	\N	\N
24041	893	33	3	\N	\N	\N	\N
24042	893	34	2	\N	\N	\N	\N
24043	893	35	1	\N	\N	\N	\N
24044	893	36	1	\N	\N	\N	\N
24045	893	37	2	\N	\N	\N	\N
24046	893	38	3	\N	\N	\N	\N
24047	893	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.558	MODELO
24048	893	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.95	MODELO
24049	892	18	2	\N	\N	\N	\N
24050	892	19	3	\N	\N	\N	\N
24051	892	20	4	\N	\N	\N	\N
24052	892	21	1	\N	\N	\N	\N
24053	892	22	3	\N	\N	\N	\N
24054	892	23	1	\N	\N	\N	\N
24055	892	24	1	\N	\N	\N	\N
24056	892	27	3	\N	\N	\N	\N
24057	892	28	3	\N	\N	\N	\N
24058	892	29	3	\N	\N	\N	\N
24059	892	30	3	\N	\N	\N	\N
24060	892	31	3	\N	\N	\N	\N
24061	892	32	3	\N	\N	\N	\N
24062	892	33	3	\N	\N	\N	\N
24063	892	34	3	\N	\N	\N	\N
24064	892	35	3	\N	\N	\N	\N
24065	892	36	2	\N	\N	\N	\N
24066	892	37	2	\N	\N	\N	\N
24067	892	38	3	\N	\N	\N	\N
24068	892	25	\N	Es puntual y cumple el horario, aunque la metodología podría variar más.	NEUTRO	0.54	MODELO
24069	892	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.9	MODELO
24070	891	18	4	\N	\N	\N	\N
24071	891	19	1	\N	\N	\N	\N
24072	891	20	3	\N	\N	\N	\N
24073	891	21	3	\N	\N	\N	\N
24074	891	22	1	\N	\N	\N	\N
24075	891	23	3	\N	\N	\N	\N
24076	891	24	3	\N	\N	\N	\N
24077	891	27	2	\N	\N	\N	\N
24078	891	28	4	\N	\N	\N	\N
24079	891	29	3	\N	\N	\N	\N
24080	891	30	3	\N	\N	\N	\N
24081	891	31	4	\N	\N	\N	\N
24082	891	32	1	\N	\N	\N	\N
24083	891	33	2	\N	\N	\N	\N
24084	891	34	2	\N	\N	\N	\N
24085	891	35	1	\N	\N	\N	\N
24086	891	36	2	\N	\N	\N	\N
24087	891	37	4	\N	\N	\N	\N
24088	891	38	3	\N	\N	\N	\N
24089	891	25	\N	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.743	MODELO
24090	891	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.711	MODELO
24091	890	18	3	\N	\N	\N	\N
24092	890	19	2	\N	\N	\N	\N
24093	890	20	2	\N	\N	\N	\N
24094	890	21	1	\N	\N	\N	\N
24095	890	22	2	\N	\N	\N	\N
24096	890	23	2	\N	\N	\N	\N
24097	890	24	2	\N	\N	\N	\N
24098	890	27	2	\N	\N	\N	\N
24099	890	28	3	\N	\N	\N	\N
24100	890	29	2	\N	\N	\N	\N
24101	890	30	2	\N	\N	\N	\N
24102	890	31	2	\N	\N	\N	\N
24103	890	32	4	\N	\N	\N	\N
24104	890	33	3	\N	\N	\N	\N
24105	890	34	4	\N	\N	\N	\N
24106	890	35	2	\N	\N	\N	\N
24107	890	36	2	\N	\N	\N	\N
24108	890	37	2	\N	\N	\N	\N
24109	890	38	2	\N	\N	\N	\N
24110	890	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.551	MODELO
24111	890	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.91	MODELO
24112	889	18	3	\N	\N	\N	\N
24113	889	19	4	\N	\N	\N	\N
24114	889	20	4	\N	\N	\N	\N
24115	889	21	2	\N	\N	\N	\N
24116	889	22	2	\N	\N	\N	\N
24117	889	23	4	\N	\N	\N	\N
24118	889	24	4	\N	\N	\N	\N
24119	889	27	3	\N	\N	\N	\N
24120	889	28	2	\N	\N	\N	\N
24121	889	29	3	\N	\N	\N	\N
24122	889	30	3	\N	\N	\N	\N
24123	889	31	2	\N	\N	\N	\N
24124	889	32	3	\N	\N	\N	\N
24125	889	33	4	\N	\N	\N	\N
24126	889	34	3	\N	\N	\N	\N
24127	889	35	3	\N	\N	\N	\N
24128	889	36	3	\N	\N	\N	\N
24129	889	37	2	\N	\N	\N	\N
24130	889	38	3	\N	\N	\N	\N
24131	889	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.571	MODELO
24132	889	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.763	MODELO
24133	888	18	3	\N	\N	\N	\N
24134	888	19	2	\N	\N	\N	\N
24135	888	20	3	\N	\N	\N	\N
24136	888	21	2	\N	\N	\N	\N
24137	888	22	4	\N	\N	\N	\N
24138	888	23	4	\N	\N	\N	\N
24139	888	24	2	\N	\N	\N	\N
24140	888	27	2	\N	\N	\N	\N
24141	888	28	2	\N	\N	\N	\N
24142	888	29	3	\N	\N	\N	\N
24143	888	30	3	\N	\N	\N	\N
24144	888	31	3	\N	\N	\N	\N
24145	888	32	1	\N	\N	\N	\N
24146	888	33	2	\N	\N	\N	\N
24147	888	34	2	\N	\N	\N	\N
24148	888	35	3	\N	\N	\N	\N
24149	888	36	1	\N	\N	\N	\N
24150	888	37	2	\N	\N	\N	\N
24151	888	38	3	\N	\N	\N	\N
24152	888	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.834	MODELO
24153	888	26	\N	Que se actualice: sus ejemplos y herramientas son de hace 15 años.	NEGATIVO	0.977	MODELO
24154	887	18	1	\N	\N	\N	\N
24155	887	19	4	\N	\N	\N	\N
24156	887	20	1	\N	\N	\N	\N
24157	887	21	2	\N	\N	\N	\N
24158	887	22	3	\N	\N	\N	\N
24159	887	23	2	\N	\N	\N	\N
24160	887	24	3	\N	\N	\N	\N
24161	887	27	3	\N	\N	\N	\N
24162	887	28	2	\N	\N	\N	\N
24163	887	29	2	\N	\N	\N	\N
24164	887	30	2	\N	\N	\N	\N
24165	887	31	1	\N	\N	\N	\N
24166	887	32	1	\N	\N	\N	\N
24167	887	33	3	\N	\N	\N	\N
24168	887	34	2	\N	\N	\N	\N
24169	887	35	4	\N	\N	\N	\N
24170	887	36	3	\N	\N	\N	\N
24171	887	37	3	\N	\N	\N	\N
24172	887	38	3	\N	\N	\N	\N
24173	887	25	\N	Es respetuoso con los estudiantes, eso es lo principal que rescato.	NEUTRO	0.524	MODELO
24174	887	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.872	MODELO
24175	886	18	3	\N	\N	\N	\N
24176	886	19	3	\N	\N	\N	\N
24177	886	20	3	\N	\N	\N	\N
24178	886	21	2	\N	\N	\N	\N
24179	886	22	3	\N	\N	\N	\N
24180	886	23	1	\N	\N	\N	\N
24181	886	24	2	\N	\N	\N	\N
24182	886	27	3	\N	\N	\N	\N
24183	886	28	3	\N	\N	\N	\N
24184	886	29	3	\N	\N	\N	\N
24185	886	30	3	\N	\N	\N	\N
24186	886	31	2	\N	\N	\N	\N
24187	886	32	4	\N	\N	\N	\N
24188	886	33	3	\N	\N	\N	\N
24189	886	34	1	\N	\N	\N	\N
24190	886	35	2	\N	\N	\N	\N
24191	886	36	2	\N	\N	\N	\N
24192	886	37	2	\N	\N	\N	\N
24193	886	38	3	\N	\N	\N	\N
24194	886	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.928	MODELO
24195	886	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.971	MODELO
24196	885	18	2	\N	\N	\N	\N
24197	885	19	2	\N	\N	\N	\N
24198	885	20	1	\N	\N	\N	\N
24199	885	21	4	\N	\N	\N	\N
24200	885	22	3	\N	\N	\N	\N
24201	885	23	2	\N	\N	\N	\N
24202	885	24	2	\N	\N	\N	\N
24203	885	27	2	\N	\N	\N	\N
24204	885	28	2	\N	\N	\N	\N
24205	885	29	3	\N	\N	\N	\N
24206	885	30	2	\N	\N	\N	\N
24207	885	31	3	\N	\N	\N	\N
24208	885	32	1	\N	\N	\N	\N
24209	885	33	2	\N	\N	\N	\N
24210	885	34	3	\N	\N	\N	\N
24211	885	35	4	\N	\N	\N	\N
24212	885	36	2	\N	\N	\N	\N
24213	885	37	3	\N	\N	\N	\N
24214	885	38	1	\N	\N	\N	\N
24215	885	25	\N	Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.	POSITIVO	0.984	MODELO
24216	885	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.824	MODELO
24217	884	18	3	\N	\N	\N	\N
24218	884	19	3	\N	\N	\N	\N
24219	884	20	3	\N	\N	\N	\N
24220	884	21	2	\N	\N	\N	\N
24221	884	22	3	\N	\N	\N	\N
24222	884	23	3	\N	\N	\N	\N
24223	884	24	2	\N	\N	\N	\N
24224	884	27	3	\N	\N	\N	\N
24225	884	28	4	\N	\N	\N	\N
24226	884	29	3	\N	\N	\N	\N
24227	884	30	3	\N	\N	\N	\N
24228	884	31	2	\N	\N	\N	\N
24229	884	32	1	\N	\N	\N	\N
24230	884	33	3	\N	\N	\N	\N
24231	884	34	2	\N	\N	\N	\N
24232	884	35	2	\N	\N	\N	\N
24233	884	36	2	\N	\N	\N	\N
24234	884	37	3	\N	\N	\N	\N
24235	884	38	4	\N	\N	\N	\N
24236	884	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.566	MODELO
24237	884	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.754	MODELO
24238	883	18	2	\N	\N	\N	\N
24239	883	19	4	\N	\N	\N	\N
24240	883	20	2	\N	\N	\N	\N
24241	883	21	4	\N	\N	\N	\N
24242	883	22	2	\N	\N	\N	\N
24243	883	23	2	\N	\N	\N	\N
24244	883	24	3	\N	\N	\N	\N
24245	883	27	4	\N	\N	\N	\N
24246	883	28	4	\N	\N	\N	\N
24247	883	29	2	\N	\N	\N	\N
24248	883	30	4	\N	\N	\N	\N
24249	883	31	4	\N	\N	\N	\N
24250	883	32	2	\N	\N	\N	\N
24251	883	33	4	\N	\N	\N	\N
24252	883	34	3	\N	\N	\N	\N
24253	883	35	4	\N	\N	\N	\N
24254	883	36	3	\N	\N	\N	\N
24255	883	37	3	\N	\N	\N	\N
24256	883	38	3	\N	\N	\N	\N
24257	883	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.95	MODELO
24258	883	26	\N	Sería bueno que dedicara una clase a repaso general antes de cada corte.	POSITIVO	0.781	MODELO
24259	882	18	3	\N	\N	\N	\N
24260	882	19	3	\N	\N	\N	\N
24261	882	20	1	\N	\N	\N	\N
24262	882	21	3	\N	\N	\N	\N
24263	882	22	2	\N	\N	\N	\N
24264	882	23	3	\N	\N	\N	\N
24265	882	24	2	\N	\N	\N	\N
24266	882	27	2	\N	\N	\N	\N
24267	882	28	3	\N	\N	\N	\N
24268	882	29	2	\N	\N	\N	\N
24269	882	30	2	\N	\N	\N	\N
24270	882	31	2	\N	\N	\N	\N
24271	882	32	2	\N	\N	\N	\N
24272	882	33	2	\N	\N	\N	\N
24273	882	34	3	\N	\N	\N	\N
24274	882	35	3	\N	\N	\N	\N
24275	882	36	2	\N	\N	\N	\N
24276	882	37	3	\N	\N	\N	\N
24277	882	38	2	\N	\N	\N	\N
24278	882	25	\N	El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.	POSITIVO	0.737	MODELO
24279	882	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.723	MODELO
24280	881	18	2	\N	\N	\N	\N
24281	881	19	2	\N	\N	\N	\N
24282	881	20	2	\N	\N	\N	\N
24283	881	21	2	\N	\N	\N	\N
24284	881	22	3	\N	\N	\N	\N
24285	881	23	2	\N	\N	\N	\N
24286	881	24	2	\N	\N	\N	\N
24287	881	27	2	\N	\N	\N	\N
24288	881	28	3	\N	\N	\N	\N
24289	881	29	4	\N	\N	\N	\N
24290	881	30	4	\N	\N	\N	\N
24291	881	31	2	\N	\N	\N	\N
24292	881	32	2	\N	\N	\N	\N
24293	881	33	3	\N	\N	\N	\N
24294	881	34	3	\N	\N	\N	\N
24295	881	35	3	\N	\N	\N	\N
24296	881	36	3	\N	\N	\N	\N
24297	881	37	2	\N	\N	\N	\N
24298	881	38	3	\N	\N	\N	\N
24299	881	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.964	MODELO
24300	881	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.805	MODELO
24301	880	18	3	\N	\N	\N	\N
24302	880	19	3	\N	\N	\N	\N
24303	880	20	1	\N	\N	\N	\N
24304	880	21	1	\N	\N	\N	\N
24305	880	22	2	\N	\N	\N	\N
24306	880	23	3	\N	\N	\N	\N
24307	880	24	3	\N	\N	\N	\N
24308	880	27	1	\N	\N	\N	\N
24309	880	28	1	\N	\N	\N	\N
24310	880	29	1	\N	\N	\N	\N
24311	880	30	3	\N	\N	\N	\N
24312	880	31	4	\N	\N	\N	\N
24313	880	32	2	\N	\N	\N	\N
24314	880	33	2	\N	\N	\N	\N
24315	880	34	3	\N	\N	\N	\N
24316	880	35	3	\N	\N	\N	\N
24317	880	36	3	\N	\N	\N	\N
24318	880	37	3	\N	\N	\N	\N
24319	880	38	2	\N	\N	\N	\N
24320	880	25	\N	Algunas fortalezas puntuales como el manejo de la plataforma virtual.	NEUTRO	0.73	MODELO
24321	880	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.956	MODELO
24322	879	18	3	\N	\N	\N	\N
24323	879	19	3	\N	\N	\N	\N
24324	879	20	3	\N	\N	\N	\N
24325	879	21	3	\N	\N	\N	\N
24326	879	22	3	\N	\N	\N	\N
24327	879	23	2	\N	\N	\N	\N
24328	879	24	1	\N	\N	\N	\N
24329	879	27	2	\N	\N	\N	\N
24330	879	28	2	\N	\N	\N	\N
24331	879	29	2	\N	\N	\N	\N
24332	879	30	2	\N	\N	\N	\N
24333	879	31	2	\N	\N	\N	\N
24334	879	32	2	\N	\N	\N	\N
24335	879	33	4	\N	\N	\N	\N
24336	879	34	2	\N	\N	\N	\N
24337	879	35	3	\N	\N	\N	\N
24338	879	36	3	\N	\N	\N	\N
24339	879	37	2	\N	\N	\N	\N
24340	879	38	3	\N	\N	\N	\N
24341	879	25	\N	Excelente manejo de grupo, mantiene el respeto sin ser autoritario.	POSITIVO	0.851	MODELO
24342	879	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.808	MODELO
24343	878	18	2	\N	\N	\N	\N
24344	878	19	3	\N	\N	\N	\N
24345	878	20	3	\N	\N	\N	\N
24346	878	21	4	\N	\N	\N	\N
24347	878	22	3	\N	\N	\N	\N
24348	878	23	3	\N	\N	\N	\N
24349	878	24	3	\N	\N	\N	\N
24350	878	27	3	\N	\N	\N	\N
24351	878	28	3	\N	\N	\N	\N
24352	878	29	3	\N	\N	\N	\N
24353	878	30	3	\N	\N	\N	\N
24354	878	31	3	\N	\N	\N	\N
24355	878	32	2	\N	\N	\N	\N
24356	878	33	2	\N	\N	\N	\N
24357	878	34	2	\N	\N	\N	\N
24358	878	35	3	\N	\N	\N	\N
24359	878	36	4	\N	\N	\N	\N
24360	878	37	2	\N	\N	\N	\N
24361	878	38	1	\N	\N	\N	\N
24362	878	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.9	MODELO
24363	878	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.895	MODELO
24364	877	18	3	\N	\N	\N	\N
24365	877	19	3	\N	\N	\N	\N
24366	877	20	2	\N	\N	\N	\N
24367	877	21	3	\N	\N	\N	\N
24368	877	22	1	\N	\N	\N	\N
24369	877	23	1	\N	\N	\N	\N
24370	877	24	3	\N	\N	\N	\N
24371	877	27	4	\N	\N	\N	\N
24372	877	28	2	\N	\N	\N	\N
24373	877	29	3	\N	\N	\N	\N
24374	877	30	3	\N	\N	\N	\N
24375	877	31	2	\N	\N	\N	\N
24376	877	32	2	\N	\N	\N	\N
24377	877	33	3	\N	\N	\N	\N
24378	877	34	3	\N	\N	\N	\N
24379	877	35	3	\N	\N	\N	\N
24380	877	36	2	\N	\N	\N	\N
24381	877	37	3	\N	\N	\N	\N
24382	877	38	3	\N	\N	\N	\N
24383	877	25	\N	No identifico fortalezas claras, fue un semestre muy flojo.	NEGATIVO	0.83	MODELO
24384	877	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.823	MODELO
24385	876	18	2	\N	\N	\N	\N
24386	876	19	2	\N	\N	\N	\N
24387	876	20	2	\N	\N	\N	\N
24388	876	21	4	\N	\N	\N	\N
24389	876	22	2	\N	\N	\N	\N
24390	876	23	3	\N	\N	\N	\N
24391	876	24	2	\N	\N	\N	\N
24392	876	27	3	\N	\N	\N	\N
24393	876	28	2	\N	\N	\N	\N
24394	876	29	2	\N	\N	\N	\N
24395	876	30	1	\N	\N	\N	\N
24396	876	31	2	\N	\N	\N	\N
24397	876	32	3	\N	\N	\N	\N
24398	876	33	4	\N	\N	\N	\N
24399	876	34	3	\N	\N	\N	\N
24400	876	35	4	\N	\N	\N	\N
24401	876	36	2	\N	\N	\N	\N
24402	876	37	2	\N	\N	\N	\N
24403	876	38	4	\N	\N	\N	\N
24404	876	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.925	MODELO
24405	876	26	\N	Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.	POSITIVO	0.79	MODELO
24406	875	18	4	\N	\N	\N	\N
24407	875	19	3	\N	\N	\N	\N
24408	875	20	3	\N	\N	\N	\N
24409	875	21	3	\N	\N	\N	\N
24410	875	22	3	\N	\N	\N	\N
24411	875	23	4	\N	\N	\N	\N
24412	875	24	3	\N	\N	\N	\N
24413	875	27	3	\N	\N	\N	\N
24414	875	28	3	\N	\N	\N	\N
24415	875	29	3	\N	\N	\N	\N
24416	875	30	2	\N	\N	\N	\N
24417	875	31	2	\N	\N	\N	\N
24418	875	32	2	\N	\N	\N	\N
24419	875	33	2	\N	\N	\N	\N
24420	875	34	3	\N	\N	\N	\N
24421	875	35	3	\N	\N	\N	\N
24422	875	36	2	\N	\N	\N	\N
24423	875	37	4	\N	\N	\N	\N
24424	875	38	4	\N	\N	\N	\N
24425	875	25	\N	Tiene algunas clases buenas, otras no tanto, es irregular.	NEUTRO	0.743	MODELO
24426	875	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.75	MODELO
24427	874	18	3	\N	\N	\N	\N
24428	874	19	3	\N	\N	\N	\N
24429	874	20	3	\N	\N	\N	\N
24430	874	21	2	\N	\N	\N	\N
24431	874	22	2	\N	\N	\N	\N
24432	874	23	2	\N	\N	\N	\N
24433	874	24	3	\N	\N	\N	\N
24434	874	27	3	\N	\N	\N	\N
24435	874	28	2	\N	\N	\N	\N
24436	874	29	2	\N	\N	\N	\N
24437	874	30	3	\N	\N	\N	\N
24438	874	31	4	\N	\N	\N	\N
24439	874	32	2	\N	\N	\N	\N
24440	874	33	4	\N	\N	\N	\N
24441	874	34	2	\N	\N	\N	\N
24442	874	35	3	\N	\N	\N	\N
24443	874	36	1	\N	\N	\N	\N
24444	874	37	4	\N	\N	\N	\N
24445	874	38	1	\N	\N	\N	\N
24446	874	25	\N	A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.	POSITIVO	0.981	MODELO
24447	874	26	\N	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.812	MODELO
24448	873	18	3	\N	\N	\N	\N
24449	873	19	4	\N	\N	\N	\N
24450	873	20	4	\N	\N	\N	\N
24451	873	21	2	\N	\N	\N	\N
24452	873	22	3	\N	\N	\N	\N
24453	873	23	2	\N	\N	\N	\N
24454	873	24	3	\N	\N	\N	\N
24455	873	27	3	\N	\N	\N	\N
24456	873	28	4	\N	\N	\N	\N
24457	873	29	1	\N	\N	\N	\N
24458	873	30	2	\N	\N	\N	\N
24459	873	31	1	\N	\N	\N	\N
24460	873	32	2	\N	\N	\N	\N
24461	873	33	4	\N	\N	\N	\N
24462	873	34	3	\N	\N	\N	\N
24463	873	35	4	\N	\N	\N	\N
24464	873	36	2	\N	\N	\N	\N
24465	873	37	3	\N	\N	\N	\N
24466	873	38	2	\N	\N	\N	\N
24467	873	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.678	MODELO
24468	873	26	\N	Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.	POSITIVO	0.935	MODELO
24469	872	18	3	\N	\N	\N	\N
24470	872	19	3	\N	\N	\N	\N
24471	872	20	2	\N	\N	\N	\N
24472	872	21	3	\N	\N	\N	\N
24473	872	22	2	\N	\N	\N	\N
24474	872	23	2	\N	\N	\N	\N
24475	872	24	4	\N	\N	\N	\N
24476	872	27	2	\N	\N	\N	\N
24477	872	28	3	\N	\N	\N	\N
24478	872	29	3	\N	\N	\N	\N
24479	872	30	2	\N	\N	\N	\N
24480	872	31	4	\N	\N	\N	\N
24481	872	32	2	\N	\N	\N	\N
24482	872	33	3	\N	\N	\N	\N
24483	872	34	3	\N	\N	\N	\N
24484	872	35	3	\N	\N	\N	\N
24485	872	36	4	\N	\N	\N	\N
24486	872	37	4	\N	\N	\N	\N
24487	872	38	3	\N	\N	\N	\N
24488	872	25	\N	Tiene buena disposición aunque las explicaciones no siempre quedan claras.	NEUTRO	0.647	MODELO
24489	872	26	\N	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.871	MODELO
24490	871	18	2	\N	\N	\N	\N
24491	871	19	2	\N	\N	\N	\N
24492	871	20	2	\N	\N	\N	\N
24493	871	21	3	\N	\N	\N	\N
24494	871	22	3	\N	\N	\N	\N
24495	871	23	2	\N	\N	\N	\N
24496	871	24	3	\N	\N	\N	\N
24497	871	27	3	\N	\N	\N	\N
24498	871	28	2	\N	\N	\N	\N
24499	871	29	3	\N	\N	\N	\N
24500	871	30	3	\N	\N	\N	\N
24501	871	31	3	\N	\N	\N	\N
24502	871	32	3	\N	\N	\N	\N
24503	871	33	2	\N	\N	\N	\N
24504	871	34	3	\N	\N	\N	\N
24505	871	35	1	\N	\N	\N	\N
24506	871	36	2	\N	\N	\N	\N
24507	871	37	2	\N	\N	\N	\N
24508	871	38	1	\N	\N	\N	\N
24509	871	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.969	MODELO
24510	871	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.589	MODELO
24511	870	18	3	\N	\N	\N	\N
24512	870	19	3	\N	\N	\N	\N
24513	870	20	3	\N	\N	\N	\N
24514	870	21	3	\N	\N	\N	\N
24515	870	22	4	\N	\N	\N	\N
24516	870	23	2	\N	\N	\N	\N
24517	870	24	1	\N	\N	\N	\N
24518	870	27	4	\N	\N	\N	\N
24519	870	28	1	\N	\N	\N	\N
24520	870	29	2	\N	\N	\N	\N
24521	870	30	3	\N	\N	\N	\N
24522	870	31	3	\N	\N	\N	\N
24523	870	32	3	\N	\N	\N	\N
24524	870	33	2	\N	\N	\N	\N
24525	870	34	2	\N	\N	\N	\N
24526	870	35	3	\N	\N	\N	\N
24527	870	36	4	\N	\N	\N	\N
24528	870	37	3	\N	\N	\N	\N
24529	870	38	1	\N	\N	\N	\N
24530	870	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.853	MODELO
24531	870	26	\N	Todo. Fue la peor experiencia académica de la carrera hasta ahora.	NEGATIVO	0.865	MODELO
24532	869	18	4	\N	\N	\N	\N
24533	869	19	2	\N	\N	\N	\N
24534	869	20	4	\N	\N	\N	\N
24535	869	21	2	\N	\N	\N	\N
24536	869	22	2	\N	\N	\N	\N
24537	869	23	2	\N	\N	\N	\N
24538	869	24	2	\N	\N	\N	\N
24539	869	27	2	\N	\N	\N	\N
24540	869	28	2	\N	\N	\N	\N
24541	869	29	3	\N	\N	\N	\N
24542	869	30	3	\N	\N	\N	\N
24543	869	31	2	\N	\N	\N	\N
24544	869	32	3	\N	\N	\N	\N
24545	869	33	2	\N	\N	\N	\N
24546	869	34	2	\N	\N	\N	\N
24547	869	35	4	\N	\N	\N	\N
24548	869	36	3	\N	\N	\N	\N
24549	869	37	2	\N	\N	\N	\N
24550	869	38	3	\N	\N	\N	\N
24551	869	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.539	MODELO
24552	869	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.85	MODELO
24553	868	18	2	\N	\N	\N	\N
24554	868	19	3	\N	\N	\N	\N
24555	868	20	3	\N	\N	\N	\N
24556	868	21	2	\N	\N	\N	\N
24557	868	22	2	\N	\N	\N	\N
24558	868	23	4	\N	\N	\N	\N
24559	868	24	2	\N	\N	\N	\N
24560	868	27	2	\N	\N	\N	\N
24561	868	28	1	\N	\N	\N	\N
24562	868	29	4	\N	\N	\N	\N
24563	868	30	3	\N	\N	\N	\N
24564	868	31	3	\N	\N	\N	\N
24565	868	32	3	\N	\N	\N	\N
24566	868	33	2	\N	\N	\N	\N
24567	868	34	2	\N	\N	\N	\N
24568	868	35	1	\N	\N	\N	\N
24569	868	36	2	\N	\N	\N	\N
24570	868	37	3	\N	\N	\N	\N
24571	868	38	2	\N	\N	\N	\N
24572	868	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.557	MODELO
24573	868	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.507	MODELO
24574	867	18	1	\N	\N	\N	\N
24575	867	19	4	\N	\N	\N	\N
24576	867	20	3	\N	\N	\N	\N
24577	867	21	2	\N	\N	\N	\N
24578	867	22	2	\N	\N	\N	\N
24579	867	23	3	\N	\N	\N	\N
24580	867	24	2	\N	\N	\N	\N
24581	867	27	3	\N	\N	\N	\N
24582	867	28	4	\N	\N	\N	\N
24583	867	29	3	\N	\N	\N	\N
24584	867	30	4	\N	\N	\N	\N
24585	867	31	3	\N	\N	\N	\N
24586	867	32	3	\N	\N	\N	\N
24587	867	33	2	\N	\N	\N	\N
24588	867	34	2	\N	\N	\N	\N
24589	867	35	1	\N	\N	\N	\N
24590	867	36	2	\N	\N	\N	\N
24591	867	37	4	\N	\N	\N	\N
24592	867	38	3	\N	\N	\N	\N
24593	867	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.661	MODELO
24594	867	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.748	MODELO
24595	866	18	2	\N	\N	\N	\N
24596	866	19	3	\N	\N	\N	\N
24597	866	20	3	\N	\N	\N	\N
24598	866	21	3	\N	\N	\N	\N
24599	866	22	4	\N	\N	\N	\N
24600	866	23	2	\N	\N	\N	\N
24601	866	24	4	\N	\N	\N	\N
24602	866	27	3	\N	\N	\N	\N
24603	866	28	2	\N	\N	\N	\N
24604	866	29	1	\N	\N	\N	\N
24605	866	30	3	\N	\N	\N	\N
24606	866	31	1	\N	\N	\N	\N
24607	866	32	4	\N	\N	\N	\N
24608	866	33	1	\N	\N	\N	\N
24609	866	34	2	\N	\N	\N	\N
24610	866	35	2	\N	\N	\N	\N
24611	866	36	1	\N	\N	\N	\N
24612	866	37	4	\N	\N	\N	\N
24613	866	38	2	\N	\N	\N	\N
24614	866	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.96	MODELO
24615	866	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.906	MODELO
24616	865	18	3	\N	\N	\N	\N
24617	865	19	2	\N	\N	\N	\N
24618	865	20	3	\N	\N	\N	\N
24619	865	21	1	\N	\N	\N	\N
24620	865	22	2	\N	\N	\N	\N
24621	865	23	2	\N	\N	\N	\N
24622	865	24	1	\N	\N	\N	\N
24623	865	27	4	\N	\N	\N	\N
24624	865	28	3	\N	\N	\N	\N
24625	865	29	4	\N	\N	\N	\N
24626	865	30	2	\N	\N	\N	\N
24627	865	31	3	\N	\N	\N	\N
24628	865	32	2	\N	\N	\N	\N
24629	865	33	2	\N	\N	\N	\N
24630	865	34	3	\N	\N	\N	\N
24631	865	35	3	\N	\N	\N	\N
24632	865	36	3	\N	\N	\N	\N
24633	865	37	2	\N	\N	\N	\N
24634	865	38	3	\N	\N	\N	\N
24635	865	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.989	MODELO
24636	865	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.889	MODELO
24637	864	18	2	\N	\N	\N	\N
24638	864	19	2	\N	\N	\N	\N
24639	864	20	1	\N	\N	\N	\N
24640	864	21	2	\N	\N	\N	\N
24641	864	22	3	\N	\N	\N	\N
24642	864	23	3	\N	\N	\N	\N
24643	864	24	3	\N	\N	\N	\N
24644	864	27	1	\N	\N	\N	\N
24645	864	28	3	\N	\N	\N	\N
24646	864	29	3	\N	\N	\N	\N
24647	864	30	3	\N	\N	\N	\N
24648	864	31	2	\N	\N	\N	\N
24649	864	32	1	\N	\N	\N	\N
24650	864	33	3	\N	\N	\N	\N
24651	864	34	3	\N	\N	\N	\N
24652	864	35	1	\N	\N	\N	\N
24653	864	36	3	\N	\N	\N	\N
24654	864	37	2	\N	\N	\N	\N
24655	864	38	1	\N	\N	\N	\N
24656	864	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.876	MODELO
24657	864	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.779	MODELO
24658	863	18	3	\N	\N	\N	\N
24659	863	19	3	\N	\N	\N	\N
24660	863	20	3	\N	\N	\N	\N
24661	863	21	1	\N	\N	\N	\N
24662	863	22	1	\N	\N	\N	\N
24663	863	23	3	\N	\N	\N	\N
24664	863	24	4	\N	\N	\N	\N
24665	863	27	3	\N	\N	\N	\N
24666	863	28	2	\N	\N	\N	\N
24667	863	29	3	\N	\N	\N	\N
24668	863	30	1	\N	\N	\N	\N
24669	863	31	4	\N	\N	\N	\N
24670	863	32	4	\N	\N	\N	\N
24671	863	33	3	\N	\N	\N	\N
24672	863	34	2	\N	\N	\N	\N
24673	863	35	2	\N	\N	\N	\N
24674	863	36	3	\N	\N	\N	\N
24675	863	37	1	\N	\N	\N	\N
24676	863	38	4	\N	\N	\N	\N
24677	863	25	\N	Siempre llega puntual y aprovecha todo el tiempo de clase.	POSITIVO	0.986	MODELO
24678	863	26	\N	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.884	MODELO
24679	862	18	3	\N	\N	\N	\N
24680	862	19	2	\N	\N	\N	\N
24681	862	20	2	\N	\N	\N	\N
24682	862	21	3	\N	\N	\N	\N
24683	862	22	3	\N	\N	\N	\N
24684	862	23	3	\N	\N	\N	\N
24685	862	24	3	\N	\N	\N	\N
24686	862	27	2	\N	\N	\N	\N
24687	862	28	3	\N	\N	\N	\N
24688	862	29	1	\N	\N	\N	\N
24689	862	30	4	\N	\N	\N	\N
24690	862	31	4	\N	\N	\N	\N
24691	862	32	3	\N	\N	\N	\N
24692	862	33	4	\N	\N	\N	\N
24693	862	34	1	\N	\N	\N	\N
24694	862	35	2	\N	\N	\N	\N
24695	862	36	3	\N	\N	\N	\N
24696	862	37	2	\N	\N	\N	\N
24697	862	38	3	\N	\N	\N	\N
24698	862	25	\N	Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.	POSITIVO	0.957	MODELO
24699	862	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.875	MODELO
24700	861	18	3	\N	\N	\N	\N
24701	861	19	3	\N	\N	\N	\N
24702	861	20	2	\N	\N	\N	\N
24703	861	21	3	\N	\N	\N	\N
24704	861	22	2	\N	\N	\N	\N
24705	861	23	3	\N	\N	\N	\N
24706	861	24	3	\N	\N	\N	\N
24707	861	27	3	\N	\N	\N	\N
24708	861	28	3	\N	\N	\N	\N
24709	861	29	3	\N	\N	\N	\N
24710	861	30	3	\N	\N	\N	\N
24711	861	31	3	\N	\N	\N	\N
24712	861	32	4	\N	\N	\N	\N
24713	861	33	3	\N	\N	\N	\N
24714	861	34	1	\N	\N	\N	\N
24715	861	35	2	\N	\N	\N	\N
24716	861	36	2	\N	\N	\N	\N
24717	861	37	2	\N	\N	\N	\N
24718	861	38	2	\N	\N	\N	\N
24719	861	25	\N	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.93	MODELO
24720	861	26	\N	Ser más organizado: anunciaba trabajos un día para otro.	NEGATIVO	0.764	MODELO
24721	860	18	2	\N	\N	\N	\N
24722	860	19	3	\N	\N	\N	\N
24723	860	20	2	\N	\N	\N	\N
24724	860	21	3	\N	\N	\N	\N
24725	860	22	2	\N	\N	\N	\N
24726	860	23	4	\N	\N	\N	\N
24727	860	24	3	\N	\N	\N	\N
24728	860	27	2	\N	\N	\N	\N
24729	860	28	1	\N	\N	\N	\N
24730	860	29	2	\N	\N	\N	\N
24731	860	30	2	\N	\N	\N	\N
24732	860	31	4	\N	\N	\N	\N
24733	860	32	3	\N	\N	\N	\N
24734	860	33	2	\N	\N	\N	\N
24735	860	34	3	\N	\N	\N	\N
24736	860	35	4	\N	\N	\N	\N
24737	860	36	3	\N	\N	\N	\N
24738	860	37	3	\N	\N	\N	\N
24739	860	38	3	\N	\N	\N	\N
24740	860	25	\N	Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.	POSITIVO	0.728	MODELO
24741	860	26	\N	Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.	NEGATIVO	0.926	MODELO
24742	859	18	2	\N	\N	\N	\N
24743	859	19	2	\N	\N	\N	\N
24744	859	20	2	\N	\N	\N	\N
24745	859	21	2	\N	\N	\N	\N
24746	859	22	3	\N	\N	\N	\N
24747	859	23	3	\N	\N	\N	\N
24748	859	24	3	\N	\N	\N	\N
24749	859	27	3	\N	\N	\N	\N
24750	859	28	3	\N	\N	\N	\N
24751	859	29	3	\N	\N	\N	\N
24752	859	30	2	\N	\N	\N	\N
24753	859	31	2	\N	\N	\N	\N
24754	859	32	4	\N	\N	\N	\N
24755	859	33	1	\N	\N	\N	\N
24756	859	34	2	\N	\N	\N	\N
24757	859	35	3	\N	\N	\N	\N
24758	859	36	3	\N	\N	\N	\N
24759	859	37	3	\N	\N	\N	\N
24760	859	38	2	\N	\N	\N	\N
24761	859	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.952	MODELO
24762	859	26	\N	Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.	NEGATIVO	0.828	MODELO
24763	858	18	1	\N	\N	\N	\N
24764	858	19	2	\N	\N	\N	\N
24765	858	20	4	\N	\N	\N	\N
24766	858	21	3	\N	\N	\N	\N
24767	858	22	3	\N	\N	\N	\N
24768	858	23	2	\N	\N	\N	\N
24769	858	24	3	\N	\N	\N	\N
24770	858	27	2	\N	\N	\N	\N
24771	858	28	3	\N	\N	\N	\N
24772	858	29	3	\N	\N	\N	\N
24773	858	30	3	\N	\N	\N	\N
24774	858	31	3	\N	\N	\N	\N
24775	858	32	2	\N	\N	\N	\N
24776	858	33	3	\N	\N	\N	\N
24777	858	34	4	\N	\N	\N	\N
24778	858	35	2	\N	\N	\N	\N
24779	858	36	3	\N	\N	\N	\N
24780	858	37	3	\N	\N	\N	\N
24781	858	38	3	\N	\N	\N	\N
24900	852	31	2	\N	\N	\N	\N
24782	858	25	\N	Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.	POSITIVO	0.799	MODELO
24783	858	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.841	MODELO
24784	857	18	3	\N	\N	\N	\N
24785	857	19	3	\N	\N	\N	\N
24786	857	20	3	\N	\N	\N	\N
24787	857	21	2	\N	\N	\N	\N
24788	857	22	4	\N	\N	\N	\N
24789	857	23	2	\N	\N	\N	\N
24790	857	24	3	\N	\N	\N	\N
24791	857	27	1	\N	\N	\N	\N
24792	857	28	2	\N	\N	\N	\N
24793	857	29	3	\N	\N	\N	\N
24794	857	30	3	\N	\N	\N	\N
24795	857	31	4	\N	\N	\N	\N
24796	857	32	1	\N	\N	\N	\N
24797	857	33	3	\N	\N	\N	\N
24798	857	34	3	\N	\N	\N	\N
24799	857	35	3	\N	\N	\N	\N
24800	857	36	3	\N	\N	\N	\N
24801	857	37	2	\N	\N	\N	\N
24802	857	38	3	\N	\N	\N	\N
24803	857	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.877	MODELO
24804	857	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.7	MODELO
24805	856	18	1	\N	\N	\N	\N
24806	856	19	2	\N	\N	\N	\N
24807	856	20	1	\N	\N	\N	\N
24808	856	21	3	\N	\N	\N	\N
24809	856	22	3	\N	\N	\N	\N
24810	856	23	3	\N	\N	\N	\N
24811	856	24	2	\N	\N	\N	\N
24812	856	27	2	\N	\N	\N	\N
24813	856	28	3	\N	\N	\N	\N
24814	856	29	3	\N	\N	\N	\N
24815	856	30	3	\N	\N	\N	\N
24816	856	31	1	\N	\N	\N	\N
24817	856	32	3	\N	\N	\N	\N
24818	856	33	3	\N	\N	\N	\N
24819	856	34	3	\N	\N	\N	\N
24820	856	35	3	\N	\N	\N	\N
24821	856	36	3	\N	\N	\N	\N
24822	856	37	3	\N	\N	\N	\N
24823	856	38	2	\N	\N	\N	\N
24824	856	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.736	MODELO
24825	856	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.843	MODELO
24826	855	18	2	\N	\N	\N	\N
24827	855	19	3	\N	\N	\N	\N
24828	855	20	4	\N	\N	\N	\N
24829	855	21	2	\N	\N	\N	\N
24830	855	22	3	\N	\N	\N	\N
24831	855	23	3	\N	\N	\N	\N
24832	855	24	3	\N	\N	\N	\N
24833	855	27	2	\N	\N	\N	\N
24834	855	28	2	\N	\N	\N	\N
24835	855	29	2	\N	\N	\N	\N
24836	855	30	2	\N	\N	\N	\N
24837	855	31	2	\N	\N	\N	\N
24838	855	32	3	\N	\N	\N	\N
24839	855	33	3	\N	\N	\N	\N
24840	855	34	3	\N	\N	\N	\N
24841	855	35	2	\N	\N	\N	\N
24842	855	36	4	\N	\N	\N	\N
24843	855	37	2	\N	\N	\N	\N
24844	855	38	3	\N	\N	\N	\N
24845	855	25	\N	Sus exámenes son coherentes con lo visto en clase, eso es positivo.	NEUTRO	0.734	MODELO
24846	855	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.894	MODELO
24847	854	18	3	\N	\N	\N	\N
24848	854	19	2	\N	\N	\N	\N
24849	854	20	3	\N	\N	\N	\N
24850	854	21	2	\N	\N	\N	\N
24851	854	22	3	\N	\N	\N	\N
24852	854	23	1	\N	\N	\N	\N
24853	854	24	3	\N	\N	\N	\N
24854	854	27	4	\N	\N	\N	\N
24855	854	28	3	\N	\N	\N	\N
24856	854	29	2	\N	\N	\N	\N
24857	854	30	2	\N	\N	\N	\N
24858	854	31	3	\N	\N	\N	\N
24859	854	32	4	\N	\N	\N	\N
24860	854	33	2	\N	\N	\N	\N
24861	854	34	2	\N	\N	\N	\N
24862	854	35	2	\N	\N	\N	\N
24863	854	36	3	\N	\N	\N	\N
24864	854	37	4	\N	\N	\N	\N
24865	854	38	1	\N	\N	\N	\N
24866	854	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.82	MODELO
24867	854	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.739	MODELO
24868	853	18	2	\N	\N	\N	\N
24869	853	19	4	\N	\N	\N	\N
24870	853	20	2	\N	\N	\N	\N
24871	853	21	3	\N	\N	\N	\N
24872	853	22	1	\N	\N	\N	\N
24873	853	23	1	\N	\N	\N	\N
24874	853	24	3	\N	\N	\N	\N
24875	853	27	2	\N	\N	\N	\N
24876	853	28	1	\N	\N	\N	\N
24877	853	29	1	\N	\N	\N	\N
24878	853	30	4	\N	\N	\N	\N
24879	853	31	2	\N	\N	\N	\N
24880	853	32	3	\N	\N	\N	\N
24881	853	33	3	\N	\N	\N	\N
24882	853	34	3	\N	\N	\N	\N
24883	853	35	4	\N	\N	\N	\N
24884	853	36	1	\N	\N	\N	\N
24885	853	37	3	\N	\N	\N	\N
24886	853	38	1	\N	\N	\N	\N
24887	853	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.789	MODELO
24888	853	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.842	MODELO
24889	852	18	1	\N	\N	\N	\N
24890	852	19	2	\N	\N	\N	\N
24891	852	20	1	\N	\N	\N	\N
24892	852	21	2	\N	\N	\N	\N
24893	852	22	4	\N	\N	\N	\N
24894	852	23	2	\N	\N	\N	\N
24895	852	24	2	\N	\N	\N	\N
24896	852	27	4	\N	\N	\N	\N
24897	852	28	2	\N	\N	\N	\N
24898	852	29	2	\N	\N	\N	\N
24899	852	30	4	\N	\N	\N	\N
24901	852	32	3	\N	\N	\N	\N
24902	852	33	2	\N	\N	\N	\N
24903	852	34	2	\N	\N	\N	\N
24904	852	35	3	\N	\N	\N	\N
24905	852	36	3	\N	\N	\N	\N
24906	852	37	2	\N	\N	\N	\N
24907	852	38	1	\N	\N	\N	\N
24908	852	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.779	MODELO
24909	852	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.602	MODELO
24910	1251	18	2	\N	\N	\N	\N
24911	1251	19	4	\N	\N	\N	\N
24912	1251	20	3	\N	\N	\N	\N
24913	1251	21	3	\N	\N	\N	\N
24914	1251	22	3	\N	\N	\N	\N
24915	1251	23	1	\N	\N	\N	\N
24916	1251	24	2	\N	\N	\N	\N
24917	1251	27	2	\N	\N	\N	\N
24918	1251	28	3	\N	\N	\N	\N
24919	1251	29	3	\N	\N	\N	\N
24920	1251	30	4	\N	\N	\N	\N
24921	1251	31	2	\N	\N	\N	\N
24922	1251	32	3	\N	\N	\N	\N
24923	1251	33	3	\N	\N	\N	\N
24924	1251	34	4	\N	\N	\N	\N
24925	1251	35	4	\N	\N	\N	\N
24926	1251	36	3	\N	\N	\N	\N
24927	1251	37	2	\N	\N	\N	\N
24928	1251	38	2	\N	\N	\N	\N
24929	1251	25	\N	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.799	MODELO
24930	1251	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.938	MODELO
24931	1250	18	3	\N	\N	\N	\N
24932	1250	19	3	\N	\N	\N	\N
24933	1250	20	2	\N	\N	\N	\N
24934	1250	21	2	\N	\N	\N	\N
24935	1250	22	2	\N	\N	\N	\N
24936	1250	23	3	\N	\N	\N	\N
24937	1250	24	4	\N	\N	\N	\N
24938	1250	27	2	\N	\N	\N	\N
24939	1250	28	3	\N	\N	\N	\N
24940	1250	29	3	\N	\N	\N	\N
24941	1250	30	4	\N	\N	\N	\N
24942	1250	31	4	\N	\N	\N	\N
24943	1250	32	3	\N	\N	\N	\N
24944	1250	33	3	\N	\N	\N	\N
24945	1250	34	1	\N	\N	\N	\N
24946	1250	35	2	\N	\N	\N	\N
24947	1250	36	4	\N	\N	\N	\N
24948	1250	37	2	\N	\N	\N	\N
24949	1250	38	1	\N	\N	\N	\N
24950	1250	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.947	MODELO
24951	1250	26	\N	Respetar los horarios de las asesorías que él mismo publicó.	NEGATIVO	0.819	MODELO
24952	1249	18	3	\N	\N	\N	\N
24953	1249	19	3	\N	\N	\N	\N
24954	1249	20	3	\N	\N	\N	\N
24955	1249	21	3	\N	\N	\N	\N
24956	1249	22	2	\N	\N	\N	\N
24957	1249	23	3	\N	\N	\N	\N
24958	1249	24	1	\N	\N	\N	\N
24959	1249	27	2	\N	\N	\N	\N
24960	1249	28	3	\N	\N	\N	\N
24961	1249	29	3	\N	\N	\N	\N
24962	1249	30	2	\N	\N	\N	\N
24963	1249	31	2	\N	\N	\N	\N
24964	1249	32	1	\N	\N	\N	\N
24965	1249	33	4	\N	\N	\N	\N
24966	1249	34	4	\N	\N	\N	\N
24967	1249	35	2	\N	\N	\N	\N
24968	1249	36	3	\N	\N	\N	\N
24969	1249	37	3	\N	\N	\N	\N
24970	1249	38	3	\N	\N	\N	\N
24971	1249	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.742	MODELO
24972	1249	26	\N	Mejorar la puntualidad en el inicio de la clase y de las asesorías.	NEUTRO	0.7	MODELO
24973	1248	18	1	\N	\N	\N	\N
24974	1248	19	2	\N	\N	\N	\N
24975	1248	20	3	\N	\N	\N	\N
24976	1248	21	2	\N	\N	\N	\N
24977	1248	22	4	\N	\N	\N	\N
24978	1248	23	3	\N	\N	\N	\N
24979	1248	24	2	\N	\N	\N	\N
24980	1248	27	3	\N	\N	\N	\N
24981	1248	28	1	\N	\N	\N	\N
24982	1248	29	2	\N	\N	\N	\N
24983	1248	30	3	\N	\N	\N	\N
24984	1248	31	1	\N	\N	\N	\N
24985	1248	32	3	\N	\N	\N	\N
24986	1248	33	2	\N	\N	\N	\N
24987	1248	34	2	\N	\N	\N	\N
24988	1248	35	2	\N	\N	\N	\N
24989	1248	36	3	\N	\N	\N	\N
24990	1248	37	2	\N	\N	\N	\N
24991	1248	38	3	\N	\N	\N	\N
24992	1248	25	\N	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.952	MODELO
24993	1248	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.708	MODELO
24994	1247	18	3	\N	\N	\N	\N
24995	1247	19	2	\N	\N	\N	\N
24996	1247	20	2	\N	\N	\N	\N
24997	1247	21	3	\N	\N	\N	\N
24998	1247	22	1	\N	\N	\N	\N
24999	1247	23	2	\N	\N	\N	\N
25000	1247	24	4	\N	\N	\N	\N
25001	1247	27	1	\N	\N	\N	\N
25002	1247	28	3	\N	\N	\N	\N
25003	1247	29	3	\N	\N	\N	\N
25004	1247	30	2	\N	\N	\N	\N
25005	1247	31	4	\N	\N	\N	\N
25006	1247	32	4	\N	\N	\N	\N
25007	1247	33	1	\N	\N	\N	\N
25008	1247	34	2	\N	\N	\N	\N
25009	1247	35	3	\N	\N	\N	\N
25010	1247	36	2	\N	\N	\N	\N
25011	1247	37	2	\N	\N	\N	\N
25012	1247	38	2	\N	\N	\N	\N
25013	1247	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.971	MODELO
25014	1247	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.75	MODELO
25015	1246	18	2	\N	\N	\N	\N
25016	1246	19	4	\N	\N	\N	\N
25017	1246	20	2	\N	\N	\N	\N
25018	1246	21	3	\N	\N	\N	\N
25019	1246	22	2	\N	\N	\N	\N
25020	1246	23	3	\N	\N	\N	\N
25021	1246	24	2	\N	\N	\N	\N
25022	1246	27	3	\N	\N	\N	\N
25023	1246	28	2	\N	\N	\N	\N
25024	1246	29	2	\N	\N	\N	\N
25025	1246	30	3	\N	\N	\N	\N
25026	1246	31	3	\N	\N	\N	\N
25027	1246	32	3	\N	\N	\N	\N
25028	1246	33	3	\N	\N	\N	\N
25029	1246	34	2	\N	\N	\N	\N
25030	1246	35	3	\N	\N	\N	\N
25031	1246	36	3	\N	\N	\N	\N
25032	1246	37	3	\N	\N	\N	\N
25033	1246	38	4	\N	\N	\N	\N
25034	1246	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.916	MODELO
25035	1246	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.696	MODELO
25036	1245	18	3	\N	\N	\N	\N
25037	1245	19	2	\N	\N	\N	\N
25038	1245	20	2	\N	\N	\N	\N
25039	1245	21	2	\N	\N	\N	\N
25040	1245	22	2	\N	\N	\N	\N
25041	1245	23	2	\N	\N	\N	\N
25042	1245	24	3	\N	\N	\N	\N
25043	1245	27	4	\N	\N	\N	\N
25044	1245	28	3	\N	\N	\N	\N
25045	1245	29	3	\N	\N	\N	\N
25046	1245	30	2	\N	\N	\N	\N
25047	1245	31	2	\N	\N	\N	\N
25048	1245	32	3	\N	\N	\N	\N
25049	1245	33	2	\N	\N	\N	\N
25050	1245	34	4	\N	\N	\N	\N
25051	1245	35	1	\N	\N	\N	\N
25052	1245	36	4	\N	\N	\N	\N
25053	1245	37	4	\N	\N	\N	\N
25054	1245	38	1	\N	\N	\N	\N
25055	1245	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.846	MODELO
25056	1245	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.716	MODELO
25057	1244	18	3	\N	\N	\N	\N
25058	1244	19	3	\N	\N	\N	\N
25059	1244	20	2	\N	\N	\N	\N
25060	1244	21	3	\N	\N	\N	\N
25061	1244	22	3	\N	\N	\N	\N
25062	1244	23	1	\N	\N	\N	\N
25063	1244	24	3	\N	\N	\N	\N
25064	1244	27	4	\N	\N	\N	\N
25065	1244	28	2	\N	\N	\N	\N
25066	1244	29	3	\N	\N	\N	\N
25067	1244	30	3	\N	\N	\N	\N
25068	1244	31	1	\N	\N	\N	\N
25069	1244	32	3	\N	\N	\N	\N
25070	1244	33	2	\N	\N	\N	\N
25071	1244	34	1	\N	\N	\N	\N
25072	1244	35	2	\N	\N	\N	\N
25073	1244	36	2	\N	\N	\N	\N
25074	1244	37	1	\N	\N	\N	\N
25075	1244	38	3	\N	\N	\N	\N
25076	1244	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.87	MODELO
25077	1244	26	\N	Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.	NEGATIVO	0.922	MODELO
25078	1243	18	3	\N	\N	\N	\N
25079	1243	19	3	\N	\N	\N	\N
25080	1243	20	4	\N	\N	\N	\N
25081	1243	21	2	\N	\N	\N	\N
25082	1243	22	3	\N	\N	\N	\N
25083	1243	23	3	\N	\N	\N	\N
25084	1243	24	1	\N	\N	\N	\N
25085	1243	27	2	\N	\N	\N	\N
25086	1243	28	3	\N	\N	\N	\N
25087	1243	29	3	\N	\N	\N	\N
25088	1243	30	3	\N	\N	\N	\N
25089	1243	31	1	\N	\N	\N	\N
25090	1243	32	4	\N	\N	\N	\N
25091	1243	33	2	\N	\N	\N	\N
25092	1243	34	3	\N	\N	\N	\N
25093	1243	35	4	\N	\N	\N	\N
25094	1243	36	2	\N	\N	\N	\N
25095	1243	37	3	\N	\N	\N	\N
25096	1243	38	4	\N	\N	\N	\N
25097	1243	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.571	MODELO
25098	1243	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.565	MODELO
25099	1242	18	2	\N	\N	\N	\N
25100	1242	19	2	\N	\N	\N	\N
25101	1242	20	3	\N	\N	\N	\N
25102	1242	21	3	\N	\N	\N	\N
25103	1242	22	3	\N	\N	\N	\N
25104	1242	23	2	\N	\N	\N	\N
25105	1242	24	3	\N	\N	\N	\N
25106	1242	27	3	\N	\N	\N	\N
25107	1242	28	3	\N	\N	\N	\N
25108	1242	29	3	\N	\N	\N	\N
25109	1242	30	2	\N	\N	\N	\N
25110	1242	31	4	\N	\N	\N	\N
25111	1242	32	2	\N	\N	\N	\N
25112	1242	33	2	\N	\N	\N	\N
25113	1242	34	2	\N	\N	\N	\N
25114	1242	35	1	\N	\N	\N	\N
25115	1242	36	3	\N	\N	\N	\N
25116	1242	37	3	\N	\N	\N	\N
25117	1242	38	3	\N	\N	\N	\N
25118	1242	25	\N	Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.	POSITIVO	0.833	MODELO
25119	1242	26	\N	Actualizar algunos ejemplos que se sienten un poco viejos.	NEUTRO	0.533	MODELO
25120	1241	18	2	\N	\N	\N	\N
25121	1241	19	3	\N	\N	\N	\N
25122	1241	20	3	\N	\N	\N	\N
25123	1241	21	1	\N	\N	\N	\N
25124	1241	22	3	\N	\N	\N	\N
25125	1241	23	3	\N	\N	\N	\N
25126	1241	24	2	\N	\N	\N	\N
25127	1241	27	4	\N	\N	\N	\N
25128	1241	28	2	\N	\N	\N	\N
25129	1241	29	2	\N	\N	\N	\N
25130	1241	30	4	\N	\N	\N	\N
25131	1241	31	2	\N	\N	\N	\N
25132	1241	32	2	\N	\N	\N	\N
25133	1241	33	2	\N	\N	\N	\N
25134	1241	34	2	\N	\N	\N	\N
25135	1241	35	3	\N	\N	\N	\N
25136	1241	36	4	\N	\N	\N	\N
25137	1241	37	3	\N	\N	\N	\N
25138	1241	38	3	\N	\N	\N	\N
25139	1241	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.678	MODELO
25140	1241	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.703	MODELO
25141	1240	18	1	\N	\N	\N	\N
25142	1240	19	2	\N	\N	\N	\N
25143	1240	20	4	\N	\N	\N	\N
25144	1240	21	3	\N	\N	\N	\N
25145	1240	22	3	\N	\N	\N	\N
25146	1240	23	2	\N	\N	\N	\N
25147	1240	24	2	\N	\N	\N	\N
25148	1240	27	2	\N	\N	\N	\N
25149	1240	28	3	\N	\N	\N	\N
25150	1240	29	2	\N	\N	\N	\N
25151	1240	30	3	\N	\N	\N	\N
25152	1240	31	3	\N	\N	\N	\N
25153	1240	32	2	\N	\N	\N	\N
25154	1240	33	3	\N	\N	\N	\N
25155	1240	34	1	\N	\N	\N	\N
25156	1240	35	2	\N	\N	\N	\N
25157	1240	36	3	\N	\N	\N	\N
25158	1240	37	2	\N	\N	\N	\N
25159	1240	38	3	\N	\N	\N	\N
25160	1240	25	\N	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.915	MODELO
25161	1240	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.534	MODELO
25162	1239	18	4	\N	\N	\N	\N
25163	1239	19	3	\N	\N	\N	\N
25164	1239	20	4	\N	\N	\N	\N
25165	1239	21	3	\N	\N	\N	\N
25166	1239	22	1	\N	\N	\N	\N
25167	1239	23	2	\N	\N	\N	\N
25168	1239	24	4	\N	\N	\N	\N
25169	1239	27	3	\N	\N	\N	\N
25170	1239	28	3	\N	\N	\N	\N
25171	1239	29	3	\N	\N	\N	\N
25172	1239	30	4	\N	\N	\N	\N
25173	1239	31	1	\N	\N	\N	\N
25174	1239	32	3	\N	\N	\N	\N
25175	1239	33	3	\N	\N	\N	\N
25176	1239	34	3	\N	\N	\N	\N
25177	1239	35	2	\N	\N	\N	\N
25178	1239	36	2	\N	\N	\N	\N
25179	1239	37	3	\N	\N	\N	\N
25180	1239	38	2	\N	\N	\N	\N
25181	1239	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.894	MODELO
25182	1239	26	\N	Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.	NEUTRO	0.605	MODELO
25183	1238	18	3	\N	\N	\N	\N
25184	1238	19	2	\N	\N	\N	\N
25185	1238	20	3	\N	\N	\N	\N
25186	1238	21	3	\N	\N	\N	\N
25187	1238	22	4	\N	\N	\N	\N
25188	1238	23	4	\N	\N	\N	\N
25189	1238	24	3	\N	\N	\N	\N
25190	1238	27	3	\N	\N	\N	\N
25191	1238	28	3	\N	\N	\N	\N
25192	1238	29	1	\N	\N	\N	\N
25193	1238	30	4	\N	\N	\N	\N
25194	1238	31	2	\N	\N	\N	\N
25195	1238	32	2	\N	\N	\N	\N
25196	1238	33	2	\N	\N	\N	\N
25197	1238	34	2	\N	\N	\N	\N
25198	1238	35	3	\N	\N	\N	\N
25199	1238	36	2	\N	\N	\N	\N
25200	1238	37	1	\N	\N	\N	\N
25201	1238	38	2	\N	\N	\N	\N
25202	1238	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.797	MODELO
25203	1238	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.683	MODELO
25204	1237	18	3	\N	\N	\N	\N
25205	1237	19	2	\N	\N	\N	\N
25206	1237	20	4	\N	\N	\N	\N
25207	1237	21	4	\N	\N	\N	\N
25208	1237	22	2	\N	\N	\N	\N
25209	1237	23	3	\N	\N	\N	\N
25210	1237	24	2	\N	\N	\N	\N
25211	1237	27	2	\N	\N	\N	\N
25212	1237	28	3	\N	\N	\N	\N
25213	1237	29	2	\N	\N	\N	\N
25214	1237	30	2	\N	\N	\N	\N
25215	1237	31	1	\N	\N	\N	\N
25216	1237	32	2	\N	\N	\N	\N
25217	1237	33	2	\N	\N	\N	\N
25218	1237	34	4	\N	\N	\N	\N
25219	1237	35	3	\N	\N	\N	\N
25220	1237	36	2	\N	\N	\N	\N
25221	1237	37	3	\N	\N	\N	\N
25222	1237	38	4	\N	\N	\N	\N
25223	1237	25	\N	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.87	MODELO
25224	1237	26	\N	Cambiar completamente su metodología, solo dicta y no hay participación.	NEGATIVO	0.781	MODELO
25225	1236	18	1	\N	\N	\N	\N
25226	1236	19	3	\N	\N	\N	\N
25227	1236	20	4	\N	\N	\N	\N
25228	1236	21	2	\N	\N	\N	\N
25229	1236	22	2	\N	\N	\N	\N
25230	1236	23	3	\N	\N	\N	\N
25231	1236	24	2	\N	\N	\N	\N
25232	1236	27	3	\N	\N	\N	\N
25233	1236	28	3	\N	\N	\N	\N
25234	1236	29	2	\N	\N	\N	\N
25235	1236	30	2	\N	\N	\N	\N
25236	1236	31	3	\N	\N	\N	\N
25237	1236	32	3	\N	\N	\N	\N
25238	1236	33	1	\N	\N	\N	\N
25239	1236	34	2	\N	\N	\N	\N
25240	1236	35	3	\N	\N	\N	\N
25241	1236	36	3	\N	\N	\N	\N
25242	1236	37	3	\N	\N	\N	\N
25243	1236	38	2	\N	\N	\N	\N
25244	1236	25	\N	La única fortaleza es que el curso terminó.	NEGATIVO	0.746	MODELO
25245	1236	26	\N	Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.	NEUTRO	0.736	MODELO
25246	1235	18	3	\N	\N	\N	\N
25247	1235	19	4	\N	\N	\N	\N
25248	1235	20	4	\N	\N	\N	\N
25249	1235	21	2	\N	\N	\N	\N
25250	1235	22	4	\N	\N	\N	\N
25251	1235	23	3	\N	\N	\N	\N
25252	1235	24	3	\N	\N	\N	\N
25253	1235	27	2	\N	\N	\N	\N
25254	1235	28	1	\N	\N	\N	\N
25255	1235	29	3	\N	\N	\N	\N
25256	1235	30	4	\N	\N	\N	\N
25257	1235	31	2	\N	\N	\N	\N
25258	1235	32	2	\N	\N	\N	\N
25259	1235	33	2	\N	\N	\N	\N
25260	1235	34	4	\N	\N	\N	\N
25261	1235	35	3	\N	\N	\N	\N
25262	1235	36	3	\N	\N	\N	\N
25263	1235	37	2	\N	\N	\N	\N
25264	1235	38	3	\N	\N	\N	\N
25265	1235	25	\N	Las asesorías personalizadas me salvaron el parcial, gran disposición.	POSITIVO	0.786	MODELO
25266	1235	26	\N	Escuchar más al grupo cuando se piden cambios en el cronograma.	NEUTRO	0.719	MODELO
25267	1234	18	3	\N	\N	\N	\N
25268	1234	19	4	\N	\N	\N	\N
25269	1234	20	2	\N	\N	\N	\N
25270	1234	21	2	\N	\N	\N	\N
25271	1234	22	2	\N	\N	\N	\N
25272	1234	23	4	\N	\N	\N	\N
25273	1234	24	2	\N	\N	\N	\N
25274	1234	27	2	\N	\N	\N	\N
25275	1234	28	4	\N	\N	\N	\N
25276	1234	29	3	\N	\N	\N	\N
25277	1234	30	3	\N	\N	\N	\N
25278	1234	31	3	\N	\N	\N	\N
25279	1234	32	4	\N	\N	\N	\N
25280	1234	33	3	\N	\N	\N	\N
25281	1234	34	3	\N	\N	\N	\N
25282	1234	35	2	\N	\N	\N	\N
25283	1234	36	2	\N	\N	\N	\N
25284	1234	37	3	\N	\N	\N	\N
25285	1234	38	2	\N	\N	\N	\N
25286	1234	25	\N	Da ejemplos de la vida real aunque no siempre conectan con el tema.	NEUTRO	0.561	MODELO
25287	1234	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.661	MODELO
25288	1233	18	2	\N	\N	\N	\N
25289	1233	19	3	\N	\N	\N	\N
25290	1233	20	2	\N	\N	\N	\N
25291	1233	21	2	\N	\N	\N	\N
25292	1233	22	3	\N	\N	\N	\N
25293	1233	23	2	\N	\N	\N	\N
25294	1233	24	3	\N	\N	\N	\N
25295	1233	27	2	\N	\N	\N	\N
25296	1233	28	3	\N	\N	\N	\N
25297	1233	29	3	\N	\N	\N	\N
25298	1233	30	4	\N	\N	\N	\N
25299	1233	31	4	\N	\N	\N	\N
25300	1233	32	3	\N	\N	\N	\N
25301	1233	33	2	\N	\N	\N	\N
25302	1233	34	3	\N	\N	\N	\N
25303	1233	35	2	\N	\N	\N	\N
25304	1233	36	3	\N	\N	\N	\N
25305	1233	37	3	\N	\N	\N	\N
25306	1233	38	2	\N	\N	\N	\N
25307	1233	25	\N	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.853	MODELO
25308	1233	26	\N	Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.	NEGATIVO	0.934	MODELO
25309	1232	18	3	\N	\N	\N	\N
25310	1232	19	2	\N	\N	\N	\N
25311	1232	20	1	\N	\N	\N	\N
25312	1232	21	2	\N	\N	\N	\N
25313	1232	22	4	\N	\N	\N	\N
25314	1232	23	2	\N	\N	\N	\N
25315	1232	24	3	\N	\N	\N	\N
25316	1232	27	3	\N	\N	\N	\N
25317	1232	28	2	\N	\N	\N	\N
25318	1232	29	3	\N	\N	\N	\N
25319	1232	30	4	\N	\N	\N	\N
25320	1232	31	1	\N	\N	\N	\N
25321	1232	32	3	\N	\N	\N	\N
25322	1232	33	2	\N	\N	\N	\N
25323	1232	34	1	\N	\N	\N	\N
25324	1232	35	1	\N	\N	\N	\N
25325	1232	36	3	\N	\N	\N	\N
25326	1232	37	4	\N	\N	\N	\N
25327	1232	38	2	\N	\N	\N	\N
25328	1232	25	\N	Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.	NEGATIVO	0.935	MODELO
25329	1232	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.79	MODELO
25330	1231	18	3	\N	\N	\N	\N
25331	1231	19	3	\N	\N	\N	\N
25332	1231	20	2	\N	\N	\N	\N
25333	1231	21	3	\N	\N	\N	\N
25334	1231	22	2	\N	\N	\N	\N
25335	1231	23	2	\N	\N	\N	\N
25336	1231	24	3	\N	\N	\N	\N
25337	1231	27	1	\N	\N	\N	\N
25338	1231	28	2	\N	\N	\N	\N
25339	1231	29	3	\N	\N	\N	\N
25340	1231	30	3	\N	\N	\N	\N
25341	1231	31	1	\N	\N	\N	\N
25342	1231	32	3	\N	\N	\N	\N
25343	1231	33	2	\N	\N	\N	\N
25344	1231	34	3	\N	\N	\N	\N
25345	1231	35	4	\N	\N	\N	\N
25346	1231	36	2	\N	\N	\N	\N
25347	1231	37	1	\N	\N	\N	\N
25348	1231	38	2	\N	\N	\N	\N
25349	1231	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.692	MODELO
25350	1231	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.721	MODELO
25351	1230	18	3	\N	\N	\N	\N
25352	1230	19	3	\N	\N	\N	\N
25353	1230	20	2	\N	\N	\N	\N
25354	1230	21	2	\N	\N	\N	\N
25355	1230	22	2	\N	\N	\N	\N
25356	1230	23	3	\N	\N	\N	\N
25357	1230	24	2	\N	\N	\N	\N
25358	1230	27	3	\N	\N	\N	\N
25359	1230	28	2	\N	\N	\N	\N
25360	1230	29	3	\N	\N	\N	\N
25361	1230	30	2	\N	\N	\N	\N
25362	1230	31	4	\N	\N	\N	\N
25363	1230	32	4	\N	\N	\N	\N
25364	1230	33	3	\N	\N	\N	\N
25365	1230	34	3	\N	\N	\N	\N
25366	1230	35	4	\N	\N	\N	\N
25367	1230	36	3	\N	\N	\N	\N
25368	1230	37	3	\N	\N	\N	\N
25369	1230	38	3	\N	\N	\N	\N
25370	1230	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.791	MODELO
25371	1230	26	\N	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.71	MODELO
25372	1229	18	2	\N	\N	\N	\N
25373	1229	19	2	\N	\N	\N	\N
25374	1229	20	3	\N	\N	\N	\N
25375	1229	21	1	\N	\N	\N	\N
25376	1229	22	3	\N	\N	\N	\N
25377	1229	23	3	\N	\N	\N	\N
25378	1229	24	2	\N	\N	\N	\N
25379	1229	27	2	\N	\N	\N	\N
25380	1229	28	2	\N	\N	\N	\N
25381	1229	29	1	\N	\N	\N	\N
25382	1229	30	3	\N	\N	\N	\N
25383	1229	31	3	\N	\N	\N	\N
25384	1229	32	3	\N	\N	\N	\N
25385	1229	33	2	\N	\N	\N	\N
25386	1229	34	4	\N	\N	\N	\N
25387	1229	35	3	\N	\N	\N	\N
25388	1229	36	2	\N	\N	\N	\N
25389	1229	37	2	\N	\N	\N	\N
25390	1229	38	2	\N	\N	\N	\N
25391	1229	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.664	MODELO
25392	1229	26	\N	Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.	NEGATIVO	0.914	MODELO
25393	1228	18	4	\N	\N	\N	\N
25394	1228	19	3	\N	\N	\N	\N
25395	1228	20	3	\N	\N	\N	\N
25396	1228	21	3	\N	\N	\N	\N
25397	1228	22	3	\N	\N	\N	\N
25398	1228	23	4	\N	\N	\N	\N
25399	1228	24	3	\N	\N	\N	\N
25400	1228	27	3	\N	\N	\N	\N
25401	1228	28	4	\N	\N	\N	\N
25402	1228	29	3	\N	\N	\N	\N
25403	1228	30	2	\N	\N	\N	\N
25404	1228	31	1	\N	\N	\N	\N
25405	1228	32	1	\N	\N	\N	\N
25406	1228	33	3	\N	\N	\N	\N
25407	1228	34	4	\N	\N	\N	\N
25408	1228	35	4	\N	\N	\N	\N
25409	1228	36	3	\N	\N	\N	\N
25410	1228	37	2	\N	\N	\N	\N
25411	1228	38	2	\N	\N	\N	\N
25412	1228	25	\N	El material que comparte está muy completo y actualizado.	POSITIVO	0.8	MODELO
25413	1228	26	\N	Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.	NEUTRO	0.551	MODELO
25414	1227	18	3	\N	\N	\N	\N
25415	1227	19	3	\N	\N	\N	\N
25416	1227	20	2	\N	\N	\N	\N
25417	1227	21	2	\N	\N	\N	\N
25418	1227	22	3	\N	\N	\N	\N
25419	1227	23	2	\N	\N	\N	\N
25420	1227	24	1	\N	\N	\N	\N
25421	1227	27	3	\N	\N	\N	\N
25422	1227	28	4	\N	\N	\N	\N
25423	1227	29	1	\N	\N	\N	\N
25424	1227	30	4	\N	\N	\N	\N
25425	1227	31	2	\N	\N	\N	\N
25426	1227	32	2	\N	\N	\N	\N
25427	1227	33	3	\N	\N	\N	\N
25428	1227	34	3	\N	\N	\N	\N
25429	1227	35	3	\N	\N	\N	\N
25430	1227	36	2	\N	\N	\N	\N
25431	1227	37	2	\N	\N	\N	\N
25432	1227	38	2	\N	\N	\N	\N
25433	1227	25	\N	Ninguna que valga la pena mencionar.	NEGATIVO	0.853	MODELO
25434	1227	26	\N	Dar retroalimentación más detallada, no solo la nota.	NEUTRO	0.625	MODELO
25435	1226	18	4	\N	\N	\N	\N
25436	1226	19	2	\N	\N	\N	\N
25437	1226	20	2	\N	\N	\N	\N
25438	1226	21	3	\N	\N	\N	\N
25439	1226	22	2	\N	\N	\N	\N
25440	1226	23	2	\N	\N	\N	\N
25441	1226	24	2	\N	\N	\N	\N
25442	1226	27	1	\N	\N	\N	\N
25443	1226	28	2	\N	\N	\N	\N
25444	1226	29	4	\N	\N	\N	\N
25445	1226	30	4	\N	\N	\N	\N
25446	1226	31	2	\N	\N	\N	\N
25447	1226	32	3	\N	\N	\N	\N
25448	1226	33	2	\N	\N	\N	\N
25449	1226	34	1	\N	\N	\N	\N
25450	1226	35	2	\N	\N	\N	\N
25451	1226	36	4	\N	\N	\N	\N
25452	1226	37	2	\N	\N	\N	\N
25453	1226	38	2	\N	\N	\N	\N
25454	1226	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.784	MODELO
25455	1226	26	\N	Bajar el tono con los estudiantes, humilla a quien pregunta.	NEGATIVO	0.7	MODELO
25456	1225	18	2	\N	\N	\N	\N
25457	1225	19	4	\N	\N	\N	\N
25458	1225	20	2	\N	\N	\N	\N
25459	1225	21	2	\N	\N	\N	\N
25460	1225	22	3	\N	\N	\N	\N
25461	1225	23	4	\N	\N	\N	\N
25462	1225	24	4	\N	\N	\N	\N
25463	1225	27	2	\N	\N	\N	\N
25464	1225	28	3	\N	\N	\N	\N
25465	1225	29	4	\N	\N	\N	\N
25466	1225	30	2	\N	\N	\N	\N
25467	1225	31	3	\N	\N	\N	\N
25468	1225	32	3	\N	\N	\N	\N
25469	1225	33	2	\N	\N	\N	\N
25470	1225	34	3	\N	\N	\N	\N
25471	1225	35	1	\N	\N	\N	\N
25472	1225	36	2	\N	\N	\N	\N
25473	1225	37	2	\N	\N	\N	\N
25474	1225	38	2	\N	\N	\N	\N
25475	1225	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.682	MODELO
25476	1225	26	\N	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.568	MODELO
25477	1224	18	2	\N	\N	\N	\N
25478	1224	19	4	\N	\N	\N	\N
25479	1224	20	3	\N	\N	\N	\N
25480	1224	21	1	\N	\N	\N	\N
25481	1224	22	1	\N	\N	\N	\N
25482	1224	23	3	\N	\N	\N	\N
25483	1224	24	3	\N	\N	\N	\N
25484	1224	27	1	\N	\N	\N	\N
25485	1224	28	3	\N	\N	\N	\N
25486	1224	29	4	\N	\N	\N	\N
25487	1224	30	2	\N	\N	\N	\N
25488	1224	31	4	\N	\N	\N	\N
25489	1224	32	2	\N	\N	\N	\N
25490	1224	33	3	\N	\N	\N	\N
25491	1224	34	2	\N	\N	\N	\N
25492	1224	35	2	\N	\N	\N	\N
25493	1224	36	2	\N	\N	\N	\N
25494	1224	37	4	\N	\N	\N	\N
25495	1224	38	3	\N	\N	\N	\N
25496	1224	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.805	MODELO
25497	1224	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.521	MODELO
25498	1223	18	2	\N	\N	\N	\N
25499	1223	19	2	\N	\N	\N	\N
25500	1223	20	2	\N	\N	\N	\N
25501	1223	21	3	\N	\N	\N	\N
25502	1223	22	3	\N	\N	\N	\N
25503	1223	23	4	\N	\N	\N	\N
25504	1223	24	2	\N	\N	\N	\N
25505	1223	27	2	\N	\N	\N	\N
25506	1223	28	2	\N	\N	\N	\N
25507	1223	29	1	\N	\N	\N	\N
25508	1223	30	3	\N	\N	\N	\N
25509	1223	31	2	\N	\N	\N	\N
25510	1223	32	3	\N	\N	\N	\N
25511	1223	33	2	\N	\N	\N	\N
25512	1223	34	3	\N	\N	\N	\N
25513	1223	35	4	\N	\N	\N	\N
25514	1223	36	2	\N	\N	\N	\N
25515	1223	37	2	\N	\N	\N	\N
25516	1223	38	4	\N	\N	\N	\N
25517	1223	25	\N	Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.	POSITIVO	0.878	MODELO
25518	1223	26	\N	Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.	NEGATIVO	0.791	MODELO
25519	1222	18	3	\N	\N	\N	\N
25520	1222	19	3	\N	\N	\N	\N
25521	1222	20	2	\N	\N	\N	\N
25522	1222	21	2	\N	\N	\N	\N
25523	1222	22	3	\N	\N	\N	\N
25524	1222	23	2	\N	\N	\N	\N
25525	1222	24	4	\N	\N	\N	\N
25526	1222	27	1	\N	\N	\N	\N
25527	1222	28	3	\N	\N	\N	\N
25528	1222	29	2	\N	\N	\N	\N
25529	1222	30	4	\N	\N	\N	\N
25530	1222	31	2	\N	\N	\N	\N
25531	1222	32	2	\N	\N	\N	\N
25532	1222	33	2	\N	\N	\N	\N
25533	1222	34	2	\N	\N	\N	\N
25534	1222	35	2	\N	\N	\N	\N
25535	1222	36	2	\N	\N	\N	\N
25536	1222	37	3	\N	\N	\N	\N
25537	1222	38	3	\N	\N	\N	\N
25538	1222	25	\N	Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.	NEGATIVO	0.788	MODELO
25539	1222	26	\N	Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.	NEUTRO	0.682	MODELO
25540	1221	18	3	\N	\N	\N	\N
25541	1221	19	2	\N	\N	\N	\N
25542	1221	20	3	\N	\N	\N	\N
25543	1221	21	2	\N	\N	\N	\N
25544	1221	22	2	\N	\N	\N	\N
25545	1221	23	2	\N	\N	\N	\N
25546	1221	24	1	\N	\N	\N	\N
25547	1221	27	2	\N	\N	\N	\N
25548	1221	28	2	\N	\N	\N	\N
25549	1221	29	3	\N	\N	\N	\N
25550	1221	30	3	\N	\N	\N	\N
25551	1221	31	3	\N	\N	\N	\N
25552	1221	32	1	\N	\N	\N	\N
25553	1221	33	1	\N	\N	\N	\N
25554	1221	34	4	\N	\N	\N	\N
25555	1221	35	2	\N	\N	\N	\N
25556	1221	36	3	\N	\N	\N	\N
25557	1221	37	4	\N	\N	\N	\N
25558	1221	38	2	\N	\N	\N	\N
25559	1221	25	\N	Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.	NEUTRO	0.723	MODELO
25560	1221	26	\N	Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.	NEGATIVO	0.968	MODELO
25561	1220	18	3	\N	\N	\N	\N
25562	1220	19	4	\N	\N	\N	\N
25563	1220	20	3	\N	\N	\N	\N
25564	1220	21	2	\N	\N	\N	\N
25565	1220	22	2	\N	\N	\N	\N
25566	1220	23	1	\N	\N	\N	\N
25567	1220	24	3	\N	\N	\N	\N
25568	1220	27	3	\N	\N	\N	\N
25569	1220	28	2	\N	\N	\N	\N
25570	1220	29	2	\N	\N	\N	\N
25571	1220	30	2	\N	\N	\N	\N
25572	1220	31	3	\N	\N	\N	\N
25573	1220	32	2	\N	\N	\N	\N
25574	1220	33	3	\N	\N	\N	\N
25575	1220	34	3	\N	\N	\N	\N
25576	1220	35	3	\N	\N	\N	\N
25577	1220	36	4	\N	\N	\N	\N
25578	1220	37	3	\N	\N	\N	\N
25579	1220	38	4	\N	\N	\N	\N
25580	1220	25	\N	Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.	POSITIVO	0.806	MODELO
25581	1220	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.74	MODELO
25582	1219	18	2	\N	\N	\N	\N
25583	1219	19	3	\N	\N	\N	\N
25584	1219	20	1	\N	\N	\N	\N
25585	1219	21	3	\N	\N	\N	\N
25586	1219	22	4	\N	\N	\N	\N
25587	1219	23	1	\N	\N	\N	\N
25588	1219	24	3	\N	\N	\N	\N
25589	1219	27	4	\N	\N	\N	\N
25590	1219	28	3	\N	\N	\N	\N
25591	1219	29	4	\N	\N	\N	\N
25592	1219	30	3	\N	\N	\N	\N
25593	1219	31	3	\N	\N	\N	\N
25594	1219	32	2	\N	\N	\N	\N
25595	1219	33	4	\N	\N	\N	\N
25596	1219	34	2	\N	\N	\N	\N
25597	1219	35	2	\N	\N	\N	\N
25598	1219	36	3	\N	\N	\N	\N
25599	1219	37	3	\N	\N	\N	\N
25600	1219	38	4	\N	\N	\N	\N
25601	1219	25	\N	El material de apoyo es útil aunque las clases presenciales son flojas.	NEUTRO	0.661	MODELO
25602	1219	26	\N	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.547	MODELO
25603	1218	18	1	\N	\N	\N	\N
25604	1218	19	2	\N	\N	\N	\N
25605	1218	20	3	\N	\N	\N	\N
25606	1218	21	3	\N	\N	\N	\N
25607	1218	22	3	\N	\N	\N	\N
25608	1218	23	1	\N	\N	\N	\N
25609	1218	24	2	\N	\N	\N	\N
25610	1218	27	4	\N	\N	\N	\N
25611	1218	28	3	\N	\N	\N	\N
25612	1218	29	3	\N	\N	\N	\N
25613	1218	30	2	\N	\N	\N	\N
25614	1218	31	4	\N	\N	\N	\N
25615	1218	32	2	\N	\N	\N	\N
25616	1218	33	1	\N	\N	\N	\N
25617	1218	34	2	\N	\N	\N	\N
25618	1218	35	4	\N	\N	\N	\N
25619	1218	36	4	\N	\N	\N	\N
25620	1218	37	3	\N	\N	\N	\N
25621	1218	38	2	\N	\N	\N	\N
25622	1218	25	\N	Responde las dudas pero de forma muy breve, uno queda con ganas de más.	NEUTRO	0.598	MODELO
25623	1218	26	\N	Variar la metodología, las clases son un poco monótonas.	NEUTRO	0.605	MODELO
25624	1217	18	2	\N	\N	\N	\N
25625	1217	19	1	\N	\N	\N	\N
25626	1217	20	2	\N	\N	\N	\N
25627	1217	21	3	\N	\N	\N	\N
25628	1217	22	3	\N	\N	\N	\N
25629	1217	23	3	\N	\N	\N	\N
25630	1217	24	3	\N	\N	\N	\N
25631	1217	27	2	\N	\N	\N	\N
25632	1217	28	3	\N	\N	\N	\N
25633	1217	29	1	\N	\N	\N	\N
25634	1217	30	2	\N	\N	\N	\N
25635	1217	31	2	\N	\N	\N	\N
25636	1217	32	3	\N	\N	\N	\N
25637	1217	33	2	\N	\N	\N	\N
25638	1217	34	3	\N	\N	\N	\N
25639	1217	35	1	\N	\N	\N	\N
25640	1217	36	3	\N	\N	\N	\N
25641	1217	37	4	\N	\N	\N	\N
25642	1217	38	2	\N	\N	\N	\N
25643	1217	25	\N	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.887	MODELO
25644	1217	26	\N	Revisar la ortografía de sus exámenes y el material, da mala imagen.	NEGATIVO	0.897	MODELO
25645	1216	18	2	\N	\N	\N	\N
25646	1216	19	3	\N	\N	\N	\N
25647	1216	20	2	\N	\N	\N	\N
25648	1216	21	4	\N	\N	\N	\N
25649	1216	22	3	\N	\N	\N	\N
25650	1216	23	3	\N	\N	\N	\N
25651	1216	24	2	\N	\N	\N	\N
25652	1216	27	4	\N	\N	\N	\N
25653	1216	28	3	\N	\N	\N	\N
25654	1216	29	4	\N	\N	\N	\N
25655	1216	30	3	\N	\N	\N	\N
25656	1216	31	2	\N	\N	\N	\N
25657	1216	32	2	\N	\N	\N	\N
25658	1216	33	3	\N	\N	\N	\N
25659	1216	34	2	\N	\N	\N	\N
25660	1216	35	3	\N	\N	\N	\N
25661	1216	36	3	\N	\N	\N	\N
25662	1216	37	3	\N	\N	\N	\N
25663	1216	38	3	\N	\N	\N	\N
25664	1216	25	\N	Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.	POSITIVO	0.867	MODELO
25665	1216	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.922	MODELO
25666	1215	18	4	\N	\N	\N	\N
25667	1215	19	1	\N	\N	\N	\N
25668	1215	20	1	\N	\N	\N	\N
25669	1215	21	3	\N	\N	\N	\N
25670	1215	22	2	\N	\N	\N	\N
25671	1215	23	3	\N	\N	\N	\N
25672	1215	24	3	\N	\N	\N	\N
25673	1215	27	2	\N	\N	\N	\N
25674	1215	28	3	\N	\N	\N	\N
25675	1215	29	4	\N	\N	\N	\N
25676	1215	30	3	\N	\N	\N	\N
25677	1215	31	2	\N	\N	\N	\N
25678	1215	32	1	\N	\N	\N	\N
25679	1215	33	2	\N	\N	\N	\N
25680	1215	34	3	\N	\N	\N	\N
25681	1215	35	2	\N	\N	\N	\N
25682	1215	36	3	\N	\N	\N	\N
25683	1215	37	2	\N	\N	\N	\N
25684	1215	38	2	\N	\N	\N	\N
25685	1215	25	\N	Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.	NEGATIVO	0.861	MODELO
25686	1215	26	\N	Más compromiso: la clase se sentía como un trámite para él.	NEGATIVO	0.72	MODELO
25687	1214	18	3	\N	\N	\N	\N
25688	1214	19	3	\N	\N	\N	\N
25689	1214	20	3	\N	\N	\N	\N
25690	1214	21	1	\N	\N	\N	\N
25691	1214	22	3	\N	\N	\N	\N
25692	1214	23	1	\N	\N	\N	\N
25693	1214	24	4	\N	\N	\N	\N
25694	1214	27	2	\N	\N	\N	\N
25695	1214	28	1	\N	\N	\N	\N
25696	1214	29	3	\N	\N	\N	\N
25697	1214	30	2	\N	\N	\N	\N
25698	1214	31	3	\N	\N	\N	\N
25699	1214	32	4	\N	\N	\N	\N
25700	1214	33	4	\N	\N	\N	\N
25701	1214	34	2	\N	\N	\N	\N
25702	1214	35	4	\N	\N	\N	\N
25703	1214	36	2	\N	\N	\N	\N
25704	1214	37	3	\N	\N	\N	\N
25705	1214	38	3	\N	\N	\N	\N
25706	1214	25	\N	Muy buena actitud siempre, se nota que le gusta enseñar.	POSITIVO	0.807	MODELO
25707	1214	26	\N	Que los exámenes tengan relación con lo enseñado, parecían de otra materia.	NEGATIVO	0.71	MODELO
25708	1213	18	3	\N	\N	\N	\N
25709	1213	19	3	\N	\N	\N	\N
25710	1213	20	2	\N	\N	\N	\N
25711	1213	21	1	\N	\N	\N	\N
25712	1213	22	3	\N	\N	\N	\N
25713	1213	23	4	\N	\N	\N	\N
25714	1213	24	4	\N	\N	\N	\N
25715	1213	27	2	\N	\N	\N	\N
25716	1213	28	2	\N	\N	\N	\N
25717	1213	29	2	\N	\N	\N	\N
25718	1213	30	3	\N	\N	\N	\N
25719	1213	31	3	\N	\N	\N	\N
25720	1213	32	3	\N	\N	\N	\N
25721	1213	33	2	\N	\N	\N	\N
25722	1213	34	2	\N	\N	\N	\N
25723	1213	35	4	\N	\N	\N	\N
25724	1213	36	3	\N	\N	\N	\N
25725	1213	37	3	\N	\N	\N	\N
25726	1213	38	2	\N	\N	\N	\N
25727	1213	25	\N	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.738	MODELO
25728	1213	26	\N	Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.	POSITIVO	0.948	MODELO
25729	1212	18	3	\N	\N	\N	\N
25730	1212	19	4	\N	\N	\N	\N
25731	1212	20	3	\N	\N	\N	\N
25732	1212	21	1	\N	\N	\N	\N
25733	1212	22	2	\N	\N	\N	\N
25734	1212	23	1	\N	\N	\N	\N
25735	1212	24	2	\N	\N	\N	\N
25736	1212	27	2	\N	\N	\N	\N
25737	1212	28	1	\N	\N	\N	\N
25738	1212	29	3	\N	\N	\N	\N
25739	1212	30	2	\N	\N	\N	\N
25740	1212	31	3	\N	\N	\N	\N
25741	1212	32	3	\N	\N	\N	\N
25742	1212	33	3	\N	\N	\N	\N
25743	1212	34	2	\N	\N	\N	\N
25744	1212	35	4	\N	\N	\N	\N
25745	1212	36	1	\N	\N	\N	\N
25746	1212	37	1	\N	\N	\N	\N
25747	1212	38	2	\N	\N	\N	\N
25748	1212	25	\N	Hay clases donde se nota la experiencia, otras donde se siente improvisado.	NEUTRO	0.672	MODELO
25749	1212	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.906	MODELO
25750	1211	18	3	\N	\N	\N	\N
25751	1211	19	3	\N	\N	\N	\N
25752	1211	20	2	\N	\N	\N	\N
25753	1211	21	1	\N	\N	\N	\N
25754	1211	22	3	\N	\N	\N	\N
25755	1211	23	2	\N	\N	\N	\N
25756	1211	24	3	\N	\N	\N	\N
25757	1211	27	3	\N	\N	\N	\N
25758	1211	28	1	\N	\N	\N	\N
25759	1211	29	3	\N	\N	\N	\N
25760	1211	30	3	\N	\N	\N	\N
25761	1211	31	4	\N	\N	\N	\N
25762	1211	32	2	\N	\N	\N	\N
25763	1211	33	1	\N	\N	\N	\N
25764	1211	34	4	\N	\N	\N	\N
25765	1211	35	2	\N	\N	\N	\N
25766	1211	36	3	\N	\N	\N	\N
25767	1211	37	3	\N	\N	\N	\N
25768	1211	38	2	\N	\N	\N	\N
25769	1211	25	\N	Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.	POSITIVO	0.889	MODELO
25770	1211	26	\N	Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.	NEUTRO	0.545	MODELO
25771	1210	18	3	\N	\N	\N	\N
25772	1210	19	3	\N	\N	\N	\N
25773	1210	20	3	\N	\N	\N	\N
25774	1210	21	3	\N	\N	\N	\N
25775	1210	22	2	\N	\N	\N	\N
25776	1210	23	3	\N	\N	\N	\N
25777	1210	24	1	\N	\N	\N	\N
25778	1210	27	4	\N	\N	\N	\N
25779	1210	28	2	\N	\N	\N	\N
25780	1210	29	3	\N	\N	\N	\N
25781	1210	30	1	\N	\N	\N	\N
25782	1210	31	1	\N	\N	\N	\N
25783	1210	32	3	\N	\N	\N	\N
25784	1210	33	2	\N	\N	\N	\N
25785	1210	34	4	\N	\N	\N	\N
25786	1210	35	3	\N	\N	\N	\N
25787	1210	36	2	\N	\N	\N	\N
25788	1210	37	2	\N	\N	\N	\N
25789	1210	38	3	\N	\N	\N	\N
25790	1210	25	\N	Le importa que de verdad aprendamos, no que solo pasemos la materia.	POSITIVO	0.837	MODELO
25791	1210	26	\N	Escuchar: varios le reportamos problemas y nunca hizo nada.	NEGATIVO	0.897	MODELO
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
44	0222400043	$2a$10$osZMMR/szTmrlLZYEkIyWOCfTyaovEm0lEdBRz5dbPmxowQNDZFE2	ESTUDIANTE	DANIEL GARCIA HERNANDEZ RODRIGUEZ	43	\N	ACTIVO	\N	2026-10-23 01:24:09.266586+00
43	0222400042	$2a$10$H1NF/kTUp9xT6L01FMqjAepAETursrkPcRUBX9Av9N3beT0hSomzi	ESTUDIANTE	GABRIELA MARTINEZ DIAZ SUAREZ	42	\N	ACTIVO	2026-10-25 05:11:00.487001+00	2026-10-23 01:24:09.266586+00
42	0222400041	$2a$10$c42Ttpbnnv.gwADtU5lurekdelvK2pdOKKrHtwvZ5EWpLqANp/0De	ESTUDIANTE	SANTIAGO RODRIGUEZ LOPEZ DIAZ	41	\N	ACTIVO	2026-10-25 03:36:21.660968+00	2026-10-23 01:24:09.266586+00
8	0222400007	$2a$10$eVZ7ZPOa0nl.xN0LnQJi3eZowqaPT.lFZ/dCZr5PtmL4P6ASg8S2u	ESTUDIANTE	CAMILA DIAZ CASTRO CASTRO	7	\N	ACTIVO	2026-10-25 05:17:06.670915+00	2026-10-23 01:24:09.266586+00
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
2	0222400001	$2a$10$xKDdnF7vaeDJvvliRoLqneiUAEctXtYuBT8e2mq.gwFx9ZXZ81cgS	ESTUDIANTE	MARIA JOSE RODRIGUEZ LOPEZ DIAZ	1	\N	ACTIVO	2026-10-25 05:37:56.692382+00	2026-10-23 01:24:09.266586+00
56	0222400051	$2a$10$w/xl8Ro2zwrokEw5oe8MhesqjoqWvV3zi16jmgT8aOgJIcE5uclie	ESTUDIANTE	ELVIS TEK CARDENAS RUIZ	51	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
57	0222400052	$2a$10$HYF5wHBTx3Q/DhRzIN15r.93Ek.PTLd6x/vOybfYhCiRIJ19y0sXG	ESTUDIANTE	ARMANDO PAREDES SOLIS	52	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
58	0222400053	$2a$10$4rtnBJ/qNazRCSjwzu4.n.HSSNEBjzFUO2cq0RMgOD6GfZqEJn6yK	ESTUDIANTE	YUSLEIDY DAYANA MANGONES PERTUZ	53	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
59	0222400054	$2a$10$EBLz2amtEWX3xXfesO5Byejbn72TRXafOE6yIV03pc53Hx3r80D7e	ESTUDIANTE	JHON JAIRO MONTENEGRO PADILLA	54	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
60	0222400055	$2a$10$D2JRhXkNeRRZGkYE.sDJI.rj1SD/Q25NZbdPFPQ/hCahHs/C.1Qjm	ESTUDIANTE	BRAYAN STIVEN PALOMINO ROZO	55	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
61	0222400056	$2a$10$hKRFJ8Y/Npym5egXTolH8OmDyA82Ma37Fl5H6LxgmuRAESMuaUP0S	ESTUDIANTE	YEISON DAVID CARRENO HERNANDEZ	56	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
62	0222400057	$2a$10$Z2txAbcA4YWsruA38lDtbuAfiY1tDBNb.3JS6L2Ulg..ogPp1uNOa	ESTUDIANTE	USNAVY MARIA RIBON CANTILLO	57	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
63	0222400058	$2a$10$/C8fxsb6guMqh/zYTHpmie9NtdQqkMZfMIrKCxkfbF1v/i./JGp.K	ESTUDIANTE	DEIBY YHOAN QUINTERO BOSSA	58	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
64	0222400059	$2a$10$PpNpYEK1wRK5gLG4APxo3OcCvcijiJf8ffWD53NNoTUhDNWTAGtEi	ESTUDIANTE	ZOILA ROSA PRADO SIERRA	59	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
65	0222400060	$2a$10$/1cRgp4QNsJ.yt6hcQGC1ehkLrNJJhnszEkM/poEyE34unPcApOqy	ESTUDIANTE	JUAN BAUTISTA UPARELA MENA	60	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
66	0222400061	$2a$10$SMgCNo0EnTCESGvtjTYEMeqS/wsn1ht7tGYsmFeaAbuksofuXfO0C	ESTUDIANTE	SANDY CALO DOMINGUEZ	61	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
67	0222400062	$2a$10$2AVApDP4mTw5hbm6EZu84.Ea9z.Uj6E6waf8Wi5C6U8bXREkO6w7C	ESTUDIANTE	ESTEBAN QUITO MORELOS	62	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
68	0222400063	$2a$10$4E3066rqM3yqlL35Eu67Ou2c.HQMxCbfIdj4V5dne3/xnDBGTlRqC	ESTUDIANTE	MILEIDY CAROLINA PERTUZ ANAYA	63	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
69	0222400064	$2a$10$szh0uU31syR/ElqXmjU83Ok2mAZ2n0FMHGm/xAv5jEw4u4nNW4diC	ESTUDIANTE	WILSON YESID SAMPEDRO AVILA	64	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
70	0222400065	$2a$10$QMjak1ALsxsdkj8pSHzboekwR.ZVdwDT7Beflb0NKZzVV1093cVVa	ESTUDIANTE	LEIDY JOHANA MERCADO FONTALVO	65	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
71	0222400066	$2a$10$LMv4D5C89bl2//r/DI1UQufLz0ZXyqMu8F0FC/8mU4GZuHO1Slfhu	ESTUDIANTE	OTONIEL ANDRES FERNANDEZ DE ARCO	66	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
72	0222400067	$2a$10$KF/LVbUlcN8ZQkNwK9D7dO6SDyLgTB1/lHCVmBDP2kyYJ8ByWZYUy	ESTUDIANTE	DUBIAN STIVE BLANQUICETT ORTEGA	67	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
73	0222400068	$2a$10$tBy7AL40gNdIzo0mPLm9PuQPdWB/LvRSKHbmH/8fK19FjipKwDhou	ESTUDIANTE	YAJIRO SITH MERCADO	68	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
74	0222400069	$2a$10$IaIo0PyT0tDGkkMbOE/HWO.zrKzNBxXgXKSKgHxwxSZlebrpKmx0W	ESTUDIANTE	ANGIE PAOLA CANTILLO FLOREZ	69	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
75	0222400070	$2a$10$yJu116CjbaRJDV2JWbRN7ulnBlJJbXp/XsM6hbc4siOrx.GsvZ10G	ESTUDIANTE	ORLANDO ENRIQUE TOLEDO MARTINEZ	70	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
76	0222400071	$2a$10$fNpkKdYKzmzFAR8DfwxlzO1CDeBIQDpYYAceY1190t1n1tnjbLKLS	ESTUDIANTE	MARLON BRANDO CARRILLO VEGA	71	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
77	0222400072	$2a$10$yN3S7YWiJIYz7E3c5oGCFOUFiynnmYfu/W377nGKApzuC5xavNL1e	ESTUDIANTE	PEDRO PABLO PEREZ PEREZ	72	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
78	0222400073	$2a$10$vw5eOeIyDHh.vkfN5L4eXejrve5ZNg/N7I6j.G9cmS9sWh9u/di96	ESTUDIANTE	INGRID YOHANA BARRIOS LOZANO	73	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
79	0222400074	$2a$10$lFnm/jGWdj6yEvEfQaw8ouPYMkPe5Ky/GFOt3oOlw3wBaTvyQNKpq	ESTUDIANTE	KEVIN JHOJAN LACOUTURE RIOS	74	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
80	0222400075	$2a$10$ocEyDfR2vu74/beMC.HbLeA/bHhvVIo6rC5keON6mnVLAtzOySJ6S	ESTUDIANTE	ROSALBA ENEIDA TAMARA PICON	75	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
81	0222400076	$2a$10$Nl8rRE.0b2oku0W64ys2H.9wutSQoukmryyylqW69lnVAaUe2wBTC	ESTUDIANTE	FULANITO DE TAL MARTINEZ	76	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
82	0222400077	$2a$10$5JliA3q3bBmuQ1b3OY0EF.FV5tBeBoLKLM8cmgH.qKXmZ2jQBgSQC	ESTUDIANTE	BRAYAN MAICOL ORTIZ CERCHIOLO	77	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
83	0222400078	$2a$10$sEi6t6JCQLoApV0yrLcP7uKdKjVG8JbbKjzzivmSqnA8Wrc1BS1hO	ESTUDIANTE	DAYANA CAROLINA INSIGNARES OJEDA	78	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
84	0222400079	$2a$10$Fx59fUf7hxPi3yb10OlwBOf1jUrxl9DikvoWmp/PUhANL.v/dn.xm	ESTUDIANTE	ROBERTO CARLOS HINOJOSA PADRON	79	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
85	0222400080	$2a$10$GBQT7/DEF8FpmL6EI6pEyuS95CV0wnGhGkqtdX030dQrBrbBtjxvC	ESTUDIANTE	CINDY LORENA PADILLA ROSALES	80	\N	ACTIVO	\N	2026-10-25 17:38:02.649322+00
86	74112233	$2a$10$bah55BFVeusw/VA60sqLYu2dYlOhuF4BIrdyRUSQkIznSA3wC3pCK	DOCENTE	HERNANDO JAVIER DE LA HOZ MARTINEZ	\N	5	ACTIVO	\N	2026-10-25 17:38:02.649322+00
87	10403321	$2a$10$rXhOIRK.l9T6aTH2noPgd.e9pjmOb1DNFHOXL8lLDNmwx5k8RWcrC	DOCENTE	YOLANDA PEREZ TAPIA	\N	6	ACTIVO	\N	2026-10-25 17:38:02.649322+00
88	11024567	$2a$10$rvV7muIgMDgmtJlT6ATrwOH2kng5l4HmECv6nIfvxa.L/EBWYbZJS	DOCENTE	JAIRO ALONSO CASSIANI VARGAS	\N	7	ACTIVO	\N	2026-10-25 17:38:02.649322+00
89	73115544	$2a$10$duKHrp6mnZlxH/Q0uSdgFOgd43m0EsGgxjhJNWD3NUEY1JRTFmOqS	DOCENTE	NORBERTO ENRIQUE MANJARRES PABON	\N	8	ACTIVO	\N	2026-10-25 17:38:02.649322+00
\.


--
-- Name: asignatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.asignatura_id_seq', 12, true);


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

SELECT pg_catalog.setval('public.docente_id_seq', 8, true);


--
-- Name: documento_aspirante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.documento_aspirante_id_seq', 1, false);


--
-- Name: encuesta_evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.encuesta_evaluacion_id_seq', 1251, true);


--
-- Name: estudiante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estudiante_id_seq', 80, true);


--
-- Name: evaluacion_docente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.evaluacion_docente_id_seq', 42, true);


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

SELECT pg_catalog.setval('public.inscripcion_evaluacion_id_seq', 1880, true);


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

SELECT pg_catalog.setval('public.respuesta_pregunta_id_seq', 25791, true);


--
-- Name: sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sesion_id_seq', 11, true);


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

SELECT pg_catalog.setval('public.usuario_id_seq', 89, true);


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

\unrestrict zDSGIAOdbSG23t0fPNg0Nu5hw4jP9hoehvtqbnaA94JpBIDKjnQE3Ba3DyUy4qm

