package com.academicore.evaluacion.domain.repository;

import com.academicore.evaluacion.domain.model.Encuesta;

import java.util.List;
import java.util.Optional;

public interface EncuestaRepository {

    Encuesta save(Encuesta encuesta);

    Optional<Encuesta> findById(Long id);

    List<Encuesta> findByEvaluacionId(Long evaluacionId);

    List<Encuesta> findByEvaluacionIdIn(List<Long> evaluacionIds);

    long countByEvaluacionId(Long evaluacionId);
}
