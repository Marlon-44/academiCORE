package com.academicore.admisiones.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Inscripcion {

    private Long id;
    private Long aspiranteId;
    private Long ofertaAdmisionId;
    private LocalDateTime fechaInscripcion;
    private EstadoInscripcion estado;
    private String observaciones;
}
