import { BrowserRouter, Route, Routes } from "react-router-dom";

import { MainLayout } from "../layout";
import { Home } from "../pages/Home";

import { AuthProvider } from "../auth/AuthContext";
import { ProtectedRoute } from "../auth/ProtectedRoute";
import { PercepcionEstudiantil } from "../pages/PercepcionEstudiantil";
import { StudentDashboard } from "../pages/StudentDashboard";
import { AdminDashboard } from "../pages/AdminDashboard";
import { EvaluacionDocente } from "../pages/EvaluacionDocente";

export const AppRouter = () => {
    return (
        <BrowserRouter>
            <AuthProvider>
                <Routes>
                    {/* Rutas públicas */}
                    <Route path="/" element={<MainLayout />}>
                        <Route index element={<Home />} />

                    </Route>

                    {/* Rutas protegidas por autenticación y estado de encuesta */}
                    <Route element={<ProtectedRoute />}>
                        <Route
                            path="/percepcion-estudiantil"
                            element={<PercepcionEstudiantil />}
                        /><Route
                            path="/admin-dashboard"
                            element={<AdminDashboard />}
                        />
                        <Route
                            path="/student-dashboard"
                            element={<StudentDashboard />}
                        />
                        <Route
                            path="/percepcion-estudiantil/evaluar/:evaluacionId"
                            element={<EvaluacionDocente />}
                        />

                    </Route>
                </Routes>
            </AuthProvider>
        </BrowserRouter>
    );
};
