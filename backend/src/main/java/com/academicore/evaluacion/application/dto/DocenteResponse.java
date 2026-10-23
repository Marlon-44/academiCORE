package com.academicore.evaluacion.application.dto;

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
public class DocenteResponse {

    private Long id;
    private String numeroDocumento;
    private String sexo;
    private String nombres;
    private String apellidos;
    private String nombreCompleto;
    private String email;
    private String telefono;
    private String direccion;
    private String tipoVinculacion;
    private String escalafon;
    private String nivelFormacion;
    private Long departamentoId;
    private String departamentoCodigo;
    private String departamentoNombre;
    private LocalDate fechaIngreso;
    private String estado;
}
