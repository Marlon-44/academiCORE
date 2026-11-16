
import { Link, useNavigate } from "react-router-dom";
import styles from "./index.module.css";
import { useState } from "react";
import { LoginDropdown } from "../LoginDropdown";
import { useAuth } from "../../auth/AuthContext";

export const Header = () => {
    const [isLoginOpen, setIsLoginOpen] = useState(false);
    const [menuOpen, setMenuOpen] = useState(false);

    const navigate = useNavigate();

    const { user, isAuthenticated, isLoading } = useAuth();

    const openLogin = () => {
        setIsLoginOpen(true);
    };

    const closeLogin = () => {
        setIsLoginOpen(false);
    };

    // Determina a dónde debe ir el usuario según su sesión y rol.
    const handlePlatformAccess = () => {
        // Evita tomar decisiones mientras se verifica la sesión.
        if (isLoading) return;

        // Si no hay una sesión activa, mostramos el formulario.
        if (!isAuthenticated || !user) {
            openLogin();
            return;
        }

        // Si ya está autenticado, lo enviamos a su plataforma.
        setIsLoginOpen(false);

        switch (user.role) {
            case "ADMIN":
                navigate("/admin-dashboard", { replace: true });
                break;

            case "ESTUDIANTE":
                if (!user.surveyCompleted) {
                    navigate("/percepcion-estudiantil", {
                        replace: true,
                    });
                } else {
                    navigate("/student-dashboard", {
                        replace: true,
                    });
                }
                break;

            default:
                navigate("/", { replace: true });
                break;
        }
    };

    return (
        <header
            className={`${styles.header} ${
                menuOpen ? styles.grow : ""
            }`}
        >
            <div className={styles.logoSection}>
                <Link to="/" className={styles.imageContainer}>
                    <img
                        src="/assets/logoUDC_normal.png"
                        alt="Logo UDC"
                    />
                </Link>
            </div>

            <nav>
                <ul
                    className={`${styles.headerList} ${
                        menuOpen ? styles.open : ""
                    }`}
                >
                    <li>
                        <Link
                            to="/convocatorias"
                            className={styles.headerLink}
                        >
                            Convocatorias
                        </Link>
                    </li>

                    <li>
                        <Link
                            to="/inscripciones"
                            className={styles.headerLink}
                        >
                            Inscripciones
                        </Link>
                    </li>

                    <li>
                        <Link
                            to="/admisiones"
                            className={styles.headerLink}
                        >
                            Admisiones
                        </Link>
                    </li>

                    <li>
                        <Link
                            to="/admisiones"
                            className={styles.headerLink}
                        >
                            Resultados
                        </Link>
                    </li>

                    <li>
                        <button
                            type="button"
                            onClick={handlePlatformAccess}
                            className={styles.headerLink}
                        >
                            <span>Plataforma Académica</span>
                        </button>
                    </li>

                    <li>
                        <button
                            type="button"
                            onClick={handlePlatformAccess}
                            className={styles.loginButton2}
                            aria-expanded={isLoginOpen}
                            aria-haspopup="dialog"
                        >
                            {isAuthenticated
                                ? "Ir a mi plataforma"
                                : "Iniciar sesión"}
                        </button>
                    </li>
                </ul>
            </nav>

            <div className={styles.loginWrapper}>
                <button
                    type="button"
                    onClick={handlePlatformAccess}
                    className={styles.loginButton}
                    aria-expanded={isLoginOpen}
                    aria-haspopup="dialog"
                >
                    <span>
                        {isAuthenticated
                            ? "Ir a mi plataforma"
                            : "Iniciar sesión"}
                    </span>

                    <div className={styles.arrowContainer}>
                        <img
                            src="/assets/arrow.png"
                            alt=""
                        />
                    </div>
                </button>

                <LoginDropdown
                    isOpen={isLoginOpen}
                    onClose={closeLogin}
                />
            </div>

            <button
                type="button"
                className={`${styles.menuButton} ${
                    menuOpen ? styles.active : ""
                }`}
                onClick={() => setMenuOpen(!menuOpen)}
                aria-label="Abrir menú"
                aria-expanded={menuOpen}
            >
                <span></span>
                <span></span>
            </button>
        </header>
    );
};
