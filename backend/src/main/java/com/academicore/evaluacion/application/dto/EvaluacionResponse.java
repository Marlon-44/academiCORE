package com.academicore.evaluacion.application.dto;

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
public class EvaluacionResponse {

    private Long id;
    private Long docenteId;
    private String docenteNombre;
    private Long asignaturaId;
    private String asignaturaCodigo;
    private String asignaturaNombre;
    private Long programaId;
    private String grupo;
    private String periodo;
    private Integer estudiantesEsperados;
    private long encuestasRespondidas;
    private String estado;
    private LocalDateTime fechaCreacion;
}
