import type { ReactNode } from "react";
import {
    ResponsiveContainer,
    PieChart,
    Pie,
    Cell,
    BarChart,
    Bar,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    RadarChart,
    PolarGrid,
    PolarAngleAxis,
    PolarRadiusAxis,
    Radar,
    Area,
    AreaChart,
    LabelList,
} from "recharts";
import type {
    ChartSerieDTO,
    DocenteGraficasDTO,
    EvaluacionGraficasDTO,
    WordCloudItemDTO,
} from "../../services/evaluacionDocenteApi";
import {
    CATEGORIA_COLORS,
    LIKERT_COLORS,
    SENTIMIENTO_COLORS,
    UC_COLORS,
} from "./palette";
import styles from "./index.module.css";

const SENTIMIENTO_LABELS: Record<string, string> = {
    POSITIVO: "Positivo",
    NEUTRO: "Neutro",
    NEGATIVO: "Negativo",
};

const VALORACION_STYLES: Record<string, string> = {
    Deficiente: styles.badgeRed,
    Regular: styles.badgeOrange,
    Bueno: styles.badgeYellow,
    "Muy bueno": styles.badgeTeal,
    Excelente: styles.badgePurple,
};

const TOOLTIP_STYLE = {
    borderRadius: "12px",
    border: "1px solid #eeedf2",
    boxShadow: "0 10px 30px rgba(11,20,47,.12)",
    fontSize: "0.8rem",
    padding: "10px 14px",
};

const AXIS_STYLE = {
    fontSize: 11,
    fill: "#8b8b9e",
    tickLine: false as const,
    axisLine: false as const,
};

/** Extrae el payload tipado de una entrada de tooltip de Recharts. */
const payloadOf = (item: unknown): Record<string, unknown> =>
    (item as { payload?: Record<string, unknown> })?.payload ?? {};

// ============================================================
// Piezas base
// ============================================================

export function ChartCard({
    title,
    subtitle,
    children,
    footer,
}: {
    title: string;
    subtitle?: string;
    children: ReactNode;
    footer?: ReactNode;
}) {
    return (
        <article className={styles.chartCard}>
            <header className={styles.chartCardHeader}>
                <h3>{title}</h3>
                {subtitle && <p>{subtitle}</p>}
            </header>
            <div className={styles.chartCardBody}>{children}</div>
            {footer && <footer className={styles.chartCardFooter}>{footer}</footer>}
        </article>
    );
}

export function ValoracionBadge({ valoracion }: { valoracion: string }) {
    const cls = VALORACION_STYLES[valoracion] ?? styles.badgePurple;
    return <span className={`${styles.badge} ${cls}`}>{valoracion}</span>;
}

export function EmptyChart({ message }: { message: string }) {
    return <div className={styles.emptyChart}>{message}</div>;
}

// ============================================================
// Gauge semicircular SVG (0-5 o porcentaje)
// ============================================================

export function GaugeChart({
    value,
    max = 5,
    label,
    color = UC_COLORS.purple,
    size = 190,
}: {
    value: number;
    max?: number;
    label: string;
    color?: string;
    size?: number;
}) {
    const pct = Math.max(0, Math.min(1, value / max));
    const r = size / 2 - 14;
    const cx = size / 2;
    const cy = size / 2 + 8;
    const angle = Math.PI * (1 - pct);
    const arc = (a: number) =>
        `${cx + r * Math.cos(Math.PI - a)} ${cy - r * Math.sin(Math.PI - a)}`;
    const large = pct > 0.5 ? 1 : 0;

    return (
        <div className={styles.gauge} style={{ width: size }}>
            <svg width={size} height={size / 2 + 26} viewBox={`0 0 ${size} ${size / 2 + 26}`}>
                <path
                    d={`M ${cx - r} ${cy} A ${r} ${r} 0 0 1 ${cx + r} ${cy}`}
                    fill="none"
                    stroke="#eeebf3"
                    strokeWidth={13}
                    strokeLinecap="round"
                />
                {pct > 0 && (
                    <path
                        d={`M ${cx - r} ${cy} A ${r} ${r} 0 ${large} 1 ${arc(angle)}`}
                        fill="none"
                        stroke={color}
                        strokeWidth={13}
                        strokeLinecap="round"
                        style={{ transition: "stroke-dashoffset .5s ease" }}
                    />
                )}
                <text
                    x={cx}
                    y={cy - 6}
                    textAnchor="middle"
                    className={styles.gaugeValue}
                    fill={color}
                >
                    {max === 100 ? `${Math.round(value)}%` : value.toFixed(2)}
                </text>
            </svg>
            <span className={styles.gaugeLabel}>{label}</span>
        </div>
    );
}

