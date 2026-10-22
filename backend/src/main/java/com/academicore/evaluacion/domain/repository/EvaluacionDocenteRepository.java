package com.academicore.evaluacion.domain.repository;

import com.academicore.evaluacion.domain.model.EvaluacionDocente;

import java.util.List;
import java.util.Optional;

public interface EvaluacionDocenteRepository {

    EvaluacionDocente save(EvaluacionDocente evaluacion);

    Optional<EvaluacionDocente> findById(Long id);

    List<EvaluacionDocente> findByDocenteId(Long docenteId);

    List<EvaluacionDocente> findByDocenteIdAndAsignaturaId(Long docenteId, Long asignaturaId);

    List<EvaluacionDocente> buscar(Long docenteId, Long asignaturaId, String periodo);

    boolean existsByDocenteAsignaturaGrupoPeriodo(Long docenteId, Long asignaturaId,
                                                  String grupo, String periodo);
}
