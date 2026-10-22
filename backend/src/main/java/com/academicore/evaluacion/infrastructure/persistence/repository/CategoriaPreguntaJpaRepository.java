package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.CategoriaPreguntaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CategoriaPreguntaJpaRepository extends JpaRepository<CategoriaPreguntaEntity, Long> {

    Optional<CategoriaPreguntaEntity> findByCodigo(String codigo);

    List<CategoriaPreguntaEntity> findAllByOrderByOrdenAsc();
}
