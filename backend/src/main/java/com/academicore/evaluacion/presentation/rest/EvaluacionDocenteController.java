package com.academicore.evaluacion.presentation.rest;

import com.academicore.evaluacion.application.dto.ActualizarPreguntaRequest;
import com.academicore.evaluacion.application.dto.CambiarEstadoRequest;
import com.academicore.evaluacion.application.dto.CategoriaPreguntaResponse;
import com.academicore.evaluacion.application.dto.CrearCategoriaRequest;
import com.academicore.evaluacion.application.dto.CrearDocenteRequest;
import com.academicore.evaluacion.application.dto.CrearEstudianteRequest;
import com.academicore.evaluacion.application.dto.CrearEvaluacionRequest;
import com.academicore.evaluacion.application.dto.CrearPreguntaRequest;
import com.academicore.evaluacion.application.dto.DocenteGraficasResponse;
import com.academicore.evaluacion.application.dto.DocenteReporteResponse;
import com.academicore.evaluacion.application.dto.DocenteResponse;
import com.academicore.evaluacion.application.dto.EncuestaGraficaResponse;
import com.academicore.evaluacion.application.dto.EncuestaResponse;
import com.academicore.evaluacion.application.dto.EstudianteResponse;
import com.academicore.evaluacion.application.dto.EvaluacionGraficasResponse;
import com.academicore.evaluacion.application.dto.EvaluacionResponse;
import com.academicore.evaluacion.application.dto.PreguntaResponse;
import com.academicore.evaluacion.application.dto.RegistrarEncuestaRequest;
import com.academicore.evaluacion.application.usecase.CatalogoEvaluacionUseCase;
import com.academicore.evaluacion.application.usecase.DocenteUseCase;
import com.academicore.evaluacion.application.usecase.EncuestaUseCase;
import com.academicore.evaluacion.application.usecase.EstudianteUseCase;
import com.academicore.evaluacion.application.usecase.EvaluacionDocenteUseCase;
import com.academicore.evaluacion.application.usecase.GraficasUseCase;
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
@RequestMapping("/api/v1/evaluacion-docente")
@RequiredArgsConstructor
@Tag(name = "Evaluación Docente",
     description = "Instrumento de evaluación docente administrable (preguntas Likert 1-5 "
             + "y de texto abierto) con análisis de sentimiento por respuesta de texto "
             + "y datos listos para graficar")
public class EvaluacionDocenteController {

    private final DocenteUseCase docenteUseCase;
    private final CatalogoEvaluacionUseCase catalogoUseCase;
    private final EvaluacionDocenteUseCase evaluacionUseCase;
    private final EncuestaUseCase encuestaUseCase;
    private final GraficasUseCase graficasUseCase;
    private final EstudianteUseCase estudianteUseCase;

    // ============================================================
    // Docentes
    // ============================================================

    @PostMapping("/docentes")
    @Operation(summary = "Registrar un docente")
    public ResponseEntity<DocenteResponse> crearDocente(@Valid @RequestBody CrearDocenteRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(docenteUseCase.crear(request));
    }

    @GetMapping("/docentes")
    @Operation(summary = "Listar docentes (filtrable por estado)")
    public ResponseEntity<List<DocenteResponse>> listarDocentes(
            @Parameter(description = "Filtrar por estado (ACTIVO, INACTIVO)")
            @RequestParam(required = false) String estado) {
        return ResponseEntity.ok(docenteUseCase.listar(estado));
    }

    @GetMapping("/docentes/{id}")
    @Operation(summary = "Detalle de un docente")
    public ResponseEntity<DocenteResponse> consultarDocente(@PathVariable Long id) {
        return ResponseEntity.ok(docenteUseCase.consultar(id));
    }

    @PatchMapping("/docentes/{id}/estado")
    @Operation(summary = "Activar/inactivar un docente")
    public ResponseEntity<DocenteResponse> cambiarEstadoDocente(
            @PathVariable Long id, @Valid @RequestBody CambiarEstadoRequest request) {
        return ResponseEntity.ok(docenteUseCase.cambiarEstado(id, request.getEstado()));
    }

    @GetMapping("/docentes/{id}/graficas")
    @Operation(summary = "Gráficas globales del docente: radar por categoría, "
            + "comparativo de materias, evolución por periodo, sentimientos, "
            + "nube de palabras y ranking de preguntas. "
            + "Con ?asignaturaId se limita a una materia en específico")
    public ResponseEntity<DocenteGraficasResponse> graficasDocente(
            @PathVariable Long id,
            @Parameter(description = "Limitar a una asignatura específica")
            @RequestParam(required = false) Long asignaturaId) {
        return ResponseEntity.ok(graficasUseCase.graficasDocente(id, asignaturaId));
    }

