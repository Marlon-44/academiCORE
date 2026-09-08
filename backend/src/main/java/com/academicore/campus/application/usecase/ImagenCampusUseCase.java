package com.academicore.campus.application.usecase;

import com.academicore.campus.application.dto.ImagenCampusResponse;
import com.academicore.campus.application.dto.RegistrarImagenCampusRequest;
import com.academicore.campus.domain.model.CategoriaImagenCampus;
import com.academicore.campus.domain.model.ImagenCampus;
import com.academicore.campus.domain.repository.CategoriaImagenCampusRepository;
import com.academicore.campus.domain.repository.ImagenCampusRepository;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ImagenCampusUseCase {

    private final ImagenCampusRepository imagenRepository;
    private final CategoriaImagenCampusRepository categoriaRepository;

    @Transactional
    public ImagenCampusResponse registrar(Long campusId, RegistrarImagenCampusRequest request) {
        CategoriaImagenCampus categoria = categoriaRepository.findByCodigo(request.getCategoriaCodigo())
                .orElseThrow(() -> new NotFoundException("Categoría de imagen", "codigo", request.getCategoriaCodigo()));

        ImagenCampus imagen = ImagenCampus.builder()
                .campusId(campusId)
                .categoriaId(categoria.getId())
                .categoriaCodigo(categoria.getCodigo())
                .categoriaNombre(categoria.getNombre())
                .url(request.getUrl())
                .descripcion(request.getDescripcion())
                .orden(request.getOrden())
                .estado("ACTIVA")
                .build();

        ImagenCampus saved = imagenRepository.save(imagen);
        return toResponse(saved);
    }

    @Transactional(readOnly = true)
    public List<ImagenCampusResponse> listarPorCampus(Long campusId, String categoriaCodigo) {
        List<ImagenCampus> imagenes;
        if (categoriaCodigo != null) {
            imagenes = imagenRepository.findByCampusIdAndCategoriaCodigo(campusId, categoriaCodigo);
        } else {
            imagenes = imagenRepository.findByCampusId(campusId);
        }
        return imagenes.stream().map(this::toResponse).toList();
    }

    @Transactional
    public void eliminar(Long imagenId) {
        imagenRepository.findById(imagenId)
                .orElseThrow(() -> new NotFoundException("Imagen de campus", "id", imagenId));
        imagenRepository.deleteById(imagenId);
    }

    public ImagenCampusResponse toResponse(ImagenCampus img) {
        return ImagenCampusResponse.builder()
                .id(img.getId())
                .campusId(img.getCampusId())
                .categoriaCodigo(img.getCategoriaCodigo())
                .categoriaNombre(img.getCategoriaNombre())
                .url(img.getUrl())
                .descripcion(img.getDescripcion())
                .orden(img.getOrden())
                .fechaCarga(img.getFechaCarga())
                .estado(img.getEstado())
                .build();
    }
}
