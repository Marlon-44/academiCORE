package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.PeriodicidadAcademica;
import com.academicore.pensum.infrastructure.persistence.entity.PeriodicidadAcademicaEntity;

public final class PeriodicidadAcademicaMapper {

    private PeriodicidadAcademicaMapper() {}

    public static PeriodicidadAcademica toDomain(PeriodicidadAcademicaEntity e) {
        if (e == null) return null;
        return PeriodicidadAcademica.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .duracionMeses(e.getDuracionMeses())
                .build();
    }
}
