package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.InscripcionEvaluacionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface InscripcionEvaluacionJpaRepository extends JpaRepository<InscripcionEvaluacionEntity, Long> {

    boolean existsByEvaluacionIdAndEstudianteId(Long evaluacionId, Long estudianteId);

    long countByEvaluacionId(Long evaluacionId);

    @Query("SELECT i.estudianteId FROM InscripcionEvaluacionEntity i WHERE i.evaluacionId = :evaluacionId")
    List<Long> findEstudianteIdsByEvaluacionId(@Param("evaluacionId") Long evaluacionId);
}
