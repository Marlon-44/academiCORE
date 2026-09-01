import { Link } from "react-router-dom";
import styles from "./index.module.css";

interface Anuncio {
    categoria: string;
    titulo: string;
    descripcion: string;
    imagen: string;
}

const anuncios: Anuncio[] = [
    {
        categoria: "Destacado",
        titulo: "Resultados de inscripción disponibles",
        descripcion:
            "Consulta los resultados del proceso de inscripción y conoce los próximos pasos.",
        imagen:
            "https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=900&q=80",
    },
    {
        categoria: "Convocatorias",
        titulo: "Nuevas convocatorias abiertas",
        descripcion:
            "Conoce las oportunidades disponibles y participa en las convocatorias de nuestra universidad.",
        imagen:
            "https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=700&q=80",
    },
    {
        categoria: "Comunidad",
        titulo: "Logros que nos llenan de orgullo",
        descripcion:
            "Celebramos los logros y reconocimientos de nuestra comunidad universitaria.",
        imagen:
            "https://i.pinimg.com/736x/3d/dc/0b/3ddc0b2e8b4a106f98a0f38a5436a735.jpg",
    },
    {
        categoria: "Eventos",
        titulo: "Próximos eventos universitarios",
        descripcion:
            "Entérate de las actividades y eventos que tenemos preparados para nuestra comunidad.",
        imagen:
            "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?auto=format&fit=crop&w=700&q=80",
    },
];

const colors =["var(--uc-teal)", "var(--uc-blue-dark)", "var(--uc-red)"];
export const AnunciosSection = () => {
    const anuncioPrincipal = anuncios[0];
    const anunciosSecundarios = anuncios.slice(1);

    return (
        <section className={styles.anunciosSection}>
            <div className={styles.container}>
                {/* Encabezado */}
                <div className={styles.header}>
                    <div>
                        <span className={styles.eyebrow}>ACTUALIDAD</span>

                        <h2>Novedades de nuestra comunidad universitaria</h2>

                        <p>
                            Mantente al día con las novedades y oportunidades de nuestra
                            comunidad.
                        </p>
                    </div>

                    <button className={styles.viewAll}>
                        Ver todas
                        <span>→</span>
                    </button>
                </div>

                {/* Anuncio principal */}
                <article className={`${styles.card} ${styles.featuredCard}`}>
                    <div className={styles.featuredImage}>
                        <img
                            src={anuncioPrincipal.imagen}
                            alt={anuncioPrincipal.titulo}
                        />
                    </div>

                    <div className={styles.featuredContent}>
                        <span className={styles.category}>
                            {anuncioPrincipal.categoria}
                        </span>

                        <h3>{anuncioPrincipal.titulo}</h3>

                        <p>{anuncioPrincipal.descripcion}</p>

                        <Link to="#" className={styles.readMore}>
                            Ver anuncio <span>→</span>
                        </Link>
                    </div>
                </article>

                {/* Anuncios secundarios */}
                <div className={styles.grid}>
                    {anunciosSecundarios.map((anuncio, index) => (
                        <article className={`${styles.card} ${styles.smallCard}`} key={anuncio.titulo} style={{background: colors[index % colors.length]}}>
                            <div className={styles.smallImage}>
                                <img src={anuncio.imagen} alt={anuncio.titulo} />
                            </div>

                            <div className={styles.smallContent}>
                                <span className={styles.category}>
                                    {anuncio.categoria}
                                </span>

                                <h3>{anuncio.titulo}</h3>

                                <p>{anuncio.descripcion}</p>

                                <a href="#" className={styles.readMore}>
                                    Ver más <span>→</span>
                                </a>
                            </div>
                        </article>
                    ))}
                </div>
            </div>
        </section>
    );
};