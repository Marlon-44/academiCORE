import { Navigate, Outlet, useLocation } from "react-router-dom";
import { useAuth } from "./AuthContext";

export const ProtectedRoute = () => {
    const { isAuthenticated, isLoading, user } = useAuth();
    const location = useLocation();

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

    if (!isAuthenticated) {
        return (
            <Navigate
                to="/"
                replace
                state={{ from: location }}
            />
        );
    }

    // El dashboard no debe abrirse mientras la encuesta esté pendiente.
    if (
        location.pathname === "/student-dashboard" &&
        user &&
        !user.surveyCompleted
    ) {
        return <Navigate to="/percepcion-estudiantil" replace />;
    }

    // Si ya completó la encuesta, no necesita volver a la página de encuesta.
    if (
        location.pathname === "/percepcion-estudiantil" &&
        user?.surveyCompleted
    ) {
        return <Navigate to="/student-dashboard" replace />;
    }

    return <Outlet />;
};
