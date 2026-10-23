package com.academicore.auth.domain.repository;

/**
 * Consulta el avance de un estudiante en sus evaluaciones docentes:
 * cuantas evaluaciones tiene inscritas vs cuantas ya respondio.
 */
public interface ProgresoEvaluacionPort {

    Progreso consultar(Long estudianteId);

    record Progreso(long inscritas, long respondidas) {

        public boolean completado() {
            return inscritas > 0 && respondidas >= inscritas;
        }
    }
}
