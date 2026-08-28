package com.academicore.pensum.infrastructure.persistence.entity;

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
@Table(name = "programa_academico")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProgramaAcademicoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "facultad_id", nullable = false)
    private Long facultadId;

    @Column(name = "codigo_interno", nullable = false, length = 30)
    private String codigoInterno;

    @Column(name = "codigo_snies", length = 20)
    private String codigoSnies;

    @Column(name = "nombre", nullable = false, length = 200)
    private String nombre;

    @Column(name = "creditos_totales")
    private Integer creditosTotales;

    @Column(name = "estado", nullable = false, length = 30)
    private String estado;

    @Column(name = "fecha_creacion", nullable = false)
    private LocalDate fechaCreacion;
}
