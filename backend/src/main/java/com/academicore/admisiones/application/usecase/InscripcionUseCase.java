package com.academicore.admisiones.application.usecase;

import com.academicore.admisiones.application.dto.CambiarEstadoInscripcionRequest;
import com.academicore.admisiones.application.dto.CrearInscripcionRequest;
import com.academicore.admisiones.application.dto.FacturaResumidaResponse;
import com.academicore.admisiones.application.dto.InscripcionResponse;
import com.academicore.admisiones.domain.model.Aspirante;
import com.academicore.admisiones.domain.model.EstadoInscripcion;
import com.academicore.admisiones.domain.model.Inscripcion;
import com.academicore.admisiones.domain.model.OfertaAdmision;
import com.academicore.admisiones.domain.repository.AspiranteRepository;
import com.academicore.admisiones.domain.repository.InscripcionRepository;
import com.academicore.admisiones.domain.repository.OfertaAdmisionRepository;
import com.academicore.pagos.application.dto.FacturaResponse;
import com.academicore.pagos.application.usecase.FacturaUseCase;
import com.academicore.pagos.domain.model.Factura;
import com.academicore.pensum.domain.exception.BusinessException;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InscripcionUseCase {

    private final InscripcionRepository inscripcionRepository;
    private final AspiranteRepository aspiranteRepository;
    private final OfertaAdmisionRepository ofertaRepository;
    private final FacturaUseCase facturaUseCase;

    @Transactional
    public InscripcionResponse crear(CrearInscripcionRequest request) {
        Aspirante aspirante = aspiranteRepository.findById(request.getAspiranteId())
                .orElseThrow(() -> new NotFoundException("Aspirante", "id", request.getAspiranteId()));

        OfertaAdmision oferta = ofertaRepository.findById(request.getOfertaAdmisionId())
                .orElseThrow(() -> new NotFoundException("Oferta de admisión", "id", request.getOfertaAdmisionId()));

        if (inscripcionRepository.existsByAspiranteIdAndOfertaAdmisionId(
                request.getAspiranteId(), request.getOfertaAdmisionId())) {
            throw new ConflictException("El aspirante ya tiene una inscripción a esta oferta");
        }

        if (!"ACTIVA".equals(oferta.getEstado().name())) {
            throw new BusinessException("OFFER_CLOSED",
                    "La oferta no está activa. Estado actual: " + oferta.getEstado());
        }

        Inscripcion inscripcion = Inscripcion.builder()
                .aspiranteId(request.getAspiranteId())
                .ofertaAdmisionId(request.getOfertaAdmisionId())
                .estado(EstadoInscripcion.PENDIENTE_PAGO)
                .build();

        Inscripcion saved = inscripcionRepository.save(inscripcion);

        Factura factura = facturaUseCase.generarFacturaInscripcion(
                saved.getId(), oferta.getValorInscripcion(), oferta.getMonedaId());

        return toResponse(saved, aspirante, factura);
    }

    @Transactional(readOnly = true)
    public InscripcionResponse consultarPorId(Long id) {
        Inscripcion insc = inscripcionRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Inscripción", "id", id));
        Aspirante asp = aspiranteRepository.findById(insc.getAspiranteId()).orElse(null);
        FacturaResponse facturaResp = null;
        try {
            facturaResp = facturaUseCase.consultarPorInscripcion(id);
        } catch (NotFoundException ignored) {}
        return toResponseFromDto(insc, asp, facturaResp);
    }

    @Transactional(readOnly = true)
    public List<InscripcionResponse> listarPorAspirante(Long aspiranteId) {
        return inscripcionRepository.findByAspiranteId(aspiranteId).stream()
                .map(i -> {
                    Aspirante a = aspiranteRepository.findById(i.getAspiranteId()).orElse(null);
                    return toResponse(i, a, null);
                })
                .toList();
    }

    @Transactional
    public InscripcionResponse cambiarEstado(Long id, CambiarEstadoInscripcionRequest request) {
        Inscripcion insc = inscripcionRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Inscripción", "id", id));

        EstadoInscripcion nuevoEstado = EstadoInscripcion.valueOf(request.getEstado().toUpperCase());

        if (nuevoEstado == EstadoInscripcion.ADMITIDO) {
            FacturaResponse facturaResp = facturaUseCase.consultarPorInscripcion(id);
            if (!"PAGADA".equals(facturaResp.getEstado())) {
                throw new BusinessException("PENDING_PAYMENT",
                        "No se puede admitir una inscripción cuya factura no está pagada. Estado factura: " + facturaResp.getEstado());
            }
            boolean decremented = ofertaRepository.decrementarCupos(insc.getOfertaAdmisionId());
            if (!decremented) {
                throw new BusinessException("NO_CUPOS",
                        "No hay cupos disponibles en la oferta para admitir este aspirante");
            }
        }

        insc.setEstado(nuevoEstado);
        if (request.getObservaciones() != null) {
            insc.setObservaciones(request.getObservaciones());
        }

        Aspirante asp = aspiranteRepository.findById(insc.getAspiranteId()).orElse(null);
        return toResponse(inscripcionRepository.save(insc), asp, null);
    }

    private InscripcionResponse toResponse(Inscripcion i, Aspirante a, Factura factura) {
        FacturaResumidaResponse facturaResumida = null;
        if (factura != null) {
            facturaResumida = facturaUseCase.toResumida(factura);
        }

        return InscripcionResponse.builder()
                .id(i.getId())
                .aspiranteId(i.getAspiranteId())
                .aspiranteNombres(a != null ? a.getNombres() : null)
                .aspiranteApellidos(a != null ? a.getApellidos() : null)
                .ofertaAdmisionId(i.getOfertaAdmisionId())
                .fechaInscripcion(i.getFechaInscripcion())
                .estado(i.getEstado() != null ? i.getEstado().name() : null)
                .observaciones(i.getObservaciones())
                .factura(facturaResumida)
                .build();
    }

    private InscripcionResponse toResponseFromDto(Inscripcion i, Aspirante a, FacturaResponse facturaResp) {
        FacturaResumidaResponse facturaResumida = null;
        if (facturaResp != null) {
            facturaResumida = FacturaResumidaResponse.builder()
                    .id(facturaResp.getId())
                    .numeroFactura(facturaResp.getNumeroFactura())
                    .valor(facturaResp.getValor())
                    .moneda(facturaResp.getMoneda())
                    .estado(facturaResp.getEstado())
                    .build();
        }

        return InscripcionResponse.builder()
                .id(i.getId())
                .aspiranteId(i.getAspiranteId())
                .aspiranteNombres(a != null ? a.getNombres() : null)
                .aspiranteApellidos(a != null ? a.getApellidos() : null)
                .ofertaAdmisionId(i.getOfertaAdmisionId())
                .fechaInscripcion(i.getFechaInscripcion())
                .estado(i.getEstado() != null ? i.getEstado().name() : null)
                .observaciones(i.getObservaciones())
                .factura(facturaResumida)
                .build();
    }
}
