package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.CrearPlanEstudiosRequest;
import com.academicore.pensum.application.dto.PlanEstudiosResponse;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.model.EstadoPrograma;
import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.domain.model.ProgramaAcademico;
import com.academicore.pensum.domain.repository.PeriodicidadAcademicaRepository;
import com.academicore.pensum.domain.repository.PlanEstudiosRepository;
import com.academicore.pensum.domain.repository.ProgramaAcademicoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@RequiredArgsConstructor
public class CrearPlanEstudiosUseCase {

    private final PlanEstudiosRepository planEstudiosRepository;
    private final ProgramaAcademicoRepository programaRepository;
    private final PeriodicidadAcademicaRepository periodicidadRepository;

    @Transactional
    public PlanEstudiosResponse execute(CrearPlanEstudiosRequest request) {
        ProgramaAcademico programa = programaRepository.findById(request.getProgramaId())
                .orElseThrow(() -> new NotFoundException("Programa", "id", request.getProgramaId()));

        if (programa.getEstado() == EstadoPrograma.INACTIVO || programa.getEstado() == EstadoPrograma.SUSPENDIDO) {
            throw new ConflictException("El programa no está disponible para crear pensums (estado: "
                    + programa.getEstado() + ")");
        }

        periodicidadRepository.findById(request.getPeriodicidadId())
                .orElseThrow(() -> new NotFoundException("Periodicidad", "id", request.getPeriodicidadId()));

        if (planEstudiosRepository.existsByProgramaIdAndCodigoPensum(request.getProgramaId(), request.getCodigoPensum())) {
            throw new ConflictException("Ya existe un pensum con código: " + request.getCodigoPensum()
                    + " en el programa: " + request.getProgramaId());
        }

        if (request.getFechaVigenciaHasta() != null
                && request.getFechaVigenciaHasta().isBefore(request.getFechaVigenciaDesde())) {
            throw new ConflictException("La fecha de vigencia hasta no puede ser anterior a la fecha desde");
        }

        PlanEstudios plan = PlanEstudios.builder()
                .programaId(request.getProgramaId())
                .periodicidadId(request.getPeriodicidadId())
                .codigoPensum(request.getCodigoPensum())
                .nombre(request.getNombre())
                .numeroResolucion(request.getNumeroResolucion())
                .fechaAprobacion(request.getFechaAprobacion())
                .fechaVigenciaDesde(request.getFechaVigenciaDesde())
                .fechaVigenciaHasta(request.getFechaVigenciaHasta())
                .totalCreditos(request.getTotalCreditos())
                .estado(EstadoPensum.EN_DISENO)
                .build();

        PlanEstudios saved = planEstudiosRepository.save(plan);

        return toResponse(saved);
    }

    public PlanEstudiosResponse toResponse(PlanEstudios plan) {
        return PlanEstudiosResponse.builder()
                .id(plan.getId())
                .programaId(plan.getProgramaId())
                .periodicidadId(plan.getPeriodicidadId())
                .codigoPensum(plan.getCodigoPensum())
                .nombre(plan.getNombre())
                .numeroResolucion(plan.getNumeroResolucion())
                .fechaAprobacion(plan.getFechaAprobacion())
                .fechaVigenciaDesde(plan.getFechaVigenciaDesde())
                .fechaVigenciaHasta(plan.getFechaVigenciaHasta())
                .totalCreditos(plan.getTotalCreditos())
                .estado(plan.getEstado().name())
                .build();
    }
}
