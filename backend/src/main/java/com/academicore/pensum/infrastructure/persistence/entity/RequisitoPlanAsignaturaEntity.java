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

@Entity
@Table(name = "requisito_plan_asignatura")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RequisitoPlanAsignaturaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "plan_estudios_id", nullable = false)
    private Long planEstudiosId;

    @Column(name = "plan_asignatura_id", nullable = false)
    private Long planAsignaturaId;

    @Column(name = "plan_asignatura_requerida_id", nullable = false)
    private Long planAsignaturaRequeridaId;

    @Column(name = "tipo_requisito_id", nullable = false)
    private Long tipoRequisitoId;
}
