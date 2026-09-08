package com.academicore.pagos.domain.model;

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
public class Factura {

    private Long id;
    private Long inscripcionId;
    private Long conceptoPagoId;
    private Long monedaId;
    private String numeroFactura;
    private BigDecimal valor;
    private LocalDateTime fechaEmision;
    private LocalDateTime fechaVencimiento;
    private String estado;
}
