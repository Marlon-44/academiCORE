package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.ProgramaAcademico;

import java.util.List;
import java.util.Optional;

public interface ProgramaAcademicoRepository {

    ProgramaAcademico save(ProgramaAcademico programa);

    Optional<ProgramaAcademico> findById(Long id);

    Optional<ProgramaAcademico> findByFacultadIdAndCodigoInterno(Long facultadId, String codigoInterno);

    Optional<ProgramaAcademico> findByCodigoSnies(String codigoSnies);

    List<ProgramaAcademico> findByFacultadId(Long facultadId);

    boolean existsByFacultadIdAndCodigoInterno(Long facultadId, String codigoInterno);

    boolean existsByCodigoSnies(String codigoSnies);
}
