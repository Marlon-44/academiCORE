package com.academicore.pagos.infrastructure.persistence.mapper;

import com.academicore.pagos.domain.model.Factura;
import com.academicore.pagos.infrastructure.persistence.entity.FacturaEntity;

public final class FacturaMapper {

    private FacturaMapper() {}

    public static Factura toDomain(FacturaEntity e) {
        if (e == null) return null;
        return Factura.builder()
                .id(e.getId())
                .inscripcionId(e.getInscripcionId())
                .conceptoPagoId(e.getConceptoPagoId())
                .monedaId(e.getMonedaId())
                .numeroFactura(e.getNumeroFactura())
                .valor(e.getValor())
                .fechaEmision(e.getFechaEmision())
                .fechaVencimiento(e.getFechaVencimiento())
                .estado(e.getEstado())
                .build();
    }

    public static FacturaEntity toEntity(Factura d) {
        if (d == null) return null;
        return FacturaEntity.builder()
                .id(d.getId())
                .inscripcionId(d.getInscripcionId())
                .conceptoPagoId(d.getConceptoPagoId())
                .monedaId(d.getMonedaId())
                .numeroFactura(d.getNumeroFactura())
                .valor(d.getValor())
                .fechaEmision(d.getFechaEmision())
                .fechaVencimiento(d.getFechaVencimiento())
                .estado(d.getEstado() != null ? d.getEstado() : "PENDIENTE")
                .build();
    }
}
