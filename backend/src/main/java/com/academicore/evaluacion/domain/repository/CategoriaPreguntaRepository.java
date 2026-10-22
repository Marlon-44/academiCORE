package com.academicore.evaluacion.domain.repository;

import com.academicore.evaluacion.domain.model.CategoriaPregunta;

import java.util.List;
import java.util.Optional;

public interface CategoriaPreguntaRepository {

    CategoriaPregunta save(CategoriaPregunta categoria);

    Optional<CategoriaPregunta> findById(Long id);

    Optional<CategoriaPregunta> findByCodigo(String codigo);

    List<CategoriaPregunta> findAll();

    boolean existsByCodigo(String codigo);

    long countPreguntas(Long categoriaId);
}
