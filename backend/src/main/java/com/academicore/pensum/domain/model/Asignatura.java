package com.academicore.pensum.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Asignatura {

    private Long id;
    private Long departamentoId;
    private String codigo;
    private String nombre;
    private String descripcion;
    private EstadoAsignatura estado;
    private LocalDate fechaCreacion;

    @Builder.Default
    private final List<NaturalezaAsignatura> naturalezas = new ArrayList<>();
}
