package com.academicore.admisiones.domain.repository;

import com.academicore.admisiones.domain.model.EstadoPeriodoAdmision;
import com.academicore.admisiones.domain.model.PeriodoAdmision;

import java.util.List;
import java.util.Optional;

public interface PeriodoAdmisionRepository {

    PeriodoAdmision save(PeriodoAdmision periodo);

    Optional<PeriodoAdmision> findById(Long id);

    List<PeriodoAdmision> findByEstado(EstadoPeriodoAdmision estado);

    List<PeriodoAdmision> findAll();

    boolean existsByCodigo(String codigo);
}
