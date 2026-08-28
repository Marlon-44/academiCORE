package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.FacultadEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FacultadJpaRepository extends JpaRepository<FacultadEntity, Long> {

    List<FacultadEntity> findByUniversidadId(Long universidadId);

    List<FacultadEntity> findByUniversidadIdAndEstado(Long universidadId, String estado);

    boolean existsByUniversidadIdAndCodigo(Long universidadId, String codigo);

    boolean existsByUniversidadIdAndNombre(Long universidadId, String nombre);
}
