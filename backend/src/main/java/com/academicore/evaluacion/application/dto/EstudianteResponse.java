package com.academicore.evaluacion.application.dto;

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
public class EstudianteResponse {

    private Long id;
    private String codigo;
    private String numeroDocumento;
    private String sexo;
    private String nombres;
    private String apellidos;
    private String nombreCompleto;
    private String email;
    private String telefono;
    private String direccion;
    private Long programaId;
    private String programaCodigo;
    private String programaNombre;
    private Integer semestre;
    private String estadoAcademico;
    private String estadoIngreso;
    private Long planEstudiosId;
    private String planCodigo;
    private String planNombre;
    private String estado;
}
