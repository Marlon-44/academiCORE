package com.academicore.campus.infrastructure.persistence.entity;

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
@Table(name = "campus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CampusEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "universidad_id", nullable = false)
    private Long universidadId;

    @Column(name = "codigo", nullable = false, length = 30)
    private String codigo;

    @Column(name = "nombre", nullable = false, length = 150)
    private String nombre;

    @Column(name = "direccion", length = 250)
    private String direccion;

    @Column(name = "ciudad", nullable = false, length = 100)
    private String ciudad;

    @Column(name = "descripcion", columnDefinition = "TEXT")
    private String descripcion;

    @Column(name = "estado", nullable = false, length = 20)
    private String estado;

    @Column(name = "es_sede_principal", nullable = false)
    private boolean esSedePrincipal;

    @Column(name = "orden", nullable = false)
    private int orden;

    @Column(name = "url_mapa", length = 500)
    private String urlMapa;
}
