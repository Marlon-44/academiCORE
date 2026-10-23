package com.academicore.auth.infrastructure.persistence.adapter;

import com.academicore.auth.domain.model.Usuario;
import com.academicore.auth.domain.repository.UsuarioRepository;
import com.academicore.auth.infrastructure.persistence.mapper.AuthMapper;
import com.academicore.auth.infrastructure.persistence.repository.UsuarioJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@RequiredArgsConstructor
public class UsuarioRepositoryAdapter implements UsuarioRepository {

    private final UsuarioJpaRepository jpaRepository;

    @Override
    public Usuario save(Usuario usuario) {
        return AuthMapper.toDomain(jpaRepository.save(AuthMapper.toEntity(usuario)));
    }

    @Override
    public Optional<Usuario> findById(Long id) {
        return jpaRepository.findById(id).map(AuthMapper::toDomain);
    }

    @Override
    public Optional<Usuario> findByUsername(String username) {
        return jpaRepository.findByUsername(username).map(AuthMapper::toDomain);
    }

    @Override
    public Optional<Usuario> findByCredencialesValidas(String username, String password) {
        return jpaRepository.findByCredencialesValidas(username, password).map(AuthMapper::toDomain);
    }

    @Override
    public void marcarUltimoAcceso(Long id) {
        jpaRepository.marcarUltimoAcceso(id);
    }
}
