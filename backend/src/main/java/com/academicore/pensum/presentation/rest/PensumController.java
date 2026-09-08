package com.academicore.pensum.presentation.rest;

import com.academicore.pensum.application.dto.*;
import com.academicore.pensum.application.usecase.*;
import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.repository.*;
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
@Tag(name = "Pensum", description = "Gestión académica: universidad, facultad, departamentos, programas, planes de estudio y malla curricular")
public class PensumController {

    private final ConsultarPensumUseCase consultarPensumUseCase;
    private final ConsultarMallaCompletaUseCase consultarMallaCompletaUseCase;
    private final CrearUniversidadUseCase crearUniversidadUseCase;
    private final CrearFacultadUseCase crearFacultadUseCase;
    private final CrearDepartamentoAcademicoUseCase crearDepartamentoUseCase;
    private final CrearProgramaAcademicoUseCase crearProgramaUseCase;
    private final RegistrarAsignaturaUseCase registrarAsignaturaUseCase;
    private final CrearPlanEstudiosUseCase crearPlanEstudiosUseCase;
    private final AgregarNivelCurricularUseCase agregarNivelUseCase;
    private final AgregarAsignaturaAPlanUseCase agregarAsignaturaAPlanUseCase;
    private final DefinirRequisitoUseCase definirRequisitoUseCase;
    private final CambiarEstadoPensumUseCase cambiarEstadoPensumUseCase;

    private final UniversidadRepository universidadRepository;
    private final FacultadRepository facultadRepository;
    private final DepartamentoAcademicoRepository departamentoRepository;
    private final AsignaturaRepository asignaturaRepository;
    private final ProgramaAcademicoRepository programaRepository;
    private final NaturalezaAsignaturaRepository naturalezaRepository;
    private final TipoAsignaturaPlanRepository tipoAsignaturaPlanRepository;
    private final TipoRequisitoRepository tipoRequisitoRepository;
    private final PeriodicidadAcademicaRepository periodicidadRepository;

    // ==================== Universidades ====================

    @PostMapping("/universidades")
    @Operation(summary = "Crear universidad")
    public ResponseEntity<UniversidadResponse> crearUniversidad(@Valid @RequestBody CrearUniversidadRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(crearUniversidadUseCase.execute(request));
    }

    @GetMapping("/universidades")
    @Operation(summary = "Listar universidades")
    public ResponseEntity<List<UniversidadResponse>> listarUniversidades(
            @RequestParam(required = false) String estado) {
        List<UniversidadResponse> result = (estado != null
                ? universidadRepository.findByEstado(com.academicore.pensum.domain.model.EstadoUniversidad.valueOf(estado.toUpperCase()))
                : universidadRepository.findAll()
        ).stream().map(u -> UniversidadResponse.builder()
                .id(u.getId())
                .codigo(u.getCodigo())
                .nombre(u.getNombre())
                .fechaCreacion(u.getFechaCreacion())
                .estado(u.getEstado().name())
                .build()
        ).toList();
        return ResponseEntity.ok(result);
    }

    @GetMapping("/universidades/{codigo}")
    @Operation(summary = "Consultar universidad por código")
    public ResponseEntity<UniversidadResponse> consultarUniversidad(@PathVariable String codigo) {
        return ResponseEntity.ok(universidadRepository.findByCodigo(codigo)
                .map(u -> UniversidadResponse.builder()
                        .id(u.getId())
                        .codigo(u.getCodigo())
                        .nombre(u.getNombre())
                        .fechaCreacion(u.getFechaCreacion())
                        .estado(u.getEstado().name())
                        .build()
                ).orElseThrow());
    }

    // ==================== Facultades ====================

    @PostMapping("/facultades")
    @Operation(summary = "Crear facultad")
    public ResponseEntity<FacultadResponse> crearFacultad(@Valid @RequestBody CrearFacultadRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(crearFacultadUseCase.execute(request));
    }

