package com.academicore.admisiones.infrastructure.persistence.adapter;

import com.academicore.admisiones.domain.model.EstadoPeriodoAdmision;
import com.academicore.admisiones.domain.model.PeriodoAdmision;
import com.academicore.admisiones.domain.repository.PeriodoAdmisionRepository;
import com.academicore.admisiones.infrastructure.persistence.mapper.PeriodoAdmisionMapper;
import com.academicore.admisiones.infrastructure.persistence.repository.PeriodoAdmisionJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class PeriodoAdmisionRepositoryAdapter implements PeriodoAdmisionRepository {

    private final PeriodoAdmisionJpaRepository jpaRepository;

    @Override
    public PeriodoAdmision save(PeriodoAdmision periodo) {
        return PeriodoAdmisionMapper.toDomain(jpaRepository.save(PeriodoAdmisionMapper.toEntity(periodo)));
    }

    @Override
    public Optional<PeriodoAdmision> findById(Long id) {
        return jpaRepository.findById(id).map(PeriodoAdmisionMapper::toDomain);
    }

    @Override
    public List<PeriodoAdmision> findByEstado(EstadoPeriodoAdmision estado) {
        return jpaRepository.findByEstado(estado.name()).stream().map(PeriodoAdmisionMapper::toDomain).toList();
    }

    @Override
    public List<PeriodoAdmision> findAll() {
        return jpaRepository.findAll().stream().map(PeriodoAdmisionMapper::toDomain).toList();
    }

    @Override
    public boolean existsByCodigo(String codigo) {
        return jpaRepository.existsByCodigo(codigo);
    }
}
