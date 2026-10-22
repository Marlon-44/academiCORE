package com.academicore.evaluacion.infrastructure.sentiment;

import com.academicore.evaluacion.domain.repository.SentimentAnalysisPort;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;

import java.util.Map;

/**
 * Llama al microservicio Python (sentiment-analysis-spanish).
 * Si el servicio no responde, clasifica con el lexicón local
 * para no bloquear el registro de la encuesta.
 */
@Slf4j
@Component
public class SentimentAnalysisHttpAdapter implements SentimentAnalysisPort {

    private final RestClient restClient;

    public SentimentAnalysisHttpAdapter(
            @Value("${sentimiento.service-url:http://localhost:5000}") String baseUrl) {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(3000);
        factory.setReadTimeout(5000);
        this.restClient = RestClient.builder()
                .baseUrl(baseUrl)
                .requestFactory(factory)
                .build();
    }

    @Override
    public SentimentResult analizar(String texto) {
        try {
            SentimientoApiResponse respuesta = restClient.post()
                    .uri("/sentimiento")
                    .body(Map.of("texto", texto))
                    .retrieve()
                    .body(SentimientoApiResponse.class);
            if (respuesta != null && respuesta.sentimiento() != null) {
                return new SentimentResult(respuesta.sentimiento(), respuesta.score(), "MODELO");
            }
            log.warn("Respuesta vacía del servicio de sentimiento, usando lexicón local");
        } catch (Exception e) {
            log.warn("Servicio de sentimiento no disponible ({}), usando lexicón local", e.getMessage());
        }
        LexicoSentimiento.Resultado fallback = LexicoSentimiento.clasificar(texto);
        return new SentimentResult(fallback.etiqueta(), fallback.score(), "LEXICO");
    }

    private record SentimientoApiResponse(String sentimiento, Double score) {
    }
}
