import type { DocenteDTO } from "../../../../services/evaluacionDocenteApi";
import styles from "./index.module.css";
import { useMemo, useState } from "react";
import { Search, UserRound } from "lucide-react";
interface Props {
    docentes: DocenteDTO[];
    docenteId: number | null;
    onDocenteChange: (id: number) => void;
}

export function DashboardHero({ docentes, docenteId, onDocenteChange }: Props) {



    // Dentro de tu componente:

    const [busquedaDocente, setBusquedaDocente] = useState("");

    const docentesFiltrados = useMemo(() => {
        const termino = busquedaDocente.trim().toLowerCase();

        if (!termino) return docentes;

        return docentes.filter((docente) =>
            docente.nombreCompleto.toLowerCase().includes(termino)
        );
    }, [docentes, busquedaDocente]);

    const docentesVisibles = docentesFiltrados.slice(0, 3);

    return (
        <section className={styles.hero}>
            <div>

                <h1>Panel de indicadores</h1>
                <p>
                    Promedios por categoría, distribución de valoraciones, sentimiento de los
                    comentarios y evolución por periodo.
                </p>
            </div>

            <div className={styles.docentePicker}>
                <label htmlFor="buscarDocente">
                    Docente
                </label>

                {/* Buscador */}
                <div className={styles.docenteSearch}>
                    <Search size={18} />

                    <input
                        id="buscarDocente"
                        type="text"
                        placeholder="Buscar docente por nombre..."
                        value={busquedaDocente}
                        onChange={(e) => setBusquedaDocente(e.target.value)}
                        disabled={docentes.length === 0}
                    />
                </div>

                {/* Tarjetas de docentes */}
                <div className={styles.docenteGrid}>
                    {docentesVisibles.map((docente) => {
                        const seleccionado = docenteId === docente.id;

                        return (
                            <button
                                key={docente.id}
                                type="button"
                                className={`${styles.docenteCard} ${seleccionado ? styles.docenteCardSelected : ""
                                    }`}
                                onClick={() => onDocenteChange(docente.id)}
                            >
                                <div className={styles.docenteAvatar}>
                                    <UserRound size={22} />
                                </div>

                                <span className={styles.docenteNombre}>
                                    {docente.nombreCompleto}
                                </span>

                                
                            </button>
                        );
                    })}
                </div>

                {/* Estados */}
                {docentes.length === 0 && (
                    <p>No hay docentes disponibles.</p>
                )}

                {docentes.length > 0 && docentesFiltrados.length === 0 && (
                    <p>No se encontraron docentes con ese nombre.</p>
                )}

                {docentesFiltrados.length > 3 && (
                    <p className={styles.docenteHint}>
                        Mostrando 3 de {docentesFiltrados.length} docentes.
                        Usa el buscador para encontrar otro.
                    </p>
                )}
            </div>

        </section>
    );
}
