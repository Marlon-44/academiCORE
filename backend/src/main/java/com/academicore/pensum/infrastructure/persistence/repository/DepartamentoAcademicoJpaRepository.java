package com.academicore.pensum.infrastructure.persistence.repository;

import com.academicore.pensum.infrastructure.persistence.entity.DepartamentoAcademicoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DepartamentoAcademicoJpaRepository extends JpaRepository<DepartamentoAcademicoEntity, Long> {

    List<DepartamentoAcademicoEntity> findByFacultadId(Long facultadId);

    boolean existsByFacultadIdAndCodigo(Long facultadId, String codigo);

    boolean existsByFacultadIdAndNombre(Long facultadId, String nombre);
}
