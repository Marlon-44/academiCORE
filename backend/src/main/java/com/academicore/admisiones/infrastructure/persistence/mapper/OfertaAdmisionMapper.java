package com.academicore.admisiones.infrastructure.persistence.mapper;

import com.academicore.admisiones.domain.model.EstadoOfertaAdmision;
import com.academicore.admisiones.domain.model.OfertaAdmision;
import com.academicore.admisiones.infrastructure.persistence.entity.OfertaAdmisionEntity;

public final class OfertaAdmisionMapper {

    private OfertaAdmisionMapper() {}

    public static OfertaAdmision toDomain(OfertaAdmisionEntity e) {
        if (e == null) return null;
        return OfertaAdmision.builder()
                .id(e.getId())
                .periodoAdmisionId(e.getPeriodoAdmisionId())
                .programaId(e.getProgramaId())
                .planEstudiosId(e.getPlanEstudiosId())
                .campusId(e.getCampusId())
                .cuposTotales(e.getCuposTotales())
                .cuposDisponibles(e.getCuposDisponibles())
                .valorInscripcion(e.getValorInscripcion())
                .monedaId(e.getMonedaId())
                .estado(EstadoOfertaAdmision.valueOf(e.getEstado()))
                .build();
    }

    public static OfertaAdmisionEntity toEntity(OfertaAdmision d) {
        if (d == null) return null;
        return OfertaAdmisionEntity.builder()
                .id(d.getId())
                .periodoAdmisionId(d.getPeriodoAdmisionId())
                .programaId(d.getProgramaId())
                .planEstudiosId(d.getPlanEstudiosId())
                .campusId(d.getCampusId())
                .cuposTotales(d.getCuposTotales())
                .cuposDisponibles(d.getCuposDisponibles())
                .valorInscripcion(d.getValorInscripcion())
                .monedaId(d.getMonedaId())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoOfertaAdmision.ACTIVA.name())
                .build();
    }
}
