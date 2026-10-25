// Paleta Universidad de Cartagena para las gráficas
export const UC_COLORS = {
    purple: "#4B317A",
    teal: "#66AD9E",
    yellow: "#F2BA19",
    orange: "#F3912B",
    red: "#ff3042",
    navy: "#0B142F",
};

export const CATEGORIA_COLORS: Record<string, string> = {
    CONCEPTUAL: UC_COLORS.purple,
    PEDAGOGICO: UC_COLORS.teal,
    RELACIONES: UC_COLORS.orange,
};

export const SENTIMIENTO_COLORS: Record<string, string> = {
    POSITIVO: UC_COLORS.teal,
    NEUTRO: UC_COLORS.yellow,
    NEGATIVO: UC_COLORS.red,
};

export const LIKERT_COLORS = [
    UC_COLORS.red,
    UC_COLORS.orange,
    UC_COLORS.yellow,
    UC_COLORS.teal,
    UC_COLORS.purple,
];
