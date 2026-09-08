package com.academicore.campus.infrastructure.persistence.repository;

import com.academicore.campus.infrastructure.persistence.entity.CampusEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CampusJpaRepository extends JpaRepository<CampusEntity, Long> {

    Optional<CampusEntity> findByCodigo(String codigo);

    List<CampusEntity> findByEstado(String estado);

    boolean existsByCodigo(String codigo);
}
