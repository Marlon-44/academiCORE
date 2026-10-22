package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.EncuestaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EncuestaJpaRepository extends JpaRepository<EncuestaEntity, Long> {

    List<EncuestaEntity> findByEvaluacionId(Long evaluacionId);

    List<EncuestaEntity> findByEvaluacionIdIn(List<Long> evaluacionIds);

    long countByEvaluacionId(Long evaluacionId);
}
