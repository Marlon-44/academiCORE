
import styles from "./index.module.css";

export const StudentDashboard = () => {
    return (
        <main className={styles.dashboard}>
            <div className={styles.container}>
                <span className={styles.eyebrow}>
                    PLATAFORMA ACADÉMICA
                </span>

                <h1>
                    Bienvenido a tu
                    <span> espacio académico.</span>
                </h1>

                <p>
                    Desde aquí podrás consultar y gestionar la información
                    relacionada con tu vida universitaria.
                </p>
            </div>
        </main>
    );
};
