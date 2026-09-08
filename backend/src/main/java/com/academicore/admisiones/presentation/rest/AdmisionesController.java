package com.academicore.admisiones.presentation.rest;

import com.academicore.admisiones.application.dto.CambiarEstadoOfertaRequest;
import com.academicore.admisiones.application.dto.CrearOfertaAdmisionRequest;
import com.academicore.admisiones.application.dto.CrearPeriodoAdmisionRequest;
import com.academicore.admisiones.application.dto.OfertaAdmisionResponse;
import com.academicore.admisiones.application.dto.PeriodoAdmisionResponse;
import com.academicore.admisiones.application.usecase.OfertaAdmisionUseCase;
import com.academicore.admisiones.application.usecase.PeriodoAdmisionUseCase;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
@Tag(name = "Admisiones", description = "Períodos de admisión, ofertas y programas disponibles para inscripción")
public class AdmisionesController {

    private final PeriodoAdmisionUseCase periodoUseCase;
    private final OfertaAdmisionUseCase ofertaUseCase;

    @PostMapping("/periodos-admision")
    @Operation(summary = "Crear un período de admisión")
    public ResponseEntity<PeriodoAdmisionResponse> crearPeriodo(@Valid @RequestBody CrearPeriodoAdmisionRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(periodoUseCase.crear(request));
    }

    @GetMapping("/periodos-admision")
    @Operation(summary = "Listar períodos de admisión (filtrable por estado)")
    public ResponseEntity<List<PeriodoAdmisionResponse>> listarPeriodos(
            @Parameter(description = "PROGRAMADO, ABIERTO, CERRADO") @RequestParam(required = false) String estado) {
        return ResponseEntity.ok(periodoUseCase.listar(estado));
    }

    @PatchMapping("/periodos-admision/{id}/estado")
    @Operation(summary = "Cambiar estado de un período de admisión")
    public ResponseEntity<PeriodoAdmisionResponse> cambiarEstadoPeriodo(
            @PathVariable Long id, @RequestBody String estadoBody) {
        String estado = estadoBody.replace("\"", "").replace("estado:", "").replace("{", "").replace("}", "").trim();
        return ResponseEntity.ok(periodoUseCase.cambiarEstado(id, estado));
    }

    @PostMapping("/ofertas-admision")
    @Operation(summary = "Publicar un programa a inscripción")
    public ResponseEntity<OfertaAdmisionResponse> crearOferta(@Valid @RequestBody CrearOfertaAdmisionRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(ofertaUseCase.crear(request));
    }

    @GetMapping("/ofertas-admision")
    @Operation(summary = "Programas disponibles para inscripción — filtrable por período y campus")
    public ResponseEntity<List<OfertaAdmisionResponse>> listarOfertas(
            @Parameter(description = "ID del período de admisión") @RequestParam Long periodoId,
            @Parameter(description = "Filtrar por campus") @RequestParam(required = false) Long campusId) {
        return ResponseEntity.ok(ofertaUseCase.listar(periodoId, campusId));
    }

    @GetMapping("/ofertas-admision/{id}")
    @Operation(summary = "Detalle de una oferta de admisión")
    public ResponseEntity<OfertaAdmisionResponse> consultarOferta(@PathVariable Long id) {
        return ResponseEntity.ok(ofertaUseCase.consultarPorId(id));
    }

    @PatchMapping("/ofertas-admision/{id}/estado")
    @Operation(summary = "Cerrar oferta manualmente")
    public ResponseEntity<OfertaAdmisionResponse> cambiarEstadoOferta(
            @PathVariable Long id, @Valid @RequestBody CambiarEstadoOfertaRequest request) {
        return ResponseEntity.ok(ofertaUseCase.cambiarEstado(id, request));
    }
}
