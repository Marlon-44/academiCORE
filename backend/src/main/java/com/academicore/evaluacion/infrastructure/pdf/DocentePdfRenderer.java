package com.academicore.evaluacion.infrastructure.pdf;

import com.academicore.evaluacion.application.dto.ChartSerie;
import com.academicore.evaluacion.application.dto.DocenteGraficasResponse;
import com.academicore.evaluacion.application.dto.DocenteReporteResponse;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfPageEventHelper;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.draw.LineSeparator;
import org.springframework.stereotype.Component;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

/**
 * Renderiza el informe de evaluación docente a PDF con formato institucional:
 * encabezado oficial, ficha de identificación, resumen ejecutivo narrativo,
 * indicadores, gráficas de barras por categoría y sentimiento, comparativo
 * por evaluación, aspectos valorados/por mejorar, comentarios y pie con
 * numeración de páginas. Paleta sobria: negro dominante con grises.
 */
@Component
public class DocentePdfRenderer {

    private static final Color NEGRO = new Color(0x111111);
    private static final Color CARBON = new Color(0x1F2937);
    private static final Color GRIS_OSCURO = new Color(0x4B5563);
    private static final Color GRIS = new Color(0x6B7280);
    private static final Color LINEA = new Color(0xD1D5DB);
    private static final Color PISTA = new Color(0xECEFF3);
    private static final Color CEBRA = new Color(0xF9FAFB);
    private static final Color VERDE = new Color(0x166534);
    private static final Color ROJO = new Color(0x7F1D1D);

