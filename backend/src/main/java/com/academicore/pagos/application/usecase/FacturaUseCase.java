package com.academicore.pagos.application.usecase;

import com.academicore.admisiones.application.dto.FacturaResumidaResponse;
import com.academicore.pagos.application.dto.FacturaResponse;
import com.academicore.pagos.domain.model.ConceptoPago;
import com.academicore.pagos.domain.model.Factura;
import com.academicore.pagos.domain.model.Moneda;
import com.academicore.pagos.domain.repository.ConceptoPagoRepository;
import com.academicore.pagos.domain.repository.FacturaRepository;
import com.academicore.pagos.domain.repository.MonedaRepository;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.Year;

@Service
@RequiredArgsConstructor
public class FacturaUseCase {

    private final FacturaRepository facturaRepository;
    private final ConceptoPagoRepository conceptoPagoRepository;
    private final MonedaRepository monedaRepository;

    @Transactional
    public Factura generarFacturaInscripcion(Long inscripcionId, BigDecimal valor, Long monedaId) {
        ConceptoPago concepto = conceptoPagoRepository.findByCodigo("INSCRIPCION")
                .orElseThrow(() -> new NotFoundException("Concepto de pago", "codigo", "INSCRIPCION"));

        int anio = Year.now().getValue();
        long consecutivo = facturaRepository.countByAnio(anio) + 1;
        String numeroFactura = String.format("FAC-%d-%06d", anio, consecutivo);

        Factura factura = Factura.builder()
                .inscripcionId(inscripcionId)
                .conceptoPagoId(concepto.getId())
                .monedaId(monedaId)
                .numeroFactura(numeroFactura)
                .valor(valor)
                .fechaEmision(LocalDateTime.now())
                .fechaVencimiento(LocalDateTime.now().plusDays(7))
                .estado("PENDIENTE")
                .build();

        return facturaRepository.save(factura);
    }

    @Transactional(readOnly = true)
    public FacturaResponse consultarPorId(Long id) {
        Factura f = facturaRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Factura", "id", id));
        return toResponse(f);
    }

    @Transactional(readOnly = true)
    public FacturaResponse consultarPorInscripcion(Long inscripcionId) {
        Factura f = facturaRepository.findByInscripcionId(inscripcionId)
                .orElseThrow(() -> new NotFoundException("Factura", "inscripcionId", inscripcionId));
        return toResponse(f);
    }

    public FacturaResumidaResponse toResumida(Factura f) {
        Moneda moneda = monedaRepository.findById(f.getMonedaId()).orElse(null);
        return FacturaResumidaResponse.builder()
                .id(f.getId())
                .numeroFactura(f.getNumeroFactura())
                .valor(f.getValor())
                .moneda(moneda != null ? moneda.getCodigoIso() : null)
                .estado(f.getEstado())
                .build();
    }

    private FacturaResponse toResponse(Factura f) {
        ConceptoPago concepto = conceptoPagoRepository.findByCodigo("INSCRIPCION").orElse(null);
        Moneda moneda = monedaRepository.findById(f.getMonedaId()).orElse(null);
        return FacturaResponse.builder()
                .id(f.getId())
                .numeroFactura(f.getNumeroFactura())
                .concepto(concepto != null ? concepto.getNombre() : null)
                .valor(f.getValor())
                .moneda(moneda != null ? moneda.getCodigoIso() : null)
                .fechaEmision(f.getFechaEmision())
                .fechaVencimiento(f.getFechaVencimiento())
                .estado(f.getEstado())
                .inscripcionId(f.getInscripcionId())
                .build();
    }
}
