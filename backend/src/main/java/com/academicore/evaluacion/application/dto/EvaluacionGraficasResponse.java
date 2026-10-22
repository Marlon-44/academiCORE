package com.academicore.evaluacion.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Gráficas agregadas de TODAS las encuestas de una evaluación
 * (un docente, una materia, un grupo y un periodo).
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EvaluacionGraficasResponse {

    private Long evaluacionId;
    private Long docenteId;
    private String docenteNombre;
    private Long asignaturaId;
    private String asignaturaCodigo;
    private String asignaturaNombre;
    private String grupo;
    private String periodo;

    /** Gauge: respondidas vs esperadas */
    private ParticipacionInfo participacion;

    private Double promedioGeneral;
    private String valoracion;

    /** Radar: promedio por categoría */
    private ChartSerie radarCategorias;

    /** Barras: promedio por pregunta */
    private ChartSerie barrasPromedioPreguntas;

    /** Histograma Likert global: labels 1-5, valores = conteos */
    private ChartSerie distribucionLikert;

    /** Stacked bar: distribución 1-5 por cada pregunta */
    private List<DistribucionPregunta> distribucionPorPregunta;

    /** Pie/dona: conteo de comentarios por sentimiento */
    private ChartSerie sentimientos;

    private Double promedioSentimiento;

    /** Nube de palabras de los comentarios (top 20) */
    private List<WordCloudItem> wordCloud;

    private ComentariosDestacados comentariosDestacados;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class ParticipacionInfo {
        private Integer esperados;
        private long respondidas;
        private Double porcentaje;
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class DistribucionPregunta {
        private Integer numero;
        private String texto;
        private String categoria;
        private List<Double> distribucion;
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class ComentariosDestacados {
        private String masPositivo;
        private String masNegativo;
    }
}
