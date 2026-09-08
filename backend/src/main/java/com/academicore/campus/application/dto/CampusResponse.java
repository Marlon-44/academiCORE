package com.academicore.campus.application.dto;

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
public class CampusResponse {

    private Long id;
    private String codigo;
    private String nombre;
    private String direccion;
    private String ciudad;
    private String descripcion;
    private String estado;
    private boolean esSedePrincipal;
    private int orden;
    private String urlMapa;
}
