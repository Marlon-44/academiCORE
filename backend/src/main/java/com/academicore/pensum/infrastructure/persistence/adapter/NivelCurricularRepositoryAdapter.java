package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.NivelCurricular;
import com.academicore.pensum.domain.repository.NivelCurricularRepository;
import com.academicore.pensum.infrastructure.persistence.entity.NivelCurricularEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.NivelCurricularMapper;
import com.academicore.pensum.infrastructure.persistence.repository.NivelCurricularJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class NivelCurricularRepositoryAdapter implements NivelCurricularRepository {

    private final NivelCurricularJpaRepository jpaRepository;

    @Override
    public NivelCurricular save(NivelCurricular nivel) {
        NivelCurricularEntity entity = NivelCurricularMapper.toEntity(nivel);
        NivelCurricularEntity saved = jpaRepository.save(entity);
        return NivelCurricularMapper.toDomain(saved);
    }

    @Override
    public Optional<NivelCurricular> findById(Long id) {
        return jpaRepository.findById(id).map(NivelCurricularMapper::toDomain);
    }

    @Override
    public List<NivelCurricular> findByPlanEstudiosId(Long planEstudiosId) {
        return jpaRepository.findByPlanEstudiosId(planEstudiosId).stream().map(NivelCurricularMapper::toDomain).toList();
    }

    @Override
    public Optional<NivelCurricular> findByPlanEstudiosIdAndNumeroNivel(Long planEstudiosId, int numeroNivel) {
        return jpaRepository.findByPlanEstudiosIdAndNumeroNivel(planEstudiosId, numeroNivel)
                .map(NivelCurricularMapper::toDomain);
    }

    @Override
    public boolean existsByPlanEstudiosIdAndNumeroNivel(Long planEstudiosId, int numeroNivel) {
        return jpaRepository.existsByPlanEstudiosIdAndNumeroNivel(planEstudiosId, numeroNivel);
    }
}
