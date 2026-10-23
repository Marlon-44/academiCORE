import { useEffect, useState } from "react";
import {
    BarChart3,
    ClipboardList,
    GraduationCap,
    ListChecks,
    MessageSquareText,
    PieChart as PieIcon,
    Star,
    TrendingUp,
    Users,
} from "lucide-react";
import {
    fetchDocentes,
    fetchDocenteGraficas,
    fetchEvaluaciones,
    fetchEvaluacionGraficas,
    fetchEncuestasDeEvaluacion,
    fetchEncuestaGrafica,
    type DocenteDTO,
    type DocenteGraficasDTO,
    type EncuestaDTO,
    type EncuestaGraficaDTO,
    type EvaluacionDTO,
    type EvaluacionGraficasDTO,
} from "../../services/evaluacionDocenteApi";
import {
    CategoriaRadar,
    ChartCard,
    ComparativoMateriasBar,
    ComentariosDestacados,
    EmptyChart,
    EvolucionArea,
    GaugeChart,
    LikertHistogram,
    LikertStackedBar,
    PreguntasBar,
    RankingList,
    SentimientoPie,
    ValoracionBadge,
    WordCloud,
} from "./charts";
import { UC_COLORS } from "./palette";
import { InstrumentoAdmin } from "./instrumento";
import styles from "./index.module.css";

type Vista = "docente" | "evaluacion" | "encuesta" | "instrumento";

const VISTAS: { id: Vista; label: string; icon: typeof BarChart3 }[] = [
    { id: "docente", label: "Panorama del docente", icon: TrendingUp },
    { id: "evaluacion", label: "Por evaluación", icon: PieIcon },
    { id: "encuesta", label: "Encuesta individual", icon: ClipboardList },
    { id: "instrumento", label: "Instrumento", icon: ListChecks },
];