    @GetMapping("/docentes/{id}/reporte")
    @Operation(summary = "Reporte completo para el docente: todas las respuestas de texto "
            + "que los estudiantes escribieron sobre él, agrupadas por evaluación "
            + "(materia, grupo y periodo). Con ?asignaturaId se limita a una materia")
    public ResponseEntity<DocenteReporteResponse> reporteDocente(
            @PathVariable Long id,
            @Parameter(description = "Limitar a una asignatura específica")
            @RequestParam(required = false) Long asignaturaId) {
        return ResponseEntity.ok(graficasUseCase.reporteDocente(id, asignaturaId));
    }

    // ============================================================
    // Estudiantes
    // ============================================================

    @PostMapping("/estudiantes")
    @Operation(summary = "Registrar un estudiante")
    public ResponseEntity<EstudianteResponse> crearEstudiante(
            @Valid @RequestBody CrearEstudianteRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(estudianteUseCase.crear(request));
    }

    @GetMapping("/estudiantes")
    @Operation(summary = "Listar estudiantes")
    public ResponseEntity<List<EstudianteResponse>> listarEstudiantes() {
        return ResponseEntity.ok(estudianteUseCase.listar());
    }

    @GetMapping("/estudiantes/{id}")
    @Operation(summary = "Detalle de un estudiante")
    public ResponseEntity<EstudianteResponse> consultarEstudiante(@PathVariable Long id) {
        return ResponseEntity.ok(estudianteUseCase.consultar(id));
    }

    @GetMapping("/estudiantes/{id}/encuestas")
    @Operation(summary = "Detalle de cada encuesta que respondió el estudiante "
            + "(vista administrativa: una encuesta por evaluación respondida)")
    public ResponseEntity<List<EncuestaResponse>> encuestasDeEstudiante(@PathVariable Long id) {
        return ResponseEntity.ok(encuestaUseCase.listarPorEstudiante(id));
    }

    // ============================================================
    // Catálogo de preguntas (instrumento administrable)
    // ============================================================

    @GetMapping("/preguntas")
    @Operation(summary = "Listar preguntas del instrumento. Por defecto solo las activas; "
            + "con ?soloActivas=false incluye también las inactivas")
    public ResponseEntity<List<PreguntaResponse>> listarPreguntas(
            @Parameter(description = "true = solo activas (instrumento vigente), false = todas")
            @RequestParam(defaultValue = "true") boolean soloActivas) {
        return ResponseEntity.ok(catalogoUseCase.listarPreguntas(soloActivas));
    }

    @PostMapping("/preguntas")
    @Operation(summary = "Crear una pregunta nueva (LIKERT con escala 1-5 o TEXTO con "
            + "análisis de sentimiento). Si no se envía numero se asigna el siguiente disponible")
    public ResponseEntity<PreguntaResponse> crearPregunta(
            @Valid @RequestBody CrearPreguntaRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(catalogoUseCase.crearPregunta(request));
    }

    @PutMapping("/preguntas/{id}")
    @Operation(summary = "Actualizar texto, número, categoría o tipo de una pregunta "
            + "(el tipo no puede cambiarse si ya tiene respuestas)")
    public ResponseEntity<PreguntaResponse> actualizarPregunta(
            @PathVariable Long id, @Valid @RequestBody ActualizarPreguntaRequest request) {
        return ResponseEntity.ok(catalogoUseCase.actualizarPregunta(id, request));
    }

    @PatchMapping("/preguntas/{id}/estado")
    @Operation(summary = "Activar/inactivar una pregunta (ACTIVA o INACTIVA)")
    public ResponseEntity<PreguntaResponse> cambiarEstadoPregunta(
            @PathVariable Long id, @Valid @RequestBody CambiarEstadoRequest request) {
        return ResponseEntity.ok(catalogoUseCase.cambiarEstadoPregunta(id, request.getEstado()));
    }

