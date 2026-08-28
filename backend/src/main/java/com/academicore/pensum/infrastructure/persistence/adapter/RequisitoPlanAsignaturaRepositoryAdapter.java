package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.RequisitoPlanAsignatura;
import com.academicore.pensum.domain.repository.RequisitoPlanAsignaturaRepository;
import com.academicore.pensum.infrastructure.persistence.entity.RequisitoPlanAsignaturaEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.RequisitoPlanAsignaturaMapper;
import com.academicore.pensum.infrastructure.persistence.repository.RequisitoPlanAsignaturaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class RequisitoPlanAsignaturaRepositoryAdapter implements RequisitoPlanAsignaturaRepository {

    private final RequisitoPlanAsignaturaJpaRepository jpaRepository;

    @Override
    public RequisitoPlanAsignatura save(RequisitoPlanAsignatura requisito) {
        RequisitoPlanAsignaturaEntity entity = RequisitoPlanAsignaturaMapper.toEntity(requisito);
        RequisitoPlanAsignaturaEntity saved = jpaRepository.save(entity);
        return RequisitoPlanAsignaturaMapper.toDomain(saved);
    }

    @Override
    public List<RequisitoPlanAsignatura> findByPlanAsignaturaId(Long planAsignaturaId) {
        return jpaRepository.findByPlanAsignaturaId(planAsignaturaId)
                .stream().map(RequisitoPlanAsignaturaMapper::toDomain).toList();
    }

    @Override
    public boolean existsByPlanAsignaturaIdAndPlanAsignaturaRequeridaIdAndTipoRequisitoId(
            Long planAsignaturaId, Long planAsignaturaRequeridaId, Long tipoRequisitoId) {
        return jpaRepository.existsByPlanAsignaturaIdAndPlanAsignaturaRequeridaIdAndTipoRequisitoId(
                planAsignaturaId, planAsignaturaRequeridaId, tipoRequisitoId);
    }
}
