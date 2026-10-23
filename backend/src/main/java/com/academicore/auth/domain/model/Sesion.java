package com.academicore.auth.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.UUID;

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

    public static Sesion nueva(Long usuarioId, long duracionSegundos) {
        OffsetDateTime ahora = OffsetDateTime.now();
        return Sesion.builder()
                .token(UUID.randomUUID().toString().replace("-", "")
                        + UUID.randomUUID().toString().replace("-", ""))
                .usuarioId(usuarioId)
                .creadoEn(ahora)
                .expiraEn(ahora.plusSeconds(duracionSegundos))
                .build();
    }

    public boolean estaVigente() {
        return expiraEn != null && expiraEn.isAfter(OffsetDateTime.now());
    }
}
