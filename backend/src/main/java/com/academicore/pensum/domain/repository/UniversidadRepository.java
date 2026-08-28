package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.Universidad;
import com.academicore.pensum.domain.model.EstadoUniversidad;

import java.util.List;
import java.util.Optional;

public interface UniversidadRepository {

    Universidad save(Universidad universidad);

    Optional<Universidad> findById(Long id);

    Optional<Universidad> findByCodigo(String codigo);

    List<Universidad> findAll();

    List<Universidad> findByEstado(EstadoUniversidad estado);

    boolean existsByCodigo(String codigo);
}
