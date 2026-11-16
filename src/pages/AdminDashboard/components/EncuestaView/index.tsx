import { MessageSquareText } from "lucide-react";
import type {
    EncuestaDTO,
    EncuestaGraficaDTO,
    EvaluacionDTO,
} from "../../../../services/evaluacionDocenteApi";
import { CategoriaRadar, ChartCard, EmptyChart, PreguntasBar } from "../../charts";
import { resumirSentimiento } from "../../utils";
import { EncuestaSelect } from "../EncuestaSelect";
import { EvaluacionSelect } from "../EvaluacionSelect";
import { KpiCard, type KpiTone } from "../KpiCard";
import { KpiGaugeCard } from "../KpiGaugeCard";
import { RespuestasAbiertas } from "../RespuestasAbiertas";
import styles from "../../index.module.css";

interface Props {
    evaluaciones: EvaluacionDTO[];
    evaluacionId: number | null;
    evaluacionActual: EvaluacionDTO | null;
    encuestas: EncuestaDTO[];
    encuestaId: number | null;
    data: EncuestaGraficaDTO | null;
    onEvaluacionChange: (id: number) => void;
    onEncuestaChange: (id: number) => void;
}

const TONE_POR_SENTIMIENTO: Record<string, KpiTone> = {
    POSITIVO: "teal",
    NEGATIVO: "red",
    NEUTRO: "yellow",
};

/** Vista: detalle de una encuesta individual. */
export function EncuestaView({
    evaluaciones,
    evaluacionId,
    evaluacionActual,
    encuestas,
    encuestaId,
    data,
    onEvaluacionChange,
    onEncuestaChange,
}: Props) {
    const textos = data?.respuestasTexto ?? [];
    const { dominante, promedio } = resumirSentimiento(textos);

    return (
        <>
            <div className={styles.selectors}>
                <EvaluacionSelect
                    evaluaciones={evaluaciones}
                    value={evaluacionId}
                    onChange={onEvaluacionChange}
                />
                <EncuestaSelect
                    encuestas={encuestas}
                    value={encuestaId}
                    onChange={onEncuestaChange}
                />
            </div>

            {evaluacionActual && encuestas.length === 0 && (
                <EmptyChart message="Esta evaluación aún no tiene encuestas respondidas" />
            )}

            {data && (
                <>
                    <section className={styles.kpiGrid}>
                        <KpiGaugeCard
                            value={data.promedioGeneral}
                            label="Promedio de esta encuesta (0–5)"
                            valoracion={data.valoracion}
                        />
                        {textos.length > 0 && (
                            <KpiCard
                                tone={dominante ? TONE_POR_SENTIMIENTO[dominante] : "yellow"}
                                icon={<MessageSquareText size={22} />}
                                label={<>Sentimiento de comentarios ({textos.length} abiertas)</>}
                                value={
                                    <>
                                        {dominante ?? "—"}
                                        {promedio != null ? ` · ${promedio.toFixed(2)}` : ""}
                                    </>
                                }
                            />
                        )}
                    </section>

                    <section className={styles.grid2}>
                        <ChartCard
                            title="Categorías de esta encuesta"
                            subtitle="Promedio por aspecto evaluado"
                        >
                            <CategoriaRadar data={data.radarCategorias} />
                        </ChartCard>
                        {textos.length > 0 && (
                            <ChartCard
                                title="Respuestas abiertas"
                                subtitle="Cada comentario con su análisis de sentimiento"
                            >
                                <RespuestasAbiertas respuestas={textos} />
                            </ChartCard>
                        )}
                    </section>

                    <ChartCard
                        title="Respuestas de esta encuesta"
                        subtitle="Valor 1–5 elegido en cada pregunta"
                    >
                        <PreguntasBar
                            serie={{
                                labels: data.barrasPreguntas.map((b) => `P${b.numero}`),
                                valores: data.barrasPreguntas.map((b) => b.valor),
                            }}
                            detalle={data.barrasPreguntas}
                        />
                    </ChartCard>
                </>
            )}
        </>
    );
}
