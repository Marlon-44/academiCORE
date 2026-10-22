const API_BASE_URL = "http://localhost:8080/api/v1/evaluacion-docente";

// ============================================================
// Tipos — espejo de los DTOs del backend
// ============================================================

export interface DocenteDTO {
    id: number;
    numeroDocumento: string;
    nombres: string;
    apellidos: string;
    nombreCompleto: string;
    email: string | null;
    estado: string;
}

export interface EvaluacionDTO {
    id: number;
    docenteId: number;
    docenteNombre: string | null;
    asignaturaId: number;
    asignaturaCodigo: string | null;
    asignaturaNombre: string | null;
    programaId: number | null;
    grupo: string;
    periodo: string;
    estudiantesEsperados: number | null;
    encuestasRespondidas: number;
    estado: string;
    fechaCreacion: string;
}

export interface ChartSerieDTO {
    labels: string[];
    valores: number[];
}

export interface WordCloudItemDTO {
    texto: string;
    peso: number;
}

export interface PreguntaDTO {
    id: number;
    numero: number;
    texto: string;
    tipo: "LIKERT" | "TEXTO";
    categoriaCodigo: string;
    categoriaNombre: string;
    estado: string;
}

export interface CategoriaDTO {
    id: number;
    codigo: string;
    nombre: string;
    orden: number;
    totalPreguntas: number;
}

export interface RespuestaItemDTO {
    preguntaId: number;
    valor: number | null;
    textoRespuesta: string | null;
    sentimiento: string | null;
    sentimientoScore: number | null;
    sentimientoMetodo: string | null;
}

export interface EncuestaDTO {
    id: number;
    evaluacionId: number;
    fechaRespuesta: string;
    promedio: number;
    valoracion: string;
    respuestas: RespuestaItemDTO[];
}

export interface RespuestaTextoDTO {
    numero: number | null;
    pregunta: string | null;
    texto: string;
    sentimiento: string | null;
    sentimientoScore: number | null;
    sentimientoMetodo: string | null;
}

export interface EncuestaGraficaDTO {
    encuestaId: number;
    evaluacionId: number;
    fechaRespuesta: string;
    promedioGeneral: number;
    valoracion: string;
    radarCategorias: ChartSerieDTO;
    barrasPreguntas: {
        preguntaId: number;
        numero: number;
        texto: string;
        categoria: string;
        valor: number;
    }[];
    respuestasTexto: RespuestaTextoDTO[];
}

export interface EvaluacionGraficasDTO {
    evaluacionId: number;
    docenteId: number;
    docenteNombre: string | null;
    asignaturaId: number;
    asignaturaCodigo: string | null;
    asignaturaNombre: string | null;
    grupo: string;
    periodo: string;
    participacion: {
        esperados: number | null;
        respondidas: number;
        porcentaje: number | null;
    };
    promedioGeneral: number;
    valoracion: string;
    radarCategorias: ChartSerieDTO;
    barrasPromedioPreguntas: ChartSerieDTO;
    distribucionLikert: ChartSerieDTO;
    distribucionPorPregunta: {
        numero: number;
        texto: string;
        categoria: string;
        distribucion: number[];
    }[];
    sentimientos: ChartSerieDTO;
    promedioSentimiento: number | null;
    wordCloud: WordCloudItemDTO[];
    comentariosDestacados: {
        masPositivo: string | null;
        masNegativo: string | null;
    } | null;
}

export interface DocenteGraficasDTO {
    docenteId: number;
    docenteNombre: string;
    numeroDocumento: string;
    totalEncuestas: number;
    promedioGeneral: number;
    valoracion: string;
    radarCategorias: ChartSerieDTO;
    comparativoMaterias: {
        evaluacionId: number;
        asignaturaId: number;
        asignaturaCodigo: string | null;
        asignaturaNombre: string | null;
        grupo: string;
        periodo: string;
        promedio: number;
        respondidas: number;
    }[];
    evolucionPeriodos: ChartSerieDTO;
    sentimientos: ChartSerieDTO;
    promedioSentimiento: number | null;
    fortalezas: {
        numero: number;
        texto: string;
        categoria: string;
        promedio: number;
    }[];
    oportunidades: {
        numero: number;
        texto: string;
        categoria: string;
        promedio: number;
    }[];
    wordCloud: WordCloudItemDTO[];
}

