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
public class DocenteResponse {

    private Long id;
    private String numeroDocumento;
    private String nombres;
    private String apellidos;
    private String nombreCompleto;
    private String email;
    private String estado;
}
