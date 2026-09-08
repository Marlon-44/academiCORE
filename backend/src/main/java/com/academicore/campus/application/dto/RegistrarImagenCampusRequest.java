package com.academicore.campus.application.dto;

import jakarta.validation.constraints.NotBlank;
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
public class RegistrarImagenCampusRequest {

    @NotBlank
    private String categoriaCodigo;

    @NotBlank
    private String url;

    private String descripcion;

    private int orden;
}
