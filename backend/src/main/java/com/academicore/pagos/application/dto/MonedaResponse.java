package com.academicore.pagos.application.dto;

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
public class MonedaResponse {

    private Long id;
    private String codigoIso;
    private String nombre;
    private String simbolo;
}
