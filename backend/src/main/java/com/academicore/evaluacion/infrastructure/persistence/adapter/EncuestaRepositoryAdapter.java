package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.model.Encuesta;
import com.academicore.evaluacion.domain.model.RespuestaPregunta;
import com.academicore.evaluacion.domain.repository.EncuestaRepository;
import com.academicore.evaluacion.infrastructure.persistence.entity.EncuestaEntity;
import com.academicore.evaluacion.infrastructure.persistence.entity.RespuestaPreguntaEntity;
import com.academicore.evaluacion.infrastructure.persistence.mapper.EvaluacionDocenteMapper;
import com.academicore.evaluacion.infrastructure.persistence.repository.EncuestaJpaRepository;
import com.academicore.evaluacion.infrastructure.persistence.repository.RespuestaPreguntaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class EncuestaRepositoryAdapter implements EncuestaRepository {

    private final EncuestaJpaRepository jpaRepository;
    private final RespuestaPreguntaJpaRepository respuestaJpaRepository;

    @Override
    public Encuesta save(Encuesta encuesta) {
        EncuestaEntity saved = jpaRepository.save(EvaluacionDocenteMapper.toEntity(encuesta));
        List<RespuestaPreguntaEntity> respuestas = encuesta.getRespuestas().stream()
                .map(r -> {
                    r.setEncuestaId(saved.getId());
                    return EvaluacionDocenteMapper.toEntity(r);
                })
                .toList();
        List<RespuestaPreguntaEntity> savedRespuestas = respuestaJpaRepository.saveAll(respuestas);
        Encuesta domain = EvaluacionDocenteMapper.toDomain(saved);
        domain.setRespuestas(savedRespuestas.stream()
                .map(EvaluacionDocenteMapper::toDomain).toList());
        return domain;
    }

    @Override
    public Optional<Encuesta> findById(Long id) {
        return jpaRepository.findById(id).map(e -> {
            Encuesta encuesta = EvaluacionDocenteMapper.toDomain(e);
            encuesta.setRespuestas(respuestaJpaRepository.findByEncuestaId(id).stream()
                    .map(EvaluacionDocenteMapper::toDomain).toList());
            return encuesta;
        });
    }

    @Override
    public List<Encuesta> findByEvaluacionId(Long evaluacionId) {
        return conRespuestas(jpaRepository.findByEvaluacionId(evaluacionId));
    }

    @Override
    public List<Encuesta> findByEvaluacionIdIn(List<Long> evaluacionIds) {
        if (evaluacionIds == null || evaluacionIds.isEmpty()) {
            return List.of();
        }
        return conRespuestas(jpaRepository.findByEvaluacionIdIn(evaluacionIds));
    }

    @Override
    public List<Encuesta> findByEstudianteId(Long estudianteId) {
        return conRespuestas(jpaRepository.findByEstudianteId(estudianteId));
    }

    @Override
    public boolean existsByEvaluacionIdAndEstudianteId(Long evaluacionId, Long estudianteId) {
        return jpaRepository.existsByEvaluacionIdAndEstudianteId(evaluacionId, estudianteId);
    }

    @Override
    public long countByEvaluacionId(Long evaluacionId) {
        return jpaRepository.countByEvaluacionId(evaluacionId);
    }

    private List<Encuesta> conRespuestas(List<EncuestaEntity> encuestas) {
        if (encuestas.isEmpty()) {
            return List.of();
        }
        List<Long> encuestaIds = encuestas.stream().map(EncuestaEntity::getId).toList();
        Map<Long, List<RespuestaPregunta>> respuestasPorEncuesta =
                respuestaJpaRepository.findByEncuestaIdIn(encuestaIds).stream()
                        .map(EvaluacionDocenteMapper::toDomain)
                        .collect(Collectors.groupingBy(RespuestaPregunta::getEncuestaId));
        return encuestas.stream()
                .map(e -> {
                    Encuesta encuesta = EvaluacionDocenteMapper.toDomain(e);
                    encuesta.setRespuestas(respuestasPorEncuesta.getOrDefault(e.getId(), List.of()));
                    return encuesta;
                })
                .toList();
    }
}
