package com.academicore.auth.application.dto;

import com.academicore.auth.domain.model.Usuario;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class UsuarioAutenticadoResponse {

    private Long id;
    private String username;
    private String name;
    private String role;
    private Long estudianteId;
    private Long docenteId;
    private boolean surveyCompleted;

    public static UsuarioAutenticadoResponse of(Usuario usuario, boolean surveyCompleted) {
        return UsuarioAutenticadoResponse.builder()
                .id(usuario.getId())
                .username(usuario.getUsername())
                .name(usuario.getNombreMostrar())
                .role(usuario.getRol().name())
                .estudianteId(usuario.getEstudianteId())
                .docenteId(usuario.getDocenteId())
                .surveyCompleted(surveyCompleted)
                .build();
    }
}
