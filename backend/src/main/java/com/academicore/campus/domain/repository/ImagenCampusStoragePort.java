package com.academicore.campus.domain.repository;

public interface ImagenCampusStoragePort {

    UploadUrlResponse generarUrlSubida(String bucket, String rutaArchivo, String contentType);

    void eliminarImagen(String bucket, String rutaArchivo);

    record UploadUrlResponse(String urlSubida, String urlPublicaResultante, int expiraEn) {}
}
