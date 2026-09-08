package com.academicore.admisiones.domain.model;

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
public class OfertaAdmision {

    private Long id;
    private Long periodoAdmisionId;
    private Long programaId;
    private Long planEstudiosId;
    private Long campusId;
    private int cuposTotales;
    private int cuposDisponibles;
    private BigDecimal valorInscripcion;
    private Long monedaId;
    private EstadoOfertaAdmision estado;
}