// ============================================================
// Radar por categorías
// ============================================================

export function CategoriaRadar({ data }: { data: ChartSerieDTO }) {
    if (!data.labels.length) return <EmptyChart message="Sin respuestas aún" />;
    const rows = data.labels.map((label, i) => ({
        categoria: label,
        promedio: data.valores[i],
    }));
    return (
        <ResponsiveContainer width="100%" height={300}>
            <RadarChart data={rows} outerRadius="72%">
                <PolarGrid stroke="#e6e3ef" />
                <PolarAngleAxis
                    dataKey="categoria"
                    tick={{ fontSize: 11, fill: "#4B317A", fontWeight: 700 }}
                />
                <PolarRadiusAxis
                    domain={[0, 5]}
                    tickCount={6}
                    tick={{ fontSize: 10, fill: "#b0aec0" }}
                    axisLine={false}
                />
                <Radar
                    dataKey="promedio"
                    stroke={UC_COLORS.purple}
                    fill={UC_COLORS.purple}
                    fillOpacity={0.25}
                    strokeWidth={2.5}
                    dot={{ r: 4, fill: UC_COLORS.purple, strokeWidth: 0 }}
                    isAnimationActive
                />
                <Tooltip
                    contentStyle={TOOLTIP_STYLE}
                    formatter={(v) => [Number(v).toFixed(2), "Promedio"]}
                />
            </RadarChart>
        </ResponsiveContainer>
    );
}

// ============================================================
// Dona de sentimientos
// ============================================================

export function SentimientoPie({
    data,
    promedio,
}: {
    data: ChartSerieDTO;
    promedio: number | null;
}) {
    const total = data.valores.reduce((a, b) => a + b, 0);
    if (total === 0) return <EmptyChart message="Sin comentarios analizados" />;

    const rows = data.labels.map((label, i) => ({
        name: SENTIMIENTO_LABELS[label] ?? label,
        key: label,
        value: data.valores[i],
    }));

    return (
        <div className={styles.donutWrap}>
            <ResponsiveContainer width="100%" height={240}>
                <PieChart>
                    <Pie
                        data={rows}
                        dataKey="value"
                        nameKey="name"
                        innerRadius={62}
                        outerRadius={92}
                        paddingAngle={4}
                        cornerRadius={6}
                        strokeWidth={0}
                        isAnimationActive
                    >
                        {rows.map((row) => (
                            <Cell key={row.key} fill={SENTIMIENTO_COLORS[row.key] ?? UC_COLORS.navy} />
                        ))}
                    </Pie>
                    <Tooltip
                        contentStyle={TOOLTIP_STYLE}
                        formatter={(v, name) => [`${v} comentarios`, String(name)]}
                    />
                </PieChart>
            </ResponsiveContainer>
            <div className={styles.donutCenter}>
                <strong>{promedio != null ? promedio.toFixed(2) : "—"}</strong>
                <span>score medio</span>
            </div>
            <ul className={styles.legendChips}>
                {rows.map((row) => (
                    <li key={row.key}>
                        <i style={{ background: SENTIMIENTO_COLORS[row.key] }} />
                        {row.name}
                        <b>{row.value}</b>
                    </li>
                ))}
            </ul>
        </div>
    );
}

// ============================================================
// Barras: promedio por pregunta (color por categoría)
// ============================================================

