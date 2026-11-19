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
import com.lowagie.text.pdf.PdfWriter;
import org.springframework.stereotype.Component;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

/**
 * Renderiza el reporte del docente a PDF: encabezado, resumen narrativo,
 * tabla comparativa, barras por categoria y sentimiento, fortalezas,
 * oportunidades y comentarios destacados.
 */
@Component
public class DocentePdfRenderer {

    private static final Color AZUL = new Color(0x1F3864);
    private static final Color ACENTO = new Color(0xF59E0B);
    private static final Color GRIS = new Color(0x6B7280);
    private static final Color VERDE = new Color(0x10B981);
    private static final Color ROJO = new Color(0xEF4444);
    private static final Color BARRA = new Color(0x3B82F6);

    private final Font titulo = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, AZUL);
    private final Font subtitulo = FontFactory.getFont(FontFactory.HELVETICA, 11, GRIS);
    private final Font h2 = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 13, AZUL);
    private final Font normal = FontFactory.getFont(FontFactory.HELVETICA, 10);
    private final Font small = FontFactory.getFont(FontFactory.HELVETICA, 8.5f, GRIS);
    private final Font bold = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10);

    public byte[] render(DocenteGraficasResponse g, DocenteReporteResponse r,
                         String resumen, String resumenMetodo, Long asignaturaId) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Document doc = new Document(PageSize.LETTER, 50, 50, 60, 50);
        try {
            PdfWriter writer = PdfWriter.getInstance(doc, out);
            doc.open();
            encabezado(doc, g, asignaturaId);
            seccionResumen(doc, resumen, resumenMetodo);
            seccionDatos(doc, g);
            barChart(doc, writer, "Promedio por categoria (1-4)", g.getRadarCategorias(), 4.0, BARRA);
            tablaComparativo(doc, g);
            barChart(doc, writer, "Sentimiento en comentarios (%)", normalizar(g.getSentimientos()), 100.0, VERDE);
            ranking(doc, "Fortalezas (items mejor valorados)", g.getFortalezas(), VERDE);
            ranking(doc, "Oportunidades de mejora", g.getOportunidades(), ROJO);
            comentarios(doc, r, asignaturaId);
            pie(doc, writer);
        } catch (Exception e) {
            throw new IllegalStateException("Error generando PDF del docente", e);
        } finally {
            doc.close();
        }
        return out.toByteArray();
    }

    private void encabezado(Document doc, DocenteGraficasResponse g, Long asignaturaId)
            throws DocumentException {
        Paragraph p = new Paragraph("academiCORE", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10, ACENTO));
        p.setSpacingAfter(2);
        doc.add(p);
        doc.add(new Paragraph("Reporte de Evaluacion Docente — Percepcion Estudiantil", titulo));
        Paragraph sub = new Paragraph(String.format(
                "%s · Doc. %s · %s · Emitido %s",
                g.getDocenteNombre(), g.getNumeroDocumento(),
                asignaturaId == null ? "Todas las asignaturas" : "Asignatura especifica",
                LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))), subtitulo);
        sub.setSpacingAfter(14);
        doc.add(sub);
    }

    private void seccionResumen(Document doc, String resumen, String metodo) throws DocumentException {
        doc.add(new Paragraph("Resumen ejecutivo", h2));
        Paragraph nota = new Paragraph("Generado con " + metodo, small);
        nota.setSpacingAfter(6);
        doc.add(nota);
        for (String parrafo : resumen.split("\\n\\s*\\n")) {
            Paragraph p = new Paragraph(parrafo.trim(), normal);
            p.setSpacingAfter(6);
            p.setAlignment(Element.ALIGN_JUSTIFIED);
            doc.add(p);
        }
        doc.add(Chunk.NEWLINE);
    }

    private void seccionDatos(Document doc, DocenteGraficasResponse g) throws DocumentException {
        PdfPTable t = new PdfPTable(new float[]{1, 1, 1});
        t.setWidthPercentage(100);
        celdaKpi(t, "Promedio general", String.format(Locale.ROOT, "%.2f / 4", g.getPromedioGeneral() == null ? 0 : g.getPromedioGeneral()));
        celdaKpi(t, "Encuestas", String.valueOf(g.getTotalEncuestas()));
        celdaKpi(t, "Valoracion", g.getValoracion() == null ? "N/D" : g.getValoracion());
        doc.add(t);
        doc.add(Chunk.NEWLINE);
    }

    private void celdaKpi(PdfPTable t, String label, String valor) {
        PdfPCell c = new PdfPCell();
        c.addElement(new Paragraph(valor, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, AZUL)));
        c.addElement(new Paragraph(label, small));
        c.setBorderColor(new Color(0xE5E7EB));
        c.setPadding(10);
        c.setHorizontalAlignment(Element.ALIGN_CENTER);
        t.addCell(c);
    }

    private void barChart(Document doc, PdfWriter writer, String tituloGraf,
                          ChartSerie serie, double max, Color color) throws DocumentException {
        if (serie == null || serie.getLabels() == null || serie.getLabels().isEmpty()) return;
        doc.add(new Paragraph(tituloGraf, h2));
        doc.add(Chunk.NEWLINE);
        PdfContentByte cb = writer.getDirectContent();
        float x = doc.left() + 140;
        float anchoMax = doc.getPageSize().getWidth() - doc.right() - x - 40;
        float y = writer.getVerticalPosition(false) - 12;
        float altoBarra = 10, paso = 16;
        for (int i = 0; i < serie.getLabels().size(); i++) {
            String label = legible(serie.getLabels().get(i));
            double valor = serie.getValores().get(i) == null ? 0 : serie.getValores().get(i);
            if (y - paso < doc.bottom()) {
                doc.newPage();
                cb = writer.getDirectContent();
                y = writer.getVerticalPosition(false) - 12;
            }
            float w = (float) Math.max(2, valor / max * anchoMax);
            ColumnTextHack.texto(cb, new Phrase(label, small), doc.left(), y + 2, 135);
            cb.setColorFill(new Color(0xEEF2F7));
            cb.rectangle(x, y, anchoMax, altoBarra);
            cb.fill();
            cb.setColorFill(color);
            cb.rectangle(x, y, w, altoBarra);
            cb.fill();
            ColumnTextHack.texto(cb, new Phrase(String.format(Locale.ROOT, "%.1f", valor), small),
                    x + w + 4, y + 2, 36);
            y -= paso;
        }
        Paragraph espacio = new Paragraph(" ");
        espacio.setSpacingBefore(serie.getLabels().size() * paso + 4);
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

    private void tablaComparativo(Document doc, DocenteGraficasResponse g) throws DocumentException {
        List<DocenteGraficasResponse.ComparativoItem> items = g.getComparativoMaterias();
        if (items == null || items.isEmpty()) return;
        doc.add(new Paragraph("Resultados por evaluacion", h2));
        PdfPTable t = new PdfPTable(new float[]{3, 1.2f, 1, 1, 1});
        t.setWidthPercentage(100);
        t.setSpacingBefore(6);
        for (String h : new String[]{"Asignatura", "Grupo", "Periodo", "Encuestas", "Promedio"}) {
            PdfPCell c = new PdfPCell(new Phrase(h, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 9, Color.WHITE)));
            c.setBackgroundColor(AZUL);
            c.setPadding(6);
            t.addCell(c);
        }
        for (DocenteGraficasResponse.ComparativoItem it : items) {
            t.addCell(celda(it.getAsignaturaCodigo() + " — " + it.getAsignaturaNombre(), normal));
            t.addCell(celda(it.getGrupo(), normal));
            t.addCell(celda(it.getPeriodo(), normal));
            t.addCell(celda(String.valueOf(it.getRespondidas()), normal));
            t.addCell(celda(String.format(Locale.ROOT, "%.2f", it.getPromedio() == null ? 0 : it.getPromedio()), bold));
        }
        doc.add(t);
        doc.add(Chunk.NEWLINE);
    }

    private void ranking(Document doc, String tituloLista,
                         List<DocenteGraficasResponse.PreguntaRanking> items, Color color)
            throws DocumentException {
        if (items == null || items.isEmpty()) return;
        doc.add(new Paragraph(tituloLista, h2));
        com.lowagie.text.List lista = new com.lowagie.text.List(com.lowagie.text.List.UNORDERED);
        lista.setListSymbol(new Chunk("• ", FontFactory.getFont(FontFactory.HELVETICA, 10, color)));
        for (DocenteGraficasResponse.PreguntaRanking p : items.stream().limit(6).toList()) {
            lista.add(new com.lowagie.text.ListItem(new Phrase(String.format(Locale.ROOT,
                    "P%d · %s — %.2f", p.getNumero(), p.getTexto(), p.getPromedio() == null ? 0 : p.getPromedio()), normal)));
        }
        doc.add(lista);
        doc.add(Chunk.NEWLINE);
    }

    private void comentarios(Document doc, DocenteReporteResponse r, Long asignaturaId)
            throws DocumentException {
        if (r == null || r.getEvaluaciones() == null) return;
        doc.add(new Paragraph("Comentarios de los estudiantes", h2));
        for (DocenteReporteResponse.EvaluacionReporte e : r.getEvaluaciones()) {
            if (asignaturaId != null && e.getComentarios() == null) continue;
            Paragraph cab = new Paragraph(String.format("%s — %s (%s, grupo %s): %d encuestas, promedio %.2f",
                    e.getAsignaturaCodigo(), e.getAsignaturaNombre(), e.getPeriodo(), e.getGrupo(),
                    e.getEncuestas(), e.getPromedio() == null ? 0 : e.getPromedio()), bold);
            cab.setSpacingBefore(8);
            doc.add(cab);
            if (e.getComentarios() == null || e.getComentarios().isEmpty()) continue;
            for (DocenteReporteResponse.ComentarioItem c : e.getComentarios().stream().limit(10).toList()) {
                if (c.getTexto() == null || c.getTexto().isBlank()) continue;
                String s = c.getSentimiento() == null ? "" : " [" + c.getSentimiento() + "]";
                Paragraph p = new Paragraph("• P" + c.getNumero() + " " + c.getPregunta() + " — «"
                        + c.getTexto() + "»" + s, normal);
                p.setIndentationLeft(12);
                p.setSpacingAfter(3);
                doc.add(p);
            }
        }
    }

    private void pie(Document doc, PdfWriter writer) {
        PdfContentByte cb = writer.getDirectContent();
        ColumnTextHack.texto(cb, new Phrase(
                "Instrumento SIG Percepcion Estudiantil — academiCORE · escala Likert 1-4", small),
                doc.left(), doc.bottom() - 10, 400);
    }

    private PdfPCell celda(String texto, Font f) {
        PdfPCell c = new PdfPCell(new Phrase(texto, f));
        c.setPadding(5);
        c.setBorderColor(new Color(0xE5E7EB));
        return c;
    }

    private String legible(String cat) {
        return cat == null ? "" : cat.replace('_', ' ');
    }

    /** Texto rotulado simple sobre el canvas (sin ColumnText para no arrastrar API extra). */
    private static class ColumnTextHack {
        static void texto(PdfContentByte cb, Phrase p, float x, float y, float maxAncho) {
            try {
                com.lowagie.text.pdf.ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, p, x, y, 0);
            } catch (Exception ignored) {
            }
        }
    }
}
