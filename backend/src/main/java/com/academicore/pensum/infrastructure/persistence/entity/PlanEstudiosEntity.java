package com.academicore.pensum.infrastructure.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OrderBy;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "plan_estudios")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PlanEstudiosEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "programa_id", nullable = false)
    private Long programaId;

    @Column(name = "periodicidad_id", nullable = false)
    private Long periodicidadId;

    @Column(name = "codigo_pensum", nullable = false, length = 30)
    private String codigoPensum;

    @Column(name = "nombre", length = 150)
    private String nombre;

    @Column(name = "numero_resolucion", length = 50)
    private String numeroResolucion;

    @Column(name = "fecha_aprobacion")
    private LocalDate fechaAprobacion;

    @Column(name = "fecha_vigencia_desde", nullable = false)
    private LocalDate fechaVigenciaDesde;

    @Column(name = "fecha_vigencia_hasta")
    private LocalDate fechaVigenciaHasta;

    @Column(name = "total_creditos", nullable = false)
    private int totalCreditos;

    @Column(name = "estado", nullable = false, length = 30)
    private String estado;

    @OneToMany(mappedBy = "planEstudiosId")
    @OrderBy("numeroNivel ASC")
    @Builder.Default
    private List<NivelCurricularEntity> nivelesCurriculares = new ArrayList<>();
}
