package com.academicore.evaluacion.application.dto;

import jakarta.validation.constraints.NotBlank;
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
public class CrearPreguntaRequest {

    @NotBlank
    private String categoriaCodigo;

    @Positive
    private Integer numero;

    @NotBlank
    @Size(max = 300)
    private String texto;

    /** LIKERT (escala 1-5) o TEXTO (abierta, con análisis de sentimiento). Por defecto LIKERT. */
    private String tipo;
}
