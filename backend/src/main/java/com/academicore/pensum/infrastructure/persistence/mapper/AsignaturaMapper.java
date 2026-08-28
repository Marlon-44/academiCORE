package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.Asignatura;
import com.academicore.pensum.domain.model.EstadoAsignatura;
import com.academicore.pensum.infrastructure.persistence.entity.AsignaturaEntity;

public final class AsignaturaMapper {

    private AsignaturaMapper() {}

    public static Asignatura toDomain(AsignaturaEntity e) {
        if (e == null) return null;
        return Asignatura.builder()
                .id(e.getId())
                .departamentoId(e.getDepartamentoId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .descripcion(e.getDescripcion())
                .estado(EstadoAsignatura.valueOf(e.getEstado()))
                .fechaCreacion(e.getFechaCreacion())
                .build();
    }

    public static AsignaturaEntity toEntity(Asignatura d) {
        if (d == null) return null;
        return AsignaturaEntity.builder()
                .id(d.getId())
                .departamentoId(d.getDepartamentoId())
                .codigo(d.getCodigo())
                .nombre(d.getNombre())
                .descripcion(d.getDescripcion())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoAsignatura.ACTIVA.name())
                .fechaCreacion(d.getFechaCreacion())
                .build();
    }
}
