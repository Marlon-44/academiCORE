package com.academicore.evaluacion.infrastructure.persistence.repository;

import com.academicore.evaluacion.infrastructure.persistence.entity.EvaluacionDocenteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EvaluacionDocenteJpaRepository extends JpaRepository<EvaluacionDocenteEntity, Long> {

    List<EvaluacionDocenteEntity> findByDocenteId(Long docenteId);

    List<EvaluacionDocenteEntity> findByDocenteIdAndAsignaturaId(Long docenteId, Long asignaturaId);

    @Query("SELECT e FROM EvaluacionDocenteEntity e " +
           "WHERE (:docenteId IS NULL OR e.docenteId = :docenteId) " +
           "AND (:asignaturaId IS NULL OR e.asignaturaId = :asignaturaId) " +
           "AND (:periodo IS NULL OR e.periodo = :periodo)")
    List<EvaluacionDocenteEntity> buscar(@Param("docenteId") Long docenteId,
                                         @Param("asignaturaId") Long asignaturaId,
                                         @Param("periodo") String periodo);

    boolean existsByDocenteIdAndAsignaturaIdAndGrupoAndPeriodo(Long docenteId, Long asignaturaId,
                                                               String grupo, String periodo);

    @Query(value = "SELECT a.id, a.codigo, a.nombre FROM asignatura a WHERE a.id IN (:ids)",
           nativeQuery = true)
    List<Object[]> findAsignaturaInfo(@Param("ids") List<Long> ids);
}
