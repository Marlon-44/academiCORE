package com.academicore.evaluacion.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/** Reporte completo para el docente: todas las respuestas de texto
 *  que los estudiantes escribieron sobre él, agrupadas por evaluación. */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DocenteReporteResponse {

    private Long docenteId;
    private String docenteNombre;
    private String numeroDocumento;
    private long totalEncuestas;
    private Double promedioGeneral;
    private String valoracion;
    private List<EvaluacionReporte> evaluaciones;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class EvaluacionReporte {
        private Long evaluacionId;
        private String asignaturaCodigo;
        private String asignaturaNombre;
        private String grupo;
        private String periodo;
        private long encuestas;
        private Double promedio;
        private List<ComentarioItem> comentarios;
    }

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class ComentarioItem {
        private Long encuestaId;
        private Integer numero;
        private String pregunta;
        private String texto;
        private String sentimiento;
        private Double sentimientoScore;
        private String sentimientoMetodo;
    }
}
