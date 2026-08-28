package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.NaturalezaAsignatura;
import com.academicore.pensum.infrastructure.persistence.entity.NaturalezaAsignaturaEntity;

public final class NaturalezaAsignaturaMapper {

    private NaturalezaAsignaturaMapper() {}

    public static NaturalezaAsignatura toDomain(NaturalezaAsignaturaEntity e) {
        if (e == null) return null;
        return NaturalezaAsignatura.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .descripcion(e.getDescripcion())
                .build();
    }

    public static NaturalezaAsignaturaEntity toEntity(NaturalezaAsignatura d) {
        if (d == null) return null;
        return NaturalezaAsignaturaEntity.builder()
                .id(d.getId())
                .codigo(d.getCodigo())
                .nombre(d.getNombre())
                .descripcion(d.getDescripcion())
                .build();
    }
}
