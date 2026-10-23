package com.academicore.auth.infrastructure.persistence.adapter;

import com.academicore.auth.domain.repository.ProgresoEvaluacionPort;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Component;

@Component
public class ProgresoEvaluacionAdapter implements ProgresoEvaluacionPort {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Progreso consultar(Long estudianteId) {
        Object[] row = (Object[]) entityManager.createNativeQuery("""
                SELECT
                    (SELECT COUNT(*) FROM inscripcion_evaluacion i
                        WHERE i.estudiante_id = :estudianteId) AS inscritas,
                    (SELECT COUNT(*) FROM encuesta_evaluacion e
                        WHERE e.estudiante_id = :estudianteId) AS respondidas
                """)
                .setParameter("estudianteId", estudianteId)
                .getSingleResult();

        return new Progreso(
                ((Number) row[0]).longValue(),
                ((Number) row[1]).longValue());
    }
}
