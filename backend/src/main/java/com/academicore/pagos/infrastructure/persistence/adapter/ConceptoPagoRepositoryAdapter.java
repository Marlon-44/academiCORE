package com.academicore.pagos.infrastructure.persistence.adapter;

import com.academicore.pagos.domain.model.ConceptoPago;
import com.academicore.pagos.domain.repository.ConceptoPagoRepository;
import com.academicore.pagos.infrastructure.persistence.mapper.CatalogoPagoMapper;
import com.academicore.pagos.infrastructure.persistence.repository.ConceptoPagoJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ConceptoPagoRepositoryAdapter implements ConceptoPagoRepository {

    private final ConceptoPagoJpaRepository jpaRepository;

    @Override
    public Optional<ConceptoPago> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(CatalogoPagoMapper::toDomain);
    }
}
