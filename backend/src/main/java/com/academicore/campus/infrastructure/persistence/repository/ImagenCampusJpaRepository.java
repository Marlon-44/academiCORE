package com.academicore.campus.infrastructure.persistence.repository;

import com.academicore.campus.infrastructure.persistence.entity.ImagenCampusEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ImagenCampusJpaRepository extends JpaRepository<ImagenCampusEntity, Long> {

    List<ImagenCampusEntity> findByCampusId(Long campusId);

    @Query("SELECT i FROM ImagenCampusEntity i WHERE i.campusId = :campusId AND i.categoriaId = " +
           "(SELECT c.id FROM CategoriaImagenCampusEntity c WHERE c.codigo = :categoriaCodigo)")
    List<ImagenCampusEntity> findByCampusIdAndCategoriaCodigo(@Param("campusId") Long campusId,
                                                              @Param("categoriaCodigo") String categoriaCodigo);
}
