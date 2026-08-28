package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.AgregarNivelCurricularRequest;
import com.academicore.pensum.application.dto.NivelCurricularResponse;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.model.NivelCurricular;
import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.domain.repository.NivelCurricularRepository;
import com.academicore.pensum.domain.repository.PlanEstudiosRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AgregarNivelCurricularUseCase {

    private final NivelCurricularRepository nivelRepository;
    private final PlanEstudiosRepository planEstudiosRepository;

    @Transactional
    public NivelCurricularResponse execute(Long planEstudiosId, AgregarNivelCurricularRequest request) {
        PlanEstudios plan = planEstudiosRepository.findById(planEstudiosId)
                .orElseThrow(() -> new NotFoundException("Plan de estudios", "id", planEstudiosId));

        if (plan.getEstado() != EstadoPensum.EN_DISENO && plan.getEstado() != EstadoPensum.APROBADO) {
            throw new ConflictException("Solo se pueden agregar niveles a un pensum EN_DISENO o APROBADO. Estado actual: "
                    + plan.getEstado());
        }

        if (nivelRepository.existsByPlanEstudiosIdAndNumeroNivel(planEstudiosId, request.getNumeroNivel())) {
            throw new ConflictException("Ya existe el nivel " + request.getNumeroNivel()
                    + " en el pensum: " + planEstudiosId);
        }

        NivelCurricular nivel = NivelCurricular.builder()
                .planEstudiosId(planEstudiosId)
                .numeroNivel(request.getNumeroNivel())
                .nombre(request.getNombre())
                .build();

        NivelCurricular saved = nivelRepository.save(nivel);

        return NivelCurricularResponse.builder()
                .id(saved.getId())
                .planEstudiosId(saved.getPlanEstudiosId())
                .numeroNivel(saved.getNumeroNivel())
                .nombre(saved.getNombre())
                .build();
    }
}
