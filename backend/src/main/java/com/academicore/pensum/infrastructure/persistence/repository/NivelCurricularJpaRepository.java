package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.NivelCurricularEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface NivelCurricularJpaRepository extends JpaRepository<NivelCurricularEntity, Long> {

    List<NivelCurricularEntity> findByPlanEstudiosId(Long planEstudiosId);

    Optional<NivelCurricularEntity> findByPlanEstudiosIdAndNumeroNivel(Long planEstudiosId, int numeroNivel);

    boolean existsByPlanEstudiosIdAndNumeroNivel(Long planEstudiosId, int numeroNivel);
}
