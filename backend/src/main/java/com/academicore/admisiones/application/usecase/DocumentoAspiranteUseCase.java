package com.academicore.admisiones.application.usecase;

import com.academicore.admisiones.application.dto.DocumentoAspiranteResponse;
import com.academicore.admisiones.application.dto.RegistrarDocumentoRequest;
import com.academicore.admisiones.domain.model.DocumentoAspirante;
import com.academicore.admisiones.domain.repository.DocumentoAspiranteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DocumentoAspiranteUseCase {

    private final DocumentoAspiranteRepository repository;

    @Transactional
    public DocumentoAspiranteResponse registrar(Long inscripcionId, RegistrarDocumentoRequest request) {
        DocumentoAspirante doc = DocumentoAspirante.builder()
                .inscripcionId(inscripcionId)
                .tipoDocumento(request.getTipoDocumento())
                .url(request.getUrl())
                .estado("CARGADO")
                .build();

        DocumentoAspirante saved = repository.save(doc);
        return toResponse(saved);
    }

    @Transactional(readOnly = true)
    public List<DocumentoAspiranteResponse> listarPorInscripcion(Long inscripcionId) {
        return repository.findByInscripcionId(inscripcionId).stream().map(this::toResponse).toList();
    }

    private DocumentoAspiranteResponse toResponse(DocumentoAspirante d) {
        return DocumentoAspiranteResponse.builder()
                .id(d.getId())
                .inscripcionId(d.getInscripcionId())
                .tipoDocumento(d.getTipoDocumento())
                .estado(d.getEstado())
                .fechaCarga(d.getFechaCarga())
                .build();
    }
}
