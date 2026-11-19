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
        reescalar(graficas);
        reescalar(reporte);
        ResumenDocentePort motor = geminiAdapter.habilitado() ? geminiAdapter : templateAdapter;
        String resumen = motor.generar(graficas, reporte);
        if (resumen == null) {
            motor = templateAdapter;
            resumen = templateAdapter.generar(graficas, reporte);
        }
        return pdfRenderer.render(graficas, reporte, resumen, motor.nombre(), asignaturaId);
    }

    /* ---------- promedios expresados en escala colombiana 0-5 ---------- */

    /** Convierte un promedio Likert 1-4 a escala 0-5: (v-1)*5/3. */
    private static Double a05(Double v) {
        return v == null ? null : Math.max(0, Math.min(5, (v - 1) * 5.0 / 3.0));
    }

    private static void reescalar(com.academicore.evaluacion.application.dto.ChartSerie s) {
        if (s == null || s.getValores() == null) return;
        s.setValores(s.getValores().stream().map(ReporteDocentePdfUseCase::a05).toList());
    }

    private void reescalar(DocenteGraficasResponse g) {
        if (g == null) return;
        g.setPromedioGeneral(a05(g.getPromedioGeneral()));
        reescalar(g.getRadarCategorias());
        reescalar(g.getEvolucionPeriodos());
        if (g.getComparativoMaterias() != null) {
            g.getComparativoMaterias().forEach(i -> i.setPromedio(a05(i.getPromedio())));
        }
        if (g.getFortalezas() != null) {
            g.getFortalezas().forEach(i -> i.setPromedio(a05(i.getPromedio())));
        }
        if (g.getOportunidades() != null) {
            g.getOportunidades().forEach(i -> i.setPromedio(a05(i.getPromedio())));
        }
        // sentimientos = conteos (no se reescalan); promedioSentimiento = score -1..1
    }

    private void reescalar(DocenteReporteResponse r) {
        if (r == null) return;
        r.setPromedioGeneral(a05(r.getPromedioGeneral()));
        if (r.getEvaluaciones() != null) {
            r.getEvaluaciones().forEach(e -> e.setPromedio(a05(e.getPromedio())));
        }
    }

    public String nombreArchivo(Long docenteId, Long asignaturaId, String docenteNombre) {
        String base = "reporte-docente-" + Normalizer.normalize(
                docenteNombre == null ? String.valueOf(docenteId) : docenteNombre.toLowerCase(),
                Normalizer.Form.NFD).replaceAll("\\p{M}", "").replaceAll("[^a-z0-9]+", "-");
        return base + (asignaturaId == null ? "-general" : "-asignatura-" + asignaturaId) + ".pdf";
    }
}
