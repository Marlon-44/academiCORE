package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.TipoRequisito;

import java.util.List;
import java.util.Optional;

public interface TipoRequisitoRepository {

    Optional<TipoRequisito> findById(Long id);

    Optional<TipoRequisito> findByCodigo(String codigo);

    List<TipoRequisito> findAll();
}
