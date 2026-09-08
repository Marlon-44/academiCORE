package com.academicore.campus.application.dto;

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
public class ImagenCampusResponse {

    private Long id;
    private Long campusId;
    private String categoriaCodigo;
    private String categoriaNombre;
    private String url;
    private String descripcion;
    private int orden;
    private LocalDateTime fechaCarga;
    private String estado;
}
