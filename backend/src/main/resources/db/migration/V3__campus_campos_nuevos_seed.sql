-- ============================================================
-- V3 — Campos nuevos de campus, seed de 5 sedes y categoría PORTADA
-- ============================================================

-- Nuevas columnas en campus
ALTER TABLE campus
    ADD COLUMN es_sede_principal BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN orden             INTEGER NOT NULL DEFAULT 0,
    ADD COLUMN url_mapa          VARCHAR(500);

-- Categoría PORTADA para la foto grande del home
INSERT INTO categoria_imagen_campus (codigo, nombre) VALUES
    ('PORTADA', 'Portada');

-- Seed de 5 campus (universidad_id = 1 creada en V1)
INSERT INTO campus (universidad_id, codigo, nombre, direccion, ciudad, descripcion, estado, es_sede_principal, orden, url_mapa) VALUES
    (1, 'ZARAGOCILLA',  'Campus Zaragocilla',
        'Campus de Zaragocilla, Cra. 1 #18-25', 'Cartagena',
        'Sede principal donde funcionan la Rectoría y las facultades de Ingeniería y Ciencias Exactas.',
        'ACTIVO', false, 1,
        'https://localizacion.unicartagena.edu.co/zaragocilla'),

    (1, 'SAN_PABLO',    'Campus San Pablo',
        'Campus de San Pablo, Av. del Consulado #62-29', 'Cartagena',
        'Sede de Medicina, Enfermería y Ciencias de la Salud.',
        'ACTIVO', false, 2,
        'https://localizacion.unicartagena.edu.co/san-pablo'),

    (1, 'BODEGUITA',    'Campus La Bodeguita',
        'Campus La Bodeguita, Calle de la Bodeguita', 'Cartagena',
        'Sede de Facultad de Ciencias Humanas y Artes.',
        'ACTIVO', false, 3,
        'https://localizacion.unicartagena.edu.co/bodeguita'),

    (1, 'TURBACO',      'Campus Turbaco',
        'Campus de Turbaco, Vía Turbaco', 'Turbaco',
        'Sede de experimentación agropecuaria y programas técnicos.',
        'ACTIVO', false, 4,
        'https://localizacion.unicartagena.edu.co/turbaco'),

    (1, 'CLAUSTRO_MERCED', 'Claustro de la Merced',
        'Claustro de la Merced, Calle de la Universidad', 'Cartagena',
        'Sede principal histórica. Casa de la Rectoría, posgrados y eventos académicos.',
        'ACTIVO', true, 5,
        'https://localizacion.unicartagena.edu.co/claustro-merced');
