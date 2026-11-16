import { GraduationCap } from "lucide-react";
import type { DocenteDTO } from "../../../../services/evaluacionDocenteApi";
import styles from "../../index.module.css";

interface Props {
    docentes: DocenteDTO[];
    docenteId: number | null;
    onDocenteChange: (id: number) => void;
}

export function DashboardHero({ docentes, docenteId, onDocenteChange }: Props) {
    return (
        <section className={styles.hero}>
            <div>
                <span className={styles.heroKicker}>
                    <GraduationCap size={16} /> Resultados de evaluación docente
                </span>
                <h1>Panel de indicadores</h1>
                <p>
                    Promedios por categoría, distribución de valoraciones, sentimiento de los
                    comentarios y evolución por periodo.
                </p>
            </div>
            <label className={styles.docentePicker}>
                <span>Docente</span>
                <select
                    value={docenteId ?? ""}
                    onChange={(e) => onDocenteChange(Number(e.target.value))}
                    disabled={docentes.length === 0}
                >
                    {docentes.length === 0 && <option>Sin docentes</option>}
                    {docentes.map((d) => (
                        <option key={d.id} value={d.id}>
                            {d.nombreCompleto}
                        </option>
                    ))}
                </select>
            </label>
        </section>
    );
}
