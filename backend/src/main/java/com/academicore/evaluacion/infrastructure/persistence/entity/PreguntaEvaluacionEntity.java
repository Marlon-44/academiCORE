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
@Table(name = "pregunta_evaluacion")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PreguntaEvaluacionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "categoria_id", nullable = false)
    private Long categoriaId;

    @Column(name = "numero", nullable = false)
    private Integer numero;

    @Column(name = "texto", nullable = false, length = 300)
    private String texto;

    @Column(name = "tipo", nullable = false, length = 10)
    private String tipo;

    @Column(name = "estado", nullable = false, length = 20)
    private String estado;
}
