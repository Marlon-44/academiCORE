const API_BASE_URL = "http://localhost:8080/api/v1";

export interface CampusDTO {
    id: number;
    codigo: string;
    nombre: string;
    direccion: string;
    ciudad: string;
    descripcion: string;
    estado: string;
    esSedePrincipal: boolean;
    orden: number;
    urlMapa: string;
}

export interface ImagenCampusDTO {
    id: number;
    campusId: number;
    categoriaCodigo: string;
    categoriaNombre: string;
    url: string;
    descripcion: string;
    orden: number;
    fechaCarga: string;
    estado: string;
}

export async function fetchCampus(): Promise<CampusDTO[]> {
    const res = await fetch(`${API_BASE_URL}/campus`);
    if (!res.ok) throw new Error("Error al obtener campus");
    return res.json();
}

export async function fetchImagenesCampus(campusId: number): Promise<ImagenCampusDTO[]> {
    const res = await fetch(`${API_BASE_URL}/campus/${campusId}/imagenes`);
    if (!res.ok) throw new Error("Error al obtener imágenes del campus");
    return res.json();
}

export async function fetchPortadaCampus(campusId: number): Promise<string | null> {
    const imagenes = await fetchImagenesCampus(campusId);
    const portada = imagenes.find((img) => img.categoriaCodigo === "PORTADA");
    return portada ? portada.url : null;
}
