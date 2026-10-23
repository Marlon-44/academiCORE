package com.academicore.evaluacion.domain.repository;

import java.util.List;

/**
 * Proyeccion de las evaluaciones en las que esta inscrito un estudiante,
 * con la informacion que necesita su vista (docente, asignatura, grupo,
 * estado de la evaluacion y si ya la respondio).
 */
public interface EvaluacionesEstudiantePort {

    List<EvaluacionEstudiante> listar(Long estudianteId);

    record EvaluacionEstudiante(
            Long evaluacionId,
            String estado,
            String grupo,
            String periodo,
            Long docenteId,
            String docenteNombre,
            Long asignaturaId,
            String asignaturaCodigo,
            String asignaturaNombre,
            String programaNombre,
            Long encuestaId) {

        public boolean contestada() {
            return encuestaId != null;
        }
    }
}