export function PreguntasBar({
    serie,
    detalle,
}: {
    serie: ChartSerieDTO;
    detalle?: { numero: number; texto: string; categoria: string }[];
}) {
    if (!serie.labels.length) return <EmptyChart message="Sin respuestas aún" />;
    const rows = serie.labels.map((label, i) => {
        const info = detalle?.find((d) => `P${d.numero}` === label);
        return {
            pregunta: label,
            promedio: serie.valores[i],
            categoria: info?.categoria ?? "",
            texto: info?.texto ?? "",
        };
    });
    return (
        <>
            <ResponsiveContainer width="100%" height={280}>
                <BarChart data={rows} margin={{ top: 18, right: 8, left: -18, bottom: 0 }}>
                    <CartesianGrid strokeDasharray="3 6" stroke="#eceaf2" vertical={false} />
                    <XAxis dataKey="pregunta" {...AXIS_STYLE} />
                    <YAxis domain={[0, 5]} tickCount={6} {...AXIS_STYLE} />
                    <Tooltip
                        contentStyle={TOOLTIP_STYLE}
                        cursor={{ fill: "rgba(75,49,122,.06)" }}
                        formatter={(v, _n, item) => [
                            `${Number(v).toFixed(2)} — ${payloadOf(item).categoria}`,
                            String(payloadOf(item).texto || payloadOf(item).pregunta),
                        ]}
                        labelFormatter={() => ""}
                    />
                    <Bar dataKey="promedio" radius={[8, 8, 0, 0]} maxBarSize={38} isAnimationActive>
                        {rows.map((row) => (
                            <Cell
                                key={row.pregunta}
                                fill={CATEGORIA_COLORS[row.categoria] ?? UC_COLORS.purple}
                            />
                        ))}
                        <LabelList
                            dataKey="promedio"
                            position="top"
                            formatter={(v: unknown) => Number(v).toFixed(1)}
                            style={{ fontSize: 10, fill: "#8b8b9e", fontWeight: 700 }}
                        />
                    </Bar>
                </BarChart>
            </ResponsiveContainer>
            <ul className={styles.legendChips}>
                {Object.entries(CATEGORIA_COLORS).map(([cat, color]) => (
                    <li key={cat}>
                        <i style={{ background: color }} />
                        {cat.charAt(0) + cat.slice(1).toLowerCase()}
                    </li>
                ))}
            </ul>
        </>
    );
}

// ============================================================
// Barras apiladas: distribución Likert por pregunta
// ============================================================

export function LikertStackedBar({
    data,
}: {
    data: EvaluacionGraficasDTO["distribucionPorPregunta"];
}) {
    if (!data.length) return <EmptyChart message="Sin respuestas aún" />;
    const rows = data.map((d) => ({
        pregunta: `P${d.numero}`,
        "1": d.distribucion[0] ?? 0,
        "2": d.distribucion[1] ?? 0,
        "3": d.distribucion[2] ?? 0,
        "4": d.distribucion[3] ?? 0,
        "5": d.distribucion[4] ?? 0,
        texto: d.texto,
    }));
    return (
        <>
            <ResponsiveContainer width="100%" height={300}>
                <BarChart data={rows} margin={{ top: 8, right: 8, left: -22, bottom: 0 }}>
                    <CartesianGrid strokeDasharray="3 6" stroke="#eceaf2" vertical={false} />
                    <XAxis dataKey="pregunta" {...AXIS_STYLE} />
                    <YAxis allowDecimals={false} {...AXIS_STYLE} />
                    <Tooltip
                        contentStyle={TOOLTIP_STYLE}
                        cursor={{ fill: "rgba(75,49,122,.06)" }}
                        labelFormatter={(_l, payload) =>
                            String(payloadOf(payload?.[0]).texto ?? "")
                        }
                        formatter={(v, name) => [v, `Valoración ${String(name)}`]}
                    />
                    {["1", "2", "3", "4", "5"].map((v, i) => (
                        <Bar
                            key={v}
                            dataKey={v}
                            stackId="likert"
                            fill={LIKERT_COLORS[i]}
                            maxBarSize={34}
                            isAnimationActive
                            radius={i === 4 ? [6, 6, 0, 0] : 0}
                        />
                    ))}
                </BarChart>
            </ResponsiveContainer>
            <ul className={styles.legendChips}>
                {LIKERT_COLORS.map((color, i) => (
                    <li key={i}>
                        <i style={{ background: color }} />
                        {i + 1} {i === 0 ? "estrella" : "estrellas"}
                    </li>
                ))}
            </ul>
        </>
    );
}

// ============================================================
// Histograma Likert global
// ============================================================

