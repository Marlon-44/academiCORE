/**
 * URL base del backend.
 *
 * - Local/Docker: vacío → rutas relativas `/api/...` (nginx o el proxy de Vite
 *   las reenvían al backend).
 * - Vercel: definir `VITE_API_URL=https://<servicio>.onrender.com` para llamar
 *   al backend desplegado en Render.
 */
export const API_URL: string = (import.meta.env.VITE_API_URL ?? "").replace(/\/+$/, "");
