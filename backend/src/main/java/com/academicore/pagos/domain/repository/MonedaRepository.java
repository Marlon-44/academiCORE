package com.academicore.pagos.domain.repository;

import com.academicore.pagos.domain.model.Moneda;

import java.util.List;
import java.util.Optional;

public interface MonedaRepository {

    Optional<Moneda> findById(Long id);

    Optional<Moneda> findByCodigoIso(String codigoIso);

    List<Moneda> findAll();
}
