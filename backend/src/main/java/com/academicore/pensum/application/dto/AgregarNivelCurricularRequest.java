package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class AgregarNivelCurricularRequest {
    @NotNull
    @Min(1)
    int numeroNivel;

    @Size(max = 100)
    String nombre;
}
