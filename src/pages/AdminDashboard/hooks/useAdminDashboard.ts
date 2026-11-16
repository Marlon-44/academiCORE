import { useEffect, useState } from "react";
import {
    fetchDocentes,
    fetchDocenteGraficas,
    fetchEvaluaciones,
    fetchEvaluacionGraficas,
    fetchEncuestasDeEvaluacion,
    fetchEncuestaGrafica,
    type DocenteDTO,
    type DocenteGraficasDTO,
    type EncuestaDTO,
    type EncuestaGraficaDTO,
    type EvaluacionDTO,
    type EvaluacionGraficasDTO,
} from "../../../services/evaluacionDocenteApi";

/**
 * Toda la lógica de datos del dashboard: estado, efectos de carga
 * y handlers de los selectores (docente → evaluación → encuesta).
 */
export function useAdminDashboard() {
    const [docentes, setDocentes] = useState<DocenteDTO[]>([]);
    const [docenteId, setDocenteId] = useState<number | null>(null);

    const [docenteGraficas, setDocenteGraficas] = useState<DocenteGraficasDTO | null>(null);
    const [evaluaciones, setEvaluaciones] = useState<EvaluacionDTO[]>([]);
    const [evaluacionId, setEvaluacionId] = useState<number | null>(null);
    const [evaluacionGraficas, setEvaluacionGraficas] = useState<EvaluacionGraficasDTO | null>(null);
    const [encuestas, setEncuestas] = useState<EncuestaDTO[]>([]);
    const [encuestaId, setEncuestaId] = useState<number | null>(null);
    const [encuestaGrafica, setEncuestaGrafica] = useState<EncuestaGraficaDTO | null>(null);

    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");

    // Carga inicial: docentes
    useEffect(() => {
        let cancelled = false;
        fetchDocentes()
            .then((data) => {
                if (cancelled) return;
                setDocentes(data);
                if (data.length > 0) setDocenteId(data[0].id);
                else setLoading(false);
            })
            .catch(() => {
                if (cancelled) return;
                setError("No fue posible cargar los docentes. Verifica que el backend esté activo.");
                setLoading(false);
            });
        return () => {
            cancelled = true;
        };
    }, []);

    // Al cambiar docente: gráficas globales + sus evaluaciones
    useEffect(() => {
        if (docenteId == null) return;
        let cancelled = false;

        Promise.all([fetchDocenteGraficas(docenteId), fetchEvaluaciones(docenteId)])
            .then(([graficas, evals]) => {
                if (cancelled) return;
                setDocenteGraficas(graficas);
                setEvaluaciones(evals);
                setEvaluacionGraficas(null);
                setEncuestaGrafica(null);
                setEncuestas([]);
                setEncuestaId(null);
                setEvaluacionId(evals.length > 0 ? evals[0].id : null);
                if (evals.length === 0) setLoading(false);
            })
            .catch(() => {
                if (cancelled) return;
                setError("No fue posible cargar las estadísticas del docente.");
                setLoading(false);
            });
        return () => {
            cancelled = true;
        };
    }, [docenteId]);

    // Al cambiar evaluación: gráficas + encuestas
    useEffect(() => {
        if (evaluacionId == null) return;
        let cancelled = false;

        Promise.all([
            fetchEvaluacionGraficas(evaluacionId),
            fetchEncuestasDeEvaluacion(evaluacionId),
        ])
            .then(([graficas, encs]) => {
                if (cancelled) return;
                setEvaluacionGraficas(graficas);
                setEncuestas(encs);
                setEncuestaId(encs.length > 0 ? encs[0].id : null);
                if (encs.length === 0) setEncuestaGrafica(null);
                setLoading(false);
            })
            .catch(() => {
                if (cancelled) return;
                setError("No fue posible cargar las gráficas de la evaluación.");
                setLoading(false);
            });
        return () => {
            cancelled = true;
        };
    }, [evaluacionId]);

    // Al cambiar encuesta: su gráfica individual
    useEffect(() => {
        if (encuestaId == null) return;
        let cancelled = false;
        fetchEncuestaGrafica(encuestaId)
            .then((g) => {
                if (!cancelled) setEncuestaGrafica(g);
            })
            .catch(() => {
                if (!cancelled) setError("No fue posible cargar la gráfica de la encuesta.");
            });
        return () => {
            cancelled = true;
        };
    }, [encuestaId]);

    // Los selectores limpian el estado dependiente en el handler
    // (los efectos solo traen datos y setean de forma asíncrona)

    const handleDocenteChange = (id: number) => {
        setLoading(true);
        setError("");
        setDocenteGraficas(null);
        setEvaluaciones([]);
        setEvaluacionId(null);
        setEvaluacionGraficas(null);
        setEncuestas([]);
        setEncuestaId(null);
        setEncuestaGrafica(null);
        setDocenteId(id);
    };

    const handleEvaluacionChange = (id: number) => {
        setEvaluacionGraficas(null);
        setEncuestas([]);
        setEncuestaId(null);
        setEncuestaGrafica(null);
        setEvaluacionId(id);
    };

    const handleEncuestaChange = (id: number) => {
        setEncuestaGrafica(null);
        setEncuestaId(id);
    };

    const evaluacionActual = evaluaciones.find((e) => e.id === evaluacionId) ?? null;

    return {
        // datos
        docentes,
        docenteId,
        docenteGraficas,
        evaluaciones,
        evaluacionId,
        evaluacionActual,
        evaluacionGraficas,
        encuestas,
        encuestaId,
        encuestaGrafica,
        // estado de UI
        loading,
        error,
        // handlers
        handleDocenteChange,
        handleEvaluacionChange,
        handleEncuestaChange,
    };
}
