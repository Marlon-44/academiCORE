package com.academicore.evaluacion.application.usecase;

import com.academicore.evaluacion.application.dto.CrearDocenteRequest;
import com.academicore.evaluacion.application.dto.DocenteResponse;
import com.academicore.evaluacion.domain.model.Docente;
import com.academicore.evaluacion.domain.model.EstadoDocente;
import com.academicore.evaluacion.domain.repository.CatalogoAcademicoPort;
import com.academicore.evaluacion.domain.repository.DocenteRepository;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DocenteUseCase {

    private final DocenteRepository docenteRepository;
    private final CatalogoAcademicoPort catalogoAcademico;

    @Transactional
    public DocenteResponse crear(CrearDocenteRequest request) {
        if (docenteRepository.existsByNumeroDocumento(request.getNumeroDocumento())) {
            throw new ConflictException("Ya existe un docente con documento: " + request.getNumeroDocumento());
        }

        Docente docente = Docente.builder()
                .numeroDocumento(request.getNumeroDocumento())
                .sexo(request.getSexo())
                .nombres(request.getNombres())
                .apellidos(request.getApellidos())
                .email(request.getEmail())
                .telefono(request.getTelefono())
                .direccion(request.getDireccion())
                .tipoVinculacion(request.getTipoVinculacion())
                .escalafon(request.getEscalafon())
                .nivelFormacion(request.getNivelFormacion())
                .departamentoId(request.getDepartamentoId())
                .fechaIngreso(request.getFechaIngreso())
                .estado(EstadoDocente.ACTIVO)
                .build();

        return toResponse(docenteRepository.save(docente));
    }

    @Transactional(readOnly = true)
    public DocenteResponse consultar(Long id) {
        Docente docente = docenteRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Docente", "id", id));
        return toResponse(docente);
    }

    @Transactional(readOnly = true)
    public List<DocenteResponse> listar(String estado) {
        if (estado != null) {
            return docenteRepository.findByEstado(EstadoDocente.valueOf(estado.toUpperCase()).name())
                    .stream().map(this::toResponse).toList();
        }
        return docenteRepository.findAll().stream().map(this::toResponse).toList();
    }

    @Transactional
    public DocenteResponse cambiarEstado(Long id, String nuevoEstado) {
        Docente docente = docenteRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Docente", "id", id));
        docente.setEstado(EstadoDocente.valueOf(nuevoEstado.toUpperCase()));
        return toResponse(docenteRepository.save(docente));
    }

    public DocenteResponse toResponse(Docente d) {
        CatalogoAcademicoPort.DepartamentoInfo departamento =
                catalogoAcademico.findDepartamentoById(d.getDepartamentoId()).orElse(null);
        return DocenteResponse.builder()
                .id(d.getId())
                .numeroDocumento(d.getNumeroDocumento())
                .sexo(d.getSexo())
                .nombres(d.getNombres())
                .apellidos(d.getApellidos())
                .nombreCompleto(d.getNombreCompleto())
                .email(d.getEmail())
                .telefono(d.getTelefono())
                .direccion(d.getDireccion())
                .tipoVinculacion(d.getTipoVinculacion())
                .escalafon(d.getEscalafon())
                .nivelFormacion(d.getNivelFormacion())
                .departamentoId(d.getDepartamentoId())
                .departamentoCodigo(departamento != null ? departamento.codigo() : null)
                .departamentoNombre(departamento != null ? departamento.nombre() : null)
                .fechaIngreso(d.getFechaIngreso())
                .estado(d.getEstado() != null ? d.getEstado().name() : null)
                .build();
    }
}
