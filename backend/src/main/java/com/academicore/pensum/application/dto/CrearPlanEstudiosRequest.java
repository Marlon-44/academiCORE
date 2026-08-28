package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Value;

import java.time.LocalDate;

@Value
@Builder
public class CrearPlanEstudiosRequest {
    @NotNull
    Long programaId;

    @NotNull
    Long periodicidadId;

    @NotBlank
    @Size(max = 30)
    String codigoPensum;

    @Size(max = 150)
    String nombre;

    @Size(max = 50)
    String numeroResolucion;

    LocalDate fechaAprobacion;

    @NotNull
    LocalDate fechaVigenciaDesde;

    LocalDate fechaVigenciaHasta;

    @Positive
    int totalCreditos;
}
