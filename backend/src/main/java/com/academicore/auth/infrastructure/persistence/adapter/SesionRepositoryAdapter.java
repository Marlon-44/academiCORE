package com.academicore.auth.infrastructure.persistence.adapter;

import com.academicore.auth.domain.model.Sesion;
import com.academicore.auth.domain.repository.SesionRepository;
import com.academicore.auth.infrastructure.persistence.mapper.AuthMapper;
import com.academicore.auth.infrastructure.persistence.repository.SesionJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class SesionRepositoryAdapter implements SesionRepository {

    private final SesionJpaRepository jpaRepository;

    @Override
    public Sesion save(Sesion sesion) {
        return AuthMapper.toDomain(jpaRepository.save(AuthMapper.toEntity(sesion)));
    }

    @Override
    public Optional<Sesion> findByToken(String token) {
        return jpaRepository.findByToken(token).map(AuthMapper::toDomain);
    }

    @Override
    public void deleteByToken(String token) {
        jpaRepository.deleteByToken(token);
    }

    @Override
    public void deleteExpiradas() {
        jpaRepository.deleteExpiradas();
    }
}
