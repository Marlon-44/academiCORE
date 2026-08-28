package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.DepartamentoAcademico;
import com.academicore.pensum.domain.model.EstadoDepartamento;
import com.academicore.pensum.infrastructure.persistence.entity.DepartamentoAcademicoEntity;

public final class DepartamentoAcademicoMapper {

    private DepartamentoAcademicoMapper() {}

    public static DepartamentoAcademico toDomain(DepartamentoAcademicoEntity e) {
        if (e == null) return null;
        return DepartamentoAcademico.builder()
                .id(e.getId())
                .facultadId(e.getFacultadId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .estado(EstadoDepartamento.valueOf(e.getEstado()))
                .build();
    }

    public static DepartamentoAcademicoEntity toEntity(DepartamentoAcademico d) {
        if (d == null) return null;
        return DepartamentoAcademicoEntity.builder()
                .id(d.getId())
                .facultadId(d.getFacultadId())
                .codigo(d.getCodigo())
                .nombre(d.getNombre())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoDepartamento.ACTIVO.name())
                .build();
    }
}
