package com.academicore.evaluacion.application.dto;

import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
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
public class ActualizarPreguntaRequest {

    private String categoriaCodigo;

    @Positive
    private Integer numero;

    @Size(max = 300)
    private String texto;

    private String tipo;
}
