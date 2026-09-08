package com.academicore.campus.domain.repository;

import com.academicore.campus.domain.model.ProgramaCampus;

import java.util.List;

public interface ProgramaCampusRepository {

    ProgramaCampus save(ProgramaCampus programaCampus);

    List<ProgramaCampus> findByProgramaId(Long programaId);

    boolean existsByProgramaIdAndCampusId(Long programaId, Long campusId);
}
