package com.academicore.evaluacion.application.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CrearDocenteRequest {

    @NotBlank
    private String numeroDocumento;

    @NotBlank
    private String nombres;

    @NotBlank
    private String apellidos;

    @Email
    private String email;
}
