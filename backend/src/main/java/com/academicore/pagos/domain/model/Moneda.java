package com.academicore.pagos.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Moneda {

    private Long id;
    private String codigoIso;
    private String nombre;
    private String simbolo;
}
