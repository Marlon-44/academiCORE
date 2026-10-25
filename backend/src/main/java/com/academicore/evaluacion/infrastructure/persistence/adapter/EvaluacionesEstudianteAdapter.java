package com.academicore.evaluacion.infrastructure.persistence.adapter;

import com.academicore.evaluacion.domain.repository.EvaluacionesEstudiantePort;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class EvaluacionesEstudianteAdapter implements EvaluacionesEstudiantePort {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @SuppressWarnings("unchecked")
    public List<EvaluacionEstudiante> listar(Long estudianteId) {
        List<Object[]> rows = entityManager.createNativeQuery("""
                SELECT ev.id,
                       ev.estado,
                       ev.grupo,
                       ev.periodo,
                       ev.docente_id,
                       d.nombres || ' ' || d.apellidos,
                       ev.asignatura_id,
                       a.codigo,
                       a.nombre,
                       pa.nombre,
                       en.id
                FROM inscripcion_evaluacion i
                JOIN evaluacion_docente ev ON ev.id = i.evaluacion_id
                JOIN docente d ON d.id = ev.docente_id
                JOIN asignatura a ON a.id = ev.asignatura_id
                LEFT JOIN programa_academico pa ON pa.id = ev.programa_id
                LEFT JOIN encuesta_evaluacion en
                       ON en.evaluacion_id = ev.id
                      AND en.estudiante_id = i.estudiante_id
                WHERE i.estudiante_id = :estudianteId
                  AND ev.estado = 'ABIERTA'
                ORDER BY en.id NULLS FIRST, ev.periodo DESC, a.nombre
                """)
                .setParameter("estudianteId", estudianteId)
                .getResultList();

        return rows.stream()
                .map(r -> new EvaluacionEstudiante(
                        ((Number) r[0]).longValue(),
                        (String) r[1],
                        (String) r[2],
                        (String) r[3],
                        ((Number) r[4]).longValue(),
                        (String) r[5],
                        ((Number) r[6]).longValue(),
                        (String) r[7],
                        (String) r[8],
                        (String) r[9],
                        r[10] != null ? ((Number) r[10]).longValue() : null))
                .toList();
    }
}
