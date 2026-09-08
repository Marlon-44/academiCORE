package com.academicore.campus.infrastructure.persistence.adapter;

import com.academicore.campus.domain.model.CategoriaImagenCampus;
import com.academicore.campus.domain.model.ImagenCampus;
import com.academicore.campus.domain.repository.CategoriaImagenCampusRepository;
import com.academicore.campus.domain.repository.ImagenCampusRepository;
import com.academicore.campus.infrastructure.persistence.entity.CategoriaImagenCampusEntity;
import com.academicore.campus.infrastructure.persistence.entity.ImagenCampusEntity;
import com.academicore.campus.infrastructure.persistence.mapper.ImagenCampusMapper;
import com.academicore.campus.infrastructure.persistence.repository.CategoriaImagenCampusJpaRepository;
import com.academicore.campus.infrastructure.persistence.repository.ImagenCampusJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class ImagenCampusRepositoryAdapter implements ImagenCampusRepository {

    private final ImagenCampusJpaRepository jpaRepository;
    private final CategoriaImagenCampusJpaRepository categoriaJpaRepository;

    @Override
    public ImagenCampus save(ImagenCampus imagen) {
        ImagenCampusEntity saved = jpaRepository.save(ImagenCampusMapper.toEntity(imagen));
        CategoriaImagenCampusEntity cat = categoriaJpaRepository.findById(saved.getCategoriaId()).orElse(null);
        return ImagenCampusMapper.toDomain(saved, cat);
    }

    @Override
    public Optional<ImagenCampus> findById(Long id) {
        return jpaRepository.findById(id).map(e -> {
            CategoriaImagenCampusEntity cat = categoriaJpaRepository.findById(e.getCategoriaId()).orElse(null);
            return ImagenCampusMapper.toDomain(e, cat);
        });
    }

    @Override
    public List<ImagenCampus> findByCampusId(Long campusId) {
        return jpaRepository.findByCampusId(campusId).stream()
                .map(e -> {
                    CategoriaImagenCampusEntity cat = categoriaJpaRepository.findById(e.getCategoriaId()).orElse(null);
                    return ImagenCampusMapper.toDomain(e, cat);
                })
                .toList();
    }

    @Override
    public List<ImagenCampus> findByCampusIdAndCategoriaCodigo(Long campusId, String categoriaCodigo) {
        return jpaRepository.findByCampusIdAndCategoriaCodigo(campusId, categoriaCodigo).stream()
                .map(e -> {
                    CategoriaImagenCampusEntity cat = categoriaJpaRepository.findById(e.getCategoriaId()).orElse(null);
                    return ImagenCampusMapper.toDomain(e, cat);
                })
                .toList();
    }

    @Override
    public void deleteById(Long id) {
        jpaRepository.deleteById(id);
    }
}

@Component
@RequiredArgsConstructor
class CategoriaImagenCampusRepositoryAdapter implements CategoriaImagenCampusRepository {

    private final CategoriaImagenCampusJpaRepository jpaRepository;

    @Override
    public Optional<CategoriaImagenCampus> findById(Long id) {
        return jpaRepository.findById(id).map(ImagenCampusMapper::toDomain);
    }

    @Override
    public Optional<CategoriaImagenCampus> findByCodigo(String codigo) {
        return jpaRepository.findByCodigo(codigo).map(ImagenCampusMapper::toDomain);
    }

    @Override
    public List<CategoriaImagenCampus> findAll() {
        return jpaRepository.findAll().stream().map(ImagenCampusMapper::toDomain).toList();
    }
}
