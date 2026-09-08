package com.academicore.admisiones.domain.repository;

import com.academicore.admisiones.domain.model.DocumentoAspirante;

import java.util.List;

public interface DocumentoAspiranteRepository {

    DocumentoAspirante save(DocumentoAspirante documento);

    List<DocumentoAspirante> findByInscripcionId(Long inscripcionId);
}
