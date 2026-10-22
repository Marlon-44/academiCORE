
import { Link } from "react-router-dom";
import { useAuth } from "../../../../auth/AuthContext";
import styles from "./index.module.css";



export const Header = () => {
    const { logout } = useAuth();

    const handleLogout = async () => {
        await logout();
    };

    return (
        <header className={styles.header}>
            <div className={styles.container}>
                <div className={styles.brand}>
                    <Link to="/" className={styles.imageContainer}>
                        <picture>
                            {/* Si la pantalla es de 768px o menos, muestra la versión de móvil */}
                            <source media="(max-width: 768px)" srcSet="/assets/logoUDC_img.jpg" />
                            {/* Por defecto o en pantallas más grandes, muestra la de PC */}
                            <img src="/assets/logoUDC_normal.png" alt="Logo UDC" />
                        </picture>
                    </Link>
                </div>

                <button
                    type="button"
                    className={styles.logoutButton}
                    onClick={handleLogout}
                    aria-label="Cerrar sesión"
                >
                    <svg
                        width="18"
                        height="18"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        strokeWidth="2"
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        aria-hidden="true"
                    >
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
                        <polyline points="16 17 21 12 16 7" />
                        <line x1="21" y1="12" x2="9" y2="12" />
                    </svg>

                    <span>Salir</span>
                </button>
            </div>
        </header>
    );
}
