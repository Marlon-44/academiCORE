
import { useEffect, useRef, useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";

import {
    Search,
    Bell,
    ChevronRight,
    X,
    Home,
} from "lucide-react";

import {
    adminNavigation,
    findAdminNavigationPath,
    type AdminMenuItem,
} from "../../config/adminNavigation";

import styles from "./index.module.css";

interface SearchResult {
    item: AdminMenuItem;
    path: AdminMenuItem[];
}

// Obtiene las opciones navegables de todo el menú, incluso
// si en el futuro se agregan más niveles de navegación.
function getAdminSearchResults(
    items: AdminMenuItem[],
    query: string,
    parents: AdminMenuItem[] = []
): SearchResult[] {
    const results: SearchResult[] = [];

    for (const item of items) {
        const currentPath = [...parents, item];

        // Solo se muestran opciones finales del menú.
        if (item.vista || item.mock) {
            const searchableText = currentPath
                .map((element) => element.label)
                .join(" ")
                .toLowerCase();

            if (searchableText.includes(query.toLowerCase())) {
                results.push({
                    item,
                    path: currentPath,
                });
            }
        }

        if (item.children?.length) {
            results.push(
                ...getAdminSearchResults(
                    item.children,
                    query,
                    currentPath
                )
            );
        }
    }

    return results;
}

export function AdminHeader() {
    const navigate = useNavigate();
    const [searchParams] = useSearchParams();

    const [searchOpen, setSearchOpen] = useState(false);
    const [searchValue, setSearchValue] = useState("");
    const [searchMessage, setSearchMessage] = useState("");

    const searchRef = useRef<HTMLDivElement>(null);

    const vistaActual =
        searchParams.get("vista") || "welcome";

    const breadcrumbItems = findAdminNavigationPath(
        adminNavigation,
        vistaActual
    );

    const activeBreadcrumb =
        breadcrumbItems[breadcrumbItems.length - 1];

    // Resultados filtrados automáticamente.
    const searchResults = searchValue.trim()
        ? getAdminSearchResults(
            adminNavigation,
            searchValue.trim()
        )
        : [];

    const handleCloseSearch = () => {
        setSearchOpen(false);
        setSearchValue("");
        setSearchMessage("");
    };

    // Cierra el buscador cuando se hace clic fuera de él.
    useEffect(() => {
        if (!searchOpen) return;

        const handleClickOutside = (event: MouseEvent) => {
            if (
                searchRef.current &&
                !searchRef.current.contains(event.target as Node)
            ) {
                handleCloseSearch();
            }
        };

        document.addEventListener("mousedown", handleClickOutside);

        return () => {
            document.removeEventListener(
                "mousedown",
                handleClickOutside
            );
        };
    }, [searchOpen]);

    // Selección de una opción del menú.
    const handleSelectResult = (result: SearchResult) => {
        const { item } = result;

        if (item.mock) {
            setSearchMessage(
                `${item.label}: este módulo estará disponible próximamente.`
            );
            return;
        }

        if (item.vista) {
            navigate(`/admin-dashboard?vista=${item.vista}`);
            handleCloseSearch();
        }
    };

    const handleSearchKeyDown = (
        event: React.KeyboardEvent<HTMLInputElement>
    ) => {
        if (event.key === "Escape") {
            handleCloseSearch();
        }
    };

    return (
        <header className={styles.header}>
            {/* Migas de pan */}
            <div className={styles.heading}>
                <nav
                    className={styles.breadcrumb}
                    aria-label="Ruta de navegación"
                >

                    <Home size={18} onClick={() => navigate("/admin-dashboard")} className={styles.homeBtn} />

                    {breadcrumbItems.length == 0 && (
                        <>
                            <ChevronRight size={14} />
                            <span className={styles.breadcrumbActive}>Página principal</span>
                        </>
                    )}
                    {breadcrumbItems.map((item) => (
                        <div
                            key={item.id}
                            className={styles.breadcrumbItem}
                        >

                            <ChevronRight size={14} />
                            <span
                                className={
                                    item.id === activeBreadcrumb?.id
                                        ? styles.breadcrumbActive
                                        : styles.breadcrumbParent
                                }
                            >
                                { }
                                {item.label}
                            </span>
                        </div>
                    ))}
                </nav>

            </div>

            {/* Acciones */}
            <div className={styles.actions}>
                {/* Búsqueda */}
                <div
                    ref={searchRef}
                    className={`${styles.searchContainer} ${searchOpen ? styles.searchExpanded : ""
                        }`}
                >
                    {searchOpen && (
                        <input
                            type="text"
                            autoFocus
                            value={searchValue}
                            onChange={(event) => {
                                setSearchValue(event.target.value);
                                setSearchMessage("");
                            }}
                            onKeyDown={handleSearchKeyDown}
                            placeholder="Buscar opción del menú..."
                            aria-label="Buscar opción del menú"
                            aria-expanded={searchOpen}
                        />
                    )}

                    <button
                        type="button"
                        className={styles.actionButton}
                        onClick={() => {
                            if (searchOpen) {
                                handleCloseSearch();
                            } else {
                                setSearchOpen(true);
                            }
                        }}
                        aria-label={
                            searchOpen
                                ? "Cerrar búsqueda"
                                : "Abrir búsqueda"
                        }
                    >
                        {searchOpen ? (
                            <X size={19} />
                        ) : (
                            <Search size={20} />
                        )}
                    </button>

                    {/* Desplegable de resultados */}
                    {searchOpen && searchValue.trim() && (
                        <div className={styles.searchDropdown}>
                            {searchResults.length > 0 ? (
                                <>


                                    {searchResults.map((result) => (
                                        <button
                                            type="button"
                                            key={result.item.id}
                                            className={styles.searchResult}
                                            onClick={() =>
                                                handleSelectResult(result)
                                            }
                                        >
                                            <span
                                                className={styles.resultInfo}
                                            >
                                                <span
                                                    className={
                                                        styles.resultTitle
                                                    }
                                                >
                                                    {result.item.label}
                                                </span>

                                                <span
                                                    className={
                                                        styles.resultParent
                                                    }
                                                >
                                                    {result.path
                                                        .slice(0, -1)
                                                        .map((item) => item.label)
                                                        .join(" / ")}
                                                </span>
                                            </span>


                                        </button>
                                    ))}
                                </>
                            ) : (
                                <div className={styles.searchEmpty}>
                                    <Search size={19} />
                                    <span>
                                        No se encontraron opciones para
                                        "{searchValue}"
                                    </span>
                                </div>
                            )}

                            {searchMessage && (
                                <div className={styles.searchMessage}>
                                    {searchMessage}
                                </div>
                            )}
                        </div>
                    )}
                </div>

                {/* Notificaciones */}
                <button
                    type="button"
                    className={`${styles.actionButton} ${styles.notificationButton}`}
                    aria-label="Notificaciones"
                    title="Notificaciones"
                >
                    <Bell size={20} />
                    <span className={styles.notificationDot} />
                </button>

                {/* Perfil */}
                <button
                    type="button"
                    className={styles.profileButton}
                    aria-label="Perfil del administrador"
                    title="Perfil"
                >
                    <img
                        src="https://i.pinimg.com/1200x/44/b8/04/44b80477d8b5b2f71654f1816b7fe50b.jpg"
                        alt="Foto de perfil del administrador"
                        className={styles.profilePicture}
                    />
                </button>
            </div>
        </header>
    );
}
