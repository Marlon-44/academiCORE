--
-- PostgreSQL database dump
--

\restrict G3b7Q7DdhTnqeCnvp5SqsG3HcKK1alMjsTpNsUwKak8o1sd5PdR1vuDhkXcfZ28

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
    CONSTRAINT chk_asignatura_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVA'::character varying)::text, ('INACTIVA'::character varying)::text, ('HISTORICA'::character varying)::text])))
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
    CONSTRAINT chk_aspirante_estado CHECK (((estado)::text = ANY (ARRAY[('REGISTRADO'::character varying)::text, ('VERIFICADO'::character varying)::text, ('BLOQUEADO'::character varying)::text])))
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
    CONSTRAINT chk_campus_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVO'::character varying)::text, ('INACTIVO'::character varying)::text])))
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
    CONSTRAINT chk_departamento_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVO'::character varying)::text, ('INACTIVO'::character varying)::text])))
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
    CONSTRAINT chk_docente_escalafon CHECK (((escalafon IS NULL) OR ((escalafon)::text = ANY (ARRAY[('AUXILIAR'::character varying)::text, ('ASISTENTE'::character varying)::text, ('ASOCIADO'::character varying)::text, ('TITULAR'::character varying)::text])))),
    CONSTRAINT chk_docente_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVO'::character varying)::text, ('INACTIVO'::character varying)::text]))),
    CONSTRAINT chk_docente_formacion CHECK (((nivel_formacion IS NULL) OR ((nivel_formacion)::text = ANY (ARRAY[('PREGRADO'::character varying)::text, ('ESPECIALIZACION'::character varying)::text, ('MAESTRIA'::character varying)::text, ('DOCTORADO'::character varying)::text, ('POSTDOCTORADO'::character varying)::text])))),
    CONSTRAINT chk_docente_sexo CHECK (((sexo IS NULL) OR ((sexo)::text = ANY (ARRAY[('MASCULINO'::character varying)::text, ('FEMENINO'::character varying)::text, ('OTRO'::character varying)::text])))),
    CONSTRAINT chk_docente_vinculacion CHECK (((tipo_vinculacion IS NULL) OR ((tipo_vinculacion)::text = ANY (ARRAY[('PLANTA_TIEMPO_COMPLETO'::character varying)::text, ('PLANTA_MEDIO_TIEMPO'::character varying)::text, ('OCASIONAL'::character varying)::text, ('CATEDRA'::character varying)::text]))))
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
    CONSTRAINT chk_documento_estado CHECK (((estado)::text = ANY (ARRAY[('CARGADO'::character varying)::text, ('VALIDADO'::character varying)::text, ('RECHAZADO'::character varying)::text])))
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
    CONSTRAINT chk_estudiante_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVO'::character varying)::text, ('INACTIVO'::character varying)::text]))),
    CONSTRAINT chk_estudiante_estado_academico CHECK (((estado_academico)::text = ANY (ARRAY[('NORMAL'::character varying)::text, ('RIESGO_ACADEMICO'::character varying)::text, ('PRUEBA_ACADEMICA'::character varying)::text, ('SUSPENDIDO'::character varying)::text, ('EGRESADO'::character varying)::text, ('RETIRADO'::character varying)::text]))),
    CONSTRAINT chk_estudiante_semestre CHECK (((semestre IS NULL) OR ((semestre >= 1) AND (semestre <= 16)))),
    CONSTRAINT chk_estudiante_sexo CHECK (((sexo IS NULL) OR ((sexo)::text = ANY (ARRAY[('MASCULINO'::character varying)::text, ('FEMENINO'::character varying)::text, ('OTRO'::character varying)::text]))))
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
    CONSTRAINT chk_evaluacion_estado CHECK (((estado)::text = ANY (ARRAY[('ABIERTA'::character varying)::text, ('CERRADA'::character varying)::text])))
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
    CONSTRAINT chk_factura_estado CHECK (((estado)::text = ANY (ARRAY[('PENDIENTE'::character varying)::text, ('PAGADA'::character varying)::text, ('VENCIDA'::character varying)::text, ('ANULADA'::character varying)::text]))),
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
    CONSTRAINT chk_facultad_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVA'::character varying)::text, ('INACTIVA'::character varying)::text])))
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
    CONSTRAINT chk_imagen_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVA'::character varying)::text, ('INACTIVA'::character varying)::text])))
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
    CONSTRAINT chk_inscripcion_estado CHECK (((estado)::text = ANY (ARRAY[('PENDIENTE_PAGO'::character varying)::text, ('EN_REVISION'::character varying)::text, ('ADMITIDO'::character varying)::text, ('RECHAZADO'::character varying)::text, ('MATRICULADO'::character varying)::text])))
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
    CONSTRAINT chk_oferta_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVA'::character varying)::text, ('AGOTADA'::character varying)::text, ('CERRADA'::character varying)::text])))
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
    CONSTRAINT chk_periodo_admision_estado CHECK (((estado)::text = ANY (ARRAY[('PROGRAMADO'::character varying)::text, ('ABIERTO'::character varying)::text, ('CERRADO'::character varying)::text]))),
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
    CONSTRAINT chk_plan_estado CHECK (((estado)::text = ANY (ARRAY[('EN_DISENO'::character varying)::text, ('APROBADO'::character varying)::text, ('VIGENTE'::character varying)::text, ('EN_EXTINCION'::character varying)::text, ('HISTORICO'::character varying)::text, ('CANCELADO'::character varying)::text]))),
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
    CONSTRAINT chk_pregunta_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVA'::character varying)::text, ('INACTIVA'::character varying)::text]))),
    CONSTRAINT chk_pregunta_tipo CHECK (((tipo)::text = ANY (ARRAY[('LIKERT'::character varying)::text, ('TEXTO'::character varying)::text])))
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
    CONSTRAINT chk_programa_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVO'::character varying)::text, ('EN_REGISTRO'::character varying)::text, ('SUSPENDIDO'::character varying)::text, ('INACTIVO'::character varying)::text])))
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
    CONSTRAINT chk_respuesta_metodo CHECK (((sentimiento_metodo IS NULL) OR ((sentimiento_metodo)::text = ANY (ARRAY[('MODELO'::character varying)::text, ('LEXICO'::character varying)::text])))),
    CONSTRAINT chk_respuesta_sentimiento CHECK (((sentimiento IS NULL) OR ((sentimiento)::text = ANY (ARRAY[('POSITIVO'::character varying)::text, ('NEGATIVO'::character varying)::text, ('NEUTRO'::character varying)::text])))),
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
    CONSTRAINT chk_universidad_estado CHECK (((estado)::text = ANY (ARRAY[('ACTIVA'::character varying)::text, ('INACTIVA'::character varying)::text])))
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
    CONSTRAINT usuario_estado_check CHECK (((estado)::text = ANY (ARRAY[('ACTIVO'::character varying)::text, ('INACTIVO'::character varying)::text]))),
    CONSTRAINT usuario_rol_check CHECK (((rol)::text = ANY (ARRAY[('ADMIN'::character varying)::text, ('ESTUDIANTE'::character varying)::text, ('DOCENTE'::character varying)::text])))
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
1	1	EP1101	Programación I	Lógica de programación y Python	ACTIVA	2026-11-16
2	1	EP1102	Programación II	POO, estructuras y desarrollo en Java	ACTIVA	2026-11-16
3	1	EP2101	Estructuras de Datos	Listas, pilas, colas, árboles y grafos	ACTIVA	2026-11-16
4	1	EP2201	Redes de Computadores	Modelo OSI, TCP/IP y servicios de red	ACTIVA	2026-11-16
5	1	EP3101	Inteligencia Artificial	Búsqueda, aprendizaje automático y PLN	ACTIVA	2026-11-16
6	1	EP1301	Ingeniería de Software I	Procesos, requisitos y modelado UML	ACTIVA	2026-11-16
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
10	CONCEPTUAL	Conceptual	10
11	PEDAGOGICO	Pedagógico	11
12	RELACIONES	Relaciones	12
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
1	73001001	AITOR	MENTA PARDO	amenta@unicartagena.edu.co	ACTIVO	MASCULINO	3015550110	Cartagena, Colombia	PLANTA_TIEMPO_COMPLETO	TITULAR	DOCTORADO	1	2018-01-15
2	73001002	ELMER	CURIO SALCEDO	ecurio@unicartagena.edu.co	ACTIVO	MASCULINO	3025550120	Cartagena, Colombia	CATEDRA	TITULAR	DOCTORADO	1	2018-01-15
3	73001003	SUSANA	ORIA RODAS	soria@unicartagena.edu.co	ACTIVO	MASCULINO	3035550130	Cartagena, Colombia	OCASIONAL	TITULAR	DOCTORADO	1	2018-01-15
4	73001004	MARIO	NETA MORA	mneta@unicartagena.edu.co	ACTIVO	MASCULINO	3045550140	Cartagena, Colombia	PLANTA_MEDIO_TIEMPO	TITULAR	DOCTORADO	1	2018-01-15
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
1	1	2026-11-01 10:00:00	1
2	1	2026-11-02 10:00:00	2
3	1	2026-11-03 10:00:00	3
4	1	2026-11-04 10:00:00	4
5	1	2026-11-05 10:00:00	5
6	1	2026-11-06 10:00:00	6
7	3	2026-11-01 10:00:00	1
8	3	2026-11-02 10:00:00	2
9	3	2026-11-03 10:00:00	3
10	3	2026-11-04 10:00:00	4
11	3	2026-11-05 10:00:00	5
12	3	2026-11-06 10:00:00	6
\.


