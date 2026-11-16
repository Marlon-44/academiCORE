# Despliegue — academiCORE

Arquitectura en producción:

```
Vercel (frontend) ──HTTPS──> Render (backend) ──> Supabase (Postgres)
                                  │
                                  └──> Render (sentiment, Flask)
```

## 1. Base de datos — Supabase

1. Crear proyecto en https://supabase.com/dashboard → **New project**.
2. Settings → Database → copiar/resetear el password.
3. Importar el dump con el dataset mínimo:

   ```bash
   psql "postgresql://postgres.<ref>:<password>@aws-1-<region>.pooler.supabase.com:5432/postgres" \
        -f db/init/01_academicore.sql
   ```

   Dataset incluido: 1 admin, 4 docentes, 6 estudiantes, 6 asignaturas,
   6 evaluaciones ABIERTA 2026-2, 12 encuestas respondidas (2 por estudiante
   en los mismos 2 docentes), 21 preguntas SIG activas + 5 inactivas.

## 2. Backend — Render

Con `render.yaml` en la raíz, Render lo detecta como **Blueprint**:
Dashboard → **New → Blueprint** → apuntar al repo → crea los 2 servicios
(`academicore-api` y `academicore-sentiment`).

Variables a rellenar (las marcadas `sync: false`):

| Variable | Valor |
|---|---|
| `DB_URL` | `jdbc:postgresql://aws-1-<region>.pooler.supabase.com:5432/postgres?sslmode=require` |
| `DB_USER` | `postgres.<ref>` |
| `DB_PASSWORD` | password de la BD |
| `SUPABASE_URL` | `https://<ref>.supabase.co` |
| `SUPABASE_SERVICE_KEY` | service_role key |
| `CORS_ALLOWED_ORIGINS` | `https://<app>.vercel.app` |

`COOKIE_SAMESITE=None` y `COOKIE_SECURE=true` ya vienen en el blueprint
(necesarios para que la cookie de sesión viaje cross-site Vercel→Render).

> **Nota free tier:** el servicio duerme tras ~15 min de inactividad. El
> splash del frontend hace ping a `/api/health` hasta despertarlo (~1 min).

## 3. Frontend — Vercel

1. **New Project** → importar el repo (la app Vite está en la raíz, Vercel
   la detecta solo; `vercel.json` ya trae los rewrites para React Router).
2. Variable de entorno:

   | Variable | Valor |
   |---|---|
   | `VITE_API_URL` | `https://academicore-api.onrender.com` |

   Sin `VITE_API_URL` el front usa rutas relativas `/api` (local/Docker).

## 4. Local (Docker)

```bash
# con Supabase (BD en la nube)
docker compose up -d --build

# con Postgres local (carga db/init en el primer arranque)
docker compose --profile localdb up -d --build
```

| Servicio | URL |
|---|---|
| Front | http://localhost:3002 |
| Backend | http://localhost:8080 (Swagger `/swagger-ui.html`) |
| Health | http://localhost:8080/api/health |
| Sentiment | http://localhost:5000/salud |

## Credenciales demo

| Rol | Usuario | Clave |
|---|---|---|
| Admin | `admin` | `admin123` |
| Estudiantes | `0222500001` … `0222500006` | su documento `20001001`…`20001006` |
| Docentes | su documento `73001001`…`73001004` | mismo documento |

Docentes demo: AITOR MENTA (EP1101+EP1102, evaluado ~3.5),
ELMER CURIO (EP2101+EP2201, evaluado ~1.9), SUSANA ORIA (EP3101),
MARIO NETA (EP1301).

## Regenerar el dataset

```bash
python scripts/gen_dataset_minimo.py          # emite scripts/_dataset_minimo.sql
psql <conexion> -f scripts/_dataset_minimo.sql
```
