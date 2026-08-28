package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.CrearProgramaRequest;
import com.academicore.pensum.application.dto.ProgramaResponse;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.EstadoFacultad;
import com.academicore.pensum.domain.model.EstadoPrograma;
import com.academicore.pensum.domain.model.Facultad;
import com.academicore.pensum.domain.model.ProgramaAcademico;
import com.academicore.pensum.domain.repository.FacultadRepository;
import com.academicore.pensum.domain.repository.ProgramaAcademicoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

@Service
@RequiredArgsConstructor
public class CrearProgramaAcademicoUseCase {

    private final ProgramaAcademicoRepository programaRepository;
    private final FacultadRepository facultadRepository;

    @Transactional
    public ProgramaResponse execute(CrearProgramaRequest request) {
        Facultad facultad = facultadRepository.findById(request.getFacultadId())
                .orElseThrow(() -> new NotFoundException("Facultad", "id", request.getFacultadId()));

        if (facultad.getEstado() != EstadoFacultad.ACTIVA) {
            throw new ConflictException("La facultad no está ACTIVA");
        }

        if (programaRepository.existsByFacultadIdAndCodigoInterno(request.getFacultadId(), request.getCodigoInterno())) {
            throw new ConflictException("Ya existe un programa con código interno: " + request.getCodigoInterno()
                    + " en la facultad: " + request.getFacultadId());
        }

        if (request.getCodigoSnies() != null && !request.getCodigoSnies().isBlank()
                && programaRepository.existsByCodigoSnies(request.getCodigoSnies())) {
            throw new ConflictException("Ya existe un programa con código SNIES: " + request.getCodigoSnies());
        }

        ProgramaAcademico programa = ProgramaAcademico.builder()
                .facultadId(request.getFacultadId())
                .codigoInterno(request.getCodigoInterno())
                .codigoSnies(request.getCodigoSnies())
                .nombre(request.getNombre())
                .creditosTotales(request.getCreditosTotales())
                .estado(EstadoPrograma.EN_REGISTRO)
                .fechaCreacion(LocalDate.now())
                .build();

        ProgramaAcademico saved = programaRepository.save(programa);

        return ProgramaResponse.builder()
                .id(saved.getId())
                .facultadId(saved.getFacultadId())
                .codigoInterno(saved.getCodigoInterno())
                .codigoSnies(saved.getCodigoSnies())
                .nombre(saved.getNombre())
                .creditosTotales(saved.getCreditosTotales())
                .estado(saved.getEstado().name())
                .fechaCreacion(saved.getFechaCreacion())
                .build();
    }
}
