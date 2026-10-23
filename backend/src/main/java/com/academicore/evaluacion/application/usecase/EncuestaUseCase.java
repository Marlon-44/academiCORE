package com.academicore.evaluacion.application.usecase;

import com.academicore.evaluacion.application.dto.EncuestaResponse;
import com.academicore.evaluacion.application.dto.RegistrarEncuestaRequest;
import com.academicore.evaluacion.domain.model.Encuesta;
import com.academicore.evaluacion.domain.model.EscalaValoracion;
import com.academicore.evaluacion.domain.model.Estudiante;
import com.academicore.evaluacion.domain.model.EstadoEvaluacion;
import com.academicore.evaluacion.domain.model.EvaluacionDocente;
import com.academicore.evaluacion.domain.model.MetodoSentimiento;
import com.academicore.evaluacion.domain.model.PreguntaEvaluacion;
import com.academicore.evaluacion.domain.model.RespuestaPregunta;
import com.academicore.evaluacion.domain.model.Sentimiento;
import com.academicore.evaluacion.domain.model.TipoPregunta;
import com.academicore.evaluacion.domain.repository.EncuestaRepository;
import com.academicore.evaluacion.domain.repository.EstudianteRepository;
import com.academicore.evaluacion.domain.repository.EvaluacionDocenteRepository;
import com.academicore.evaluacion.domain.repository.InscripcionEvaluacionRepository;
import com.academicore.evaluacion.domain.repository.PreguntaEvaluacionRepository;
import com.academicore.evaluacion.domain.repository.SentimentAnalysisPort;
import com.academicore.pensum.domain.exception.BusinessException;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class EncuestaUseCase {

    private final EncuestaRepository encuestaRepository;
    private final EvaluacionDocenteRepository evaluacionRepository;
    private final PreguntaEvaluacionRepository preguntaRepository;
    private final EstudianteRepository estudianteRepository;
    private final InscripcionEvaluacionRepository inscripcionRepository;
    private final SentimentAnalysisPort sentimentAnalysisPort;

    @Transactional
    public EncuestaResponse registrar(RegistrarEncuestaRequest request) {
        EvaluacionDocente evaluacion = evaluacionRepository.findById(request.getEvaluacionId())
                .orElseThrow(() -> new NotFoundException("EvaluacionDocente", request.getEvaluacionId()));
        if (evaluacion.getEstado() != EstadoEvaluacion.ABIERTA) {
            throw new BusinessException("EVALUACION_NO_ABIERTA",
                    "La evaluación no está abierta, no se pueden registrar encuestas");
        }

        Estudiante estudiante = validarEstudiante(request.getEstudianteId(), evaluacion.getId());

        Map<Long, PreguntaEvaluacion> activas = preguntaRepository.findAllActivas().stream()
                .collect(Collectors.toMap(PreguntaEvaluacion::getId, Function.identity()));

        validarRespuestas(request.getRespuestas(), activas);

        List<RespuestaPregunta> respuestas = request.getRespuestas().stream()
                .map(r -> construirRespuesta(r, activas.get(r.getPreguntaId())))
                .toList();

        Encuesta encuesta = Encuesta.builder()
                .evaluacionId(evaluacion.getId())
                .estudianteId(estudiante != null ? estudiante.getId() : null)
                .fechaRespuesta(LocalDateTime.now())
                .respuestas(respuestas)
                .build();
        Encuesta guardada = encuestaRepository.save(encuesta);

        return toResponse(guardada, activas, estudiante);
    }

    @Transactional(readOnly = true)
    public EncuestaResponse consultar(Long id) {
        Encuesta encuesta = encuestaRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Encuesta", id));
        return toResponse(encuesta, preguntasById(), estudianteDe(encuesta));
    }

    @Transactional(readOnly = true)
    public List<EncuestaResponse> listarPorEvaluacion(Long evaluacionId) {
        Map<Long, PreguntaEvaluacion> preguntas = preguntasById();
        List<Encuesta> encuestas = encuestaRepository.findByEvaluacionId(evaluacionId);
        Map<Long, Estudiante> estudiantes = estudiantesDe(encuestas);
        return encuestas.stream()
                .map(e -> toResponse(e, preguntas, estudiantes.get(e.getEstudianteId())))
                .toList();
    }

    @Transactional(readOnly = true)
    public List<EncuestaResponse> listarPorEstudiante(Long estudianteId) {
        Estudiante estudiante = estudianteRepository.findById(estudianteId)
                .orElseThrow(() -> new NotFoundException("Estudiante", estudianteId));
        Map<Long, PreguntaEvaluacion> preguntas = preguntasById();
        return encuestaRepository.findByEstudianteId(estudianteId).stream()
                .map(e -> toResponse(e, preguntas, estudiante))
                .toList();
    }

    private Estudiante validarEstudiante(Long estudianteId, Long evaluacionId) {
        if (estudianteId == null) {
            return null;
        }
        Estudiante estudiante = estudianteRepository.findById(estudianteId)
                .orElseThrow(() -> new NotFoundException("Estudiante", estudianteId));
        if (!inscripcionRepository.existsByEvaluacionIdAndEstudianteId(evaluacionId, estudianteId)) {
            throw new BusinessException("ESTUDIANTE_NO_INSCRITO",
                    "El estudiante " + estudianteId + " no está inscrito en esta evaluación");
        }
        if (encuestaRepository.existsByEvaluacionIdAndEstudianteId(evaluacionId, estudianteId)) {
            throw new ConflictException(
                    "El estudiante ya respondió la encuesta de esta evaluación");
        }
        return estudiante;
    }

    private void validarRespuestas(List<RegistrarEncuestaRequest.RespuestaRequest> respuestas,
                                   Map<Long, PreguntaEvaluacion> activas) {
        Set<Long> preguntaIds = respuestas.stream()
                .map(RegistrarEncuestaRequest.RespuestaRequest::getPreguntaId)
                .collect(Collectors.toSet());
        if (preguntaIds.size() != respuestas.size()) {
            throw new BusinessException("RESPUESTA_DUPLICADA",
                    "La encuesta contiene respuestas duplicadas para la misma pregunta");
        }
        for (RegistrarEncuestaRequest.RespuestaRequest r : respuestas) {
            PreguntaEvaluacion pregunta = activas.get(r.getPreguntaId());
            if (pregunta == null) {
                throw new BusinessException("PREGUNTA_INVALIDA",
                        "La pregunta " + r.getPreguntaId() + " no existe o no está activa");
            }
            if (pregunta.getTipo() == TipoPregunta.LIKERT) {
                if (r.getValor() == null || r.getValor() < 1 || r.getValor() > 5) {
                    throw new BusinessException("VALOR_REQUERIDO",
                            "La pregunta " + pregunta.getNumero()
                                    + " es de escala 1-5 y requiere un valor numérico en ese rango");
                }
            } else {
                if (r.getTextoRespuesta() == null || r.getTextoRespuesta().isBlank()) {
                    throw new BusinessException("TEXTO_REQUERIDO",
                            "La pregunta " + pregunta.getNumero()
                                    + " es de texto abierto y requiere una respuesta escrita");
                }
            }
        }
        for (PreguntaEvaluacion activa : activas.values()) {
            if (!preguntaIds.contains(activa.getId())) {
                throw new BusinessException("RESPUESTA_FALTANTE",
                        "Falta la respuesta para la pregunta " + activa.getNumero());
            }
        }
    }

    private RespuestaPregunta construirRespuesta(RegistrarEncuestaRequest.RespuestaRequest request,
                                                 PreguntaEvaluacion pregunta) {
        RespuestaPregunta.RespuestaPreguntaBuilder builder = RespuestaPregunta.builder()
                .preguntaId(pregunta.getId());
        if (pregunta.getTipo() == TipoPregunta.LIKERT) {
            builder.valor(request.getValor());
        } else {
            String texto = request.getTextoRespuesta().trim();
            SentimentAnalysisPort.SentimentResult resultado = sentimentAnalysisPort.analizar(texto);
            builder.textoRespuesta(texto)
                    .sentimiento(resultado.sentimiento() != null
                            ? Sentimiento.valueOf(resultado.sentimiento()) : null)
                    .sentimientoScore(resultado.score())
                    .sentimientoMetodo(resultado.metodo() != null
                            ? MetodoSentimiento.valueOf(resultado.metodo()) : null);
        }
        return builder.build();
    }

    private Map<Long, PreguntaEvaluacion> preguntasById() {
        return preguntaRepository.findAll().stream()
                .collect(Collectors.toMap(PreguntaEvaluacion::getId, Function.identity()));
    }

    private Estudiante estudianteDe(Encuesta encuesta) {
        return encuesta.getEstudianteId() != null
                ? estudianteRepository.findById(encuesta.getEstudianteId()).orElse(null)
                : null;
    }

    private Map<Long, Estudiante> estudiantesDe(List<Encuesta> encuestas) {
        List<Long> ids = encuestas.stream()
                .map(Encuesta::getEstudianteId)
                .filter(id -> id != null)
                .distinct()
                .toList();
        return estudianteRepository.findAllById(ids).stream()
                .collect(Collectors.toMap(Estudiante::getId, Function.identity()));
    }

    private EncuestaResponse toResponse(Encuesta e, Map<Long, PreguntaEvaluacion> preguntas,
                                        Estudiante estudiante) {
        List<RespuestaPregunta> respuestas = e.getRespuestas() != null ? e.getRespuestas() : List.of();
        double promedio = respuestas.stream()
                .filter(r -> r.getValor() != null)
                .mapToInt(RespuestaPregunta::getValor)
                .average().orElse(0.0);
        return EncuestaResponse.builder()
                .id(e.getId())
                .evaluacionId(e.getEvaluacionId())
                .estudianteId(e.getEstudianteId())
                .estudianteNombre(estudiante != null ? estudiante.getNombreCompleto() : null)
                .estudianteDocumento(estudiante != null ? estudiante.getNumeroDocumento() : null)
                .fechaRespuesta(e.getFechaRespuesta())
                .promedio(Math.round(promedio * 100.0) / 100.0)
                .valoracion(EscalaValoracion.fromPromedio(promedio).getEtiqueta())
                .respuestas(respuestas.stream()
                        .sorted((a, b) -> Integer.compare(
                                numeroDe(preguntas, a.getPreguntaId()),
                                numeroDe(preguntas, b.getPreguntaId())))
                        .map(r -> EncuestaResponse.RespuestaItem.builder()
                                .preguntaId(r.getPreguntaId())
                                .valor(r.getValor())
                                .textoRespuesta(r.getTextoRespuesta())
                                .sentimiento(r.getSentimiento() != null ? r.getSentimiento().name() : null)
                                .sentimientoScore(r.getSentimientoScore())
                                .sentimientoMetodo(r.getSentimientoMetodo() != null ? r.getSentimientoMetodo().name() : null)
                                .build())
                        .toList())
                .build();
    }

    private int numeroDe(Map<Long, PreguntaEvaluacion> preguntas, Long preguntaId) {
        PreguntaEvaluacion p = preguntas.get(preguntaId);
        return p != null && p.getNumero() != null ? p.getNumero() : Integer.MAX_VALUE;
    }
}
