package com.academicore.evaluacion.infrastructure.persistence.mapper;

import com.academicore.evaluacion.domain.model.CategoriaPregunta;
import com.academicore.evaluacion.domain.model.Docente;
import com.academicore.evaluacion.domain.model.Encuesta;
import com.academicore.evaluacion.domain.model.EstadoDocente;
import com.academicore.evaluacion.domain.model.EstadoEvaluacion;
import com.academicore.evaluacion.domain.model.Estudiante;
import com.academicore.evaluacion.domain.model.EvaluacionDocente;
import com.academicore.evaluacion.domain.model.MetodoSentimiento;
import com.academicore.evaluacion.domain.model.PreguntaEvaluacion;
import com.academicore.evaluacion.domain.model.RespuestaPregunta;
import com.academicore.evaluacion.domain.model.Sentimiento;
import com.academicore.evaluacion.domain.model.TipoPregunta;
import com.academicore.evaluacion.infrastructure.persistence.entity.CategoriaPreguntaEntity;
import com.academicore.evaluacion.infrastructure.persistence.entity.DocenteEntity;
import com.academicore.evaluacion.infrastructure.persistence.entity.EncuestaEntity;
import com.academicore.evaluacion.infrastructure.persistence.entity.EstudianteEntity;
import com.academicore.evaluacion.infrastructure.persistence.entity.EvaluacionDocenteEntity;
import com.academicore.evaluacion.infrastructure.persistence.entity.PreguntaEvaluacionEntity;
import com.academicore.evaluacion.infrastructure.persistence.entity.RespuestaPreguntaEntity;

public final class EvaluacionDocenteMapper {

    private EvaluacionDocenteMapper() {}

    public static Docente toDomain(DocenteEntity e) {
        if (e == null) return null;
        return Docente.builder()
                .id(e.getId())
                .numeroDocumento(e.getNumeroDocumento())
                .sexo(e.getSexo())
                .nombres(e.getNombres())
                .apellidos(e.getApellidos())
                .email(e.getEmail())
                .telefono(e.getTelefono())
                .direccion(e.getDireccion())
                .tipoVinculacion(e.getTipoVinculacion())
                .escalafon(e.getEscalafon())
                .nivelFormacion(e.getNivelFormacion())
                .departamentoId(e.getDepartamentoId())
                .fechaIngreso(e.getFechaIngreso())
                .estado(e.getEstado() != null ? EstadoDocente.valueOf(e.getEstado()) : null)
                .build();
    }

    public static DocenteEntity toEntity(Docente d) {
        if (d == null) return null;
        return DocenteEntity.builder()
                .id(d.getId())
                .numeroDocumento(d.getNumeroDocumento())
                .sexo(d.getSexo())
                .nombres(d.getNombres())
                .apellidos(d.getApellidos())
                .email(d.getEmail())
                .telefono(d.getTelefono())
                .direccion(d.getDireccion())
                .tipoVinculacion(d.getTipoVinculacion())
                .escalafon(d.getEscalafon())
                .nivelFormacion(d.getNivelFormacion())
                .departamentoId(d.getDepartamentoId())
                .fechaIngreso(d.getFechaIngreso())
                .estado(d.getEstado() != null ? d.getEstado().name() : "ACTIVO")
                .build();
    }

    public static CategoriaPregunta toDomain(CategoriaPreguntaEntity e) {
        if (e == null) return null;
        return CategoriaPregunta.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .nombre(e.getNombre())
                .orden(e.getOrden())
                .build();
    }

    public static PreguntaEvaluacion toDomain(PreguntaEvaluacionEntity e, CategoriaPreguntaEntity cat) {
        if (e == null) return null;
        return PreguntaEvaluacion.builder()
                .id(e.getId())
                .categoriaId(e.getCategoriaId())
                .categoriaCodigo(cat != null ? cat.getCodigo() : null)
                .categoriaNombre(cat != null ? cat.getNombre() : null)
                .numero(e.getNumero())
                .texto(e.getTexto())
                .tipo(e.getTipo() != null ? TipoPregunta.valueOf(e.getTipo()) : null)
                .estado(e.getEstado())
                .build();
    }

    public static PreguntaEvaluacionEntity toEntity(PreguntaEvaluacion d) {
        if (d == null) return null;
        return PreguntaEvaluacionEntity.builder()
                .id(d.getId())
                .categoriaId(d.getCategoriaId())
                .numero(d.getNumero())
                .texto(d.getTexto())
                .tipo(d.getTipo() != null ? d.getTipo().name() : "LIKERT")
                .estado(d.getEstado() != null ? d.getEstado() : "ACTIVA")
                .build();
    }

    public static CategoriaPreguntaEntity toEntity(CategoriaPregunta d) {
        if (d == null) return null;
        return CategoriaPreguntaEntity.builder()
                .id(d.getId())
                .codigo(d.getCodigo())
                .nombre(d.getNombre())
                .orden(d.getOrden())
                .build();
    }

