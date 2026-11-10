
import { Navigate, Outlet } from "react-router-dom";
import { useAuth } from "./AuthContext";

interface RoleRouteProps {
    allowedRoles: string[];
}

export const RoleRoute = ({ allowedRoles }: RoleRouteProps) => {
    const { user, isLoading } = useAuth();

    // Evita evaluar permisos mientras se restaura la sesión.
    if (isLoading) {
        return (
            <main
                style={{
                    minHeight: "100vh",
                    display: "grid",
                    placeItems: "center",
                }}
            >
                <p>Verificando permisos...</p>
            </main>
        );
    }

    // Sin usuario o con un rol no autorizado, no permite el acceso.
    if (!user || !allowedRoles.includes(user.role)) {
        return <Navigate to="/" replace />;
    }

    return <Outlet />;
};
