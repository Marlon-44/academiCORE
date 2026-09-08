package com.academicore.campus.domain.model;

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
public class Campus {

    private Long id;
    private Long universidadId;
    private String codigo;
    private String nombre;
    private String direccion;
    private String ciudad;
    private String descripcion;
    private EstadoCampus estado;
    private boolean esSedePrincipal;
    private int orden;
    private String urlMapa;
}
