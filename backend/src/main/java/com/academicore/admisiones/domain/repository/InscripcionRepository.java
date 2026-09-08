package com.academicore.admisiones.domain.repository;

import com.academicore.admisiones.domain.model.Inscripcion;

import java.util.List;
import java.util.Optional;

public interface InscripcionRepository {

    Inscripcion save(Inscripcion inscripcion);

    Optional<Inscripcion> findById(Long id);

    List<Inscripcion> findByAspiranteId(Long aspiranteId);

    boolean existsByAspiranteIdAndOfertaAdmisionId(Long aspiranteId, Long ofertaAdmisionId);
}
