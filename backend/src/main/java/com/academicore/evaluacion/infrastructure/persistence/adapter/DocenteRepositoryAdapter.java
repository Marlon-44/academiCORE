package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.model.Docente;
import com.academicore.evaluacion.domain.repository.DocenteRepository;
import com.academicore.evaluacion.infrastructure.persistence.mapper.EvaluacionDocenteMapper;
import com.academicore.evaluacion.infrastructure.persistence.repository.DocenteJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class DocenteRepositoryAdapter implements DocenteRepository {

    private final DocenteJpaRepository jpaRepository;

    @Override
    public Docente save(Docente docente) {
        return EvaluacionDocenteMapper.toDomain(
                jpaRepository.save(EvaluacionDocenteMapper.toEntity(docente)));
    }

    @Override
    public Optional<Docente> findById(Long id) {
        return jpaRepository.findById(id).map(EvaluacionDocenteMapper::toDomain);
    }

    @Override
    public Optional<Docente> findByNumeroDocumento(String numeroDocumento) {
        return jpaRepository.findByNumeroDocumento(numeroDocumento).map(EvaluacionDocenteMapper::toDomain);
    }

    @Override
    public List<Docente> findAll() {
        return jpaRepository.findAll().stream().map(EvaluacionDocenteMapper::toDomain).toList();
    }

    @Override
    public List<Docente> findByEstado(String estado) {
        return jpaRepository.findByEstado(estado).stream().map(EvaluacionDocenteMapper::toDomain).toList();
    }

    @Override
    public boolean existsByNumeroDocumento(String numeroDocumento) {
        return jpaRepository.existsByNumeroDocumento(numeroDocumento);
    }
}
