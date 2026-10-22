import { Navigate, Outlet, useLocation } from "react-router-dom";
import { useAuth } from "./AuthContext";

export const ProtectedRoute = () => {
    const { isAuthenticated, isLoading } = useAuth();
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
                state={{
                    from: location,
                }}
            />
        );
    }

    return <Outlet />;
};