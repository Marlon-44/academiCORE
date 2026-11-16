-- El proyecto Supabase anterior (pxfitbmwillrxxbjlhjv) fue eliminado por inactividad.
-- Las URLs de imagenes de campus apuntan ahora al proyecto nuevo.
UPDATE imagen_campus
SET url = REPLACE(url, 'pxfitbmwillrxxbjlhjv.supabase.co', 'zxgrpzbunghncopuhiea.supabase.co')
WHERE url LIKE '%pxfitbmwillrxxbjlhjv.supabase.co%';
