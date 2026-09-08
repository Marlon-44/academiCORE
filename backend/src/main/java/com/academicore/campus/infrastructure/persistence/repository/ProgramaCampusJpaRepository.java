package com.academicore.campus.infrastructure.persistence.repository;

import com.academicore.campus.infrastructure.persistence.entity.ProgramaCampusEntity;
import com.academicore.campus.infrastructure.persistence.entity.ProgramaCampusEntity.PK;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProgramaCampusJpaRepository extends JpaRepository<ProgramaCampusEntity, PK> {

    List<ProgramaCampusEntity> findByProgramaId(Long programaId);

    boolean existsByProgramaIdAndCampusId(Long programaId, Long campusId);
}
