const API_BASE_URL = "http://localhost:8080/api/auth";

// ============================================================
// Tipos — espejo de UsuarioAutenticadoResponse del backend
// ============================================================

export type UserRole = "ADMIN" | "ESTUDIANTE" | "DOCENTE";

export interface AuthUser {
    id: number;
    username: string;
    name: string;
    role: UserRole;
    estudianteId: number | null;
    docenteId: number | null;
    surveyCompleted: boolean;
}

export interface LoginCredentials {
    username: string;
    password: string;
}

// ============================================================
// Llamadas — la sesión viaja en la cookie HttpOnly
// 'academicore_session' (credentials: "include" obligatorio)
// ============================================================

export async function loginRequest(
    credentials: LoginCredentials
): Promise<AuthUser> {
    const response = await fetch(`${API_BASE_URL}/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify(credentials),
    });

    if (!response.ok) {
        throw new Error("INVALID_CREDENTIALS");
    }

    return (await response.json()) as AuthUser;
}

export async function meRequest(): Promise<AuthUser | null> {
    const response = await fetch(`${API_BASE_URL}/me`, {
        method: "GET",
        credentials: "include",
    });

    if (!response.ok) {
        return null;
    }

    return (await response.json()) as AuthUser;
}

export async function logoutRequest(): Promise<void> {
    await fetch(`${API_BASE_URL}/logout`, {
        method: "POST",
        credentials: "include",
    });
}
