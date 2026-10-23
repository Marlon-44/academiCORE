package com.academicore.evaluacion.application.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
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
public class CrearEstudianteRequest {

    @Size(max = 20)
    private String codigo;

    @NotBlank
    @Size(max = 30)
    private String numeroDocumento;

    @Size(max = 20)
    private String sexo;

    @NotBlank
    @Size(max = 150)
    private String nombres;

    @NotBlank
    @Size(max = 150)
    private String apellidos;

    @Size(max = 150)
    private String email;

    @Size(max = 30)
    private String telefono;

    @Size(max = 200)
    private String direccion;

    private Long programaId;

    private Integer semestre;
}
