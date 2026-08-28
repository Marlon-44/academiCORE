package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.TipoAsignaturaPlan;

import java.util.List;
import java.util.Optional;

public interface TipoAsignaturaPlanRepository {

    Optional<TipoAsignaturaPlan> findById(Long id);

    Optional<TipoAsignaturaPlan> findByCodigo(String codigo);

    List<TipoAsignaturaPlan> findAll();
}
