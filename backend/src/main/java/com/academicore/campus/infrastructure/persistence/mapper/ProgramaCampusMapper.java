package com.academicore.campus.infrastructure.persistence.mapper;

import com.academicore.campus.domain.model.ProgramaCampus;
import com.academicore.campus.infrastructure.persistence.entity.ProgramaCampusEntity;

public final class ProgramaCampusMapper {

    private ProgramaCampusMapper() {}

    public static ProgramaCampus toDomain(ProgramaCampusEntity e) {
        if (e == null) return null;
        return ProgramaCampus.builder()
                .programaId(e.getProgramaId())
                .campusId(e.getCampusId())
                .estado(e.getEstado())
                .build();
    }

    public static ProgramaCampusEntity toEntity(ProgramaCampus d) {
        if (d == null) return null;
        return ProgramaCampusEntity.builder()
                .programaId(d.getProgramaId())
                .campusId(d.getCampusId())
                .estado(d.getEstado() != null ? d.getEstado() : "ACTIVO")
                .build();
    }
}
