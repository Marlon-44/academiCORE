
import {
    ChartNoAxesCombined,
    GraduationCap,
    Users,
    UserRound,
    ClipboardList,
    BarChart3,
    type LucideIcon,
} from "lucide-react";

export interface AdminMenuItem {
    id: string;
    label: string;
    icon?: LucideIcon;
    vista?: string;
    mock?: boolean;
    children?: AdminMenuItem[];
}

export const adminNavigation: AdminMenuItem[] = [
    {
        id: "percepcion",
        label: "Percepción Estudiantil",
        icon: ChartNoAxesCombined,
        children: [
            {
                id: "indicadores",
                label: "Panel de indicadores",
                vista: "panelIndicadores",
            },
            {
                id: "instrumento",
                label: "Gestionar instrumento",
                vista: "instrumento",
            },
        ],
    },
    {
        id: "academico",
        label: "Gestión académica",
        icon: GraduationCap,
        children: [
            {
                id: "programas",
                label: "Programas académicos",
                mock: true,
            },
            {
                id: "asignaturas",
                label: "Asignaturas",
                mock: true,
            },
            {
                id: "periodos",
                label: "Periodos académicos",
                mock: true,
            },
        ],
    },
    {
        id: "estudiantes",
        label: "Estudiantes",
        icon: Users,
        children: [
            {
                id: "directorio-estudiantes",
                label: "Directorio de estudiantes",
                mock: true,
            },
            {
                id: "matriculas",
                label: "Matrículas",
                mock: true,
            },
            {
                id: "historial-academico",
                label: "Historial académico",
                mock: true,
            },
        ],
    },
    {
        id: "docentes",
        label: "Docentes",
        icon: UserRound,
        children: [
            {
                id: "directorio-docentes",
                label: "Directorio de docentes",
                mock: true,
            },
            {
                id: "asignacion",
                label: "Asignación académica",
                mock: true,
            },
        ],
    },
    {
        id: "solicitudes",
        label: "Solicitudes",
        icon: ClipboardList,
        children: [
            {
                id: "pendientes",
                label: "Solicitudes pendientes",
                mock: true,
            },
            {
                id: "historial-solicitudes",
                label: "Historial de solicitudes",
                mock: true,
            },
        ],
    },
    {
        id: "reportes",
        label: "Reportes",
        icon: BarChart3,
        children: [
            {
                id: "reportes-generales",
                label: "Reportes generales",
                mock: true,
            },
            {
                id: "indicadores-institucionales",
                label: "Indicadores institucionales",
                mock: true,
            },
        ],
    },
];

export function findAdminNavigationPath(
    items: AdminMenuItem[],
    vista: string
): AdminMenuItem[] {
    for (const item of items) {
        if (item.vista === vista) {
            return [item];
        }

        if (item.children?.length) {
            const childPath = findAdminNavigationPath(
                item.children,
                vista
            );

            if (childPath.length > 0) {
                return [item, ...childPath];
            }
        }
    }

    return [];
}
