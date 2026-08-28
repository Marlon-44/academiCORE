package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.PlanAsignaturaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface PlanAsignaturaJpaRepository extends JpaRepository<PlanAsignaturaEntity, Long> {

    @Query("SELECT pa FROM PlanAsignaturaEntity pa LEFT JOIN FETCH pa.requisitos WHERE pa.id = :id")
    Optional<PlanAsignaturaEntity> findByIdWithDetails(@Param("id") Long id);

    List<PlanAsignaturaEntity> findByPlanEstudiosId(Long planEstudiosId);

    List<PlanAsignaturaEntity> findByPlanEstudiosIdAndNivelCurricularId(Long planEstudiosId, Long nivelCurricularId);

    Optional<PlanAsignaturaEntity> findByPlanEstudiosIdAndAsignaturaId(Long planEstudiosId, Long asignaturaId);

    boolean existsByPlanEstudiosIdAndAsignaturaId(Long planEstudiosId, Long asignaturaId);
}
