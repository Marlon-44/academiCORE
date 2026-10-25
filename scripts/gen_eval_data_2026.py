#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Genera scripts/_gen_data_2026.sql — dataset 2026-1 + 2026-2 de evaluación docente.

Modelo final:
- Se borra TODO lo de 2025-1 y las evaluaciones 2026-2 viejas (12 grupos de 25).
- 8 docentes (4 existentes + 4 nuevos), cada uno con 1 evaluación por periodo.
- 80 estudiantes (50 existentes + 30 nuevos, con usuarios de login).
- 6 asignaturas nuevas del programa de Ing. de Sistemas (12 en total).
- 2026-1 (CERRADA): cada estudiante responde las 8 evaluaciones → historial.
- 2026-2 (ABIERTA): cada estudiante responde 4 aleatorias y le quedan 4 pendientes.
- Respuestas con perfiles de calidad por docente (excelente/bueno/regular/malo)
  y textos realistas en las preguntas abiertas (25 fortalezas / 26 mejoras),
  con sentimiento coherente (MODELO) para las gráficas de sentimiento.
Salida: SOLO SQL, no toca la BD directamente.
"""

import random
import unicodedata

random.seed(20261025)

OUT = "scripts/_gen_data_2026.sql"

# ---------------------------------------------------------------- perfiles
# (w1,w2,w3,w4) = pesos para valor Likert 1..4 (escala SIG 1-4)
PROFILES = {
    "EXCELENTE": (0.03, 0.07, 0.22, 0.68),
    "BUENO":     (0.04, 0.12, 0.46, 0.38),
    "REGULAR":   (0.10, 0.36, 0.40, 0.14),
    "MALO":      (0.46, 0.37, 0.13, 0.04),
}

# docentes: (id, doc, nombres, apellidos, email, perfil)  — 1-4 ya existen
DOCENTES = [
    (1, "10301274", "GABRIEL ELIAS",  "CHANCHI GOLONDRINO", None,                             "EXCELENTE"),
    (2, "72104567", "MARIA FERNANDA", "RUIZ CASTRO",        None,                             "BUENO"),
    (3, "73098812", "CARLOS ALBERTO", "MENDOZA SIERRA",     None,                             "MALO"),
    (4, "10304566", "LUIS EDUARDO",   "PATERNINA CUELLO",   None,                             "REGULAR"),
    (5, "74112233", "HERNANDO JAVIER","DE LA HOZ MARTINEZ", "hdelahoz@unicartagena.edu.co",   "MALO"),
    (6, "10403321", "YOLANDA",        "PEREZ TAPIA",        "yperez@unicartagena.edu.co",     "BUENO"),
    (7, "11024567", "JAIRO ALONSO",   "CASSIANI VARGAS",    "jcassiani@unicartagena.edu.co",  "EXCELENTE"),
    (8, "73115544", "NORBERTO ENRIQUE","MANJARRES PABON",   "nmanjarres@unicartagena.edu.co", "REGULAR"),
]
NEW_DOCENTES = DOCENTES[4:]

# asignaturas nuevas (codigo, nombre, descripcion)
NEW_ASIG = [
    ("EP1101", "Programación I",                "Lógica de programación y Python"),
    ("EP2101", "Estructuras de Datos",          "Listas, pilas, colas, árboles y grafos"),
    ("EP2202", "Sistemas Operativos",           "Procesos, memoria, concurrencia y Linux"),
    ("EP3101", "Inteligencia Artificial",       "Búsqueda, aprendizaje automático y PLN"),
    ("EP1302", "Ingeniería de Software II",     "Diseño, patrones, pruebas y calidad"),
    ("EP3201", "Arquitectura de Computadores",  "ISA, pipeline, memoria caché y ensamblador"),
]

# docente -> asignatura por periodo (codigo)
MAP_2026_1 = {1:"EP1303", 2:"EP2201", 3:"EP1102", 4:"EP2103",
              5:"EP1101", 6:"EP2101", 7:"EP3101", 8:"EP2202"}
MAP_2026_2 = {1:"EP1302", 2:"EP3201", 3:"2222123", 4:"EP1301",
              5:"EP2103", 6:"EP2201", 7:"EP1303", 8:"EP1102"}

# ------------------------------------------------------- estudiantes nuevos
# mezcla: nombres reales costeños + algunos graciosos (inofensivos)
NEW_EST = [
    ("ELVIS TEK",           "CARDENAS RUIZ"),
    ("ARMANDO",             "PAREDES SOLIS"),
    ("YUSLEIDY DAYANA",     "MANGONES PERTUZ"),
    ("JHON JAIRO",          "MONTENEGRO PADILLA"),
    ("BRAYAN STIVEN",       "PALOMINO ROZO"),
    ("YEISON DAVID",        "CARRENO HERNANDEZ"),
    ("USNAVY MARIA",        "RIBON CANTILLO"),
    ("DEIBY YHOAN",         "QUINTERO BOSSA"),
    ("ZOILA ROSA",          "PRADO SIERRA"),
    ("JUAN BAUTISTA",       "UPARELA MENA"),
    ("SANDY",               "CALO DOMINGUEZ"),
    ("ESTEBAN",             "QUITO MORELOS"),
    ("MILEIDY CAROLINA",    "PERTUZ ANAYA"),
    ("WILSON YESID",        "SAMPEDRO AVILA"),
    ("LEIDY JOHANA",        "MERCADO FONTALVO"),
    ("OTONIEL ANDRES",      "FERNANDEZ DE ARCO"),
    ("DUBIAN STIVE",        "BLANQUICETT ORTEGA"),
    ("YAJIRO",              "SITH MERCADO"),
    ("ANGIE PAOLA",         "CANTILLO FLOREZ"),
    ("ORLANDO ENRIQUE",     "TOLEDO MARTINEZ"),
    ("MARLON BRANDO",       "CARRILLO VEGA"),
    ("PEDRO PABLO",         "PEREZ PEREZ"),
    ("INGRID YOHANA",       "BARRIOS LOZANO"),
    ("KEVIN JHOJAN",        "LACOUTURE RIOS"),
    ("ROSALBA ENEIDA",      "TAMARA PICON"),
    ("FULANITO",            "DE TAL MARTINEZ"),
    ("BRAYAN MAICOL",       "ORTIZ CERCHIOLO"),
    ("DAYANA CAROLINA",     "INSIGNARES OJEDA"),
    ("ROBERTO CARLOS",      "HINOJOSA PADRON"),
    ("CINDY LORENA",        "PADILLA ROSALES"),
]

# ------------------------------------------------------------ textos reales
FORT_POS = [
    "El profesor explica con mucha claridad y siempre resuelve las dudas, se nota que domina el tema.",
    "Su disposición para atendernos fuera de clase es excelente, responde los correos el mismo día.",
    "Las clases son muy dinámicas, usa ejemplos reales de la industria y eso ayuda mucho a entender.",
    "Es muy organizado, desde el primer día nos dio el plan del curso y lo cumplió al pie de la letra.",
    "Trata a todos con respeto y crea un ambiente donde uno se anima a participar sin miedo.",
    "Los laboratorios que propone están muy bien pensados, se aprende haciendo.",
    "Es de los mejores docentes que he tenido en la carrera, se le nota la vocación.",
    "Retroalimenta los talleres con comentarios detallados, no solo pone la nota y ya.",
    "Domina muchísimo la materia y además sabe explicarla, cosa que no es tan común.",
    "Siempre llega puntual y aprovecha todo el tiempo de clase.",
    "Conecta los temas del curso con otras asignaturas, eso me ayudó a ver la carrera como un todo.",
    "Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.",
    "Sus evaluaciones son justas y coherentes con lo que enseña en clase.",
    "Le importa que de verdad aprendamos, no que solo pasemos la materia.",
    "Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.",
    "Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.",
    "Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.",
    "A pesar de ser una materia difícil, el profesor la hace llevadera e interesante.",
    "Escucha las sugerencias de los estudiantes y ajusta su metodología, eso se agradece.",
    "Excelente manejo de grupo, mantiene el respeto sin ser autoritario.",
    "Las asesorías personalizadas me salvaron el parcial, gran disposición.",
    "Explica el porqué de las cosas, no solo el cómo, y eso hace la diferencia.",
    "Muy buena actitud siempre, se nota que le gusta enseñar.",
    "Los ejemplos que pone son muy acordes con lo que luego preguntan en los exámenes.",
    "Es exigente pero justo, uno sale de la clase sabiendo de verdad.",
    "Fomenta el trabajo en equipo y las presentaciones, muy útil para la vida profesional.",
    "Su pasión por la materia es contagiosa, dan ganas de seguir aprendiendo.",
    "El material que comparte está muy completo y actualizado.",
]
FORT_NEU = [
    "Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.",
    "Tiene algunas clases buenas, otras no tanto, es irregular.",
    "Sabe la materia pero a veces le cuesta transmitirla.",
    "Es puntual y cumple el horario, aunque la metodología podría variar más.",
    "Algunas fortalezas puntuales como el manejo de la plataforma virtual.",
    "Responde las dudas pero de forma muy breve, uno queda con ganas de más.",
    "Sus exámenes son coherentes con lo visto en clase, eso es positivo.",
    "Hay clases donde se nota la experiencia, otras donde se siente improvisado.",
    "Es respetuoso con los estudiantes, eso es lo principal que rescato.",
    "Tiene buena disposición aunque las explicaciones no siempre quedan claras.",
    "El material de apoyo es útil aunque las clases presenciales son flojas.",
    "Da ejemplos de la vida real aunque no siempre conectan con el tema.",
    "Es estricto pero se aprende, aunque a veces su exigencia parece excesiva.",
    "Permite repreguntar y eso está bien.",
]
FORT_NEG = [
    "Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.",
    "Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.",
    "No destaco ninguna, le falta pedagogía y compromiso con el curso.",
    "No sé, llegaba tarde, improvisaba y no respondía mensajes.",
    "Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.",
    "No me vienen a la mente, fue una experiencia bastante decepcionante.",
    "Ninguna que valga la pena mencionar.",
    "Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.",
    "No noté fortalezas, espero que tome correctivos el próximo periodo.",
    "La única fortaleza es que el curso terminó.",
    "No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.",
    "Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.",
    "Ninguna relevante, el docente parecía desinteresado en el curso.",
    "No identifico fortalezas claras, fue un semestre muy flojo.",
]
MEJ_POS = [
    "Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.",
    "Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.",
    "Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.",
    "Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.",
    "Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.",
    "Poco, quizás más ejemplos en inglés para acostumbrarnos a la literatura técnica.",
    "Nada en particular, mantener el mismo nivel.",
    "Sería bueno que dedicara una clase a repaso general antes de cada corte.",
    "Nada que destacar, solo seguir con la misma metodología.",
    "Tal vez más talleres cortos, pero en general el curso estuvo muy bien.",
]
MEJ_NEU = [
    "Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.",
    "Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.",
    "Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.",
    "Responder los correos más rápido, a veces tardan una semana.",
    "Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.",
    "Las rúbricas de evaluación deberían publicarse antes de las entregas, no después.",
    "Mejorar la puntualidad en el inicio de la clase y de las asesorías.",
    "Variar la metodología, las clases son un poco monótonas.",
    "Ser más flexible con las fechas de entrega cuando coinciden con parciales de otras materias.",
    "Dar retroalimentación más detallada, no solo la nota.",
    "Actualizar algunos ejemplos que se sienten un poco viejos.",
    "Escuchar más al grupo cuando se piden cambios en el cronograma.",
]
MEJ_NEG = [
    "Llegar a tiempo a clase, por favor. Perdimos fácil 20 minutos cada sesión.",
    "Explicar con claridad: lee las diapositivas literalmente y no resuelve dudas.",
    "Ser más justo en las evaluaciones, pregunta cosas que nunca enseñó.",
    "Responder los correos y mensajes, nunca contestó ni uno en todo el semestre.",
    "Asistir a sus propias clases, faltó muchísimo y no avisaba ni reponía.",
    "Debería revisar su actitud, trata a los estudiantes con poco respeto cuando se equivocan.",
    "Cumplir el plan de curso que él mismo presentó, quedamos a mitad de temario.",
    "Calificar a tiempo: entregó las notas del primer corte una semana antes del tercero.",
    "Preparar las clases, se notaba la improvisación total.",
    "Cambiar completamente su metodología, solo dicta y no hay participación.",
    "Todo: puntualidad, claridad, respeto, evaluación. Necesita formación pedagógica urgente.",
    "Que los exámenes tengan relación con lo enseñado, parecían de otra materia.",
    "Bajar el tono con los estudiantes, humilla a quien pregunta.",
    "Ser más organizado: anunciaba trabajos un día para otro.",
    "No usar el celular en clase mientras nos ponía a hacer ejercicios de la guía.",
    "Aprender a usar la plataforma, subía archivos rotos y nunca los corrigió.",
    "Dar clase en vez de contar anécdotas personales media hora.",
    "Revisar la ortografía de sus exámenes y el material, da mala imagen.",
    "Escuchar: varios le reportamos problemas y nunca hizo nada.",
    "Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.",
    "Respetar los horarios de las asesorías que él mismo publicó.",
    "Todo. Fue la peor experiencia académica de la carrera hasta ahora.",
    "Más compromiso: la clase se sentía como un trámite para él.",
    "Que se actualice: sus ejemplos y herramientas son de hace 15 años.",
]

# mapeo perfil -> probabilidad de cada tono para fortalezas / mejoras
FORT_TONE = {"EXCELENTE": (.90,.09,.01), "BUENO": (.70,.20,.10),
             "REGULAR": (.38,.30,.32), "MALO": (.12,.23,.65)}
MEJ_TONE  = {"EXCELENTE": (.60,.30,.10), "BUENO": (.20,.42,.38),
             "REGULAR": (.10,.30,.60), "MALO": (.05,.15,.80)}
# (pos, neu, neg)

LIKERT_IDS = list(range(18, 25)) + list(range(27, 39))   # preguntas 1-7 y 10-21
TXT_FORT, TXT_MEJ = 25, 26                                # preguntas 8 y 9
STUDENTS = list(range(1, 81))

def q(s):           # escapa comillas para SQL
    return s.replace("'", "''")

def pick(seq, w):
    return random.choices(seq, weights=w, k=1)[0]

def tone(profile, table):
    return pick(["POSITIVO", "NEUTRO", "NEGATIVO"], table[profile])

def text_for(tone_, kind):
    if kind == "FORT":
        pool = {"POSITIVO": FORT_POS, "NEUTRO": FORT_NEU, "NEGATIVO": FORT_NEG}[tone_]
    else:
        pool = {"POSITIVO": MEJ_POS, "NEUTRO": MEJ_NEU, "NEGATIVO": MEJ_NEG}[tone_]
    return random.choice(pool)

def score(tone_):
    if tone_ == "POSITIVO":  return round(random.uniform(0.70, 0.99), 3)
    if tone_ == "NEGATIVO":  return round(random.uniform(0.70, 0.98), 3)
    return round(random.uniform(0.50, 0.75), 3)

def likert(profile):
    return pick([1, 2, 3, 4], PROFILES[profile])

def rand_date(a, b):
    import datetime as dt
    d0, d1 = dt.date(*a), dt.date(*b)
    return (d0 + dt.timedelta(days=random.randint(0, (d1 - d0).days))).isoformat()

PER1, PER2 = "2026-1", "2026-2"
out = []
w = out.append

w("""-- ============================================================
-- DATASET 2026 — 8 docentes, 80 estudiantes, 16 evaluaciones
-- 2026-1 CERRADA (todas respondidas) / 2026-2 ABIERTA (4+4 por estudiante)
-- ============================================================
BEGIN;

