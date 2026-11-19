package com.academicore.evaluacion.infrastructure.ia;

import com.academicore.evaluacion.application.dto.DocenteGraficasResponse;
import com.academicore.evaluacion.application.dto.DocenteReporteResponse;
import com.academicore.evaluacion.domain.repository.ResumenDocentePort;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

/**
 * Resumen narrativo generado localmente (plantillas NLG en español).
 * Gratis, sin límites ni dependencias externas: siempre disponible
 * como fallback del proveedor de IA configurado.
 */
@Component
public class ResumenTemplateAdapter implements ResumenDocentePort {

    @Override
    public String generar(DocenteGraficasResponse g, DocenteReporteResponse r) {
        StringBuilder sb = new StringBuilder();
        sb.append(panorama(g));
        sb.append("\n\n").append(fortalezas(g));
        sb.append("\n\n").append(falencias(g));
        sb.append("\n\n").append(sentimiento(g));
        sb.append("\n\n").append(recomendacion(g, r));
        return sb.toString();
    }

    @Override
    public String nombre() {
        return "TEMPLATE_LOCAL";
    }

    private String panorama(DocenteGraficasResponse g) {
        String materias = g.getComparativoMaterias() == null ? "esta evaluación"
                : g.getComparativoMaterias().stream()
                        .map(DocenteGraficasResponse.ComparativoItem::getAsignaturaNombre)
                        .distinct()
                        .collect(Collectors.joining(" y "));
        return String.format(Locale.ROOT,
                "PANORAMA GENERAL. %s obtuvo un promedio de %.2f sobre 4 (valoración: %s), "
                        + "a partir de %d encuestas de percepción estudiantil en %s.",
                g.getDocenteNombre(), nullSafe(g.getPromedioGeneral()), nullTo(g.getValoracion(), "N/D"),
                g.getTotalEncuestas(), materias);
    }

    private String fortalezas(DocenteGraficasResponse g) {
        StringBuilder sb = new StringBuilder("FORTALEZAS. ");
        List<String> topCats = topCategorias(g.getRadarCategorias() == null ? List.of()
                : labelsValores(g.getRadarCategorias().getLabels(), g.getRadarCategorias().getValores()), true);
        if (!topCats.isEmpty()) {
            sb.append(String.format(Locale.ROOT,
                    "Sus mejores resultados se concentran en %s. ", String.join(" y ", topCats)));
        }
        if (g.getFortalezas() != null && !g.getFortalezas().isEmpty()) {
            String preguntas = g.getFortalezas().stream().limit(2)
                    .map(p -> String.format(Locale.ROOT, "«%s» (%.1f)", cortar(p.getTexto()), nullSafe(p.getPromedio())))
                    .collect(Collectors.joining(" y "));
            sb.append("Los aspectos mejor calificados por los estudiantes fueron ").append(preguntas).append(".");
        }
        return sb.toString().trim();
    }

    private String falencias(DocenteGraficasResponse g) {
        StringBuilder sb = new StringBuilder("ÁREAS DE MEJORA. ");
        List<String> bottomCats = topCategorias(g.getRadarCategorias() == null ? List.of()
                : labelsValores(g.getRadarCategorias().getLabels(), g.getRadarCategorias().getValores()), false);
        if (!bottomCats.isEmpty()) {
            sb.append(String.format(Locale.ROOT,
                    "Las categorías con menor puntaje son %s. ", String.join(" y ", bottomCats)));
        }
        if (g.getOportunidades() != null && !g.getOportunidades().isEmpty()) {
            String preguntas = g.getOportunidades().stream().limit(2)
                    .map(p -> String.format(Locale.ROOT, "«%s» (%.1f)", cortar(p.getTexto()), nullSafe(p.getPromedio())))
                    .collect(Collectors.joining(" y "));
            sb.append("Los ítems que más atención requieren son ").append(preguntas).append(".");
        }
        return sb.toString().trim();
    }

