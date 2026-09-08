package com.academicore.admisiones.infrastructure.persistence.mapper;

import com.academicore.admisiones.domain.model.Aspirante;
import com.academicore.admisiones.domain.model.DocumentoAspirante;
import com.academicore.admisiones.domain.model.EstadoAspirante;
import com.academicore.admisiones.domain.model.EstadoInscripcion;
import com.academicore.admisiones.domain.model.Inscripcion;
import com.academicore.admisiones.infrastructure.persistence.entity.AspiranteEntity;
import com.academicore.admisiones.infrastructure.persistence.entity.DocumentoAspiranteEntity;
import com.academicore.admisiones.infrastructure.persistence.entity.InscripcionEntity;

import java.time.LocalDateTime;

public final class AdmisionesMapper {

    private AdmisionesMapper() {}

    public static Aspirante toDomain(AspiranteEntity e) {
        if (e == null) return null;
        return Aspirante.builder()
                .id(e.getId())
                .tipoDocumento(e.getTipoDocumento())
                .numeroDocumento(e.getNumeroDocumento())
                .nombres(e.getNombres())
                .apellidos(e.getApellidos())
                .email(e.getEmail())
                .telefono(e.getTelefono())
                .fechaNacimiento(e.getFechaNacimiento())
                .fechaRegistro(e.getFechaRegistro())
                .estado(EstadoAspirante.valueOf(e.getEstado()))
                .build();
    }

    public static AspiranteEntity toEntity(Aspirante d) {
        if (d == null) return null;
        return AspiranteEntity.builder()
                .id(d.getId())
                .tipoDocumento(d.getTipoDocumento())
                .numeroDocumento(d.getNumeroDocumento())
                .nombres(d.getNombres())
                .apellidos(d.getApellidos())
                .email(d.getEmail())
                .telefono(d.getTelefono())
                .fechaNacimiento(d.getFechaNacimiento())
                .fechaRegistro(d.getFechaRegistro() != null ? d.getFechaRegistro() : LocalDateTime.now())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoAspirante.REGISTRADO.name())
                .build();
    }

    public static Inscripcion toDomain(InscripcionEntity e) {
        if (e == null) return null;
        return Inscripcion.builder()
                .id(e.getId())
                .aspiranteId(e.getAspiranteId())
                .ofertaAdmisionId(e.getOfertaAdmisionId())
                .fechaInscripcion(e.getFechaInscripcion())
                .estado(EstadoInscripcion.valueOf(e.getEstado()))
                .observaciones(e.getObservaciones())
                .build();
    }

    public static InscripcionEntity toEntity(Inscripcion d) {
        if (d == null) return null;
        return InscripcionEntity.builder()
                .id(d.getId())
                .aspiranteId(d.getAspiranteId())
                .ofertaAdmisionId(d.getOfertaAdmisionId())
                .fechaInscripcion(d.getFechaInscripcion() != null ? d.getFechaInscripcion() : LocalDateTime.now())
                .estado(d.getEstado() != null ? d.getEstado().name() : EstadoInscripcion.PENDIENTE_PAGO.name())
                .observaciones(d.getObservaciones())
                .build();
    }

    public static DocumentoAspirante toDomain(DocumentoAspiranteEntity e) {
        if (e == null) return null;
        return DocumentoAspirante.builder()
                .id(e.getId())
                .inscripcionId(e.getInscripcionId())
                .tipoDocumento(e.getTipoDocumento())
                .url(e.getUrl())
                .fechaCarga(e.getFechaCarga())
                .estado(e.getEstado())
                .build();
    }

    public static DocumentoAspiranteEntity toEntity(DocumentoAspirante d) {
        if (d == null) return null;
        return DocumentoAspiranteEntity.builder()
                .id(d.getId())
                .inscripcionId(d.getInscripcionId())
                .tipoDocumento(d.getTipoDocumento())
                .url(d.getUrl())
                .fechaCarga(d.getFechaCarga() != null ? d.getFechaCarga() : LocalDateTime.now())
                .estado(d.getEstado() != null ? d.getEstado() : "CARGADO")
                .build();
    }
}