--
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.estudiante (id, numero_documento, nombres, apellidos, email, estado, codigo, sexo, telefono, direccion, programa_id, semestre, estado_academico, estado_ingreso, plan_estudios_id) FROM stdin;
1	20001001	ELSA	PATO JIMENEZ	elsa.pato1@estudiante.unicartagena.edu.co	ACTIVO	0222500001	FEMENINO	3105550010	Cartagena, Colombia	1	3	NORMAL	NO ESPECIFICA	1
2	20001002	ESTEBAN	QUITO MORELOS	esteban.quito2@estudiante.unicartagena.edu.co	ACTIVO	0222500002	FEMENINO	3105550020	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
3	20001003	ELVIS TEK	CARDENAS RUIZ	elvis.cardenas3@estudiante.unicartagena.edu.co	ACTIVO	0222500003	MASCULINO	3105550030	Cartagena, Colombia	1	5	NORMAL	NO ESPECIFICA	1
4	20001004	LOLA	MENTO VARGAS	lola.mento4@estudiante.unicartagena.edu.co	ACTIVO	0222500004	MASCULINO	3105550040	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
5	20001005	ZOILA	VACA RANGEL	zoila.vaca5@estudiante.unicartagena.edu.co	ACTIVO	0222500005	FEMENINO	3105550050	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
6	20001006	ELBA	LAZO PERTUZ	elba.lazo6@estudiante.unicartagena.edu.co	ACTIVO	0222500006	MASCULINO	3105550060	Cartagena, Colombia	1	8	NORMAL	NO ESPECIFICA	1
\.


