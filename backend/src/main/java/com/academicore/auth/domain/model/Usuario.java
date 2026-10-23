package com.academicore.auth.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.OffsetDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Usuario {

    private Long id;
    private String username;
    private String passwordHash;
    private RolUsuario rol;
    private String nombreMostrar;
    private Long estudianteId;
    private Long docenteId;
    private String estado;
    private OffsetDateTime ultimoAcceso;
    private OffsetDateTime creadoEn;
}
