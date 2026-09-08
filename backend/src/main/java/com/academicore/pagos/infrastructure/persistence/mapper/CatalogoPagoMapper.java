package com.academicore.pagos.infrastructure.persistence.mapper;

import com.academicore.pagos.domain.model.ConceptoPago;
import com.academicore.pagos.domain.model.Moneda;
import com.academicore.pagos.infrastructure.persistence.entity.ConceptoPagoEntity;
import com.academicore.pagos.infrastructure.persistence.entity.MonedaEntity;

public final class CatalogoPagoMapper {

    private CatalogoPagoMapper() {}

    public static Moneda toDomain(MonedaEntity e) {
        if (e == null) return null;
        return Moneda.builder()
                .id(e.getId())
                .codigoIso(e.getCodigoIso())
                .nombre(e.getNombre())
                .simbolo(e.getSimbolo())
                .build();
    }

    public static ConceptoPago toDomain(ConceptoPagoEntity e) {
        if (e == null) return null;
        return ConceptoPago.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .build();
    }
}
