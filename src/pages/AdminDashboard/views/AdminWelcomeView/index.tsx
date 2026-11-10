
import { useMemo, useState } from "react";
import {
    ArrowRight,
    ArrowUpRight,
    BookOpen,
    CalendarDays,
    ChartNoAxesCombined,
    ChevronLeft,
    ChevronRight,
    Clock3,
    GraduationCap,
    MapPin,
    Users,
} from "lucide-react";

import styles from "./index.module.css";
import { ProfileCard } from "./components/ProfileCard";
import type { Admin } from "../../types";
import { Banner } from "./components/Banner";

// Datos temporales del administrador
const admin: Admin = {
    name: "Renata Elizabeth Greenwood Forest",
    role: "Coordinador académico",
    department: "Facultad de Ingeniería",
    institution: "Universidad de Cartagena",
    email: "rgreenwoodf@unicartagena.edu.co",
    avatar: "https://i.pinimg.com/1200x/44/b8/04/44b80477d8b5b2f71654f1816b7fe50b.jpg",
    academicPeriod: "2026 - II",
};

// Noticias institucionales de ejemplo
const news = [
    {
        id: 1,
        category: "ACADÉMICO",
        title: "La Universidad anuncia nuevas fechas para el calendario académico",
        description:
            "Consulta las fechas y actividades más importantes del próximo periodo académico.",
        date: "03 Nov, 2026",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYoxO8rwwvA-trYoamsESatc5rOMF_Yeqonp9-RsfKGrAjMMwzVdlsDC-A&s=10",
    },
    {
        id: 2,
        category: "INSTITUCIONAL",
        title: "Nuevas iniciativas para fortalecer la calidad educativa",
        description:
            "Conoce las estrategias institucionales orientadas al mejoramiento continuo.",
        date: "02 Nov, 2026",
        image:
            "https://images.unsplash.com/photo-1523580494863-6f3031224c94?w=700",
    },
    {
        id: 3,
        category: "COMUNICADO",
        title: "Actualización de los procesos de gestión académica",
        description:
            "Se presentan novedades en los procedimientos administrativos de las dependencias.",
        date: "30 Oct, 2026",
        image:
            "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=700",
    },
    {
        id: 4,
        category: "EVENTOS",
        title: "Encuentro institucional de coordinadores académicos",
        description:
            "Un espacio para compartir experiencias y fortalecer los procesos académicos.",
        date: "28 Oct, 2026",
        image:
            "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?w=700",
    },
];

// Módulos de acceso rápido
const modules = [
    {
        id: 1,
        title: "Percepción Estudiantil",
        description: "Consulta y analiza los resultados de evaluación docente.",
        icon: ChartNoAxesCombined,
        color: "purple",
        path: "/percepcion-estudiantil",
    },
    {
        id: 2,
        title: "Gestión Curricular",
        description: "Consulta los procesos de desarrollo curricular.",
        icon: BookOpen,
        color: "teal",
        path: "/gestion-curricular",
    },
    {
        id: 3,
        title: "Gestión Académica",
        description: "Accede a las herramientas de gestión académica.",
        icon: GraduationCap,
        color: "orange",
        path: "/gestion-academica",
    },
    {
        id: 4,
        title: "Gestión de Usuarios",
        description: "Consulta perfiles y permisos institucionales.",
        icon: Users,
        color: "blue",
        path: "/usuarios",
    },
];

const getDateKey = (date: Date) => {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");

    return `${year}-${month}-${day}`;
};

const formatMonth = (date: Date) =>
    new Intl.DateTimeFormat("es-CO", {
        month: "long",
        year: "numeric",
    }).format(date);