export function EvaluacionDocente() {
    const [docentes, setDocentes] = useState<DocenteDTO[]>([]);
    const [docenteId, setDocenteId] = useState<number | null>(null);
    const [vista, setVista] = useState<Vista>("docente");

    const [docenteGraficas, setDocenteGraficas] = useState<DocenteGraficasDTO | null>(null);
    const [evaluaciones, setEvaluaciones] = useState<EvaluacionDTO[]>([]);
    const [evaluacionId, setEvaluacionId] = useState<number | null>(null);
    const [evaluacionGraficas, setEvaluacionGraficas] = useState<EvaluacionGraficasDTO | null>(null);
    const [encuestas, setEncuestas] = useState<EncuestaDTO[]>([]);
    const [encuestaId, setEncuestaId] = useState<number | null>(null);
    const [encuestaGrafica, setEncuestaGrafica] = useState<EncuestaGraficaDTO | null>(null);

    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");

    // Carga inicial: docentes
    useEffect(() => {
        let cancelled = false;
        fetchDocentes()
            .then((data) => {
                if (cancelled) return;
                setDocentes(data);
                if (data.length > 0) setDocenteId(data[0].id);
                else setLoading(false);
            })
            .catch(() => {
                if (cancelled) return;
                setError("No fue posible cargar los docentes. Verifica que el backend esté activo.");
                setLoading(false);
            });
        return () => {
            cancelled = true;
        };
    }, []);

    // Al cambiar docente: gráficas globales + sus evaluaciones
    useEffect(() => {
        if (docenteId == null) return;
        let cancelled = false;

        Promise.all([fetchDocenteGraficas(docenteId), fetchEvaluaciones(docenteId)])
            .then(([graficas, evals]) => {
                if (cancelled) return;
                setDocenteGraficas(graficas);
                setEvaluaciones(evals);
                setEvaluacionGraficas(null);
                setEncuestaGrafica(null);
                setEncuestas([]);
                setEncuestaId(null);
                setEvaluacionId(evals.length > 0 ? evals[0].id : null);
                if (evals.length === 0) setLoading(false);
            })
            .catch(() => {
                if (cancelled) return;
                setError("No fue posible cargar las estadísticas del docente.");
                setLoading(false);
            });
        return () => {
            cancelled = true;
        };
    }, [docenteId]);

    // Al cambiar evaluación: gráficas + encuestas
    useEffect(() => {
        if (evaluacionId == null) return;
        let cancelled = false;

        Promise.all([
            fetchEvaluacionGraficas(evaluacionId),
            fetchEncuestasDeEvaluacion(evaluacionId),
        ])
            .then(([graficas, encs]) => {
                if (cancelled) return;
                setEvaluacionGraficas(graficas);
                setEncuestas(encs);
                setEncuestaId(encs.length > 0 ? encs[0].id : null);
                if (encs.length === 0) setEncuestaGrafica(null);
                setLoading(false);
            })
            .catch(() => {
                if (cancelled) return;
                setError("No fue posible cargar las gráficas de la evaluación.");
                setLoading(false);
            });
        return () => {
            cancelled = true;
        };
    }, [evaluacionId]);

    // Al cambiar encuesta: su gráfica individual
    useEffect(() => {
        if (encuestaId == null) return;
        let cancelled = false;
        fetchEncuestaGrafica(encuestaId)
            .then((g) => {
                if (!cancelled) setEncuestaGrafica(g);
            })
            .catch(() => {
                if (!cancelled)
                    setError("No fue posible cargar la gráfica de la encuesta.");
            });
        return () => {
            cancelled = true;
        };
    }, [encuestaId]);

    // Los selectores limpian el estado dependiente en el handler
    // (los efectos solo traen datos y setean de forma asíncrona)

    const handleDocenteChange = (id: number) => {
        setLoading(true);
        setError("");
        setDocenteGraficas(null);
        setEvaluaciones([]);
        setEvaluacionId(null);
        setEvaluacionGraficas(null);
        setEncuestas([]);
        setEncuestaId(null);
        setEncuestaGrafica(null);
        setDocenteId(id);
    };

    const handleEvaluacionChange = (id: number) => {
        setEvaluacionGraficas(null);
        setEncuestas([]);
        setEncuestaId(null);
        setEncuestaGrafica(null);
        setEvaluacionId(id);
    };

    const handleEncuestaChange = (id: number) => {
        setEncuestaGrafica(null);
        setEncuestaId(id);
    };

    const evaluacionActual = evaluaciones.find((e) => e.id === evaluacionId) ?? null;

    // Sentimiento agregado de las respuestas abiertas de la encuesta seleccionada
    const textosEncuesta = encuestaGrafica?.respuestasTexto ?? [];
    const sentConteo = textosEncuesta.reduce(
        (acc, r) => {
            if (r.sentimiento === "POSITIVO" || r.sentimiento === "NEUTRO"
                || r.sentimiento === "NEGATIVO") {
                acc[r.sentimiento] += 1;
            }
            return acc;
        },
        { POSITIVO: 0, NEUTRO: 0, NEGATIVO: 0 } as Record<
            "POSITIVO" | "NEUTRO" | "NEGATIVO",
            number
        >
    );
    const sentDominante =
        textosEncuesta.length === 0
            ? null
            : (Object.entries(sentConteo).sort((a, b) => b[1] - a[1])[0][0] as
                  | "POSITIVO"
                  | "NEUTRO"
                  | "NEGATIVO");
    const sentScores = textosEncuesta
        .map((r) => r.sentimientoScore)
        .filter((s): s is number => s != null);
    const sentPromedio =
        sentScores.length > 0
            ? sentScores.reduce((a, b) => a + b, 0) / sentScores.length
            : null;

    return (
        <main className={styles.page}>
            <div className={styles.container}>
                {/* ============ Encabezado ============ */}
                <section className={styles.hero}>
                    <div>
                        <span className={styles.heroKicker}>
                            <GraduationCap size={16} /> Resultados de evaluación docente
                        </span>
                        <h1>Panel de indicadores</h1>
                        <p>
                            Promedios por categoría, distribución de valoraciones, sentimiento de los
                            comentarios y evolución por periodo.
                        </p>
                    </div>
                    <label className={styles.docentePicker}>
                        <span>Docente</span>
                        <select
                            value={docenteId ?? ""}
                            onChange={(e) => handleDocenteChange(Number(e.target.value))}
                            disabled={docentes.length === 0}
                        >
                            {docentes.length === 0 && <option>Sin docentes</option>}
                            {docentes.map((d) => (
                                <option key={d.id} value={d.id}>
                                    {d.nombreCompleto}
                                </option>
                            ))}
                        </select>
                    </label>
                </section>

                {/* ============ Tabs ============ */}
                <nav className={styles.tabs} role="tablist" aria-label="Vistas de gráficas">
                    {VISTAS.map(({ id, label, icon: Icon }) => (
                        <button
                            key={id}
                            type="button"
                            role="tab"
                            aria-selected={vista === id}
                            className={`${styles.tab} ${vista === id ? styles.tabActive : ""}`}
                            onClick={() => setVista(id)}
                        >
                            <Icon size={16} />
                            {label}
                        </button>
                    ))}
                </nav>

                {error && (
                    <div className={styles.loadError} role="alert">
                        {error}
                    </div>
                )}

                {loading && (
                    <div className={styles.skeletonGrid}>
                        {[0, 1, 2].map((i) => (
                            <div key={i} className={styles.skeletonCard} />
                        ))}
                    </div>
                )}

                {/* ============ Vista: panorama del docente ============ */}
                {!loading && vista === "docente" && docenteGraficas && (
                    <>
                        <section className={styles.kpiGrid}>
                            <article className={`${styles.kpi} ${styles.kpiPurple}`}>
                                <GaugeChart
                                    value={docenteGraficas.promedioGeneral}
                                    label="Promedio general (0–5)"
                                    color={UC_COLORS.purple}
                                />
                                <ValoracionBadge valoracion={docenteGraficas.valoracion} />
                            </article>
                            <article className={styles.kpi}>
                                <div className={`${styles.kpiIcon} ${styles.iconTeal}`}>
                                    <Users size={22} />
                                </div>
                                <div>
                                    <span className={styles.kpiLabel}>Encuestas recibidas</span>
                                    <strong className={styles.kpiValue}>
                                        {docenteGraficas.totalEncuestas}
                                    </strong>
                                </div>
                            </article>
                            <article className={styles.kpi}>
                                <div className={`${styles.kpiIcon} ${styles.iconOrange}`}>
                                    <BarChart3 size={22} />
                                </div>
                                <div>
                                    <span className={styles.kpiLabel}>Evaluaciones asignadas</span>
                                    <strong className={styles.kpiValue}>
                                        {docenteGraficas.comparativoMaterias.length}
                                    </strong>
                                </div>
                            </article>
                            <article className={styles.kpi}>
                                <div className={`${styles.kpiIcon} ${styles.iconYellow}`}>
                                    <MessageSquareText size={22} />
                                </div>
                                <div>
                                    <span className={styles.kpiLabel}>Score de sentimiento</span>
                                    <strong className={styles.kpiValue}>
                                        {docenteGraficas.promedioSentimiento != null
                                            ? docenteGraficas.promedioSentimiento.toFixed(2)
                                            : "—"}
                                    </strong>
                                </div>
                            </article>
                        </section>

                        <section className={styles.grid2}>
                            <ChartCard
                                title="Desempeño por categoría"
                                subtitle="Promedio 1–5 en cada aspecto evaluado"
                            >
                                <CategoriaRadar data={docenteGraficas.radarCategorias} />
                            </ChartCard>
                            <ChartCard
                                title="Sentimiento de los comentarios"
                                subtitle="Clasificación automática del texto libre"
                            >
                                <SentimientoPie
                                    data={docenteGraficas.sentimientos}
                                    promedio={docenteGraficas.promedioSentimiento}
                                />
                            </ChartCard>
                        </section>

                        <ChartCard
                            title="Comparativo por materia"
                            subtitle="Promedio general en cada evaluación (materia · grupo · periodo)"
                        >
                            <ComparativoMateriasBar data={docenteGraficas.comparativoMaterias} />
                        </ChartCard>

                        <section className={styles.grid2}>
                            <ChartCard
                                title="Evolución por periodo"
                                subtitle="Promedio del docente en cada periodo académico"
                            >
                                <EvolucionArea data={docenteGraficas.evolucionPeriodos} />
                            </ChartCard>
                            <ChartCard
                                title="Nube de palabras"
                                subtitle="Términos más frecuentes en los comentarios"
                            >
                                <WordCloud data={docenteGraficas.wordCloud} />
                            </ChartCard>
                        </section>

                        <section className={styles.grid2}>
                            <ChartCard
                                title="Fortalezas"
                                subtitle="Las 3 preguntas mejor valoradas"
                            >
                                <RankingList items={docenteGraficas.fortalezas} accent="teal" />
                            </ChartCard>
                            <ChartCard
                                title="Oportunidades de mejora"
                                subtitle="Las 3 preguntas con menor valoración"
                            >
                                <RankingList items={docenteGraficas.oportunidades} accent="red" />
                            </ChartCard>
                        </section>
                    </>
                )}

                {!loading && vista === "docente" && !docenteGraficas && !error && (
                    <EmptyChart message="Selecciona un docente para ver sus indicadores" />
                )}

                {/* ============ Vista: por evaluación ============ */}
                {!loading && vista === "evaluacion" && (
                    <>
                        <div className={styles.selectors}>
                            <label className={styles.selectBox}>
                                <span>Evaluación</span>
                                <select
                                    value={evaluacionId ?? ""}
                                    onChange={(e) => handleEvaluacionChange(Number(e.target.value))}
                                    disabled={evaluaciones.length === 0}
                                >
                                    {evaluaciones.length === 0 && (
                                        <option>Sin evaluaciones para este docente</option>
                                    )}
                                    {evaluaciones.map((ev) => (
                                        <option key={ev.id} value={ev.id}>
                                            {ev.asignaturaNombre ?? `Asignatura ${ev.asignaturaId}`}{" "}
                                            · Grupo {ev.grupo} · {ev.periodo}
                                        </option>
                                    ))}
                                </select>
                            </label>
                        </div>

                        {evaluaciones.length === 0 && (
                            <EmptyChart message="Este docente no tiene evaluaciones registradas" />
                        )}

                        {evaluacionGraficas && (
                            <>
                                <section className={styles.kpiGrid}>
                                    <article className={`${styles.kpi} ${styles.kpiPurple}`}>
                                        <GaugeChart
                                            value={evaluacionGraficas.promedioGeneral}
                                            label="Promedio general (0–5)"
                                            color={UC_COLORS.purple}
                                        />
                                        <ValoracionBadge valoracion={evaluacionGraficas.valoracion} />
                                    </article>
                                    <article className={`${styles.kpi} ${styles.kpiPurple}`}>
                                        <GaugeChart
                                            value={
                                                evaluacionGraficas.participacion.porcentaje ?? 0
                                            }
                                            max={100}
                                            label={`Participación: ${evaluacionGraficas.participacion.respondidas} de ${evaluacionGraficas.participacion.esperados ?? "—"}`}
                                            color={UC_COLORS.teal}
                                        />
                                    </article>
                                    <article className={styles.kpi}>
                                        <div className={`${styles.kpiIcon} ${styles.iconTeal}`}>
                                            <ClipboardList size={22} />
                                        </div>
                                        <div>
                                            <span className={styles.kpiLabel}>
                                                Encuestas respondidas
                                            </span>
                                            <strong className={styles.kpiValue}>
                                                {evaluacionGraficas.participacion.respondidas}
                                            </strong>
                                        </div>
                                    </article>
                                    <article className={styles.kpi}>
                                        <div className={`${styles.kpiIcon} ${styles.iconOrange}`}>
                                            <Star size={22} />
                                        </div>
                                        <div>
                                            <span className={styles.kpiLabel}>
                                                Score de sentimiento
                                            </span>
                                            <strong className={styles.kpiValue}>
                                                {evaluacionGraficas.promedioSentimiento != null
                                                    ? evaluacionGraficas.promedioSentimiento.toFixed(
                                                          2
                                                      )
                                                    : "—"}
                                            </strong>
                                        </div>
                                    </article>
                                </section>

                                <section className={styles.grid2}>
                                    <ChartCard
                                        title="Desempeño por categoría"
                                        subtitle="Promedio del grupo en cada aspecto evaluado"
                                    >
                                        <CategoriaRadar
                                            data={evaluacionGraficas.radarCategorias}
                                        />
                                    </ChartCard>
                                    <ChartCard
                                        title="Sentimiento de los comentarios"
                                        subtitle="Del grupo evaluado"
                                    >
                                        <SentimientoPie
                                            data={evaluacionGraficas.sentimientos}
                                            promedio={evaluacionGraficas.promedioSentimiento}
                                        />
                                    </ChartCard>
                                </section>

                                <ChartCard
                                    title="Promedio por pregunta"
                                    subtitle="Cada barra se colorea según su categoría"
                                >
                                    <PreguntasBar
                                        serie={evaluacionGraficas.barrasPromedioPreguntas}
                                        detalle={evaluacionGraficas.distribucionPorPregunta}
                                    />
                                </ChartCard>

                                <section className={styles.grid2}>
                                    <ChartCard
                                        title="Distribución por pregunta"
                                        subtitle="Cuántas veces se eligió cada valoración 1–5"
                                    >
                                        <LikertStackedBar
                                            data={evaluacionGraficas.distribucionPorPregunta}
                                        />
                                    </ChartCard>
                                    <ChartCard
                                        title="Histograma de valoraciones"
                                        subtitle="Todas las respuestas del grupo"
                                    >
                                        <LikertHistogram
                                            data={evaluacionGraficas.distribucionLikert}
                                        />
                                    </ChartCard>
                                </section>

                                <section className={styles.grid2}>
                                    <ChartCard
                                        title="Nube de palabras"
                                        subtitle="Términos más frecuentes en los comentarios"
                                    >
                                        <WordCloud data={evaluacionGraficas.wordCloud} />
                                    </ChartCard>
                                    <ChartCard
                                        title="Comentarios destacados"
                                        subtitle="Según el score de sentimiento"
                                    >
                                        <ComentariosDestacados
                                            data={evaluacionGraficas.comentariosDestacados}
                                        />
                                    </ChartCard>
                                </section>
                            </>
                        )}
                    </>
                )}

                {/* ============ Vista: encuesta individual ============ */}
                {!loading && vista === "encuesta" && (
                    <>
                        <div className={styles.selectors}>
                            <label className={styles.selectBox}>
                                <span>Evaluación</span>
                                <select
                                    value={evaluacionId ?? ""}
                                    onChange={(e) => handleEvaluacionChange(Number(e.target.value))}
                                    disabled={evaluaciones.length === 0}
                                >
                                    {evaluaciones.length === 0 && (
                                        <option>Sin evaluaciones para este docente</option>
                                    )}
                                    {evaluaciones.map((ev) => (
                                        <option key={ev.id} value={ev.id}>
                                            {ev.asignaturaNombre ?? `Asignatura ${ev.asignaturaId}`}{" "}
                                            · Grupo {ev.grupo} · {ev.periodo}
                                        </option>
                                    ))}
                                </select>
                            </label>
                            <label className={styles.selectBox}>
                                <span>Encuesta</span>
                                <select
                                    value={encuestaId ?? ""}
                                    onChange={(e) => handleEncuestaChange(Number(e.target.value))}
                                    disabled={encuestas.length === 0}
                                >
                                    {encuestas.length === 0 && (
                                        <option>Sin encuestas respondidas</option>
                                    )}
                                    {encuestas.map((enc) => (
                                        <option key={enc.id} value={enc.id}>
                                            #{enc.id}
                                            {enc.estudianteNombre
                                                ? ` · ${enc.estudianteNombre}`
                                                : ""}{" "}
                                            · {enc.promedio.toFixed(2)} ({enc.valoracion})
                                        </option>
                                    ))}
                                </select>
                            </label>
                        </div>

                        {evaluacionActual && encuestas.length === 0 && (
                            <EmptyChart message="Esta evaluación aún no tiene encuestas respondidas" />
                        )}

                        {encuestaGrafica && (
                            <>
                                <section className={styles.kpiGrid}>
                                    <article className={`${styles.kpi} ${styles.kpiPurple}`}>
                                        <GaugeChart
                                            value={encuestaGrafica.promedioGeneral}
                                            label="Promedio de esta encuesta (0–5)"
                                            color={UC_COLORS.purple}
                                        />
                                        <ValoracionBadge valoracion={encuestaGrafica.valoracion} />
                                    </article>
                                    {textosEncuesta.length > 0 && (
                                        <article className={styles.kpi}>
                                            <div
                                                className={`${styles.kpiIcon} ${
                                                    sentDominante === "POSITIVO"
                                                        ? styles.iconTeal
                                                        : sentDominante === "NEGATIVO"
                                                          ? styles.iconRed
                                                          : styles.iconYellow
                                                }`}
                                            >
                                                <MessageSquareText size={22} />
                                            </div>
                                            <div>
                                                <span className={styles.kpiLabel}>
                                                    Sentimiento de comentarios (
                                                    {textosEncuesta.length} abiertas)
                                                </span>
                                                <strong className={styles.kpiValue}>
                                                    {sentDominante ?? "—"}
                                                    {sentPromedio != null
                                                        ? ` · ${sentPromedio.toFixed(2)}`
                                                        : ""}
                                                </strong>
                                            </div>
                                        </article>
                                    )}
                                </section>

                                <section className={styles.grid2}>
                                    <ChartCard
                                        title="Categorías de esta encuesta"
                                        subtitle="Promedio por aspecto evaluado"
                                    >
                                        <CategoriaRadar
                                            data={encuestaGrafica.radarCategorias}
                                        />
                                    </ChartCard>
                                    {textosEncuesta.length > 0 && (
                                        <ChartCard
                                            title="Respuestas abiertas"
                                            subtitle="Cada comentario con su análisis de sentimiento"
                                        >
                                            <div className={styles.quotes}>
                                                {textosEncuesta.map((r, i) => (
                                                    <blockquote
                                                        key={`${r.numero}-${i}`}
                                                        className={`${styles.quote} ${
                                                            r.sentimiento === "NEGATIVO"
                                                                ? styles.quoteNegative
                                                                : r.sentimiento === "NEUTRO"
                                                                  ? styles.quoteNeutral
                                                                  : styles.quotePositive
                                                        }`}
                                                    >
                                                        <span className={styles.quoteMark}>“</span>
                                                        <p>{r.texto}</p>
                                                        <footer>
                                                            P{r.numero ?? "—"} · {r.pregunta}
                                                            <br />
                                                            {r.sentimiento ?? "sin clasificar"}
                                                            {r.sentimientoScore != null
                                                                ? ` · score ${r.sentimientoScore.toFixed(2)}`
                                                                : ""}
                                                            {r.sentimientoMetodo != null
                                                                ? ` · ${r.sentimientoMetodo === "MODELO" ? "modelo" : "lexicón local"}`
                                                                : ""}
                                                        </footer>
                                                    </blockquote>
                                                ))}
                                            </div>
                                        </ChartCard>
                                    )}
                                </section>

                                <ChartCard
                                    title="Respuestas de esta encuesta"
                                    subtitle="Valor 1–5 elegido en cada pregunta"
                                >
                                    <PreguntasBar
                                        serie={{
                                            labels: encuestaGrafica.barrasPreguntas.map(
                                                (b) => `P${b.numero}`
                                            ),
                                            valores: encuestaGrafica.barrasPreguntas.map(
                                                (b) => b.valor
                                            ),
                                        }}
                                        detalle={encuestaGrafica.barrasPreguntas}
                                    />
                                </ChartCard>
                            </>
                        )}
                    </>
                )}

                {/* ============ Vista: administración del instrumento ============ */}
                {vista === "instrumento" && <InstrumentoAdmin />}
            </div>
        </main>
    );
}
