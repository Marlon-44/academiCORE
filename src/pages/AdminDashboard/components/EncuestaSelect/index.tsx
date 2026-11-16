import type { EncuestaDTO } from "../../../../services/evaluacionDocenteApi";
import styles from "../../index.module.css";

interface Props {
    encuestas: EncuestaDTO[];
    value: number | null;
    onChange: (id: number) => void;
}

export function EncuestaSelect({ encuestas, value, onChange }: Props) {
    return (
        <label className={styles.selectBox}>
            <span>Encuesta</span>
            <select
                value={value ?? ""}
                onChange={(e) => onChange(Number(e.target.value))}
                disabled={encuestas.length === 0}
            >
                {encuestas.length === 0 && <option>Sin encuestas respondidas</option>}
                {encuestas.map((enc) => (
                    <option key={enc.id} value={enc.id}>
                        #{enc.id}
                        {enc.estudianteNombre ? ` · ${enc.estudianteNombre}` : ""} ·{" "}
                        {enc.promedio.toFixed(2)} ({enc.valoracion})
                    </option>
                ))}
            </select>
        </label>
    );
}
