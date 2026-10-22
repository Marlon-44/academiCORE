package com.academicore.evaluacion.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EncuestaResponse {

    private Long id;
    private Long evaluacionId;
    private LocalDateTime fechaRespuesta;
    private Double promedio;
    private String valoracion;
    private List<RespuestaItem> respuestas;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class RespuestaItem {
        private Long preguntaId;
        private Integer valor;
        private String textoRespuesta;
        private String sentimiento;
        private Double sentimientoScore;
        private String sentimientoMetodo;
    }
}
