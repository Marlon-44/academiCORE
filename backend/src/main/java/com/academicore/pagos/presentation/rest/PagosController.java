package com.academicore.pagos.presentation.rest;

import com.academicore.pagos.application.dto.FacturaResponse;
import com.academicore.pagos.application.dto.MonedaResponse;
import com.academicore.pagos.application.usecase.FacturaUseCase;
import com.academicore.pagos.application.usecase.MonedaUseCase;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
@Tag(name = "Pagos", description = "Facturación y monedas (pasarelas de pago pendientes)")
public class PagosController {

    private final FacturaUseCase facturaUseCase;
    private final MonedaUseCase monedaUseCase;

    @GetMapping("/inscripciones/{id}/factura")
    @Operation(summary = "Consultar factura de una inscripción")
    public ResponseEntity<FacturaResponse> facturaPorInscripcion(@PathVariable Long id) {
        return ResponseEntity.ok(facturaUseCase.consultarPorInscripcion(id));
    }

    @GetMapping("/facturas/{id}")
    @Operation(summary = "Consultar factura por ID")
    public ResponseEntity<FacturaResponse> facturaPorId(@PathVariable Long id) {
        return ResponseEntity.ok(facturaUseCase.consultarPorId(id));
    }

    @GetMapping("/catalogos/monedas")
    @Operation(summary = "Listar monedas soportadas")
    public ResponseEntity<List<MonedaResponse>> listarMonedas() {
        return ResponseEntity.ok(monedaUseCase.listar());
    }
}
