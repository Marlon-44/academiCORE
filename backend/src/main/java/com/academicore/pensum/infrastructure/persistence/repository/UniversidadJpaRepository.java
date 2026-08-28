package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.UniversidadEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UniversidadJpaRepository extends JpaRepository<UniversidadEntity, Long> {

    Optional<UniversidadEntity> findByCodigo(String codigo);

    List<UniversidadEntity> findByEstado(String estado);

    boolean existsByCodigo(String codigo);
}
