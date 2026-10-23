package com.academicore.evaluacion.application.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
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
public class CrearDocenteRequest {

    @NotBlank
    private String numeroDocumento;

    @Size(max = 20)
    private String sexo;

    @NotBlank
    private String nombres;

    @NotBlank
    private String apellidos;

    @Email
    private String email;

    @Size(max = 30)
    private String telefono;

    @Size(max = 200)
    private String direccion;

    /** PLANTA_TIEMPO_COMPLETO, PLANTA_MEDIO_TIEMPO, OCASIONAL o CATEDRA. */
    @Size(max = 30)
    private String tipoVinculacion;

    /** AUXILIAR, ASISTENTE, ASOCIADO o TITULAR (Decreto 1279). */
    @Size(max = 30)
    private String escalafon;

    /** PREGRADO, ESPECIALIZACION, MAESTRIA, DOCTORADO o POSTDOCTORADO. */
    @Size(max = 30)
    private String nivelFormacion;

    private Long departamentoId;

    private LocalDate fechaIngreso;
}
