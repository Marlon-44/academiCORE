package com.academicore.evaluacion.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Gráficas de una única encuesta respondida:
 * radar por categoría + barras por pregunta + sentimiento del comentario.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EncuestaGraficaResponse {

    private Long encuestaId;
    private Long evaluacionId;
    private LocalDateTime fechaRespuesta;
    private Double promedioGeneral;
    private String valoracion;

    /** Radar: labels = categorías, valores = promedio 1-5 */
    private ChartSerie radarCategorias;

    /** Barras: una entrada por pregunta Likert contestada */
    private List<BarraPregunta> barrasPreguntas;

    /** Respuestas de texto abierto con su análisis de sentimiento */
    private List<RespuestaTextoItem> respuestasTexto;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class BarraPregunta {
        private Long preguntaId;
        private Integer numero;
        private String texto;
        private String categoria;
        private Integer valor;
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class RespuestaTextoItem {
        private Integer numero;
        private String pregunta;
        private String texto;
        private String sentimiento;
        private Double sentimientoScore;
        private String sentimientoMetodo;
    }
}
