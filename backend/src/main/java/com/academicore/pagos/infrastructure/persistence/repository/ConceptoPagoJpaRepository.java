package com.academicore.pagos.infrastructure.persistence.repository;

import com.academicore.pagos.infrastructure.persistence.entity.ConceptoPagoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ConceptoPagoJpaRepository extends JpaRepository<ConceptoPagoEntity, Long> {

    Optional<ConceptoPagoEntity> findByCodigo(String codigo);
}
