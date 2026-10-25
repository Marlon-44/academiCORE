
import styles from "./index.module.css";
import type { EvaluacionEstudianteDTO } from "../../../../services/evaluacionDocenteApi";
import { formatName } from "../../../../services/textFormat";

type IconName = "check" | "clock" | "book" | "arrow";

interface IconProps {
    name: IconName;
    size?: number;
}

interface EvaluationCardProps {
    evaluacion: EvaluacionEstudianteDTO;
    onEvaluate: (evaluacion: EvaluacionEstudianteDTO) => void;
}

function Icon({ name, size = 20 }: IconProps) {
    const commonProps = {
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
        case "check":
            return (
                <svg {...commonProps}>
                    <path d="m5 12 4 4L19 6" />
                </svg>
            );

        case "clock":
            return (
                <svg {...commonProps}>
                    <circle cx="12" cy="12" r="9" />
                    <path d="M12 7v5l3 2" />
                </svg>
            );

        case "book":
            return (
                <svg {...commonProps}>
                    <path d="M4 5.5A2.5 2.5 0 0 1 6.5 3H20v16H6.5A2.5 2.5 0 0 0 4 21.5z" />
                    <path d="M4 5.5v16M8 7h8M8 11h7" />
                </svg>
            );

        case "arrow":
            return (
                <svg {...commonProps}>
                    <path d="M5 12h14M13 6l6 6-6 6" />
                </svg>
            );

        default:
            return null;
    }
}

export const EvaluationCard = ({
    evaluacion,
    onEvaluate,
}: EvaluationCardProps) => {
    const isCompleted = evaluacion.contestada;
    const initials = evaluacion.docenteNombre
        .split(" ")
        .filter((part) => part.length > 0)
        .slice(0, 2)
        .map((part) => part[0])
        .join("")
        .toLocaleUpperCase("es");

    return (
        <article
            className={`${styles.teacherCard} ${isCompleted ? styles.completedCard : ""
                }`}
        >
            <div className={styles.cardTop}>
                <div className={styles.teacherAvatar}>{initials}</div>

                <span
                    className={`${styles.statusBadge} ${isCompleted
                        ? styles.statusCompleted
                        : styles.statusPending
                        }`}
                >
                    <Icon name={isCompleted ? "check" : "clock"} size={14} />
                    {isCompleted ? "Completada" : "Pendiente"}
                </span>
            </div>

            <div className={styles.teacherInfo}>
                <h3>{formatName(evaluacion?.docenteNombre ?? "") }</h3>

                <div className={styles.subject}>

                    <span>{evaluacion.asignaturaNombre}</span>
                </div>

                <p className={styles.program}>{formatName(evaluacion?.programaNombre ?? "") }</p>
            </div>

            <div className={styles.cardFooter}>
                <span className={styles.groupLabel}>
                    Grupo {evaluacion.grupo} · Periodo {evaluacion.periodo}
                </span>

                <button
                    type="button"
                    className={`${styles.cardAction} ${isCompleted ? styles.cardActionCompleted : ""
                        }`}
                    onClick={() => onEvaluate(evaluacion)}
                    disabled={isCompleted}
                >
                    {isCompleted ? "Evaluación enviada" : "Evaluar docente"}

                    {!isCompleted && <Icon name="arrow" size={17} />}
                </button>
            </div>
        </article>
    );
};
