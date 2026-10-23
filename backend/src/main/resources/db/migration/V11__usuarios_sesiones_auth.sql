-- V11: autenticacion - usuarios y sesiones
-- bcrypt generado con pgcrypto (crypt + gen_salt 'bf' -> $2a$, verificable por Spring BCrypt)
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE usuario (
    id              BIGSERIAL PRIMARY KEY,
    username        VARCHAR(60)  NOT NULL UNIQUE,
    password_hash   VARCHAR(100) NOT NULL,
    rol             VARCHAR(20)  NOT NULL CHECK (rol IN ('ADMIN', 'ESTUDIANTE', 'DOCENTE')),
    nombre_mostrar  VARCHAR(300) NOT NULL,
    estudiante_id   BIGINT       REFERENCES estudiante(id) ON DELETE SET NULL,
    docente_id      BIGINT       REFERENCES docente(id) ON DELETE SET NULL,
    estado          VARCHAR(20)  NOT NULL DEFAULT 'ACTIVO' CHECK (estado IN ('ACTIVO', 'INACTIVO')),
    ultimo_acceso   TIMESTAMPTZ,
    creado_en       TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE TABLE sesion (
    id         BIGSERIAL PRIMARY KEY,
    token      VARCHAR(80)  NOT NULL UNIQUE,
    usuario_id BIGINT       NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
    creado_en  TIMESTAMPTZ  NOT NULL DEFAULT now(),
    expira_en  TIMESTAMPTZ  NOT NULL
);

CREATE INDEX idx_sesion_token ON sesion(token);
CREATE INDEX idx_sesion_usuario ON sesion(usuario_id);
CREATE INDEX idx_usuario_estudiante ON usuario(estudiante_id);

-- Admin: usuario "admin", clave "admin123"
INSERT INTO usuario (username, password_hash, rol, nombre_mostrar)
VALUES ('admin', crypt('admin123', gen_salt('bf', 10)), 'ADMIN', 'Administrador del sistema');

-- Estudiantes: usuario = codigo estudiantil, clave = numero de documento
INSERT INTO usuario (username, password_hash, rol, nombre_mostrar, estudiante_id)
SELECT e.codigo,
       crypt(e.numero_documento, gen_salt('bf', 10)),
       'ESTUDIANTE',
       e.nombres || ' ' || e.apellidos,
       e.id
FROM estudiante e
WHERE e.codigo IS NOT NULL
ON CONFLICT (username) DO NOTHING;

-- Docentes: usuario = numero de documento, clave = numero de documento
INSERT INTO usuario (username, password_hash, rol, nombre_mostrar, docente_id)
SELECT d.numero_documento,
       crypt(d.numero_documento, gen_salt('bf', 10)),
       'DOCENTE',
       d.nombres || ' ' || d.apellidos,
       d.id
FROM docente d
WHERE d.numero_documento IS NOT NULL
ON CONFLICT (username) DO NOTHING;
