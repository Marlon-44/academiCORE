package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.PlanEstudiosEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface PlanEstudiosJpaRepository extends JpaRepository<PlanEstudiosEntity, Long> {

    @Query("SELECT p FROM PlanEstudiosEntity p LEFT JOIN FETCH p.nivelesCurriculares WHERE p.id = :id")
    Optional<PlanEstudiosEntity> findByIdWithNiveles(@Param("id") Long id);

    List<PlanEstudiosEntity> findByProgramaId(Long programaId);

    List<PlanEstudiosEntity> findByProgramaIdAndEstado(Long programaId, String estado);

    Optional<PlanEstudiosEntity> findFirstByProgramaIdAndEstado(Long programaId, String estado);

    boolean existsByProgramaIdAndCodigoPensum(Long programaId, String codigoPensum);

    boolean existsByProgramaIdAndEstado(Long programaId, String estado);
}
