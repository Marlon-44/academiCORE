
import { Link } from "react-router-dom";
import styles from "./index.module.css";

export const Footer = () => {
    return (
        <footer className={styles.footer}>
            <div className={styles.footerGlow} />

            <div className={styles.footerContainer}>
                {/* ───────────── TOP ───────────── */}
                <div className={styles.footerTop}>
                    <div className={styles.brand}>
                        <img
                            src="/assets/logoWhiteUDC.png"
                            alt="Universidad de Cartagena"
                            className={styles.footerLogo}
                        />

                        
                        <span className={styles.established}>
                            FUNDADA EN 1827
                        </span>
                    </div>

                    {/* ───────────── NAVEGACIÓN ───────────── */}
                    <div className={styles.footerColumn}>
                        <h3>Universidad</h3>

                        <ul>
                            <li>
                                <Link to="/">Inicio</Link>
                            </li>
                            <li>
                                <Link to="/convocatorias">
                                    Convocatorias
                                </Link>
                            </li>
                            <li>
                                <Link to="/campus">Nuestros campus</Link>
                            </li>
                            <li>
                                <Link to="/resultados">Resultados</Link>
                            </li>
                        </ul>
                    </div>

                    <div className={styles.footerColumn}>
                        <h3>Comunidad</h3>

                        <ul>
                            <li>
                                <Link to="/estudiantes">
                                    Estudiantes
                                </Link>
                            </li>
                            <li>
                                <Link to="/egresados">
                                    Egresados
                                </Link>
                            </li>
                            <li>
                                <Link to="/docentes">
                                    Docentes
                                </Link>
                            </li>
                            <li>
                                <Link to="/credenciales">
                                    Credenciales
                                </Link>
                            </li>
                        </ul>
                    </div>

                    {/* ───────────── CONTACTO ───────────── */}
                    <div className={styles.footerColumn}>
                        <h3>Contacto</h3>

                        <div className={styles.contact}>
                            <p>
                                Centro Histórico
                                <br />
                                Cartagena de Indias, Colombia
                            </p>
                        </div>

                        <div className={styles.contact}>
                            <span>✉</span>
                            <a href="mailto:atencionalciudadano@unicartagena.edu.co">
                                Escríbenos
                            </a>
                        </div>

                        <Link
                            to="/soporte"
                            className={styles.supportLink}
                        >
                            Soporte técnico <span>↗</span>
                        </Link>
                    </div>
                </div>

                {/* ───────────── SOCIAL ───────────── */}
                <div className={styles.socialSection}>
                    <div>
                        <span className={styles.socialEyebrow}>
                            CONECTA CON NOSOTROS
                        </span>

                        <p>
                            Síguenos y mantente al día con nuestra comunidad.
                        </p>
                    </div>

                    <div className={styles.socialLinks}>
                        <a
                            href="#"
                            target="_blank"
                            rel="noreferrer"
                            aria-label="Facebook"
                        >
                            <span>f</span>
                        </a>

                        <a
                            href="#"
                            target="_blank"
                            rel="noreferrer"
                            aria-label="Instagram"
                        >
                            <span>◎</span>
                        </a>

                        <a
                            href="mailto:atencionalciudadano@unicartagena.edu.co"
                            aria-label="Correo electrónico"
                        >
                            <span>✉</span>
                        </a>
                    </div>
                </div>

                {/* ───────────── BOTTOM ───────────── */}
                <div className={styles.footerBottom}>
                    <span>
                        © {new Date().getFullYear()} Universidad de Cartagena
                    </span>

                    <div className={styles.bottomLinks}>
                        <Link to="/politica-privacidad">
                            Política de privacidad
                        </Link>

                        <Link to="/terminos">
                            Términos y condiciones
                        </Link>

                        <Link to="/accesibilidad">
                            Accesibilidad
                        </Link>
                    </div>

                    <span className={styles.madeWith}>
                        Cartagena de Indias · Colombia
                    </span>
                </div>
            </div>
        </footer>
    );
};