// ============================================================
// Fetchers
// ============================================================

async function get<T>(path: string): Promise<T> {
    const res = await fetch(`${API_BASE_URL}${path}`);
    if (!res.ok) throw new Error(`Error ${res.status} al consultar ${path}`);
    return res.json() as Promise<T>;
}

async function request<T>(path: string, init: RequestInit): Promise<T> {
    const res = await fetch(`${API_BASE_URL}${path}`, init);
    if (!res.ok) throw new Error(`Error ${res.status} en ${init.method ?? "request"} ${path}`);
    if (res.status === 204) return undefined as T;
    return res.json() as Promise<T>;
}

const jsonInit = (method: string, body: unknown): RequestInit => ({
    method,
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
});

export function fetchDocentes(): Promise<DocenteDTO[]> {
    return get<DocenteDTO[]>("/docentes");
}

export function fetchEvaluaciones(docenteId?: number): Promise<EvaluacionDTO[]> {
    const query = docenteId != null ? `?docenteId=${docenteId}` : "";
    return get<EvaluacionDTO[]>(`/evaluaciones${query}`);
}

export function fetchEvaluacionGraficas(evaluacionId: number): Promise<EvaluacionGraficasDTO> {
    return get<EvaluacionGraficasDTO>(`/evaluaciones/${evaluacionId}/graficas`);
}

export function fetchDocenteGraficas(
    docenteId: number,
    asignaturaId?: number
): Promise<DocenteGraficasDTO> {
    const query = asignaturaId != null ? `?asignaturaId=${asignaturaId}` : "";
    return get<DocenteGraficasDTO>(`/docentes/${docenteId}/graficas${query}`);
}

export function fetchEncuestasDeEvaluacion(evaluacionId: number): Promise<EncuestaDTO[]> {
    return get<EncuestaDTO[]>(`/evaluaciones/${evaluacionId}/encuestas`);
}

export function fetchEncuestaGrafica(encuestaId: number): Promise<EncuestaGraficaDTO> {
    return get<EncuestaGraficaDTO>(`/encuestas/${encuestaId}/grafica`);
}

// ============================================================
// Catálogo de preguntas (CRUD del instrumento)
// ============================================================

export function fetchPreguntas(soloActivas = true): Promise<PreguntaDTO[]> {
    return get<PreguntaDTO[]>(`/preguntas?soloActivas=${soloActivas}`);
}

export function fetchCategorias(): Promise<CategoriaDTO[]> {
    return get<CategoriaDTO[]>("/categorias");
}

export interface CrearPreguntaPayload {
    categoriaCodigo: string;
    numero?: number;
    texto: string;
    tipo?: "LIKERT" | "TEXTO";
}

export interface ActualizarPreguntaPayload {
    categoriaCodigo?: string;
    numero?: number;
    texto?: string;
    tipo?: "LIKERT" | "TEXTO";
}

export function crearPregunta(payload: CrearPreguntaPayload): Promise<PreguntaDTO> {
    return request<PreguntaDTO>("/preguntas", jsonInit("POST", payload));
}

export function actualizarPregunta(
    id: number,
    payload: ActualizarPreguntaPayload
): Promise<PreguntaDTO> {
    return request<PreguntaDTO>(`/preguntas/${id}`, jsonInit("PUT", payload));
}

export function cambiarEstadoPregunta(id: number, estado: string): Promise<PreguntaDTO> {
    return request<PreguntaDTO>(`/preguntas/${id}/estado`, jsonInit("PATCH", { estado }));
}

export function eliminarPregunta(id: number): Promise<void> {
    return request<void>(`/preguntas/${id}`, { method: "DELETE" });
}

export function crearCategoria(payload: {
    codigo: string;
    nombre: string;
}): Promise<CategoriaDTO> {
    return request<CategoriaDTO>("/categorias", jsonInit("POST", payload));
}