    @DeleteMapping("/preguntas/{id}")
    @Operation(summary = "Eliminar una pregunta. Solo es posible si no tiene respuestas "
            + "registradas; de lo contrario se recomienda inactivarla")
    public ResponseEntity<Void> eliminarPregunta(@PathVariable Long id) {
        catalogoUseCase.eliminarPregunta(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/categorias")
    @Operation(summary = "Listar categorías de preguntas con su conteo")
    public ResponseEntity<List<CategoriaPreguntaResponse>> listarCategorias() {
        return ResponseEntity.ok(catalogoUseCase.listarCategorias());
    }

    @PostMapping("/categorias")
    @Operation(summary = "Crear una categoría nueva para agrupar preguntas")
    public ResponseEntity<CategoriaPreguntaResponse> crearCategoria(
            @Valid @RequestBody CrearCategoriaRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(catalogoUseCase.crearCategoria(request));
    }

    // ============================================================
    // Evaluaciones (asignación docente + asignatura + grupo + periodo)
    // ============================================================

    @PostMapping("/evaluaciones")
    @Operation(summary = "Crear una evaluación para un docente en una asignatura/grupo/periodo")
    public ResponseEntity<EvaluacionResponse> crearEvaluacion(
            @Valid @RequestBody CrearEvaluacionRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(evaluacionUseCase.crear(request));
    }

    @GetMapping("/evaluaciones")
    @Operation(summary = "Listar evaluaciones (filtrable por docente, asignatura y periodo)")
    public ResponseEntity<List<EvaluacionResponse>> listarEvaluaciones(
            @RequestParam(required = false) Long docenteId,
            @RequestParam(required = false) Long asignaturaId,
            @RequestParam(required = false) String periodo) {
        return ResponseEntity.ok(evaluacionUseCase.listar(docenteId, asignaturaId, periodo));
    }

    @GetMapping("/evaluaciones/{id}")
    @Operation(summary = "Detalle de una evaluación")
    public ResponseEntity<EvaluacionResponse> consultarEvaluacion(@PathVariable Long id) {
        return ResponseEntity.ok(evaluacionUseCase.consultar(id));
    }

    @PatchMapping("/evaluaciones/{id}/estado")
    @Operation(summary = "Abrir/cerrar una evaluación")
    public ResponseEntity<EvaluacionResponse> cambiarEstadoEvaluacion(
            @PathVariable Long id, @Valid @RequestBody CambiarEstadoRequest request) {
        return ResponseEntity.ok(evaluacionUseCase.cambiarEstado(id, request.getEstado()));
    }

    @GetMapping("/evaluaciones/{id}/encuestas")
    @Operation(summary = "Listar encuestas respondidas de una evaluación "
            + "(incluye qué estudiante respondió cada una)")
    public ResponseEntity<List<EncuestaResponse>> encuestasDeEvaluacion(@PathVariable Long id) {
        return ResponseEntity.ok(encuestaUseCase.listarPorEvaluacion(id));
    }

    @GetMapping("/evaluaciones/{id}/inscritos")
    @Operation(summary = "Listar los estudiantes inscritos en el grupo de una evaluación")
    public ResponseEntity<List<EstudianteResponse>> inscritosDeEvaluacion(@PathVariable Long id) {
        return ResponseEntity.ok(estudianteUseCase.listarInscritos(id));
    }

    @GetMapping("/evaluaciones/{id}/graficas")
    @Operation(summary = "Gráficas agregadas de la evaluación: participación, radar por categoría, "
            + "promedio y distribución por pregunta, histograma Likert, sentimientos, "
            + "nube de palabras y comentarios destacados")
    public ResponseEntity<EvaluacionGraficasResponse> graficasEvaluacion(@PathVariable Long id) {
        return ResponseEntity.ok(graficasUseCase.graficasEvaluacion(id));
    }

    // ============================================================
    // Encuestas (respuesta individual del estudiante)
    // ============================================================

    @PostMapping("/encuestas")
    @Operation(summary = "Responder una encuesta: todas las preguntas activas "
            + "(valor 1-5 para LIKERT, textoRespuesta para TEXTO). "
            + "Con estudianteId el estudiante debe estar inscrito y no repetir encuesta. "
            + "Cada respuesta de texto recibe análisis de sentimiento automático")
    public ResponseEntity<EncuestaResponse> registrarEncuesta(
            @Valid @RequestBody RegistrarEncuestaRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(encuestaUseCase.registrar(request));
    }

    @GetMapping("/encuestas/{id}")
    @Operation(summary = "Detalle de una encuesta respondida")
    public ResponseEntity<EncuestaResponse> consultarEncuesta(@PathVariable Long id) {
        return ResponseEntity.ok(encuestaUseCase.consultar(id));
    }

    @GetMapping("/encuestas/{id}/grafica")
    @Operation(summary = "Gráfica de una encuesta individual: radar por categoría, "
            + "barras por pregunta Likert y respuestas de texto con su sentimiento")
    public ResponseEntity<EncuestaGraficaResponse> graficaEncuesta(@PathVariable Long id) {
        return ResponseEntity.ok(graficasUseCase.graficaEncuesta(id));
    }
}
