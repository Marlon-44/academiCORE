package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.Asignatura;
import com.academicore.pensum.domain.model.EstadoAsignatura;
import com.academicore.pensum.domain.repository.AsignaturaRepository;
import com.academicore.pensum.infrastructure.persistence.entity.AsignaturaEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.AsignaturaMapper;
import com.academicore.pensum.infrastructure.persistence.repository.AsignaturaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class AsignaturaRepositoryAdapter implements AsignaturaRepository {

    private final AsignaturaJpaRepository jpaRepository;

    @Override
    public Asignatura save(Asignatura asignatura) {
        AsignaturaEntity entity = AsignaturaMapper.toEntity(asignatura);
        AsignaturaEntity saved = jpaRepository.save(entity);
        return AsignaturaMapper.toDomain(saved);
    }

    @Override
    public Optional<Asignatura> findById(Long id) {
        return jpaRepository.findById(id).map(AsignaturaMapper::toDomain);
    }

    @Override
    public Optional<Asignatura> findByDepartamentoIdAndCodigo(Long departamentoId, String codigo) {
        return jpaRepository.findByDepartamentoIdAndCodigo(departamentoId, codigo).map(AsignaturaMapper::toDomain);
    }

    @Override
    public List<Asignatura> findByDepartamentoId(Long departamentoId) {
        return jpaRepository.findByDepartamentoId(departamentoId).stream().map(AsignaturaMapper::toDomain).toList();
    }

    @Override
    public List<Asignatura> findByDepartamentoIdAndEstado(Long departamentoId, EstadoAsignatura estado) {
        return jpaRepository.findByDepartamentoIdAndEstado(departamentoId, estado.name())
                .stream().map(AsignaturaMapper::toDomain).toList();
    }

    @Override
    public boolean existsByDepartamentoIdAndCodigo(Long departamentoId, String codigo) {
        return jpaRepository.existsByDepartamentoIdAndCodigo(departamentoId, codigo);
    }
}
