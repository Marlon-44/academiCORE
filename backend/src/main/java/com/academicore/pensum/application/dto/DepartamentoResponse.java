package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class DepartamentoResponse {
    Long id;
    Long facultadId;
    String codigo;
    String nombre;
    String estado;
}
