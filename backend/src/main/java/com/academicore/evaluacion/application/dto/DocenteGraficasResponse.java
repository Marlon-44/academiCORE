package com.academicore.evaluacion.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Gráficas globales de un docente: todas sus materias
 * (o una materia en específico si se filtra por asignaturaId).
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DocenteGraficasResponse {

    private Long docenteId;
    private String docenteNombre;
    private String numeroDocumento;

    private long totalEncuestas;
    private Double promedioGeneral;
    private String valoracion;

    /** Radar: promedio por categoría sobre todas las encuestas */
    private ChartSerie radarCategorias;

    /** Barras agrupadas: una entrada por cada evaluación (materia/grupo/periodo) */
    private List<ComparativoItem> comparativoMaterias;

    /** Línea de tiempo: promedio del docente por periodo académico */
    private ChartSerie evolucionPeriodos;

    /** Pie/dona: sentimiento de todos los comentarios */
    private ChartSerie sentimientos;

    private Double promedioSentimiento;

    /** Top 3 preguntas mejor valoradas */
    private List<PreguntaRanking> fortalezas;

    /** Top 3 preguntas con más oportunidad de mejora */
    private List<PreguntaRanking> oportunidades;

    private List<WordCloudItem> wordCloud;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class ComparativoItem {
        private Long evaluacionId;
        private Long asignaturaId;
        private String asignaturaCodigo;
        private String asignaturaNombre;
        private String grupo;
        private String periodo;
        private Double promedio;
        private long respondidas;
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class PreguntaRanking {
        private Integer numero;
        private String texto;
        private String categoria;
        private Double promedio;
    }
}
