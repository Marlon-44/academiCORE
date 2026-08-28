package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class RegistrarAsignaturaRequest {
    @NotNull
    Long departamentoId;

    @NotBlank
    @Size(max = 30)
    String codigo;

    @NotBlank
    @Size(max = 200)
    String nombre;

    @Size(max = 5000)
    String descripcion;
}
