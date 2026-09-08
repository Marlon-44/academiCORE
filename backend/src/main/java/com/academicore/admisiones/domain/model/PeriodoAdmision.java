package com.academicore.admisiones.domain.model;

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
public class PeriodoAdmision {

    private Long id;
    private String codigo;
    private String nombre;
    private LocalDate fechaInicioInscripciones;
    private LocalDate fechaFinInscripciones;
    private LocalDate fechaInicioClases;
    private EstadoPeriodoAdmision estado;
}
