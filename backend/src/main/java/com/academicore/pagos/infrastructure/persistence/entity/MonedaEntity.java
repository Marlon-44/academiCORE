package com.academicore.pagos.infrastructure.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "moneda")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MonedaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "codigo_iso", nullable = false, length = 3)
    private String codigoIso;

    @Column(name = "nombre", nullable = false, length = 50)
    private String nombre;

    @Column(name = "simbolo", nullable = false, length = 5)
    private String simbolo;
}
