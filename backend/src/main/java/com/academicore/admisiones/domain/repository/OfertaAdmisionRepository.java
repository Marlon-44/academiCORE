package com.academicore.admisiones.domain.repository;

import com.academicore.admisiones.domain.model.OfertaAdmision;

import java.util.List;
import java.util.Optional;

public interface OfertaAdmisionRepository {

    OfertaAdmision save(OfertaAdmision oferta);

    Optional<OfertaAdmision> findById(Long id);

    List<OfertaAdmision> findByPeriodoAdmisionId(Long periodoAdmisionId);

    List<OfertaAdmision> findByPeriodoAdmisionIdAndCampusId(Long periodoAdmisionId, Long campusId);

    boolean existsByPeriodoAdmisionIdAndProgramaIdAndCampusId(Long periodoAdmisionId, Long programaId, Long campusId);

    boolean decrementarCupos(Long ofertaId);
}
