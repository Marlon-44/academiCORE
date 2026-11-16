import { useState } from "react";
import { EmptyChart } from "../../charts";
import {
    DashboardHero,
    DashboardTabs,
    DocenteView,
    EncuestaView,
    ErrorAlert,
    EvaluacionView,
    LoadingSkeleton,
} from "../../components";
import { useAdminDashboard } from "../../hooks";
import { InstrumentoAdmin } from "../../instrumento";
import type { Vista } from "../../types";
import styles from "./index.module.css";

export function StudentPerceptionView() {
    const [vista, setVista] = useState<Vista>("docente");
    const dashboard = useAdminDashboard();

    const {
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
        loading,
        error,
        handleDocenteChange,
        handleEvaluacionChange,
        handleEncuestaChange,
    } = dashboard;

    return (
        <main className={styles.page}>
            <div className={styles.container}>
                <DashboardHero
                    docentes={docentes}
                    docenteId={docenteId}
                    onDocenteChange={handleDocenteChange}
                />

                <DashboardTabs vista={vista} onChange={setVista} />

                <ErrorAlert message={error} />

                {loading && <LoadingSkeleton />}

                {/* Vista: panorama del docente */}
                {!loading && vista === "docente" && docenteGraficas && (
                    <DocenteView data={docenteGraficas} />
                )}
                {!loading && vista === "docente" && !docenteGraficas && !error && (
                    <EmptyChart message="Selecciona un docente para ver sus indicadores" />
                )}

                {/* Vista: por evaluación */}
                {!loading && vista === "evaluacion" && (
                    <EvaluacionView
                        evaluaciones={evaluaciones}
                        evaluacionId={evaluacionId}
                        data={evaluacionGraficas}
                        onEvaluacionChange={handleEvaluacionChange}
                    />
                )}

                {/* Vista: encuesta individual */}
                {!loading && vista === "encuesta" && (
                    <EncuestaView
                        evaluaciones={evaluaciones}
                        evaluacionId={evaluacionId}
                        evaluacionActual={evaluacionActual}
                        encuestas={encuestas}
                        encuestaId={encuestaId}
                        data={encuestaGrafica}
                        onEvaluacionChange={handleEvaluacionChange}
                        onEncuestaChange={handleEncuestaChange}
                    />
                )}

                {/* Vista: administración del instrumento */}
                {vista === "instrumento" && <InstrumentoAdmin />}
            </div>
        </main>
    );
}
