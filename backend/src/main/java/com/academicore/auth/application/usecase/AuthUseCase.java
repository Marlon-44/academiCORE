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

    public static final long DURACION_SESION_SEGUNDOS = 8 * 3600;

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
                Sesion.nueva(usuario.getId(), DURACION_SESION_SEGUNDOS));
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

    private UsuarioAutenticadoResponse toResponse(Usuario usuario) {
        boolean completado = usuario.getEstudianteId() == null
                || progresoEvaluacion.consultar(usuario.getEstudianteId()).completado();
        return UsuarioAutenticadoResponse.of(usuario, completado);
    }

    public record LoginResult(Sesion sesion, UsuarioAutenticadoResponse usuario) {
    }
}