-- ---------- limpieza ----------
DELETE FROM respuesta_pregunta;
DELETE FROM encuesta_evaluacion;
DELETE FROM inscripcion_evaluacion;
DELETE FROM evaluacion_docente;
DELETE FROM pregunta_evaluacion WHERE estado = 'INACTIVA';
DELETE FROM categoria_pregunta_evaluacion
  WHERE codigo IN ('CONCEPTUAL','PEDAGOGICO','RELACIONES','COMENTARIOS');
DELETE FROM sesion;
""")

# ---------- docentes nuevos ----------
w("-- ---------- docentes nuevos ----------")
for did, doc, nom, ape, mail, _p in NEW_DOCENTES:
    w(f"INSERT INTO docente (numero_documento, nombres, apellidos, email) VALUES "
      f"('{doc}','{q(nom)}','{q(ape)}','{mail}');")

# ---------- asignaturas nuevas ----------
w("\n-- ---------- asignaturas nuevas (Ing. Sistemas) ----------")
for cod, nom, desc in NEW_ASIG:
    w(f"INSERT INTO asignatura (departamento_id, codigo, nombre, descripcion) VALUES "
      f"((SELECT id FROM departamento_academico WHERE codigo='DCC'),'{cod}','{q(nom)}','{q(desc)}');")

# ---------- estudiantes nuevos ----------
w("\n-- ---------- 30 estudiantes nuevos (ids 51-80) ----------")
for i, (nom, ape) in enumerate(NEW_EST, start=51):
    doc = f"100000{i:02d}"; cod = f"02224000{i:02d}"
    mail = (f"{nom.split()[0]}.{ape.split()[0]}{i}@estudiante.unicartagena.edu.co").lower()
    mail = "".join(c for c in unicodedata.normalize("NFD", mail) if unicodedata.category(c) != "Mn")
    sexo = random.choice(["MASCULINO", "FEMENINO"])
    tel = f"31{random.randint(0,5)}{random.randint(1000000,9999999)}"
    sem = random.randint(3, 9)
    w(f"INSERT INTO estudiante (numero_documento, nombres, apellidos, email, codigo, sexo, "
      f"telefono, direccion, programa_id, semestre, estado_academico, estado_ingreso, plan_estudios_id) "
      f"VALUES ('{doc}','{q(nom)}','{q(ape)}','{mail}','{cod}','{sexo}','{tel}',"
      f"'Cartagena, Colombia',1,{sem},'NORMAL','NO ESPECIFICA',1);")

# ---------- usuarios nuevos ----------
w("\n-- ---------- usuarios (login) estudiantes nuevos + docentes nuevos ----------")
w("""INSERT INTO usuario (username, password_hash, rol, nombre_mostrar, estudiante_id)
SELECT e.codigo, crypt(e.numero_documento, gen_salt('bf',10)), 'ESTUDIANTE',
       e.nombres||' '||e.apellidos, e.id
