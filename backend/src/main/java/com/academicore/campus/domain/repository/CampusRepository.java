package com.academicore.campus.domain.repository;

import com.academicore.campus.domain.model.Campus;
import com.academicore.campus.domain.model.EstadoCampus;

import java.util.List;
import java.util.Optional;

public interface CampusRepository {

    Campus save(Campus campus);

    Optional<Campus> findById(Long id);

    Optional<Campus> findByCodigo(String codigo);

    List<Campus> findAll();

    List<Campus> findByEstado(EstadoCampus estado);

    boolean existsByCodigo(String codigo);
}
