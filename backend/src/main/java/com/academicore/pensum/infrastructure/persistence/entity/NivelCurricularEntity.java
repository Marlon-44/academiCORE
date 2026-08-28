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

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "nivel_curricular")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NivelCurricularEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "plan_estudios_id", nullable = false)
    private Long planEstudiosId;

    @Column(name = "numero_nivel", nullable = false)
    private int numeroNivel;

    @Column(name = "nombre", length = 100)
    private String nombre;

    @OneToMany(mappedBy = "nivelCurricularId")
    @OrderBy("asignaturaId ASC")
    @Builder.Default
    private List<PlanAsignaturaEntity> planAsignaturas = new ArrayList<>();
}
