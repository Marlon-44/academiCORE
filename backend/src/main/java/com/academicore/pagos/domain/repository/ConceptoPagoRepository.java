package com.academicore.pagos.domain.repository;

import com.academicore.pagos.domain.model.ConceptoPago;

import java.util.Optional;

public interface ConceptoPagoRepository {

    Optional<ConceptoPago> findByCodigo(String codigo);
}