--
-- Data for Name: evaluacion_docente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.evaluacion_docente (id, docente_id, asignatura_id, programa_id, grupo, periodo, estudiantes_esperados, estado, fecha_creacion) FROM stdin;
1	1	1	1	A1	2026-2	6	ABIERTA	2026-10-17 00:00:00
2	1	2	1	A1	2026-2	6	ABIERTA	2026-10-17 00:00:00
3	2	3	1	A1	2026-2	6	ABIERTA	2026-10-17 00:00:00
4	2	4	1	A1	2026-2	6	ABIERTA	2026-10-17 00:00:00
5	3	5	1	A1	2026-2	6	ABIERTA	2026-10-17 00:00:00
6	4	6	1	A1	2026-2	6	ABIERTA	2026-10-17 00:00:00
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
1	1	7	/campus/1/portada.jpeg	Portada - Claustro de San Agustín	1	2026-09-07 23:46:52.00814	ACTIVA
2	2	7	/campus/2/portada.jpg	Portada - Piedra de Bolívar	1	2026-09-07 23:46:52.00814	ACTIVA
3	3	7	/campus/3/portada.jpeg	Portada - Campus de San Pablo	1	2026-09-07 23:46:52.00814	ACTIVA
4	4	7	/campus/4/portada.jpg	Portada - Zaragocilla Campus de la Salud	1	2026-09-07 23:46:52.00814	ACTIVA
5	5	7	/campus/5/portada.jpeg	Portada - Claustro de La Merced	1	2026-09-07 23:46:52.00814	ACTIVA
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
1	1	1	2026-11-16 03:36:57.559118
2	1	2	2026-11-16 03:36:57.559118
3	1	3	2026-11-16 03:36:57.559118
4	1	4	2026-11-16 03:36:57.559118
5	1	5	2026-11-16 03:36:57.559118
6	1	6	2026-11-16 03:36:57.559118
7	2	1	2026-11-16 03:36:57.559118
8	2	2	2026-11-16 03:36:57.559118
9	2	3	2026-11-16 03:36:57.559118
10	2	4	2026-11-16 03:36:57.559118
11	2	5	2026-11-16 03:36:57.559118
12	2	6	2026-11-16 03:36:57.559118
13	3	1	2026-11-16 03:36:57.559118
14	3	2	2026-11-16 03:36:57.559118
15	3	3	2026-11-16 03:36:57.559118
16	3	4	2026-11-16 03:36:57.559118
17	3	5	2026-11-16 03:36:57.559118
18	3	6	2026-11-16 03:36:57.559118
19	4	1	2026-11-16 03:36:57.559118
20	4	2	2026-11-16 03:36:57.559118
21	4	3	2026-11-16 03:36:57.559118
22	4	4	2026-11-16 03:36:57.559118
23	4	5	2026-11-16 03:36:57.559118
24	4	6	2026-11-16 03:36:57.559118
25	5	1	2026-11-16 03:36:57.559118
26	5	2	2026-11-16 03:36:57.559118
27	5	3	2026-11-16 03:36:57.559118
28	5	4	2026-11-16 03:36:57.559118
29	5	5	2026-11-16 03:36:57.559118
30	5	6	2026-11-16 03:36:57.559118
31	6	1	2026-11-16 03:36:57.559118
32	6	2	2026-11-16 03:36:57.559118
33	6	3	2026-11-16 03:36:57.559118
34	6	4	2026-11-16 03:36:57.559118
35	6	5	2026-11-16 03:36:57.559118
36	6	6	2026-11-16 03:36:57.559118
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
40	10	101	¿El docente articula los contenidos del curso o asignatura, con otras asignaturas?	INACTIVA	LIKERT
41	10	102	¿El docente cumple con el sistema de evaluación establecido en el proyecto docente?	INACTIVA	LIKERT
42	11	103	¿El docente promueve la participación de sus estudiantes?	INACTIVA	LIKERT
43	12	104	¿El docente trata con respeto a los estudiantes?	INACTIVA	LIKERT
44	12	105	¿Qué sugerencias tiene para mejorar la labor del docente?	INACTIVA	TEXTO
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
1	1	18	3	\N	\N	\N	\N
2	1	19	4	\N	\N	\N	\N
3	1	20	3	\N	\N	\N	\N
4	1	21	4	\N	\N	\N	\N
5	1	22	4	\N	\N	\N	\N
6	1	23	4	\N	\N	\N	\N
7	1	24	4	\N	\N	\N	\N
8	1	27	4	\N	\N	\N	\N
9	1	28	4	\N	\N	\N	\N
10	1	29	4	\N	\N	\N	\N
11	1	30	4	\N	\N	\N	\N
12	1	31	4	\N	\N	\N	\N
13	1	32	4	\N	\N	\N	\N
14	1	33	4	\N	\N	\N	\N
15	1	34	4	\N	\N	\N	\N
16	1	35	4	\N	\N	\N	\N
17	1	36	1	\N	\N	\N	\N
18	1	37	4	\N	\N	\N	\N
19	1	38	3	\N	\N	\N	\N
20	1	25	3	Ninguna que valga la pena mencionar.	NEGATIVO	0.951	MODELO
21	1	26	3	Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.	NEUTRO	0.595	MODELO
22	2	18	4	\N	\N	\N	\N
23	2	19	4	\N	\N	\N	\N
24	2	20	2	\N	\N	\N	\N
25	2	21	4	\N	\N	\N	\N
26	2	22	2	\N	\N	\N	\N
27	2	23	4	\N	\N	\N	\N
28	2	24	4	\N	\N	\N	\N
29	2	27	4	\N	\N	\N	\N
30	2	28	4	\N	\N	\N	\N
31	2	29	3	\N	\N	\N	\N
32	2	30	4	\N	\N	\N	\N
33	2	31	3	\N	\N	\N	\N
34	2	32	4	\N	\N	\N	\N
35	2	33	3	\N	\N	\N	\N
36	2	34	4	\N	\N	\N	\N
37	2	35	4	\N	\N	\N	\N
38	2	36	1	\N	\N	\N	\N
39	2	37	3	\N	\N	\N	\N
40	2	38	4	\N	\N	\N	\N
41	2	25	3	Sabe la materia pero a veces le cuesta transmitirla.	NEUTRO	0.71	MODELO
42	2	26	3	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.868	MODELO
43	3	18	4	\N	\N	\N	\N
44	3	19	4	\N	\N	\N	\N
45	3	20	3	\N	\N	\N	\N
46	3	21	4	\N	\N	\N	\N
47	3	22	3	\N	\N	\N	\N
48	3	23	4	\N	\N	\N	\N
49	3	24	4	\N	\N	\N	\N
50	3	27	4	\N	\N	\N	\N
51	3	28	3	\N	\N	\N	\N
52	3	29	4	\N	\N	\N	\N
53	3	30	4	\N	\N	\N	\N
54	3	31	4	\N	\N	\N	\N
55	3	32	4	\N	\N	\N	\N
56	3	33	4	\N	\N	\N	\N
57	3	34	4	\N	\N	\N	\N
58	3	35	3	\N	\N	\N	\N
59	3	36	2	\N	\N	\N	\N
60	3	37	4	\N	\N	\N	\N
61	3	38	3	\N	\N	\N	\N
62	3	25	3	Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.	POSITIVO	0.863	MODELO
63	3	26	3	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.921	MODELO
64	4	18	4	\N	\N	\N	\N
65	4	19	3	\N	\N	\N	\N
66	4	20	3	\N	\N	\N	\N
67	4	21	4	\N	\N	\N	\N
68	4	22	4	\N	\N	\N	\N
69	4	23	4	\N	\N	\N	\N
70	4	24	4	\N	\N	\N	\N
71	4	27	4	\N	\N	\N	\N
72	4	28	4	\N	\N	\N	\N
73	4	29	4	\N	\N	\N	\N
74	4	30	4	\N	\N	\N	\N
75	4	31	3	\N	\N	\N	\N
76	4	32	4	\N	\N	\N	\N
77	4	33	4	\N	\N	\N	\N
78	4	34	4	\N	\N	\N	\N
79	4	35	2	\N	\N	\N	\N
80	4	36	4	\N	\N	\N	\N
81	4	37	4	\N	\N	\N	\N
82	4	38	1	\N	\N	\N	\N
83	4	25	3	Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.	POSITIVO	0.735	MODELO
84	4	26	3	Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.	NEGATIVO	0.846	MODELO
85	5	18	3	\N	\N	\N	\N
86	5	19	4	\N	\N	\N	\N
87	5	20	4	\N	\N	\N	\N
88	5	21	4	\N	\N	\N	\N
89	5	22	4	\N	\N	\N	\N
90	5	23	4	\N	\N	\N	\N
91	5	24	3	\N	\N	\N	\N
92	5	27	3	\N	\N	\N	\N
93	5	28	1	\N	\N	\N	\N
94	5	29	4	\N	\N	\N	\N
95	5	30	2	\N	\N	\N	\N
96	5	31	3	\N	\N	\N	\N
97	5	32	3	\N	\N	\N	\N
98	5	33	3	\N	\N	\N	\N
99	5	34	3	\N	\N	\N	\N
100	5	35	4	\N	\N	\N	\N
101	5	36	3	\N	\N	\N	\N
102	5	37	4	\N	\N	\N	\N
103	5	38	4	\N	\N	\N	\N
104	5	25	3	Los laboratorios que propone están muy bien pensados, se aprende haciendo.	POSITIVO	0.942	MODELO
105	5	26	3	Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.	POSITIVO	0.724	MODELO
106	6	18	4	\N	\N	\N	\N
107	6	19	4	\N	\N	\N	\N
108	6	20	4	\N	\N	\N	\N
109	6	21	2	\N	\N	\N	\N
110	6	22	4	\N	\N	\N	\N
111	6	23	4	\N	\N	\N	\N
112	6	24	4	\N	\N	\N	\N
113	6	27	3	\N	\N	\N	\N
114	6	28	4	\N	\N	\N	\N
115	6	29	4	\N	\N	\N	\N
116	6	30	4	\N	\N	\N	\N
117	6	31	4	\N	\N	\N	\N
118	6	32	4	\N	\N	\N	\N
119	6	33	2	\N	\N	\N	\N
120	6	34	4	\N	\N	\N	\N
121	6	35	2	\N	\N	\N	\N
122	6	36	4	\N	\N	\N	\N
123	6	37	4	\N	\N	\N	\N
124	6	38	3	\N	\N	\N	\N
125	6	25	3	Sus evaluaciones son justas y coherentes con lo que enseña en clase.	POSITIVO	0.941	MODELO
126	6	26	3	Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.	POSITIVO	0.789	MODELO
127	7	18	2	\N	\N	\N	\N
128	7	19	2	\N	\N	\N	\N
129	7	20	2	\N	\N	\N	\N
130	7	21	2	\N	\N	\N	\N
131	7	22	1	\N	\N	\N	\N
132	7	23	1	\N	\N	\N	\N
133	7	24	1	\N	\N	\N	\N
134	7	27	2	\N	\N	\N	\N
135	7	28	1	\N	\N	\N	\N
136	7	29	2	\N	\N	\N	\N
137	7	30	3	\N	\N	\N	\N
138	7	31	1	\N	\N	\N	\N
139	7	32	1	\N	\N	\N	\N
140	7	33	1	\N	\N	\N	\N
141	7	34	1	\N	\N	\N	\N
142	7	35	1	\N	\N	\N	\N
143	7	36	1	\N	\N	\N	\N
144	7	37	1	\N	\N	\N	\N
145	7	38	2	\N	\N	\N	\N
146	7	25	3	Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.	POSITIVO	0.912	MODELO
147	7	26	3	Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.	NEGATIVO	0.741	MODELO
148	8	18	1	\N	\N	\N	\N
149	8	19	1	\N	\N	\N	\N
150	8	20	1	\N	\N	\N	\N
151	8	21	2	\N	\N	\N	\N
152	8	22	4	\N	\N	\N	\N
153	8	23	1	\N	\N	\N	\N
154	8	24	1	\N	\N	\N	\N
155	8	27	2	\N	\N	\N	\N
156	8	28	1	\N	\N	\N	\N
157	8	29	1	\N	\N	\N	\N
158	8	30	2	\N	\N	\N	\N
159	8	31	1	\N	\N	\N	\N
160	8	32	2	\N	\N	\N	\N
161	8	33	1	\N	\N	\N	\N
162	8	34	2	\N	\N	\N	\N
163	8	35	3	\N	\N	\N	\N
164	8	36	4	\N	\N	\N	\N
165	8	37	2	\N	\N	\N	\N
166	8	38	2	\N	\N	\N	\N
167	8	25	3	Ninguna relevante, el docente parecía desinteresado en el curso.	NEGATIVO	0.817	MODELO
168	8	26	3	Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.	NEGATIVO	0.782	MODELO
169	9	18	2	\N	\N	\N	\N
170	9	19	1	\N	\N	\N	\N
171	9	20	1	\N	\N	\N	\N
172	9	21	3	\N	\N	\N	\N
173	9	22	2	\N	\N	\N	\N
174	9	23	1	\N	\N	\N	\N
175	9	24	1	\N	\N	\N	\N
176	9	27	3	\N	\N	\N	\N
177	9	28	2	\N	\N	\N	\N
178	9	29	3	\N	\N	\N	\N
179	9	30	1	\N	\N	\N	\N
180	9	31	3	\N	\N	\N	\N
181	9	32	1	\N	\N	\N	\N
182	9	33	3	\N	\N	\N	\N
183	9	34	4	\N	\N	\N	\N
184	9	35	1	\N	\N	\N	\N
185	9	36	2	\N	\N	\N	\N
186	9	37	1	\N	\N	\N	\N
187	9	38	1	\N	\N	\N	\N
188	9	25	3	Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.	NEGATIVO	0.712	MODELO
189	9	26	3	Responder los correos más rápido, a veces tardan una semana.	NEUTRO	0.734	MODELO
190	10	18	2	\N	\N	\N	\N
191	10	19	2	\N	\N	\N	\N
192	10	20	1	\N	\N	\N	\N
193	10	21	2	\N	\N	\N	\N
194	10	22	2	\N	\N	\N	\N
195	10	23	1	\N	\N	\N	\N
196	10	24	2	\N	\N	\N	\N
197	10	27	2	\N	\N	\N	\N
198	10	28	2	\N	\N	\N	\N
199	10	29	1	\N	\N	\N	\N
200	10	30	1	\N	\N	\N	\N
201	10	31	1	\N	\N	\N	\N
202	10	32	1	\N	\N	\N	\N
203	10	33	2	\N	\N	\N	\N
204	10	34	3	\N	\N	\N	\N
205	10	35	1	\N	\N	\N	\N
206	10	36	2	\N	\N	\N	\N
207	10	37	1	\N	\N	\N	\N
208	10	38	2	\N	\N	\N	\N
209	10	25	3	No destaco ninguna, le falta pedagogía y compromiso con el curso.	NEGATIVO	0.951	MODELO
210	10	26	3	Preparar las clases, se notaba la improvisación total.	NEGATIVO	0.962	MODELO
211	11	18	2	\N	\N	\N	\N
212	11	19	1	\N	\N	\N	\N
213	11	20	1	\N	\N	\N	\N
214	11	21	2	\N	\N	\N	\N
215	11	22	1	\N	\N	\N	\N
216	11	23	4	\N	\N	\N	\N
217	11	24	2	\N	\N	\N	\N
218	11	27	2	\N	\N	\N	\N
219	11	28	1	\N	\N	\N	\N
220	11	29	2	\N	\N	\N	\N
221	11	30	2	\N	\N	\N	\N
222	11	31	1	\N	\N	\N	\N
223	11	32	1	\N	\N	\N	\N
224	11	33	2	\N	\N	\N	\N
225	11	34	2	\N	\N	\N	\N
226	11	35	2	\N	\N	\N	\N
227	11	36	1	\N	\N	\N	\N
228	11	37	2	\N	\N	\N	\N
229	11	38	4	\N	\N	\N	\N
230	11	25	3	No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.	NEGATIVO	0.736	MODELO
231	11	26	3	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.876	MODELO
232	12	18	1	\N	\N	\N	\N
233	12	19	3	\N	\N	\N	\N
234	12	20	2	\N	\N	\N	\N
235	12	21	2	\N	\N	\N	\N
236	12	22	1	\N	\N	\N	\N
237	12	23	1	\N	\N	\N	\N
238	12	24	2	\N	\N	\N	\N
239	12	27	2	\N	\N	\N	\N
240	12	28	1	\N	\N	\N	\N
241	12	29	2	\N	\N	\N	\N
242	12	30	1	\N	\N	\N	\N
243	12	31	2	\N	\N	\N	\N
244	12	32	2	\N	\N	\N	\N
245	12	33	3	\N	\N	\N	\N
246	12	34	1	\N	\N	\N	\N
247	12	35	2	\N	\N	\N	\N
248	12	36	2	\N	\N	\N	\N
249	12	37	3	\N	\N	\N	\N
250	12	38	1	\N	\N	\N	\N
251	12	25	3	Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.	NEGATIVO	0.818	MODELO
252	12	26	3	Dar clase en vez de contar anécdotas personales media hora.	NEGATIVO	0.736	MODELO
\.


