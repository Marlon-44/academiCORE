package com.academicore.pagos.domain.repository;

import com.academicore.pagos.domain.model.Factura;

import java.util.Optional;

public interface FacturaRepository {

    Factura save(Factura factura);

    Optional<Factura> findById(Long id);

    Optional<Factura> findByInscripcionId(Long inscripcionId);

    long countByAnio(int anio);
}
