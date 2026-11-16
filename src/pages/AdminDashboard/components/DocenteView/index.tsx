import { BarChart3, MessageSquareText, Users } from "lucide-react";
import type { DocenteGraficasDTO } from "../../../../services/evaluacionDocenteApi";
import {
    CategoriaRadar,
    ChartCard,
    ComparativoMateriasBar,
    EvolucionArea,
    RankingList,
    SentimientoPie,
    WordCloud,
} from "../../charts";
import { KpiCard } from "../KpiCard";
import { KpiGaugeCard } from "../KpiGaugeCard";
import styles from "../../index.module.css";

/** Vista: panorama global del docente. */
export function DocenteView({ data }: { data: DocenteGraficasDTO }) {
    return (
        <>
            <section className={styles.kpiGrid}>
                <KpiGaugeCard
                    value={data.promedioGeneral}
                    label="Promedio general (0–5)"
                    valoracion={data.valoracion}
                />
                <KpiCard
                    tone="teal"
                    icon={<Users size={22} />}
                    label="Encuestas recibidas"
                    value={data.totalEncuestas}
                />
                <KpiCard
                    tone="orange"
                    icon={<BarChart3 size={22} />}
                    label="Evaluaciones asignadas"
                    value={data.comparativoMaterias.length}
                />
                <KpiCard
                    tone="yellow"
                    icon={<MessageSquareText size={22} />}
                    label="Score de sentimiento"
                    value={data.promedioSentimiento != null ? data.promedioSentimiento.toFixed(2) : "—"}
                />
            </section>

            <section className={styles.grid2}>
                <ChartCard
                    title="Desempeño por categoría"
                    subtitle="Promedio 1–5 en cada aspecto evaluado"
                >
                    <CategoriaRadar data={data.radarCategorias} />
                </ChartCard>
                <ChartCard
                    title="Sentimiento de los comentarios"
                    subtitle="Clasificación automática del texto libre"
                >
                    <SentimientoPie data={data.sentimientos} promedio={data.promedioSentimiento} />
                </ChartCard>
            </section>

            <ChartCard
                title="Comparativo por materia"
                subtitle="Promedio general en cada evaluación (materia · grupo · periodo)"
            >
                <ComparativoMateriasBar data={data.comparativoMaterias} />
            </ChartCard>

            <section className={styles.grid2}>
                <ChartCard
                    title="Evolución por periodo"
                    subtitle="Promedio del docente en cada periodo académico"
                >
                    <EvolucionArea data={data.evolucionPeriodos} />
                </ChartCard>
                <ChartCard
                    title="Nube de palabras"
                    subtitle="Términos más frecuentes en los comentarios"
                >
                    <WordCloud data={data.wordCloud} />
                </ChartCard>
            </section>

            <section className={styles.grid2}>
                <ChartCard title="Fortalezas" subtitle="Las 3 preguntas mejor valoradas">
                    <RankingList items={data.fortalezas} accent="teal" />
                </ChartCard>
                <ChartCard
                    title="Oportunidades de mejora"
                    subtitle="Las 3 preguntas con menor valoración"
                >
                    <RankingList items={data.oportunidades} accent="red" />
                </ChartCard>
            </section>
        </>
    );
}
