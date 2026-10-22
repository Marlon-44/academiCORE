import { useCallback, useEffect, useMemo, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../../auth/AuthContext";
import {
    getTeachers,
    type Teacher,
    type SurveyStatus,
} from "../../services/teacherSurveyService";
import styles from "./index.module.css";
import { Banner } from "./components/Banner";
import { Header } from "./components/Header";
import { Footer } from "./components/Footer";
import { TeacherCard } from "./components/TeacherCard";

type FilterStatus = "all" | SurveyStatus;

type IconName =
    | "search"
    | "check"
    | "clock"
    | "users"
    | "book"
    | "graduation"
    | "arrow"
    | "clipboard"
    | "sparkles";

function Icon({ name, size = 20 }: { name: IconName; size?: number }) {
    const common = {
        width: size,
        height: size,
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        strokeWidth: 1.8,
        strokeLinecap: "round" as const,
        strokeLinejoin: "round" as const,
        "aria-hidden": true as const,
    };

    switch (name) {
        case "search":
            return <svg {...common}><circle cx="11" cy="11" r="7" /><path d="m20 20-4-4" /></svg>;
        case "check":
            return <svg {...common}><path d="m5 12 4 4L19 6" /></svg>;
        case "clock":
            return <svg {...common}><circle cx="12" cy="12" r="9" /><path d="M12 7v5l3 2" /></svg>;
        case "users":
            return <svg {...common}><path d="M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" /><circle cx="10" cy="7" r="4" /><path d="M20 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75" /></svg>;
        case "book":
            return <svg {...common}><path d="M4 5.5A2.5 2.5 0 0 1 6.5 3H20v16H6.5A2.5 2.5 0 0 0 4 21.5z" /><path d="M4 5.5v16M8 7h8M8 11h7" /></svg>;
        case "graduation":
            return <svg {...common}><path d="m2 10 10-5 10 5-10 5z" /><path d="M6 12v5c4 3 8 3 12 0v-5M22 10v6" /></svg>;
        case "arrow":
            return <svg {...common}><path d="M5 12h14M13 6l6 6-6 6" /></svg>;
        case "clipboard":
            return <svg {...common}><rect x="5" y="4" width="14" height="17" rx="2" /><path d="M9 4.5V3h6v1.5M9 11h6M9 15h6" /></svg>;
        case "sparkles":
            return <svg {...common}><path d="m12 3 1.9 5.8L20 11l-6.1 2.2L12 19l-2-5.8L4 11l6-2.2z" /><path d="m19 14 1.1 2.9L23 18l-2.9 1.1L19 22l-1.1-2.9L15 18l2.9-1.1z" /></svg>;
    }
}

export function PercepcionEstudiantil() {
    const navigate = useNavigate();
    const { completeSurvey } = useAuth();


    const [teachers, setTeachers] = useState<Teacher[]>([]);
    const [isLoading, setIsLoading] = useState(true);
    const [loadError, setLoadError] = useState("");
    const [search, setSearch] = useState("");
    const [activeFilter, setActiveFilter] = useState<FilterStatus>("all");

    const fetchTeachers = useCallback(() => {
        return getTeachers();
    }, []);

    useEffect(() => {
        let cancelled = false;

        fetchTeachers()
            .then((data) => {
                if (cancelled) return;

                setTeachers(data);

                const everythingCompleted =
                    data.length > 0 &&
                    data.every(
                        (teacher) => teacher.status === "completed"
                    );

                if (everythingCompleted) {
                    completeSurvey();
                }
            })
            .catch((error: unknown) => {
                if (cancelled) return;

                console.error(
                    "Error al cargar las evaluaciones:",
                    error
                );

                setLoadError(
                    "No pudimos cargar las evaluaciones. Inténtalo nuevamente."
                );
            })
            .finally(() => {
                if (!cancelled) {
                    setIsLoading(false);
                }
            });

        return () => {
            cancelled = true;
        };
    }, [fetchTeachers, completeSurvey]);


    const total = teachers.length;
    const completed = teachers.filter((teacher) => teacher.status === "completed").length;
    const pending = total - completed;
    const allCompleted = !isLoading && total > 0 && pending === 0;
    const progress = total > 0 ? Math.round((completed / total) * 100) : 0;

    const filteredTeachers = useMemo(() => {
        const normalizedSearch = search.trim().toLocaleLowerCase("es");

        return teachers
            .filter((teacher) => {
                if (activeFilter !== "all" && teacher.status !== activeFilter) {
                    return false;
                }

                const searchableText = [
                    teacher.name,
                    teacher.subject,
                    teacher.program,
                    teacher.semester,
                ].join(" ").toLocaleLowerCase("es");

                return searchableText.includes(normalizedSearch);
            })
            .sort((a, b) => {
                if (a.status === b.status) {
                    return a.name.localeCompare(b.name, "es");
                }
                return a.status === "pending" ? -1 : 1;
            });
    }, [teachers, search, activeFilter]);

    const handleEvaluate = (teacher: Teacher) => {
        if (teacher.status === "completed") return;
        navigate(`/percepcion-estudiantil/evaluar/${teacher.id}`);
    };

    const clearFilters = () => {
        setSearch("");
        setActiveFilter("all");
    };

    return (
        <main className={styles.page}>
            <Header />
            <div className={styles.container}>
                <Banner />

                <section className={styles.progressSection} aria-label="Resumen de evaluaciones">
                    <div className={styles.sectionHeading}>
                        <div>
                            <h2>Tu progreso</h2>
                            <p>Lleva el control de tus evaluaciones</p>
                        </div>
                        <span className={styles.progressPercent}>
                            {isLoading ? "—" : `${progress}%`}
                        </span>
                    </div>

                    <div
                        className={styles.progressTrack}
                        role="progressbar"
                        aria-label="Porcentaje de evaluaciones completadas"
                        aria-valuemin={0}
                        aria-valuemax={100}
                        aria-valuenow={isLoading ? 0 : progress}
                    >
                        <div
                            className={styles.progressFill}
                            style={{ width: `${isLoading ? 0 : progress}%` }}
                        />
                    </div>

                    <div className={styles.statsGrid}>
                        <article className={styles.statCard} style={{ backgroundColor: "#ff3042" }}>
                            <div className={`${styles.statIcon} ${styles.statIconPurple}`}>
                                <Icon name="users" size={21} />
                            </div>
                            <div>
                                <span className={styles.statLabel}>Docentes asignados</span>
                                <strong className={styles.statValue}>{isLoading ? "—" : total}</strong>
                            </div>
                        </article>

                        <article className={styles.statCard} style={{ backgroundColor: "#66AD9E" }}>
                            <div className={`${styles.statIcon} ${styles.statIconGreen}`}>
                                <Icon name="check" size={21} />
                            </div>
                            <div>
                                <span className={styles.statLabel}>Completadas</span>
                                <strong className={styles.statValue}>{isLoading ? "—" : completed}</strong>
                            </div>
                        </article>

                        <article className={styles.statCard} style={{ backgroundColor: "#F3912B" }}>
                            <div className={`${styles.statIcon} ${styles.statIconYellow}`}>
                                <Icon name="clock" size={21} />
                            </div>
                            <div>
                                <span className={styles.statLabel}>Pendientes</span>
                                <strong className={styles.statValue}>{isLoading ? "—" : pending}</strong>
                            </div>
                        </article>
                    </div>

                    <div className={styles.dashboardAction}>
                        {isLoading ? (
                            <p role="status">Verificando el estado de tus evaluaciones...</p>
                        ) : allCompleted ? (
                            <>
                                <p role="status">
                                    ¡Excelente! Has completado todas las evaluaciones asignadas.
                                </p>
                                <button
                                    type="button"
                                    onClick={() => navigate("/student-dashboard", { replace: true })}
                                >
                                    Ir al dashboard <Icon name="arrow" size={17} />
                                </button>
                            </>
                        ) : loadError ? (
                            <p role="status">No es posible verificar tu progreso hasta cargar las evaluaciones.</p>
                        ) : total === 0 ? (
                            <p role="status">No tienes evaluaciones asignadas en este momento.</p>
                        ) : (
                            <p role="status">
                                Te faltan {pending} {pending === 1 ? "evaluación" : "evaluaciones"} por completar.
                            </p>
                        )}
                    </div>
                </section>

                {loadError && (
                    <div className={styles.loadError} role="alert">
                        <p>{loadError}</p>
                        <button
                            type="button"
                            onClick={() => {
                                setIsLoading(true);
                                setLoadError("");

                                void getTeachers()
                                    .then((data) => {
                                        setTeachers(data);

                                        const everythingCompleted =
                                            data.length > 0 &&
                                            data.every(
                                                (teacher) => teacher.status === "completed"
                                            );

                                        if (everythingCompleted) {
                                            completeSurvey();
                                        }
                                    })
                                    .catch((error: unknown) => {
                                        console.error(
                                            "Error al cargar las evaluaciones:",
                                            error
                                        );

                                        setLoadError(
                                            "No pudimos cargar las evaluaciones. Inténtalo nuevamente."
                                        );
                                    })
                                    .finally(() => {
                                        setIsLoading(false);
                                    });
                            }}
                        >
                            Reintentar
                        </button>
                    </div>
                )}

                <section className={styles.teachersSection}>
                    <div className={styles.teachersHeading}>
                        <div>
                            <h2>Mis evaluaciones</h2>
                            <p>Selecciona un profesor para evaluar.</p>
                        </div>
                        {!isLoading && !loadError && (
                            <span className={styles.resultsCount}>
                                {filteredTeachers.length}{" "}
                                {filteredTeachers.length === 1 ? "resultado" : "resultados"}
                            </span>
                        )}
                    </div>

                    <div className={styles.toolbar}>
                        <label className={styles.searchBox}>
                            <Icon name="search" size={19} />
                            <input
                                type="search"
                                value={search}
                                onChange={(event) => setSearch(event.target.value)}
                                placeholder="Buscar docente o asignatura..."
                                aria-label="Buscar docente, asignatura o programa"
                            />
                            {search && (
                                <button
                                    type="button"
                                    className={styles.clearSearch}
                                    onClick={() => setSearch("")}
                                    aria-label="Limpiar búsqueda"
                                >×</button>
                            )}
                        </label>

                        <div className={styles.filters} role="group" aria-label="Filtrar evaluaciones">
                            {[
                                { value: "all", label: "Todas" },
                                { value: "pending", label: "Pendientes" },
                                { value: "completed", label: "Completadas" },
                            ].map((filter) => (
                                <button
                                    key={filter.value}
                                    type="button"
                                    className={`${styles.filterButton} ${activeFilter === filter.value ? styles.filterActive : ""}`}
                                    onClick={() => setActiveFilter(filter.value as FilterStatus)}
                                    aria-pressed={activeFilter === filter.value}
                                >
                                    {filter.label}
                                </button>
                            ))}
                        </div>
                    </div>

                    {isLoading ? (
                        <div className={styles.loadingGrid} role="status" aria-live="polite">
                            {Array.from({ length: 3 }).map((_, index) => (
                                <div key={index} className={styles.skeletonCard}>
                                    <div className={styles.skeletonHeader}>
                                        <span className={styles.skeletonAvatar} />
                                        <span className={styles.skeletonBadge} />
                                    </div>
                                    <span className={styles.skeletonLine} />
                                    <span className={styles.skeletonLineShort} />
                                    <span className={styles.skeletonButton} />
                                </div>
                            ))}
                            <span className={styles.srOnly}>Cargando las evaluaciones...</span>
                        </div>
                    ) : loadError ? null : filteredTeachers.length > 0 ? (
                        <div className={styles.teacherGrid}>
                            {filteredTeachers.map((teacher) =>
                                <TeacherCard
                                    key={teacher.id}
                                    teacher={teacher}
                                    onEvaluate={handleEvaluate}
                                />
                            )}
                        </div>
                    ) : (
                        <div className={styles.emptyState}>
                            <div className={styles.emptyIcon}><Icon name="search" size={30} /></div>
                            <h3>No encontramos evaluaciones</h3>
                            <p>No hay docentes que coincidan con tu búsqueda o con el filtro seleccionado.</p>
                            <button type="button" className={styles.resetButton} onClick={clearFilters}>
                                Mostrar todas las evaluaciones
                            </button>
                        </div>
                    )}
                </section>

                <Footer />
            </div>
        </main>
    );
}
