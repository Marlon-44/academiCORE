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

import java.time.LocalDateTime;

@Entity
@Table(name = "imagen_campus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ImagenCampusEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "campus_id", nullable = false)
    private Long campusId;

    @Column(name = "categoria_id", nullable = false)
    private Long categoriaId;

    @Column(name = "url", nullable = false, length = 500)
    private String url;

    @Column(name = "descripcion", length = 200)
    private String descripcion;

    @Column(name = "orden", nullable = false)
    private int orden;

    @Column(name = "fecha_carga", nullable = false)
    private LocalDateTime fechaCarga;

    @Column(name = "estado", nullable = false, length = 20)
    private String estado;
}
