package com.academicore.evaluacion.domain.repository;

/**
 * Puerto de salida hacia el servicio de análisis de sentimiento en español
 * (microservicio Python que envuelve la librería sentiment-analysis-spanish).
 */
public interface SentimentAnalysisPort {

    SentimentResult analizar(String texto);

    /**
     * @param sentimiento POSITIVO | NEGATIVO | NEUTRO
     * @param score       probabilidad del modelo en rango [0,1]
     * @param metodo      MODELO (microservicio) o LEXICO (fallback local)
     */
    record SentimentResult(String sentimiento, Double score, String metodo) {
    }
}
