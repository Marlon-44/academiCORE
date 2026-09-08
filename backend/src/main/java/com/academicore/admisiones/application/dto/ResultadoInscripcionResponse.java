package com.academicore.admisiones.application.dto;

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
public class ResultadoInscripcionResponse {

    private Long inscripcionId;
    private String programaNombre;
    private String campusNombre;
    private String estado;
    private LocalDateTime fechaInscripcion;
    private String observaciones;
}
