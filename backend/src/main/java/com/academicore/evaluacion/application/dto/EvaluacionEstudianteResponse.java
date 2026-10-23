package com.academicore.evaluacion.application.dto;

import com.academicore.evaluacion.domain.repository.EvaluacionesEstudiantePort.EvaluacionEstudiante;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class EvaluacionEstudianteResponse {

    private Long evaluacionId;
    private String estado;
    private String grupo;
    private String periodo;
    private Long docenteId;
    private String docenteNombre;
    private Long asignaturaId;
    private String asignaturaCodigo;
    private String asignaturaNombre;
    private String programaNombre;
    private boolean contestada;
    private Long encuestaId;

    public static EvaluacionEstudianteResponse of(EvaluacionEstudiante e) {
        return EvaluacionEstudianteResponse.builder()
                .evaluacionId(e.evaluacionId())
                .estado(e.estado())
                .grupo(e.grupo())
                .periodo(e.periodo())
                .docenteId(e.docenteId())
                .docenteNombre(e.docenteNombre())
                .asignaturaId(e.asignaturaId())
                .asignaturaCodigo(e.asignaturaCodigo())
                .asignaturaNombre(e.asignaturaNombre())
                .programaNombre(e.programaNombre())
                .contestada(e.contestada())
                .encuestaId(e.encuestaId())
                .build();
    }
}
