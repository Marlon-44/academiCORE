package com.academicore.evaluacion.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Docente {

    private Long id;
    private String numeroDocumento;
    private String sexo;
    private String nombres;
    private String apellidos;
    private String email;
    private String telefono;
    private String direccion;
    private String tipoVinculacion;
    private String escalafon;
    private String nivelFormacion;
    private Long departamentoId;
    private LocalDate fechaIngreso;
    private EstadoDocente estado;

    public String getNombreCompleto() {
        return (nombres + " " + apellidos).trim();
    }
}
