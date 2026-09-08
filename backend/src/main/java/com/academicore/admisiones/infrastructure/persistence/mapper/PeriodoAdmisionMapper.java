package com.academicore.admisiones.infrastructure.persistence.mapper;

import com.academicore.admisiones.domain.model.EstadoPeriodoAdmision;
import com.academicore.admisiones.domain.model.PeriodoAdmision;
import com.academicore.admisiones.infrastructure.persistence.entity.PeriodoAdmisionEntity;

public final class PeriodoAdmisionMapper {

    private PeriodoAdmisionMapper() {}

    public static PeriodoAdmision toDomain(PeriodoAdmisionEntity e) {
        if (e == null) return null;
        return PeriodoAdmision.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .fechaInicioInscripciones(e.getFechaInicioInscripciones())
                .fechaFinInscripciones(e.getFechaFinInscripciones())
                .fechaInicioClases(e.getFechaInicioClases())
                .estado(EstadoPeriodoAdmision.valueOf(e.getEstado()))
                .build();
    }

    public static PeriodoAdmisionEntity toEntity(PeriodoAdmision d) {
        if (d == null) return null;
        return PeriodoAdmisionEntity.builder()
                .id(d.getId())
                .codigo(d.getCodigo())
                .nombre(d.getNombre())
                .fechaInicioInscripciones(d.getFechaInicioInscripciones())
                .fechaFinInscripciones(d.getFechaFinInscripciones())
                .fechaInicioClases(d.getFechaInicioClases())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoPeriodoAdmision.PROGRAMADO.name())
                .build();
    }
}
