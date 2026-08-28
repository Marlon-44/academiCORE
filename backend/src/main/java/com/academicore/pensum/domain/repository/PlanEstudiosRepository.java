package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.PlanEstudios;
import com.academicore.pensum.domain.model.EstadoPensum;

import java.util.List;
import java.util.Optional;

public interface PlanEstudiosRepository {

    PlanEstudios save(PlanEstudios planEstudios);

    Optional<PlanEstudios> findById(Long id);

    Optional<PlanEstudios> findByIdWithNiveles(Long id);

    List<PlanEstudios> findByProgramaId(Long programaId);

    List<PlanEstudios> findByProgramaIdAndEstado(Long programaId, EstadoPensum estado);

    Optional<PlanEstudios> findVigenteByProgramaId(Long programaId);

    boolean existsByProgramaIdAndCodigoPensum(Long programaId, String codigoPensum);

    boolean existsVigenteByProgramaId(Long programaId);
}
