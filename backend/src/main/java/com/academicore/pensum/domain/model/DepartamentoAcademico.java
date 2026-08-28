package com.academicore.pensum.domain.model;

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
public class DepartamentoAcademico {

    private Long id;
    private Long facultadId;
    private String codigo;
    private String nombre;
    private EstadoDepartamento estado;
}
