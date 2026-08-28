package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.TipoAsignaturaPlanEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TipoAsignaturaPlanJpaRepository extends JpaRepository<TipoAsignaturaPlanEntity, Long> {

    Optional<TipoAsignaturaPlanEntity> findByCodigo(String codigo);
}
