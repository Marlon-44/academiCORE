package com.academicore.campus.application.usecase;

import com.academicore.campus.application.dto.CampusResponse;
import com.academicore.campus.application.dto.CrearCampusRequest;
import com.academicore.campus.domain.model.Campus;
import com.academicore.campus.domain.model.EstadoCampus;
import com.academicore.campus.domain.repository.CampusRepository;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CampusUseCase {

    private final CampusRepository campusRepository;

    @Transactional
    public CampusResponse crear(CrearCampusRequest request) {
        if (campusRepository.existsByCodigo(request.getCodigo())) {
            throw new ConflictException("Ya existe un campus con código: " + request.getCodigo());
        }

        Campus campus = Campus.builder()
                .universidadId(request.getUniversidadId())
                .codigo(request.getCodigo())
                .nombre(request.getNombre())
                .direccion(request.getDireccion())
                .ciudad(request.getCiudad() != null ? request.getCiudad() : "Cartagena")
                .descripcion(request.getDescripcion())
                .estado(EstadoCampus.ACTIVO)
                .build();

        Campus saved = campusRepository.save(campus);
        return toResponse(saved);
    }

    @Transactional(readOnly = true)
    public CampusResponse consultarPorCodigo(String codigo) {
        Campus campus = campusRepository.findByCodigo(codigo)
                .orElseThrow(() -> new NotFoundException("Campus", "codigo", codigo));
        return toResponse(campus);
    }

    @Transactional(readOnly = true)
    public List<CampusResponse> listar(String estado) {
        if (estado != null) {
            return campusRepository.findByEstado(EstadoCampus.valueOf(estado.toUpperCase()))
                    .stream().map(this::toResponse).toList();
        }
        return campusRepository.findAll().stream().map(this::toResponse).toList();
    }

    @Transactional
    public CampusResponse cambiarEstado(Long id, String nuevoEstado) {
        Campus campus = campusRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Campus", "id", id));
        campus.setEstado(EstadoCampus.valueOf(nuevoEstado.toUpperCase()));
        Campus saved = campusRepository.save(campus);
        return toResponse(saved);
    }

    public CampusResponse toResponse(Campus c) {
        return CampusResponse.builder()
                .id(c.getId())
                .codigo(c.getCodigo())
                .nombre(c.getNombre())
                .direccion(c.getDireccion())
                .ciudad(c.getCiudad())
                .descripcion(c.getDescripcion())
                .estado(c.getEstado() != null ? c.getEstado().name() : null)
                .esSedePrincipal(c.isEsSedePrincipal())
                .orden(c.getOrden())
                .urlMapa(c.getUrlMapa())
                .build();
    }
}
