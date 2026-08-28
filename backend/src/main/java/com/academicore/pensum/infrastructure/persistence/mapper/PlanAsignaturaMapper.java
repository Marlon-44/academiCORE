package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.PlanAsignatura;
import com.academicore.pensum.infrastructure.persistence.entity.PlanAsignaturaEntity;

public final class PlanAsignaturaMapper {

    private PlanAsignaturaMapper() {}

    public static PlanAsignatura toDomain(PlanAsignaturaEntity e) {
        if (e == null) return null;
        return PlanAsignatura.builder()
                .id(e.getId())
                .planEstudiosId(e.getPlanEstudiosId())
                .asignaturaId(e.getAsignaturaId())
                .nivelCurricularId(e.getNivelCurricularId())
                .tipoAsignaturaId(e.getTipoAsignaturaId())
                .creditos(e.getCreditos())
                .horasDocenciaSemanales(e.getHorasDocenciaSemanales())
                .horasTrabajoIndependiente(e.getHorasTrabajoIndependiente())
                .esHabilitable(e.isEsHabilitable())
                .build();
    }

    public static PlanAsignaturaEntity toEntity(PlanAsignatura d) {
        if (d == null) return null;
        return PlanAsignaturaEntity.builder()
                .id(d.getId())
                .planEstudiosId(d.getPlanEstudiosId())
                .asignaturaId(d.getAsignaturaId())
                .nivelCurricularId(d.getNivelCurricularId())
                .tipoAsignaturaId(d.getTipoAsignaturaId())
                .creditos(d.getCreditos())
                .horasDocenciaSemanales(d.getHorasDocenciaSemanales())
                .horasTrabajoIndependiente(d.getHorasTrabajoIndependiente())
                .esHabilitable(d.isEsHabilitable())
                .build();
    }
}
