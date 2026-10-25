export type SurveyStatus = "pending" | "completed";

export interface Evaluacion {
    // ID de la evaluación, NO el ID del docente.
    id: string;
    evaluationId: number;
    teacherId: number;

    name: string;
    subject: string;
    program: string;
    group: string;
    period: string;
    status: SurveyStatus;
}

interface StudentEvaluationDTO {
    evaluacionId: number;
    estado: string;
    grupo: string;
    periodo: string;
    docenteId: number;
    docenteNombre: string;
    asignaturaId: number;
    asignaturaCodigo: string;
    asignaturaNombre: string;
    programaNombre: string;
    contestada: boolean;
    encuestaId: number | null;
}

const API_BASE_URL =
    "http://localhost:8080/api/v1/evaluacion-docente";

async function get<T>(path: string): Promise<T> {
    const response = await fetch(`${API_BASE_URL}${path}`, {
        credentials: "include",
    });

    if (!response.ok) {
        throw new Error(
            `Error ${response.status} al consultar las evaluaciones.`
        );
    }

    return response.json() as Promise<T>;
}

export async function getEvaluaciones(
    studentId: number
): Promise<Evaluacion[]> {
    const evaluations = await get<StudentEvaluationDTO[]>(
        `/estudiantes/${studentId}/evaluaciones`
    );

    return evaluations.map((evaluation) => ({
        id: String(evaluation.evaluacionId),
        evaluationId: evaluation.evaluacionId,
        teacherId: evaluation.docenteId,
        name: evaluation.docenteNombre,
        subject: evaluation.asignaturaNombre,
        program: evaluation.programaNombre,
        group: evaluation.grupo,
        period: evaluation.periodo,
        status: evaluation.contestada ? "completed" : "pending",
    }));
}