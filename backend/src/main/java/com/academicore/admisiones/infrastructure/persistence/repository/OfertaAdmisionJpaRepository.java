package com.academicore.admisiones.infrastructure.persistence.repository;

import com.academicore.admisiones.infrastructure.persistence.entity.OfertaAdmisionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OfertaAdmisionJpaRepository extends JpaRepository<OfertaAdmisionEntity, Long> {

    List<OfertaAdmisionEntity> findByPeriodoAdmisionId(Long periodoAdmisionId);

    List<OfertaAdmisionEntity> findByPeriodoAdmisionIdAndCampusId(Long periodoAdmisionId, Long campusId);

    boolean existsByPeriodoAdmisionIdAndProgramaIdAndCampusId(Long periodoAdmisionId, Long programaId, Long campusId);

    @Modifying
    @Query("UPDATE OfertaAdmisionEntity o " +
           "SET o.cuposDisponibles = o.cuposDisponibles - 1, " +
           "    o.estado = CASE WHEN o.cuposDisponibles - 1 = 0 THEN 'AGOTADA' ELSE o.estado END " +
           "WHERE o.id = :id AND o.cuposDisponibles > 0")
    int decrementarCupos(@Param("id") Long id);
}
