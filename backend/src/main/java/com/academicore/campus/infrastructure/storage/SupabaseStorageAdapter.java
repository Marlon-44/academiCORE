package com.academicore.campus.infrastructure.storage;

import com.academicore.campus.domain.repository.ImagenCampusStoragePort;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Slf4j
@Component
public class SupabaseStorageAdapter implements ImagenCampusStoragePort {

    @Value("${supabase.url:http://localhost:54321}")
    private String supabaseUrl;

    @Value("${supabase.service-key}")
    private String serviceKey;

    @Value("${supabase.storage.signed-url-expiry:300}")
    private int signedUrlExpiry;

    private final RestTemplate restTemplate = new RestTemplate();
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public UploadUrlResponse generarUrlSubida(String bucket, String rutaArchivo, String contentType) {
        String endpoint = supabaseUrl + "/storage/v1/object/upload/sign/" + bucket + "/" + rutaArchivo;

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(serviceKey);

        HttpEntity<String> entity = new HttpEntity<>("{}", headers);

        log.info("Solicitando signed upload URL a Supabase: bucket={}, ruta={}", bucket, rutaArchivo);

        ResponseEntity<String> response = restTemplate.exchange(
                endpoint, HttpMethod.POST, entity, String.class);

        try {
            JsonNode root = objectMapper.readTree(response.getBody());
            String signedPath = root.path("url").asText();

            String fullUploadUrl = supabaseUrl + "/storage/v1" + signedPath;
            String publicUrl = supabaseUrl + "/storage/v1/object/public/" + bucket + "/" + rutaArchivo;

            log.info("Signed URL generada para {}/{}", bucket, rutaArchivo);
            return new UploadUrlResponse(fullUploadUrl, publicUrl, signedUrlExpiry);
        } catch (Exception e) {
            log.error("Error parseando respuesta de Supabase Storage: {}", e.getMessage());
            throw new RuntimeException("Error generando URL firmada de Supabase", e);
        }
    }

    @Override
    public void eliminarImagen(String bucket, String rutaArchivo) {
        String endpoint = supabaseUrl + "/storage/v1/object/" + bucket + "/" + rutaArchivo;

        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(serviceKey);

        HttpEntity<Void> entity = new HttpEntity<>(headers);

        log.info("Eliminando archivo {}/{}", bucket, rutaArchivo);
        restTemplate.exchange(endpoint, HttpMethod.DELETE, entity, String.class);
    }
}
