package com.academicore.pensum.domain.model;

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
public class ProgramaAcademico {

    private Long id;
    private Long facultadId;
    private String codigoInterno;
    private String codigoSnies;
    private String nombre;
    private Integer creditosTotales;
    private EstadoPrograma estado;
    private LocalDate fechaCreacion;
}
