package com.academicore.evaluacion.application.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegistrarEncuestaRequest {

    @NotNull
    private Long evaluacionId;

    /** Estudiante que responde (debe estar inscrito en la evaluación). */
    private Long estudianteId;

    @NotEmpty
    @Valid
    private List<RespuestaRequest> respuestas;

    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class RespuestaRequest {

        @NotNull
        private Long preguntaId;

        /** Requerido para preguntas LIKERT (escala 1-5). */
        @Min(1)
        @Max(5)
        private Integer valor;

        /** Requerido para preguntas TEXTO (recibe análisis de sentimiento). */
        @Size(max = 2000)
        private String textoRespuesta;
    }
}
