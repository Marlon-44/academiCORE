export type Vista = "docente" | "evaluacion" | "encuesta" | "instrumento";

export type Sentimiento = "POSITIVO" | "NEUTRO" | "NEGATIVO";

export type Admin = {
    name: string;
    role: string;
    department: string;
    institution: string;
    email: string;
    avatar: string;
    academicPeriod: string;
}