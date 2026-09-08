package com.academicore.admisiones.infrastructure.persistence.repository;

import com.academicore.admisiones.infrastructure.persistence.entity.AspiranteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;


public interface AspiranteJpaRepository extends JpaRepository<AspiranteEntity, Long> {

    Optional<AspiranteEntity> findByTipoDocumentoAndNumeroDocumento(String tipoDocumento, String numeroDocumento);

    boolean existsByTipoDocumentoAndNumeroDocumento(String tipoDocumento, String numeroDocumento);
}
