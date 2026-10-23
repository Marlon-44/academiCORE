package com.academicore.auth.domain.repository;

import com.academicore.auth.domain.model.Sesion;

import java.util.Optional;

public interface SesionRepository {

    Sesion save(Sesion sesion);

    Optional<Sesion> findByToken(String token);

    void deleteByToken(String token);

    void deleteExpiradas();
}
