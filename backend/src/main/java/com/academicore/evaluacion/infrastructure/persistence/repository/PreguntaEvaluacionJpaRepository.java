package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.PreguntaEvaluacionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PreguntaEvaluacionJpaRepository extends JpaRepository<PreguntaEvaluacionEntity, Long> {

    List<PreguntaEvaluacionEntity> findByEstadoOrderByNumeroAsc(String estado);

    List<PreguntaEvaluacionEntity> findAllByOrderByNumeroAsc();

    long countByEstado(String estado);

    long countByCategoriaId(Long categoriaId);

    boolean existsByIdAndEstado(Long id, String estado);

    boolean existsByNumero(Integer numero);

    boolean existsByNumeroAndIdNot(Integer numero, Long id);

    Optional<PreguntaEvaluacionEntity> findTopByOrderByNumeroDesc();
}
