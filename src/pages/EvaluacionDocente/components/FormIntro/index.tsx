import { useState } from "react";
import styles from "./index.module.css";
import FormInfoModal from "../FormInfoModal";

export const FormIntro = () => {
    const [showInfo, setShowInfo] = useState(false);


    return (
        <section className={styles.formIntro}>
            <h2>Escala de calificacion de experiencia</h2>
            <p>
                Responde todas las preguntas según tu experiencia
                durante el período académico. No hay respuestas
                correctas o incorrectas.
            </p>
            <div className={styles.scaleLegend}>
                <span>1 · No cumple</span>
                <span>2 · Aspectos por mejorar</span>
                <span>3 · Bueno</span>
                <span>4 · Excelente</span>
            </div>
            <button
                type="button"
                onClick={() => setShowInfo(true)}
                className={styles.moreInfoBtn}
            >
                Más información
            </button>
            <FormInfoModal isOpen={showInfo}
                onClose={() => setShowInfo(false)} />
        </section>


    )
}