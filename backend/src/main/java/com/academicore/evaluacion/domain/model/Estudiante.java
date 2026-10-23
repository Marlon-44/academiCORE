package com.academicore.evaluacion.domain.model;

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
public class Estudiante {

    private Long id;
    private String codigo;
    private String numeroDocumento;
    private String sexo;
    private String nombres;
    private String apellidos;
    private String email;
    private String telefono;
    private String direccion;
    private Long programaId;
    private Integer semestre;
    private String estadoAcademico;
    private String estadoIngreso;
    private Long planEstudiosId;
    private String estado;

    public String getNombreCompleto() {
        return (nombres + " " + apellidos).trim();
    }
}
