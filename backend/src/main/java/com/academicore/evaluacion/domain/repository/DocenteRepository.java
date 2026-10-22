package com.academicore.evaluacion.domain.repository;

import com.academicore.evaluacion.domain.model.Docente;

import java.util.List;
import java.util.Optional;

public interface DocenteRepository {

    Docente save(Docente docente);

    Optional<Docente> findById(Long id);

    Optional<Docente> findByNumeroDocumento(String numeroDocumento);

    List<Docente> findAll();

    List<Docente> findByEstado(String estado);

    boolean existsByNumeroDocumento(String numeroDocumento);
}
