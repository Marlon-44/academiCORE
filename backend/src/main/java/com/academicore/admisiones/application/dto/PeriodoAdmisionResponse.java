package com.academicore.admisiones.application.dto;

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
public class PeriodoAdmisionResponse {

    private Long id;
    private String codigo;
    private String nombre;
    private String estado;
    private LocalDate fechaInicioInscripciones;
    private LocalDate fechaFinInscripciones;
    private LocalDate fechaInicioClases;
}
