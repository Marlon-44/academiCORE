package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.model.Estudiante;
import com.academicore.evaluacion.domain.repository.EstudianteRepository;
import com.academicore.evaluacion.infrastructure.persistence.mapper.EvaluacionDocenteMapper;
import com.academicore.evaluacion.infrastructure.persistence.repository.EstudianteJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class EstudianteRepositoryAdapter implements EstudianteRepository {

    private final EstudianteJpaRepository jpaRepository;

    @Override
    public Estudiante save(Estudiante estudiante) {
        return EvaluacionDocenteMapper.toDomain(
                jpaRepository.save(EvaluacionDocenteMapper.toEntity(estudiante)));
    }

    @Override
    public Optional<Estudiante> findById(Long id) {
        return jpaRepository.findById(id).map(EvaluacionDocenteMapper::toDomain);
    }

    @Override
    public Optional<Estudiante> findByNumeroDocumento(String numeroDocumento) {
        return jpaRepository.findByNumeroDocumento(numeroDocumento)
                .map(EvaluacionDocenteMapper::toDomain);
    }

    @Override
    public List<Estudiante> findAll() {
        return jpaRepository.findAllByOrderByApellidosAsc().stream()
                .map(EvaluacionDocenteMapper::toDomain).toList();
    }

    @Override
    public List<Estudiante> findAllById(List<Long> ids) {
        return jpaRepository.findAllById(ids).stream()
                .map(EvaluacionDocenteMapper::toDomain).toList();
    }
}
