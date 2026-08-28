package com.academicore.pensum.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PlanEstudios {

    private Long id;
    private Long programaId;
    private Long periodicidadId;
    private String codigoPensum;
    private String nombre;
    private String numeroResolucion;
    private LocalDate fechaAprobacion;
    private LocalDate fechaVigenciaDesde;
    private LocalDate fechaVigenciaHasta;
    private int totalCreditos;
    private EstadoPensum estado;

    @Builder.Default
    private final List<NivelCurricular> nivelesCurriculares = new ArrayList<>();

    public void activar() {
        if (this.estado != EstadoPensum.APROBADO) {
            throw new IllegalStateException(
                "Solo un pensum APROBADO puede pasar a VIGENTE. Estado actual: " + this.estado);
        }
        this.estado = EstadoPensum.VIGENTE;
        this.fechaVigenciaDesde = LocalDate.now();
    }

    public void aprobar() {
        if (this.estado != EstadoPensum.EN_DISENO) {
            throw new IllegalStateException(
                "Solo un pensum EN_DISENO puede pasar a APROBADO. Estado actual: " + this.estado);
        }
        this.estado = EstadoPensum.APROBADO;
    }

    public void ponerEnExtincion() {
        if (this.estado != EstadoPensum.VIGENTE) {
            throw new IllegalStateException("Solo un pensum VIGENTE puede pasar a EN_EXTINCION.");
        }
        this.estado = EstadoPensum.EN_EXTINCION;
    }

    public void historificar() {
        if (this.estado != EstadoPensum.EN_EXTINCION) {
            throw new IllegalStateException("Solo un pensum EN_EXTINCION puede pasar a HISTORICO.");
        }
        this.estado = EstadoPensum.HISTORICO;
        this.fechaVigenciaHasta = LocalDate.now();
    }

    public void cancelar() {
        if (this.estado == EstadoPensum.VIGENTE || this.estado == EstadoPensum.EN_EXTINCION) {
            throw new IllegalStateException(
                "No se puede cancelar un pensum VIGENTE o EN_EXTINCION. Poner en HISTORICO primero.");
        }
        this.estado = EstadoPensum.CANCELADO;
    }

    public boolean admiteNuevosEstudiantes() {
        return this.estado == EstadoPensum.VIGENTE;
    }

    public int calcularCreditosTotales() {
        return nivelesCurriculares.stream()
                .flatMap(n -> n.getPlanAsignaturas().stream())
                .mapToInt(PlanAsignatura::getCreditosValue)
                .sum();
    }
}
