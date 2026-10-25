
import styles from "./index.module.css";

interface FormInfoModalProps {
    isOpen: boolean;
    onClose: () => void;
}

const categories = [
    {
        number: "01",
        title: "Comunicación",
        description:
            "Evalúa las relaciones sociales e interpersonales entre estudiantes y docentes, favoreciendo una mayor interacción y la calidad del proceso educativo en la preparación profesional.",
    },
    {
        number: "02",
        title: "Motivación y compromiso",
        description:
            "Evalúa el impulso, la motivación y la dedicación que demuestra el profesor frente a sus tareas de docencia.",
    },
    {
        number: "03",
        title: "Orientación en el aprendizaje",
        description:
            "Evalúa las estrategias pedagógicas y didácticas que diseña e implementa el docente para promover la formación integral de los estudiantes.",
    },
    {
        number: "04",
        title: "Evaluación de los aprendizajes",
        description:
            "Evalúa las habilidades y capacidades del docente para planear y retroalimentar la evaluación de los aprendizajes mediante criterios e instrumentos claros.",
    },
];

const ratingScale = [
    { value: 1, label: "No cumple" },
    { value: 2, label: "Aspectos por mejorar" },
    { value: 3, label: "Bueno" },
    { value: 4, label: "Excelente" },
];

export default function FormInfoModal({
    isOpen,
    onClose,
}: FormInfoModalProps) {
    if (!isOpen) return null;

    return (
        <div
            className={styles.overlay}
            onClick={onClose}
        >
            <section
                className={styles.modal}
                role="dialog"
                aria-modal="true"
                aria-labelledby="form-info-title"
                onClick={(event) => event.stopPropagation()}
            >
                <header className={styles.header}>
                    

                    <div className={styles.headerText}>
                        <span className={styles.eyebrow}>
                            GUÍA DE LA ENCUESTA
                        </span>

                        <h2 id="form-info-title">
                            Información general - Encuesta de percepción estudiantil
                        </h2>

                        <p>
                            Conoce el propósito y las indicaciones
                            antes de evaluar a tus docentes.
                        </p>
                    </div>

                    <button
                        type="button"
                        className={styles.closeButton}
                        onClick={onClose}
                        aria-label="Cerrar información"
                    >
                        ×
                    </button>
                </header>

                <div className={styles.content}>
                    

                    <section className={styles.section}>
                        <h3 className={styles.sectionTitle}>
                            Objetivo
                        </h3>

                        <p>
                            Evaluar el desempeño del docente de cátedra
                            a partir de la percepción del estudiante, con
                            el fin de propender por el mejoramiento permanente
                            de la calidad de la docencia, contribuyendo a la
                            toma de decisiones para el fortalecimiento de la
                            excelencia académica como razón de ser de la
                            Universidad.
                        </p>
                    </section>

                    <section className={styles.section}>
                        <h3 className={styles.sectionTitle}>
                            ¿Qué representa esta evaluación para ti?
                        </h3>

                        <ul className={styles.benefitsList}>
                            <li>
                                Una oportunidad para pensar y reflexionar
                                sobre el proceso de enseñanza-aprendizaje.
                            </li>

                            <li>
                                Un espacio para participar de manera objetiva
                                y responsable en tu propio proceso de formación.
                            </li>

                            <li>
                                Una oportunidad para comprender cómo tu
                                participación y expresión objetiva afianzan
                                los valores democráticos y el compromiso
                                con la calidad.
                            </li>
                        </ul>
                    </section>

                    <section className={styles.section}>
                        <h3 className={styles.sectionTitle}>
                            Instrucciones importantes
                        </h3>

                        <ul className={styles.instructionsList}>
                            <li>
                                <strong>Compromiso y sinceridad.</strong>{" "}
                                Diligencia la encuesta con responsabilidad.
                                Tu sinceridad contribuye al mejoramiento
                                de la calidad de tu formación.
                            </li>

                            <li>
                                <strong>Aplicación.</strong>{" "}
                                Esta evaluación se aplica a partir de la
                                semana doce (12) del período académico.
                            </li>

                            <li>
                                <strong>Anonimato.</strong>{" "}
                                Se garantiza el carácter anónimo de esta
                                evaluación.
                            </li>
                        </ul>
                    </section>

                    <section className={styles.section}>
                        <h3 className={styles.sectionTitle}>
                            Escala de valoración
                        </h3>

                        <p className={styles.sectionDescription}>
                            Selecciona la opción que mejor represente
                            tu percepción sobre el desempeño del docente.
                        </p>

                        <div className={styles.ratingList}>
                            {ratingScale.map((rating) => (
                                <div
                                    key={rating.value}
                                    className={styles.ratingItem}
                                >
                                    <span className={styles.ratingNumber}>
                                        {rating.value}
                                    </span>

                                    <span className={styles.ratingLabel}>
                                        {rating.label}
                                    </span>
                                </div>
                            ))}
                        </div>
                    </section>

                    <section className={styles.section}>
                        <h3 className={styles.sectionTitle}>
                            ¿Qué aspectos se evalúan?
                        </h3>

                        <p className={styles.sectionDescription}>
                            La encuesta contempla cuatro categorías
                            fundamentales del desempeño docente.
                        </p>

                        <div className={styles.categoriesList}>
                            {categories.map((category) => (
                                <article
                                    key={category.number}
                                    className={styles.categoryCard}
                                >
                                    <span className={styles.categoryNumber}>
                                        {category.number}
                                    </span>

                                    <div>
                                        <h4>{category.title}</h4>
                                        <p>{category.description}</p>
                                    </div>
                                </article>
                            ))}
                        </div>
                    </section>

                    
                </div>

                <footer className={styles.footer}>
                    <button
                        type="button"
                        className={styles.confirmButton}
                        onClick={onClose}
                    >
                        Entendido, continuar
                    </button>
                </footer>
            </section>
        </div>
    );
}
