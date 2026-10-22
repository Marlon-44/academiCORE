package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.model.PreguntaEvaluacion;
import com.academicore.evaluacion.domain.repository.PreguntaEvaluacionRepository;
import com.academicore.evaluacion.infrastructure.persistence.entity.CategoriaPreguntaEntity;
import com.academicore.evaluacion.infrastructure.persistence.entity.PreguntaEvaluacionEntity;
import com.academicore.evaluacion.infrastructure.persistence.mapper.EvaluacionDocenteMapper;
import com.academicore.evaluacion.infrastructure.persistence.repository.CategoriaPreguntaJpaRepository;
import com.academicore.evaluacion.infrastructure.persistence.repository.PreguntaEvaluacionJpaRepository;
import com.academicore.evaluacion.infrastructure.persistence.repository.RespuestaPreguntaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class PreguntaEvaluacionRepositoryAdapter implements PreguntaEvaluacionRepository {

    private static final String ESTADO_ACTIVA = "ACTIVA";

    private final PreguntaEvaluacionJpaRepository jpaRepository;
    private final CategoriaPreguntaJpaRepository categoriaJpaRepository;
    private final RespuestaPreguntaJpaRepository respuestaJpaRepository;

    @Override
    public PreguntaEvaluacion save(PreguntaEvaluacion pregunta) {
        PreguntaEvaluacionEntity saved = jpaRepository.save(EvaluacionDocenteMapper.toEntity(pregunta));
        CategoriaPreguntaEntity cat = categoriaJpaRepository.findById(saved.getCategoriaId()).orElse(null);
        return EvaluacionDocenteMapper.toDomain(saved, cat);
    }

    @Override
    public Optional<PreguntaEvaluacion> findById(Long id) {
        return jpaRepository.findById(id)
                .map(e -> EvaluacionDocenteMapper.toDomain(
                        e, categoriaJpaRepository.findById(e.getCategoriaId()).orElse(null)));
    }

    @Override
    public List<PreguntaEvaluacion> findAllActivas() {
        return mapConCategorias(jpaRepository.findByEstadoOrderByNumeroAsc(ESTADO_ACTIVA));
    }

    @Override
    public List<PreguntaEvaluacion> findAll() {
        return mapConCategorias(jpaRepository.findAllByOrderByNumeroAsc());
    }

    @Override
    public long countActivas() {
        return jpaRepository.countByEstado(ESTADO_ACTIVA);
    }

    @Override
    public boolean existsActivaById(Long id) {
        return jpaRepository.existsByIdAndEstado(id, ESTADO_ACTIVA);
    }

    @Override
    public boolean existsByNumero(Integer numero) {
        return jpaRepository.existsByNumero(numero);
    }

    @Override
    public boolean existsByNumeroAndIdNot(Integer numero, Long id) {
        return jpaRepository.existsByNumeroAndIdNot(numero, id);
    }

    @Override
    public Optional<Integer> findMaxNumero() {
        return jpaRepository.findTopByOrderByNumeroDesc().map(PreguntaEvaluacionEntity::getNumero);
    }

    @Override
    public long countRespuestas(Long preguntaId) {
        return respuestaJpaRepository.countByPreguntaId(preguntaId);
    }

    @Override
    public void deleteById(Long id) {
        jpaRepository.deleteById(id);
    }

    private List<PreguntaEvaluacion> mapConCategorias(List<PreguntaEvaluacionEntity> entities) {
        Map<Long, CategoriaPreguntaEntity> categorias = categoriaJpaRepository.findAll().stream()
                .collect(Collectors.toMap(CategoriaPreguntaEntity::getId, Function.identity()));
        return entities.stream()
                .map(e -> EvaluacionDocenteMapper.toDomain(e, categorias.get(e.getCategoriaId())))
                .toList();
    }
}
