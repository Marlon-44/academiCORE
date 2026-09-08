package com.academicore.pagos.infrastructure.persistence.adapter;

import com.academicore.pagos.domain.model.Moneda;
import com.academicore.pagos.domain.repository.MonedaRepository;
import com.academicore.pagos.infrastructure.persistence.mapper.CatalogoPagoMapper;
import com.academicore.pagos.infrastructure.persistence.repository.MonedaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class MonedaRepositoryAdapter implements MonedaRepository {

    private final MonedaJpaRepository jpaRepository;

    @Override
    public Optional<Moneda> findById(Long id) {
        return jpaRepository.findById(id).map(CatalogoPagoMapper::toDomain);
    }

    @Override
    public Optional<Moneda> findByCodigoIso(String codigoIso) {
        return jpaRepository.findByCodigoIso(codigoIso).map(CatalogoPagoMapper::toDomain);
    }

    @Override
    public List<Moneda> findAll() {
        return jpaRepository.findAll().stream().map(CatalogoPagoMapper::toDomain).toList();
    }
}
