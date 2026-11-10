import type { RespuestaTexto } from "../../utils";
import styles from "../../index.module.css";

function quoteClass(sentimiento: RespuestaTexto["sentimiento"]) {
    if (sentimiento === "NEGATIVO") return styles.quoteNegative;
    if (sentimiento === "NEUTRO") return styles.quoteNeutral;
    return styles.quotePositive;
}

/** Lista de respuestas abiertas con su análisis de sentimiento. */
export function RespuestasAbiertas({ respuestas }: { respuestas: RespuestaTexto[] }) {
    return (
        <div className={styles.quotes}>
            {respuestas.map((r, i) => (
                <blockquote
                    key={`${r.numero}-${i}`}
                    className={`${styles.quote} ${quoteClass(r.sentimiento)}`}
                >
                    <span className={styles.quoteMark}>“</span>
                    <p>{r.texto}</p>
                    <footer>
                        P{r.numero ?? "—"} · {r.pregunta}
                        <br />
                        {r.sentimiento ?? "sin clasificar"}
                        {r.sentimientoScore != null ? ` · score ${r.sentimientoScore.toFixed(2)}` : ""}
                        {r.sentimientoMetodo != null
                            ? ` · ${r.sentimientoMetodo === "MODELO" ? "modelo" : "lexicón local"}`
                            : ""}
                    </footer>
                </blockquote>
            ))}
        </div>
    );
}
