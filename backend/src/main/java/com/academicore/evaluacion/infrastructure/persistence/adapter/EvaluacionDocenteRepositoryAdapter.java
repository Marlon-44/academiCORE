package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.model.EvaluacionDocente;
import com.academicore.evaluacion.domain.repository.EvaluacionDocenteRepository;
import com.academicore.evaluacion.infrastructure.persistence.mapper.EvaluacionDocenteMapper;
import com.academicore.evaluacion.infrastructure.persistence.repository.EvaluacionDocenteJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class EvaluacionDocenteRepositoryAdapter implements EvaluacionDocenteRepository {

    private final EvaluacionDocenteJpaRepository jpaRepository;

    @Override
    public EvaluacionDocente save(EvaluacionDocente evaluacion) {
        return EvaluacionDocenteMapper.toDomain(
                jpaRepository.save(EvaluacionDocenteMapper.toEntity(evaluacion)));
    }

    @Override
    public Optional<EvaluacionDocente> findById(Long id) {
        return jpaRepository.findById(id).map(EvaluacionDocenteMapper::toDomain);
    }

    @Override
    public List<EvaluacionDocente> findByDocenteId(Long docenteId) {
        return jpaRepository.findByDocenteId(docenteId).stream()
                .map(EvaluacionDocenteMapper::toDomain).toList();
    }

    @Override
    public List<EvaluacionDocente> findByDocenteIdAndAsignaturaId(Long docenteId, Long asignaturaId) {
        return jpaRepository.findByDocenteIdAndAsignaturaId(docenteId, asignaturaId).stream()
                .map(EvaluacionDocenteMapper::toDomain).toList();
    }

    @Override
    public List<EvaluacionDocente> buscar(Long docenteId, Long asignaturaId, String periodo) {
        return jpaRepository.buscar(docenteId, asignaturaId, periodo).stream()
                .map(EvaluacionDocenteMapper::toDomain).toList();
    }

    @Override
    public boolean existsByDocenteAsignaturaGrupoPeriodo(Long docenteId, Long asignaturaId,
                                                         String grupo, String periodo) {
        return jpaRepository.existsByDocenteIdAndAsignaturaIdAndGrupoAndPeriodo(
                docenteId, asignaturaId, grupo, periodo);
    }
}
