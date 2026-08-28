package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.RequisitoPlanAsignatura;

import java.util.List;

public interface RequisitoPlanAsignaturaRepository {

    RequisitoPlanAsignatura save(RequisitoPlanAsignatura requisito);

    List<RequisitoPlanAsignatura> findByPlanAsignaturaId(Long planAsignaturaId);

    boolean existsByPlanAsignaturaIdAndPlanAsignaturaRequeridaIdAndTipoRequisitoId(
            Long planAsignaturaId,
            Long planAsignaturaRequeridaId,
            Long tipoRequisitoId);
}
