package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.TipoAsignaturaPlan;
import com.academicore.pensum.infrastructure.persistence.entity.TipoAsignaturaPlanEntity;

public final class TipoAsignaturaPlanMapper {

    private TipoAsignaturaPlanMapper() {}

    public static TipoAsignaturaPlan toDomain(TipoAsignaturaPlanEntity e) {
        if (e == null) return null;
        return TipoAsignaturaPlan.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .build();
    }
}
