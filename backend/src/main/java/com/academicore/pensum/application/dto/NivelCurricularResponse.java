package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class NivelCurricularResponse {
    Long id;
    Long planEstudiosId;
    int numeroNivel;
    String nombre;
}