export const AdminWelcomeView = () => {
    const today = new Date();

    const [viewDate, setViewDate] = useState(
        new Date(today.getFullYear(), today.getMonth(), 1)
    );

    const [selectedDate, setSelectedDate] = useState(getDateKey(today));
    const [activeNews, setActiveNews] = useState(0);

    // Eventos institucionales de demostración.
    // Las fechas se generan para el mes actual.
    const events = useMemo(() => {
        const year = today.getFullYear();
        const month = today.getMonth();

        return [
            {
                date: getDateKey(new Date(year, month, 5)),
                title: "Reunión de coordinación académica",
                type: "meeting",
                time: "09:00 a. m.",
                location: "Sala de juntas",
            },
            {
                date: getDateKey(new Date(year, month, 12)),
                title: "Entrega de informes académicos",
                type: "deadline",
                time: "Todo el día",
                location: "Dependencias académicas",
            },
            {
                date: getDateKey(new Date(year, month, 18)),
                title: "Comité de calidad académica",
                type: "meeting",
                time: "02:00 p. m.",
                location: "Sala de reuniones",
            },
            {
                date: getDateKey(new Date(year, month, 25)),
                title: "Cierre de actividades institucionales",
                type: "important",
                time: "Todo el día",
                location: "Universidad de Cartagena",
            },
        ];
    }, []);

    const eventsByDate = useMemo(
        () => new Map(events.map((event) => [event.date, event])),
        [events]
    );

    const selectedEvent = eventsByDate.get(selectedDate);

    // Construcción del calendario
    const calendarDays = useMemo(() => {
        const year = viewDate.getFullYear();
        const month = viewDate.getMonth();

        const firstDay = new Date(year, month, 1);
        const daysInMonth = new Date(year, month + 1, 0).getDate();

        // Semana iniciando en lunes
        const offset = (firstDay.getDay() + 6) % 7;

        return [
            ...Array(offset).fill(null),
            ...Array.from({ length: daysInMonth }, (_, i) => i + 1),
        ];
    }, [viewDate]);

    const changeMonth = (direction: number) => {
        setViewDate(
            new Date(
                viewDate.getFullYear(),
                viewDate.getMonth() + direction,
                1
            )
        );

        setSelectedDate(
            getDateKey(
                new Date(
                    viewDate.getFullYear(),
                    viewDate.getMonth() + direction,
                    1
                )
            )
        );
    };

    const visibleNews = [
        news[activeNews % news.length],
        news[(activeNews + 1) % news.length],
    ];

    const handleNewsNavigation = (direction: number) => {
        setActiveNews(
            (previous) =>
                (previous + direction + news.length) % news.length
        );
    };

    const selectedDateFormatted = new Intl.DateTimeFormat("es-CO", {
        day: "numeric",
        month: "long",
    }).format(new Date(`${selectedDate}T12:00:00`));

    return (
        <main className={styles.welcome}>
            {/* CONTENIDO PRINCIPAL */}
            <section className={styles.mainContent}>
                {/* Bienvenida */}
                <Banner admin={admin} />


                {/* Noticias */}
                <section className={styles.newsSection}>
                    <div className={styles.sectionHeader}>
                        <div>

                            <h2>Noticias recientes</h2>

                        </div>

                        <div className={styles.carouselControls}>
                            <button
                                onClick={() => handleNewsNavigation(-1)}
                                aria-label="Noticias anteriores"
                            >
                                <ChevronLeft size={19} />
                            </button>

                            <button
                                onClick={() => handleNewsNavigation(1)}
                                aria-label="Noticias siguientes"
                            >
                                <ChevronRight size={19} />
                            </button>
                        </div>
                    </div>

                    <div className={styles.newsGrid}>
                        {visibleNews.map((item) => (
                            <a href={item.image} target="_blank" rel="noopener noreferrer" style={{ textDecoration: "none", color: "inherit", cursor: "pointer" }} key={item.id}>
                                <article key={item.id} className={styles.newsCard}>
                                    <div className={styles.newsImage}>
                                        <img src={item.image} alt="" />

                                    </div>

                                    <div className={styles.newsBody}>
                                        <span className={styles.newsDate}>
                                            {item.date}
                                        </span>

                                        <h3>{item.title}</h3>

                                        <p>{item.description}</p>
                                    </div>
                                </article></a>

                        ))}
                    </div>

                    <div className={styles.carouselIndicators}>
                        {news.map((item, index) => (
                            <button
                                key={item.id}
                                aria-label={`Ir a noticia ${index + 1}`}
                                className={
                                    index === activeNews
                                        ? styles.indicatorActive
                                        : ""
                                }
                                onClick={() => setActiveNews(index)}
                            />
                        ))}
                    </div>
                </section>

                {/* Accesos frecuentes */}
                <section className={styles.modulesSection}>
                    <div className={styles.sectionHeader}>
                        <div>
                            <h2>Accesos frecuentes</h2>
                        </div>
                    </div>

                    <div className={styles.modulesGrid}>
                        {modules.map((module) => {
                            const Icon = module.icon;

                            return (
                                <a
                                    key={module.id}
                                    href={module.path}
                                    className={styles.moduleCard}
                                >
                                    <div
                                        className={`${styles.moduleIcon} ${styles[module.color]
                                            }`}
                                    >
                                        <Icon size={22} />
                                    </div>

                                    <div className={styles.moduleInfo}>
                                        <h3>{module.title}</h3>
                                        <p>{module.description}</p>
                                    </div>

                                    <ArrowRight
                                        size={18}
                                        className={styles.moduleArrow}
                                    />
                                </a>
                            );
                        })}
                    </div>
                </section>
            </section>

            {/* BARRA LATERAL */}
            <aside className={styles.sidebar}>
                <ProfileCard admin={admin} />

                {/* Calendario */}
                <section className={styles.calendarCard}>
                    <div className={styles.calendarHeader}>
                        <div>
                            <span className={styles.sectionEyebrow}>
                                AGENDA INSTITUCIONAL
                            </span>
                            <h2>Calendario</h2>
                        </div>

                        <div className={styles.calendarControls}>
                            <button
                                onClick={() => changeMonth(-1)}
                                aria-label="Mes anterior"
                            >
                                <ChevronLeft size={17} />
                            </button>

                            <button
                                onClick={() => changeMonth(1)}
                                aria-label="Mes siguiente"
                            >
                                <ChevronRight size={17} />
                            </button>
                        </div>
                    </div>

                    <div className={styles.monthLabel}>
                        {formatMonth(viewDate)}
                    </div>

                    <div className={styles.calendarGrid}>
                        {["L", "M", "M", "J", "V", "S", "D"].map(
                            (day, index) => (
                                <span
                                    key={index}
                                    className={styles.weekDay}
                                >
                                    {day}
                                </span>
                            )
                        )}

                        {calendarDays.map((day, index) => {
                            if (day === null) {
                                return (
                                    <span key={`empty-${index}`} />
                                );
                            }

                            const dateKey = getDateKey(
                                new Date(
                                    viewDate.getFullYear(),
                                    viewDate.getMonth(),
                                    day
                                )
                            );

                            const hasEvent = eventsByDate.has(dateKey);
                            const isSelected = selectedDate === dateKey;
                            const isToday = dateKey === getDateKey(today);

                            return (
                                <button
                                    key={dateKey}
                                    className={[
                                        styles.calendarDay,
                                        hasEvent ? styles.hasEvent : "",
                                        isSelected ? styles.selectedDay : "",
                                        isToday ? styles.today : "",
                                    ].join(" ")}
                                    onClick={() => setSelectedDate(dateKey)}
                                    aria-label={`Día ${day}${hasEvent ? ", tiene evento" : ""
                                        }`}
                                    aria-pressed={isSelected}
                                >
                                    {day}
                                    {hasEvent && (
                                        <span className={styles.eventDot} />
                                    )}
                                </button>
                            );
                        })}
                    </div>

                    <div className={styles.calendarLegend}>
                        <span>
                            <i />
                            Fecha importante
                        </span>
                    </div>

                    {/* Evento del día seleccionado */}
                    <div className={styles.selectedEvent}>
                        <div className={styles.eventDate}>
                            <CalendarDays size={16} />
                            <span>{selectedDateFormatted}</span>
                        </div>

                        {selectedEvent ? (
                            <div className={styles.eventContent}>
                                <span className={styles.eventType}>
                                    {selectedEvent.type === "deadline"
                                        ? "FECHA LÍMITE"
                                        : selectedEvent.type === "meeting"
                                            ? "REUNIÓN"
                                            : "IMPORTANTE"}
                                </span>

                                <h3>{selectedEvent.title}</h3>

                                <div>
                                    <Clock3 size={14} />
                                    {selectedEvent.time}
                                </div>

                                <div>
                                    <MapPin size={14} />
                                    {selectedEvent.location}
                                </div>
                            </div>
                        ) : (
                            <p className={styles.noEvent}>
                                No hay eventos institucionales programados
                                para esta fecha.
                            </p>
                        )}
                    </div>
                </section>


            </aside>
        </main>
    );
};
