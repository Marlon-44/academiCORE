package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.NaturalezaAsignatura;

import java.util.List;
import java.util.Optional;

public interface NaturalezaAsignaturaRepository {

    NaturalezaAsignatura save(NaturalezaAsignatura naturaleza);

    Optional<NaturalezaAsignatura> findById(Long id);

    Optional<NaturalezaAsignatura> findByCodigo(String codigo);

    List<NaturalezaAsignatura> findAll();

    boolean existsByCodigo(String codigo);
}
