
import {
    BrowserRouter,
    Route,
    Routes,
} from "react-router-dom";

import { MainLayout } from "../layout";
import { Home } from "../pages/Home";

import { AuthProvider } from "../auth/AuthContext";
import { ProtectedRoute } from "../auth/ProtectedRoute";
import { RoleRoute } from "../auth/RoleRoute";

import { PercepcionEstudiantil } from "../pages/PercepcionEstudiantil";
import { StudentDashboard } from "../pages/StudentDashboard";
import { EvaluacionDocente } from "../pages/EvaluacionDocente";

import { AdminDashboard } from "../pages/AdminDashboard";
import { StudentPerceptionView } from "../pages/AdminDashboard/views/StudentPerceptionView";

export const AppRouter = () => {
    return (
        <BrowserRouter>
            <AuthProvider>
                <Routes>
                    {/* Rutas públicas */}
                    <Route path="/" element={<MainLayout />}>
                        <Route index element={<Home />} />
                    </Route>

                    {/* Rutas protegidas: requieren autenticación */}
                    <Route element={<ProtectedRoute />}>

                        {/* Rutas exclusivas de ADMIN */}
                        <Route
                            element={
                                <RoleRoute allowedRoles={["ADMIN"]} />
                            }
                        >
                            {/* AdminDashboard funciona como layout */}
                            <Route
                                path="/admin-dashboard"
                                element={<AdminDashboard />}
                            >
                                {/* Vista inicial del administrador */}
                                <Route
                                    index
                                    element={<StudentPerceptionView />}
                                />
                            </Route>
                            
                        </Route>

                        {/* Rutas exclusivas de ESTUDIANTE */}
                        <Route
                            element={
                                <RoleRoute
                                    allowedRoles={["ESTUDIANTE"]}
                                />
                            }
                        >
                            <Route
                                path="/percepcion-estudiantil"
                                element={<PercepcionEstudiantil />}
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

                    </Route>
                </Routes>
            </AuthProvider>
        </BrowserRouter>
    );
};
