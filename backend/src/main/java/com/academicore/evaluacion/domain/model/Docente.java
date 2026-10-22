package com.academicore.evaluacion.domain.model;

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
public class Docente {

    private Long id;
    private String numeroDocumento;
    private String nombres;
    private String apellidos;
    private String email;
    private EstadoDocente estado;

    public String getNombreCompleto() {
        return (nombres + " " + apellidos).trim();
    }
}
