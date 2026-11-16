-- Las imagenes de campus ahora se sirven estaticas desde el frontend
-- (public/campus/<id>/portada.<ext>). Rutas relativas: las resuelve el
-- navegador contra el origen del front, sin depender de Supabase Storage.
UPDATE imagen_campus SET url = '/campus/1/portada.jpeg' WHERE id = 1;
UPDATE imagen_campus SET url = '/campus/2/portada.jpg'  WHERE id = 2;
UPDATE imagen_campus SET url = '/campus/3/portada.jpeg' WHERE id = 3;
UPDATE imagen_campus SET url = '/campus/4/portada.jpg'  WHERE id = 4;
UPDATE imagen_campus SET url = '/campus/5/portada.jpeg' WHERE id = 5;
