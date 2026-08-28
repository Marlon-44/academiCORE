package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.Asignatura;
import com.academicore.pensum.domain.model.EstadoAsignatura;

import java.util.List;
import java.util.Optional;

public interface AsignaturaRepository {

    Asignatura save(Asignatura asignatura);

    Optional<Asignatura> findById(Long id);

    Optional<Asignatura> findByDepartamentoIdAndCodigo(Long departamentoId, String codigo);

    List<Asignatura> findByDepartamentoId(Long departamentoId);

    List<Asignatura> findByDepartamentoIdAndEstado(Long departamentoId, EstadoAsignatura estado);

    boolean existsByDepartamentoIdAndCodigo(Long departamentoId, String codigo);
}
