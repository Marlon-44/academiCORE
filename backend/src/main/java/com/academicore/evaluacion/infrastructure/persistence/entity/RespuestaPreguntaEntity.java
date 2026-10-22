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

@Entity
@Table(name = "respuesta_pregunta")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RespuestaPreguntaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "encuesta_id", nullable = false)
    private Long encuestaId;

    @Column(name = "pregunta_id", nullable = false)
    private Long preguntaId;

    @Column(name = "valor")
    private Integer valor;

    @Column(name = "texto_respuesta", columnDefinition = "TEXT")
    private String textoRespuesta;

    @Column(name = "sentimiento", length = 20)
    private String sentimiento;

    @Column(name = "sentimiento_score")
    private Double sentimientoScore;

    @Column(name = "sentimiento_metodo", length = 20)
    private String sentimientoMetodo;
}
