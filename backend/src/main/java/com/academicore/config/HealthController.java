package com.academicore.config;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * Health check ligero: lo usa el frontend (splash de arranque) para despertar
 * el servicio y Render como healthCheckPath. No toca la base de datos.
 */
@RestController
@Tag(name = "Salud", description = "Verificación de disponibilidad del servicio")
public class HealthController {

    @GetMapping("/api/health")
    @Operation(summary = "Health check", description = "Responde 200 cuando el servicio está arriba")
    public ResponseEntity<Map<String, String>> health() {
        return ResponseEntity.ok(Map.of("status", "UP"));
    }
}
