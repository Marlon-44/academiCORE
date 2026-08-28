package com.academicore.pensum.infrastructure.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "plan_asignatura")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PlanAsignaturaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "plan_estudios_id", nullable = false)
    private Long planEstudiosId;

    @Column(name = "asignatura_id", nullable = false)
    private Long asignaturaId;

    @Column(name = "nivel_curricular_id", nullable = false)
    private Long nivelCurricularId;

    @Column(name = "tipo_asignatura_id", nullable = false)
    private Long tipoAsignaturaId;

    @Column(name = "creditos", nullable = false, precision = 5, scale = 2)
    private BigDecimal creditos;

    @Column(name = "horas_docencia_semanales", nullable = false, precision = 5, scale = 2)
    private BigDecimal horasDocenciaSemanales;

    @Column(name = "horas_trabajo_independiente", nullable = false, precision = 5, scale = 2)
    private BigDecimal horasTrabajoIndependiente;

    @Column(name = "es_habilitable", nullable = false)
    private boolean esHabilitable;

    @OneToMany(mappedBy = "planAsignaturaId")
    @Builder.Default
    private List<RequisitoPlanAsignaturaEntity> requisitos = new ArrayList<>();
}
