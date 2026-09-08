package com.academicore.pagos.infrastructure.persistence.adapter;

import com.academicore.pagos.domain.model.Factura;
import com.academicore.pagos.domain.repository.FacturaRepository;
import com.academicore.pagos.infrastructure.persistence.entity.FacturaEntity;
import com.academicore.pagos.infrastructure.persistence.mapper.FacturaMapper;
import com.academicore.pagos.infrastructure.persistence.repository.FacturaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class FacturaRepositoryAdapter implements FacturaRepository {

    private final FacturaJpaRepository jpaRepository;

    @Override
    public Factura save(Factura factura) {
        return FacturaMapper.toDomain(jpaRepository.save(FacturaMapper.toEntity(factura)));
    }

    @Override
    public Optional<Factura> findById(Long id) {
        return jpaRepository.findById(id).map(FacturaMapper::toDomain);
    }

    @Override
    public Optional<Factura> findByInscripcionId(Long inscripcionId) {
        return jpaRepository.findByInscripcionId(inscripcionId).map(FacturaMapper::toDomain);
    }

    @Override
    public long countByAnio(int anio) {
        return jpaRepository.countByPrefijo("FAC-" + anio + "-");
    }
}
