package com.academicore.evaluacion.infrastructure.persistence.entity;

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
@Table(name = "evaluacion_docente")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EvaluacionDocenteEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "docente_id", nullable = false)
    private Long docenteId;

    @Column(name = "asignatura_id", nullable = false)
    private Long asignaturaId;

    @Column(name = "programa_id")
    private Long programaId;

    @Column(name = "grupo", nullable = false, length = 10)
    private String grupo;

    @Column(name = "periodo", nullable = false, length = 20)
    private String periodo;

    @Column(name = "estudiantes_esperados")
    private Integer estudiantesEsperados;

    @Column(name = "estado", nullable = false, length = 20)
    private String estado;

    @Column(name = "fecha_creacion", nullable = false)
    private LocalDateTime fechaCreacion;
}
