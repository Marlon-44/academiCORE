import type { EncuestaGraficaDTO } from "../../../services/evaluacionDocenteApi";
import type { Sentimiento } from "../types";

export type RespuestaTexto = EncuestaGraficaDTO["respuestasTexto"][number];

export interface ResumenSentimiento {
    conteo: Record<Sentimiento, number>;
    dominante: Sentimiento | null;
    promedio: number | null;
}

/** Sentimiento agregado de las respuestas abiertas de una encuesta. */
export function resumirSentimiento(textos: RespuestaTexto[]): ResumenSentimiento {
    const conteo = textos.reduce(
        (acc, r) => {
            if (r.sentimiento === "POSITIVO" || r.sentimiento === "NEUTRO" || r.sentimiento === "NEGATIVO") {
                acc[r.sentimiento] += 1;
            }
            return acc;
        },
        { POSITIVO: 0, NEUTRO: 0, NEGATIVO: 0 } as Record<Sentimiento, number>
    );

    const dominante =
        textos.length === 0
            ? null
            : (Object.entries(conteo).sort((a, b) => b[1] - a[1])[0][0] as Sentimiento);

    const scores = textos
        .map((r) => r.sentimientoScore)
        .filter((s): s is number => s != null);
    const promedio = scores.length > 0 ? scores.reduce((a, b) => a + b, 0) / scores.length : null;

    return { conteo, dominante, promedio };
}
