package com.academicore.admisiones.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Aspirante {

    private Long id;
    private String tipoDocumento;
    private String numeroDocumento;
    private String nombres;
    private String apellidos;
    private String email;
    private String telefono;
    private LocalDate fechaNacimiento;
    private LocalDateTime fechaRegistro;
    private EstadoAspirante estado;
}