    private String sentimiento(DocenteGraficasResponse g) {
        if (g.getSentimientos() == null || g.getSentimientos().getLabels() == null) {
            return "SENTIMIENTO. Sin datos suficientes de comentarios.";
        }
        List<String> labels = g.getSentimientos().getLabels();
        List<Double> valores = g.getSentimientos().getValores();
        double total = valores.stream().mapToDouble(Double::doubleValue).sum();
        if (total == 0) {
            return "SENTIMIENTO. Sin comentarios analizados.";
        }
        StringBuilder sb = new StringBuilder("SENTIMIENTO EN LOS COMENTARIOS. ");
        for (int i = 0; i < labels.size(); i++) {
            sb.append(String.format(Locale.ROOT, "%s %.0f%%", labels.get(i).toLowerCase(Locale.ROOT),
                    valores.get(i) / total * 100));
            if (i < labels.size() - 2) sb.append(", ");
            else if (i == labels.size() - 2) sb.append(" y ");
            else sb.append(" de las apreciaciones escritas.");
        }
        return sb.toString();
    }

    private String recomendacion(DocenteGraficasResponse g, DocenteReporteResponse r) {
        double p = nullSafe(g.getPromedioGeneral());
        StringBuilder sb = new StringBuilder("RECOMENDACIÓN. ");
        if (p >= 3.5) {
            sb.append("Mantener el desempeño actual: la percepción estudiantil es consistentemente alta. "
                    + "Se sugiere socializar las buenas prácticas con otros docentes del programa.");
        } else if (p >= 3.0) {
            sb.append("Desempeño sólido con margen de mejora. Reforzar los aspectos menos valorados "
                    + "manteniendo las fortalezas que los estudiantes reconocen.");
        } else if (p >= 2.5) {
            sb.append("Se recomienda un plan de acompañamiento pedagógico centrado en las categorías "
                    + "con menor puntaje, con seguimiento en el próximo periodo de evaluación.");
        } else {
            sb.append("Se recomienda una intervención prioritaria: acompañamiento didáctico, revisión "
                    + "de la metodología de clase y una nueva medición en el corto plazo.");
        }
        if (r != null && r.getEvaluaciones() != null) {
            long negativos = r.getEvaluaciones().stream()
                    .flatMap(e -> e.getComentarios() == null ? java.util.stream.Stream.empty() : e.getComentarios().stream())
                    .filter(c -> "NEGATIVO".equalsIgnoreCase(c.getSentimiento()))
                    .count();
            if (negativos > 0) {
                sb.append(String.format(Locale.ROOT,
                        " Existen %d comentarios con valoración negativa que conviene revisar en detalle.", negativos));
            }
        }
        return sb.toString();
    }

    private record CatValor(String categoria, double valor) {}

    private List<CatValor> labelsValores(List<String> labels, List<Double> valores) {
        List<CatValor> out = new java.util.ArrayList<>();
        if (labels == null || valores == null) return out;
        for (int i = 0; i < Math.min(labels.size(), valores.size()); i++) {
            out.add(new CatValor(labels.get(i), valores.get(i)));
        }
        return out;
    }

    private List<String> topCategorias(List<CatValor> cats, boolean top) {
        Comparator<CatValor> cmp = Comparator.comparingDouble(CatValor::valor);
        return cats.stream()
                .sorted(top ? cmp.reversed() : cmp)
                .limit(2)
                .map(c -> String.format(Locale.ROOT, "%s (%.1f)", legible(c.categoria()), c.valor()))
                .toList();
    }

    private String legible(String cat) {
        return cat == null ? "" : cat.replace('_', ' ').toLowerCase(Locale.ROOT);
    }

    private String cortar(String texto) {
        if (texto == null) return "";
        return texto.length() > 70 ? texto.substring(0, 67) + "…" : texto;
    }

    private double nullSafe(Double d) {
        return d == null ? 0.0 : d;
    }

    private String nullTo(String s, String def) {
        return s == null || s.isBlank() ? def : s;
    }
}
