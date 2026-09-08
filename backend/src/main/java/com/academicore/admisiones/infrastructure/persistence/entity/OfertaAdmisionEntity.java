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

import java.math.BigDecimal;

@Entity
@Table(name = "oferta_admision")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OfertaAdmisionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "periodo_admision_id", nullable = false)
    private Long periodoAdmisionId;

    @Column(name = "programa_id", nullable = false)
    private Long programaId;

    @Column(name = "plan_estudios_id", nullable = false)
    private Long planEstudiosId;

    @Column(name = "campus_id", nullable = false)
    private Long campusId;

    @Column(name = "cupos_totales", nullable = false)
    private int cuposTotales;

    @Column(name = "cupos_disponibles", nullable = false)
    private int cuposDisponibles;

    @Column(name = "valor_inscripcion", nullable = false, precision = 12, scale = 2)
    private BigDecimal valorInscripcion;

    @Column(name = "moneda_id", nullable = false)
    private Long monedaId;

    @Column(name = "estado", nullable = false, length = 20)
    private String estado;
}
