package com.academicore.pagos.application.usecase;

import com.academicore.pagos.application.dto.MonedaResponse;
import com.academicore.pagos.domain.repository.MonedaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MonedaUseCase {

    private final MonedaRepository monedaRepository;

    @Transactional(readOnly = true)
    public List<MonedaResponse> listar() {
        return monedaRepository.findAll().stream()
                .map(m -> MonedaResponse.builder()
                        .id(m.getId())
                        .codigoIso(m.getCodigoIso())
                        .nombre(m.getNombre())
                        .simbolo(m.getSimbolo())
                        .build())
                .toList();
    }
}
