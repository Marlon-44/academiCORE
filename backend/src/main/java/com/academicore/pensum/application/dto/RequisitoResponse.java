package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class RequisitoResponse {
    Long id;
    Long planAsignaturaRequeridaId;
    String asignaturaRequeridaCodigo;
    String asignaturaRequeridaNombre;
    String tipoRequisito;
}
