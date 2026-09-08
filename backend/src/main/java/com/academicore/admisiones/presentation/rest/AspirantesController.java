package com.academicore.admisiones.presentation.rest;

import com.academicore.admisiones.application.dto.AspiranteResponse;
import com.academicore.admisiones.application.dto.CambiarEstadoInscripcionRequest;
import com.academicore.admisiones.application.dto.CrearAspiranteRequest;
import com.academicore.admisiones.application.dto.CrearInscripcionRequest;
import com.academicore.admisiones.application.dto.DocumentoAspiranteResponse;
import com.academicore.admisiones.application.dto.InscripcionResponse;
import com.academicore.admisiones.application.dto.RegistrarDocumentoRequest;
import com.academicore.admisiones.application.dto.ResultadoInscripcionResponse;
import com.academicore.admisiones.application.dto.SolicitarUploadDocumentoRequest;
import com.academicore.admisiones.application.dto.UploadDocumentoUrlResponse;
import com.academicore.admisiones.application.usecase.AspiranteUseCase;
import com.academicore.admisiones.application.usecase.DocumentoAspiranteUseCase;
import com.academicore.admisiones.application.usecase.InscripcionUseCase;
import com.academicore.admisiones.application.usecase.ResultadosInscripcionUseCase;
import com.academicore.campus.domain.repository.ImagenCampusStoragePort;
import io.swagger.v3.oas.annotations.Operation;
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
@Tag(name = "Aspirantes e Inscripciones", description = "Registro de aspirantes, inscripciones a ofertas y documentos")
public class AspirantesController {

    private final AspiranteUseCase aspiranteUseCase;
    private final InscripcionUseCase inscripcionUseCase;
    private final DocumentoAspiranteUseCase documentoUseCase;
    private final ResultadosInscripcionUseCase resultadosUseCase;
    private final ImagenCampusStoragePort storagePort;

    @GetMapping("/resultados-inscripcion")
    @Operation(summary = "Consultar resultados de inscripción por documento (público, sin sesión)")
    public ResponseEntity<List<ResultadoInscripcionResponse>> consultarResultados(
            @RequestParam String tipoDocumento,
            @RequestParam String numeroDocumento) {
        return ResponseEntity.ok(resultadosUseCase.consultarPorDocumento(tipoDocumento, numeroDocumento));
    }

    @PostMapping("/aspirantes")
    @Operation(summary = "Registrar un aspirante")
    public ResponseEntity<AspiranteResponse> crearAspirante(@Valid @RequestBody CrearAspiranteRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(aspiranteUseCase.crear(request));
    }

    @GetMapping("/aspirantes/{id}")
    @Operation(summary = "Consultar aspirante por ID")
    public ResponseEntity<AspiranteResponse> consultarAspirante(@PathVariable Long id) {
        return ResponseEntity.ok(aspiranteUseCase.consultarPorId(id));
    }

    @PostMapping("/inscripciones")
    @Operation(summary = "Crear inscripción a una oferta (genera factura automáticamente)")
    public ResponseEntity<InscripcionResponse> crearInscripcion(@Valid @RequestBody CrearInscripcionRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(inscripcionUseCase.crear(request));
    }

    @GetMapping("/inscripciones/{id}")
    @Operation(summary = "Detalle de inscripción")
    public ResponseEntity<InscripcionResponse> consultarInscripcion(@PathVariable Long id) {
        return ResponseEntity.ok(inscripcionUseCase.consultarPorId(id));
    }

    @GetMapping("/aspirantes/{id}/inscripciones")
    @Operation(summary = "Inscripciones de un aspirante")
    public ResponseEntity<List<InscripcionResponse>> inscripcionesDeAspirante(@PathVariable Long id) {
        return ResponseEntity.ok(inscripcionUseCase.listarPorAspirante(id));
    }

    @PatchMapping("/inscripciones/{id}/estado")
    @Operation(summary = "Cambiar estado de inscripción (ADMITIDO, RECHAZADO, etc.)")
    public ResponseEntity<InscripcionResponse> cambiarEstadoInscripcion(
            @PathVariable Long id, @Valid @RequestBody CambiarEstadoInscripcionRequest request) {
        return ResponseEntity.ok(inscripcionUseCase.cambiarEstado(id, request));
    }

    @PostMapping("/inscripciones/{id}/documentos/upload-url")
    @Operation(summary = "Generar URL firmada de Supabase para subir documento de aspirante (bucket privado)")
    public ResponseEntity<UploadDocumentoUrlResponse> solicitarUploadDocumentoUrl(
            @PathVariable Long id, @Valid @RequestBody SolicitarUploadDocumentoRequest request) {
        String bucket = "aspirantes";
        String ruta = id + "/" + request.getNombreArchivo();
        ImagenCampusStoragePort.UploadUrlResponse resp = storagePort.generarUrlSubida(bucket, ruta, request.getContentType());
        return ResponseEntity.ok(UploadDocumentoUrlResponse.builder()
                .urlSubida(resp.urlSubida())
                .urlPrivadaResultante(resp.urlPublicaResultante())
                .expiraEn(resp.expiraEn())
                .build());
    }

    @PostMapping("/inscripciones/{id}/documentos")
    @Operation(summary = "Registrar URL de documento ya subido a Supabase")
    public ResponseEntity<DocumentoAspiranteResponse> registrarDocumento(
            @PathVariable Long id, @Valid @RequestBody RegistrarDocumentoRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(documentoUseCase.registrar(id, request));
    }

    @GetMapping("/inscripciones/{id}/documentos")
    @Operation(summary = "Listar documentos de una inscripción")
    public ResponseEntity<List<DocumentoAspiranteResponse>> listarDocumentos(@PathVariable Long id) {
        return ResponseEntity.ok(documentoUseCase.listarPorInscripcion(id));
    }
}
