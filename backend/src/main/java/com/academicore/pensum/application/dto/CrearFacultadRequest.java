package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class CrearFacultadRequest {
    @NotNull
    Long universidadId;

    @NotBlank
    @Size(max = 20)
    String codigo;

    @NotBlank
    @Size(max = 150)
    String nombre;
}
