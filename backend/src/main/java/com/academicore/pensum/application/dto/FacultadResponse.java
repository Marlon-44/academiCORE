package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

import java.time.LocalDate;

@Value
@Builder
public class FacultadResponse {
    Long id;
    Long universidadId;
    String codigo;
    String nombre;
    LocalDate fechaCreacion;
    String estado;
}
