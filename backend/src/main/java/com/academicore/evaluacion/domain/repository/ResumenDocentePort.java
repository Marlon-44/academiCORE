package com.academicore.evaluacion.domain.repository;

import com.academicore.evaluacion.application.dto.DocenteGraficasResponse;
import com.academicore.evaluacion.application.dto.DocenteReporteResponse;

/**
 * Genera el resumen narrativo del reporte del docente
 * (panorama, fortalezas, falencias y recomendaciones).
 */
public interface ResumenDocentePort {

    /** null si el proveedor no esta disponible (el caller usa fallback). */
    String generar(DocenteGraficasResponse graficas, DocenteReporteResponse reporte);

    String nombre();
}
