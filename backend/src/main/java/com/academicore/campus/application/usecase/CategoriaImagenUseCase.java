package com.academicore.campus.application.usecase;

import com.academicore.campus.application.dto.CategoriaImagenResponse;
import com.academicore.campus.domain.repository.CategoriaImagenCampusRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoriaImagenUseCase {

    private final CategoriaImagenCampusRepository categoriaRepository;

    @Transactional(readOnly = true)
    public List<CategoriaImagenResponse> listar() {
        return categoriaRepository.findAll().stream()
                .map(c -> CategoriaImagenResponse.builder()
                        .id(c.getId())
                        .codigo(c.getCodigo())
                        .nombre(c.getNombre())
                        .build())
                .toList();
    }
}
