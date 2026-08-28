package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class CambiarEstadoPensumRequest {
    @NotNull
    String nuevoEstado;
}
