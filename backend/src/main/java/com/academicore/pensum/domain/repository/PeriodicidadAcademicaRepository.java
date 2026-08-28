package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.PeriodicidadAcademica;

import java.util.List;
import java.util.Optional;

public interface PeriodicidadAcademicaRepository {

    Optional<PeriodicidadAcademica> findById(Long id);

    Optional<PeriodicidadAcademica> findByCodigo(String codigo);

    List<PeriodicidadAcademica> findAll();
}
