package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.NaturalezaAsignaturaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface NaturalezaAsignaturaJpaRepository extends JpaRepository<NaturalezaAsignaturaEntity, Long> {

    Optional<NaturalezaAsignaturaEntity> findByCodigo(String codigo);

    boolean existsByCodigo(String codigo);
}
