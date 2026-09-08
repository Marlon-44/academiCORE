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
public class DocumentoAspirante {

    private Long id;
    private Long inscripcionId;
    private String tipoDocumento;
    private String url;
    private LocalDateTime fechaCarga;
    private String estado;
}
