package com.academicore.admisiones.infrastructure.persistence.adapter;

import com.academicore.admisiones.domain.model.OfertaAdmision;
import com.academicore.admisiones.domain.repository.OfertaAdmisionRepository;
import com.academicore.admisiones.infrastructure.persistence.mapper.OfertaAdmisionMapper;
import com.academicore.admisiones.infrastructure.persistence.repository.OfertaAdmisionJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class OfertaAdmisionRepositoryAdapter implements OfertaAdmisionRepository {

    private final OfertaAdmisionJpaRepository jpaRepository;

    @Override
    public OfertaAdmision save(OfertaAdmision oferta) {
        return OfertaAdmisionMapper.toDomain(jpaRepository.save(OfertaAdmisionMapper.toEntity(oferta)));
    }

    @Override
    public Optional<OfertaAdmision> findById(Long id) {
        return jpaRepository.findById(id).map(OfertaAdmisionMapper::toDomain);
    }

    @Override
    public List<OfertaAdmision> findByPeriodoAdmisionId(Long periodoAdmisionId) {
        return jpaRepository.findByPeriodoAdmisionId(periodoAdmisionId).stream().map(OfertaAdmisionMapper::toDomain).toList();
    }

    @Override
    public List<OfertaAdmision> findByPeriodoAdmisionIdAndCampusId(Long periodoAdmisionId, Long campusId) {
        return jpaRepository.findByPeriodoAdmisionIdAndCampusId(periodoAdmisionId, campusId)
                .stream().map(OfertaAdmisionMapper::toDomain).toList();
    }

    @Override
    public boolean existsByPeriodoAdmisionIdAndProgramaIdAndCampusId(Long periodoAdmisionId, Long programaId, Long campusId) {
        return jpaRepository.existsByPeriodoAdmisionIdAndProgramaIdAndCampusId(periodoAdmisionId, programaId, campusId);
    }

    @Override
    @org.springframework.transaction.annotation.Transactional
    public boolean decrementarCupos(Long ofertaId) {
        return jpaRepository.decrementarCupos(ofertaId) > 0;
    }
}
