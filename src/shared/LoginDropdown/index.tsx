import { useEffect, useRef, useState } from "react";

import styles from "./index.module.css";
import { useAuth } from "../../auth/AuthContext";
import { useNavigate } from "react-router-dom";
import { Eye, EyeClosed, Lock } from "lucide-react";
interface LoginDropdownProps {
    isOpen: boolean;
    onClose: () => void;
}

export const LoginDropdown = ({
    isOpen,
    onClose,
}: LoginDropdownProps) => {
    const navigate = useNavigate();
    const dropdownRef = useRef<HTMLDivElement>(null);

    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");

    const [showPassword, setShowPassword] = useState(false);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState("");


    const { login } = useAuth();
    /*
     * Cerrar el dropdown cuando se hace click fuera.
     */
    useEffect(() => {
        const handleClickOutside = (event: MouseEvent) => {
            if (
                dropdownRef.current &&
                !dropdownRef.current.contains(event.target as Node)
            ) {
                onClose();
            }
        };

        if (isOpen) {
            document.addEventListener("mousedown", handleClickOutside);
        }

        return () => {
            document.removeEventListener("mousedown", handleClickOutside);
        };
    }, [isOpen, onClose]);

    /*
     * Cerrar con Escape.
     */
    useEffect(() => {
        const handleEscape = (event: KeyboardEvent) => {
            if (event.key === "Escape") {
                onClose();
            }
        };

        if (isOpen) {
            document.addEventListener("keydown", handleEscape);
        }

        return () => {
            document.removeEventListener("keydown", handleEscape);
        };
    }, [isOpen, onClose]);


    if (!isOpen) {
        return null;
    }

    const isUsernameValid = username.trim().length >= 3;
    const isPasswordValid = password.length >= 1;

    const isFormValid = isUsernameValid && isPasswordValid;

    const handleSubmit = async (event: SubmitEvent) => {
        event.preventDefault();

        if (!isFormValid || isLoading) {
            return;
        }

        setIsLoading(true);
        setError("");

        try {
            /*
            const response = await fetch("/api/auth/login", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    credentials: "include",
                    body: JSON.stringify({
                        username: username.trim(),
                        password,
                    }),
                });

                if (!response.ok) {
                    throw new Error("LOGIN_FAILED");
                }

                navigate("/student-dashboard");
             */

            // Simulación temporal
            await login({
                username: username.trim(),
                password,
            });

            onClose();
            navigate("/student-dashboard", {
                replace: true,
            });
        } catch {
            /*
             * No mostramos si el usuario existe o no.
             * Esto evita facilitar ataques de enumeración de usuarios.
             */
            setError(
                "No fue posible iniciar sesión. Verifica tus datos e inténtalo nuevamente."
            );
        } finally {
            setIsLoading(false);
        }
    };

    const handleForgotPassword = () => {
        onClose();
        navigate("/recuperar-password");
    };

    return (
        <div
            ref={dropdownRef}
            className={styles.dropdown}
            role="dialog"
            aria-label="Inicio de sesión"
        >
            <div className={styles.header}>
                <div>
                    <span className={styles.eyebrow}>
                        UNIVERSIDAD DE CARTAGENA
                    </span>

                    <h2>Iniciar sesión</h2>
                </div>

                <button
                    type="button"
                    className={styles.closeButton}
                    onClick={onClose}
                    aria-label="Cerrar inicio de sesión"
                >
                    ×
                </button>
            </div>

            <p className={styles.description}>
                Accede a tu plataforma académica.
            </p>

            <form onSubmit={handleSubmit} noValidate>
                <div className={styles.field}>
                    <label htmlFor="login-username">
                        Usuario
                    </label>

                    <input
                        id="login-username"
                        name="username"
                        type="text"
                        value={username}
                        onChange={(event) => {
                            setUsername(event.target.value);
                            setError("");
                        }}
                        placeholder="Ingresa tu usuario"
                        autoComplete="username"
                        maxLength={100}
                        spellCheck={false}
                        autoCapitalize="none"
                        required
                        aria-invalid={
                            username.length > 0 && !isUsernameValid
                        }
                    />

                    {username.length > 0 && !isUsernameValid && (
                        <span className={styles.validation}>
                            El usuario debe tener al menos 3 caracteres.
                        </span>
                    )}
                </div>

                <div className={styles.field}>
                    <div className={styles.passwordLabel}>
                        <label htmlFor="login-password">
                            Contraseña
                        </label>
                    </div>

                    <div className={styles.passwordWrapper}>
                        <input
                            id="login-password"
                            name="password"
                            type={showPassword ? "text" : "password"}
                            value={password}
                            onChange={(event) => {
                                setPassword(event.target.value);
                                setError("");
                            }}
                            placeholder="Ingresa tu contraseña"
                            autoComplete="current-password"
                            maxLength={128}
                            required
                            aria-invalid={
                                password.length > 0 && !isPasswordValid
                            }
                        />

                        <button
                            type="button"
                            className={styles.showPassword}
                            onClick={() =>
                                setShowPassword((current) => !current)
                            }
                            aria-label={
                                showPassword
                                    ? "Ocultar contraseña"
                                    : "Mostrar contraseña"
                            }
                        >
                            {showPassword ? <EyeClosed size={24} color="grey" /> : <Eye size={24} color="grey" />}
                        </button>
                    </div>
                </div>

                {error && (
                    <div
                        className={styles.error}
                        role="alert"
                    >
                        <span>!</span>
                        {error}
                    </div>
                )}

                <button
                    type="submit"
                    className={styles.submitButton}
                    disabled={!isFormValid || isLoading}
                >
                    {isLoading ? (
                        <>
                            <span className={styles.spinner} />
                            Verificando...
                        </>
                    ) : (
                        "Iniciar sesión"
                    )}
                </button>
            </form>

            <button
                type="button"
                className={styles.forgotPassword}
                onClick={handleForgotPassword}
            >
                ¿Olvidaste tu contraseña?
            </button>

            <div className={styles.securityNotice}>
                <Lock color="grey" size={16} />
                <p>
                    Tu información se transmite de forma segura.
                </p>
            </div>
        </div>
    );
};

