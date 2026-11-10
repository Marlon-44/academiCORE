import { BarChart3, ClipboardList, ListChecks, PieChart as PieIcon, TrendingUp } from "lucide-react";
import type { Vista } from "../../types";
import styles from "../../index.module.css";

const VISTAS: { id: Vista; label: string; icon: typeof BarChart3 }[] = [
    { id: "docente", label: "Panorama del docente", icon: TrendingUp },
    { id: "evaluacion", label: "Por evaluación", icon: PieIcon },
    { id: "encuesta", label: "Encuesta individual", icon: ClipboardList },
    { id: "instrumento", label: "Instrumento", icon: ListChecks },
];

interface Props {
    vista: Vista;
    onChange: (vista: Vista) => void;
}

export function DashboardTabs({ vista, onChange }: Props) {
    return (
        <nav className={styles.tabs} role="tablist" aria-label="Vistas de gráficas">
            {VISTAS.map(({ id, label, icon: Icon }) => (
                <button
                    key={id}
                    type="button"
                    role="tab"
                    aria-selected={vista === id}
                    className={`${styles.tab} ${vista === id ? styles.tabActive : ""}`}
                    onClick={() => onChange(id)}
                >
                    <Icon size={16} />
                    {label}
                </button>
            ))}
        </nav>
    );
}
