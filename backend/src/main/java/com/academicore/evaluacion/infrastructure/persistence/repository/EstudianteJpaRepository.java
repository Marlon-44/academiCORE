package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.EstudianteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface EstudianteJpaRepository extends JpaRepository<EstudianteEntity, Long> {

    Optional<EstudianteEntity> findByNumeroDocumento(String numeroDocumento);

    List<EstudianteEntity> findAllByOrderByApellidosAsc();
}
