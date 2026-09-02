import {
    createContext,
    useCallback,
    useContext,
    useEffect,
    useMemo,
    useState,
    type ReactNode,
} from "react";

interface User {
    id: string;
    username: string;
    name: string;
    role: string;
}

interface LoginCredentials {
    username: string;
    password: string;
}

interface AuthContextValue {
    user: User | null;
    isAuthenticated: boolean;
    isLoading: boolean;
    login: (credentials: LoginCredentials) => Promise<void>;
    logout: () => Promise<void>;
    checkSession: () => Promise<void>;
}

const AuthContext = createContext<AuthContextValue | undefined>(undefined);

interface AuthProviderProps {
    children: ReactNode;
}

export const AuthProvider = ({ children }: AuthProviderProps) => {
    const [user, setUser] = useState<User | null>(null);
    const [isLoading, setIsLoading] = useState(true);

    const checkSession = useCallback(async () => {
        try {
            /*
             * Cuando el backend esté listo:
             *
             * const response = await fetch("/api/auth/me", {
             *     method: "GET",
             *     credentials: "include",
             * });
             *
             * if (!response.ok) {
             *     setUser(null);
             *     return;
             * }
             *
             * const data = await response.json();
             * setUser(data.user);
             */

            // Temporal mientras no existe el backend
            setUser(null);
        } catch {
            setUser(null);
        } finally {
            setIsLoading(false);
        }
    }, []);

    const login = useCallback(
        async ({ username, password }: LoginCredentials) => {
            /*
             * Backend real:
             *
             * const response = await fetch("/api/auth/login", {
             *     method: "POST",
             *     headers: {
             *         "Content-Type": "application/json",
             *     },
             *     credentials: "include",
             *     body: JSON.stringify({
             *         username,
             *         password,
             *     }),
             * });
             *
             * if (!response.ok) {
             *     throw new Error("INVALID_CREDENTIALS");
             * }
             *
             * await checkSession();
             */

            // ------------------------------------------------
            // MOCK TEMPORAL - SOLO PARA DESARROLLO
            // ------------------------------------------------

            await new Promise((resolve) => setTimeout(resolve, 1000));

            if (username !== "admin" || password !== "123456") {
                throw new Error("INVALID_CREDENTIALS");
            }

            setUser({
                id: "1",
                username: "admin",
                name: "Administrador",
                role: "ADMIN",
            });
        },
        [checkSession]
    );

    const logout = useCallback(async () => {
        try {
            /*
             * Backend real:
             *
             * await fetch("/api/auth/logout", {
             *     method: "POST",
             *     credentials: "include",
             * });
             */
        } finally {
            setUser(null);
        }
    }, []);

    useEffect(() => {
        checkSession();
    }, [checkSession]);

    const value = useMemo(
        () => ({
            user,
            isAuthenticated: Boolean(user),
            isLoading,
            login,
            logout,
            checkSession,
        }),
        [user, isLoading, login, logout, checkSession]
    );

    return (
        <AuthContext.Provider value={value}>
            {children}
        </AuthContext.Provider>
    );
};

export const useAuth = () => {
    const context = useContext(AuthContext);

    if (!context) {
        throw new Error(
            "useAuth debe utilizarse dentro de un AuthProvider"
        );
    }

    return context;
};