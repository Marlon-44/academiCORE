package com.academicore.admisiones.infrastructure.persistence.adapter;

import com.academicore.admisiones.domain.model.Inscripcion;
import com.academicore.admisiones.domain.repository.InscripcionRepository;
import com.academicore.admisiones.infrastructure.persistence.mapper.AdmisionesMapper;
import com.academicore.admisiones.infrastructure.persistence.repository.InscripcionJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class InscripcionRepositoryAdapter implements InscripcionRepository {

    private final InscripcionJpaRepository jpaRepository;

    @Override
    public Inscripcion save(Inscripcion inscripcion) {
        return AdmisionesMapper.toDomain(jpaRepository.save(AdmisionesMapper.toEntity(inscripcion)));
    }

    @Override
    public Optional<Inscripcion> findById(Long id) {
        return jpaRepository.findById(id).map(AdmisionesMapper::toDomain);
    }

    @Override
    public List<Inscripcion> findByAspiranteId(Long aspiranteId) {
        return jpaRepository.findByAspiranteId(aspiranteId).stream().map(AdmisionesMapper::toDomain).toList();
    }

    @Override
    public boolean existsByAspiranteIdAndOfertaAdmisionId(Long aspiranteId, Long ofertaAdmisionId) {
        return jpaRepository.existsByAspiranteIdAndOfertaAdmisionId(aspiranteId, ofertaAdmisionId);
    }
}
