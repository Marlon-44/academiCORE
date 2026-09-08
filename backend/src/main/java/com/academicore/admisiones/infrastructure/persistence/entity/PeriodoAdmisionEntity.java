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

import java.time.LocalDate;

@Entity
@Table(name = "periodo_admision")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PeriodoAdmisionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "codigo", nullable = false, length = 20)
    private String codigo;

    @Column(name = "nombre", nullable = false, length = 100)
    private String nombre;

    @Column(name = "fecha_inicio_inscripciones", nullable = false)
    private LocalDate fechaInicioInscripciones;

    @Column(name = "fecha_fin_inscripciones", nullable = false)
    private LocalDate fechaFinInscripciones;

    @Column(name = "fecha_inicio_clases")
    private LocalDate fechaInicioClases;

    @Column(name = "estado", nullable = false, length = 20)
    private String estado;
}
