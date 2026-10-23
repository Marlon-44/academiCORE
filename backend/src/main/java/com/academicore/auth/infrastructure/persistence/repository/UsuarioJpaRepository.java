package com.academicore.auth.infrastructure.persistence.repository;

import com.academicore.auth.infrastructure.persistence.entity.UsuarioEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UsuarioJpaRepository extends JpaRepository<UsuarioEntity, Long> {

    Optional<UsuarioEntity> findByUsername(String username);

    @Query(value = """
            SELECT * FROM usuario u
            WHERE u.username = :username
              AND u.estado = 'ACTIVO'
              AND u.password_hash = crypt(:password, u.password_hash)
            """, nativeQuery = true)
    Optional<UsuarioEntity> findByCredencialesValidas(@Param("username") String username,
                                                    @Param("password") String password);

    @Modifying
    @Query(value = "UPDATE usuario SET ultimo_acceso = now() WHERE id = :id", nativeQuery = true)
    void marcarUltimoAcceso(@Param("id") Long id);
}
