package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.model.CategoriaPregunta;
import com.academicore.evaluacion.domain.repository.CategoriaPreguntaRepository;
import com.academicore.evaluacion.infrastructure.persistence.mapper.EvaluacionDocenteMapper;
import com.academicore.evaluacion.infrastructure.persistence.repository.CategoriaPreguntaJpaRepository;
import com.academicore.evaluacion.infrastructure.persistence.repository.PreguntaEvaluacionJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class CategoriaPreguntaRepositoryAdapter implements CategoriaPreguntaRepository {

    private final CategoriaPreguntaJpaRepository jpaRepository;
    private final PreguntaEvaluacionJpaRepository preguntaJpaRepository;

    @Override
    public CategoriaPregunta save(CategoriaPregunta categoria) {
        return EvaluacionDocenteMapper.toDomain(
                jpaRepository.save(EvaluacionDocenteMapper.toEntity(categoria)));
    }

    @Override
    public Optional<CategoriaPregunta> findById(Long id) {
        return jpaRepository.findById(id).map(EvaluacionDocenteMapper::toDomain);
    }

    @Override
    public Optional<CategoriaPregunta> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(EvaluacionDocenteMapper::toDomain);
    }

    @Override
    public List<CategoriaPregunta> findAll() {
        return jpaRepository.findAllByOrderByOrdenAsc().stream()
                .map(EvaluacionDocenteMapper::toDomain).toList();
    }

    @Override
    public boolean existsByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).isPresent();
    }

    @Override
    public long countPreguntas(Long categoriaId) {
        return preguntaJpaRepository.countByCategoriaId(categoriaId);
    }
}
