package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.PeriodicidadAcademicaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PeriodicidadAcademicaJpaRepository extends JpaRepository<PeriodicidadAcademicaEntity, Long> {

    Optional<PeriodicidadAcademicaEntity> findByCodigo(String codigo);
}
