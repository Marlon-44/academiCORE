package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.NaturalezaAsignatura;
import com.academicore.pensum.domain.repository.NaturalezaAsignaturaRepository;
import com.academicore.pensum.infrastructure.persistence.mapper.NaturalezaAsignaturaMapper;
import com.academicore.pensum.infrastructure.persistence.repository.NaturalezaAsignaturaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class NaturalezaAsignaturaRepositoryAdapter implements NaturalezaAsignaturaRepository {

    private final NaturalezaAsignaturaJpaRepository jpaRepository;

    @Override
    public NaturalezaAsignatura save(NaturalezaAsignatura naturaleza) {
        return NaturalezaAsignaturaMapper.toDomain(
                jpaRepository.save(NaturalezaAsignaturaMapper.toEntity(naturaleza)));
    }

    @Override
    public Optional<NaturalezaAsignatura> findById(Long id) {
        return jpaRepository.findById(id).map(NaturalezaAsignaturaMapper::toDomain);
    }

    @Override
    public Optional<NaturalezaAsignatura> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(NaturalezaAsignaturaMapper::toDomain);
    }

    @Override
    public List<NaturalezaAsignatura> findAll() {
        return jpaRepository.findAll().stream().map(NaturalezaAsignaturaMapper::toDomain).toList();
    }

    @Override
    public boolean existsByCodigo(String codigo) {
        return jpaRepository.existsByCodigo(codigo);
    }
}