    private final Font marca = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 9, GRIS_OSCURO);
    private final Font titulo = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, NEGRO);
    private final Font subtitulo = FontFactory.getFont(FontFactory.HELVETICA, 10.5f, GRIS);
    private final Font h2 = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, NEGRO);
    private final Font normal = FontFactory.getFont(FontFactory.HELVETICA, 10);
    private final Font bold = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10);
    private final Font small = FontFactory.getFont(FontFactory.HELVETICA, 8.5f, GRIS);
    private final Font etiqueta = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 7.5f, GRIS);

    public byte[] render(DocenteGraficasResponse g, DocenteReporteResponse r,
                         String resumen, String resumenMetodo, Long asignaturaId) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document doc = new Document(PageSize.LETTER, 55, 55, 60, 55);
        try {
            PdfWriter writer = PdfWriter.getInstance(doc, out);
            writer.setPageEvent(new PiePagina());
            doc.open();
            encabezado(doc, g, asignaturaId);
            seccionResumen(doc, writer, resumen, resumenMetodo);
            seccionIndicadores(doc, writer, g);
            barChart(doc, writer, "Resultados por categoría del instrumento (escala 0–5)",
                    g.getRadarCategorias(), 5.0);
            tablaComparativo(doc, writer, g);
            barChart(doc, writer, "Distribución del sentimiento en los comentarios (%)",
                    normalizar(g.getSentimientos()), 100.0);
            ranking(doc, writer, "Aspectos mejor valorados por la población estudiantil", g.getFortalezas(), VERDE);
            ranking(doc, writer, "Aspectos que requieren atención", g.getOportunidades(), ROJO);
            comentarios(doc, writer, r, asignaturaId);
        } catch (Exception e) {
            throw new IllegalStateException("Error generando PDF del docente", e);
        } finally {
            doc.close();
        }
        return out.toByteArray();
    }

    /* ------------------------------------------------ encabezado oficial */

    private void encabezado(Document doc, DocenteGraficasResponse g, Long asignaturaId)
            throws DocumentException {
        Paragraph marcaP = new Paragraph("academiCORE · PLATAFORMA DE EVALUACIÓN DOCENTE", marca);
        marcaP.setSpacingAfter(4);
        doc.add(marcaP);

        Paragraph t = new Paragraph("Informe de Evaluación Docente", titulo);
        t.setSpacingAfter(2);
        doc.add(t);

        Paragraph sub = new Paragraph("Percepción estudiantil · Instrumento oficial SIG", subtitulo);
        sub.setSpacingAfter(4);
        doc.add(sub);

        doc.add(new Chunk(new LineSeparator(1f, 100, NEGRO, Element.ALIGN_LEFT, -1)));
        doc.add(Chunk.NEWLINE);

        PdfPTable ficha = new PdfPTable(2);
        ficha.setWidthPercentage(100);
        ficha.setSpacingAfter(6);
        fichaFila(ficha, "DOCENTE", nullTo(g.getDocenteNombre()),
                "N.º DE DOCUMENTO", nullTo(g.getNumeroDocumento()));
        fichaFila(ficha, "ÁMBITO DEL INFORME", ambito(g, asignaturaId),
                "FECHA DE EMISIÓN", LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
        doc.add(ficha);
    }

    private void fichaFila(PdfPTable t, String l1, String v1, String l2, String v2) {
        t.addCell(fichaCelda(l1, v1));
        t.addCell(fichaCelda(l2, v2));
    }

    private PdfPCell fichaCelda(String label, String valor) {
        PdfPCell c = new PdfPCell();
        Paragraph pl = new Paragraph(label, etiqueta);
        pl.setSpacingAfter(2);
        c.addElement(pl);
        c.addElement(new Paragraph(valor, bold));
        c.setBorderColor(LINEA);
        c.setPadding(8);
        return c;
    }

    private String ambito(DocenteGraficasResponse g, Long asignaturaId) {
        if (asignaturaId == null) return "Consolidado — todas las asignaturas";
        if (g.getComparativoMaterias() != null && !g.getComparativoMaterias().isEmpty()) {
            DocenteGraficasResponse.ComparativoItem it = g.getComparativoMaterias().get(0);
            return "Asignatura: " + it.getAsignaturaCodigo() + " — " + it.getAsignaturaNombre();
        }
        return "Asignatura específica";
    }

    /* ------------------------------------------------ secciones */

    private void seccion(Document doc, PdfWriter writer, String texto) throws DocumentException {
        if (writer.getVerticalPosition(false) < doc.bottom() + 95) {
            doc.newPage();
        }
        Paragraph p = new Paragraph(texto, h2);
        p.setSpacingBefore(12);
        p.setSpacingAfter(3);
        doc.add(p);
        doc.add(new Chunk(new LineSeparator(0.6f, 100, LINEA, Element.ALIGN_LEFT, -1)));
        doc.add(Chunk.NEWLINE);
    }

    private void seccionResumen(Document doc, PdfWriter writer, String resumen, String metodo) throws DocumentException {
        seccion(doc, writer, "Resumen ejecutivo");
        String origen = "GEMINI".equalsIgnoreCase(metodo)
                ? "modelo de lenguaje Gemini (inteligencia artificial)"
                : "motor de análisis estadístico local";
        Paragraph nota = new Paragraph("Síntesis elaborada automáticamente mediante " + origen
                + " a partir de los datos del instrumento.", small);
        nota.setSpacingAfter(6);
        doc.add(nota);
        for (String parrafo : resumen.split("\\n\\s*\\n")) {
            Paragraph p = new Paragraph(parrafo.trim(), normal);
            p.setSpacingAfter(6);
            p.setAlignment(Element.ALIGN_JUSTIFIED);
            doc.add(p);
        }
    }

    private void seccionIndicadores(Document doc, PdfWriter writer, DocenteGraficasResponse g) throws DocumentException {
        seccion(doc, writer, "Indicadores generales");
        PdfPTable t = new PdfPTable(new float[]{1, 1, 1});
        t.setWidthPercentage(100);
        celdaKpi(t, "PROMEDIO GENERAL",
                String.format(Locale.ROOT, "%.2f / 5", g.getPromedioGeneral() == null ? 0 : g.getPromedioGeneral()));
        celdaKpi(t, "ENCUESTAS RECIBIDAS", String.valueOf(g.getTotalEncuestas()));
        celdaKpi(t, "VALORACIÓN", g.getValoracion() == null ? "N/D" : g.getValoracion());
        doc.add(t);
    }

    private void celdaKpi(PdfPTable t, String label, String valor) {
        PdfPCell c = new PdfPCell();
        Paragraph pv = new Paragraph(valor, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 15, NEGRO));
        pv.setAlignment(Element.ALIGN_CENTER);
        pv.setSpacingAfter(3);
        c.addElement(pv);
        Paragraph pl = new Paragraph(label, etiqueta);
        pl.setAlignment(Element.ALIGN_CENTER);
        c.addElement(pl);
        c.setBorderColor(LINEA);
        c.setPadding(10);
        c.setHorizontalAlignment(Element.ALIGN_CENTER);
        t.addCell(c);
    }

    /* ------------------------------------------------ gráficas de barras */

    private void barChart(Document doc, PdfWriter writer, String tituloGraf,
                          ChartSerie serie, double max) throws DocumentException {
        if (serie == null || serie.getLabels() == null || serie.getLabels().isEmpty()) return;
        seccion(doc, writer, tituloGraf);
        PdfContentByte cb = writer.getDirectContent();
        float x = doc.left() + 150;
        float anchoMax = doc.right() - x - 42;
        float y = writer.getVerticalPosition(false) - 14;
        float altoBarra = 10, paso = 17;
        for (int i = 0; i < serie.getLabels().size(); i++) {
            String label = legible(serie.getLabels().get(i));
            double valor = serie.getValores().get(i) == null ? 0 : serie.getValores().get(i);
            if (y - paso < doc.bottom() + 20) {
                doc.newPage();
                cb = writer.getDirectContent();
                y = writer.getVerticalPosition(false) - 14;
            }
            float w = (float) Math.max(2, valor / max * anchoMax);
            ColumnTextHack.texto(cb, new Phrase(label, normal), doc.left(), y + 2, 145);
            cb.setColorFill(PISTA);
            cb.rectangle(x, y, anchoMax, altoBarra);
            cb.fill();
            cb.setColorFill(CARBON);
            cb.rectangle(x, y, w, altoBarra);
            cb.fill();
            ColumnTextHack.texto(cb, new Phrase(String.format(Locale.ROOT, "%.1f", valor),
                    FontFactory.getFont(FontFactory.HELVETICA_BOLD, 8.5f, GRIS_OSCURO)),
                    x + w + 4, y + 2, 38);
            y -= paso;
        }
        Paragraph espacio = new Paragraph(" ");
        espacio.setSpacingBefore(serie.getLabels().size() * paso + 6);
        doc.add(espacio);
    }

    private ChartSerie normalizar(ChartSerie s) {
        if (s == null || s.getValores() == null) return s;
        double total = s.getValores().stream().mapToDouble(v -> v == null ? 0 : v).sum();
        if (total == 0) return s;
        ChartSerie n = new ChartSerie();
        n.setLabels(s.getLabels());
        n.setValores(s.getValores().stream()
                .map(v -> v == null ? 0.0 : v / total * 100).toList());
        return n;
    }

    /* ------------------------------------------------ tabla comparativa */

    private void tablaComparativo(Document doc, PdfWriter writer, DocenteGraficasResponse g) throws DocumentException {
        List<DocenteGraficasResponse.ComparativoItem> items = g.getComparativoMaterias();
        if (items == null || items.isEmpty()) return;
        seccion(doc, writer, "Resultados desagregados por evaluación");
        PdfPTable t = new PdfPTable(new float[]{3, 1.2f, 1, 1, 1});
        t.setWidthPercentage(100);
        for (String h : new String[]{"Asignatura", "Grupo", "Periodo", "Encuestas", "Promedio"}) {
            PdfPCell c = new PdfPCell(new Phrase(h,
                    FontFactory.getFont(FontFactory.HELVETICA_BOLD, 9, Color.WHITE)));
            c.setBackgroundColor(NEGRO);
            c.setPadding(7);
            t.addCell(c);
        }
        boolean zebra = false;
        for (DocenteGraficasResponse.ComparativoItem it : items) {
            Color fondo = zebra ? CEBRA : Color.WHITE;
            zebra = !zebra;
            t.addCell(celda(it.getAsignaturaCodigo() + " — " + it.getAsignaturaNombre(), normal, fondo));
            t.addCell(celda(it.getGrupo(), normal, fondo));
            t.addCell(celda(it.getPeriodo(), normal, fondo));
            t.addCell(celda(String.valueOf(it.getRespondidas()), normal, fondo));
            t.addCell(celda(String.format(Locale.ROOT, "%.2f",
                    it.getPromedio() == null ? 0 : it.getPromedio()), bold, fondo));
        }
        doc.add(t);
    }

    /* ------------------------------------------------ rankings y comentarios */

    private void ranking(Document doc, PdfWriter writer, String tituloLista,
                         List<DocenteGraficasResponse.PreguntaRanking> items, Color color)
            throws DocumentException {
        if (items == null || items.isEmpty()) return;
        seccion(doc, writer, tituloLista);
        com.lowagie.text.List lista = new com.lowagie.text.List(com.lowagie.text.List.UNORDERED);
        lista.setListSymbol(new Chunk("▪ ", FontFactory.getFont(FontFactory.HELVETICA, 9, color)));
        for (DocenteGraficasResponse.PreguntaRanking p : items.stream().limit(6).toList()) {
            lista.add(new com.lowagie.text.ListItem(new Phrase(String.format(Locale.ROOT,
                    "Ítem %d · %s — %.2f", p.getNumero(), p.getTexto(),
                    p.getPromedio() == null ? 0 : p.getPromedio()), normal)));
        }
        doc.add(lista);
    }

    private void comentarios(Document doc, PdfWriter writer, DocenteReporteResponse r, Long asignaturaId)
            throws DocumentException {
        if (r == null || r.getEvaluaciones() == null) return;
        seccion(doc, writer, "Comentarios registrados por la población estudiantil");
        for (DocenteReporteResponse.EvaluacionReporte e : r.getEvaluaciones()) {
            if (asignaturaId != null && e.getComentarios() == null) continue;
            Paragraph cab = new Paragraph(String.format(
                    "%s — %s · Periodo %s · Grupo %s · %d encuestas · Promedio %.2f",
                    e.getAsignaturaCodigo(), e.getAsignaturaNombre(), e.getPeriodo(), e.getGrupo(),
                    e.getEncuestas(), e.getPromedio() == null ? 0 : e.getPromedio()), bold);
            cab.setSpacingBefore(8);
            doc.add(cab);
            if (e.getComentarios() == null || e.getComentarios().isEmpty()) continue;
            for (DocenteReporteResponse.ComentarioItem c : e.getComentarios().stream().limit(10).toList()) {
                if (c.getTexto() == null || c.getTexto().isBlank()) continue;
                String s = c.getSentimiento() == null ? "" : "  [" + c.getSentimiento() + "]";
                Paragraph p = new Paragraph();
                p.add(new Chunk("Ítem " + c.getNumero() + " — «" + c.getTexto() + "»", normal));
                if (!s.isEmpty()) p.add(new Chunk(s, small));
                p.setIndentationLeft(12);
                p.setSpacingAfter(3);
                doc.add(p);
            }
        }
    }

    /* ------------------------------------------------ utilidades */

    private PdfPCell celda(String texto, Font f, Color fondo) {
        PdfPCell c = new PdfPCell(new Phrase(texto, f));
        c.setPadding(6);
        c.setBorderColor(LINEA);
        c.setBackgroundColor(fondo);
        return c;
    }

    private String legible(String cat) {
        return cat == null ? "" : cat.replace('_', ' ');
    }

    private String nullTo(String s) {
        return s == null || s.isBlank() ? "N/D" : s;
    }

    /** Pie de página formal: línea divisoria, denominación del instrumento y número de página. */
    private static class PiePagina extends PdfPageEventHelper {
        private final Font pieFont = FontFactory.getFont(FontFactory.HELVETICA, 8, GRIS);

        @Override
        public void onEndPage(PdfWriter writer, Document doc) {
            PdfContentByte cb = writer.getDirectContent();
            cb.setColorStroke(LINEA);
            cb.setLineWidth(0.5f);
            cb.moveTo(doc.left(), doc.bottom() - 8);
            cb.lineTo(doc.right(), doc.bottom() - 8);
            cb.stroke();
            com.lowagie.text.pdf.ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,
                    new Phrase("academiCORE · Instrumento oficial SIG — Percepción Estudiantil · "
                            + "Promedios en escala 0–5 · Página " + writer.getPageNumber(), pieFont),
                    (doc.left() + doc.right()) / 2, doc.bottom() - 20, 0);
        }
    }

    /** Texto sobre el canvas sin arrastrar API adicional de ColumnText. */
    private static class ColumnTextHack {
        static void texto(PdfContentByte cb, Phrase p, float x, float y, float maxAncho) {
            try {
                com.lowagie.text.pdf.ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, p, x, y, 0);
            } catch (Exception ignored) {
            }
        }
    }
}
