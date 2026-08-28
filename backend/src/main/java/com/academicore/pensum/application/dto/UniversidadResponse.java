package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

import java.time.LocalDate;

@Value
@Builder
public class UniversidadResponse {
    Long id;
    String codigo;
    String nombre;
    LocalDate fechaCreacion;
    String estado;
}
