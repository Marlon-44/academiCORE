package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.TipoRequisito;
import com.academicore.pensum.domain.repository.TipoRequisitoRepository;
import com.academicore.pensum.infrastructure.persistence.mapper.TipoRequisitoMapper;
import com.academicore.pensum.infrastructure.persistence.repository.TipoRequisitoJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class TipoRequisitoRepositoryAdapter implements TipoRequisitoRepository {

    private final TipoRequisitoJpaRepository jpaRepository;

    @Override
    public Optional<TipoRequisito> findById(Long id) {
        return jpaRepository.findById(id).map(TipoRequisitoMapper::toDomain);
    }

    @Override
    public Optional<TipoRequisito> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(TipoRequisitoMapper::toDomain);
    }

    @Override
    public List<TipoRequisito> findAll() {
        return jpaRepository.findAll().stream().map(TipoRequisitoMapper::toDomain).toList();
    }
}
