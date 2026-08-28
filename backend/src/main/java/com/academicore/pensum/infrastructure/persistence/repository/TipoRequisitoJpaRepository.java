package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.TipoRequisitoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TipoRequisitoJpaRepository extends JpaRepository<TipoRequisitoEntity, Long> {

    Optional<TipoRequisitoEntity> findByCodigo(String codigo);
}
