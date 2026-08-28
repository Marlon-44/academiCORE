package com.academicore.pensum.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Facultad {

    private Long id;
    private Long universidadId;
    private String codigo;
    private String nombre;
    private LocalDate fechaCreacion;
    private EstadoFacultad estado;
}
