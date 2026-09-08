package com.academicore.admisiones.application.dto;

import jakarta.validation.constraints.NotNull;
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
public class CrearInscripcionRequest {

    @NotNull
    private Long aspiranteId;

    @NotNull
    private Long ofertaAdmisionId;
}
