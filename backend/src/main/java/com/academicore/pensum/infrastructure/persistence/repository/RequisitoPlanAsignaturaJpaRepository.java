package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.RequisitoPlanAsignaturaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RequisitoPlanAsignaturaJpaRepository extends JpaRepository<RequisitoPlanAsignaturaEntity, Long> {

    List<RequisitoPlanAsignaturaEntity> findByPlanAsignaturaId(Long planAsignaturaId);

    boolean existsByPlanAsignaturaIdAndPlanAsignaturaRequeridaIdAndTipoRequisitoId(
            Long planAsignaturaId,
            Long planAsignaturaRequeridaId,
            Long tipoRequisitoId);
}
