package com.academicore.pagos.infrastructure.persistence.repository;

import com.academicore.pagos.infrastructure.persistence.entity.MonedaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MonedaJpaRepository extends JpaRepository<MonedaEntity, Long> {

    Optional<MonedaEntity> findByCodigoIso(String codigoIso);
}
