import { GaugeChart, ValoracionBadge } from "../../charts";
import { UC_COLORS } from "../../palette";
import styles from "../../index.module.css";

interface Props {
    value: number;
    label: string;
    max?: number;
    color?: string;
    valoracion?: string;
}

/** Tarjeta KPI con medidor (gauge) y, opcionalmente, la insignia de valoración. */
export function KpiGaugeCard({ value, label, max, color = UC_COLORS.purple, valoracion }: Props) {
    return (
        <article className={`${styles.kpi} ${styles.kpiPurple}`}>
            <GaugeChart value={value} max={max} label={label} color={color} />
            {valoracion && <ValoracionBadge valoracion={valoracion} />}
        </article>
    );
}
