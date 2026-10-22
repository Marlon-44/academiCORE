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
public class PreguntaResponse {

    private Long id;
    private Integer numero;
    private String texto;
    private String tipo;
    private String categoriaCodigo;
    private String categoriaNombre;
    private String estado;
}
