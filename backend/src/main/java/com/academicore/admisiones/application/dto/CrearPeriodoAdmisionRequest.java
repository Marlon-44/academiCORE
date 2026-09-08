package com.academicore.admisiones.application.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
public class CrearPeriodoAdmisionRequest {

    @NotBlank
    private String codigo;

    @NotBlank
    private String nombre;

    @NotNull
    private LocalDate fechaInicioInscripciones;

    @NotNull
    private LocalDate fechaFinInscripciones;

    private LocalDate fechaInicioClases;
}
