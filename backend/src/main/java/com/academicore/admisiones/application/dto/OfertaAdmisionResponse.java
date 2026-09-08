package com.academicore.admisiones.application.dto;

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
public class OfertaAdmisionResponse {

    private Long id;
    private Long periodoAdmisionId;
    private String periodoCodigo;
    private Long programaId;
    private String programaNombre;
    private String programaCodigoSnies;
    private Long planEstudiosId;
    private String planEstudiosCodigo;
    private Long campusId;
    private String campusCodigo;
    private String campusNombre;
    private int cuposTotales;
    private int cuposDisponibles;
    private BigDecimal valorInscripcion;
    private String monedaCodigo;
    private String estado;
}
