package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.EstadoFacultad;
import com.academicore.pensum.domain.model.Facultad;
import com.academicore.pensum.domain.repository.FacultadRepository;
import com.academicore.pensum.infrastructure.persistence.entity.FacultadEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.FacultadMapper;
import com.academicore.pensum.infrastructure.persistence.repository.FacultadJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class FacultadRepositoryAdapter implements FacultadRepository {

    private final FacultadJpaRepository jpaRepository;

    @Override
    public Facultad save(Facultad facultad) {
        FacultadEntity entity = FacultadMapper.toEntity(facultad);
        FacultadEntity saved = jpaRepository.save(entity);
        return FacultadMapper.toDomain(saved);
    }

    @Override
    public Optional<Facultad> findById(Long id) {
        return jpaRepository.findById(id).map(FacultadMapper::toDomain);
    }

    @Override
    public List<Facultad> findByUniversidadId(Long universidadId) {
        return jpaRepository.findByUniversidadId(universidadId).stream().map(FacultadMapper::toDomain).toList();
    }

    @Override
    public List<Facultad> findByUniversidadIdAndEstado(Long universidadId, EstadoFacultad estado) {
        return jpaRepository.findByUniversidadIdAndEstado(universidadId, estado.name())
                .stream().map(FacultadMapper::toDomain).toList();
    }

    @Override
    public boolean existsByUniversidadIdAndCodigo(Long universidadId, String codigo) {
        return jpaRepository.existsByUniversidadIdAndCodigo(universidadId, codigo);
    }

    @Override
    public boolean existsByUniversidadIdAndNombre(Long universidadId, String nombre) {
        return jpaRepository.existsByUniversidadIdAndNombre(universidadId, nombre);
    }
}
