package com.academicore.admisiones.infrastructure.persistence.repository;

import com.academicore.admisiones.infrastructure.persistence.entity.PeriodoAdmisionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PeriodoAdmisionJpaRepository extends JpaRepository<PeriodoAdmisionEntity, Long> {

    List<PeriodoAdmisionEntity> findByEstado(String estado);

    boolean existsByCodigo(String codigo);
}
