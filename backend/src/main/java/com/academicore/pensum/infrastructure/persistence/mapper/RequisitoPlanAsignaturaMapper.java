package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.RequisitoPlanAsignatura;
import com.academicore.pensum.infrastructure.persistence.entity.RequisitoPlanAsignaturaEntity;

public final class RequisitoPlanAsignaturaMapper {

    private RequisitoPlanAsignaturaMapper() {}

    public static RequisitoPlanAsignatura toDomain(RequisitoPlanAsignaturaEntity e) {
        if (e == null) return null;
        return RequisitoPlanAsignatura.builder()
                .id(e.getId())
                .planEstudiosId(e.getPlanEstudiosId())
                .planAsignaturaId(e.getPlanAsignaturaId())
                .planAsignaturaRequeridaId(e.getPlanAsignaturaRequeridaId())
                .tipoRequisitoId(e.getTipoRequisitoId())
                .build();
    }

    public static RequisitoPlanAsignaturaEntity toEntity(RequisitoPlanAsignatura d) {
        if (d == null) return null;
        return RequisitoPlanAsignaturaEntity.builder()
                .id(d.getId())
                .planEstudiosId(d.getPlanEstudiosId())
                .planAsignaturaId(d.getPlanAsignaturaId())
                .planAsignaturaRequeridaId(d.getPlanAsignaturaRequeridaId())
                .tipoRequisitoId(d.getTipoRequisitoId())
                .build();
    }
}
