package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.RespuestaPreguntaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RespuestaPreguntaJpaRepository extends JpaRepository<RespuestaPreguntaEntity, Long> {

    List<RespuestaPreguntaEntity> findByEncuestaId(Long encuestaId);

    List<RespuestaPreguntaEntity> findByEncuestaIdIn(List<Long> encuestaIds);

    long countByPreguntaId(Long preguntaId);
}