export function LikertHistogram({ data }: { data: ChartSerieDTO }) {
    const rows = data.labels.map((label, i) => ({
        valor: `${label}★`,
        cantidad: data.valores[i],
        idx: i,
    }));
    return (
        <ResponsiveContainer width="100%" height={240}>
            <BarChart data={rows} margin={{ top: 18, right: 8, left: -22, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 6" stroke="#eceaf2" vertical={false} />
                <XAxis dataKey="valor" {...AXIS_STYLE} />
                <YAxis allowDecimals={false} {...AXIS_STYLE} />
                <Tooltip
                    contentStyle={TOOLTIP_STYLE}
                    cursor={{ fill: "rgba(75,49,122,.06)" }}
                    formatter={(v) => [`${v} respuestas`, "Cantidad"]}
                    labelFormatter={() => ""}
                />
                <Bar dataKey="cantidad" radius={[8, 8, 0, 0]} maxBarSize={56} isAnimationActive>
                    {rows.map((row) => (
                        <Cell key={row.valor} fill={LIKERT_COLORS[row.idx]} />
                    ))}
                    <LabelList
                        dataKey="cantidad"
                        position="top"
                        style={{ fontSize: 11, fill: "#8b8b9e", fontWeight: 700 }}
                    />
                </Bar>
            </BarChart>
        </ResponsiveContainer>
    );
}

// ============================================================
// Comparativo de materias (barras horizontales)
// ============================================================

export function ComparativoMateriasBar({
    data,
}: {
    data: DocenteGraficasDTO["comparativoMaterias"];
}) {
    if (!data.length) return <EmptyChart message="Sin evaluaciones registradas" />;
    const rows = data.map((d) => ({
        materia: d.asignaturaCodigo ?? `#${d.asignaturaId}`,
        nombre: d.asignaturaNombre ?? "",
        grupo: d.grupo,
        promedio: d.promedio,
        respondidas: d.respondidas,
    }));
    return (
        <ResponsiveContainer width="100%" height={Math.max(200, rows.length * 64)}>
            <BarChart data={rows} layout="vertical" margin={{ top: 4, right: 44, left: 12, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 6" stroke="#eceaf2" horizontal={false} />
                <XAxis type="number" domain={[0, 5]} tickCount={6} {...AXIS_STYLE} />
                <YAxis
                    type="category"
                    dataKey="materia"
                    width={92}
                    {...AXIS_STYLE}
                    tick={{ ...AXIS_STYLE, fontWeight: 700, fill: "#4B317A" }}
                />
                <Tooltip
                    contentStyle={TOOLTIP_STYLE}
                    cursor={{ fill: "rgba(75,49,122,.06)" }}
                    formatter={(v, _n, item) => [
                        `${Number(v).toFixed(2)} (${payloadOf(item).respondidas} encuestas — grupo ${payloadOf(item).grupo})`,
                        String(payloadOf(item).nombre || payloadOf(item).materia),
                    ]}
                    labelFormatter={() => ""}
                />
                <Bar dataKey="promedio" radius={[0, 8, 8, 0]} maxBarSize={30} isAnimationActive>
                    {rows.map((row) => (
                        <Cell
                            key={row.materia + row.grupo}
                            fill={
                                row.promedio >= 4.5
                                    ? UC_COLORS.purple
                                    : row.promedio >= 4
                                      ? UC_COLORS.teal
                                      : row.promedio >= 3.5
                                        ? UC_COLORS.yellow
                                        : row.promedio >= 3
                                          ? UC_COLORS.orange
                                          : UC_COLORS.red
                            }
                        />
                    ))}
                    <LabelList
                        dataKey="promedio"
                        position="right"
                        formatter={(v: unknown) => Number(v).toFixed(2)}
                        style={{ fontSize: 11, fill: "#4B317A", fontWeight: 800 }}
                    />
                </Bar>
            </BarChart>
        </ResponsiveContainer>
    );
}

// ============================================================
// Evolución por periodo (área + línea)
// ============================================================

export function EvolucionArea({ data }: { data: ChartSerieDTO }) {
    if (data.labels.length < 1) return <EmptyChart message="Sin datos por periodo" />;
    const rows = data.labels.map((label, i) => ({
        periodo: label,
        promedio: data.valores[i],
    }));
    return (
        <ResponsiveContainer width="100%" height={260}>
            <AreaChart data={rows} margin={{ top: 18, right: 14, left: -18, bottom: 0 }}>
                <defs>
                    <linearGradient id="evolucionGradient" x1="0" y1="0" x2="0" y2="1">
                        <stop offset="0%" stopColor={UC_COLORS.teal} stopOpacity={0.45} />
                        <stop offset="100%" stopColor={UC_COLORS.teal} stopOpacity={0.02} />
                    </linearGradient>
                </defs>
                <CartesianGrid strokeDasharray="3 6" stroke="#eceaf2" vertical={false} />
                <XAxis dataKey="periodo" {...AXIS_STYLE} />
                <YAxis domain={[0, 5]} tickCount={6} {...AXIS_STYLE} />
                <Tooltip
                    contentStyle={TOOLTIP_STYLE}
                    formatter={(v) => [Number(v).toFixed(2), "Promedio"]}
                    labelFormatter={(l) => `Periodo ${l}`}
                />
                <Area
                    type="monotone"
                    dataKey="promedio"
                    stroke={UC_COLORS.teal}
                    strokeWidth={2.5}
                    fill="url(#evolucionGradient)"
                    dot={{ r: 5, fill: "#fff", stroke: UC_COLORS.teal, strokeWidth: 2.5 }}
                    activeDot={{ r: 7, fill: UC_COLORS.teal, stroke: "#fff", strokeWidth: 2 }}
                    isAnimationActive
                />
            </AreaChart>
        </ResponsiveContainer>
    );
}

// ============================================================
// Ranking de preguntas (fortalezas / oportunidades)
// ============================================================

export function RankingList({
    items,
    accent,
}: {
    items: DocenteGraficasDTO["fortalezas"];
    accent: "teal" | "red";
}) {
    if (!items.length) return <EmptyChart message="Sin respuestas aún" />;
    return (
        <ul className={styles.rankingList}>
            {items.map((item) => (
                <li key={item.numero}>
                    <div className={styles.rankingHead}>
                        <span className={`${styles.rankingNum} ${styles[`ranking_${accent}`]}`}>
                            P{item.numero}
                        </span>
                        <span className={styles.rankingText}>{item.texto}</span>
                        <b className={styles.rankingValue}>{item.promedio.toFixed(2)}</b>
                    </div>
                    <div className={styles.rankingTrack}>
                        <div
                            className={`${styles.rankingFill} ${styles[`fill_${accent}`]}`}
                            style={{ width: `${(item.promedio / 5) * 100}%` }}
                        />
                    </div>
                </li>
            ))}
        </ul>
    );
}

// ============================================================
// Nube de palabras
// ============================================================

export function WordCloud({ data }: { data: WordCloudItemDTO[] }) {
    if (!data.length) return <EmptyChart message="Sin comentarios para analizar" />;
    const max = Math.max(...data.map((w) => w.peso));
    const min = Math.min(...data.map((w) => w.peso));
    const colors = [
        UC_COLORS.purple,
        UC_COLORS.teal,
        UC_COLORS.orange,
        UC_COLORS.red,
        UC_COLORS.navy,
        UC_COLORS.yellow,
    ];
    return (
        <div className={styles.wordCloud}>
            {data.map((w, i) => {
                const t = max === min ? 1 : (w.peso - min) / (max - min);
                const size = 0.8 + t * 1.5;
                return (
                    <span
                        key={w.texto}
                        className={styles.wordTag}
                        style={{ fontSize: `${size}rem`, color: colors[i % colors.length] }}
                        title={`${w.peso} menciones`}
                    >
                        {w.texto}
                        <sub>{w.peso}</sub>
                    </span>
                );
            })}
        </div>
    );
}

// ============================================================
// Comentarios destacados
// ============================================================

export function ComentariosDestacados({
    data,
}: {
    data: EvaluacionGraficasDTO["comentariosDestacados"];
}) {
    if (!data || (!data.masPositivo && !data.masNegativo)) {
        return <EmptyChart message="Sin comentarios registrados" />;
    }
    return (
        <div className={styles.quotes}>
            {data.masPositivo && (
                <blockquote className={`${styles.quote} ${styles.quotePositive}`}>
                    <span className={styles.quoteMark}>“</span>
                    <p>{data.masPositivo}</p>
                    <footer>Comentario más positivo</footer>
                </blockquote>
            )}
            {data.masNegativo && (
                <blockquote className={`${styles.quote} ${styles.quoteNegative}`}>
                    <span className={styles.quoteMark}>“</span>
                    <p>{data.masNegativo}</p>
                    <footer>Comentario con más oportunidad</footer>
                </blockquote>
            )}
        </div>
    );
}
