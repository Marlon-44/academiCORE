package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.MallaCurricularResponse;
import com.academicore.pensum.application.dto.NivelMallaResponse;
import com.academicore.pensum.application.dto.PlanAsignaturaResponse;
import com.academicore.pensum.application.dto.RequisitoResponse;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.NivelCurricular;
import com.academicore.pensum.domain.model.PlanAsignatura;
import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.domain.repository.PlanEstudiosRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ConsultarMallaCompletaUseCase {

    private final PlanEstudiosRepository planEstudiosRepository;

    @Transactional(readOnly = true)
    public MallaCurricularResponse execute(Long planEstudiosId) {
        PlanEstudios plan = planEstudiosRepository.findByIdWithNiveles(planEstudiosId)
                .orElseThrow(() -> new NotFoundException("Plan de estudios", "id", planEstudiosId));

        List<NivelMallaResponse> niveles = plan.getNivelesCurriculares().stream()
                .sorted(Comparator.comparingInt(NivelCurricular::getNumeroNivel))
                .map(this::toNivelMalla)
                .toList();

        int creditosCalculados = niveles.stream()
                .mapToInt(NivelMallaResponse::getCreditosNivel)
                .sum();

        return MallaCurricularResponse.builder()
                .planEstudiosId(plan.getId())
                .codigoPensum(plan.getCodigoPensum())
                .nombre(plan.getNombre())
                .estado(plan.getEstado().name())
                .totalCreditos(plan.getTotalCreditos())
                .creditosCalculados(creditosCalculados)
                .niveles(niveles)
                .build();
    }

    private NivelMallaResponse toNivelMalla(NivelCurricular nivel) {
        List<PlanAsignaturaResponse> asignaturas = nivel.getPlanAsignaturas().stream()
                .sorted(Comparator.comparing(pa -> pa.getAsignatura() != null
                        ? pa.getAsignatura().getCodigo() : ""))
                .map(this::toPlanAsignaturaResponse)
                .toList();

        int creditosNivel = asignaturas.stream()
                .mapToInt(a -> a.getCreditos() != null ? a.getCreditos().intValue() : 0)
                .sum();

        return NivelMallaResponse.builder()
                .numeroNivel(nivel.getNumeroNivel())
                .nombre(nivel.getNombre())
                .creditosNivel(creditosNivel)
                .asignaturas(asignaturas)
                .build();
    }

    private PlanAsignaturaResponse toPlanAsignaturaResponse(PlanAsignatura pa) {
        List<RequisitoResponse> requisitos = pa.getRequisitos() != null
                ? pa.getRequisitos().stream()
                    .map(r -> RequisitoResponse.builder()
                            .id(r.getId())
                            .planAsignaturaRequeridaId(r.getPlanAsignaturaRequeridaId())
                            .tipoRequisito(r.getTipoRequisito() != null ? r.getTipoRequisito().getCodigo() : null)
                            .build())
                    .toList()
                : Collections.emptyList();

        return PlanAsignaturaResponse.builder()
                .id(pa.getId())
                .planEstudiosId(pa.getPlanEstudiosId())
                .asignaturaId(pa.getAsignaturaId())
                .asignaturaCodigo(pa.getAsignatura() != null ? pa.getAsignatura().getCodigo() : null)
                .asignaturaNombre(pa.getAsignatura() != null ? pa.getAsignatura().getNombre() : null)
                .nivelCurricularId(pa.getNivelCurricularId())
                .nivelNumero(pa.getNivelCurricular() != null ? pa.getNivelCurricular().getNumeroNivel() : 0)
                .tipoAsignatura(pa.getTipoAsignatura() != null ? pa.getTipoAsignatura().getCodigo() : null)
                .creditos(pa.getCreditos())
                .horasDocenciaSemanales(pa.getHorasDocenciaSemanales())
                .horasTrabajoIndependiente(pa.getHorasTrabajoIndependiente())
                .esHabilitable(pa.isEsHabilitable())
                .requisitos(requisitos)
                .build();
    }
}
