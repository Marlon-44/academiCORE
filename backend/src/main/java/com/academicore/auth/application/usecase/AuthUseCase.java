package com.academicore.auth.application.usecase;

import com.academicore.auth.application.dto.UsuarioAutenticadoResponse;
import com.academicore.auth.domain.exception.UnauthorizedException;
import com.academicore.auth.domain.model.Sesion;
import com.academicore.auth.domain.model.Usuario;
import com.academicore.auth.domain.repository.ProgresoEvaluacionPort;
import com.academicore.auth.domain.repository.SesionRepository;
import com.academicore.auth.domain.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AuthUseCase {

    public static final long DURACION_SESION_STAFF_SEGUNDOS = 15L * 24 * 3600;
    public static final long DURACION_SESION_ESTUDIANTE_SEGUNDOS = 60L * 24 * 3600;

    private final UsuarioRepository usuarioRepository;
    private final SesionRepository sesionRepository;
    private final ProgresoEvaluacionPort progresoEvaluacion;

    @Transactional
    public LoginResult login(String username, String password) {
        Usuario usuario = usuarioRepository
                .findByCredencialesValidas(username.trim(), password)
                .orElseThrow(() -> new UnauthorizedException(
                        "Usuario o contraseña incorrectos"));

        Sesion sesion = sesionRepository.save(
                Sesion.nueva(usuario.getId(), duracionSesion(usuario.getRol())));
        usuarioRepository.marcarUltimoAcceso(usuario.getId());
        sesionRepository.deleteExpiradas();

        return new LoginResult(sesion, toResponse(usuario));
    }

    @Transactional(readOnly = true)
    public UsuarioAutenticadoResponse validarSesion(String token) {
        if (token == null || token.isBlank()) {
            return null;
        }
        return sesionRepository.findByToken(token)
                .filter(Sesion::estaVigente)
                .flatMap(sesion -> usuarioRepository.findById(sesion.getUsuarioId()))
                .filter(usuario -> "ACTIVO".equals(usuario.getEstado()))
                .map(this::toResponse)
                .orElse(null);
    }

    @Transactional
    public void logout(String token) {
        if (token != null && !token.isBlank()) {
            sesionRepository.deleteByToken(token);
        }
    }

    /** Duración de sesión por rol: staff (admin/docente) 15 días, estudiante 60 días. */
    public static long duracionSesion(com.academicore.auth.domain.model.RolUsuario rol) {
        return rol == com.academicore.auth.domain.model.RolUsuario.ESTUDIANTE
                ? DURACION_SESION_ESTUDIANTE_SEGUNDOS
                : DURACION_SESION_STAFF_SEGUNDOS;
    }

    private UsuarioAutenticadoResponse toResponse(Usuario usuario) {
        boolean completado = usuario.getEstudianteId() == null
                || progresoEvaluacion.consultar(usuario.getEstudianteId()).completado();
        return UsuarioAutenticadoResponse.of(usuario, completado);
    }

    public record LoginResult(Sesion sesion, UsuarioAutenticadoResponse usuario) {
    }
}
