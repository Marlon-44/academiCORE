package com.academicore.admisiones.domain.repository;

import com.academicore.admisiones.domain.model.Aspirante;

import java.util.Optional;

public interface AspiranteRepository {

    Aspirante save(Aspirante aspirante);

    Optional<Aspirante> findById(Long id);

    Optional<Aspirante> findByTipoDocumentoAndNumeroDocumento(String tipoDocumento, String numeroDocumento);

    boolean existsByTipoDocumentoAndNumeroDocumento(String tipoDocumento, String numeroDocumento);
}
