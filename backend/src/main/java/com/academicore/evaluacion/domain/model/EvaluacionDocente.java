package com.academicore.evaluacion.domain.model;

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
public class EvaluacionDocente {

    private Long id;
    private Long docenteId;
    private Long asignaturaId;
    private Long programaId;
    private String grupo;
    private String periodo;
    private Integer estudiantesEsperados;
    private EstadoEvaluacion estado;
    private LocalDateTime fechaCreacion;
}
