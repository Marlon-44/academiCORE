import type { EvaluacionDTO } from "../../../../services/evaluacionDocenteApi";
import styles from "../../index.module.css";

interface Props {
    evaluaciones: EvaluacionDTO[];
    value: number | null;
    onChange: (id: number) => void;
}

export function EvaluacionSelect({ evaluaciones, value, onChange }: Props) {
    return (
        <label className={styles.selectBox}>
            <span>Evaluación</span>
            <select
                value={value ?? ""}
                onChange={(e) => onChange(Number(e.target.value))}
                disabled={evaluaciones.length === 0}
            >
                {evaluaciones.length === 0 && <option>Sin evaluaciones para este docente</option>}
                {evaluaciones.map((ev) => (
                    <option key={ev.id} value={ev.id}>
                        {ev.asignaturaNombre ?? `Asignatura ${ev.asignaturaId}`} · Grupo {ev.grupo} ·{" "}
                        {ev.periodo}
                    </option>
                ))}
            </select>
        </label>
    );
}
