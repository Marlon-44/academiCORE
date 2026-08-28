package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

import java.util.List;

@Value
@Builder
public class MallaCurricularResponse {
    Long planEstudiosId;
    String codigoPensum;
    String nombre;
    String estado;
    int totalCreditos;
    int creditosCalculados;
    List<NivelMallaResponse> niveles;
}
