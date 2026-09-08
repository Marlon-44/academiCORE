package com.academicore.admisiones.application.dto;

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
public class DocumentoAspiranteResponse {

    private Long id;
    private Long inscripcionId;
    private String tipoDocumento;
    private String estado;
    private LocalDateTime fechaCarga;
}
