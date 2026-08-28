package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.ProgramaAcademico;
import com.academicore.pensum.domain.repository.ProgramaAcademicoRepository;
import com.academicore.pensum.infrastructure.persistence.entity.ProgramaAcademicoEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.ProgramaAcademicoMapper;
import com.academicore.pensum.infrastructure.persistence.repository.ProgramaAcademicoJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ProgramaAcademicoRepositoryAdapter implements ProgramaAcademicoRepository {

    private final ProgramaAcademicoJpaRepository jpaRepository;

    @Override
    public ProgramaAcademico save(ProgramaAcademico programa) {
        ProgramaAcademicoEntity entity = ProgramaAcademicoMapper.toEntity(programa);
        ProgramaAcademicoEntity saved = jpaRepository.save(entity);
        return ProgramaAcademicoMapper.toDomain(saved);
    }

    @Override
    public Optional<ProgramaAcademico> findById(Long id) {
        return jpaRepository.findById(id).map(ProgramaAcademicoMapper::toDomain);
    }

    @Override
    public Optional<ProgramaAcademico> findByFacultadIdAndCodigoInterno(Long facultadId, String codigoInterno) {
        return jpaRepository.findByFacultadIdAndCodigoInterno(facultadId, codigoInterno)
                .map(ProgramaAcademicoMapper::toDomain);
    }

    @Override
    public Optional<ProgramaAcademico> findByCodigoSnies(String codigoSnies) {
        return jpaRepository.findByCodigoSnies(codigoSnies).map(ProgramaAcademicoMapper::toDomain);
    }

    @Override
    public List<ProgramaAcademico> findByFacultadId(Long facultadId) {
        return jpaRepository.findByFacultadId(facultadId).stream().map(ProgramaAcademicoMapper::toDomain).toList();
    }

    @Override
    public boolean existsByFacultadIdAndCodigoInterno(Long facultadId, String codigoInterno) {
        return jpaRepository.existsByFacultadIdAndCodigoInterno(facultadId, codigoInterno);
    }

    @Override
    public boolean existsByCodigoSnies(String codigoSnies) {
        return jpaRepository.existsByCodigoSnies(codigoSnies);
    }
}
