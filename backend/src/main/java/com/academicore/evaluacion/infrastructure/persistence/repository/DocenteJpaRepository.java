package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.DocenteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface DocenteJpaRepository extends JpaRepository<DocenteEntity, Long> {

    Optional<DocenteEntity> findByNumeroDocumento(String numeroDocumento);

    List<DocenteEntity> findByEstado(String estado);

    boolean existsByNumeroDocumento(String numeroDocumento);
}
