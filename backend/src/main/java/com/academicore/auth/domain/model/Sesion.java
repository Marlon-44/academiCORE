package com.academicore.auth.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.security.SecureRandom;
import java.time.OffsetDateTime;
import java.util.HexFormat;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Sesion {

    private Long id;
    private String token;
    private Long usuarioId;
    private OffsetDateTime creadoEn;
    private OffsetDateTime expiraEn;

    private static final SecureRandom RANDOM = new SecureRandom();

    public static Sesion nueva(Long usuarioId, long duracionSegundos) {
        byte[] bytes = new byte[32];
        RANDOM.nextBytes(bytes);
        OffsetDateTime ahora = OffsetDateTime.now();
        return Sesion.builder()
                .token(HexFormat.of().formatHex(bytes))
                .usuarioId(usuarioId)
                .creadoEn(ahora)
                .expiraEn(ahora.plusSeconds(duracionSegundos))
                .build();
    }

    public boolean estaVigente() {
        return expiraEn != null && expiraEn.isAfter(OffsetDateTime.now());
    }
}
