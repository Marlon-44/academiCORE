package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.DefinirRequisitoRequest;
import com.academicore.pensum.application.dto.RequisitoResponse;
import com.academicore.pensum.domain.exception.BusinessException;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.PlanAsignatura;
import com.academicore.pensum.domain.model.RequisitoPlanAsignatura;
import com.academicore.pensum.domain.model.TipoRequisito;
import com.academicore.pensum.domain.repository.NivelCurricularRepository;
import com.academicore.pensum.domain.repository.PlanAsignaturaRepository;
import com.academicore.pensum.domain.repository.RequisitoPlanAsignaturaRepository;
import com.academicore.pensum.domain.repository.TipoRequisitoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class DefinirRequisitoUseCase {

    private final RequisitoPlanAsignaturaRepository requisitoRepository;
    private final PlanAsignaturaRepository planAsignaturaRepository;
    private final TipoRequisitoRepository tipoRequisitoRepository;
    private final NivelCurricularRepository nivelRepository;

    @Transactional
    public RequisitoResponse execute(Long planEstudiosId, Long planAsignaturaId, DefinirRequisitoRequest request) {
        PlanAsignatura asignatura = planAsignaturaRepository.findByIdWithDetails(planAsignaturaId)
                .orElseThrow(() -> new NotFoundException("PlanAsignatura", "id", planAsignaturaId));

        if (!asignatura.getPlanEstudiosId().equals(planEstudiosId)) {
            throw new ConflictException("La asignatura no pertenece al plan: " + planEstudiosId);
        }

        PlanAsignatura asignaturaRequerida = planAsignaturaRepository.findByIdWithDetails(request.getPlanAsignaturaRequeridaId())
                .orElseThrow(() -> new NotFoundException("PlanAsignatura requerida", "id", request.getPlanAsignaturaRequeridaId()));

        if (!asignaturaRequerida.getPlanEstudiosId().equals(planEstudiosId)) {
            throw new ConflictException("La asignatura requerida no pertenece al mismo plan: " + planEstudiosId);
        }

        if (planAsignaturaId.equals(request.getPlanAsignaturaRequeridaId())) {
            throw new BusinessException("INVALID_REQUISITO",
                    "Una asignatura no puede ser requisito de sí misma");
        }

        TipoRequisito tipoRequisito = tipoRequisitoRepository.findById(request.getTipoRequisitoId())
                .orElseThrow(() -> new NotFoundException("Tipo de requisito", "id", request.getTipoRequisitoId()));

        if (tipoRequisito.getCodigo().equals("PRERREQUISITO")) {
            int nivelAsignatura = getNumeroNivel(asignatura);
            int nivelRequerida = getNumeroNivel(asignaturaRequerida);
            if (nivelRequerida > nivelAsignatura) {
                throw new BusinessException("PRERREQUISITO_NIVEL_INVALIDO",
                        "Un prerrequisito debe estar en un nivel curricular anterior o igual. "
                                + "Nivel de la asignatura: " + nivelAsignatura
                                + ", nivel del prerrequisito: " + nivelRequerida);
            }
        }

        if (requisitoRepository.existsByPlanAsignaturaIdAndPlanAsignaturaRequeridaIdAndTipoRequisitoId(
                planAsignaturaId, request.getPlanAsignaturaRequeridaId(), request.getTipoRequisitoId())) {
            throw new ConflictException("Este requisito ya está definido para esta asignatura");
        }

        RequisitoPlanAsignatura requisito = RequisitoPlanAsignatura.builder()
                .planEstudiosId(planEstudiosId)
                .planAsignaturaId(planAsignaturaId)
                .planAsignaturaRequeridaId(request.getPlanAsignaturaRequeridaId())
                .tipoRequisitoId(request.getTipoRequisitoId())
                .build();

        RequisitoPlanAsignatura saved = requisitoRepository.save(requisito);

        return RequisitoResponse.builder()
                .id(saved.getId())
                .planAsignaturaRequeridaId(saved.getPlanAsignaturaRequeridaId())
                .asignaturaRequeridaCodigo(asignaturaRequerida.getAsignatura() != null
                        ? asignaturaRequerida.getAsignatura().getCodigo() : null)
                .asignaturaRequeridaNombre(asignaturaRequerida.getAsignatura() != null
                        ? asignaturaRequerida.getAsignatura().getNombre() : null)
                .tipoRequisito(tipoRequisito.getCodigo())
                .build();
    }

    private int getNumeroNivel(PlanAsignatura planAsignatura) {
        if (planAsignatura.getNivelCurricular() != null) {
            return planAsignatura.getNivelCurricular().getNumeroNivel();
        }
        return nivelRepository.findById(planAsignatura.getNivelCurricularId())
                .map(n -> n.getNumeroNivel())
                .orElseThrow(() -> new NotFoundException("Nivel curricular", "id", planAsignatura.getNivelCurricularId()));
    }
}
