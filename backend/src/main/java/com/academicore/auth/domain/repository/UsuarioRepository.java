package com.academicore.auth.domain.repository;

import com.academicore.auth.domain.model.Usuario;

import java.util.Optional;

public interface UsuarioRepository {

    Usuario save(Usuario usuario);

    Optional<Usuario> findById(Long id);

    Optional<Usuario> findByUsername(String username);

    /**
     * Devuelve el usuario solo si username existe, esta ACTIVO y el password
     * coincide con el hash bcrypt almacenado (verificado con crypt() de pgcrypto).
     */
    Optional<Usuario> findByCredencialesValidas(String username, String password);

    void marcarUltimoAcceso(Long id);
}
