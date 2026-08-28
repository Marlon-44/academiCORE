package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class CrearUniversidadRequest {
    @NotBlank
    @Size(max = 20)
    String codigo;

    @NotBlank
    @Size(max = 200)
    String nombre;
}
