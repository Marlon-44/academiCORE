package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.domain.repository.PlanEstudiosRepository;
import com.academicore.pensum.infrastructure.persistence.entity.PlanEstudiosEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.PlanEstudiosMapper;
import com.academicore.pensum.infrastructure.persistence.repository.PlanEstudiosJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class PlanEstudiosRepositoryAdapter implements PlanEstudiosRepository {

    private final PlanEstudiosJpaRepository jpaRepository;

    @Override
    public PlanEstudios save(PlanEstudios planEstudios) {
        PlanEstudiosEntity entity = PlanEstudiosMapper.toEntity(planEstudios);
        PlanEstudiosEntity saved = jpaRepository.save(entity);
        return PlanEstudiosMapper.toDomain(saved);
    }

    @Override
    public Optional<PlanEstudios> findById(Long id) {
        return jpaRepository.findById(id).map(PlanEstudiosMapper::toDomain);
    }

    @Override
    public Optional<PlanEstudios> findByIdWithNiveles(Long id) {
        return jpaRepository.findByIdWithNiveles(id).map(PlanEstudiosMapper::toDomainWithNiveles);
    }

    @Override
    public List<PlanEstudios> findByProgramaId(Long programaId) {
        return jpaRepository.findByProgramaId(programaId).stream().map(PlanEstudiosMapper::toDomain).toList();
    }

    @Override
    public List<PlanEstudios> findByProgramaIdAndEstado(Long programaId, EstadoPensum estado) {
        return jpaRepository.findByProgramaIdAndEstado(programaId, estado.name())
                .stream().map(PlanEstudiosMapper::toDomain).toList();
    }

    @Override
    public Optional<PlanEstudios> findVigenteByProgramaId(Long programaId) {
        return jpaRepository.findFirstByProgramaIdAndEstado(programaId, EstadoPensum.VIGENTE.name())
                .map(PlanEstudiosMapper::toDomain);
    }

    @Override
    public boolean existsByProgramaIdAndCodigoPensum(Long programaId, String codigoPensum) {
        return jpaRepository.existsByProgramaIdAndCodigoPensum(programaId, codigoPensum);
    }

    @Override
    public boolean existsVigenteByProgramaId(Long programaId) {
        return jpaRepository.existsByProgramaIdAndEstado(programaId, EstadoPensum.VIGENTE.name());
    }
}
