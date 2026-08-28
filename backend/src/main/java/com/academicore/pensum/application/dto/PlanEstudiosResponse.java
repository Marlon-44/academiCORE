package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

import java.time.LocalDate;

@Value
@Builder
public class PlanEstudiosResponse {
    Long id;
    Long programaId;
    Long periodicidadId;
    String codigoPensum;
    String nombre;
    String numeroResolucion;
    LocalDate fechaAprobacion;
    LocalDate fechaVigenciaDesde;
    LocalDate fechaVigenciaHasta;
    int totalCreditos;
    String estado;
}
