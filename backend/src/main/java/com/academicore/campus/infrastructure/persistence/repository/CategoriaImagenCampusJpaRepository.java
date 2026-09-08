package com.academicore.campus.infrastructure.persistence.repository;

import com.academicore.campus.infrastructure.persistence.entity.CategoriaImagenCampusEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CategoriaImagenCampusJpaRepository extends JpaRepository<CategoriaImagenCampusEntity, Long> {

    Optional<CategoriaImagenCampusEntity> findByCodigo(String codigo);
}
