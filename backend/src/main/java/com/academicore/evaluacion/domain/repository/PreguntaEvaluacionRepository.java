package com.academicore.evaluacion.domain.repository;

import com.academicore.evaluacion.domain.model.PreguntaEvaluacion;

import java.util.List;
import java.util.Optional;

public interface PreguntaEvaluacionRepository {

    PreguntaEvaluacion save(PreguntaEvaluacion pregunta);

    Optional<PreguntaEvaluacion> findById(Long id);

    List<PreguntaEvaluacion> findAllActivas();

    List<PreguntaEvaluacion> findAll();

    long countActivas();

    boolean existsActivaById(Long id);

    boolean existsByNumero(Integer numero);

    boolean existsByNumeroAndIdNot(Integer numero, Long id);

    Optional<Integer> findMaxNumero();

    long countRespuestas(Long preguntaId);

    void deleteById(Long id);
}
