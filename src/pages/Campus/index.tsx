
import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import styles from "./index.module.css";
import { fetchCampus, fetchPortadaCampus, type CampusDTO } from "../../services/campusApi";

interface CampusCard {
    id: number;
    name: string;
    description: string;
    image?: string;
    address?: string;
    link?: string;
}

const centrosTutoriales = [
    { name: "El Carmen de Bolívar", description: "Centro Tutorial de la Universidad de Cartagena." },
    { name: "Magangué", description: "Campus Montecarlos y Campus Camilo Torres." },
    { name: "Cereté", description: "Centro Tutorial de la Universidad de Cartagena." },
    { name: "Lorica", description: "Centro Tutorial de la Universidad de Cartagena." },
    { name: "San Juan Nepomuceno", description: "Centro Tutorial de la Universidad de Cartagena." },
    { name: "Santa Cruz de Mompós", description: "Centro Tutorial de la Universidad de Cartagena." },
];

export const CampusSection = () => {
    const [campusList, setCampusList] = useState<CampusCard[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const loadCampus = async () => {
            try {
                const campus: CampusDTO[] = await fetchCampus();
                const sorted = [...campus].sort((a, b) => a.orden - b.orden);

                const cards = await Promise.all(
                    sorted.map(async (c) => {
                        const portadaUrl = await fetchPortadaCampus(c.id);
                        return {
                            id: c.id,
                            name: c.nombre,
                            description: c.descripcion,
                            image: portadaUrl ?? undefined,
                            address: c.direccion,
                            link: c.urlMapa,
                        } as CampusCard;
                    })
                );
                setCampusList(cards);
            } catch (err) {
                console.error("Error cargando campus:", err);
            } finally {
                setLoading(false);
            }
        };
        loadCampus();
    }, []);

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

                {loading ? (
                    <p style={{ textAlign: "center", padding: "60px 0", color: "#888" }}>
                        Cargando campus...
                    </p>
                ) : (
                <div className={styles.campusGrid}>
                    {campusList.map((campus, index) => (
                        <a
                            key={campus.id}
                            href={campus.link}
                            target="_blank"
                            rel="noreferrer"
                            className={`${styles.campusCard} ${index === campusList.length - 1 ? styles.featured : ''}`}
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
                )}

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

