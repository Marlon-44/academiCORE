package com.academicore.pensum.application.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Builder;
import lombok.Value;

import java.math.BigDecimal;

@Value
@Builder
public class AgregarAsignaturaAPlanRequest {
    @NotNull
    Long asignaturaId;

    @NotNull
    Long nivelCurricularId;

    @NotNull
    Long tipoAsignaturaId;

    @NotNull
    @Positive
    BigDecimal creditos;

    BigDecimal horasDocenciaSemanales;

    BigDecimal horasTrabajoIndependiente;

    boolean esHabilitable;
}
