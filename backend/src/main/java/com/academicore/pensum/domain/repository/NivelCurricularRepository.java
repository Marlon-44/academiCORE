package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.NivelCurricular;

import java.util.List;
import java.util.Optional;

public interface NivelCurricularRepository {

    NivelCurricular save(NivelCurricular nivel);

    Optional<NivelCurricular> findById(Long id);

    List<NivelCurricular> findByPlanEstudiosId(Long planEstudiosId);

    Optional<NivelCurricular> findByPlanEstudiosIdAndNumeroNivel(Long planEstudiosId, int numeroNivel);

    boolean existsByPlanEstudiosIdAndNumeroNivel(Long planEstudiosId, int numeroNivel);
}
