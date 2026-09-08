package com.academicore.admisiones.application.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SolicitarUploadDocumentoRequest {

    @NotBlank
    private String tipoDocumento;

    @NotBlank
    private String nombreArchivo;

    @NotBlank
    private String contentType;
}
