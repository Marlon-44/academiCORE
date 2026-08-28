package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.ProgramaAcademicoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProgramaAcademicoJpaRepository extends JpaRepository<ProgramaAcademicoEntity, Long> {

    Optional<ProgramaAcademicoEntity> findByFacultadIdAndCodigoInterno(Long facultadId, String codigoInterno);

    Optional<ProgramaAcademicoEntity> findByCodigoSnies(String codigoSnies);

    List<ProgramaAcademicoEntity> findByFacultadId(Long facultadId);

    boolean existsByFacultadIdAndCodigoInterno(Long facultadId, String codigoInterno);

    boolean existsByCodigoSnies(String codigoSnies);
}
