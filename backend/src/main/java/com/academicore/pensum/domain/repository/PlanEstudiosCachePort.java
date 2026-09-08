package com.academicore.pensum.domain.repository;

import com.academicore.pensum.application.dto.MallaCurricularResponse;

import java.util.Optional;

/**
 * Puerto de caché para planes de estudio.
 * La implementación concreta (Redis) se activará cuando llegue el módulo de Matrícula,
 * donde la concurrencia masiva hace crítico cachear la malla curricular.
 * Por ahora el puerto queda definido para no retocar los casos de uso después.
 */
public interface PlanEstudiosCachePort {

    Optional<MallaCurricularResponse> obtenerMalla(Long planEstudiosId);

    void guardarMalla(Long planEstudiosId, MallaCurricularResponse malla);

    void invalidarMalla(Long planEstudiosId);
}
