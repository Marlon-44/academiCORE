package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

import java.math.BigDecimal;
import java.util.List;

@Value
@Builder
public class PlanAsignaturaResponse {
    Long id;
    Long planEstudiosId;
    Long asignaturaId;
    String asignaturaCodigo;
    String asignaturaNombre;
    Long nivelCurricularId;
    int nivelNumero;
    String tipoAsignatura;
    BigDecimal creditos;
    BigDecimal horasDocenciaSemanales;
    BigDecimal horasTrabajoIndependiente;
    boolean esHabilitable;
    List<RequisitoResponse> requisitos;
}
