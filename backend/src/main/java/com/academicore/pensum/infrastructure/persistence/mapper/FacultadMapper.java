package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.EstadoFacultad;
import com.academicore.pensum.domain.model.Facultad;
import com.academicore.pensum.infrastructure.persistence.entity.FacultadEntity;

public final class FacultadMapper {

    private FacultadMapper() {}

    public static Facultad toDomain(FacultadEntity e) {
        if (e == null) return null;
        return Facultad.builder()
                .id(e.getId())
                .universidadId(e.getUniversidadId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .fechaCreacion(e.getFechaCreacion())
                .estado(EstadoFacultad.valueOf(e.getEstado()))
                .build();
    }

    public static FacultadEntity toEntity(Facultad d) {
        if (d == null) return null;
        return FacultadEntity.builder()
                .id(d.getId())
                .universidadId(d.getUniversidadId())
                .codigo(d.getCodigo())
                .nombre(d.getNombre())
                .fechaCreacion(d.getFechaCreacion())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoFacultad.ACTIVA.name())
                .build();
    }
}
