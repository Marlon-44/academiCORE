package com.academicore.pensum.application.dto;

import lombok.Builder;
import lombok.Value;

import java.time.LocalDate;
import java.util.List;

@Value
@Builder
public class AsignaturaResponse {
    Long id;
    Long departamentoId;
    String codigo;
    String nombre;
    String descripcion;
    String estado;
    LocalDate fechaCreacion;
    List<String> naturalezas;
}
