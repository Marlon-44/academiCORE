package com.academicore.admisiones.infrastructure.persistence.adapter;

import com.academicore.admisiones.domain.model.DocumentoAspirante;
import com.academicore.admisiones.domain.repository.DocumentoAspiranteRepository;
import com.academicore.admisiones.infrastructure.persistence.mapper.AdmisionesMapper;
import com.academicore.admisiones.infrastructure.persistence.repository.DocumentoAspiranteJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class DocumentoAspiranteRepositoryAdapter implements DocumentoAspiranteRepository {

    private final DocumentoAspiranteJpaRepository jpaRepository;

    @Override
    public DocumentoAspirante save(DocumentoAspirante documento) {
        return AdmisionesMapper.toDomain(jpaRepository.save(AdmisionesMapper.toEntity(documento)));
    }

    @Override
    public List<DocumentoAspirante> findByInscripcionId(Long inscripcionId) {
        return jpaRepository.findByInscripcionId(inscripcionId).stream().map(AdmisionesMapper::toDomain).toList();
    }
}
