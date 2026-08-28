package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.CrearFacultadRequest;
import com.academicore.pensum.application.dto.FacultadResponse;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.EstadoFacultad;
import com.academicore.pensum.domain.model.EstadoUniversidad;
import com.academicore.pensum.domain.model.Facultad;
import com.academicore.pensum.domain.model.Universidad;
import com.academicore.pensum.domain.repository.FacultadRepository;
import com.academicore.pensum.domain.repository.UniversidadRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Service
@RequiredArgsConstructor
public class CrearFacultadUseCase {

    private final FacultadRepository facultadRepository;
    private final UniversidadRepository universidadRepository;

    @Transactional
    public FacultadResponse execute(CrearFacultadRequest request) {
        Universidad universidad = universidadRepository.findById(request.getUniversidadId())
                .orElseThrow(() -> new NotFoundException("Universidad", "id", request.getUniversidadId()));

        if (universidad.getEstado() != EstadoUniversidad.ACTIVA) {
            throw new ConflictException("La universidad no está ACTIVA");
        }

        if (facultadRepository.existsByUniversidadIdAndCodigo(request.getUniversidadId(), request.getCodigo())) {
            throw new ConflictException("Ya existe una facultad con código: " + request.getCodigo()
                    + " en la universidad: " + request.getUniversidadId());
        }

        if (facultadRepository.existsByUniversidadIdAndNombre(request.getUniversidadId(), request.getNombre())) {
            throw new ConflictException("Ya existe una facultad con nombre: " + request.getNombre()
                    + " en la universidad: " + request.getUniversidadId());
        }

        Facultad facultad = Facultad.builder()
                .universidadId(request.getUniversidadId())
                .codigo(request.getCodigo())
                .nombre(request.getNombre())
                .fechaCreacion(LocalDate.now())
                .estado(EstadoFacultad.ACTIVA)
                .build();

        Facultad saved = facultadRepository.save(facultad);

        return FacultadResponse.builder()
                .id(saved.getId())
                .universidadId(saved.getUniversidadId())
                .codigo(saved.getCodigo())
                .nombre(saved.getNombre())
                .fechaCreacion(saved.getFechaCreacion())
                .estado(saved.getEstado().name())
                .build();
    }
}
