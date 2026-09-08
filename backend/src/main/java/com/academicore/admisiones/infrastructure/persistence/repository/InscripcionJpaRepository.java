package com.academicore.admisiones.infrastructure.persistence.repository;

import com.academicore.admisiones.infrastructure.persistence.entity.InscripcionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InscripcionJpaRepository extends JpaRepository<InscripcionEntity, Long> {

    List<InscripcionEntity> findByAspiranteId(Long aspiranteId);

    boolean existsByAspiranteIdAndOfertaAdmisionId(Long aspiranteId, Long ofertaAdmisionId);
}
