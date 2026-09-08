package com.academicore.pagos.infrastructure.persistence.repository;

import com.academicore.pagos.infrastructure.persistence.entity.FacturaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface FacturaJpaRepository extends JpaRepository<FacturaEntity, Long> {

    Optional<FacturaEntity> findByInscripcionId(Long inscripcionId);

    @Query("SELECT COUNT(f) FROM FacturaEntity f WHERE f.numeroFactura LIKE :prefijo%")
    long countByPrefijo(@Param("prefijo") String prefijo);
}
