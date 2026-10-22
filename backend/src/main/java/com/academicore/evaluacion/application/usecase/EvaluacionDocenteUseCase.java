package com.academicore.evaluacion.application.usecase;

import com.academicore.evaluacion.application.dto.CrearEvaluacionRequest;
import com.academicore.evaluacion.application.dto.EvaluacionResponse;
import com.academicore.evaluacion.domain.model.EstadoEvaluacion;
import com.academicore.evaluacion.domain.model.EvaluacionDocente;
import com.academicore.evaluacion.domain.repository.AsignaturaCatalogPort;
import com.academicore.evaluacion.domain.repository.DocenteRepository;
import com.academicore.evaluacion.domain.repository.EncuestaRepository;
import com.academicore.evaluacion.domain.repository.EvaluacionDocenteRepository;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class EvaluacionDocenteUseCase {

    private static final String GRUPO_DEFAULT = "A1";

    private final EvaluacionDocenteRepository evaluacionRepository;
    private final DocenteRepository docenteRepository;
    private final EncuestaRepository encuestaRepository;
    private final AsignaturaCatalogPort asignaturaCatalog;

    @Transactional
    public EvaluacionResponse crear(CrearEvaluacionRequest request) {
        if (docenteRepository.findById(request.getDocenteId()).isEmpty()) {
            throw new NotFoundException("Docente", "id", request.getDocenteId());
        }
        asignaturaCatalog.findById(request.getAsignaturaId())
                .orElseThrow(() -> new NotFoundException("Asignatura", "id", request.getAsignaturaId()));

        String grupo = request.getGrupo() != null && !request.getGrupo().isBlank()
                ? request.getGrupo().trim().toUpperCase() : GRUPO_DEFAULT;

        if (evaluacionRepository.existsByDocenteAsignaturaGrupoPeriodo(
                request.getDocenteId(), request.getAsignaturaId(), grupo, request.getPeriodo())) {
            throw new ConflictException("Ya existe una evaluación para ese docente, asignatura, grupo y periodo");
        }

        EvaluacionDocente evaluacion = EvaluacionDocente.builder()
                .docenteId(request.getDocenteId())
                .asignaturaId(request.getAsignaturaId())
                .programaId(request.getProgramaId())
                .grupo(grupo)
                .periodo(request.getPeriodo())
                .estudiantesEsperados(request.getEstudiantesEsperados())
                .estado(EstadoEvaluacion.ABIERTA)
                .fechaCreacion(LocalDateTime.now())
                .build();

        return toResponse(evaluacionRepository.save(evaluacion));
    }

    @Transactional(readOnly = true)
    public EvaluacionResponse consultar(Long id) {
        EvaluacionDocente evaluacion = evaluacionRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("EvaluacionDocente", "id", id));
        return toResponse(evaluacion);
    }

    @Transactional(readOnly = true)
    public List<EvaluacionResponse> listar(Long docenteId, Long asignaturaId, String periodo) {
        List<EvaluacionDocente> evaluaciones =
                evaluacionRepository.buscar(docenteId, asignaturaId, periodo);
        Map<Long, AsignaturaCatalogPort.AsignaturaInfo> asignaturas = asignaturaCatalog.findByIds(
                evaluaciones.stream().map(EvaluacionDocente::getAsignaturaId).distinct().toList());
        return evaluaciones.stream()
                .map(e -> toResponse(e, asignaturas.get(e.getAsignaturaId())))
                .toList();
    }

    @Transactional
    public EvaluacionResponse cambiarEstado(Long id, String nuevoEstado) {
        EvaluacionDocente evaluacion = evaluacionRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("EvaluacionDocente", "id", id));
        evaluacion.setEstado(EstadoEvaluacion.valueOf(nuevoEstado.toUpperCase()));
        return toResponse(evaluacionRepository.save(evaluacion));
    }

    public EvaluacionResponse toResponse(EvaluacionDocente e) {
        return toResponse(e, asignaturaCatalog.findById(e.getAsignaturaId()).orElse(null));
    }

    private EvaluacionResponse toResponse(EvaluacionDocente e, AsignaturaCatalogPort.AsignaturaInfo asignatura) {
        String docenteNombre = docenteRepository.findById(e.getDocenteId())
                .map(d -> d.getNombres() + " " + d.getApellidos())
                .orElse(null);
        return EvaluacionResponse.builder()
                .id(e.getId())
                .docenteId(e.getDocenteId())
                .docenteNombre(docenteNombre != null ? docenteNombre.trim() : null)
                .asignaturaId(e.getAsignaturaId())
                .asignaturaCodigo(asignatura != null ? asignatura.codigo() : null)
                .asignaturaNombre(asignatura != null ? asignatura.nombre() : null)
                .programaId(e.getProgramaId())
                .grupo(e.getGrupo())
                .periodo(e.getPeriodo())
                .estudiantesEsperados(e.getEstudiantesEsperados())
                .encuestasRespondidas(encuestaRepository.countByEvaluacionId(e.getId()))
                .estado(e.getEstado() != null ? e.getEstado().name() : null)
                .fechaCreacion(e.getFechaCreacion())
                .build();
    }
}
