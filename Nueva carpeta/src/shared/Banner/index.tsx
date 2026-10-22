import { Link } from "react-router-dom"
import styles from "./index.module.css"

import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';

export const Banner = () => {
    return (
        <div className={styles.bannerContainer}>
            <div className={styles.content}>
                    <h3>BIENVENIDO A</h3>
                    <h1>Academi<span>CORE</span> </h1>
                    <p className={styles.description}>Plataforma de servicios academicos para inscripciones, consultas, pagos y gestión estudiantil.</p>
                    <Link to="/login" className={styles.loginButton}>
                        <img src="/assets/user.png" alt="Icono de usuario" />
                        <p>Iniciar sesión</p>
                        <img src="/assets/arrow.png" alt="Icono de flecha" />
                    </Link>
                    <Link to="/" className={styles.passwordHelp}>
                    <p>
                        ¿Olvidaste tu contraseña?
                    </p>
                    </Link>
                </div>
            {
                window.innerWidth>=748 ? 
                <div
            
                id="bannerCarousel"
                className="carousel slide"
                data-bs-ride="carousel"
                data-bs-interval="3000"
            >
                <div className="carousel-inner" >

                    <div className="carousel-item active">
                        <img
                            src="/assets/banner1.png"
                            className={`d-block w-100 ${styles.bannerImage}`}
                            alt="Banner 1"
                        />
                    </div>

                    <div className="carousel-item">
                        <img
                            src="/assets/banner2.jpg"
                            className={`d-block w-100 ${styles.bannerImage}`}
                            alt="Banner 2"
                        />
                    </div>

                    <div className="carousel-item">
                        <img
                            src="/assets/banner3.jpg"
                            className={`d-block w-100 ${styles.bannerImage}`}
                            alt="Banner 3"
                        />
                    </div>

                </div>

                <button
                    className="carousel-control-prev"
                    type="button"
                    data-bs-target="#bannerCarousel"
                    data-bs-slide="prev"
                >
                    <span className="carousel-control-prev-icon"></span>
                </button>

                <button
                    className="carousel-control-next"
                    type="button"
                    data-bs-target="#bannerCarousel"
                    data-bs-slide="next"
                >
                    <span className="carousel-control-next-icon"></span>
                </button>
                
            </div> : ""
            }
            

            <div className={styles.overlay}>
                
            </div>

        </div>
    )
}