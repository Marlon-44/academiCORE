-- ============================================================
-- V4 — Corregir seed de campus (nombres del frontend) + registrar imágenes PORTADA
-- ============================================================

-- Actualizar los 5 campus para coincidir con la vista del frontend
UPDATE campus SET codigo = 'SAN_AGUSTIN', nombre = 'Claustro de San Agustín',
    direccion = 'Carrera 6 #36-100, Centro',
    descripcion = 'Sede principal de la Universidad de Cartagena y espacio académico para programas de Ciencias Humanas y Sociales.',
    es_sede_principal = true, orden = 1,
    url_mapa = 'http://localizacion.unicartagena.edu.co/'
WHERE id = 1;

UPDATE campus SET codigo = 'PIEDRA_BOLIVAR', nombre = 'Piedra de Bolívar',
    direccion = 'Calle 30 No. 48-152',
    descripcion = 'Campus que alberga programas administrativos, ingenierías y diferentes facultades de la Universidad.',
    es_sede_principal = false, orden = 2,
    url_mapa = 'http://localizacion.unicartagena.edu.co/'
WHERE id = 2;

UPDATE campus SET codigo = 'SAN_PABLO', nombre = 'Campus de San Pablo',
    direccion = 'Carrera 50 #24-120, Zaragocilla',
    descripcion = 'Espacio para programas como Química, Física, Biología y Matemáticas, con laboratorios y áreas de investigación.',
    es_sede_principal = false, orden = 3,
    url_mapa = 'http://localizacion.unicartagena.edu.co/'
WHERE id = 3;

UPDATE campus SET codigo = 'ZARAGOCILLA', nombre = 'Zaragocilla - Campus de la Salud',
    direccion = 'Campus de la Salud, Zaragocilla',
    descripcion = 'Campus especializado para la formación en el área de la salud, con espacios médicos y laboratorios.',
    es_sede_principal = false, orden = 4,
    url_mapa = 'http://localizacion.unicartagena.edu.co/'
WHERE id = 4;

UPDATE campus SET codigo = 'CLAUSTRO_MERCED', nombre = 'Claustro de La Merced',
    direccion = 'Carrera 4 #38-40, Centro',
    descripcion = 'Espacio histórico ubicado en el Centro, donde funcionan unidades administrativas y programas de posgrado.',
    es_sede_principal = false, orden = 5,
    url_mapa = 'http://localizacion.unicartagena.edu.co/'
WHERE id = 5;

-- Registrar imágenes PORTADA en la base de datos (ya subidas a Supabase)
-- categoría_id = 7 corresponde a PORTADA
INSERT INTO imagen_campus (campus_id, categoria_id, url, descripcion, orden, estado) VALUES
    (1, 7, 'https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/1/portada.jpeg',
     'Portada - Claustro de San Agustín', 1, 'ACTIVA'),
    (2, 7, 'https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/2/portada.jpg',
     'Portada - Piedra de Bolívar', 1, 'ACTIVA'),
    (3, 7, 'https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/3/portada.jpeg',
     'Portada - Campus de San Pablo', 1, 'ACTIVA'),
    (4, 7, 'https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/4/portada.jpg',
     'Portada - Zaragocilla Campus de la Salud', 1, 'ACTIVA'),
    (5, 7, 'https://pxfitbmwillrxxbjlhjv.supabase.co/storage/v1/object/public/campus/5/portada.jpeg',
     'Portada - Claustro de La Merced', 1, 'ACTIVA');
