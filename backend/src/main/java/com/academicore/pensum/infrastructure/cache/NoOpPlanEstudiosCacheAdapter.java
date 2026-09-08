package com.academicore.pensum.infrastructure.cache;

import com.academicore.pensum.application.dto.MallaCurricularResponse;
import com.academicore.pensum.domain.repository.PlanEstudiosCachePort;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * Implementación no-op del puerto de caché.
 * Se activa solo cuando no hay un bean de Redis configurado.
 * Cuando se habilite Redis en matrícula, se reemplaza por RedisPlanEstudiosCacheAdapter.
 */
@Slf4j
@Component
@ConditionalOnMissingBean(name = "redisPlanEstudiosCacheAdapter")
public class NoOpPlanEstudiosCacheAdapter implements PlanEstudiosCachePort {

    @Override
    public Optional<MallaCurricularResponse> obtenerMalla(Long planEstudiosId) {
        return Optional.empty();
    }

    @Override
    public void guardarMalla(Long planEstudiosId, MallaCurricularResponse malla) {
        log.debug("Caché no disponible (no-op). No se guardó malla del plan {}", planEstudiosId);
    }

    @Override
    public void invalidarMalla(Long planEstudiosId) {
        log.debug("Caché no disponible (no-op). No se invalidó malla del plan {}", planEstudiosId);
    }
}
