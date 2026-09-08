package com.academicore.admisiones.application.usecase;

import com.academicore.admisiones.application.dto.ResultadoInscripcionResponse;
import com.academicore.admisiones.domain.model.Aspirante;
import com.academicore.admisiones.domain.model.Inscripcion;
import com.academicore.admisiones.domain.model.OfertaAdmision;
import com.academicore.admisiones.domain.repository.AspiranteRepository;
import com.academicore.admisiones.domain.repository.InscripcionRepository;
import com.academicore.admisiones.domain.repository.OfertaAdmisionRepository;
import com.academicore.campus.domain.model.Campus;
import com.academicore.campus.domain.repository.CampusRepository;
import com.academicore.pensum.domain.exception.NotFoundException;
import com.academicore.pensum.domain.model.ProgramaAcademico;
import com.academicore.pensum.domain.repository.ProgramaAcademicoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ResultadosInscripcionUseCase {

    private final AspiranteRepository aspiranteRepository;
    private final InscripcionRepository inscripcionRepository;
    private final OfertaAdmisionRepository ofertaRepository;
    private final ProgramaAcademicoRepository programaRepository;
    private final CampusRepository campusRepository;

    @Transactional(readOnly = true)
    public List<ResultadoInscripcionResponse> consultarPorDocumento(String tipoDocumento, String numeroDocumento) {
        Aspirante aspirante = aspiranteRepository
                .findByTipoDocumentoAndNumeroDocumento(tipoDocumento, numeroDocumento)
                .orElseThrow(() -> new NotFoundException("Aspirante", "documento", numeroDocumento));

        List<Inscripcion> inscripciones = inscripcionRepository.findByAspiranteId(aspirante.getId());

        return inscripciones.stream().map(insc -> {
            OfertaAdmision oferta = ofertaRepository.findById(insc.getOfertaAdmisionId()).orElse(null);
            String programaNombre = null;
            String campusNombre = null;
            if (oferta != null) {
                programaNombre = programaRepository.findById(oferta.getProgramaId())
                        .map(ProgramaAcademico::getNombre).orElse(null);
                campusNombre = campusRepository.findById(oferta.getCampusId())
                        .map(Campus::getNombre).orElse(null);
            }
            return ResultadoInscripcionResponse.builder()
                    .inscripcionId(insc.getId())
                    .programaNombre(programaNombre)
                    .campusNombre(campusNombre)
                    .estado(insc.getEstado() != null ? insc.getEstado().name() : null)
                    .fechaInscripcion(insc.getFechaInscripcion())
                    .observaciones(insc.getObservaciones())
                    .build();
        }).toList();
    }
}
