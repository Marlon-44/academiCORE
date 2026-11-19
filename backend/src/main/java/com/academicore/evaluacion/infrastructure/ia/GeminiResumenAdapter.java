package com.academicore.evaluacion.infrastructure.ia;

import com.academicore.evaluacion.application.dto.DocenteGraficasResponse;
import com.academicore.evaluacion.application.dto.DocenteReporteResponse;
import com.academicore.evaluacion.domain.repository.ResumenDocentePort;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

import java.util.List;
import java.util.Map;

/**
 * Resumen con Google Gemini (free tier de AI Studio: ~1500 req/dia gratis,
 * no requiere tarjeta). Solo activo si GEMINI_API_KEY esta definida;
 * si falla o no hay key, el caller cae al template local.
 */
@Component
public class GeminiResumenAdapter implements ResumenDocentePort {

    private static final Logger log = LoggerFactory.getLogger(GeminiResumenAdapter.class);

    private final RestClient restClient;
    private final String apiKey;
    private final String model;

    public GeminiResumenAdapter(
            @Value("${gemini.api-key:}") String apiKey,
            @Value("${gemini.model:gemini-2.0-flash}") String model,
            @Value("${gemini.base-url:https://generativelanguage.googleapis.com/v1beta}") String baseUrl) {
        this.apiKey = apiKey == null ? "" : apiKey.trim();
        this.model = model;
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(5000);
        factory.setReadTimeout(20000);
        this.restClient = RestClient.builder()
                .baseUrl(baseUrl)
                .requestFactory(factory)
                .build();
    }

    public boolean habilitado() {
        return !apiKey.isBlank();
    }

    @Override
    public String generar(DocenteGraficasResponse g, DocenteReporteResponse r) {
        if (!habilitado()) {
            return null;
        }
        try {
            Map<String, Object> body = Map.of(
                    "contents", List.of(Map.of("parts", List.of(Map.of("text", prompt(g, r))))),
                    "generationConfig", Map.of("temperature", 0.4, "maxOutputTokens", 700));
            @SuppressWarnings("unchecked")
            Map<String, Object> resp = restClient.post()
                    .uri("/models/{m}:generateContent", model)
                    .header("x-goog-api-key", apiKey)
                    .body(body)
                    .retrieve()
                    .body(Map.class);
            String texto = extraer(resp);
            return texto == null || texto.isBlank() ? null : texto;
        } catch (Exception e) {
            log.warn("Gemini fallo ({}): se usara el resumen local", e.getMessage());
            return null;
        }
    }

    @Override
    public String nombre() {
        return "GEMINI_" + model.toUpperCase().replace('-', '_');
    }

    @SuppressWarnings("unchecked")
    private String extraer(Map<String, Object> resp) {
        if (resp == null) return null;
        List<Map<String, Object>> candidates = (List<Map<String, Object>>) resp.get("candidates");
        if (candidates == null || candidates.isEmpty()) return null;
        Map<String, Object> content = (Map<String, Object>) candidates.get(0).get("content");
        if (content == null) return null;
        List<Map<String, Object>> parts = (List<Map<String, Object>>) content.get("parts");
        if (parts == null || parts.isEmpty()) return null;
        return (String) parts.get(0).get("text");
    }

    private String prompt(DocenteGraficasResponse g, DocenteReporteResponse r) {
        StringBuilder sb = new StringBuilder();
        sb.append("Eres un analista academico. Redacta en espanol un resumen ejecutivo del reporte de ")
          .append("evaluacion docente (percepcion estudiantil, escala Likert 1-4) del docente ")
          .append(g.getDocenteNombre()).append(".\n")
          .append("Estructura exacta, cada seccion en un parrafo iniciando con su titulo en mayusculas:\n")
          .append("PANORAMA GENERAL, FORTALEZAS, AREAS DE MEJORA, SENTIMIENTO EN LOS COMENTARIOS, ")
          .append("RECOMENDACION.\n")
          .append("Datos: promedio general ").append(String.format("%.2f", g.getPromedioGeneral() == null ? 0 : g.getPromedioGeneral()))
          .append("/4, valoracion ").append(g.getValoracion()).append(", ")
          .append(g.getTotalEncuestas()).append(" encuestas.\n");
        if (g.getRadarCategorias() != null) {
            sb.append("Promedio por categoria: ").append(union(g.getRadarCategorias().getLabels(),
                    g.getRadarCategorias().getValores())).append(".\n");
        }
        if (g.getFortalezas() != null && !g.getFortalezas().isEmpty()) {
            sb.append("Items mejor valorados: ");
            g.getFortalezas().stream().limit(3).forEach(p ->
                    sb.append(p.getTexto()).append(" (").append(String.format("%.1f", p.getPromedio())).append("); "));
            sb.append("\n");
        }
        if (g.getOportunidades() != null && !g.getOportunidades().isEmpty()) {
            sb.append("Items con menor puntaje: ");
            g.getOportunidades().stream().limit(3).forEach(p ->
                    sb.append(p.getTexto()).append(" (").append(String.format("%.1f", p.getPromedio())).append("); "));
            sb.append("\n");
        }
        if (g.getSentimientos() != null) {
            sb.append("Distribucion de sentimiento: ").append(union(g.getSentimientos().getLabels(),
                    g.getSentimientos().getValores())).append(".\n");
        }
        if (r != null && r.getEvaluaciones() != null) {
            List<String> comentarios = r.getEvaluaciones().stream()
                    .flatMap(e -> e.getComentarios() == null ? java.util.stream.Stream.empty() : e.getComentarios().stream())
                    .map(DocenteReporteResponse.ComentarioItem::getTexto)
                    .filter(t -> t != null && !t.isBlank())
                    .limit(8).toList();
            if (!comentarios.isEmpty()) {
                sb.append("Comentarios representativos: ").append(String.join(" | ", comentarios)).append(".\n");
            }
        }
        sb.append("Maximo 260 palabras, tono profesional y constructivo, sin encabezados de markdown.");
        return sb.toString();
    }

    private String union(List<String> labels, List<Double> valores) {
        StringBuilder sb = new StringBuilder();
        if (labels == null || valores == null) return "";
        for (int i = 0; i < Math.min(labels.size(), valores.size()); i++) {
            if (i > 0) sb.append(", ");
            sb.append(labels.get(i)).append(" ").append(String.format("%.2f", valores.get(i)));
        }
        return sb.toString();
    }
}
