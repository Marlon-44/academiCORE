package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.AgregarAsignaturaAPlanRequest;
import com.academicore.pensum.application.dto.PlanAsignaturaResponse;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.Asignatura;
import com.academicore.pensum.domain.model.EstadoAsignatura;
import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.model.NivelCurricular;
import com.academicore.pensum.domain.model.PlanAsignatura;
import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.domain.model.TipoAsignaturaPlan;
import com.academicore.pensum.domain.repository.AsignaturaRepository;
import com.academicore.pensum.domain.repository.NivelCurricularRepository;
import com.academicore.pensum.domain.repository.PlanAsignaturaRepository;
import com.academicore.pensum.domain.repository.PlanEstudiosRepository;
import com.academicore.pensum.domain.repository.TipoAsignaturaPlanRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Collections;

@Service
@RequiredArgsConstructor
public class AgregarAsignaturaAPlanUseCase {

    private final PlanAsignaturaRepository planAsignaturaRepository;
    private final PlanEstudiosRepository planEstudiosRepository;
    private final AsignaturaRepository asignaturaRepository;
    private final NivelCurricularRepository nivelRepository;
    private final TipoAsignaturaPlanRepository tipoAsignaturaRepository;

    @Transactional
    public PlanAsignaturaResponse execute(Long planEstudiosId, AgregarAsignaturaAPlanRequest request) {
        PlanEstudios plan = planEstudiosRepository.findById(planEstudiosId)
                .orElseThrow(() -> new NotFoundException("Plan de estudios", "id", planEstudiosId));

        if (plan.getEstado() != EstadoPensum.EN_DISENO && plan.getEstado() != EstadoPensum.APROBADO) {
            throw new ConflictException("Solo se pueden agregar asignaturas a un pensum EN_DISENO o APROBADO. Estado actual: "
                    + plan.getEstado());
        }

        Asignatura asignatura = asignaturaRepository.findById(request.getAsignaturaId())
                .orElseThrow(() -> new NotFoundException("Asignatura", "id", request.getAsignaturaId()));

        if (asignatura.getEstado() == EstadoAsignatura.INACTIVA || asignatura.getEstado() == EstadoAsignatura.HISTORICA) {
            throw new ConflictException("La asignatura no está ACTIVA (estado: " + asignatura.getEstado() + ")");
        }

        NivelCurricular nivel = nivelRepository.findById(request.getNivelCurricularId())
                .orElseThrow(() -> new NotFoundException("Nivel curricular", "id", request.getNivelCurricularId()));

        if (!nivel.getPlanEstudiosId().equals(planEstudiosId)) {
            throw new ConflictException("El nivel curricular no pertenece al plan de estudios: " + planEstudiosId);
        }

        TipoAsignaturaPlan tipo = tipoAsignaturaRepository.findById(request.getTipoAsignaturaId())
                .orElseThrow(() -> new NotFoundException("Tipo de asignatura", "id", request.getTipoAsignaturaId()));

        if (planAsignaturaRepository.existsByPlanEstudiosIdAndAsignaturaId(planEstudiosId, request.getAsignaturaId())) {
            throw new ConflictException("La asignatura ya está registrada en este pensum");
        }

        BigDecimal horasDocencia = request.getHorasDocenciaSemanales() != null
                ? request.getHorasDocenciaSemanales() : BigDecimal.ZERO;
        BigDecimal horasIndependiente = request.getHorasTrabajoIndependiente() != null
                ? request.getHorasTrabajoIndependiente() : BigDecimal.ZERO;

        PlanAsignatura planAsignatura = PlanAsignatura.builder()
                .planEstudiosId(planEstudiosId)
                .asignaturaId(request.getAsignaturaId())
                .nivelCurricularId(request.getNivelCurricularId())
                .tipoAsignaturaId(request.getTipoAsignaturaId())
                .creditos(request.getCreditos())
                .horasDocenciaSemanales(horasDocencia)
                .horasTrabajoIndependiente(horasIndependiente)
                .esHabilitable(request.isEsHabilitable())
                .build();

        PlanAsignatura saved = planAsignaturaRepository.save(planAsignatura);

        return PlanAsignaturaResponse.builder()
                .id(saved.getId())
                .planEstudiosId(saved.getPlanEstudiosId())
                .asignaturaId(saved.getAsignaturaId())
                .asignaturaCodigo(asignatura.getCodigo())
                .asignaturaNombre(asignatura.getNombre())
                .nivelCurricularId(saved.getNivelCurricularId())
                .nivelNumero(nivel.getNumeroNivel())
                .tipoAsignatura(tipo.getCodigo())
                .creditos(saved.getCreditos())
                .horasDocenciaSemanales(saved.getHorasDocenciaSemanales())
                .horasTrabajoIndependiente(saved.getHorasTrabajoIndependiente())
                .esHabilitable(saved.isEsHabilitable())
                .requisitos(Collections.emptyList())
                .build();
    }
}
