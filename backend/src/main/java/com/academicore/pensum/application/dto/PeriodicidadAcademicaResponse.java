package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class PeriodicidadAcademicaResponse {
    Long id;
    String codigo;
    String nombre;
    int duracionMeses;
}
