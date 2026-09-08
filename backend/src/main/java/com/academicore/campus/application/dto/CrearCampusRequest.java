package com.academicore.campus.application.dto;

import jakarta.validation.constraints.NotBlank;
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
public class CrearCampusRequest {

    @NotNull
    private Long universidadId;

    @NotBlank
    private String codigo;

    @NotBlank
    private String nombre;

    private String direccion;

    private String ciudad;

    private String descripcion;
}
