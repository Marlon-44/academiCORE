package com.academicore.evaluacion.domain.repository;

import java.util.List;

public interface InscripcionEvaluacionRepository {

    boolean existsByEvaluacionIdAndEstudianteId(Long evaluacionId, Long estudianteId);

    long countByEvaluacionId(Long evaluacionId);

    List<Long> findEstudianteIdsByEvaluacionId(Long evaluacionId);

    void save(Long evaluacionId, Long estudianteId);
}
