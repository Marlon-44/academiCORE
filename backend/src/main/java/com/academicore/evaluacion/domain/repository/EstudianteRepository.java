package com.academicore.evaluacion.domain.repository;

import com.academicore.evaluacion.domain.model.Estudiante;

import java.util.List;
import java.util.Optional;

public interface EstudianteRepository {

    Estudiante save(Estudiante estudiante);

    Optional<Estudiante> findById(Long id);

    Optional<Estudiante> findByNumeroDocumento(String numeroDocumento);

    List<Estudiante> findAll();

    List<Estudiante> findAllById(List<Long> ids);
}