FROM estudiante e WHERE e.id BETWEEN 51 AND 80 ON CONFLICT (username) DO NOTHING;""")
w("""INSERT INTO usuario (username, password_hash, rol, nombre_mostrar, docente_id)
SELECT d.numero_documento, crypt(d.numero_documento, gen_salt('bf',10)), 'DOCENTE',
       d.nombres||' '||d.apellidos, d.id
FROM docente d WHERE d.id BETWEEN 5 AND 8 ON CONFLICT (username) DO NOTHING;""")

# ---------- evaluaciones ----------
w("\n-- ---------- 16 evaluaciones (8 por periodo) ----------")
for did, doc, nom, ape, mail, perf in DOCENTES:
    cod = MAP_2026_1[did]
    w(f"INSERT INTO evaluacion_docente (docente_id, asignatura_id, programa_id, grupo, periodo, "
      f"estudiantes_esperados, estado, fecha_creacion) VALUES "
      f"({did},(SELECT id FROM asignatura WHERE codigo='{cod}'),1,'A1','{PER1}',80,'CERRADA','2026-02-10');")
for did, doc, nom, ape, mail, perf in DOCENTES:
    cod = MAP_2026_2[did]
    w(f"INSERT INTO evaluacion_docente (docente_id, asignatura_id, programa_id, grupo, periodo, "
      f"estudiantes_esperados, estado, fecha_creacion) VALUES "
      f"({did},(SELECT id FROM asignatura WHERE codigo='{cod}'),1,'A1','{PER2}',80,'ABIERTA','2026-08-15');")

# ---------- inscripciones (todos x todas) ----------
w("\n-- ---------- inscripciones: 80 estudiantes x 16 evaluaciones ----------")
w("""INSERT INTO inscripcion_evaluacion (evaluacion_id, estudiante_id)
SELECT ev.id, e.id FROM evaluacion_docente ev CROSS JOIN estudiante e
ORDER BY ev.id, e.id;""")

# ---------- encuestas + respuestas ----------
# mapa evaluacion -> (docente, periodo)
ev_p1 = {did: MAP_2026_1[did] for did in range(1, 9)}
ev_p2 = {did: MAP_2026_2[did] for did in range(1, 9)}
perfil = {d[0]: d[5] for d in DOCENTES}

# 2026-1: todos responden; 2026-2: 4 de 8 al azar por estudiante
answered = {s: set(random.sample(range(1, 9), 4)) for s in STUDENTS}

w("\n-- ---------- encuestas ----------")
for did in range(1, 9):   # 2026-1
    rows = ",".join(f"({did},'{PER1}',{s},'{rand_date((2026,5,5),(2026,6,12))}')" for s in STUDENTS)
    w(f"""INSERT INTO encuesta_evaluacion (evaluacion_id, estudiante_id, fecha_respuesta)
