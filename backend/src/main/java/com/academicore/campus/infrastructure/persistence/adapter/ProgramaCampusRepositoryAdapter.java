package com.academicore.campus.infrastructure.persistence.adapter;

import com.academicore.campus.domain.model.ProgramaCampus;
import com.academicore.campus.domain.repository.ProgramaCampusRepository;
import com.academicore.campus.infrastructure.persistence.mapper.ProgramaCampusMapper;
import com.academicore.campus.infrastructure.persistence.repository.ProgramaCampusJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class ProgramaCampusRepositoryAdapter implements ProgramaCampusRepository {

    private final ProgramaCampusJpaRepository jpaRepository;

    @Override
    public ProgramaCampus save(ProgramaCampus programaCampus) {
        return ProgramaCampusMapper.toDomain(jpaRepository.save(ProgramaCampusMapper.toEntity(programaCampus)));
    }

    @Override
    public List<ProgramaCampus> findByProgramaId(Long programaId) {
        return jpaRepository.findByProgramaId(programaId).stream().map(ProgramaCampusMapper::toDomain).toList();
    }

    @Override
    public boolean existsByProgramaIdAndCampusId(Long programaId, Long campusId) {
        return jpaRepository.existsByProgramaIdAndCampusId(programaId, campusId);
    }
}
