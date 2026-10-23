package com.academicore.auth.infrastructure.persistence.repository;

import com.academicore.auth.infrastructure.persistence.entity.SesionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface SesionJpaRepository extends JpaRepository<SesionEntity, Long> {

    Optional<SesionEntity> findByToken(String token);

    void deleteByToken(String token);

    @Modifying
    @Query("DELETE FROM SesionEntity s WHERE s.expiraEn < CURRENT_TIMESTAMP")
    int deleteExpiradas();
}
