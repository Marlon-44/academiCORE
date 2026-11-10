
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import {
    Settings,
    CircleHelp,
    LogOut,
    ChevronDown,
    ChevronRight,
    Lock,
    LockOpen,
} from "lucide-react";

import { useAuth } from "../../../../auth/AuthContext";
import styles from "./index.module.css";
import {adminNavigation, type AdminMenuItem} from "../../config/adminNavigation";



interface AdminAsideProps {
    onExpandedChange?: (expanded: boolean) => void;
}


export function AdminAside({ onExpandedChange }: AdminAsideProps) {

    const navigate = useNavigate();
    const { logout } = useAuth();

    const [isHovered, setIsHovered] = useState(false);
    const [isPinned, setIsPinned] = useState(false);

    const isExpanded = isPinned || isHovered;

    const [openMenu, setOpenMenu] = useState<string | null>("percepcion");
    const [showLogoutModal, setShowLogoutModal] = useState(false);
    const [loggingOut, setLoggingOut] = useState(false);
    const [mockMessage, setMockMessage] = useState("");

    const handleMouseEnter = () => {
        setIsHovered(true);
        onExpandedChange?.(true);
    };

    const handleMouseLeave = () => {
        setIsHovered(false);
        onExpandedChange?.(isPinned);
    };

    const handlePinToggle = () => {
        const nextPinned = !isPinned;

        setIsPinned(nextPinned);
        onExpandedChange?.(nextPinned || isHovered);
    };


    const handleMenuClick = (id: string) => {
        setOpenMenu((current) => current === id ? null : id);

    };

    const handleSubmenuClick = (item: AdminMenuItem,
    child: AdminMenuItem) => {
        if (child.mock) {
            setMockMessage(
                `${child.label}: este módulo estará disponible próximamente.`
            );
            return;
        }

        if (item.id === "percepcion" && child.vista) {
            navigate(`/admin-dashboard?vista=${child.vista}`);
        }
    };

    const handleLogout = async () => {
        if (loggingOut) return;

        setLoggingOut(true);

        try {
            await logout();
        } catch (error) {
            console.error("Error al cerrar sesión:", error);
            setLoggingOut(false);
            setShowLogoutModal(false);
        }
    };

    return (
        <>
            <aside
                className={`${styles.aside} ${isExpanded ? styles.expanded : styles.collapsed
                    }`}
                onMouseEnter={handleMouseEnter}
                onMouseLeave={handleMouseLeave}
            >
                {/* Marca / identificación */}
                <div className={styles.brand}>

                    <div className={styles.logo}>
                        <img
                            src="/assets/logoUDC_img.jpg"
                            alt="Logo de la Universidad"
                        />
                    </div>

                    {isExpanded && (
                        <div className={styles.brandText}>
                            <strong>AcademiCORE</strong>
                            <span>Administración</span>
                        </div>
                    )}

                    <button
                        type="button"
                        className={styles.pinButton}
                        onClick={handlePinToggle}
                        title={
                            isPinned
                                ? "Desbloquear expansión automática"
                                : "Mantener menú expandido"
                        }
                        aria-label={
                            isPinned
                                ? "Desbloquear menú"
                                : "Bloquear menú expandido"
                        }
                        aria-pressed={isPinned}
                        style={isExpanded ? { display: "block" } : { display: "none" }}
                    >
                        {isPinned
                            ? <Lock size={17} />
                            : <LockOpen size={17} />
                        }
                    </button>

                </div>


                {/* Menú principal */}
                <nav className={styles.navigation}>
                    <span className={styles.sectionLabel}>
                        {isExpanded ? "MENÚ PRINCIPAL" : ""}
                    </span>

                    {adminNavigation.map((item) => {
                        const Icon = item.icon;
                        const isOpen = openMenu === item.id;

                        return (
                            <div
                                key={item.id}
                                className={styles.menuGroup}
                            >
                                <button
                                    type="button"
                                    className={`${styles.menuButton} ${isOpen ? styles.menuButtonActive : ""
                                        }`}
                                    onClick={() => handleMenuClick(item.id)}
                                    title={!isExpanded ? item.label : undefined}
                                    aria-isExpanded={isOpen}
                                >
                                    {/*<Icon size={20} />*/}

                                    {isExpanded && (
                                        <>
                                            <span>{item.label}</span>
                                            <ChevronDown
                                                size={16}
                                                className={`${styles.chevron} ${isOpen ? styles.chevronOpen : ""
                                                    }`}
                                            />
                                        </>
                                    )}
                                </button>

                                {isOpen && (
                                    <div className={styles.submenu}>
                                        {item.children?.map((child) => (
                                            <button
                                                key={child.label}
                                                type="button"
                                                className={styles.submenuButton}
                                                onClick={() =>
                                                    handleSubmenuClick(item, child)
                                                }
                                            >
                                                {isExpanded ? (
                                                    <span>{child.label}</span>
                                                ) : (
                                                    <>
                                                        <ChevronRight size={14} />
                                                        <span>{child.label}</span>
                                                    </>
                                                )}
                                            </button>
                                        ))}
                                    </div>
                                )}
                            </div>
                        );
                    })}
                </nav>

                {/* Opciones inferiores */}
                <div className={styles.bottomMenu}>
                    <button
                        type="button"
                        className={styles.bottomButton}
                        onClick={() =>
                            setMockMessage("La configuración estará disponible próximamente.")
                        }
                        title={!isExpanded ? "Configuración" : undefined}
                    >
                        <Settings size={20} />
                        {isExpanded && <span>Configuración</span>}
                    </button>

                    <button
                        type="button"
                        className={styles.bottomButton}
                        onClick={() =>
                            setMockMessage("El centro de ayuda estará disponible próximamente.")
                        }
                        title={!isExpanded ? "Ayuda" : undefined}
                    >
                        <CircleHelp size={20} />
                        {isExpanded && <span>Ayuda</span>}
                    </button>

                    <button
                        type="button"
                        className={`${styles.bottomButton} ${styles.logoutButton}`}
                        onClick={() => setShowLogoutModal(true)}
                        title={!isExpanded ? "Cerrar sesión" : undefined}
                    >
                        <LogOut size={20} color="gray" />
                        {isExpanded && <span>Cerrar sesión</span>}
                    </button>
                </div>
            </aside>

            {/* Confirmación de cierre de sesión */}
            {showLogoutModal && (
                <div
                    className={styles.modalOverlay}
                    onClick={() => !loggingOut && setShowLogoutModal(false)}
                >
                    <div
                        className={styles.modal}
                        role="alertdialog"
                        aria-modal="true"
                        aria-labelledby="logout-title"
                        onClick={(event) => event.stopPropagation()}
                    >
                        <div className={styles.modalIcon}>
                            <LogOut size={27} />
                        </div>

                        <h2 id="logout-title">¿Cerrar sesión?</h2>

                        <p>
                            ¿Estás seguro de que deseas salir de la plataforma
                            administrativa?
                        </p>

                        <div className={styles.modalActions}>
                            <button
                                type="button"
                                className={styles.cancelButton}
                                onClick={() => setShowLogoutModal(false)}
                                disabled={loggingOut}
                            >
                                Cancelar
                            </button>

                            <button
                                type="button"
                                className={styles.confirmButton}
                                onClick={handleLogout}
                                disabled={loggingOut}
                            >
                                {loggingOut ? "Cerrando..." : "Sí, salir"}
                            </button>
                        </div>
                    </div>
                </div>
            )}

            {/* Mensajes de módulos de ejemplo */}
            {mockMessage && (
                <div className={styles.toast}>
                    <span>{mockMessage}</span>
                    <button
                        type="button"
                        onClick={() => setMockMessage("")}
                        aria-label="Cerrar mensaje"
                    >
                        ×
                    </button>
                </div>
            )}
        </>
    );
}
