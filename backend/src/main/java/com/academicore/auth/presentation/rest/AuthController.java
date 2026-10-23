package com.academicore.auth.presentation.rest;

import com.academicore.auth.application.dto.LoginRequest;
import com.academicore.auth.application.dto.UsuarioAutenticadoResponse;
import com.academicore.auth.application.usecase.AuthUseCase;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@Tag(name = "Autenticación", description = "Inicio/cierre de sesión con cookie HttpOnly y consulta del usuario actual")
public class AuthController {

    private static final String COOKIE_SESION = "academicore_session";

    private final AuthUseCase authUseCase;

    @PostMapping("/login")
    @Operation(summary = "Iniciar sesión",
            description = "Valida las credenciales y crea una sesión de 8 horas enviada como cookie HttpOnly 'academicore_session'. "
                    + "Usuarios demo: admin/admin123 - estudiante 0222400001/10000001 (codigo/documento) - docente 10301274/10301274")
    public ResponseEntity<UsuarioAutenticadoResponse> login(
            @Valid @RequestBody LoginRequest request) {

        AuthUseCase.LoginResult result = authUseCase.login(
                request.getUsername(), request.getPassword());

        ResponseCookie cookie = ResponseCookie
                .from(COOKIE_SESION, result.sesion().getToken())
                .httpOnly(true)
                .path("/")
                .maxAge(AuthUseCase.DURACION_SESION_SEGUNDOS)
                .sameSite("Lax")
                .build();

        return ResponseEntity.ok()
                .header(HttpHeaders.SET_COOKIE, cookie.toString())
                .body(result.usuario());
    }

    @GetMapping("/me")
    @Operation(summary = "Usuario actual",
            description = "Devuelve el usuario autenticado segun la cookie de sesión, o 401 si no hay sesión vigente")
    public ResponseEntity<UsuarioAutenticadoResponse> me(HttpServletRequest request) {
        UsuarioAutenticadoResponse usuario = authUseCase.validarSesion(extraerToken(request));
        if (usuario == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
        return ResponseEntity.ok(usuario);
    }

    @PostMapping("/logout")
    @Operation(summary = "Cerrar sesión", description = "Elimina la sesión del servidor y expira la cookie")
    public ResponseEntity<Void> logout(HttpServletRequest request) {
        authUseCase.logout(extraerToken(request));

        ResponseCookie cookie = ResponseCookie.from(COOKIE_SESION, "")
                .httpOnly(true)
                .path("/")
                .maxAge(0)
                .sameSite("Lax")
                .build();

        return ResponseEntity.noContent()
                .header(HttpHeaders.SET_COOKIE, cookie.toString())
                .build();
    }

    private String extraerToken(HttpServletRequest request) {
        if (request.getCookies() == null) {
            return null;
        }
        return Arrays.stream(request.getCookies())
                .filter(cookie -> COOKIE_SESION.equals(cookie.getName()))
                .map(Cookie::getValue)
                .findFirst()
                .orElse(null);
    }
}
