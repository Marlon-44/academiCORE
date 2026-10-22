import { useState } from "react";
import styles from "./index.module.css";

interface Guia {
    titulo: string;
    descripcion: string;
    enlace: string;
}

const guias: Guia[] = [
    {
        titulo: "Guía para pagos en línea",
        descripcion:
            "Conoce el proceso para realizar pagos en línea de manera sencilla y segura si eres estudiante o aspirante facturado.",
        enlace: "https://drive.google.com/file/d/1E-_VndJqPCktrjE937WXYuzmkO3ZBVyc/view?usp=sharing",
    },
    {
        titulo: "Manual de inscripciones para aspirantes",
        descripcion:
            "Consulta el paso a paso para realizar correctamente tu proceso de inscripción como aspirante a la Universidad de Cartagena.",
        enlace: "https://drive.google.com/file/d/1E-_VndJqPCktrjE937WXYuzmkO3ZBVyc/view?usp=sharing",
    },
    {
        titulo: "Guía de solicitud de certificados",
        descripcion:
            "Encuentra las instrucciones necesarias para solicitar y gestionar tus certificados académicos.",
        enlace: "https://drive.google.com/file/d/1E-_VndJqPCktrjE937WXYuzmkO3ZBVyc/view?usp=sharing",
    },
    {
        titulo: "Guía de impresión de credenciales",
        descripcion:
            "Conoce el procedimiento para consultar e imprimir tus credenciales institucionales.",
        enlace: "https://drive.google.com/file/d/1E-_VndJqPCktrjE937WXYuzmkO3ZBVyc/view?usp=sharing",
    },
    {
        titulo: "Guía de inscripciones de posgrado",
        descripcion:
            "Consulta el proceso y las recomendaciones para realizar tu inscripción a los programas de posgrado.",
        enlace: "https://drive.google.com/file/d/1E-_VndJqPCktrjE937WXYuzmkO3ZBVyc/view?usp=sharing",
    },
    {
        titulo: "Guía de matrículas",
        descripcion:
            "Encuentra información sobre el proceso de matrícula y los pasos que debes seguir para formalizarla.",
        enlace: "https://drive.google.com/file/d/1E-_VndJqPCktrjE937WXYuzmkO3ZBVyc/view?usp=sharing",
    },
    {
        titulo: "Guía para restablecer contraseñas",
        descripcion:
            "Aprende cómo recuperar o restablecer tu contraseña para acceder a los servicios institucionales.",
        enlace: "https://drive.google.com/file/d/1E-_VndJqPCktrjE937WXYuzmkO3ZBVyc/view?usp=sharing",
    },
];

export const GuiasSection = () => {
    const [activeIndex, setActiveIndex] = useState<number | null>(null);

    const toggleGuia = (index: number) => {
        setActiveIndex((current) =>
            current === index ? null : index
        );
    };

    return (
        <section className={styles.guiasSection}>
            <div className={styles.container}>

                <div className={styles.intro}>
                    <span className={styles.eyebrow}>
                        RECURSOS
                    </span>

                    <h2>
                        Guías y manuales
                    </h2>

                    <p>
                        Encuentra información y recursos que te
                        ayudarán a realizar tus procesos académicos
                        de manera sencilla.
                    </p>
                </div>

                <div className={styles.accordion}>
                    {guias.map((guia, index) => {
                        const isActive = activeIndex === index;

                        return (
                            <article
                                key={guia.titulo}
                                className={`${styles.item} ${
                                    isActive ? styles.active : ""
                                }`}
                            >
                                <button
                                    type="button"
                                    className={styles.question}
                                    onClick={() => toggleGuia(index)}
                                    aria-expanded={isActive}
                                >
                                    <span>{guia.titulo}</span>

                                    <span className={styles.icon}>
                                        {isActive ? "−" : "+"}
                                    </span>
                                </button>

                                <div
                                    className={`${styles.answer} ${
                                        isActive
                                            ? styles.answerOpen
                                            : ""
                                    }`}
                                >
                                    <div className={styles.answerContent}>
                                        <p>
                                            {guia.descripcion}
                                        </p>

                                        <a
                                            href={guia.enlace}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            className={styles.link}
                                        >
                                            Consultar guía
                                            <span>→</span>
                                        </a>
                                    </div>
                                </div>
                            </article>
                        );
                    })}
                </div>

            </div>
        </section>
    );
};