package com.academicore.campus.presentation.rest;

import com.academicore.campus.application.dto.CampusResponse;
import com.academicore.campus.application.dto.CambiarEstadoCampusRequest;
import com.academicore.campus.application.dto.CategoriaImagenResponse;
import com.academicore.campus.application.dto.CrearCampusRequest;
import com.academicore.campus.application.dto.ImagenCampusResponse;
import com.academicore.campus.application.dto.RegistrarImagenCampusRequest;
import com.academicore.campus.application.dto.SolicitarUploadUrlRequest;
import com.academicore.campus.application.dto.UploadUrlResponse;
import com.academicore.campus.application.usecase.CampusUseCase;
import com.academicore.campus.application.usecase.CategoriaImagenUseCase;
import com.academicore.campus.application.usecase.ImagenCampusUseCase;
import com.academicore.campus.application.usecase.ProgramaCampusUseCase;
import com.academicore.campus.domain.repository.ImagenCampusStoragePort;
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
@RequestMapping("/api/v1/campus")
@RequiredArgsConstructor
@Tag(name = "Campus", description = "Gestión de sedes, imágenes y vinculación con programas")
public class CampusController {

    private final CampusUseCase campusUseCase;
    private final ImagenCampusUseCase imagenUseCase;
    private final CategoriaImagenUseCase categoriaUseCase;
    private final ProgramaCampusUseCase programaCampusUseCase;
    private final ImagenCampusStoragePort storagePort;

    @PostMapping
    @Operation(summary = "Crear un campus")
    public ResponseEntity<CampusResponse> crear(@Valid @RequestBody CrearCampusRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(campusUseCase.crear(request));
    }

    @GetMapping
    @Operation(summary = "Listar campus (filtrable por estado)")
    public ResponseEntity<List<CampusResponse>> listar(
            @Parameter(description = "Filtrar por estado (ACTIVO, INACTIVO)") @RequestParam(required = false) String estado) {
        return ResponseEntity.ok(campusUseCase.listar(estado));
    }

    @GetMapping("/{codigo}")
    @Operation(summary = "Detalle de un campus por código")
    public ResponseEntity<CampusResponse> consultarPorCodigo(@PathVariable String codigo) {
        return ResponseEntity.ok(campusUseCase.consultarPorCodigo(codigo));
    }

    @PatchMapping("/{id}/estado")
    @Operation(summary = "Activar/inactivar un campus")
    public ResponseEntity<CampusResponse> cambiarEstado(
            @PathVariable Long id, @Valid @RequestBody CambiarEstadoCampusRequest request) {
        return ResponseEntity.ok(campusUseCase.cambiarEstado(id, request.getEstado()));
    }

    @PostMapping("/{id}/imagenes/upload-url")
    @Operation(summary = "Generar URL firmada de Supabase para subir imagen de campus")
    public ResponseEntity<UploadUrlResponse> solicitarUploadUrl(
            @PathVariable Long id, @Valid @RequestBody SolicitarUploadUrlRequest request) {
        String bucket = "campus";
        String ruta = id + "/" + request.getNombreArchivo();
        ImagenCampusStoragePort.UploadUrlResponse resp = storagePort.generarUrlSubida(bucket, ruta, request.getContentType());
        return ResponseEntity.ok(UploadUrlResponse.builder()
                .urlSubida(resp.urlSubida())
                .urlPublicaResultante(resp.urlPublicaResultante())
                .expiraEn(resp.expiraEn())
                .build());
    }

    @PostMapping("/{id}/imagenes")
    @Operation(summary = "Registrar URL de imagen ya subida a Supabase")
    public ResponseEntity<ImagenCampusResponse> registrarImagen(
            @PathVariable Long id, @Valid @RequestBody RegistrarImagenCampusRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(imagenUseCase.registrar(id, request));
    }

    @GetMapping("/{id}/imagenes")
    @Operation(summary = "Listar imágenes de un campus (filtrable por categoría)")
    public ResponseEntity<List<ImagenCampusResponse>> listarImagenes(
            @PathVariable Long id,
            @RequestParam(required = false) String categoria) {
        return ResponseEntity.ok(imagenUseCase.listarPorCampus(id, categoria));
    }

    @DeleteMapping("/{id}/imagenes/{imagenId}")
    @Operation(summary = "Eliminar una imagen de campus")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void eliminarImagen(@PathVariable Long id, @PathVariable Long imagenId) {
        imagenUseCase.eliminar(imagenId);
    }

    @GetMapping("/catalogos/categoria-imagen-campus")
    @Operation(summary = "Listar categorías de imagen disponibles")
    public ResponseEntity<List<CategoriaImagenResponse>> listarCategorias() {
        return ResponseEntity.ok(categoriaUseCase.listar());
    }

    @PostMapping("/programas/{programaId}/campus/{campusId}")
    @Operation(summary = "Vincular un programa a un campus")
    @ResponseStatus(HttpStatus.CREATED)
    public void vincularProgramaCampus(@PathVariable Long programaId, @PathVariable Long campusId) {
        programaCampusUseCase.vincular(programaId, campusId);
    }

    @GetMapping("/programas/{programaId}/campus")
    @Operation(summary = "Campus donde se dicta un programa")
    public ResponseEntity<?> campusDePrograma(@PathVariable Long programaId) {
        return ResponseEntity.ok(programaCampusUseCase.campusDePrograma(programaId));
    }
}
