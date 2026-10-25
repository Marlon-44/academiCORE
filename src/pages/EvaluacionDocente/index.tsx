
import { useEffect, useState, type FormEvent } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { useAuth } from "../../auth/AuthContext";
import {
    crearEncuesta,
    fetchEvaluacionesEstudiante,
    fetchPreguntas,
    type EvaluacionEstudianteDTO,
    type PreguntaDTO,
} from "../../services/evaluacionDocenteApi";
import styles from "./index.module.css";
import { formatName } from "../../services/textFormat";
import { Banner } from "./components/Banner";
import { FormIntro } from "./components/FormIntro";

type Respuestas = Record<number, number | string>;

export function EvaluacionDocente() {
    const { evaluacionId } = useParams<{ evaluacionId: string }>();
    const navigate = useNavigate();
    const { user, isLoading: isAuthLoading } = useAuth();

    const [evaluacion, setEvaluacion] =
        useState<EvaluacionEstudianteDTO | null>(null);
    const [preguntas, setPreguntas] = useState<PreguntaDTO[]>([]);
    const [respuestas, setRespuestas] = useState<Respuestas>({});
    const [isLoading, setIsLoading] = useState(true);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [error, setError] = useState("");
    const [success, setSuccess] = useState(false);

    useEffect(() => {
        if (isAuthLoading) return;

        let cancelled = false;

        async function cargarEncuesta() {
            const studentId = user?.estudianteId;
            const id = Number(evaluacionId);

            if (
                studentId == null ||
                !evaluacionId ||
                !Number.isSafeInteger(id) ||
                id <= 0
            ) {
                setError("No se pudo identificar la evaluación o el estudiante.");
                setIsLoading(false);
                return;
            }

            setIsLoading(true);
            setError("");

            try {
                const [evaluaciones, preguntasActivas] = await Promise.all([
                    fetchEvaluacionesEstudiante(studentId),
                    fetchPreguntas(true),
                ]);

                if (cancelled) return;

                const seleccionada = evaluaciones.find(
                    (item) => item.evaluacionId === id
                );

                if (!seleccionada) {
                    setError(
                        "Esta evaluación no está asignada a tu usuario."
                    );
                    return;
                }

                if (seleccionada.contestada) {
                    setError("Ya respondiste esta evaluación.");
                    return;
                }

                if (seleccionada.estado !== "ABIERTA") {
                    setError("Esta evaluación no está abierta para respuestas.");
                    return;
                }

                setEvaluacion(seleccionada);
                setPreguntas(
                    preguntasActivas
                        .filter((pregunta) => pregunta.estado === "ACTIVA")
                        .sort((a, b) => a.numero - b.numero)
                );
            } catch (err) {
                console.error("Error cargando la encuesta:", err);

                if (!cancelled) {
                    setError(
                        "No fue posible cargar la encuesta. Inténtalo nuevamente."
                    );
                }
            } finally {
                if (!cancelled) setIsLoading(false);
            }
        }

        void cargarEncuesta();

        return () => {
            cancelled = true;
        };
    }, [evaluacionId, user?.estudianteId, isAuthLoading]);

    const actualizarRespuesta = (
        preguntaId: number,
        valor: number | string
    ) => {
        setRespuestas((actuales) => ({
            ...actuales,
            [preguntaId]: valor,
        }));
    };

    const handleSubmit = async (event: FormEvent<HTMLFormElement>) => {
        event.preventDefault();

        const estudianteId = user?.estudianteId;

        if (!evaluacion || estudianteId == null || isSubmitting) return;

        const faltantes = preguntas.filter((pregunta) => {
            const respuesta = respuestas[pregunta.id];

            if (pregunta.tipo === "LIKERT") {
                return typeof respuesta !== "number" ||
                    respuesta < 1 ||
                    respuesta > 5;
            }

            return typeof respuesta !== "string" ||
                respuesta.trim().length === 0 ||
                respuesta.trim().length > 2000;
        });

        if (faltantes.length > 0) {
            setError(
                `Completa las ${faltantes.length} pregunta(s) pendiente(s). ` +
                "Los comentarios deben tener máximo 2000 caracteres."
            );

            document.getElementById(`pregunta-${faltantes[0].id}`)
                ?.scrollIntoView({ behavior: "smooth", block: "center" });

            return;
        }

        setError("");
        setIsSubmitting(true);

        try {
            await crearEncuesta({
                evaluacionId: evaluacion.evaluacionId,
                estudianteId,
                respuestas: preguntas.map((pregunta) => {
                    const respuesta = respuestas[pregunta.id];

                    return pregunta.tipo === "LIKERT"
                        ? {
                            preguntaId: pregunta.id,
                            valor: respuesta as number,
                        }
                        : {
                            preguntaId: pregunta.id,
                            textoRespuesta: (respuesta as string).trim(),
                        };
                }),
            });

            setSuccess(true);
        } catch (err) {
            console.error("Error enviando la encuesta:", err);
            setError(
                "No se pudo registrar la encuesta. Verifica tu conexión " +
                "y vuelve a intentarlo. Si ya fue enviada, actualiza el listado."
            );
        } finally {
            setIsSubmitting(false);
        }
    };

    if (isAuthLoading || isLoading) {
        return (
            <main className={styles.page}>
                <div className={styles.container}>
                    <p role="status">Cargando la información de la encuesta...</p>
                </div>
            </main>
        );
    }

    if (success) {
        return (
            <main className={styles.page}>
                <section className={styles.confirmation}>
                    <div className={styles.successIcon} aria-hidden="true">
                        ✓
                    </div>
                    <h1>¡Encuesta enviada!</h1>
                    <p>
                        Tus respuestas se registraron correctamente.
                        Gracias por participar en la evaluación docente.
                    </p>
                    <button
                        type="button"
                        onClick={() =>
                            navigate("/student-dashboard", {
                                replace: true,
                            })
                        }
                    >
                        Volver a mis evaluaciones
                    </button>
                </section>
            </main>
        );
    }

    if (error && !evaluacion) {
        return (
            <main className={styles.page}>
                <div className={styles.container}>
                    <div className={styles.errorBox} role="alert">
                        <p>{error}</p>
                        <button
                            type="button"
                            onClick={() =>
                                navigate("/percepcion-estudiantil")
                            }
                        >
                            Volver a mis evaluaciones
                        </button>
                    </div>
                </div>
            </main>
        );
    }

    const categorias = Array.from(
        new Set(preguntas.map((pregunta) => pregunta.categoriaNombre))
    );

    return (
        <main className={styles.page}>
            <div className={styles.container}>
                <button
                    type="button"
                    className={styles.backButton}
                    onClick={() => navigate("/percepcion-estudiantil")}
                >
                    🡐   Volver a mis evaluaciones
                </button>

                {/*<header className={styles.hero}>
                    <span className={styles.eyebrow}>
                        PERCEPCIÓN ESTUDIANTIL
                    </span>
                    <h1>Evaluación docente</h1>
                    <p>
                        Tu opinión contribuye al mejoramiento continuo
                        de los procesos académicos.
                    </p>
                </header>*/}

                {evaluacion && (
                    <Banner evaluacion={evaluacion} />
                )}

                <FormIntro />

                {error && (
                    <div className={styles.errorBox} role="alert">
                        {error}
                    </div>
                )}

                {preguntas.length === 0 ? (
                    <section className={styles.emptyState}>
                        No hay preguntas activas disponibles para la encuesta.
                    </section>
                ) : (
                    <form onSubmit={handleSubmit}>
                        {categorias.map((categoria) => {
                            const preguntasCategoria = preguntas.filter(
                                (pregunta) =>
                                    pregunta.categoriaNombre === categoria
                            );

                            return (
                                <section
                                    key={categoria}
                                    className={styles.questionSection}
                                >
                                    <h2>{categoria}</h2>

                                    {preguntasCategoria.map((pregunta) => (
                                        <article
                                            key={pregunta.id}
                                            id={`pregunta-${pregunta.id}`}
                                            className={styles.questionCard}
                                        >
                                            <p className={styles.questionText}>
                                                <span>{pregunta.numero}.</span>{" "}
                                                {pregunta.texto}
                                                <span
                                                    className={styles.required}
                                                    aria-label="Obligatoria"
                                                >
                                                    *
                                                </span>
                                            </p>

                                            {pregunta.tipo === "LIKERT" ? (
                                                <fieldset
                                                    className={styles.likert}
                                                >
                                                    <legend>
                                                        Selecciona una opción
                                                    </legend>
                                                    <div className={styles.ratingBox}>
                                                        <p>No cumple</p>
                                                        {[1, 2, 3, 4].map(
                                                            (valor) => (
                                                                <label
                                                                    key={valor}
                                                                    className={
                                                                        respuestas[pregunta.id] === valor
                                                                            ? styles.ratingSelected
                                                                            : styles.ratingOption
                                                                    }
                                                                >
                                                                    <input
                                                                        type="radio"
                                                                        name={`pregunta-${pregunta.id}`}
                                                                        value={valor}
                                                                        checked={
                                                                            respuestas[pregunta.id] === valor
                                                                        }
                                                                        onChange={() =>
                                                                            actualizarRespuesta(
                                                                                pregunta.id,
                                                                                valor
                                                                            )
                                                                        }
                                                                    />
                                                                    <span>{valor}</span>
                                                                </label>
                                                            )
                                                        )}
                                                        <p>Excelente</p>
                                                    </div>

                                                </fieldset>
                                            ) : (
                                                <div className={styles.textAnswer}>
                                                    <textarea
                                                        value={
                                                            typeof respuestas[pregunta.id] === "string"
                                                                ? respuestas[pregunta.id] as string
                                                                : ""
                                                        }
                                                        onChange={(event) =>
                                                            actualizarRespuesta(
                                                                pregunta.id,
                                                                event.target.value
                                                            )
                                                        }
                                                        rows={4}
                                                        maxLength={2000}
                                                        placeholder="Escribe tu opinión..."
                                                        aria-label={pregunta.texto}
                                                    />
                                                    <span>
                                                        {typeof respuestas[pregunta.id] === "string"
                                                            ? (respuestas[pregunta.id] as string).length
                                                            : 0}/2000
                                                    </span>
                                                </div>
                                            )}
                                        </article>
                                    ))}
                                </section>
                            );
                        })}

                        <footer className={styles.formFooter}>
                            <p>
                                Revisa tus respuestas antes de enviar.
                                Esta acción registra tu encuesta.
                            </p>

                            <button
                                type="submit"
                                disabled={isSubmitting || preguntas.length === 0}
                            >
                                {isSubmitting
                                    ? "Enviando respuestas..."
                                    : "Enviar evaluación"}
                            </button>
                        </footer>
                    </form>
                )}
            </div>
        </main>
    );
}
