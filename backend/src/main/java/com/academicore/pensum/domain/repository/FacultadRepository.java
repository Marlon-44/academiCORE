package com.academicore.pensum.domain.repository;

import com.academicore.pensum.domain.model.Facultad;
import com.academicore.pensum.domain.model.EstadoFacultad;

import java.util.List;
import java.util.Optional;

public interface FacultadRepository {

    Facultad save(Facultad facultad);

    Optional<Facultad> findById(Long id);

    List<Facultad> findByUniversidadId(Long universidadId);

    List<Facultad> findByUniversidadIdAndEstado(Long universidadId, EstadoFacultad estado);

    boolean existsByUniversidadIdAndCodigo(Long universidadId, String codigo);

    boolean existsByUniversidadIdAndNombre(Long universidadId, String nombre);
}
