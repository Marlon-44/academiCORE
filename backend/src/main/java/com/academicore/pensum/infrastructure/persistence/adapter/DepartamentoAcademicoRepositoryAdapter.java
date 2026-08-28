package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.DepartamentoAcademico;
import com.academicore.pensum.domain.repository.DepartamentoAcademicoRepository;
import com.academicore.pensum.infrastructure.persistence.entity.DepartamentoAcademicoEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.DepartamentoAcademicoMapper;
import com.academicore.pensum.infrastructure.persistence.repository.DepartamentoAcademicoJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class DepartamentoAcademicoRepositoryAdapter implements DepartamentoAcademicoRepository {

    private final DepartamentoAcademicoJpaRepository jpaRepository;

    @Override
    public DepartamentoAcademico save(DepartamentoAcademico departamento) {
        DepartamentoAcademicoEntity entity = DepartamentoAcademicoMapper.toEntity(departamento);
        DepartamentoAcademicoEntity saved = jpaRepository.save(entity);
        return DepartamentoAcademicoMapper.toDomain(saved);
    }

    @Override
    public Optional<DepartamentoAcademico> findById(Long id) {
        return jpaRepository.findById(id).map(DepartamentoAcademicoMapper::toDomain);
    }

    @Override
    public List<DepartamentoAcademico> findByFacultadId(Long facultadId) {
        return jpaRepository.findByFacultadId(facultadId).stream().map(DepartamentoAcademicoMapper::toDomain).toList();
    }

    @Override
    public boolean existsByFacultadIdAndCodigo(Long facultadId, String codigo) {
        return jpaRepository.existsByFacultadIdAndCodigo(facultadId, codigo);
    }

    @Override
    public boolean existsByFacultadIdAndNombre(Long facultadId, String nombre) {
        return jpaRepository.existsByFacultadIdAndNombre(facultadId, nombre);
    }
}
