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
public class PreguntaEvaluacion {

    private Long id;
    private Long categoriaId;
    private String categoriaCodigo;
    private String categoriaNombre;
    private Integer numero;
    private String texto;
    private TipoPregunta tipo;
    private String estado;
}
