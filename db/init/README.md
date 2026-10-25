# Base de datos demo versionada

`01_academicore.sql` es un `pg_dump` completo (esquema + datos + historial de
Flyway) de la base `academicore` con los datos de prueba del módulo de
evaluación docente.

## Supabase (BD remota compartida)

El mismo dump sirve para cargar la base en Supabase — así todos trabajan
contra la MISMA base de datos sin montar el Postgres local:

```bash
# con el connection string del proyecto (Session pooler, puerto 5432):
psql "postgres://postgres.<ref>:<password>@aws-0-<region>.pooler.supabase.com:5432/postgres" \
     -f db/init/01_academicore.sql
```

El archivo trae `DROP ... IF EXISTS`, así que también sirve para
**re-cargar** sobre una base ya usada (borra y recrea todo `public.*`).

En `.env` basta poner `DB_URL`/`DB_USER`/`DB_PASSWORD` de Supabase y levantar
sin el Postgres local: `docker compose up -d`. Para volver al Postgres local:
`docker compose --profile localdb up -d`.

## Cómo funciona (Postgres local, perfil `localdb`)

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
