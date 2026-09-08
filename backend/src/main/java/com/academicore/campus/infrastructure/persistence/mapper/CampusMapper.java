package com.academicore.campus.infrastructure.persistence.mapper;

import com.academicore.campus.domain.model.Campus;
import com.academicore.campus.domain.model.EstadoCampus;
import com.academicore.campus.infrastructure.persistence.entity.CampusEntity;

public final class CampusMapper {

    private CampusMapper() {}

    public static Campus toDomain(CampusEntity e) {
        if (e == null) return null;
        return Campus.builder()
                .id(e.getId())
                .universidadId(e.getUniversidadId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .direccion(e.getDireccion())
                .ciudad(e.getCiudad())
                .descripcion(e.getDescripcion())
                .estado(EstadoCampus.valueOf(e.getEstado()))
                .esSedePrincipal(e.isEsSedePrincipal())
                .orden(e.getOrden())
                .urlMapa(e.getUrlMapa())
                .build();
    }

    public static CampusEntity toEntity(Campus d) {
        if (d == null) return null;
        return CampusEntity.builder()
                .id(d.getId())
                .universidadId(d.getUniversidadId())
                .codigo(d.getCodigo())
                .nombre(d.getNombre())
                .direccion(d.getDireccion())
                .ciudad(d.getCiudad() != null ? d.getCiudad() : "Cartagena")
                .descripcion(d.getDescripcion())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoCampus.ACTIVO.name())
                .esSedePrincipal(d.isEsSedePrincipal())
                .orden(d.getOrden())
                .urlMapa(d.getUrlMapa())
                .build();
    }
}
