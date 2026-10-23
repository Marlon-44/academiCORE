package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.repository.CatalogoAcademicoPort;
import com.academicore.evaluacion.infrastructure.persistence.repository.EvaluacionDocenteJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class CatalogoAcademicoAdapter implements CatalogoAcademicoPort {

    private final EvaluacionDocenteJpaRepository jpaRepository;

    @Override
    public Optional<ProgramaInfo> findProgramaById(Long id) {
        if (id == null) {
            return Optional.empty();
        }
        return findProgramasByIds(List.of(id)).values().stream().findFirst();
    }

    @Override
    public Map<Long, ProgramaInfo> findProgramasByIds(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return Map.of();
        }
        return jpaRepository.findProgramaInfo(ids).stream()
                .collect(Collectors.toMap(
                        row -> ((Number) row[0]).longValue(),
                        row -> new ProgramaInfo(
                                ((Number) row[0]).longValue(),
                                (String) row[1],
                                (String) row[2])));
    }

    @Override
    public Optional<DepartamentoInfo> findDepartamentoById(Long id) {
        if (id == null) {
            return Optional.empty();
        }
        return jpaRepository.findDepartamentoInfo(List.of(id)).stream()
                .findFirst()
                .map(row -> new DepartamentoInfo(
                        ((Number) row[0]).longValue(),
                        (String) row[1],
                        (String) row[2]));
    }

    @Override
    public Optional<PlanInfo> findPlanEstudiosById(Long id) {
        if (id == null) {
            return Optional.empty();
        }
        return jpaRepository.findPlanEstudiosInfo(List.of(id)).stream()
                .findFirst()
                .map(row -> new PlanInfo(
                        ((Number) row[0]).longValue(),
                        (String) row[1],
                        (String) row[2]));
    }

    public Map<Long, DepartamentoInfo> findDepartamentosByIds(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return Map.of();
        }
        return jpaRepository.findDepartamentoInfo(ids).stream()
                .collect(Collectors.toMap(
                        row -> ((Number) row[0]).longValue(),
                        mapDepartamento()));
    }

    private Function<Object[], DepartamentoInfo> mapDepartamento() {
        return row -> new DepartamentoInfo(
                ((Number) row[0]).longValue(),
                (String) row[1],
                (String) row[2]);
    }
}