    @GetMapping("/facultades")
    @Operation(summary = "Listar facultades de una universidad")
    public ResponseEntity<List<FacultadResponse>> listarFacultades(
            @RequestParam Long universidadId,
            @RequestParam(required = false) String estado) {
        List<FacultadResponse> result = (estado != null
                ? facultadRepository.findByUniversidadIdAndEstado(universidadId,
                        com.academicore.pensum.domain.model.EstadoFacultad.valueOf(estado.toUpperCase()))
                : facultadRepository.findByUniversidadId(universidadId)
        ).stream().map(f -> FacultadResponse.builder()
                .id(f.getId())
                .universidadId(f.getUniversidadId())
                .codigo(f.getCodigo())
                .nombre(f.getNombre())
                .fechaCreacion(f.getFechaCreacion())
                .estado(f.getEstado().name())
                .build()
        ).toList();
        return ResponseEntity.ok(result);
    }

    @GetMapping("/facultades/{id}")
    @Operation(summary = "Consultar facultad por ID")
    public ResponseEntity<FacultadResponse> consultarFacultad(@PathVariable Long id) {
        return ResponseEntity.ok(facultadRepository.findById(id)
                .map(f -> FacultadResponse.builder()
                        .id(f.getId())
                        .universidadId(f.getUniversidadId())
                        .codigo(f.getCodigo())
                        .nombre(f.getNombre())
                        .fechaCreacion(f.getFechaCreacion())
                        .estado(f.getEstado().name())
                        .build()
                ).orElseThrow());
    }

    // ==================== Departamentos ====================

    @PostMapping("/departamentos")
    @Operation(summary = "Crear departamento académico")
    public ResponseEntity<DepartamentoResponse> crearDepartamento(@Valid @RequestBody CrearDepartamentoRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(crearDepartamentoUseCase.execute(request));
    }

    @GetMapping("/departamentos")
    @Operation(summary = "Listar departamentos de una facultad")
    public ResponseEntity<List<DepartamentoResponse>> listarDepartamentos(@RequestParam Long facultadId) {
        return ResponseEntity.ok(departamentoRepository.findByFacultadId(facultadId).stream()
                .map(d -> DepartamentoResponse.builder()
                        .id(d.getId())
                        .facultadId(d.getFacultadId())
                        .codigo(d.getCodigo())
                        .nombre(d.getNombre())
                        .estado(d.getEstado().name())
                        .build()
                ).toList());
    }

    // ==================== Asignaturas (catálogo institucional) ====================

    @PostMapping("/asignaturas")
    @Operation(summary = "Registrar asignatura en el catálogo institucional")
    public ResponseEntity<AsignaturaResponse> registrarAsignatura(@Valid @RequestBody RegistrarAsignaturaRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(registrarAsignaturaUseCase.execute(request));
    }

    @GetMapping("/asignaturas")
    @Operation(summary = "Listar asignaturas del catálogo de un departamento")
    public ResponseEntity<List<AsignaturaResponse>> listarAsignaturas(
            @RequestParam Long departamentoId,
            @RequestParam(required = false) String estado) {
        List<AsignaturaResponse> result = (estado != null
                ? asignaturaRepository.findByDepartamentoIdAndEstado(departamentoId,
                        com.academicore.pensum.domain.model.EstadoAsignatura.valueOf(estado.toUpperCase()))
                : asignaturaRepository.findByDepartamentoId(departamentoId)
        ).stream().map(a -> AsignaturaResponse.builder()
                .id(a.getId())
                .departamentoId(a.getDepartamentoId())
                .codigo(a.getCodigo())
                .nombre(a.getNombre())
                .descripcion(a.getDescripcion())
                .estado(a.getEstado().name())
                .fechaCreacion(a.getFechaCreacion())
                .naturalezas(List.of())
                .build()
        ).toList();
        return ResponseEntity.ok(result);
    }

    // ==================== Programas académicos ====================

