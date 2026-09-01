import { Link } from "react-router-dom"
import styles from "./index.module.css"
import { useState } from "react"

export const Header = () => {


    const [menuOpen, setMenuOpen] = useState(false)
    return (
        <header className={`${styles.header} ${menuOpen ? styles.grow : ""}`}>
            
            <div className={styles.logoSection}>
                <Link to="/" className={styles.imageContainer}>
                    <img src="/assets/logoUDC_normal.png" alt="Logo UDC" />
                </Link>
                {/*<div className={`${styles.logoDescription} ${menuOpen ? styles.hidden : ""}`}>
                    <h1>AcademiCORE</h1>
                    <p>Sistema de información académica</p>
                </div>*/}
                
            </div>


            <nav>
                <ul className={`${styles.headerList} ${menuOpen ? styles.open : ""} `}>
                    <li>
                        <Link to="/convocatorias" className={styles.headerLink}>
                            Convocatorias
                        </Link>
                    </li>

                    <li>
                        <Link to="/inscripciones" className={styles.headerLink}>
                            Inscripciones
                        </Link>
                    </li>

                    <li>
                        <Link to="/admisiones" className={styles.headerLink}>
                            Admisiones
                        </Link>
                    </li>
                    <li>
                        <Link to="/admisiones" className={styles.headerLink}>
                            Resultados
                        </Link>
                    </li>

                    <li >
                        <Link to="/ayuda" className={`${styles.headerLink} `} >

                            <span>Plataforma Académica</span>
                            
                        </Link>
                    </li>
                    <li>
                        <Link className={`${styles.loginButton2}`} to="/iniciarSesion" >

                            <img src="" alt="" />
                            <span>Iniciar sesión</span>
                        </Link>
                    </li>
                </ul>
            </nav>

            <Link className={`${styles.loginButton}`} to="/iniciarSesion">
                <span>Iniciar sesión</span>
                <div className={styles.arrowContainer}>
                    <img src="/assets/arrow.png" alt="" />
                </div>
            </Link>
            <button
                className={`${styles.menuButton} ${menuOpen ? styles.active : ""}`}
                onClick={() => setMenuOpen(!menuOpen)}
            >
                <span></span>
                <span></span>
            </button>

        </header>
    )
}