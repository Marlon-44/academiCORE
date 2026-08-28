package com.academicore.pensum.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NivelCurricular {

    private Long id;
    private Long planEstudiosId;
    private int numeroNivel;
    private String nombre;

    @Builder.Default
    private final List<PlanAsignatura> planAsignaturas = new ArrayList<>();
}
