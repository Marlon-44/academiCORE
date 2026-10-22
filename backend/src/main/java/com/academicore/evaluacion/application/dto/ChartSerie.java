package com.academicore.evaluacion.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Serie lista para graficar: labels del eje X + valores numéricos.
 * Compatible directo con Chart.js / Recharts.
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChartSerie {

    private List<String> labels;
    private List<Double> valores;
}
