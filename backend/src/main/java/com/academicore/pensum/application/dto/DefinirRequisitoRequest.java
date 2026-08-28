package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class DefinirRequisitoRequest {
    @NotNull
    Long planAsignaturaRequeridaId;

    @NotNull
    Long tipoRequisitoId;
}
