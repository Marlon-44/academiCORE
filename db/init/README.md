# Base de datos demo versionada

`01_academicore.sql` es un `pg_dump` completo (esquema + datos + historial de
Flyway) de la base `academicore` con los datos de prueba del módulo de
evaluación docente.

## Cómo funciona

- `docker-compose.yml` monta esta carpeta en `/docker-entrypoint-initdb.d`.
- Al primer `docker compose up -d` (volumen `pgdata` vacío), Postgres ejecuta
  el archivo y la BD arranca con todo: 50 estudiantes, 4 docentes, 6
  asignaturas, 5 evaluaciones, inscripciones y ~100 encuestas respondidas.
- Como el dump incluye `flyway_schema_history`, el backend no vuelve a correr
  migraciones ya aplicadas — solo las nuevas que existan.

## Flujo para compartir datos

**Para publicar cambios en los datos:**

```powershell
.\scripts\export-db.ps1        # Windows
./scripts/export-db.sh         # Linux/Mac
git add db/init/01_academicore.sql
git commit -m "data: actualiza dataset demo"
git push
```

**Para recibir el dataset actualizado:**

```bash
git pull
docker compose down -v          # borra el volumen pgdata
docker compose up -d --build    # re-inicializa desde el dump nuevo
```

> Importante: `docker-entrypoint-initdb.d` solo corre cuando el volumen está
> vacío, por eso hace falta `down -v` para recargar.

## Reglas

- El archivo es texto plano (`--clean --if-exists`): los diffs de git muestran
  qué datos cambiaron.
- No se commitean datos reales ni sensibles aquí — solo el dataset de prueba.
