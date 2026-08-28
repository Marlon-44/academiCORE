package com.academicore.pensum.infrastructure.persistence.mapper;

import com.academicore.pensum.domain.model.EstadoPrograma;
import com.academicore.pensum.domain.model.ProgramaAcademico;
import com.academicore.pensum.infrastructure.persistence.entity.ProgramaAcademicoEntity;

public final class ProgramaAcademicoMapper {

    private ProgramaAcademicoMapper() {}

    public static ProgramaAcademico toDomain(ProgramaAcademicoEntity e) {
        if (e == null) return null;
        return ProgramaAcademico.builder()
                .id(e.getId())
                .facultadId(e.getFacultadId())
                .codigoInterno(e.getCodigoInterno())
                .codigoSnies(e.getCodigoSnies())
                .nombre(e.getNombre())
                .creditosTotales(e.getCreditosTotales())
                .estado(EstadoPrograma.valueOf(e.getEstado()))
                .fechaCreacion(e.getFechaCreacion())
                .build();
    }

    public static ProgramaAcademicoEntity toEntity(ProgramaAcademico d) {
        if (d == null) return null;
        return ProgramaAcademicoEntity.builder()
                .id(d.getId())
                .facultadId(d.getFacultadId())
                .codigoInterno(d.getCodigoInterno())
                .codigoSnies(d.getCodigoSnies())
                .nombre(d.getNombre())
                .creditosTotales(d.getCreditosTotales())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoPrograma.EN_REGISTRO.name())
                .fechaCreacion(d.getFechaCreacion())
                .build();
    }
}
