import { useAuth } from "../../../../auth/AuthContext";
import { formatName } from "../../../../services/textFormat";
import styles from "./index.module.css"



export const Banner = () => {
    const { user } = useAuth();
    

    return (
        <header className={styles.hero}>
            <div className={styles.heroContent}>


                <h1>Encuesta docente</h1>
                <p className={styles.heroHi}>
                    Hola, <span>{formatName(user?.name ?? "")}</span> 👋
                </p>
                <p className={styles.heroDescription}>
                    Tu opinión contribuye a mejorar la calidad académica. Consulta tus evaluaciones y completa las que tienes pendientes.
                </p>


            </div>


            <img src="/assets/logoWhiteUDC.png" alt="" className={styles.logo} />
        </header>
    )
}