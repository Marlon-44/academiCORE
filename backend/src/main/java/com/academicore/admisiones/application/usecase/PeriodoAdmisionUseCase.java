package com.academicore.admisiones.application.usecase;

import com.academicore.admisiones.application.dto.CrearPeriodoAdmisionRequest;
import com.academicore.admisiones.application.dto.PeriodoAdmisionResponse;
import com.academicore.admisiones.domain.model.EstadoPeriodoAdmision;
import com.academicore.admisiones.domain.model.PeriodoAdmision;
import com.academicore.admisiones.domain.repository.PeriodoAdmisionRepository;
import com.academicore.pensum.domain.exception.BusinessException;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PeriodoAdmisionUseCase {

    private final PeriodoAdmisionRepository repository;

    @Transactional
    public PeriodoAdmisionResponse crear(CrearPeriodoAdmisionRequest request) {
        if (repository.existsByCodigo(request.getCodigo())) {
            throw new ConflictException("Ya existe un período de admisión con código: " + request.getCodigo());
        }
        if (request.getFechaFinInscripciones().isBefore(request.getFechaInicioInscripciones())) {
            throw new BusinessException("INVALID_DATES",
                    "La fecha fin de inscripciones debe ser posterior o igual a la fecha de inicio");
        }

        PeriodoAdmision periodo = PeriodoAdmision.builder()
                .codigo(request.getCodigo())
                .nombre(request.getNombre())
                .fechaInicioInscripciones(request.getFechaInicioInscripciones())
                .fechaFinInscripciones(request.getFechaFinInscripciones())
                .fechaInicioClases(request.getFechaInicioClases())
                .estado(EstadoPeriodoAdmision.PROGRAMADO)
                .build();

        return toResponse(repository.save(periodo));
    }

    @Transactional
    public PeriodoAdmisionResponse cambiarEstado(Long id, String nuevoEstado) {
        PeriodoAdmision periodo = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Período de admisión", "id", id));
        periodo.setEstado(EstadoPeriodoAdmision.valueOf(nuevoEstado.toUpperCase()));
        return toResponse(repository.save(periodo));
    }

    @Transactional(readOnly = true)
    public List<PeriodoAdmisionResponse> listar(String estado) {
        if (estado != null) {
            return repository.findByEstado(EstadoPeriodoAdmision.valueOf(estado.toUpperCase()))
                    .stream().map(this::toResponse).toList();
        }
        return repository.findAll().stream().map(this::toResponse).toList();
    }

    public PeriodoAdmisionResponse toResponse(PeriodoAdmision p) {
        return PeriodoAdmisionResponse.builder()
                .id(p.getId())
                .codigo(p.getCodigo())
                .nombre(p.getNombre())
                .estado(p.getEstado() != null ? p.getEstado().name() : null)
                .fechaInicioInscripciones(p.getFechaInicioInscripciones())
                .fechaFinInscripciones(p.getFechaFinInscripciones())
                .fechaInicioClases(p.getFechaInicioClases())
                .build();
    }
}
