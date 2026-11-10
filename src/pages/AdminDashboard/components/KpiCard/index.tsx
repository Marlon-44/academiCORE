import type { ReactNode } from "react";
import styles from "../../index.module.css";

export type KpiTone = "teal" | "orange" | "yellow" | "red";

const TONE_CLASS: Record<KpiTone, string> = {
    teal: styles.iconTeal,
    orange: styles.iconOrange,
    yellow: styles.iconYellow,
    red: styles.iconRed,
};

interface Props {
    icon: ReactNode;
    tone: KpiTone;
    label: ReactNode;
    value: ReactNode;
}

/** Tarjeta KPI con ícono, etiqueta y valor. */
export function KpiCard({ icon, tone, label, value }: Props) {
    return (
        <article className={styles.kpi}>
            <div className={`${styles.kpiIcon} ${TONE_CLASS[tone]}`}>{icon}</div>
            <div>
                <span className={styles.kpiLabel}>{label}</span>
                <strong className={styles.kpiValue}>{value}</strong>
            </div>
        </article>
    );
}
