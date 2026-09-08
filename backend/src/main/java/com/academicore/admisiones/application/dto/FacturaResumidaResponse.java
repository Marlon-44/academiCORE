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
public class FacturaResumidaResponse {

    private Long id;
    private String numeroFactura;
    private BigDecimal valor;
    private String moneda;
    private String estado;
}
