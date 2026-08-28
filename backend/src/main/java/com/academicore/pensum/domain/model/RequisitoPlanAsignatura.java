package com.academicore.pensum.domain.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RequisitoPlanAsignatura {

    private Long id;
    private Long planEstudiosId;
    private Long planAsignaturaId;
    private Long planAsignaturaRequeridaId;
    private Long tipoRequisitoId;

    private TipoRequisito tipoRequisito;
}