SELECT ev.id, s.est, s.f::timestamp
FROM (VALUES {rows}) AS s(doc,per,est,f)
JOIN evaluacion_docente ev ON ev.docente_id=s.doc AND ev.periodo=s.per;""")
for did in range(1, 9):   # 2026-2 (solo las 4 respondidas por estudiante)
    rows = ",".join(f"({did},'{PER2}',{s},'{rand_date((2026,10,18),(2026,10,25))}')"
                    for s in STUDENTS if did in answered[s])
    w(f"""INSERT INTO encuesta_evaluacion (evaluacion_id, estudiante_id, fecha_respuesta)
SELECT ev.id, s.est, s.f::timestamp
FROM (VALUES {rows}) AS s(doc,per,est,f)
JOIN evaluacion_docente ev ON ev.docente_id=s.doc AND ev.periodo=s.per;""")

w("\n-- ---------- respuestas (por evaluacion) ----------")
for did in range(1, 9):
    prof = perfil[did]
    # 2026-1
    vals = []
    for s in STUDENTS:
        for pid in LIKERT_IDS:
            vals.append(f"({s},{pid},{likert(prof)},NULL,NULL,NULL)")
        t = tone(prof, FORT_TONE)
        vals.append(f"({s},{TXT_FORT},NULL,'{q(text_for(t,'FORT'))}','{t}',{score(t)})")
        t = tone(prof, MEJ_TONE)
        vals.append(f"({s},{TXT_MEJ},NULL,'{q(text_for(t,'MEJ'))}','{t}',{score(t)})")
    w(f"""INSERT INTO respuesta_pregunta (encuesta_id, pregunta_id, valor, texto_respuesta,
  sentimiento, sentimiento_score, sentimiento_metodo)
