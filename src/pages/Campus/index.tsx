
import { Link } from "react-router-dom";
import styles from "./index.module.css";

interface Campus {
    name: string;
    description: string;
    image?: string;
    address?: string;
    link?: string;
    type: "campus" | "tutorial";
}
const campusPrincipales: Campus[] = [
    {
        name: "Claustro de San Agustín",
        description:
            "Sede principal de la Universidad de Cartagena y espacio académico para programas de Ciencias Humanas y Sociales.",
        address: "Carrera 6 #36-100, Centro",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn-MFM6blvtO0RdYES1n3lcrnoKs9SF4TUB3vxdq7yb3iVuNwP1alR05I&s=10",
        type: "campus",
        link: "http://localizacion.unicartagena.edu.co/",
    },
    {
        name: "Piedra de Bolívar",
        description:
            "Campus que alberga programas administrativos, ingenierías y diferentes facultades de la Universidad.",
        address: " #Calle 30 No. 48 152",
        image: "https://unicartagena.edu.co/images/landings/aspirantes/galeria-aspirantes/Campus-Piedra-de-Bolivar.jpg",
        type: "campus",
        link: "http://localizacion.unicartagena.edu.co/",
    },
    {
        name: "Campus de San Pablo",
        description:
            "Espacio para programas como Química, Física, Biología y Matemáticas, con laboratorios y áreas de investigación.",
        address: "Carrera 50 #24-120, Zaragocilla",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ35EEImhzKOZljsOZbSMKFb2ooFI1zmXNG7tnga0tbBkV716lVQov3WYs&s=10",
        type: "campus",
        link: "http://localizacion.unicartagena.edu.co/",
    },
    {
        name: "Zaragocilla - Campus de la Salud",
        description:
            "Campus especializado para la formación en el área de la salud, con espacios médicos y laboratorios.",
        address: "Campus de la Salud, Zaragocilla",
        image: "https://eventario.co/wp-content/uploads/2026/04/universidad-de-cartagena-campus-de-zaragocilla-1-768x512.jpg",
        type: "campus",
        link: "http://localizacion.unicartagena.edu.co/",
    },
    {
        name: "Claustro de La Merced",
        description: "Espacio histórico ubicado en el Centro, donde funcionan unidades administrativas y programas de posgrado.",
        address: "Carrera 4 #38-40, Centro",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfZj_5mVhOYm915Ve6eRqQOZ_lkIKXQtFt-TvAPhDl46YwYGUNm9qPqB1v&s=10",
        type: "campus",
        link: "http://localizacion.unicartagena.edu.co/",
    },
];
const centrosTutoriales: Campus[] = [
    {
        name: "El Carmen de Bolívar",
        description: "Centro Tutorial de la Universidad de Cartagena.",
        type: "tutorial",
    },
    {
        name: "Magangué",
        description: "Campus Montecarlos y Campus Camilo Torres.",
        type: "tutorial",
    },
    {
        name: "Cereté",
        description: "Centro Tutorial de la Universidad de Cartagena.",
        type: "tutorial",
    },
    {
        name: "Lorica",
        description: "Centro Tutorial de la Universidad de Cartagena.",
        type: "tutorial",
    },
    {
        name: "San Juan Nepomuceno",
        description: "Centro Tutorial de la Universidad de Cartagena.",
        type: "tutorial",
    },
    {
        name: "Santa Cruz de Mompós",
        description: "Centro Tutorial de la Universidad de Cartagena.",
        type: "tutorial",
    },
];

export const CampusSection = () => {
    return (
        <section className={styles.campusSection} id="campus">
            <div className={styles.container}>
                <div className={styles.header}>
                    <span className={styles.eyebrow}>UNIVERSIDAD DE CARTAGENA</span>

                    <h2>
                        Nuestros <span>Campus</span>
                    </h2>

                    <p>
                        Espacios que conectan la historia, el conocimiento y la
                        comunidad universitaria a lo largo de Cartagena y Bolívar.
                    </p>
                </div>

                <div className={styles.campusGrid}>
                    {campusPrincipales.map((campus, index) => (
                        <a
                            key={campus.name}
                            href={campus.link}
                            target="_blank"
                            rel="noreferrer"
                            className={`${styles.campusCard} ${index == 4 ? styles.featured : ''}`}
                        >
                            <div className={styles.imageWrapper}>
                                {campus.image && (
                                    <img
                                        src={campus.image}
                                        alt={campus.name}
                                        className={styles.image}
                                    />
                                )}

                                <div className={styles.overlay} />

                                <span className={styles.number}>
                                    {String(index + 1).padStart(2, "0")}
                                </span>

                                <span className={styles.locationIcon}>
                                    ↗
                                </span>
                            </div>

                            <div className={styles.cardContent}>
                                <span className={styles.cardType}>
                                    CAMPUS
                                </span>

                                <h3>{campus.name}</h3>

                                <p>{campus.description}</p>

                                {campus.address && (
                                    <span className={styles.address}>
                                        {campus.address}
                                    </span>
                                )}

                                <span className={styles.explore}>
                                    Explorar campus <span>→</span>
                                </span>
                            </div>
                        </a>
                    ))}
                </div>

                <div className={styles.tutorialSection}>
                    <div className={styles.tutorialHeader}>
                        <div>
                            <span className={styles.eyebrow}>
                                EDUCACIÓN A DISTANCIA
                            </span>

                            <h3>Centros Tutoriales</h3>
                        </div>

                        <p>
                            Nuestra universidad también llega a diferentes
                            municipios del departamento de Bolívar y la región.
                        </p>
                    </div>

                    <div className={styles.tutorialGrid}>
                        {centrosTutoriales.map((centro, index) => (
                            <Link
                                to="#"
                                key={centro.name}
                                className={styles.tutorialCard}
                            >
                                <span className={styles.tutorialNumber}>
                                    {String(index + 1).padStart(2, "0")}
                                </span>

                                <div>
                                    <h4>{centro.name}</h4>
                                    <p>{centro.description}</p>
                                </div>

                                <span className={styles.arrow}>↗</span>
                            </Link>
                        ))}
                    </div>
                </div>
            </div>
        </section>
    );
};

