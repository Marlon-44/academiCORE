package com.academicore.admisiones.application.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
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
public class CrearAspiranteRequest {

    @NotBlank
    private String tipoDocumento;

    @NotBlank
    private String numeroDocumento;

    @NotBlank
    private String nombres;

    @NotBlank
    private String apellidos;

    @NotBlank
    @Email
    private String email;

    private String telefono;

    private LocalDate fechaNacimiento;
}
