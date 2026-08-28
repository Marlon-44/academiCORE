package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.CrearUniversidadRequest;
import com.academicore.pensum.application.dto.UniversidadResponse;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.model.EstadoUniversidad;
import com.academicore.pensum.domain.model.Universidad;
import com.academicore.pensum.domain.repository.UniversidadRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Service
@RequiredArgsConstructor
public class CrearUniversidadUseCase {

    private final UniversidadRepository universidadRepository;

    @Transactional
    public UniversidadResponse execute(CrearUniversidadRequest request) {
        if (universidadRepository.existsByCodigo(request.getCodigo())) {
            throw new ConflictException("Ya existe una universidad con código: " + request.getCodigo());
        }

        Universidad universidad = Universidad.builder()
                .codigo(request.getCodigo())
                .nombre(request.getNombre())
                .fechaCreacion(LocalDate.now())
                .estado(EstadoUniversidad.ACTIVA)
                .build();

        Universidad saved = universidadRepository.save(universidad);

        return UniversidadResponse.builder()
                .id(saved.getId())
                .codigo(saved.getCodigo())
                .nombre(saved.getNombre())
                .fechaCreacion(saved.getFechaCreacion())
                .estado(saved.getEstado().name())
                .build();
    }
}
