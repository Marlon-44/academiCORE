package com.academicore.admisiones.application.usecase;

import com.academicore.admisiones.application.dto.CambiarEstadoOfertaRequest;
import com.academicore.admisiones.application.dto.CrearOfertaAdmisionRequest;
import com.academicore.admisiones.application.dto.OfertaAdmisionResponse;
import com.academicore.admisiones.domain.model.EstadoOfertaAdmision;
import com.academicore.admisiones.domain.model.OfertaAdmision;
import com.academicore.admisiones.domain.repository.OfertaAdmisionRepository;
import com.academicore.pensum.domain.exception.BusinessException;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.EstadoPensum;
import com.academicore.pensum.domain.repository.PlanEstudiosRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OfertaAdmisionUseCase {

    private final OfertaAdmisionRepository ofertaRepository;
    private final PlanEstudiosRepository planEstudiosRepository;

    @Transactional
    public OfertaAdmisionResponse crear(CrearOfertaAdmisionRequest request) {
        if (ofertaRepository.existsByPeriodoAdmisionIdAndProgramaIdAndCampusId(
                request.getPeriodoAdmisionId(), request.getProgramaId(), request.getCampusId())) {
            throw new ConflictException("Ya existe una oferta para este programa y campus en el período indicado");
        }

        var plan = planEstudiosRepository.findById(request.getPlanEstudiosId())
                .orElseThrow(() -> new NotFoundException("Plan de estudios", "id", request.getPlanEstudiosId()));

        if (plan.getEstado() != EstadoPensum.VIGENTE) {
            throw new BusinessException("INVALID_PENSUM_STATE",
                    "Solo se puede crear oferta sobre un plan de estudios VIGENTE. Estado actual: " + plan.getEstado());
        }

        OfertaAdmision oferta = OfertaAdmision.builder()
                .periodoAdmisionId(request.getPeriodoAdmisionId())
                .programaId(request.getProgramaId())
                .planEstudiosId(request.getPlanEstudiosId())
                .campusId(request.getCampusId())
                .cuposTotales(request.getCuposTotales())
                .cuposDisponibles(request.getCuposTotales())
                .valorInscripcion(request.getValorInscripcion())
                .monedaId(resolveMonedaId(request.getMonedaCodigo()))
                .estado(EstadoOfertaAdmision.ACTIVA)
                .build();

        return toResponse(ofertaRepository.save(oferta));
    }

    @Transactional(readOnly = true)
    public OfertaAdmisionResponse consultarPorId(Long id) {
        OfertaAdmision oferta = ofertaRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Oferta de admisión", "id", id));
        return toResponse(oferta);
    }

    @Transactional(readOnly = true)
    public List<OfertaAdmisionResponse> listar(Long periodoId, Long campusId) {
        List<OfertaAdmision> ofertas;
        if (campusId != null) {
            ofertas = ofertaRepository.findByPeriodoAdmisionIdAndCampusId(periodoId, campusId);
        } else {
            ofertas = ofertaRepository.findByPeriodoAdmisionId(periodoId);
        }
        return ofertas.stream().map(this::toResponse).toList();
    }

    @Transactional
    public OfertaAdmisionResponse cambiarEstado(Long id, CambiarEstadoOfertaRequest request) {
        OfertaAdmision oferta = ofertaRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Oferta de admisión", "id", id));
        oferta.setEstado(EstadoOfertaAdmision.valueOf(request.getEstado().toUpperCase()));
        return toResponse(ofertaRepository.save(oferta));
    }

    private Long resolveMonedaId(String codigoIso) {
        return switch (codigoIso.toUpperCase()) {
            case "COP" -> 1L;
            case "USD" -> 2L;
            default -> throw new BusinessException("INVALID_CURRENCY", "Moneda no soportada: " + codigoIso);
        };
    }

    public OfertaAdmisionResponse toResponse(OfertaAdmision o) {
        return OfertaAdmisionResponse.builder()
                .id(o.getId())
                .periodoAdmisionId(o.getPeriodoAdmisionId())
                .programaId(o.getProgramaId())
                .planEstudiosId(o.getPlanEstudiosId())
                .campusId(o.getCampusId())
                .cuposTotales(o.getCuposTotales())
                .cuposDisponibles(o.getCuposDisponibles())
                .valorInscripcion(o.getValorInscripcion())
                .monedaCodigo(o.getMonedaId() != null ? (o.getMonedaId() == 1L ? "COP" : "USD") : null)
                .estado(o.getEstado() != null ? o.getEstado().name() : null)
                .build();
    }
}
