import { Link } from "react-router-dom"
import styles from "./index.module.css"
import { useState } from "react"
import { LoginDropdown } from "../LoginDropdown";

export const Header = () => {

    const [isLoginOpen, setIsLoginOpen] = useState(false);
    const [menuOpen, setMenuOpen] = useState(false)
    const openLogin = () => { setIsLoginOpen(true); }; const closeLogin = () => { setIsLoginOpen(false); };
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
                        <Link to="/" onClick={openLogin}  className={styles.headerLink} >

                            <span>Plataforma Académica</span>

                        </Link>
                    </li>
                    <li>
                        <button type="button" onClick={openLogin} className={`${styles.loginButton2}`} aria-expanded={isLoginOpen} aria-haspopup="dialog">
                            <img src="" alt="" />
                            <span>Iniciar sesión</span>
                        </button>
                    </li>
                </ul>
            </nav>

            <div className={styles.loginWrapper}>
                <button type="button" onClick={openLogin} className={`${styles.loginButton}`} aria-expanded={isLoginOpen} aria-haspopup="dialog">

                    <span>Iniciar sesión</span>

                    <div className={styles.arrowContainer}>
                        <img src="/assets/arrow.png" alt="" />
                    </div>

                </button>
                <LoginDropdown isOpen={isLoginOpen} onClose={closeLogin} />
            </div>


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