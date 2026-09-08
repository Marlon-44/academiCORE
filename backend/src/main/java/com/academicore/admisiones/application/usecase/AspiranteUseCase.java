package com.academicore.admisiones.application.usecase;

import com.academicore.admisiones.application.dto.AspiranteResponse;
import com.academicore.admisiones.application.dto.CrearAspiranteRequest;
import com.academicore.admisiones.domain.model.Aspirante;
import com.academicore.admisiones.domain.model.EstadoAspirante;
import com.academicore.admisiones.domain.repository.AspiranteRepository;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AspiranteUseCase {

    private final AspiranteRepository repository;

    @Transactional
    public AspiranteResponse crear(CrearAspiranteRequest request) {
        if (repository.existsByTipoDocumentoAndNumeroDocumento(
                request.getTipoDocumento(), request.getNumeroDocumento())) {
            throw new ConflictException("Ya existe un aspirante con documento: "
                    + request.getTipoDocumento() + " " + request.getNumeroDocumento());
        }

        Aspirante aspirante = Aspirante.builder()
                .tipoDocumento(request.getTipoDocumento())
                .numeroDocumento(request.getNumeroDocumento())
                .nombres(request.getNombres())
                .apellidos(request.getApellidos())
                .email(request.getEmail())
                .telefono(request.getTelefono())
                .fechaNacimiento(request.getFechaNacimiento())
                .estado(EstadoAspirante.REGISTRADO)
                .build();

        return toResponse(repository.save(aspirante));
    }

    @Transactional(readOnly = true)
    public AspiranteResponse consultarPorId(Long id) {
        Aspirante a = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Aspirante", "id", id));
        return toResponse(a);
    }

    public AspiranteResponse toResponse(Aspirante a) {
        return AspiranteResponse.builder()
                .id(a.getId())
                .tipoDocumento(a.getTipoDocumento())
                .numeroDocumento(a.getNumeroDocumento())
                .nombres(a.getNombres())
                .apellidos(a.getApellidos())
                .email(a.getEmail())
                .estado(a.getEstado() != null ? a.getEstado().name() : null)
                .build();
    }
}
