package com.academicore.pensum.presentation.rest;

import com.academicore.pensum.application.dto.MallaCurricularResponse;
import com.academicore.pensum.application.dto.PlanEstudiosResponse;
import com.academicore.pensum.application.usecase.ConsultarMallaCompletaUseCase;
import com.academicore.pensum.application.usecase.ConsultarPensumUseCase;
import com.academicore.pensum.domain.model.EstadoPensum;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pensum")
@RequiredArgsConstructor
@Tag(name = "Pensum", description = "Consulta de planes de estudio y malla curricular")
public class PensumController {

    private final ConsultarPensumUseCase consultarPensumUseCase;
    private final ConsultarMallaCompletaUseCase consultarMallaCompletaUseCase;

    @GetMapping("/{id}")
    @Operation(summary = "Consultar plan de estudios por ID")
    public ResponseEntity<PlanEstudiosResponse> consultarPorId(
            @Parameter(description = "ID del plan de estudios") @PathVariable Long id) {
        return ResponseEntity.ok(consultarPensumUseCase.consultarPorId(id));
    }

    @GetMapping("/programa/{programaId}")
    @Operation(summary = "Listar planes de estudio de un programa académico")
    public ResponseEntity<List<PlanEstudiosResponse>> listarPorPrograma(
            @Parameter(description = "ID del programa académico") @PathVariable Long programaId,
            @Parameter(description = "Filtrar por estado (EN_DISENO, APROBADO, VIGENTE, OBSOLETO)")
            @RequestParam(required = false) String estado) {
        EstadoPensum estadoEnum = estado != null ? EstadoPensum.valueOf(estado.toUpperCase()) : null;
        return ResponseEntity.ok(consultarPensumUseCase.listarPorPrograma(programaId, estadoEnum));
    }

    @GetMapping("/programa/{programaId}/vigente")
    @Operation(summary = "Consultar el plan de estudios vigente de un programa")
    public ResponseEntity<PlanEstudiosResponse> consultarVigente(
            @Parameter(description = "ID del programa académico") @PathVariable Long programaId) {
        return ResponseEntity.ok(consultarPensumUseCase.consultarVigentePorPrograma(programaId));
    }

    @GetMapping("/{id}/malla")
    @Operation(summary = "Consultar malla curricular completa de un plan de estudios")
    public ResponseEntity<MallaCurricularResponse> consultarMalla(
            @Parameter(description = "ID del plan de estudios") @PathVariable Long id) {
        return ResponseEntity.ok(consultarMallaCompletaUseCase.execute(id));
    }
}
