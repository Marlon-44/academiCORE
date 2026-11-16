import { useEffect, useState, type ReactNode } from "react";
import { API_URL } from "../../config/api";
import styles from "./index.module.css";

const HEALTH_URL = `${API_URL}/api/health`;
const RETRY_MS = 2500;
const TIMEOUT_MS = 120_000;

type GateState = "connecting" | "ready" | "failed";

/**
 * Bloquea la app hasta que el backend responda.
 * Pensado para Render free tier: el servicio duerme tras inactividad y el
 * primer request lo despierta (cold start ~1 min). Muestra un splash con
 * reintentos hasta que /api/health contesta.
 */
export const BackendGate = ({ children }: { children: ReactNode }) => {
    const [state, setState] = useState<GateState>("connecting");
    const [elapsed, setElapsed] = useState(0);
    const [attempt, setAttempt] = useState(0);

    useEffect(() => {
        let cancelled = false;
        const startedAt = Date.now();

        const tick = setInterval(() => {
            if (!cancelled) setElapsed(Date.now() - startedAt);
        }, 1000);

        const ping = async () => {
            while (!cancelled) {
                try {
                    const res = await fetch(HEALTH_URL, {
                        credentials: "include",
                        signal: AbortSignal.timeout(10_000),
                    });
                    if (res.ok) {
                        if (!cancelled) setState("ready");
                        return;
                    }
                } catch {
                    /* backend aún dormido o sin red — reintentar */
                }

                if (Date.now() - startedAt >= TIMEOUT_MS) {
                    if (!cancelled) setState("failed");
                    return;
                }
                await new Promise((r) => setTimeout(r, RETRY_MS));
            }
        };

        void ping();
        return () => {
            cancelled = true;
            clearInterval(tick);
        };
    }, [attempt]);

    if (state === "ready") return <>{children}</>;

    const waking = elapsed > 10_000;

    return (
        <div className={styles.splash} role="status" aria-live="polite">
            <div className={styles.card}>
                <div className={styles.logo}>
                    academi<span>CORE</span>
                </div>
                <div className={styles.spinner} aria-hidden="true" />
                {state === "failed" ? (
                    <>
                        <p className={styles.title}>No pudimos conectar con el servidor</p>
                        <p className={styles.subtitle}>
                            Verifica tu conexión o inténtalo de nuevo en un momento.
                        </p>
                        <button
                            className={styles.retry}
                            onClick={() => {
                                setElapsed(0);
                                setState("connecting");
                                setAttempt((a) => a + 1);
                            }}
                        >
                            Reintentar
                        </button>
                    </>
                ) : (
                    <>
                        <p className={styles.title}>
                            {waking
                                ? "Despertando el servidor…"
                                : "Conectando con el servidor…"}
                        </p>
                        <p className={styles.subtitle}>
                            {waking
                                ? "El servicio estaba en reposo; puede tardar hasta un minuto."
                                : "Un momento, por favor."}
                        </p>
                    </>
                )}
            </div>
        </div>
    );
};
