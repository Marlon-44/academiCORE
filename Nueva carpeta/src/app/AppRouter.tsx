import { BrowserRouter, Route, Routes } from "react-router-dom";

import { MainLayout } from "../layout";
import { Home } from "../pages/Home";

import { AuthProvider } from "../auth/AuthContext";
import { ProtectedRoute } from "../auth/ProtectedRoute";
import { StudentDashboard } from "../pages/StudentDashboard";

export const AppRouter = () => {
    return (
        <BrowserRouter>
            <AuthProvider>
                <Routes>

                    {/* Rutas públicas */}
                    <Route path="/" element={<MainLayout />}>
                        <Route index element={<Home />} />
                    </Route>

                    {/* Rutas protegidas */}
                    <Route element={<ProtectedRoute />}>
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