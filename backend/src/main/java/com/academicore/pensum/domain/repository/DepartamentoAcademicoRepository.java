package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.DepartamentoAcademico;

import java.util.List;
import java.util.Optional;

public interface DepartamentoAcademicoRepository {

    DepartamentoAcademico save(DepartamentoAcademico departamento);

    Optional<DepartamentoAcademico> findById(Long id);

    List<DepartamentoAcademico> findByFacultadId(Long facultadId);

    boolean existsByFacultadIdAndCodigo(Long facultadId, String codigo);

    boolean existsByFacultadIdAndNombre(Long facultadId, String nombre);
}