    @PostMapping("/programas")
    @Operation(summary = "Crear programa académico")
    public ResponseEntity<ProgramaResponse> crearPrograma(@Valid @RequestBody CrearProgramaRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(crearProgramaUseCase.execute(request));
    }

    @GetMapping("/programas/{codigoInterno}")
    @Operation(summary = "Consultar programa por código interno")
    public ResponseEntity<ProgramaResponse> consultarPrograma(@PathVariable String codigoInterno) {
        return ResponseEntity.ok(programaRepository.findByFacultadIdAndCodigoInterno(null, codigoInterno)
                .or(() -> programaRepository.findAll().stream()
                        .filter(p -> p.getCodigoInterno().equals(codigoInterno))
                        .findFirst())
                .map(p -> ProgramaResponse.builder()
                        .id(p.getId())
                        .facultadId(p.getFacultadId())
                        .codigoInterno(p.getCodigoInterno())
                        .codigoSnies(p.getCodigoSnies())
                        .nombre(p.getNombre())
                        .creditosTotales(p.getCreditosTotales())
                        .estado(p.getEstado().name())
                        .fechaCreacion(p.getFechaCreacion())
                        .build()
                ).orElseThrow());
    }

    @GetMapping("/facultades/{id}/programas")
    @Operation(summary = "Listar programas de una facultad")
    public ResponseEntity<List<ProgramaResponse>> listarProgramas(@PathVariable Long id) {
        return ResponseEntity.ok(programaRepository.findByFacultadId(id).stream()
                .map(p -> ProgramaResponse.builder()
                        .id(p.getId())
                        .facultadId(p.getFacultadId())
                        .codigoInterno(p.getCodigoInterno())
                        .codigoSnies(p.getCodigoSnies())
                        .nombre(p.getNombre())
                        .creditosTotales(p.getCreditosTotales())
                        .estado(p.getEstado().name())
                        .fechaCreacion(p.getFechaCreacion())
                        .build()
                ).toList());
    }

    // ==================== Planes de estudio (Pensums) ====================

    @PostMapping("/pensums")
    @Operation(summary = "Crear un pensum (estado EN_DISENO)")
    public ResponseEntity<PlanEstudiosResponse> crearPensum(@Valid @RequestBody CrearPlanEstudiosRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(crearPlanEstudiosUseCase.execute(request));
    }

    @PatchMapping("/pensums/{id}/estado")
    @Operation(summary = "Cambiar estado del pensum (aprobar, activar, poner en extinción, etc.)")
    public ResponseEntity<PlanEstudiosResponse> cambiarEstadoPensum(
            @PathVariable Long id, @Valid @RequestBody CambiarEstadoPensumRequest request) {
        return ResponseEntity.ok(cambiarEstadoPensumUseCase.execute(id, request));
    }

    @GetMapping("/pensums/{id}")
    @Operation(summary = "Consultar plan de estudios por ID")
    public ResponseEntity<PlanEstudiosResponse> consultarPensum(@PathVariable Long id) {
        return ResponseEntity.ok(consultarPensumUseCase.consultarPorId(id));
    }

    @GetMapping("/pensums")
    @Operation(summary = "Listar pensums de un programa, filtrable por estado")
    public ResponseEntity<List<PlanEstudiosResponse>> listarPensums(
            @RequestParam Long programaId,
            @RequestParam(required = false) String estado) {
        EstadoPensum estadoEnum = estado != null ? EstadoPensum.valueOf(estado.toUpperCase()) : null;
        return ResponseEntity.ok(consultarPensumUseCase.listarPorPrograma(programaId, estadoEnum));
    }

    @GetMapping("/pensums/programa/{programaId}/vigente")
    @Operation(summary = "Consultar el plan de estudios vigente de un programa")
    public ResponseEntity<PlanEstudiosResponse> consultarPensumVigente(@PathVariable Long programaId) {
        return ResponseEntity.ok(consultarPensumUseCase.consultarVigentePorPrograma(programaId));
    }

