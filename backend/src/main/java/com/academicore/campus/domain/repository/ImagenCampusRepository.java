package com.academicore.campus.domain.repository;

import com.academicore.campus.domain.model.ImagenCampus;

import java.util.List;
import java.util.Optional;

public interface ImagenCampusRepository {

    ImagenCampus save(ImagenCampus imagen);

    Optional<ImagenCampus> findById(Long id);

    List<ImagenCampus> findByCampusId(Long campusId);

    List<ImagenCampus> findByCampusIdAndCategoriaCodigo(Long campusId, String categoriaCodigo);

    void deleteById(Long id);
}
