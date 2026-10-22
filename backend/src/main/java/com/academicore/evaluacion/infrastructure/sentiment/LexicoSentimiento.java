package com.academicore.evaluacion.infrastructure.sentiment;

import java.text.Normalizer;
import java.util.Set;

/**
 * Fallback local de análisis de sentimiento: lexicón mínimo en español
 * para cuando el microservicio Python (sentiment-analysis-spanish) no está disponible.
 */
final class LexicoSentimiento {

    private static final Set<String> POSITIVAS = Set.of(
            "bueno", "buena", "excelente", "maravilloso", "maravillosa", "genial",
            "increible", "fantastico", "claro", "clara", "respetuoso", "respetuosa",
            "puntual", "dedicado", "dedicada", "comprometido", "comprometida",
            "recomiendo", "recomendado", "recomendada", "aprendi", "aprendizaje",
            "gracias", "mejor", "motiva", "motivador", "motivadora", "ayuda",
            "domina", "pendiente", "atento", "atenta", "explica", "facil",
            "organizado", "organizada", "positivo", "positiva", "encanta", "gusta");

    private static final Set<String> NEGATIVAS = Set.of(
            "malo", "mala", "pesimo", "pesima", "terrible", "horrible", "deficiente",
            "confuso", "confusa", "desorganizado", "desorganizada", "impuntual",
            "irrespetuoso", "irrespetuosa", "grosero", "grosera", "aburrido",
            "aburrida", "injusto", "injusta", "nunca", "tampoco", "peor",
            "reprobar", "perder", "dificil", "incompleto", "incompleta", "tardio",
            "inestable", "monotono", "monotona", "desmotiva", "desmotivador");

    private LexicoSentimiento() {}

    static Resultado clasificar(String texto) {
        String normalizado = Normalizer.normalize(texto.toLowerCase(), Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .replaceAll("[^a-zñ\\s]", " ");
        int positivos = 0;
        int negativos = 0;
        for (String token : normalizado.split("\\s+")) {
            if (POSITIVAS.contains(token)) positivos++;
            if (NEGATIVAS.contains(token)) negativos++;
        }
        double score;
        String etiqueta;
        if (positivos > negativos) {
            score = Math.min(0.5 + 0.15 * (positivos - negativos), 0.95);
            etiqueta = "POSITIVO";
        } else if (negativos > positivos) {
            score = Math.max(0.5 - 0.15 * (negativos - positivos), 0.05);
            etiqueta = "NEGATIVO";
        } else {
            score = 0.5;
            etiqueta = "NEUTRO";
        }
        return new Resultado(etiqueta, score);
    }

    record Resultado(String etiqueta, double score) {}
}
