package com.academicore.auth.infrastructure.persistence.mapper;

import com.academicore.auth.domain.model.Sesion;
import com.academicore.auth.domain.model.Usuario;
import com.academicore.auth.infrastructure.persistence.entity.SesionEntity;
import com.academicore.auth.infrastructure.persistence.entity.UsuarioEntity;

public final class AuthMapper {

    private AuthMapper() {
    }

    public static Usuario toDomain(UsuarioEntity e) {
        return Usuario.builder()
                .id(e.getId())
                .username(e.getUsername())
                .passwordHash(e.getPasswordHash())
                .rol(e.getRol())
                .nombreMostrar(e.getNombreMostrar())
                .estudianteId(e.getEstudianteId())
                .docenteId(e.getDocenteId())
                .estado(e.getEstado())
                .ultimoAcceso(e.getUltimoAcceso())
                .creadoEn(e.getCreadoEn())
                .build();
    }

    public static UsuarioEntity toEntity(Usuario d) {
        return UsuarioEntity.builder()
                .id(d.getId())
                .username(d.getUsername())
                .passwordHash(d.getPasswordHash())
                .rol(d.getRol())
                .nombreMostrar(d.getNombreMostrar())
                .estudianteId(d.getEstudianteId())
                .docenteId(d.getDocenteId())
                .estado(d.getEstado())
                .ultimoAcceso(d.getUltimoAcceso())
                .creadoEn(d.getCreadoEn())
                .build();
    }

    public static Sesion toDomain(SesionEntity e) {
        return Sesion.builder()
                .id(e.getId())
                .token(e.getToken())
                .usuarioId(e.getUsuarioId())
                .creadoEn(e.getCreadoEn())
                .expiraEn(e.getExpiraEn())
                .build();
    }

    public static SesionEntity toEntity(Sesion d) {
        return SesionEntity.builder()
                .id(d.getId())
                .token(d.getToken())
                .usuarioId(d.getUsuarioId())
                .creadoEn(d.getCreadoEn())
                .expiraEn(d.getExpiraEn())
                .build();
    }
}
