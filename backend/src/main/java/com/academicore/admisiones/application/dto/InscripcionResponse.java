package com.academicore.admisiones.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InscripcionResponse {

    private Long id;
    private Long aspiranteId;
    private String aspiranteNombres;
    private String aspiranteApellidos;
    private Long ofertaAdmisionId;
    private LocalDateTime fechaInscripcion;
    private String estado;
    private String observaciones;
    private FacturaResumidaResponse factura;
}
