package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.NivelCurricular;
import com.academicore.pensum.infrastructure.persistence.entity.NivelCurricularEntity;

public final class NivelCurricularMapper {

    private NivelCurricularMapper() {}

    public static NivelCurricular toDomain(NivelCurricularEntity e) {
        if (e == null) return null;
        return NivelCurricular.builder()
                .id(e.getId())
                .planEstudiosId(e.getPlanEstudiosId())
                .numeroNivel(e.getNumeroNivel())
                .nombre(e.getNombre())
                .build();
    }

    public static NivelCurricularEntity toEntity(NivelCurricular d) {
        if (d == null) return null;
        return NivelCurricularEntity.builder()
                .id(d.getId())
                .planEstudiosId(d.getPlanEstudiosId())
                .numeroNivel(d.getNumeroNivel())
                .nombre(d.getNombre())
                .build();
    }
}
