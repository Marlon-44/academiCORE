
import { Navigate, Outlet, useLocation } from "react-router-dom";
import { useAuth } from "./AuthContext";

export const ProtectedRoute = () => {
    const { isAuthenticated, isLoading, user } = useAuth();
    const location = useLocation();

    // 1. Esperar a que termine la comprobación de sesión.
    if (isLoading) {
        return (
            <main
                style={{
                    minHeight: "100vh",
                    display: "grid",
                    placeItems: "center",
                }}
            >
                <p>Verificando sesión...</p>
            </main>
        );
    }

    // 2. Si no hay sesión, regresar al inicio.
    if (!isAuthenticated || !user) {
        return (
            <Navigate
                to="/"
                replace
                state={{ from: location }}
            />
        );
    }

    // 3. Solo los estudiantes deben completar esta encuesta
    // antes de entrar al dashboard estudiantil.
    if (
        user.role === "ESTUDIANTE" &&
        location.pathname === "/student-dashboard" &&
        !user.surveyCompleted
    ) {
        return (
            <Navigate
                to="/percepcion-estudiantil"
                replace
            />
        );
    }

    // 4. Un estudiante que ya completó la encuesta
    // no necesita volver a la página de percepción.
    if (
        user.role === "ESTUDIANTE" &&
        location.pathname === "/percepcion-estudiantil" &&
        user.surveyCompleted
    ) {
        return (
            <Navigate
                to="/student-dashboard"
                replace
            />
        );
    }

    return <Outlet />;
};
