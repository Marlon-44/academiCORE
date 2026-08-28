package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class CrearProgramaRequest {
    @NotNull
    Long facultadId;

    @NotBlank
    @Size(max = 30)
    String codigoInterno;

    @Size(max = 20)
    String codigoSnies;

    @NotBlank
    @Size(max = 200)
    String nombre;

    @Positive
    Integer creditosTotales;
}