--
-- Data for Name: sesion; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sesion (id, token, usuario_id, creado_en, expira_en) FROM stdin;
1	dff68c92686500802c2f7f82d2e32812b20e919c63ff1fd6ba89e849049c5076	1	2026-11-16 03:47:47.283047+00	2026-12-01 03:47:47.283047+00
2	8bf8ed731e55842d8a313115cccfa9b1ccc5d273f6276a2b3b427d5afedb60c0	2	2026-11-16 03:47:47.951064+00	2027-01-15 03:47:47.951064+00
3	7865569f04f761819ef099e9f07d11decd649d9d7a11bf53e6c46f26f2a0f26d	1	2026-11-16 03:47:52.854924+00	2026-12-01 03:47:52.854924+00
4	4d2e0a635c7466e11329541d675aeb96d2e3476a8563963251dff26cc557e2b3	8	2026-11-16 03:47:53.085363+00	2026-12-01 03:47:53.085363+00
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
2	0222500001	$2a$10$xifKvFRW7HHLj1C.8KQA7ux3V22dqndDbe.k49930BxRZtJu1rKrq	ESTUDIANTE	ELSA PATO JIMENEZ	1	\N	ACTIVO	2026-11-16 03:47:47.834446+00	2026-11-16 03:36:57.559118+00
1	admin	$2a$10$mJdyFdQMibyUaXTzZ2yoXelhqKAVikAadxo9kkw3AwWIUVZeE/85O	ADMIN	Administrador del sistema	\N	\N	ACTIVO	2026-11-16 03:47:52.743888+00	2026-11-16 03:36:57.559118+00
8	73001001	$2a$10$ZgIP4jEDnGeWHEZ.ckWpI.WV8JAPoFufxco0qAOellg22iJosWyKe	DOCENTE	AITOR MENTA PARDO	\N	1	ACTIVO	2026-11-16 03:47:52.974039+00	2026-11-16 03:36:57.559118+00
3	0222500002	$2a$10$kn6QmG6XNG53ArTyZGfX1u0DM6EZdOKrpMPbuPhIxpKi0KsIL/zee	ESTUDIANTE	ESTEBAN QUITO MORELOS	2	\N	ACTIVO	\N	2026-11-16 03:36:57.559118+00
4	0222500003	$2a$10$4wbuzNUZ2mbHWhlnLCOQieaYY4z3eNf8Xjk815ZX4RNMO/5FmV7/2	ESTUDIANTE	ELVIS TEK CARDENAS RUIZ	3	\N	ACTIVO	\N	2026-11-16 03:36:57.559118+00
5	0222500004	$2a$10$hETWlk0SC051lB2.kGxoEeDlw9VFKJUYumTLjzJNxrh/yqAdqkCJq	ESTUDIANTE	LOLA MENTO VARGAS	4	\N	ACTIVO	\N	2026-11-16 03:36:57.559118+00
6	0222500005	$2a$10$H1RXvFO.LJd7GwYqDmdem.1tlU4f104OoDtPLoNXOZ.y7PLId8vEm	ESTUDIANTE	ZOILA VACA RANGEL	5	\N	ACTIVO	\N	2026-11-16 03:36:57.559118+00
7	0222500006	$2a$10$tzdoRKfTblgnid0NqkrUdu3m7okMcIvqYHzkBGZ7wuY2kUhEkUbKq	ESTUDIANTE	ELBA LAZO PERTUZ	6	\N	ACTIVO	\N	2026-11-16 03:36:57.559118+00
9	73001002	$2a$10$kKOovksHvOHav3X5Yq5pmupKn/73bzTNwb0.EUkLOsgdhZ7UIVRrS	DOCENTE	ELMER CURIO SALCEDO	\N	2	ACTIVO	\N	2026-11-16 03:36:57.559118+00
10	73001003	$2a$10$wzOQY2OPgErwkt8zGFYUyedpjM7kcVFdYvX8Gt//msUZB.A.aAEmi	DOCENTE	SUSANA ORIA RODAS	\N	3	ACTIVO	\N	2026-11-16 03:36:57.559118+00
11	73001004	$2a$10$C2S6V9hcIgao6jv0MFPUNu7Q3nuMpYUW9/lTD6cJnLd001fgT9YeC	DOCENTE	MARIO NETA MORA	\N	4	ACTIVO	\N	2026-11-16 03:36:57.559118+00
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

SELECT pg_catalog.setval('public.categoria_pregunta_evaluacion_id_seq', 12, true);


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

SELECT pg_catalog.setval('public.encuesta_evaluacion_id_seq', 1, false);


--
-- Name: estudiante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estudiante_id_seq', 6, true);


--
-- Name: evaluacion_docente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.evaluacion_docente_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.inscripcion_evaluacion_id_seq', 36, true);


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

SELECT pg_catalog.setval('public.pregunta_evaluacion_id_seq', 44, true);


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

SELECT pg_catalog.setval('public.respuesta_pregunta_id_seq', 252, true);


--
-- Name: sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sesion_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.usuario_id_seq', 11, true);


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

\unrestrict G3b7Q7DdhTnqeCnvp5SqsG3HcKK1alMjsTpNsUwKak8o1sd5PdR1vuDhkXcfZ28

