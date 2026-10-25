import type { EvaluacionEstudianteDTO } from "../../../../services/evaluacionDocenteApi";
import { formatName } from "../../../../services/textFormat";
import styles from "./index.module.css"

interface EvaluationProps {
    evaluacion: EvaluacionEstudianteDTO;

}

export const Banner = ({ evaluacion}: EvaluationProps ) => {
    return (
        <section className={styles.teacherSummary}>
            <div className={styles.teacherAvatar} aria-hidden="true">
                {evaluacion.docenteNombre.charAt(0)}
            </div>

            <div className={styles.teacherInfo}>
                {/*<span className={styles.eyebrow}>
                    DOCENTE A EVALUAR
                </span>*/}
                
                <h2>{formatName(evaluacion?.docenteNombre ?? "")}</h2>
                <p>
                    {evaluacion.asignaturaCodigo} ·{" "}
                    {evaluacion.asignaturaNombre}
                </p>

                <div className={styles.metadata}>
                    <span>Grupo {evaluacion.grupo}</span>
                    <span>Período {evaluacion.periodo}</span>
                    <span>{formatName(evaluacion?.programaNombre ?? "")}</span>
                </div>
            </div>
            <img className={styles.logo} src="/assets/logoWhiteUDC.png" alt="" />
        </section>
    )
}