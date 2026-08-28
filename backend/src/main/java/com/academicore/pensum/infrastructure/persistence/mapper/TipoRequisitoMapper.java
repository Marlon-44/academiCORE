package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.TipoRequisito;
import com.academicore.pensum.infrastructure.persistence.entity.TipoRequisitoEntity;

public final class TipoRequisitoMapper {

    private TipoRequisitoMapper() {}

    public static TipoRequisito toDomain(TipoRequisitoEntity e) {
        if (e == null) return null;
        return TipoRequisito.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .build();
    }
}
