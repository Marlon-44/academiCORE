package com.academicore.evaluacion.domain.model;

import lombok.Getter;

/**
 * Escala de valoración oficial del reporte de evaluación docente (formato PVD003):
 * DEFICIENTE (0.0-2.99); REGULAR (3.0-3.49); BUENO (3.5-3.99);
 * MUY BUENO (4.0-4.49); EXCELENTE (4.5-5.0)
 */
@Getter
public enum EscalaValoracion {

    DEFICIENTE(0.0, 2.99, "Deficiente"),
    REGULAR(3.0, 3.49, "Regular"),
    BUENO(3.5, 3.99, "Bueno"),
    MUY_BUENO(4.0, 4.49, "Muy bueno"),
    EXCELENTE(4.5, 5.0, "Excelente");

    private final double minimo;
    private final double maximo;
    private final String etiqueta;

    EscalaValoracion(double minimo, double maximo, String etiqueta) {
        this.minimo = minimo;
        this.maximo = maximo;
        this.etiqueta = etiqueta;
    }

    public static EscalaValoracion fromPromedio(double promedio) {
        for (EscalaValoracion escala : values()) {
            if (promedio >= escala.minimo && promedio <= escala.maximo) {
                return escala;
            }
        }
        return promedio < 0 ? DEFICIENTE : EXCELENTE;
    }
}
