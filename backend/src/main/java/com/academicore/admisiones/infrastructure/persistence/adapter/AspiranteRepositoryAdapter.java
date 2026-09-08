package com.academicore.admisiones.infrastructure.persistence.adapter;

import com.academicore.admisiones.domain.model.Aspirante;
import com.academicore.admisiones.domain.repository.AspiranteRepository;
import com.academicore.admisiones.infrastructure.persistence.mapper.AdmisionesMapper;
import com.academicore.admisiones.infrastructure.persistence.repository.AspiranteJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class AspiranteRepositoryAdapter implements AspiranteRepository {

    private final AspiranteJpaRepository jpaRepository;

    @Override
    public Aspirante save(Aspirante aspirante) {
        return AdmisionesMapper.toDomain(jpaRepository.save(AdmisionesMapper.toEntity(aspirante)));
    }

    @Override
    public Optional<Aspirante> findById(Long id) {
        return jpaRepository.findById(id).map(AdmisionesMapper::toDomain);
    }

    @Override
    public Optional<Aspirante> findByTipoDocumentoAndNumeroDocumento(String tipoDocumento, String numeroDocumento) {
        return jpaRepository.findByTipoDocumentoAndNumeroDocumento(tipoDocumento, numeroDocumento)
                .map(AdmisionesMapper::toDomain);
    }

    @Override
    public boolean existsByTipoDocumentoAndNumeroDocumento(String tipoDocumento, String numeroDocumento) {
        return jpaRepository.existsByTipoDocumentoAndNumeroDocumento(tipoDocumento, numeroDocumento);
    }
}