    @GetMapping("/pensums/{id}/malla")
    @Operation(summary = "Consultar malla curricular completa de un plan de estudios")
    public ResponseEntity<MallaCurricularResponse> consultarMalla(@PathVariable Long id) {
        return ResponseEntity.ok(consultarMallaCompletaUseCase.execute(id));
    }

    // ==================== Niveles curriculares ====================

    @PostMapping("/pensums/{id}/niveles")
    @Operation(summary = "Agregar un nivel curricular al pensum")
    public ResponseEntity<NivelCurricularResponse> agregarNivel(
            @PathVariable Long id, @Valid @RequestBody AgregarNivelCurricularRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(agregarNivelUseCase.execute(id, request));
    }

    // ==================== Plan-asignaturas ====================

    @PostMapping("/pensums/{id}/plan-asignaturas")
    @Operation(summary = "Vincular una asignatura del catálogo a un nivel del pensum")
    public ResponseEntity<PlanAsignaturaResponse> agregarAsignaturaAPlan(
            @PathVariable Long id, @Valid @RequestBody AgregarAsignaturaAPlanRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(agregarAsignaturaAPlanUseCase.execute(id, request));
    }

    // ==================== Requisitos ====================

    @PostMapping("/pensums/{id}/plan-asignaturas/{planAsignaturaId}/requisitos")
    @Operation(summary = "Definir prerrequisito/correquisito/antirrequisito")
    public ResponseEntity<RequisitoResponse> definirRequisito(
            @PathVariable Long id,
            @PathVariable Long planAsignaturaId,
            @Valid @RequestBody DefinirRequisitoRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(definirRequisitoUseCase.execute(id, planAsignaturaId, request));
    }

    // ==================== Catálogos ====================

    @GetMapping("/catalogos/naturaleza-asignatura")
    @Operation(summary = "Listar naturalezas de asignatura disponibles")
    public ResponseEntity<List<NaturalezaAsignaturaResponse>> listarNaturalezas() {
        return ResponseEntity.ok(naturalezaRepository.findAll().stream()
                .map(n -> NaturalezaAsignaturaResponse.builder()
                        .id(n.getId())
                        .codigo(n.getCodigo())
                        .nombre(n.getNombre())
                        .descripcion(n.getDescripcion())
                        .build()
                ).toList());
    }

    @GetMapping("/catalogos/tipo-asignatura-plan")
    @Operation(summary = "Listar tipos de asignatura de plan disponibles")
    public ResponseEntity<List<TipoAsignaturaPlanResponse>> listarTiposAsignaturaPlan() {
        return ResponseEntity.ok(tipoAsignaturaPlanRepository.findAll().stream()
                .map(t -> TipoAsignaturaPlanResponse.builder()
                        .id(t.getId())
                        .codigo(t.getCodigo())
                        .nombre(t.getNombre())
                        .build()
                ).toList());
    }

    @GetMapping("/catalogos/tipo-requisito")
    @Operation(summary = "Listar tipos de requisito disponibles")
    public ResponseEntity<List<TipoRequisitoResponse>> listarTiposRequisito() {
        return ResponseEntity.ok(tipoRequisitoRepository.findAll().stream()
                .map(t -> TipoRequisitoResponse.builder()
                        .id(t.getId())
                        .codigo(t.getCodigo())
                        .nombre(t.getNombre())
                        .build()
                ).toList());
    }

    @GetMapping("/catalogos/periodicidad-academica")
    @Operation(summary = "Listar periodicidades académicas disponibles")
    public ResponseEntity<List<PeriodicidadAcademicaResponse>> listarPeriodicidades() {
        return ResponseEntity.ok(periodicidadRepository.findAll().stream()
                .map(p -> PeriodicidadAcademicaResponse.builder()
                        .id(p.getId())
                        .codigo(p.getCodigo())
                        .nombre(p.getNombre())
                        .duracionMeses(p.getDuracionMeses())
                        .build()
                ).toList());
    }
}
