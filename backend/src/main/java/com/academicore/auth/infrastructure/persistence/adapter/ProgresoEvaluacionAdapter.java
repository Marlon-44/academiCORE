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
                        JOIN evaluacion_docente ev ON ev.id = i.evaluacion_id
                        WHERE i.estudiante_id = :estudianteId
                          AND ev.estado = 'ABIERTA') AS inscritas,
                    (SELECT COUNT(*) FROM encuesta_evaluacion e
                        JOIN evaluacion_docente ev ON ev.id = e.evaluacion_id
                        WHERE e.estudiante_id = :estudianteId
                          AND ev.estado = 'ABIERTA') AS respondidas
                """)
                .setParameter("estudianteId", estudianteId)
                .getSingleResult();

        return new Progreso(
                ((Number) row[0]).longValue(),
                ((Number) row[1]).longValue());
    }
}
