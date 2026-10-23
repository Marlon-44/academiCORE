package com.academicore.evaluacion.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Encuesta {

    private Long id;
    private Long evaluacionId;
    private Long estudianteId;
    private LocalDateTime fechaRespuesta;
    private List<RespuestaPregunta> respuestas;
}
