package com.academicore.evaluacion.application.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
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
public class CrearEvaluacionRequest {

    @NotNull
    private Long docenteId;

    @NotNull
    private Long asignaturaId;

    private Long programaId;

    private String grupo;

    @NotBlank
    private String periodo;

    @Positive
    private Integer estudiantesEsperados;
}
