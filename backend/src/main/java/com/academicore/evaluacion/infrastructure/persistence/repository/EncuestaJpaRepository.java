package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.EncuestaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EncuestaJpaRepository extends JpaRepository<EncuestaEntity, Long> {

    List<EncuestaEntity> findByEvaluacionId(Long evaluacionId);

    List<EncuestaEntity> findByEvaluacionIdIn(List<Long> evaluacionIds);

    List<EncuestaEntity> findByEstudianteId(Long estudianteId);

    boolean existsByEvaluacionIdAndEstudianteId(Long evaluacionId, Long estudianteId);

    long countByEvaluacionId(Long evaluacionId);
}
