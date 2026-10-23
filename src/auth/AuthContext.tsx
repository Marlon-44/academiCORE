import {
    createContext,
    useCallback,
    useContext,
    useEffect,
    useMemo,
    useState,
    type ReactNode,
} from "react";

import {
    loginRequest,
    logoutRequest,
    meRequest,
    type AuthUser,
    type LoginCredentials,
} from "../services/authApi";


type User = AuthUser;

interface AuthContextValue {
    user: User | null;
    isAuthenticated: boolean;
    isLoading: boolean;
    login: (credentials: LoginCredentials) => Promise<User>;
    logout: () => Promise<void>;
    checkSession: () => Promise<void>;
    completeSurvey: () => void;
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
            const currentUser = await meRequest();
            setUser(currentUser);
        } catch {
            setUser(null);
        } finally {
            setIsLoading(false);
        }
    }, []);

    const login = useCallback(
        async (credentials: LoginCredentials) => {
            const authenticatedUser = await loginRequest(credentials);
            setUser(authenticatedUser);
            return authenticatedUser;
        },
        []
    );


    const completeSurvey = useCallback(() => {
        setUser((currentUser) => {
            if (!currentUser) {
                return null;
            }

            return {
                ...currentUser,
                surveyCompleted: true,
            };
        });
    }, []);


    const logout = useCallback(async () => {
        try {
            await logoutRequest();
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
            completeSurvey,
        }),
        [
            user,
            isLoading,
            login,
            logout,
            checkSession,
            completeSurvey,
        ]
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
