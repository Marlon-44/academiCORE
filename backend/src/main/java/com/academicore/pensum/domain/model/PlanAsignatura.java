package com.academicore.pensum.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PlanAsignatura {

    private Long id;
    private Long planEstudiosId;
    private Long asignaturaId;
    private Long nivelCurricularId;
    private Long tipoAsignaturaId;
    private BigDecimal creditos;
    private BigDecimal horasDocenciaSemanales;
    private BigDecimal horasTrabajoIndependiente;
    private boolean esHabilitable;

    private Asignatura asignatura;
    private NivelCurricular nivelCurricular;
    private TipoAsignaturaPlan tipoAsignatura;

    @Builder.Default
    private final List<RequisitoPlanAsignatura> requisitos = new ArrayList<>();

    public int getCreditosValue() {
        return creditos != null ? creditos.intValue() : 0;
    }
}
