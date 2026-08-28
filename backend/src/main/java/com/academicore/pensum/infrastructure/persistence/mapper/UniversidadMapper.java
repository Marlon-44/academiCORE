package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.EstadoUniversidad;
import com.academicore.pensum.domain.model.Universidad;
import com.academicore.pensum.infrastructure.persistence.entity.UniversidadEntity;

public final class UniversidadMapper {

    private UniversidadMapper() {}

    public static Universidad toDomain(UniversidadEntity e) {
        if (e == null) return null;
        return Universidad.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .fechaCreacion(e.getFechaCreacion())
                .estado(EstadoUniversidad.valueOf(e.getEstado()))
                .build();
    }

    public static UniversidadEntity toEntity(Universidad d) {
        if (d == null) return null;
        return UniversidadEntity.builder()
                .id(d.getId())
                .codigo(d.getCodigo())
                .nombre(d.getNombre())
                .fechaCreacion(d.getFechaCreacion())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoUniversidad.ACTIVA.name())
                .build();
    }
}
