
import initialTeachers from "../data/teachers.json";

export type SurveyStatus = "pending" | "completed";

export interface Teacher {
    id: string;
    name: string;
    subject: string;
    program: string;
    semester: string;
    status: SurveyStatus;
}

const STORAGE_KEY = "student-teacher-surveys";

function readStoredTeachers(): Teacher[] {
    try {
        const stored = localStorage.getItem(STORAGE_KEY);

        if (stored) {
            return JSON.parse(stored) as Teacher[];
        }
    } catch {
        console.warn("No fue posible leer las evaluaciones guardadas.");
    }

    return initialTeachers as Teacher[];
}

function saveTeachers(teachers: Teacher[]): void {
    try {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(teachers));
    } catch {
        throw new Error("No fue posible guardar el estado de las evaluaciones.");
    }
}

export async function getTeachers(): Promise<Teacher[]> {
    // Simula la latencia de una petición al backend.
    await new Promise((resolve) => setTimeout(resolve, 400));

    return readStoredTeachers();
}

export async function completeTeacherSurvey(
    teacherId: string
): Promise<Teacher[]> {
    const teachers = readStoredTeachers();

    const teacherExists = teachers.some(
        (teacher) => teacher.id === teacherId
    );

    if (!teacherExists) {
        throw new Error("No se encontró la evaluación del docente.");
    }

    const updatedTeachers = teachers.map((teacher) =>
        teacher.id === teacherId
            ? { ...teacher, status: "completed" as const }
            : teacher
    );

    saveTeachers(updatedTeachers);

    return updatedTeachers;
}

export function resetTeacherSurveys(): void {
    localStorage.removeItem(STORAGE_KEY);
}
