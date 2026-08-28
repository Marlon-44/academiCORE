package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.TipoAsignaturaPlan;
import com.academicore.pensum.domain.repository.TipoAsignaturaPlanRepository;
import com.academicore.pensum.infrastructure.persistence.mapper.TipoAsignaturaPlanMapper;
import com.academicore.pensum.infrastructure.persistence.repository.TipoAsignaturaPlanJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class TipoAsignaturaPlanRepositoryAdapter implements TipoAsignaturaPlanRepository {

    private final TipoAsignaturaPlanJpaRepository jpaRepository;

    @Override
    public Optional<TipoAsignaturaPlan> findById(Long id) {
        return jpaRepository.findById(id).map(TipoAsignaturaPlanMapper::toDomain);
    }

    @Override
    public Optional<TipoAsignaturaPlan> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(TipoAsignaturaPlanMapper::toDomain);
    }

    @Override
    public List<TipoAsignaturaPlan> findAll() {
        return jpaRepository.findAll().stream().map(TipoAsignaturaPlanMapper::toDomain).toList();
    }
}
