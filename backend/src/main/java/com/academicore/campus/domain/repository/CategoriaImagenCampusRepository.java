package com.academicore.campus.domain.repository;

import com.academicore.campus.domain.model.CategoriaImagenCampus;

import java.util.List;
import java.util.Optional;

public interface CategoriaImagenCampusRepository {

    Optional<CategoriaImagenCampus> findById(Long id);

    Optional<CategoriaImagenCampus> findByCodigo(String codigo);

    List<CategoriaImagenCampus> findAll();
}
