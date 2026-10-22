import { useEffect, useState } from "react";
import {
    Check,
    MessageSquareText,
    Pencil,
    Plus,
    Power,
    Star,
    Trash2,
    X,
} from "lucide-react";
import {
    actualizarPregunta,
    cambiarEstadoPregunta,
    crearPregunta,
    eliminarPregunta,
    fetchCategorias,
    fetchPreguntas,
    type CategoriaDTO,
    type PreguntaDTO,
} from "../../services/evaluacionDocenteApi";
import styles from "./index.module.css";

type GrupoCategoria = {
    codigo: string;
    nombre: string;
    preguntas: PreguntaDTO[];
};

export function InstrumentoAdmin() {
    const [preguntas, setPreguntas] = useState<PreguntaDTO[]>([]);
    const [categorias, setCategorias] = useState<CategoriaDTO[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");
    const [mensaje, setMensaje] = useState("");

    // Formulario de nueva pregunta
    const [nuevoTexto, setNuevoTexto] = useState("");
    const [nuevaCategoria, setNuevaCategoria] = useState("");
    const [nuevoTipo, setNuevoTipo] = useState<"LIKERT" | "TEXTO">("LIKERT");
    const [nuevoNumero, setNuevoNumero] = useState("");
    const [guardando, setGuardando] = useState(false);

    // Edición inline
    const [editandoId, setEditandoId] = useState<number | null>(null);
    const [editTexto, setEditTexto] = useState("");
    const [editNumero, setEditNumero] = useState("");

    const recargar = () =>
        Promise.all([fetchPreguntas(false), fetchCategorias()])
            .then(([p, c]) => {
                setPreguntas(p);
                setCategorias(c);
                if (c.length > 0) setNuevaCategoria((prev) => prev || c[0].codigo);
            })
            .catch(() =>
                setError("No fue posible cargar el instrumento. Verifica que el backend esté activo.")
            );

    useEffect(() => {
        let cancelled = false;
        Promise.all([fetchPreguntas(false), fetchCategorias()])
            .then(([p, c]) => {
                if (cancelled) return;
                setPreguntas(p);
                setCategorias(c);
                if (c.length > 0) setNuevaCategoria(c[0].codigo);
                setLoading(false);
            })
            .catch(() => {
                if (cancelled) return;
                setError("No fue posible cargar el instrumento. Verifica que el backend esté activo.");
                setLoading(false);
            });
        return () => {
            cancelled = true;
        };
    }, []);

    const avisar = (msg: string) => {
        setMensaje(msg);
        setError("");
    };

    const fallar = (err: unknown) => {
        setError(err instanceof Error ? err.message : "Error inesperado");
        setMensaje("");
    };

    const grupos: GrupoCategoria[] = categorias.map((c) => ({
        codigo: c.codigo,
        nombre: c.nombre,
        preguntas: preguntas
            .filter((p) => p.categoriaCodigo === c.codigo)
            .sort((a, b) => a.numero - b.numero),
    }));
    const sinCategoria = preguntas.filter(
        (p) => !categorias.some((c) => c.codigo === p.categoriaCodigo)
    );
    if (sinCategoria.length > 0) {
        grupos.push({
            codigo: "__sin__",
            nombre: "Sin categoría",
            preguntas: sinCategoria.sort((a, b) => a.numero - b.numero),
        });
    }

    const handleCrear = () => {
        if (nuevoTexto.trim().length === 0) {
            fallar(new Error("El texto de la pregunta es obligatorio"));
            return;
        }
        if (!nuevaCategoria) {
            fallar(new Error("Selecciona una categoría"));
            return;
        }
        setGuardando(true);
        crearPregunta({
            categoriaCodigo: nuevaCategoria,
            texto: nuevoTexto.trim(),
            tipo: nuevoTipo,
            numero: nuevoNumero.trim() === "" ? undefined : Number(nuevoNumero),
        })
            .then(() => {
                setNuevoTexto("");
                setNuevoNumero("");
                avisar("Pregunta creada");
                return recargar();
            })
            .catch(fallar)
            .finally(() => setGuardando(false));
    };

    const handleGuardarEdicion = (p: PreguntaDTO) => {
        const numero = editNumero.trim() === "" ? undefined : Number(editNumero);
        actualizarPregunta(p.id, { texto: editTexto.trim(), numero })
            .then(() => {
                setEditandoId(null);
                avisar(`Pregunta P${p.numero} actualizada`);
                return recargar();
            })
            .catch(fallar);
    };

    const handleToggle = (p: PreguntaDTO) => {
        const nuevo = p.estado === "ACTIVA" ? "INACTIVA" : "ACTIVA";
        cambiarEstadoPregunta(p.id, nuevo)
            .then(() => {
                avisar(`P${p.numero} ${nuevo === "ACTIVA" ? "activada" : "inactivada"}`);
                return recargar();
            })
            .catch(fallar);
    };

    const handleEliminar = (p: PreguntaDTO) => {
        eliminarPregunta(p.id)
            .then(() => {
                avisar(`Pregunta P${p.numero} eliminada`);
                return recargar();
            })
            .catch(fallar);
    };

    if (loading) {
        return (
            <div className={styles.skeletonGrid}>
                {[0, 1, 2].map((i) => (
                    <div key={i} className={styles.skeletonCard} />
                ))}
            </div>
        );
    }

    const activas = preguntas.filter((p) => p.estado === "ACTIVA").length;

    return (
        <section className={styles.instrumento}>
            <div className={styles.instrHead}>
                <div>
                    <h2>Instrumento de evaluación</h2>
                    <p>
                        {activas} de {preguntas.length} preguntas activas ·{" "}
                        {categorias.length} categorías. Las preguntas de escala usan
                        valoración 1–5; las abiertas reciben análisis de sentimiento.
                    </p>
                </div>
            </div>

            {error && (
                <div className={styles.loadError} role="alert">
                    {error}
                </div>
            )}
            {mensaje && <div className={styles.okMsg}>{mensaje}</div>}

            {/* ============ Nueva pregunta ============ */}
            <form
                className={styles.instrForm}
                onSubmit={(e) => {
                    e.preventDefault();
                    handleCrear();
                }}
            >
                <div className={styles.instrFormRow}>
                    <label className={styles.selectBox}>
                        <span>Categoría</span>
                        <select
                            value={nuevaCategoria}
                            onChange={(e) => setNuevaCategoria(e.target.value)}
                        >
                            {categorias.map((c) => (
                                <option key={c.id} value={c.codigo}>
                                    {c.nombre}
                                </option>
                            ))}
                        </select>
                    </label>
                    <label className={styles.selectBox}>
                        <span>Tipo</span>
                        <select
                            value={nuevoTipo}
                            onChange={(e) => setNuevoTipo(e.target.value as "LIKERT" | "TEXTO")}
                        >
                            <option value="LIKERT">Escala 1–5</option>
                            <option value="TEXTO">Texto abierto</option>
                        </select>
                    </label>
                    <label className={`${styles.selectBox} ${styles.numBox}`}>
                        <span>Número (opcional)</span>
                        <input
                            type="number"
                            min={1}
                            placeholder="Siguiente libre"
                            value={nuevoNumero}
                            onChange={(e) => setNuevoNumero(e.target.value)}
                        />
                    </label>
                </div>
                <div className={styles.instrFormRow}>
                    <textarea
                        className={styles.instrTextarea}
                        placeholder="Texto de la pregunta…"
                        maxLength={300}
                        value={nuevoTexto}
                        onChange={(e) => setNuevoTexto(e.target.value)}
                    />
                    <button
                        type="submit"
                        className={styles.btnPrimary}
                        disabled={guardando || nuevoTexto.trim().length === 0}
                    >
                        <Plus size={16} /> Agregar
                    </button>
                </div>
            </form>

            {/* ============ Listado por categoría ============ */}
            {grupos.map((g) => (
                <article key={g.codigo} className={styles.instrGroup}>
                    <header className={styles.instrGroupHead}>
                        <h3>{g.nombre}</h3>
                        <span className={styles.chipMuted}>
                            {g.preguntas.length} pregunta{g.preguntas.length === 1 ? "" : "s"}
                        </span>
                    </header>
                    {g.preguntas.length === 0 && (
                        <p className={styles.instrEmpty}>Sin preguntas en esta categoría</p>
                    )}
                    <ul className={styles.instrList}>
                        {g.preguntas.map((p) => (
                            <li
                                key={p.id}
                                className={`${styles.instrItem} ${
                                    p.estado !== "ACTIVA" ? styles.instrItemOff : ""
                                }`}
                            >
                                <span className={styles.instrNum}>P{p.numero}</span>
                                <div className={styles.instrBody}>
                                    {editandoId === p.id ? (
                                        <>
                                            <textarea
                                                className={styles.instrTextarea}
                                                maxLength={300}
                                                value={editTexto}
                                                onChange={(e) => setEditTexto(e.target.value)}
                                            />
                                            <div className={styles.instrEditRow}>
                                                <label className={`${styles.selectBox} ${styles.numBox}`}>
                                                    <span>Número</span>
                                                    <input
                                                        type="number"
                                                        min={1}
                                                        value={editNumero}
                                                        onChange={(e) => setEditNumero(e.target.value)}
                                                    />
                                                </label>
                                                <button
                                                    type="button"
                                                    className={styles.btnPrimary}
                                                    onClick={() => handleGuardarEdicion(p)}
                                                    disabled={editTexto.trim().length === 0}
                                                >
                                                    <Check size={14} /> Guardar
                                                </button>
                                                <button
                                                    type="button"
                                                    className={styles.btnGhost}
                                                    onClick={() => setEditandoId(null)}
                                                >
                                                    <X size={14} /> Cancelar
                                                </button>
                                            </div>
                                        </>
                                    ) : (
                                        <>
                                            <p className={styles.instrTexto}>{p.texto}</p>
                                            <div className={styles.instrMeta}>
                                                <span
                                                    className={`${styles.chip} ${
                                                        p.tipo === "TEXTO"
                                                            ? styles.chipTexto
                                                            : styles.chipLikert
                                                    }`}
                                                >
                                                    {p.tipo === "TEXTO" ? (
                                                        <MessageSquareText size={12} />
                                                    ) : (
                                                        <Star size={12} />
                                                    )}
                                                    {p.tipo === "TEXTO"
                                                        ? "Texto abierto"
                                                        : "Escala 1–5"}
                                                </span>
                                                {p.estado !== "ACTIVA" && (
                                                    <span className={`${styles.chip} ${styles.chipOff}`}>
                                                        Inactiva
                                                    </span>
                                                )}
                                            </div>
                                        </>
                                    )}
                                </div>
                                {editandoId !== p.id && (
                                    <div className={styles.instrActions}>
                                        <button
                                            type="button"
                                            className={styles.btnIcon}
                                            title="Editar texto/número"
                                            onClick={() => {
                                                setEditandoId(p.id);
                                                setEditTexto(p.texto);
                                                setEditNumero(String(p.numero));
                                            }}
                                        >
                                            <Pencil size={15} />
                                        </button>
                                        <button
                                            type="button"
                                            className={styles.btnIcon}
                                            title={p.estado === "ACTIVA" ? "Inactivar" : "Activar"}
                                            onClick={() => handleToggle(p)}
                                        >
                                            <Power size={15} />
                                        </button>
                                        <button
                                            type="button"
                                            className={`${styles.btnIcon} ${styles.btnDanger}`}
                                            title="Eliminar (solo sin respuestas)"
                                            onClick={() => handleEliminar(p)}
                                        >
                                            <Trash2 size={15} />
                                        </button>
                                    </div>
                                )}
                            </li>
                        ))}
                    </ul>
                </article>
            ))}
        </section>
    );
}
