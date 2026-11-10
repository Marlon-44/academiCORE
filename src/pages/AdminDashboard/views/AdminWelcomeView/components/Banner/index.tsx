import { CalendarDays } from "lucide-react";
import styles from "./index.module.css";
import type { Admin } from "../../../../types";

export const Banner = ({admin}: {admin: Admin}) => {
    const getGreeting = () => {
    const hour = new Date().getHours();

    if (hour < 12) return "Buenos días";
    if (hour < 18) return "Buenas tardes";
    return "Buenas noches";
};
    return (
        <section className={styles.hero}>
            <div className={styles.heroContent}>
                

                <h1>
                    {getGreeting()}, {admin.name.split(" ")[0] }👋.
                </h1>

                <p>
                    Bienvenido a tu espacio de gestión académica.
                    Accede a tus herramientas y mantente al día con
                    las novedades de nuestra institución.
                </p>

                <div className={styles.heroPeriod}>
                    <CalendarDays size={16} />
                    Periodo académico {admin.academicPeriod}
                </div>
            </div>
            <img src="/assets/logoWhiteUDC.png" alt="" className={styles.logo} />
            
        </section>
    )

}