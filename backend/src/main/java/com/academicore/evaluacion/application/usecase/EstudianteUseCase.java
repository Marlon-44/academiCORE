package com.academicore.evaluacion.application.usecase;

import com.academicore.evaluacion.application.dto.CrearEstudianteRequest;
import com.academicore.evaluacion.application.dto.EstudianteResponse;
import com.academicore.evaluacion.application.dto.EvaluacionEstudianteResponse;
import com.academicore.evaluacion.domain.model.Estudiante;
import com.academicore.evaluacion.domain.repository.CatalogoAcademicoPort;
import com.academicore.evaluacion.domain.repository.EstudianteRepository;
import com.academicore.evaluacion.domain.repository.EvaluacionesEstudiantePort;
import com.academicore.evaluacion.domain.repository.InscripcionEvaluacionRepository;
import com.academicore.evaluacion.domain.repository.EvaluacionDocenteRepository;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EstudianteUseCase {

    private final EstudianteRepository estudianteRepository;
    private final InscripcionEvaluacionRepository inscripcionRepository;
    private final EvaluacionDocenteRepository evaluacionRepository;
    private final CatalogoAcademicoPort catalogoAcademico;
    private final EvaluacionesEstudiantePort evaluacionesEstudiante;

    @Transactional(readOnly = true)
    public List<EstudianteResponse> listar() {
        return estudianteRepository.findAll().stream().map(this::toResponse).toList();
    }

    @Transactional(readOnly = true)
    public EstudianteResponse consultar(Long id) {
        return toResponse(buscar(id));
    }

    @Transactional
    public EstudianteResponse crear(CrearEstudianteRequest request) {
        estudianteRepository.findByNumeroDocumento(request.getNumeroDocumento().trim())
                .ifPresent(e -> {
                    throw new ConflictException(
                            "Ya existe un estudiante con el documento " + e.getNumeroDocumento());
                });
        Estudiante guardado = estudianteRepository.save(Estudiante.builder()
                .codigo(request.getCodigo() != null ? request.getCodigo().trim() : null)
                .numeroDocumento(request.getNumeroDocumento().trim())
                .sexo(request.getSexo())
                .nombres(request.getNombres().trim())
                .apellidos(request.getApellidos().trim())
                .email(request.getEmail() != null ? request.getEmail().trim() : null)
                .telefono(request.getTelefono())
                .direccion(request.getDireccion())
                .programaId(request.getProgramaId())
                .semestre(request.getSemestre())
                .estadoAcademico("NORMAL")
                .estadoIngreso("NO ESPECIFICA")
                .estado("ACTIVO")
                .build());
        return toResponse(guardado);
    }

    /** Listado del grupo: estudiantes inscritos en una evaluación. */
    @Transactional(readOnly = true)
    public List<EstudianteResponse> listarInscritos(Long evaluacionId) {
        evaluacionRepository.findById(evaluacionId)
                .orElseThrow(() -> new NotFoundException("EvaluacionDocente", evaluacionId));
        List<Long> ids = inscripcionRepository.findEstudianteIdsByEvaluacionId(evaluacionId);
        return estudianteRepository.findAllById(ids).stream()
                .map(this::toResponse)
                .toList();
    }

    /** Vista del estudiante: sus evaluaciones inscritas y si ya las respondió. */
    @Transactional(readOnly = true)
    public List<EvaluacionEstudianteResponse> evaluacionesDe(Long estudianteId) {
        buscar(estudianteId);
        return evaluacionesEstudiante.listar(estudianteId).stream()
                .map(EvaluacionEstudianteResponse::of)
                .toList();
    }

    private Estudiante buscar(Long id) {
        return estudianteRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Estudiante", id));
    }

    private EstudianteResponse toResponse(Estudiante e) {
        CatalogoAcademicoPort.ProgramaInfo programa =
                catalogoAcademico.findProgramaById(e.getProgramaId()).orElse(null);
        CatalogoAcademicoPort.PlanInfo plan =
                catalogoAcademico.findPlanEstudiosById(e.getPlanEstudiosId()).orElse(null);
        return EstudianteResponse.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .numeroDocumento(e.getNumeroDocumento())
                .sexo(e.getSexo())
                .nombres(e.getNombres())
                .apellidos(e.getApellidos())
                .nombreCompleto(e.getNombreCompleto())
                .email(e.getEmail())
                .telefono(e.getTelefono())
                .direccion(e.getDireccion())
                .programaId(e.getProgramaId())
                .programaCodigo(programa != null ? programa.codigoInterno() : null)
                .programaNombre(programa != null ? programa.nombre() : null)
                .semestre(e.getSemestre())
                .estadoAcademico(e.getEstadoAcademico())
                .estadoIngreso(e.getEstadoIngreso())
                .planEstudiosId(e.getPlanEstudiosId())
                .planCodigo(plan != null ? plan.codigoPensum() : null)
                .planNombre(plan != null ? plan.nombre() : null)
                .estado(e.getEstado())
                .build();
    }
}
