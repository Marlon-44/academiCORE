package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.CrearDepartamentoRequest;
import com.academicore.pensum.application.dto.DepartamentoResponse;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.DepartamentoAcademico;
import com.academicore.pensum.domain.model.EstadoDepartamento;
import com.academicore.pensum.domain.model.EstadoFacultad;
import com.academicore.pensum.domain.model.Facultad;
import com.academicore.pensum.domain.repository.DepartamentoAcademicoRepository;
import com.academicore.pensum.domain.repository.FacultadRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CrearDepartamentoAcademicoUseCase {

    private final DepartamentoAcademicoRepository departamentoRepository;
    private final FacultadRepository facultadRepository;

    @Transactional
    public DepartamentoResponse execute(CrearDepartamentoRequest request) {
        Facultad facultad = facultadRepository.findById(request.getFacultadId())
                .orElseThrow(() -> new NotFoundException("Facultad", "id", request.getFacultadId()));

        if (facultad.getEstado() != EstadoFacultad.ACTIVA) {
            throw new ConflictException("La facultad no está ACTIVA");
        }

        if (departamentoRepository.existsByFacultadIdAndCodigo(request.getFacultadId(), request.getCodigo())) {
            throw new ConflictException("Ya existe un departamento con código: " + request.getCodigo()
                    + " en la facultad: " + request.getFacultadId());
        }

        if (departamentoRepository.existsByFacultadIdAndNombre(request.getFacultadId(), request.getNombre())) {
            throw new ConflictException("Ya existe un departamento con nombre: " + request.getNombre()
                    + " en la facultad: " + request.getFacultadId());
        }

        DepartamentoAcademico departamento = DepartamentoAcademico.builder()
                .facultadId(request.getFacultadId())
                .codigo(request.getCodigo())
                .nombre(request.getNombre())
                .estado(EstadoDepartamento.ACTIVO)
                .build();

        DepartamentoAcademico saved = departamentoRepository.save(departamento);

        return DepartamentoResponse.builder()
                .id(saved.getId())
                .facultadId(saved.getFacultadId())
                .codigo(saved.getCodigo())
                .nombre(saved.getNombre())
                .estado(saved.getEstado().name())
                .build();
    }
}
