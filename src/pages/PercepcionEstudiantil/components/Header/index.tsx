
import { useState } from "react";
import { Link } from "react-router-dom";
import { useAuth } from "../../../../auth/AuthContext";
import styles from "./index.module.css";

export const Header = () => {
    const { logout } = useAuth();
    const [mostrarModal, setMostrarModal] = useState(false);
    const [cerrandoSesion, setCerrandoSesion] = useState(false);

    const handleLogout = async () => {
        if (cerrandoSesion) return;

        setCerrandoSesion(true);

        try {
            await logout();
        } catch (error) {
            console.error("Error cerrando sesión:", error);
            setCerrandoSesion(false);
        }
    };

    return (
        <>
            <header className={styles.header}>
                <div className={styles.container}>
                    <div className={styles.brand}>
                        <Link to="/" className={styles.imageContainer}>
                            <picture>
                                <source
                                    media="(max-width: 768px)"
                                    srcSet="/assets/logoUDC_img.jpg"
                                />
                                <img
                                    src="/assets/logoUDC_normal.png"
                                    alt="Logo UDC"
                                />
                            </picture>
                        </Link>
                    </div>

                    <button
                        type="button"
                        className={styles.logoutButton}
                        onClick={() => setMostrarModal(true)}
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

            {mostrarModal && (
                <div
                    className={styles.modalOverlay}
                    onClick={() => !cerrandoSesion && setMostrarModal(false)}
                >
                    <div
                        className={styles.modal}
                        role="alertdialog"
                        aria-modal="true"
                        aria-labelledby="logout-title"
                        aria-describedby="logout-description"
                        onClick={(e) => e.stopPropagation()}
                    >
                        <div className={styles.modalIcon}>
                            <svg
                                width="28"
                                height="28"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                strokeWidth="2"
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                aria-hidden="true"
                            >
                                <path d="M10 17l5-5-5-5" />
                                <path d="M15 12H3" />
                                <path d="M12 3h6a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-6" />
                            </svg>
                        </div>

                        <h2 id="logout-title">
                            ¿Cerrar sesión?
                        </h2>

                        <p id="logout-description">
                            ¿Estás seguro de que deseas cerrar tu sesión?
                            Tendrás que iniciar sesión nuevamente para acceder
                            a la plataforma.
                        </p>

                        <div className={styles.modalActions}>
                            <button
                                type="button"
                                className={styles.modalCancel}
                                onClick={() => setMostrarModal(false)}
                                disabled={cerrandoSesion}
                            >
                                Cancelar
                            </button>

                            <button
                                type="button"
                                className={styles.modalConfirm}
                                onClick={handleLogout}
                                disabled={cerrandoSesion}
                            >
                                {cerrandoSesion
                                    ? "Cerrando sesión..."
                                    : "Sí, cerrar sesión"}
                            </button>
                        </div>
                    </div>
                </div>
            )}
        </>
    );
};
