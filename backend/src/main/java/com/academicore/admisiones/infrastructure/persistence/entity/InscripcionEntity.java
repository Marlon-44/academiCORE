package com.academicore.admisiones.infrastructure.persistence.entity;

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
@Table(name = "inscripcion")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InscripcionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "aspirante_id", nullable = false)
    private Long aspiranteId;

    @Column(name = "oferta_admision_id", nullable = false)
    private Long ofertaAdmisionId;

    @Column(name = "fecha_inscripcion", nullable = false)
    private LocalDateTime fechaInscripcion;

    @Column(name = "estado", nullable = false, length = 30)
    private String estado;

    @Column(name = "observaciones", columnDefinition = "TEXT")
    private String observaciones;
}
