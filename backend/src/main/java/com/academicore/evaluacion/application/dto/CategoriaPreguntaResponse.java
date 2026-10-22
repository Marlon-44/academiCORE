package com.academicore.evaluacion.application.dto;

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
public class CategoriaPreguntaResponse {

    private Long id;
    private String codigo;
    private String nombre;
    private int orden;
    private long totalPreguntas;
}
