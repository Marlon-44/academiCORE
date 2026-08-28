package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

import java.time.LocalDate;

@Value
@Builder
public class ProgramaResponse {
    Long id;
    Long facultadId;
    String codigoInterno;
    String codigoSnies;
    String nombre;
    Integer creditosTotales;
    String estado;
    LocalDate fechaCreacion;
}
