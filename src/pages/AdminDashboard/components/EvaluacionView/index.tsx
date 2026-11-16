import { ClipboardList, Star } from "lucide-react";
import type {
    EvaluacionDTO,
    EvaluacionGraficasDTO,
} from "../../../../services/evaluacionDocenteApi";
import {
    CategoriaRadar,
    ChartCard,
    ComentariosDestacados,
    EmptyChart,
    LikertHistogram,
    LikertStackedBar,
    PreguntasBar,
    SentimientoPie,
    WordCloud,
} from "../../charts";
import { UC_COLORS } from "../../palette";
import { EvaluacionSelect } from "../EvaluacionSelect";
import { KpiCard } from "../KpiCard";
import { KpiGaugeCard } from "../KpiGaugeCard";
import styles from "../../index.module.css";

interface Props {
    evaluaciones: EvaluacionDTO[];
    evaluacionId: number | null;
    data: EvaluacionGraficasDTO | null;
    onEvaluacionChange: (id: number) => void;
}

/** Vista: resultados agregados de una evaluación (materia · grupo · periodo). */
export function EvaluacionView({ evaluaciones, evaluacionId, data, onEvaluacionChange }: Props) {
    return (
        <>
            <div className={styles.selectors}>
                <EvaluacionSelect
                    evaluaciones={evaluaciones}
                    value={evaluacionId}
                    onChange={onEvaluacionChange}
                />
            </div>

            {evaluaciones.length === 0 && (
                <EmptyChart message="Este docente no tiene evaluaciones registradas" />
            )}

            {data && (
                <>
                    <section className={styles.kpiGrid}>
                        <KpiGaugeCard
                            value={data.promedioGeneral}
                            label="Promedio general (0–5)"
                            valoracion={data.valoracion}
                        />
                        <KpiGaugeCard
                            value={data.participacion.porcentaje ?? 0}
                            max={100}
                            label={`Participación: ${data.participacion.respondidas} de ${data.participacion.esperados ?? "—"}`}
                            color={UC_COLORS.teal}
                        />
                        <KpiCard
                            tone="teal"
                            icon={<ClipboardList size={22} />}
                            label="Encuestas respondidas"
                            value={data.participacion.respondidas}
                        />
                        <KpiCard
                            tone="orange"
                            icon={<Star size={22} />}
                            label="Score de sentimiento"
                            value={
                                data.promedioSentimiento != null
                                    ? data.promedioSentimiento.toFixed(2)
                                    : "—"
                            }
                        />
                    </section>

                    <section className={styles.grid2}>
                        <ChartCard
                            title="Desempeño por categoría"
                            subtitle="Promedio del grupo en cada aspecto evaluado"
                        >
                            <CategoriaRadar data={data.radarCategorias} />
                        </ChartCard>
                        <ChartCard title="Sentimiento de los comentarios" subtitle="Del grupo evaluado">
                            <SentimientoPie
                                data={data.sentimientos}
                                promedio={data.promedioSentimiento}
                            />
                        </ChartCard>
                    </section>

                    <ChartCard
                        title="Promedio por pregunta"
                        subtitle="Cada barra se colorea según su categoría"
                    >
                        <PreguntasBar
                            serie={data.barrasPromedioPreguntas}
                            detalle={data.distribucionPorPregunta}
                        />
                    </ChartCard>

                    <section className={styles.grid2}>
                        <ChartCard
                            title="Distribución por pregunta"
                            subtitle="Cuántas veces se eligió cada valoración 1–5"
                        >
                            <LikertStackedBar data={data.distribucionPorPregunta} />
                        </ChartCard>
                        <ChartCard
                            title="Histograma de valoraciones"
                            subtitle="Todas las respuestas del grupo"
                        >
                            <LikertHistogram data={data.distribucionLikert} />
                        </ChartCard>
                    </section>

                    <section className={styles.grid2}>
                        <ChartCard
                            title="Nube de palabras"
                            subtitle="Términos más frecuentes en los comentarios"
                        >
                            <WordCloud data={data.wordCloud} />
                        </ChartCard>
                        <ChartCard
                            title="Comentarios destacados"
                            subtitle="Según el score de sentimiento"
                        >
                            <ComentariosDestacados data={data.comentariosDestacados} />
                        </ChartCard>
                    </section>
                </>
            )}
        </>
    );
}
