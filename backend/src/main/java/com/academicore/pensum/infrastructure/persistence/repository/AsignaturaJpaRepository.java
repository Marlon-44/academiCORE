package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.AsignaturaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface AsignaturaJpaRepository extends JpaRepository<AsignaturaEntity, Long> {

    Optional<AsignaturaEntity> findByDepartamentoIdAndCodigo(Long departamentoId, String codigo);

    List<AsignaturaEntity> findByDepartamentoId(Long departamentoId);

    List<AsignaturaEntity> findByDepartamentoIdAndEstado(Long departamentoId, String estado);

    boolean existsByDepartamentoIdAndCodigo(Long departamentoId, String codigo);
}
