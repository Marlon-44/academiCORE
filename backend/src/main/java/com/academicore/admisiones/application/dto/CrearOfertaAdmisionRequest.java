package com.academicore.admisiones.application.dto;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CrearOfertaAdmisionRequest {

    @NotNull
    private Long periodoAdmisionId;

    @NotNull
    private Long programaId;

    @NotNull
    private Long planEstudiosId;

    @NotNull
    private Long campusId;

    @NotNull
    private Integer cuposTotales;

    @NotNull
    private BigDecimal valorInscripcion;

    @NotNull
    private String monedaCodigo;
}
