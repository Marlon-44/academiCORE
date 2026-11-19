package com.academicore.evaluacion.application.usecase;

import com.academicore.evaluacion.application.dto.DocenteGraficasResponse;
import com.academicore.evaluacion.application.dto.DocenteReporteResponse;
import com.academicore.evaluacion.domain.repository.ResumenDocentePort;
import com.academicore.evaluacion.infrastructure.ia.GeminiResumenAdapter;
import com.academicore.evaluacion.infrastructure.ia.ResumenTemplateAdapter;
import com.academicore.evaluacion.infrastructure.pdf.DocentePdfRenderer;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.Normalizer;

/**
 * Reporte PDF del docente: estadisticas + resumen narrativo.
 * El resumen usa Gemini si hay API key; si no, el template local
 * (gratis, sin limites, siempre disponible).
 */
@Service
@RequiredArgsConstructor
public class ReporteDocentePdfUseCase {

    private final GraficasUseCase graficasUseCase;
    private final DocentePdfRenderer pdfRenderer;
    private final GeminiResumenAdapter geminiAdapter;
    private final ResumenTemplateAdapter templateAdapter;

    @Transactional(readOnly = true)
    public byte[] generarPdf(Long docenteId, Long asignaturaId) {
        DocenteGraficasResponse graficas = graficasUseCase.graficasDocente(docenteId, asignaturaId);
        DocenteReporteResponse reporte = graficasUseCase.reporteDocente(docenteId, asignaturaId);
        ResumenDocentePort motor = geminiAdapter.habilitado() ? geminiAdapter : templateAdapter;
        String resumen = motor.generar(graficas, reporte);
        if (resumen == null) {
            motor = templateAdapter;
            resumen = templateAdapter.generar(graficas, reporte);
        }
        return pdfRenderer.render(graficas, reporte, resumen, motor.nombre(), asignaturaId);
    }

    public String nombreArchivo(Long docenteId, Long asignaturaId, String docenteNombre) {
        String base = "reporte-docente-" + Normalizer.normalize(
                docenteNombre == null ? String.valueOf(docenteId) : docenteNombre.toLowerCase(),
                Normalizer.Form.NFD).replaceAll("\\p{M}", "").replaceAll("[^a-z0-9]+", "-");
        return base + (asignaturaId == null ? "-general" : "-asignatura-" + asignaturaId) + ".pdf";
    }
}
