package com.academicore.evaluacion.domain.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/** Puerto de solo lectura hacia el catálogo académico del módulo pensum
 *  (programas, departamentos y planes de estudio) sin acoplar módulos. */
public interface CatalogoAcademicoPort {

    Optional<ProgramaInfo> findProgramaById(Long id);

    Map<Long, ProgramaInfo> findProgramasByIds(List<Long> ids);

    Optional<DepartamentoInfo> findDepartamentoById(Long id);

    Optional<PlanInfo> findPlanEstudiosById(Long id);

    record ProgramaInfo(Long id, String codigoInterno, String nombre) {
    }

    record DepartamentoInfo(Long id, String codigo, String nombre) {
    }

    record PlanInfo(Long id, String codigoPensum, String nombre) {
    }
}
