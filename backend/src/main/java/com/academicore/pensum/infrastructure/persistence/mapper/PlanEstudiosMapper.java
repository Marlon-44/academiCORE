package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.model.NivelCurricular;
import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.infrastructure.persistence.entity.NivelCurricularEntity;
import com.academicore.pensum.infrastructure.persistence.entity.PlanEstudiosEntity;

import java.util.ArrayList;
import java.util.List;

public final class PlanEstudiosMapper {

    private PlanEstudiosMapper() {}

    public static PlanEstudios toDomain(PlanEstudiosEntity e) {
        if (e == null) return null;
        return toDomain(e, false);
    }

    public static PlanEstudios toDomainWithNiveles(PlanEstudiosEntity e) {
        if (e == null) return null;
        return toDomain(e, true);
    }

    private static PlanEstudios toDomain(PlanEstudiosEntity e, boolean includeNiveles) {
        PlanEstudios plan = PlanEstudios.builder()
                .id(e.getId())
                .programaId(e.getProgramaId())
                .periodicidadId(e.getPeriodicidadId())
                .codigoPensum(e.getCodigoPensum())
                .nombre(e.getNombre())
                .numeroResolucion(e.getNumeroResolucion())
                .fechaAprobacion(e.getFechaAprobacion())
                .fechaVigenciaDesde(e.getFechaVigenciaDesde())
                .fechaVigenciaHasta(e.getFechaVigenciaHasta())
                .totalCreditos(e.getTotalCreditos())
                .estado(EstadoPensum.valueOf(e.getEstado()))
                .build();

        if (includeNiveles && e.getNivelesCurriculares() != null) {
            List<NivelCurricular> niveles = new ArrayList<>();
            for (NivelCurricularEntity ne : e.getNivelesCurriculares()) {
                niveles.add(NivelCurricularMapper.toDomain(ne));
            }
            plan.getNivelesCurriculares().addAll(niveles);
        }

        return plan;
    }

    public static PlanEstudiosEntity toEntity(PlanEstudios d) {
        if (d == null) return null;
        return PlanEstudiosEntity.builder()
                .id(d.getId())
                .programaId(d.getProgramaId())
                .periodicidadId(d.getPeriodicidadId())
                .codigoPensum(d.getCodigoPensum())
                .nombre(d.getNombre())
                .numeroResolucion(d.getNumeroResolucion())
                .fechaAprobacion(d.getFechaAprobacion())
                .fechaVigenciaDesde(d.getFechaVigenciaDesde())
                .fechaVigenciaHasta(d.getFechaVigenciaHasta())
                .totalCreditos(d.getTotalCreditos())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoPensum.EN_DISENO.name())
                .build();
    }
}
