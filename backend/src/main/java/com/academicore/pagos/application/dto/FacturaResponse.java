package com.academicore.pagos.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FacturaResponse {

    private Long id;
    private String numeroFactura;
    private String concepto;
    private BigDecimal valor;
    private String moneda;
    private LocalDateTime fechaEmision;
    private LocalDateTime fechaVencimiento;
    private String estado;
    private Long inscripcionId;
}
