package com.academicore.campus.infrastructure.persistence.mapper;

import com.academicore.campus.domain.model.CategoriaImagenCampus;
import com.academicore.campus.domain.model.ImagenCampus;
import com.academicore.campus.infrastructure.persistence.entity.CategoriaImagenCampusEntity;
import com.academicore.campus.infrastructure.persistence.entity.ImagenCampusEntity;

public final class ImagenCampusMapper {

    private ImagenCampusMapper() {}

    public static ImagenCampus toDomain(ImagenCampusEntity e, CategoriaImagenCampusEntity cat) {
        if (e == null) return null;
        return ImagenCampus.builder()
                .id(e.getId())
                .campusId(e.getCampusId())
                .categoriaId(e.getCategoriaId())
                .categoriaCodigo(cat != null ? cat.getCodigo() : null)
                .categoriaNombre(cat != null ? cat.getNombre() : null)
                .url(e.getUrl())
                .descripcion(e.getDescripcion())
                .orden(e.getOrden())
                .fechaCarga(e.getFechaCarga())
                .estado(e.getEstado())
                .build();
    }

    public static ImagenCampusEntity toEntity(ImagenCampus d) {
        if (d == null) return null;
        return ImagenCampusEntity.builder()
                .id(d.getId())
                .campusId(d.getCampusId())
                .categoriaId(d.getCategoriaId())
                .url(d.getUrl())
                .descripcion(d.getDescripcion())
                .orden(d.getOrden())
                .fechaCarga(d.getFechaCarga())
                .estado(d.getEstado() != null ? d.getEstado() : "ACTIVA")
                .build();
    }

    public static CategoriaImagenCampus toDomain(CategoriaImagenCampusEntity e) {
        if (e == null) return null;
        return CategoriaImagenCampus.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .build();
    }
}