SELECT e.id, s.pid, s.v, s.txt, s.sen, s.sc, CASE WHEN s.sen IS NULL THEN NULL ELSE 'MODELO' END
FROM (VALUES {','.join(vals)}) AS s(est,pid,v,txt,sen,sc)
JOIN evaluacion_docente ev ON ev.docente_id={did} AND ev.periodo='{PER1}'
JOIN encuesta_evaluacion e ON e.evaluacion_id=ev.id AND e.estudiante_id=s.est;""")
    # 2026-2
    vals = []
    for s in STUDENTS:
        if did not in answered[s]:
            continue
        for pid in LIKERT_IDS:
            vals.append(f"({s},{pid},{likert(prof)},NULL,NULL,NULL)")
        t = tone(prof, FORT_TONE)
        vals.append(f"({s},{TXT_FORT},NULL,'{q(text_for(t,'FORT'))}','{t}',{score(t)})")
        t = tone(prof, MEJ_TONE)
        vals.append(f"({s},{TXT_MEJ},NULL,'{q(text_for(t,'MEJ'))}','{t}',{score(t)})")
    if vals:
        w(f"""INSERT INTO respuesta_pregunta (encuesta_id, pregunta_id, valor, texto_respuesta,
  sentimiento, sentimiento_score, sentimiento_metodo)
SELECT e.id, s.pid, s.v, s.txt, s.sen, s.sc, CASE WHEN s.sen IS NULL THEN NULL ELSE 'MODELO' END
FROM (VALUES {','.join(vals)}) AS s(est,pid,v,txt,sen,sc)
JOIN evaluacion_docente ev ON ev.docente_id={did} AND ev.periodo='{PER2}'
JOIN encuesta_evaluacion e ON e.evaluacion_id=ev.id AND e.estudiante_id=s.est;""")

w("\nCOMMIT;")

with open(OUT, "w", encoding="utf-8") as f:
    f.write("\n".join(out))
print(f"OK -> {OUT} ({sum(1 for l in out if l.startswith('INSERT INTO respuesta'))} bloques de respuestas)")
