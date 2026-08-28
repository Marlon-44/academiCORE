package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.PlanAsignatura;
import com.academicore.pensum.domain.repository.PlanAsignaturaRepository;
import com.academicore.pensum.infrastructure.persistence.entity.PlanAsignaturaEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.PlanAsignaturaMapper;
import com.academicore.pensum.infrastructure.persistence.repository.PlanAsignaturaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class PlanAsignaturaRepositoryAdapter implements PlanAsignaturaRepository {

    private final PlanAsignaturaJpaRepository jpaRepository;

    @Override
    public PlanAsignatura save(PlanAsignatura planAsignatura) {
        PlanAsignaturaEntity entity = PlanAsignaturaMapper.toEntity(planAsignatura);
        PlanAsignaturaEntity saved = jpaRepository.save(entity);
        return PlanAsignaturaMapper.toDomain(saved);
    }

    @Override
    public Optional<PlanAsignatura> findById(Long id) {
        return jpaRepository.findById(id).map(PlanAsignaturaMapper::toDomain);
    }

    @Override
    public Optional<PlanAsignatura> findByIdWithDetails(Long id) {
        return jpaRepository.findByIdWithDetails(id).map(PlanAsignaturaMapper::toDomain);
    }

    @Override
    public List<PlanAsignatura> findByPlanEstudiosId(Long planEstudiosId) {
        return jpaRepository.findByPlanEstudiosId(planEstudiosId).stream().map(PlanAsignaturaMapper::toDomain).toList();
    }

    @Override
    public List<PlanAsignatura> findByPlanEstudiosIdAndNivelCurricularId(Long planEstudiosId, Long nivelCurricularId) {
        return jpaRepository.findByPlanEstudiosIdAndNivelCurricularId(planEstudiosId, nivelCurricularId)
                .stream().map(PlanAsignaturaMapper::toDomain).toList();
    }

    @Override
    public Optional<PlanAsignatura> findByPlanEstudiosIdAndAsignaturaId(Long planEstudiosId, Long asignaturaId) {
        return jpaRepository.findByPlanEstudiosIdAndAsignaturaId(planEstudiosId, asignaturaId)
                .map(PlanAsignaturaMapper::toDomain);
    }

    @Override
    public boolean existsByPlanEstudiosIdAndAsignaturaId(Long planEstudiosId, Long asignaturaId) {
        return jpaRepository.existsByPlanEstudiosIdAndAsignaturaId(planEstudiosId, asignaturaId);
    }
}
