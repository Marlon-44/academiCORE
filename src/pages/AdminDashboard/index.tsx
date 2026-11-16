import { useState } from "react";
import { useSearchParams } from "react-router-dom";

import styles from "./index.module.css";
import { AdminAside } from "./components/AdminAside";
import { AdminHeader } from "./components/AdminHeader";

// Importa tus dos componentes de vistas de administración
import { StudentPerceptionView } from "./views/StudentPerceptionView";
import { InstrumentoAdmin } from "./instrumento";
import { AdminWelcomeView } from "./views/AdminWelcomeView";

export function AdminDashboard() {
    const [asideExpanded, setAsideExpanded] = useState(false);
    const [searchParams] = useSearchParams();

    // Leemos el query param ?vista= (si no hay ninguno, por defecto muestra "panelIndicadores")
    const vistaActual = searchParams.get("vista") || "welcome";

    // Función para renderizar el componente correspondiente según la vista seleccionada
    const renderVista = () => {
        switch (vistaActual) {
            case "instrumento":
                return <InstrumentoAdmin />;
            
            case "panelIndicadores":
                return <StudentPerceptionView />
            case "docente":
            case "evaluacion":
            case "encuesta":
            default:
                return <AdminWelcomeView />;
        }
    };

    return (
        <div className={`${styles.layout} ${asideExpanded ? styles.expanded : styles.collapsed}`}>
            <AdminAside
                onExpandedChange={setAsideExpanded}
            />

            <div className={styles.main}>
                <AdminHeader />
                <main className={styles.content}>
                    {renderVista()}
                </main>
            </div>
        </div>
    );
}