import { BrowserRouter, Route, Routes } from "react-router-dom";

import { MainLayout } from "../layout";
import { Home } from "../pages/Home";

import { AuthProvider } from "../auth/AuthContext";
import { ProtectedRoute } from "../auth/ProtectedRoute";
import { PercepcionEstudiantil } from "../pages/PercepcionEstudiantil";
import { StudentDashboard } from "../pages/StudentDashboard";
import { EvaluacionDocente } from "../pages/EvaluacionDocente";

export const AppRouter = () => {
    return (
        <BrowserRouter>
            <AuthProvider>
                <Routes>
                    {/* Rutas públicas */}
                    <Route path="/" element={<MainLayout />}>
                        <Route index element={<Home />} />
                        <Route
                            path="evaluacion-docente"
                            element={<EvaluacionDocente />}
                        />
                    </Route>

                    {/* Rutas protegidas por autenticación y estado de encuesta */}
                    <Route element={<ProtectedRoute />}>
                        <Route
                            path="/percepcion-estudiantil"
                            element={<PercepcionEstudiantil />}
                        />
                        <Route
                            path="/student-dashboard"
                            element={<StudentDashboard />}
                        />
                    </Route>
                </Routes>
            </AuthProvider>
        </BrowserRouter>
    );
};
