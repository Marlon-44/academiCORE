package com.academicore.evaluacion.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RespuestaPregunta {

    private Long id;
    private Long encuestaId;
    private Long preguntaId;
    private Integer valor;
    private String textoRespuesta;
    private Sentimiento sentimiento;
    private Double sentimientoScore;
    private MetodoSentimiento sentimientoMetodo;
}
