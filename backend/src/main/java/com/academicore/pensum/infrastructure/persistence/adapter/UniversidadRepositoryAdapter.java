package com.academicore.pensum.infrastructure.persistence.adapter;

import com.academicore.pensum.domain.model.EstadoUniversidad;
import com.academicore.pensum.domain.model.Universidad;
import com.academicore.pensum.domain.repository.UniversidadRepository;
import com.academicore.pensum.infrastructure.persistence.entity.UniversidadEntity;
import com.academicore.pensum.infrastructure.persistence.mapper.UniversidadMapper;
import com.academicore.pensum.infrastructure.persistence.repository.UniversidadJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UniversidadRepositoryAdapter implements UniversidadRepository {

    private final UniversidadJpaRepository jpaRepository;

    @Override
    public Universidad save(Universidad universidad) {
        UniversidadEntity entity = UniversidadMapper.toEntity(universidad);
        UniversidadEntity saved = jpaRepository.save(entity);
        return UniversidadMapper.toDomain(saved);
    }

    @Override
    public Optional<Universidad> findById(Long id) {
        return jpaRepository.findById(id).map(UniversidadMapper::toDomain);
    }

    @Override
    public Optional<Universidad> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(UniversidadMapper::toDomain);
    }

    @Override
    public List<Universidad> findAll() {
        return jpaRepository.findAll().stream().map(UniversidadMapper::toDomain).toList();
    }

    @Override
    public List<Universidad> findByEstado(EstadoUniversidad estado) {
        return jpaRepository.findByEstado(estado.name()).stream().map(UniversidadMapper::toDomain).toList();
    }

    @Override
    public boolean existsByCodigo(String codigo) {
        return jpaRepository.existsByCodigo(codigo);
    }
}
