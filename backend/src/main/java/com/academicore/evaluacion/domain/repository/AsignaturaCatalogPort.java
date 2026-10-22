package com.academicore.evaluacion.domain.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Puerto de solo lectura hacia el catálogo de asignaturas (módulo pensum),
 * para enriquecer respuestas y reportes sin acoplar los módulos.
 */
public interface AsignaturaCatalogPort {

    Optional<AsignaturaInfo> findById(Long id);

    Map<Long, AsignaturaInfo> findByIds(List<Long> ids);

    record AsignaturaInfo(Long id, String codigo, String nombre) {
    }
}
