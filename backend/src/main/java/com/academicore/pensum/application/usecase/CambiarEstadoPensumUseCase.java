package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.CambiarEstadoPensumRequest;
import com.academicore.pensum.application.dto.PlanEstudiosResponse;
import com.academicore.pensum.domain.exception.BusinessException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.domain.repository.PlanEstudiosRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CambiarEstadoPensumUseCase {

    private final PlanEstudiosRepository planEstudiosRepository;
    private final CrearPlanEstudiosUseCase crearPlanEstudiosUseCase;

    @Transactional
    public PlanEstudiosResponse execute(Long planId, CambiarEstadoPensumRequest request) {
        PlanEstudios plan = planEstudiosRepository.findById(planId)
                .orElseThrow(() -> new NotFoundException("Plan de estudios", "id", planId));

        EstadoPensum nuevoEstado;
        try {
            nuevoEstado = EstadoPensum.valueOf(request.getNuevoEstado());
        } catch (IllegalArgumentException e) {
            throw new BusinessException("ESTADO_INVALIDO",
                    "Estado no válido: " + request.getNuevoEstado()
                    + ". Valores permitidos: EN_DISENO, APROBADO, VIGENTE, EN_EXTINCION, HISTORICO, CANCELADO");
        }

        switch (nuevoEstado) {
            case APROBADO -> plan.aprobar();
            case VIGENTE -> plan.activar();
            case EN_EXTINCION -> plan.ponerEnExtincion();
            case HISTORICO -> plan.historificar();
            case CANCELADO -> plan.cancelar();
            default -> throw new BusinessException("TRANSICION_INVALIDA",
                    "No se puede transicionar directamente a: " + nuevoEstado);
        }

        PlanEstudios saved = planEstudiosRepository.save(plan);
        return crearPlanEstudiosUseCase.toResponse(saved);
    }
}
