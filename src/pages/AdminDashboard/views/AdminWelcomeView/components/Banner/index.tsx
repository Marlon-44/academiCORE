import { CalendarDays } from "lucide-react";
import styles from "./index.module.css";
import type { Admin } from "../../../../types";
import { useEffect, useRef, useState } from "react";

export const Banner = ({ admin }: { admin: Admin }) => {
    const getGreeting = () => {
        const hour = new Date().getHours();

        if (hour < 12) return "Buenos días";
        if (hour < 18) return "Buenas tardes";
        return "Buenas noches";
    };
    const heroRef = useRef<HTMLElement>(null);
    const [showLogo, setShowLogo] = useState(true);

    useEffect(() => {
        const hero = heroRef.current;

        if (!hero) return;

        const observer = new ResizeObserver(([entry]) => {
            setShowLogo(entry.contentRect.width >= 600);
        });

        observer.observe(hero);

        return () => observer.disconnect();
    }, []);
    return (
        <section className={styles.hero} ref={heroRef}>
            <div className={styles.heroContent}>
                <h1>
                    {getGreeting()}, {admin.name.split(" ")[0]} 👋.
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

            {showLogo && (
                <img
                    src="/assets/logoWhiteUDC.png"
                    alt=""
                    className={styles.logo}
                />
            )}
        </section>
    )

}