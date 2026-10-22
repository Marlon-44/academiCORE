package com.academicore.evaluacion.application.usecase;

import com.academicore.evaluacion.application.dto.ActualizarPreguntaRequest;
import com.academicore.evaluacion.application.dto.CategoriaPreguntaResponse;
import com.academicore.evaluacion.application.dto.CrearCategoriaRequest;
import com.academicore.evaluacion.application.dto.CrearPreguntaRequest;
import com.academicore.evaluacion.application.dto.PreguntaResponse;
import com.academicore.evaluacion.domain.model.CategoriaPregunta;
import com.academicore.evaluacion.domain.model.PreguntaEvaluacion;
import com.academicore.evaluacion.domain.model.TipoPregunta;
import com.academicore.evaluacion.domain.repository.CategoriaPreguntaRepository;
import com.academicore.evaluacion.domain.repository.PreguntaEvaluacionRepository;
import com.academicore.pensum.domain.exception.BusinessException;
import com.academicore.pensum.domain.exception.ConflictException;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Locale;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class CatalogoEvaluacionUseCase {

    private static final Set<String> ESTADOS_PREGUNTA = Set.of("ACTIVA", "INACTIVA");

    private final PreguntaEvaluacionRepository preguntaRepository;
    private final CategoriaPreguntaRepository categoriaRepository;

    @Transactional(readOnly = true)
    public List<PreguntaResponse> listarPreguntas(boolean soloActivas) {
        List<PreguntaEvaluacion> preguntas = soloActivas
                ? preguntaRepository.findAllActivas()
                : preguntaRepository.findAll();
        return preguntas.stream().map(this::toPreguntaResponse).toList();
    }

    @Transactional(readOnly = true)
    public List<CategoriaPreguntaResponse> listarCategorias() {
        return categoriaRepository.findAll().stream()
                .map(c -> CategoriaPreguntaResponse.builder()
                        .id(c.getId())
                        .codigo(c.getCodigo())
                        .nombre(c.getNombre())
                        .orden(c.getOrden())
                        .totalPreguntas(categoriaRepository.countPreguntas(c.getId()))
                        .build())
                .toList();
    }

    @Transactional
    public PreguntaResponse crearPregunta(CrearPreguntaRequest request) {
        CategoriaPregunta categoria = categoriaRepository.findByCodigo(normalizar(request.getCategoriaCodigo()))
                .orElseThrow(() -> new NotFoundException("CategoriaPregunta", "codigo",
                        normalizar(request.getCategoriaCodigo())));
        TipoPregunta tipo = parsearTipo(request.getTipo());

        Integer numero = request.getNumero() != null
                ? request.getNumero()
                : preguntaRepository.findMaxNumero().map(n -> n + 1).orElse(1);
        if (preguntaRepository.existsByNumero(numero)) {
            throw new ConflictException("Ya existe una pregunta con el número " + numero);
        }

        PreguntaEvaluacion guardada = preguntaRepository.save(PreguntaEvaluacion.builder()
                .categoriaId(categoria.getId())
                .numero(numero)
                .texto(request.getTexto().trim())
                .tipo(tipo)
                .estado("ACTIVA")
                .build());
        return toPreguntaResponse(guardada);
    }

    @Transactional
    public PreguntaResponse actualizarPregunta(Long id, ActualizarPreguntaRequest request) {
        PreguntaEvaluacion pregunta = buscarPregunta(id);

        if (request.getTexto() != null) {
            if (request.getTexto().isBlank() || request.getTexto().length() > 300) {
                throw new BusinessException("TEXTO_INVALIDO",
                        "El texto de la pregunta es obligatorio y máximo 300 caracteres");
            }
            pregunta.setTexto(request.getTexto().trim());
        }
        if (request.getNumero() != null && !request.getNumero().equals(pregunta.getNumero())) {
            if (preguntaRepository.existsByNumeroAndIdNot(request.getNumero(), id)) {
                throw new ConflictException("Ya existe otra pregunta con el número " + request.getNumero());
            }
            pregunta.setNumero(request.getNumero());
        }
        if (request.getCategoriaCodigo() != null) {
            CategoriaPregunta categoria = categoriaRepository.findByCodigo(normalizar(request.getCategoriaCodigo()))
                    .orElseThrow(() -> new NotFoundException("CategoriaPregunta", "codigo",
                            normalizar(request.getCategoriaCodigo())));
            pregunta.setCategoriaId(categoria.getId());
        }
        if (request.getTipo() != null) {
            TipoPregunta tipo = parsearTipo(request.getTipo());
            if (tipo != pregunta.getTipo() && preguntaRepository.countRespuestas(id) > 0) {
                throw new ConflictException(
                        "No se puede cambiar el tipo: la pregunta ya tiene respuestas registradas");
            }
            pregunta.setTipo(tipo);
        }

        return toPreguntaResponse(preguntaRepository.save(pregunta));
    }

    @Transactional
    public PreguntaResponse cambiarEstadoPregunta(Long id, String estado) {
        String normalizado = normalizar(estado);
        if (!ESTADOS_PREGUNTA.contains(normalizado)) {
            throw new BusinessException("ESTADO_INVALIDO",
                    "Estado inválido. Use ACTIVA o INACTIVA");
        }
        PreguntaEvaluacion pregunta = buscarPregunta(id);
        pregunta.setEstado(normalizado);
        return toPreguntaResponse(preguntaRepository.save(pregunta));
    }

    @Transactional
    public void eliminarPregunta(Long id) {
        buscarPregunta(id);
        if (preguntaRepository.countRespuestas(id) > 0) {
            throw new ConflictException(
                    "La pregunta tiene respuestas registradas: se recomienda inactivarla en lugar de eliminarla");
        }
        preguntaRepository.deleteById(id);
    }

    @Transactional
    public CategoriaPreguntaResponse crearCategoria(CrearCategoriaRequest request) {
        String codigo = normalizar(request.getCodigo());
        if (categoriaRepository.existsByCodigo(codigo)) {
            throw new ConflictException("Ya existe una categoría con el código " + codigo);
        }
        int siguienteOrden = categoriaRepository.findAll().stream()
                .map(CategoriaPregunta::getOrden)
                .filter(o -> o != null)
                .mapToInt(Integer::intValue)
                .max().orElse(0) + 1;

        CategoriaPregunta guardada = categoriaRepository.save(CategoriaPregunta.builder()
                .codigo(codigo)
                .nombre(request.getNombre().trim())
                .orden(siguienteOrden)
                .build());
        return CategoriaPreguntaResponse.builder()
                .id(guardada.getId())
                .codigo(guardada.getCodigo())
                .nombre(guardada.getNombre())
                .orden(guardada.getOrden())
                .totalPreguntas(0)
                .build();
    }

    private PreguntaEvaluacion buscarPregunta(Long id) {
        return preguntaRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("PreguntaEvaluacion", id));
    }

    private TipoPregunta parsearTipo(String raw) {
        if (raw == null || raw.isBlank()) return TipoPregunta.LIKERT;
        try {
            return TipoPregunta.valueOf(normalizar(raw));
        } catch (IllegalArgumentException ex) {
            throw new BusinessException("TIPO_INVALIDO",
                    "Tipo de pregunta inválido. Use LIKERT o TEXTO");
        }
    }

    private String normalizar(String valor) {
        return valor == null ? "" : valor.trim().toUpperCase(Locale.ROOT);
    }

    private PreguntaResponse toPreguntaResponse(PreguntaEvaluacion p) {
        return PreguntaResponse.builder()
                .id(p.getId())
                .numero(p.getNumero())
                .texto(p.getTexto())
                .tipo(p.getTipo() != null ? p.getTipo().name() : null)
                .categoriaCodigo(p.getCategoriaCodigo())
                .categoriaNombre(p.getCategoriaNombre())
                .estado(p.getEstado())
                .build();
    }
}
