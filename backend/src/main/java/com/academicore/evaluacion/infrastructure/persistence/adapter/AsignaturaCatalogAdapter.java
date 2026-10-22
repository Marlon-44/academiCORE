package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.repository.AsignaturaCatalogPort;
import com.academicore.evaluacion.infrastructure.persistence.repository.EvaluacionDocenteJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class AsignaturaCatalogAdapter implements AsignaturaCatalogPort {

    private final EvaluacionDocenteJpaRepository jpaRepository;

    @Override
    public Optional<AsignaturaInfo> findById(Long id) {
        return findByIds(List.of(id)).values().stream().findFirst();
    }

    @Override
    public Map<Long, AsignaturaInfo> findByIds(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return Map.of();
        }
        return jpaRepository.findAsignaturaInfo(ids).stream()
                .collect(Collectors.toMap(
                        row -> ((Number) row[0]).longValue(),
                        row -> new AsignaturaInfo(
                                ((Number) row[0]).longValue(),
                                (String) row[1],
                                (String) row[2])));
    }
}
