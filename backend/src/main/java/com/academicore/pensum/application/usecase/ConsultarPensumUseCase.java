package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.PlanEstudiosResponse;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.domain.repository.PlanEstudiosRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ConsultarPensumUseCase {

    private final PlanEstudiosRepository planEstudiosRepository;
    private final CrearPlanEstudiosUseCase crearPlanEstudiosUseCase;

    @Transactional(readOnly = true)
    public PlanEstudiosResponse consultarPorId(Long id) {
        PlanEstudios plan = planEstudiosRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Plan de estudios", "id", id));
        return crearPlanEstudiosUseCase.toResponse(plan);
    }

    @Transactional(readOnly = true)
    public List<PlanEstudiosResponse> listarPorPrograma(Long programaId, EstadoPensum estado) {
        List<PlanEstudios> planes;
        if (estado != null) {
            planes = planEstudiosRepository.findByProgramaIdAndEstado(programaId, estado);
        } else {
            planes = planEstudiosRepository.findByProgramaId(programaId);
        }
        return planes.stream()
                .map(crearPlanEstudiosUseCase::toResponse)
                .toList();
    }

    @Transactional(readOnly = true)
    public PlanEstudiosResponse consultarVigentePorPrograma(Long programaId) {
        PlanEstudios plan = planEstudiosRepository.findVigenteByProgramaId(programaId)
                .orElseThrow(() -> new NotFoundException("Plan de estudios vigente", "programaId", programaId));
        return crearPlanEstudiosUseCase.toResponse(plan);
    }
}
