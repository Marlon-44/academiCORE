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
 * Resumen narrativo generado localmente (plantillas NLG en español, registro
 * formal/institucional). Gratuito, sin límites ni dependencias externas:
 * siempre disponible como fallback del proveedor de IA configurado.
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
        String materias = g.getComparativoMaterias() == null ? "la evaluación correspondiente"
                : g.getComparativoMaterias().stream()
                        .map(DocenteGraficasResponse.ComparativoItem::getAsignaturaNombre)
                        .distinct()
                        .collect(Collectors.joining(" y "));
        return String.format(Locale.ROOT,
                "PANORAMA GENERAL. En el marco del proceso institucional de evaluación del desempeño "
                        + "docente, el docente %s obtuvo un promedio general de %.2f sobre 5 puntos "
                        + "(valoración cualitativa: %s), con base en %d encuestas de percepción "
                        + "estudiantil correspondientes a %s.",
                g.getDocenteNombre(), nullSafe(g.getPromedioGeneral()),
                nullTo(g.getValoracion(), "N/D"), g.getTotalEncuestas(), materias);
    }

    private String fortalezas(DocenteGraficasResponse g) {
        StringBuilder sb = new StringBuilder("FORTALEZAS. ");
        List<String> topCats = topCategorias(g.getRadarCategorias() == null ? List.of()
                : labelsValores(g.getRadarCategorias().getLabels(), g.getRadarCategorias().getValores()), true);
        if (!topCats.isEmpty()) {
            sb.append(String.format(Locale.ROOT,
                    "Los resultados más sobresalientes se concentran en las categorías de %s. ",
                    String.join(" y ", topCats)));
        }
        if (g.getFortalezas() != null && !g.getFortalezas().isEmpty()) {
            String preguntas = g.getFortalezas().stream().limit(2)
                    .map(p -> String.format(Locale.ROOT, "«%s» (%.1f)",
                            cortar(p.getTexto()), nullSafe(p.getPromedio())))
                    .collect(Collectors.joining(" y "));
            sb.append("Asimismo, los aspectos mejor calificados por la población estudiantil "
                    + "corresponden a ").append(preguntas)
                    .append(", lo cual refleja un reconocimiento consistente de su labor pedagógica.");
        }
        return sb.toString().trim();
    }

    private String falencias(DocenteGraficasResponse g) {
        StringBuilder sb = new StringBuilder("ÁREAS DE MEJORA. ");
        List<String> bottomCats = topCategorias(g.getRadarCategorias() == null ? List.of()
                : labelsValores(g.getRadarCategorias().getLabels(), g.getRadarCategorias().getValores()), false);
        if (!bottomCats.isEmpty()) {
            sb.append(String.format(Locale.ROOT,
                    "Por su parte, las categorías que registran los puntajes más bajos son %s. ",
                    String.join(" y ", bottomCats)));
        }
        if (g.getOportunidades() != null && !g.getOportunidades().isEmpty()) {
            String preguntas = g.getOportunidades().stream().limit(2)
                    .map(p -> String.format(Locale.ROOT, "«%s» (%.1f)",
                            cortar(p.getTexto()), nullSafe(p.getPromedio())))
                    .collect(Collectors.joining(" y "));
            sb.append("En particular, los ítems que demandan mayor atención corresponden a ")
                    .append(preguntas)
                    .append(", aspectos sobre los cuales conviene focalizar las acciones de mejoramiento.");
        }
        return sb.toString().trim();
    }

    private String sentimiento(DocenteGraficasResponse g) {
        if (g.getSentimientos() == null || g.getSentimientos().getLabels() == null) {
            return "SENTIMIENTO EN LOS COMENTARIOS. No se dispone de datos cualitativos suficientes "
                    + "para efectuar el análisis de las apreciaciones escritas.";
        }
        List<String> labels = g.getSentimientos().getLabels();
        List<Double> valores = g.getSentimientos().getValores();
        double total = valores.stream().mapToDouble(Double::doubleValue).sum();
        if (total == 0) {
            return "SENTIMIENTO EN LOS COMENTARIOS. No se registran comentarios susceptibles de análisis.";
        }
        StringBuilder sb = new StringBuilder(
                "SENTIMIENTO EN LOS COMENTARIOS. El análisis de las apreciaciones escritas evidencia "
                        + "la siguiente distribución: ");
        int idxMax = 0;
        for (int i = 0; i < labels.size(); i++) {
            if (valores.get(i) > valores.get(idxMax)) idxMax = i;
            sb.append(String.format(Locale.ROOT, "%s %.0f%%", labels.get(i).toLowerCase(Locale.ROOT),
                    valores.get(i) / total * 100));
            if (i < labels.size() - 2) sb.append(", ");
            else if (i == labels.size() - 2) sb.append(" y ");
            else sb.append(".");
        }
        sb.append(String.format(Locale.ROOT,
                " Lo anterior indica una percepción predominantemente %s por parte de la población "
                        + "estudiantil.", labels.get(idxMax).toLowerCase(Locale.ROOT)));
        return sb.toString();
    }

    private String recomendacion(DocenteGraficasResponse g, DocenteReporteResponse r) {
        double p = nullSafe(g.getPromedioGeneral()); // escala 0-5
        StringBuilder sb = new StringBuilder("RECOMENDACIÓN. ");
        if (p >= 4.17) {   // equivale a 3.5 en escala 1-4
            sb.append("Se sugiere dar continuidad a las estrategias pedagógicas implementadas, toda "
                    + "vez que la percepción estudiantil evidencia un desempeño consistentemente alto. "
                    + "Asimismo, se considera pertinente socializar dichas buenas prácticas con los "
                    + "demás docentes del programa académico.");
        } else if (p >= 3.33) {  // equivale a 3.0 en escala 1-4
            sb.append("Se evidencia un desempeño sólido con margen de mejora. Se recomienda reforzar "
                    + "los aspectos menos valorados por la población estudiantil, conservando las "
                    + "fortalezas que esta reconoce en su práctica pedagógica.");
        } else if (p >= 2.5) {
            sb.append("Se recomienda implementar un plan de acompañamiento pedagógico orientado a las "
                    + "categorías con menor puntaje, con seguimiento durante el próximo período de "
                    + "evaluación institucional.");
        } else {
            sb.append("Se recomienda una intervención prioritaria que incluya acompañamiento "
                    + "didáctico, revisión de la metodología de enseñanza empleada y una nueva "
                    + "medición en el corto plazo.");
        }
        if (r != null && r.getEvaluaciones() != null) {
            long negativos = r.getEvaluaciones().stream()
                    .flatMap(e -> e.getComentarios() == null
                            ? java.util.stream.Stream.empty() : e.getComentarios().stream())
                    .filter(c -> "NEGATIVO".equalsIgnoreCase(c.getSentimiento()))
                    .count();
            if (negativos > 0) {
                sb.append(String.format(Locale.ROOT,
                        " Adicionalmente, se identifican %d comentarios con valoración negativa "
                                + "que conviene revisar de manera detallada.", negativos));
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