    public static EvaluacionDocente toDomain(EvaluacionDocenteEntity e) {
        if (e == null) return null;
        return EvaluacionDocente.builder()
                .id(e.getId())
                .docenteId(e.getDocenteId())
                .asignaturaId(e.getAsignaturaId())
                .programaId(e.getProgramaId())
                .grupo(e.getGrupo())
                .periodo(e.getPeriodo())
                .estudiantesEsperados(e.getEstudiantesEsperados())
                .estado(e.getEstado() != null ? EstadoEvaluacion.valueOf(e.getEstado()) : null)
                .fechaCreacion(e.getFechaCreacion())
                .build();
    }

    public static EvaluacionDocenteEntity toEntity(EvaluacionDocente d) {
        if (d == null) return null;
        return EvaluacionDocenteEntity.builder()
                .id(d.getId())
                .docenteId(d.getDocenteId())
                .asignaturaId(d.getAsignaturaId())
                .programaId(d.getProgramaId())
                .grupo(d.getGrupo())
                .periodo(d.getPeriodo())
                .estudiantesEsperados(d.getEstudiantesEsperados())
                .estado(d.getEstado() != null ? d.getEstado().name() : "ABIERTA")
                .fechaCreacion(d.getFechaCreacion())
                .build();
    }

    public static Encuesta toDomain(EncuestaEntity e) {
        if (e == null) return null;
        return Encuesta.builder()
                .id(e.getId())
                .evaluacionId(e.getEvaluacionId())
                .estudianteId(e.getEstudianteId())
                .fechaRespuesta(e.getFechaRespuesta())
                .build();
    }

    public static EncuestaEntity toEntity(Encuesta d) {
        if (d == null) return null;
        return EncuestaEntity.builder()
                .id(d.getId())
                .evaluacionId(d.getEvaluacionId())
                .estudianteId(d.getEstudianteId())
                .fechaRespuesta(d.getFechaRespuesta())
                .build();
    }

    public static Estudiante toDomain(EstudianteEntity e) {
        if (e == null) return null;
        return Estudiante.builder()
                .id(e.getId())
                .codigo(e.getCodigo())
                .numeroDocumento(e.getNumeroDocumento())
                .sexo(e.getSexo())
                .nombres(e.getNombres())
                .apellidos(e.getApellidos())
                .email(e.getEmail())
                .telefono(e.getTelefono())
                .direccion(e.getDireccion())
                .programaId(e.getProgramaId())
                .semestre(e.getSemestre())
                .estadoAcademico(e.getEstadoAcademico())
                .estadoIngreso(e.getEstadoIngreso())
                .planEstudiosId(e.getPlanEstudiosId())
                .estado(e.getEstado())
                .build();
    }

    public static EstudianteEntity toEntity(Estudiante d) {
        if (d == null) return null;
        return EstudianteEntity.builder()
                .id(d.getId())
                .codigo(d.getCodigo())
                .numeroDocumento(d.getNumeroDocumento())
                .sexo(d.getSexo())
                .nombres(d.getNombres())
                .apellidos(d.getApellidos())
                .email(d.getEmail())
                .telefono(d.getTelefono())
                .direccion(d.getDireccion())
                .programaId(d.getProgramaId())
                .semestre(d.getSemestre())
                .estadoAcademico(d.getEstadoAcademico() != null ? d.getEstadoAcademico() : "NORMAL")
                .estadoIngreso(d.getEstadoIngreso() != null ? d.getEstadoIngreso() : "NO ESPECIFICA")
                .planEstudiosId(d.getPlanEstudiosId())
                .estado(d.getEstado() != null ? d.getEstado() : "ACTIVO")
                .build();
    }

    public static RespuestaPregunta toDomain(RespuestaPreguntaEntity e) {
        if (e == null) return null;
        return RespuestaPregunta.builder()
                .id(e.getId())
                .encuestaId(e.getEncuestaId())
                .preguntaId(e.getPreguntaId())
                .valor(e.getValor())
                .textoRespuesta(e.getTextoRespuesta())
                .sentimiento(e.getSentimiento() != null ? Sentimiento.valueOf(e.getSentimiento()) : null)
                .sentimientoScore(e.getSentimientoScore())
                .sentimientoMetodo(e.getSentimientoMetodo() != null
                        ? MetodoSentimiento.valueOf(e.getSentimientoMetodo()) : null)
                .build();
    }

    public static RespuestaPreguntaEntity toEntity(RespuestaPregunta d) {
        if (d == null) return null;
        return RespuestaPreguntaEntity.builder()
                .id(d.getId())
                .encuestaId(d.getEncuestaId())
                .preguntaId(d.getPreguntaId())
                .valor(d.getValor())
                .textoRespuesta(d.getTextoRespuesta())
                .sentimiento(d.getSentimiento() != null ? d.getSentimiento().name() : null)
                .sentimientoScore(d.getSentimientoScore())
                .sentimientoMetodo(d.getSentimientoMetodo() != null ? d.getSentimientoMetodo().name() : null)
                .build();
    }
}
