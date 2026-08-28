package com.academicore.pensum.application.usecase;

import com.academicore.pensum.application.dto.AsignaturaResponse;
import com.academicore.pensum.application.dto.RegistrarAsignaturaRequest;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.Asignatura;
import com.academicore.pensum.domain.model.DepartamentoAcademico;
import com.academicore.pensum.domain.model.EstadoAsignatura;
import com.academicore.pensum.domain.model.EstadoDepartamento;
import com.academicore.pensum.domain.repository.AsignaturaRepository;
import com.academicore.pensum.domain.repository.DepartamentoAcademicoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Collections;

@Service
@RequiredArgsConstructor
public class RegistrarAsignaturaUseCase {

    private final AsignaturaRepository asignaturaRepository;
    private final DepartamentoAcademicoRepository departamentoRepository;

    @Transactional
    public AsignaturaResponse execute(RegistrarAsignaturaRequest request) {
        DepartamentoAcademico departamento = departamentoRepository.findById(request.getDepartamentoId())
                .orElseThrow(() -> new NotFoundException("Departamento", "id", request.getDepartamentoId()));

        if (departamento.getEstado() != EstadoDepartamento.ACTIVO) {
            throw new ConflictException("El departamento no está ACTIVO");
        }

        if (asignaturaRepository.existsByDepartamentoIdAndCodigo(request.getDepartamentoId(), request.getCodigo())) {
            throw new ConflictException("Ya existe una asignatura con código: " + request.getCodigo()
                    + " en el departamento: " + request.getDepartamentoId());
        }

        Asignatura asignatura = Asignatura.builder()
                .departamentoId(request.getDepartamentoId())
                .codigo(request.getCodigo())
                .nombre(request.getNombre())
                .descripcion(request.getDescripcion())
                .estado(EstadoAsignatura.ACTIVA)
                .fechaCreacion(LocalDate.now())
                .build();

        Asignatura saved = asignaturaRepository.save(asignatura);

        return AsignaturaResponse.builder()
                .id(saved.getId())
                .departamentoId(saved.getDepartamentoId())
                .codigo(saved.getCodigo())
                .nombre(saved.getNombre())
                .descripcion(saved.getDescripcion())
                .estado(saved.getEstado().name())
                .fechaCreacion(saved.getFechaCreacion())
                .naturalezas(Collections.emptyList())
                .build();
    }
}
