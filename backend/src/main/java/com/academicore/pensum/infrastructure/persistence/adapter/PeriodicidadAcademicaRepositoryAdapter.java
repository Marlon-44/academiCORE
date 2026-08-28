package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.PeriodicidadAcademica;
import com.academicore.pensum.domain.repository.PeriodicidadAcademicaRepository;
import com.academicore.pensum.infrastructure.persistence.mapper.PeriodicidadAcademicaMapper;
import com.academicore.pensum.infrastructure.persistence.repository.PeriodicidadAcademicaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class PeriodicidadAcademicaRepositoryAdapter implements PeriodicidadAcademicaRepository {

    private final PeriodicidadAcademicaJpaRepository jpaRepository;

    @Override
    public Optional<PeriodicidadAcademica> findById(Long id) {
        return jpaRepository.findById(id).map(PeriodicidadAcademicaMapper::toDomain);
    }

    @Override
    public Optional<PeriodicidadAcademica> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(PeriodicidadAcademicaMapper::toDomain);
    }

    @Override
    public List<PeriodicidadAcademica> findAll() {
        return jpaRepository.findAll().stream().map(PeriodicidadAcademicaMapper::toDomain).toList();
    }
}
