package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

import java.util.List;

@Value
@Builder
public class NivelMallaResponse {
    int numeroNivel;
    String nombre;
    int creditosNivel;
    List<PlanAsignaturaResponse> asignaturas;
}
