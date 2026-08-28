package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.PlanAsignatura;

import java.util.List;
import java.util.Optional;

public interface PlanAsignaturaRepository {

    PlanAsignatura save(PlanAsignatura planAsignatura);

    Optional<PlanAsignatura> findById(Long id);

    Optional<PlanAsignatura> findByIdWithDetails(Long id);

    List<PlanAsignatura> findByPlanEstudiosId(Long planEstudiosId);

    List<PlanAsignatura> findByPlanEstudiosIdAndNivelCurricularId(Long planEstudiosId, Long nivelCurricularId);

    Optional<PlanAsignatura> findByPlanEstudiosIdAndAsignaturaId(Long planEstudiosId, Long asignaturaId);

    boolean existsByPlanEstudiosIdAndAsignaturaId(Long planEstudiosId, Long asignaturaId);
}
