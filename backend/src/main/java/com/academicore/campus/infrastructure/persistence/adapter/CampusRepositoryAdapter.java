package com.academicore.campus.infrastructure.persistence.adapter;

import com.academicore.campus.domain.model.Campus;
import com.academicore.campus.domain.model.EstadoCampus;
import com.academicore.campus.domain.repository.CampusRepository;
import com.academicore.campus.infrastructure.persistence.mapper.CampusMapper;
import com.academicore.campus.infrastructure.persistence.repository.CampusJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class CampusRepositoryAdapter implements CampusRepository {

    private final CampusJpaRepository jpaRepository;

    @Override
    public Campus save(Campus campus) {
        return CampusMapper.toDomain(jpaRepository.save(CampusMapper.toEntity(campus)));
    }

    @Override
    public Optional<Campus> findById(Long id) {
        return jpaRepository.findById(id).map(CampusMapper::toDomain);
    }

    @Override
    public Optional<Campus> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(CampusMapper::toDomain);
    }

    @Override
    public List<Campus> findAll() {
        return jpaRepository.findAll().stream().map(CampusMapper::toDomain).toList();
    }

    @Override
    public List<Campus> findByEstado(EstadoCampus estado) {
        return jpaRepository.findByEstado(estado.name()).stream().map(CampusMapper::toDomain).toList();
    }

    @Override
    public boolean existsByCodigo(String codigo) {
        return jpaRepository.existsByCodigo(codigo);
    }
}
