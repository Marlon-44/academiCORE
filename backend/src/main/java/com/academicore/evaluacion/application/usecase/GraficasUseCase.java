package com.academicore.evaluacion.application.usecase;

import com.academicore.evaluacion.application.dto.ChartSerie;
import com.academicore.evaluacion.application.dto.DocenteGraficasResponse;
import com.academicore.evaluacion.application.dto.DocenteReporteResponse;
import com.academicore.evaluacion.application.dto.EncuestaGraficaResponse;
import com.academicore.evaluacion.application.dto.EvaluacionGraficasResponse;
import com.academicore.evaluacion.application.dto.WordCloudItem;
import com.academicore.evaluacion.domain.model.Docente;
import com.academicore.evaluacion.domain.model.Encuesta;
import com.academicore.evaluacion.domain.model.EscalaValoracion;
import com.academicore.evaluacion.domain.model.EvaluacionDocente;
import com.academicore.evaluacion.domain.model.PreguntaEvaluacion;
import com.academicore.evaluacion.domain.model.RespuestaPregunta;
import com.academicore.evaluacion.domain.model.Sentimiento;
import com.academicore.evaluacion.domain.model.TipoPregunta;
import com.academicore.evaluacion.domain.repository.AsignaturaCatalogPort;
import com.academicore.evaluacion.domain.repository.DocenteRepository;
import com.academicore.evaluacion.domain.repository.EncuestaRepository;
import com.academicore.evaluacion.domain.repository.EvaluacionDocenteRepository;
import com.academicore.evaluacion.domain.repository.PreguntaEvaluacionRepository;
import com.academicore.pensum.domain.exception.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class GraficasUseCase {

    private static final int WORD_CLOUD_TOP = 20;
    private static final Set<String> STOPWORDS = Set.of(
            "a", "al", "algo", "ante", "antes", "como", "con", "contra", "cual", "cuando",
            "de", "del", "desde", "donde", "dos", "durante", "e", "el", "ella", "ellas",
            "ellos", "en", "entre", "era", "eran", "es", "esa", "esas", "ese", "eso",
            "esos", "esta", "estan", "estar", "estas", "este", "esto", "estos", "estoy",
            "fue", "fueron", "ha", "han", "hasta", "hay", "la", "las", "le", "les", "lo",
            "los", "mas", "me", "mi", "mis", "mucho", "muy", "nada", "ni", "no", "nos",
            "nosotros", "o", "otra", "otras", "otro", "otros", "para", "pero", "poco",
            "por", "porque", "que", "quien", "quienes", "se", "ser", "si", "sin", "sobre",
            "son", "su", "sus", "tambien", "te", "tiene", "tienen", "todo", "todos", "tu",
            "tus", "un", "una", "uno", "unos", "ya", "yo",
            "docente", "profesor", "profesora", "maestro", "clase", "clases", "materia",
            "curso", "asignatura", "universidad", "estudiante", "estudiantes", "siempre");

    private final EncuestaRepository encuestaRepository;
    private final EvaluacionDocenteRepository evaluacionRepository;
    private final DocenteRepository docenteRepository;
    private final PreguntaEvaluacionRepository preguntaRepository;
    private final AsignaturaCatalogPort asignaturaCatalog;

    // ============================================================
    // 1. Gráfica de UNA encuesta
    // ============================================================
    @Transactional(readOnly = true)
    public EncuestaGraficaResponse graficaEncuesta(Long encuestaId) {
        Encuesta encuesta = encuestaRepository.findById(encuestaId)
                .orElseThrow(() -> new NotFoundException("Encuesta", "id", encuestaId));
        Map<Long, PreguntaEvaluacion> preguntas = preguntasById();

        List<EncuestaGraficaResponse.BarraPregunta> barras = encuesta.getRespuestas().stream()
                .filter(r -> r.getValor() != null)
                .map(r -> {
                    PreguntaEvaluacion p = preguntas.get(r.getPreguntaId());
                    return EncuestaGraficaResponse.BarraPregunta.builder()
                            .preguntaId(r.getPreguntaId())
                            .numero(p != null ? p.getNumero() : null)
                            .texto(p != null ? p.getTexto() : null)
                            .categoria(p != null ? p.getCategoriaCodigo() : null)
                            .valor(r.getValor())
                            .build();
                })
                .sorted(Comparator.comparing(EncuestaGraficaResponse.BarraPregunta::getNumero,
                        Comparator.nullsLast(Comparator.naturalOrder())))
                .toList();

        List<EncuestaGraficaResponse.RespuestaTextoItem> respuestasTexto = encuesta.getRespuestas().stream()
                .filter(r -> r.getTextoRespuesta() != null && !r.getTextoRespuesta().isBlank())
                .map(r -> {
                    PreguntaEvaluacion p = preguntas.get(r.getPreguntaId());
                    return EncuestaGraficaResponse.RespuestaTextoItem.builder()
                            .numero(p != null ? p.getNumero() : null)
                            .pregunta(p != null ? p.getTexto() : null)
                            .texto(r.getTextoRespuesta())
                            .sentimiento(r.getSentimiento() != null ? r.getSentimiento().name() : null)
                            .sentimientoScore(r.getSentimientoScore())
                            .sentimientoMetodo(r.getSentimientoMetodo() != null
                                    ? r.getSentimientoMetodo().name() : null)
                            .build();
                })
                .sorted(Comparator.comparing(EncuestaGraficaResponse.RespuestaTextoItem::getNumero,
                        Comparator.nullsLast(Comparator.naturalOrder())))
                .toList();

        double promedio = promedioEncuesta(encuesta);

        return EncuestaGraficaResponse.builder()
                .encuestaId(encuesta.getId())
                .evaluacionId(encuesta.getEvaluacionId())
                .fechaRespuesta(encuesta.getFechaRespuesta())
                .promedioGeneral(round2(promedio))
                .valoracion(EscalaValoracion.fromPromedio(promedio).getEtiqueta())
                .radarCategorias(radarCategorias(List.of(encuesta), preguntas))
                .barrasPreguntas(barras)
                .respuestasTexto(respuestasTexto)
                .build();
    }

    // ============================================================
    // 2. Gráficas agregadas de UNA evaluación (docente+materia+grupo+periodo)
    // ============================================================
    @Transactional(readOnly = true)
    public EvaluacionGraficasResponse graficasEvaluacion(Long evaluacionId) {
        EvaluacionDocente evaluacion = evaluacionRepository.findById(evaluacionId)
                .orElseThrow(() -> new NotFoundException("EvaluacionDocente", "id", evaluacionId));
        List<Encuesta> encuestas = encuestaRepository.findByEvaluacionId(evaluacionId);
        Map<Long, PreguntaEvaluacion> preguntas = preguntasById();

        String docenteNombre = docenteRepository.findById(evaluacion.getDocenteId())
                .map(Docente::getNombreCompleto).orElse(null);
        AsignaturaCatalogPort.AsignaturaInfo asignatura =
                asignaturaCatalog.findById(evaluacion.getAsignaturaId()).orElse(null);

        double promedio = promedioGlobal(encuestas);

        // Barras apiladas: distribución 1-5 por pregunta
        List<EvaluacionGraficasResponse.DistribucionPregunta> porPregunta = new ArrayList<>();
        Map<Long, long[]> conteosPorPregunta = new HashMap<>();
        for (Encuesta e : encuestas) {
            for (RespuestaPregunta r : e.getRespuestas()) {
                if (r.getValor() != null) {
                    conteosPorPregunta.computeIfAbsent(r.getPreguntaId(), k -> new long[5]);
                    conteosPorPregunta.get(r.getPreguntaId())[r.getValor() - 1]++;
                }
            }
        }
        preguntas.values().stream()
                .filter(p -> p.getTipo() == TipoPregunta.LIKERT)
                .sorted(Comparator.comparing(PreguntaEvaluacion::getNumero))
                .forEach(p -> {
                    long[] conteos = conteosPorPregunta.getOrDefault(p.getId(), new long[5]);
                    List<Double> dist = new ArrayList<>(5);
                    for (long c : conteos) dist.add((double) c);
                    porPregunta.add(EvaluacionGraficasResponse.DistribucionPregunta.builder()
                            .numero(p.getNumero())
                            .texto(p.getTexto())
                            .categoria(p.getCategoriaCodigo())
                            .distribucion(dist)
                            .build());
                });

        // Barras: promedio por pregunta
        List<String> labelsPreguntas = new ArrayList<>();
        List<Double> promediosPreguntas = new ArrayList<>();
        for (EvaluacionGraficasResponse.DistribucionPregunta dp : porPregunta) {
            labelsPreguntas.add("P" + dp.getNumero());
            double suma = 0, total = 0;
            for (int i = 0; i < 5; i++) {
                suma += dp.getDistribucion().get(i) * (i + 1);
                total += dp.getDistribucion().get(i);
            }
            promediosPreguntas.add(total > 0 ? round2(suma / total) : 0.0);
        }

        long respondidas = encuestas.size();
        Integer esperados = evaluacion.getEstudiantesEsperados();

        return EvaluacionGraficasResponse.builder()
                .evaluacionId(evaluacion.getId())
                .docenteId(evaluacion.getDocenteId())
                .docenteNombre(docenteNombre)
                .asignaturaId(evaluacion.getAsignaturaId())
                .asignaturaCodigo(asignatura != null ? asignatura.codigo() : null)
                .asignaturaNombre(asignatura != null ? asignatura.nombre() : null)
                .grupo(evaluacion.getGrupo())
                .periodo(evaluacion.getPeriodo())
                .participacion(EvaluacionGraficasResponse.ParticipacionInfo.builder()
                        .esperados(esperados)
                        .respondidas(respondidas)
                        .porcentaje(esperados != null && esperados > 0
                                ? round2(respondidas * 100.0 / esperados) : null)
                        .build())
                .promedioGeneral(round2(promedio))
                .valoracion(EscalaValoracion.fromPromedio(promedio).getEtiqueta())
                .radarCategorias(radarCategorias(encuestas, preguntas))
                .barrasPromedioPreguntas(ChartSerie.builder()
                        .labels(labelsPreguntas).valores(promediosPreguntas).build())
                .distribucionLikert(distribucionLikert(encuestas))
                .distribucionPorPregunta(porPregunta)
                .sentimientos(sentimientosChart(encuestas))
                .promedioSentimiento(promedioSentimiento(encuestas))
                .wordCloud(wordCloud(encuestas))
                .comentariosDestacados(comentariosDestacados(encuestas))
                .build();
    }

    // ============================================================
    // 3. Gráficas globales de un docente (todas o una materia)
    // ============================================================
    @Transactional(readOnly = true)
    public DocenteGraficasResponse graficasDocente(Long docenteId, Long asignaturaId) {
        Docente docente = docenteRepository.findById(docenteId)
                .orElseThrow(() -> new NotFoundException("Docente", "id", docenteId));

        List<EvaluacionDocente> evaluaciones = asignaturaId != null
                ? evaluacionRepository.findByDocenteIdAndAsignaturaId(docenteId, asignaturaId)
                : evaluacionRepository.findByDocenteId(docenteId);

        List<Long> evaluacionIds = evaluaciones.stream().map(EvaluacionDocente::getId).toList();
        List<Encuesta> encuestas = encuestaRepository.findByEvaluacionIdIn(evaluacionIds);
        Map<Long, List<Encuesta>> porEvaluacion = encuestas.stream()
                .collect(Collectors.groupingBy(Encuesta::getEvaluacionId));

        Map<Long, PreguntaEvaluacion> preguntas = preguntasById();
        Map<Long, AsignaturaCatalogPort.AsignaturaInfo> asignaturas = asignaturaCatalog.findByIds(
                evaluaciones.stream().map(EvaluacionDocente::getAsignaturaId).distinct().toList());

        // Comparativo por evaluación (materia/grupo/periodo)
        List<DocenteGraficasResponse.ComparativoItem> comparativo = evaluaciones.stream()
                .map(ev -> {
                    List<Encuesta> delGrupo = porEvaluacion.getOrDefault(ev.getId(), List.of());
                    AsignaturaCatalogPort.AsignaturaInfo info = asignaturas.get(ev.getAsignaturaId());
                    return DocenteGraficasResponse.ComparativoItem.builder()
                            .evaluacionId(ev.getId())
                            .asignaturaId(ev.getAsignaturaId())
                            .asignaturaCodigo(info != null ? info.codigo() : null)
                            .asignaturaNombre(info != null ? info.nombre() : null)
                            .grupo(ev.getGrupo())
                            .periodo(ev.getPeriodo())
                            .promedio(round2(promedioGlobal(delGrupo)))
                            .respondidas(delGrupo.size())
                            .build();
                })
                .toList();

        // Evolución por periodo
        Map<String, List<Encuesta>> porPeriodo = new HashMap<>();
        for (EvaluacionDocente ev : evaluaciones) {
            porPeriodo.computeIfAbsent(ev.getPeriodo(), k -> new ArrayList<>())
                    .addAll(porEvaluacion.getOrDefault(ev.getId(), List.of()));
        }
        List<String> periodos = porPeriodo.keySet().stream().sorted().toList();
        List<Double> promediosPorPeriodo = periodos.stream()
                .map(p -> round2(promedioGlobal(porPeriodo.get(p))))
                .toList();

        // Ranking de preguntas (promedio global por pregunta)
        Map<Long, double[]> acumPorPregunta = new HashMap<>();
        for (Encuesta e : encuestas) {
            for (RespuestaPregunta r : e.getRespuestas()) {
                if (r.getValor() != null) {
                    double[] acum = acumPorPregunta.computeIfAbsent(r.getPreguntaId(), k -> new double[2]);
                    acum[0] += r.getValor();
                    acum[1]++;
                }
            }
        }
        List<DocenteGraficasResponse.PreguntaRanking> ranking = acumPorPregunta.entrySet().stream()
                .map(entry -> {
                    PreguntaEvaluacion p = preguntas.get(entry.getKey());
                    return DocenteGraficasResponse.PreguntaRanking.builder()
                            .numero(p != null ? p.getNumero() : null)
                            .texto(p != null ? p.getTexto() : null)
                            .categoria(p != null ? p.getCategoriaCodigo() : null)
                            .promedio(round2(entry.getValue()[0] / entry.getValue()[1]))
                            .build();
                })
                .sorted(Comparator.comparing(DocenteGraficasResponse.PreguntaRanking::getPromedio,
                        Comparator.nullsLast(Comparator.reverseOrder())))
                .toList();
        List<DocenteGraficasResponse.PreguntaRanking> fortalezas = ranking.stream().limit(3).toList();
        List<DocenteGraficasResponse.PreguntaRanking> oportunidades = ranking.stream()
                .sorted(Comparator.comparing(DocenteGraficasResponse.PreguntaRanking::getPromedio,
                        Comparator.nullsLast(Comparator.naturalOrder())))
                .limit(3)
                .toList();

        double promedio = promedioGlobal(encuestas);

        return DocenteGraficasResponse.builder()
                .docenteId(docente.getId())
                .docenteNombre(docente.getNombreCompleto())
                .numeroDocumento(docente.getNumeroDocumento())
                .totalEncuestas(encuestas.size())
                .promedioGeneral(round2(promedio))
                .valoracion(EscalaValoracion.fromPromedio(promedio).getEtiqueta())
                .radarCategorias(radarCategorias(encuestas, preguntas))
                .comparativoMaterias(comparativo)
                .evolucionPeriodos(ChartSerie.builder()
                        .labels(periodos).valores(promediosPorPeriodo).build())
                .sentimientos(sentimientosChart(encuestas))
                .promedioSentimiento(promedioSentimiento(encuestas))
                .fortalezas(fortalezas)
                .oportunidades(oportunidades)
                .wordCloud(wordCloud(encuestas))
                .build();
    }

    // ============================================================
    // 4. Reporte completo del docente: TODOS los comentarios de texto
    // ============================================================
    @Transactional(readOnly = true)
    public DocenteReporteResponse reporteDocente(Long docenteId, Long asignaturaId) {
        Docente docente = docenteRepository.findById(docenteId)
                .orElseThrow(() -> new NotFoundException("Docente", "id", docenteId));

        List<EvaluacionDocente> evaluaciones = asignaturaId != null
                ? evaluacionRepository.findByDocenteIdAndAsignaturaId(docenteId, asignaturaId)
                : evaluacionRepository.findByDocenteId(docenteId);

        List<Long> evaluacionIds = evaluaciones.stream().map(EvaluacionDocente::getId).toList();
        List<Encuesta> encuestas = encuestaRepository.findByEvaluacionIdIn(evaluacionIds);
        Map<Long, List<Encuesta>> porEvaluacion = encuestas.stream()
                .collect(Collectors.groupingBy(Encuesta::getEvaluacionId));

        Map<Long, PreguntaEvaluacion> preguntas = preguntasById();
        Map<Long, AsignaturaCatalogPort.AsignaturaInfo> asignaturas = asignaturaCatalog.findByIds(
                evaluaciones.stream().map(EvaluacionDocente::getAsignaturaId).distinct().toList());

        List<DocenteReporteResponse.EvaluacionReporte> reportes = evaluaciones.stream()
                .map(ev -> {
                    List<Encuesta> delGrupo = porEvaluacion.getOrDefault(ev.getId(), List.of());
                    AsignaturaCatalogPort.AsignaturaInfo info = asignaturas.get(ev.getAsignaturaId());
                    return DocenteReporteResponse.EvaluacionReporte.builder()
                            .evaluacionId(ev.getId())
                            .asignaturaCodigo(info != null ? info.codigo() : null)
                            .asignaturaNombre(info != null ? info.nombre() : null)
                            .grupo(ev.getGrupo())
                            .periodo(ev.getPeriodo())
                            .encuestas(delGrupo.size())
                            .promedio(round2(promedioGlobal(delGrupo)))
                            .comentarios(comentariosDe(delGrupo, preguntas))
                            .build();
                })
                .toList();

        double promedio = promedioGlobal(encuestas);
        return DocenteReporteResponse.builder()
                .docenteId(docente.getId())
                .docenteNombre(docente.getNombreCompleto())
                .numeroDocumento(docente.getNumeroDocumento())
                .totalEncuestas(encuestas.size())
                .promedioGeneral(round2(promedio))
                .valoracion(EscalaValoracion.fromPromedio(promedio).getEtiqueta())
                .evaluaciones(reportes)
                .build();
    }

    /** Todas las respuestas de texto de un conjunto de encuestas. */
    private List<DocenteReporteResponse.ComentarioItem> comentariosDe(
            List<Encuesta> encuestas, Map<Long, PreguntaEvaluacion> preguntas) {
        List<DocenteReporteResponse.ComentarioItem> items = new ArrayList<>();
        for (Encuesta e : encuestas) {
            for (RespuestaPregunta r : e.getRespuestas()) {
                if (r.getTextoRespuesta() == null || r.getTextoRespuesta().isBlank()) continue;
                PreguntaEvaluacion p = preguntas.get(r.getPreguntaId());
                items.add(DocenteReporteResponse.ComentarioItem.builder()
                        .encuestaId(e.getId())
                        .numero(p != null ? p.getNumero() : null)
                        .pregunta(p != null ? p.getTexto() : null)
                        .texto(r.getTextoRespuesta())
                        .sentimiento(r.getSentimiento() != null ? r.getSentimiento().name() : null)
                        .sentimientoScore(r.getSentimientoScore())
                        .sentimientoMetodo(r.getSentimientoMetodo() != null
                                ? r.getSentimientoMetodo().name() : null)
                        .build());
            }
        }
        items.sort(Comparator.comparing(DocenteReporteResponse.ComentarioItem::getNumero,
                Comparator.nullsLast(Comparator.naturalOrder())));
        return items;
    }

    // ============================================================
    // Helpers de agregación
    // ============================================================

    private Map<Long, PreguntaEvaluacion> preguntasById() {
        return preguntaRepository.findAll().stream()
                .collect(Collectors.toMap(PreguntaEvaluacion::getId, Function.identity()));
    }

    /** Categorías con preguntas Likert, en el orden del instrumento (por el menor número). */
    private List<String> categoriasOrdenadas(Map<Long, PreguntaEvaluacion> preguntas) {
        Map<String, Integer> ordenCategoria = new HashMap<>();
        for (PreguntaEvaluacion p : preguntas.values()) {
            if (p.getTipo() == TipoPregunta.LIKERT && p.getCategoriaCodigo() != null) {
                ordenCategoria.merge(p.getCategoriaCodigo(), p.getNumero(), Math::min);
            }
        }
        return ordenCategoria.entrySet().stream()
                .sorted(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .toList();
    }

    private ChartSerie radarCategorias(List<Encuesta> encuestas, Map<Long, PreguntaEvaluacion> preguntas) {
        List<String> categorias = categoriasOrdenadas(preguntas);
        Map<String, double[]> acum = new LinkedHashMap<>();
        categorias.forEach(c -> acum.put(c, new double[2]));
        for (Encuesta e : encuestas) {
            for (RespuestaPregunta r : e.getRespuestas()) {
                PreguntaEvaluacion p = preguntas.get(r.getPreguntaId());
                if (p != null && r.getValor() != null && acum.containsKey(p.getCategoriaCodigo())) {
                    acum.get(p.getCategoriaCodigo())[0] += r.getValor();
                    acum.get(p.getCategoriaCodigo())[1]++;
                }
            }
        }
        List<Double> valores = categorias.stream()
                .map(c -> {
                    double[] a = acum.get(c);
                    return a[1] > 0 ? round2(a[0] / a[1]) : 0.0;
                })
                .toList();
        return ChartSerie.builder().labels(categorias).valores(valores).build();
    }

    private ChartSerie distribucionLikert(List<Encuesta> encuestas) {
        long[] conteos = new long[5];
        for (Encuesta e : encuestas) {
            for (RespuestaPregunta r : e.getRespuestas()) {
                if (r.getValor() != null && r.getValor() >= 1 && r.getValor() <= 5) {
                    conteos[r.getValor() - 1]++;
                }
            }
        }
        List<Double> valores = new ArrayList<>(5);
        for (long c : conteos) valores.add((double) c);
        return ChartSerie.builder()
                .labels(List.of("1", "2", "3", "4", "5"))
                .valores(valores)
                .build();
    }

    private ChartSerie sentimientosChart(List<Encuesta> encuestas) {
        long positivos = contarSentimiento(encuestas, Sentimiento.POSITIVO);
        long neutros = contarSentimiento(encuestas, Sentimiento.NEUTRO);
        long negativos = contarSentimiento(encuestas, Sentimiento.NEGATIVO);
        return ChartSerie.builder()
                .labels(List.of("POSITIVO", "NEUTRO", "NEGATIVO"))
                .valores(List.of((double) positivos, (double) neutros, (double) negativos))
                .build();
    }

    private long contarSentimiento(List<Encuesta> encuestas, Sentimiento s) {
        return encuestas.stream()
                .flatMap(e -> e.getRespuestas().stream())
                .filter(r -> r.getSentimiento() == s)
                .count();
    }

    private Double promedioSentimiento(List<Encuesta> encuestas) {
        return encuestas.stream()
                .flatMap(e -> e.getRespuestas().stream())
                .filter(r -> r.getSentimientoScore() != null)
                .mapToDouble(RespuestaPregunta::getSentimientoScore)
                .average()
                .stream().map(this::round2)
                .boxed().findFirst().orElse(null);
    }

    private EvaluacionGraficasResponse.ComentariosDestacados comentariosDestacados(List<Encuesta> encuestas) {
        List<RespuestaPregunta> conTexto = encuestas.stream()
                .flatMap(e -> e.getRespuestas().stream())
                .filter(r -> r.getTextoRespuesta() != null && !r.getTextoRespuesta().isBlank()
                        && r.getSentimientoScore() != null)
                .toList();
        String masPositivo = conTexto.stream()
                .max(Comparator.comparing(RespuestaPregunta::getSentimientoScore))
                .map(RespuestaPregunta::getTextoRespuesta).orElse(null);
        String masNegativo = conTexto.stream()
                .min(Comparator.comparing(RespuestaPregunta::getSentimientoScore))
                .map(RespuestaPregunta::getTextoRespuesta).orElse(null);
        if (masPositivo == null && masNegativo == null) {
            return null;
        }
        return EvaluacionGraficasResponse.ComentariosDestacados.builder()
                .masPositivo(masPositivo)
                .masNegativo(masNegativo)
                .build();
    }

    private List<WordCloudItem> wordCloud(List<Encuesta> encuestas) {
        Map<String, Long> frecuencias = new HashMap<>();
        List<String> textos = encuestas.stream()
                .flatMap(e -> e.getRespuestas().stream())
                .map(RespuestaPregunta::getTextoRespuesta)
                .filter(t -> t != null && !t.isBlank())
                .toList();
        for (String texto : textos) {
            String normalizado = Normalizer.normalize(texto.toLowerCase(), Normalizer.Form.NFD)
                    .replaceAll("\\p{M}", "")
                    .replaceAll("[^a-zñ\\s]", " ");
            for (String token : normalizado.split("\\s+")) {
                if (token.length() >= 3 && !STOPWORDS.contains(token)) {
                    frecuencias.merge(token, 1L, Long::sum);
                }
            }
        }
        return frecuencias.entrySet().stream()
                .sorted(Map.Entry.<String, Long>comparingByValue().reversed())
                .limit(WORD_CLOUD_TOP)
                .map(entry -> WordCloudItem.builder()
                        .texto(entry.getKey())
                        .peso(entry.getValue())
                        .build())
                .toList();
    }

    private double promedioEncuesta(Encuesta e) {
        if (e.getRespuestas() == null || e.getRespuestas().isEmpty()) {
            return 0;
        }
        return e.getRespuestas().stream()
                .filter(r -> r.getValor() != null)
                .mapToInt(RespuestaPregunta::getValor)
                .average().orElse(0);
    }

    private double promedioGlobal(List<Encuesta> encuestas) {
        return encuestas.stream()
                .flatMap(e -> e.getRespuestas().stream())
                .filter(r -> r.getValor() != null)
                .mapToInt(RespuestaPregunta::getValor)
                .average().orElse(0);
    }

    private double round2(double v) {
        return Math.round(v * 100.0) / 100.0;
    }
}
