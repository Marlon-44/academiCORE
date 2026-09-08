package com.academicore.admisiones.infrastructure.persistence.repository;

import com.academicore.admisiones.infrastructure.persistence.entity.DocumentoAspiranteEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DocumentoAspiranteJpaRepository extends JpaRepository<DocumentoAspiranteEntity, Long> {

    List<DocumentoAspiranteEntity> findByInscripcionId(Long inscripcionId);
}
