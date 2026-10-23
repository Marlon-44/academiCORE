package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.repository.InscripcionEvaluacionRepository;
import com.academicore.evaluacion.infrastructure.persistence.entity.InscripcionEvaluacionEntity;
import com.academicore.evaluacion.infrastructure.persistence.repository.InscripcionEvaluacionJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

@Component
@RequiredArgsConstructor
public class InscripcionEvaluacionRepositoryAdapter implements InscripcionEvaluacionRepository {

    private final InscripcionEvaluacionJpaRepository jpaRepository;

    @Override
    public boolean existsByEvaluacionIdAndEstudianteId(Long evaluacionId, Long estudianteId) {
        return jpaRepository.existsByEvaluacionIdAndEstudianteId(evaluacionId, estudianteId);
    }

    @Override
    public long countByEvaluacionId(Long evaluacionId) {
        return jpaRepository.countByEvaluacionId(evaluacionId);
    }

    @Override
    public List<Long> findEstudianteIdsByEvaluacionId(Long evaluacionId) {
        return jpaRepository.findEstudianteIdsByEvaluacionId(evaluacionId);
    }

    @Override
    public void save(Long evaluacionId, Long estudianteId) {
        jpaRepository.save(InscripcionEvaluacionEntity.builder()
                .evaluacionId(evaluacionId)
                .estudianteId(estudianteId)
                .fechaInscripcion(LocalDateTime.now())
                .build());
    }
}
