package com.academicore.campus.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ImagenCampus {

    private Long id;
    private Long campusId;
    private Long categoriaId;
    private String categoriaCodigo;
    private String categoriaNombre;
    private String url;
    private String descripcion;
    private int orden;
    private LocalDateTime fechaCarga;
    private String estado;
}
