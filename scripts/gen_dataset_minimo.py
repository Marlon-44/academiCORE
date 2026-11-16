#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Genera scripts/_dataset_minimo.sql — dataset mínimo demo (petición de Marlon).

Modelo final (tras purgear TODO lo transaccional):
- 1 admin, 4 docentes (nombres de doble sentido), 6 estudiantes.
- 6 asignaturas de Ing. de Sistemas: 2 docentes x 2 asignaturas + 2 x 1.
- 6 evaluaciones ABIERTA 2026-2 (una por docente-asignatura, grupo A1).
- Cada estudiante inscrito en las 6 → 2 encuestas YA RESPONDIDAS
  (en las evaluaciones de los 2 primeros docentes → 6 respuestas c/u
  para alimentar las estadísticas) + 4 pendientes.
- Preguntas viejas 101-117 se borran; se crean 5 INACTIVAS (101-105)
  con el formato del instrumento anterior (PVD003).
- Catálogo académico (universidad/facultad/depto/programa/campus) se conserva.

Salida: SOLO SQL, no toca la BD directamente.
"""

import random
import unicodedata

random.seed(20261115)

OUT = "scripts/_dataset_minimo.sql"

# ---------------------------------------------------------------- perfiles
# (w1,w2,w3,w4) = pesos para valor Likert 1..4 (escala SIG 1-4)
PROFILES = {
    "EXCELENTE": (0.03, 0.07, 0.22, 0.68),
    "BUENO":     (0.04, 0.12, 0.46, 0.38),
    "REGULAR":   (0.10, 0.36, 0.40, 0.14),
    "MALO":      (0.46, 0.37, 0.13, 0.04),
}

# docentes: (id, doc, nombres, apellidos, email, perfil)
DOCENTES = [
    (1, "73001001", "AITOR",      "MENTA PARDO",    "amenta@unicartagena.edu.co",    "EXCELENTE"),
    (2, "73001002", "ELMER",      "CURIO SALCEDO",  "ecurio@unicartagena.edu.co",    "MALO"),
    (3, "73001003", "SUSANA",     "ORIA RODAS",     "soria@unicartagena.edu.co",     "BUENO"),
    (4, "73001004", "MARIO",      "NETA MORA",      "mneta@unicartagena.edu.co",     "REGULAR"),
]

# docente -> [asignaturas que dicta]  (2+2+1+1 = 6)
MAP_DOC_ASIG = {
    1: ["EP1101", "EP1102"],
    2: ["EP2101", "EP2201"],
    3: ["EP3101"],
    4: ["EP1301"],
}

ASIGNATURAS = [
    ("EP1101", "Programación I",              "Lógica de programación y Python"),
    ("EP1102", "Programación II",             "POO, estructuras y desarrollo en Java"),
    ("EP2101", "Estructuras de Datos",        "Listas, pilas, colas, árboles y grafos"),
    ("EP2201", "Redes de Computadores",       "Modelo OSI, TCP/IP y servicios de red"),
    ("EP3101", "Inteligencia Artificial",     "Búsqueda, aprendizaje automático y PLN"),
    ("EP1301", "Ingeniería de Software I",    "Procesos, requisitos y modelado UML"),
]

# evaluaciones con encuestas respondidas: (docente, asignatura) → perfil
EV_RESPONDIDA = {1: "EP1101", 2: "EP2101"}

# estudiantes: (id, doc, codigo, nombres, apellidos) — nombres de doble sentido
ESTUDIANTES = [
    (1, "20001001", "0222500001", "ELSA",     "PATO JIMENEZ"),
    (2, "20001002", "0222500002", "ESTEBAN",  "QUITO MORELOS"),
    (3, "20001003", "0222500003", "ELVIS TEK","CARDENAS RUIZ"),
    (4, "20001004", "0222500004", "LOLA",     "MENTO VARGAS"),
    (5, "20001005", "0222500005", "ZOILA",    "VACA RANGEL"),
    (6, "20001006", "0222500006", "ELBA",     "LAZO PERTUZ"),
]

# 5 preguntas INACTIVAS con el formato del instrumento anterior (PVD003)
PREGUNTAS_VIEJAS = [
    (101, "CONCEPTUAL",  "¿El docente articula los contenidos del curso o asignatura, con otras asignaturas?", "LIKERT"),
    (102, "CONCEPTUAL",  "¿El docente cumple con el sistema de evaluación establecido en el proyecto docente?", "LIKERT"),
    (103, "PEDAGOGICO",  "¿El docente promueve la participación de sus estudiantes?", "LIKERT"),
    (104, "RELACIONES",  "¿El docente trata con respeto a los estudiantes?", "LIKERT"),
    (105, "RELACIONES",  "¿Qué sugerencias tiene para mejorar la labor del docente?", "TEXTO"),
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
    "Usa muy bien las TIC: la plataforma, videos cortos y quizzes que refuerzan lo visto en clase.",
    "Sus evaluaciones son justas y coherentes con lo que enseña en clase.",
    "Le importa que de verdad aprendamos, no que solo pasemos la materia.",
    "Tiene muy buena pedagogía, va de lo simple a lo complejo sin que uno se pierda.",
    "Motiva a investigar por cuenta propia y siempre recomienda material extra bueno.",
    "Su forma de evaluar es transparente, las rúbricas están claras desde el inicio.",
]
FORT_NEU = [
    "Cumple con lo básico del curso, explica los temas aunque a veces de forma un poco rápida.",
    "Tiene algunas clases buenas, otras no tanto, es irregular.",
    "Sabe la materia pero a veces le cuesta transmitirla.",
    "Es puntual y cumple el horario, aunque la metodología podría variar más.",
    "Responde las dudas pero de forma muy breve, uno queda con ganas de más.",
    "Sus exámenes son coherentes con lo visto en clase, eso es positivo.",
]
FORT_NEG = [
    "Sinceramente no le encuentro fortalezas, la clase fue muy deficiente este semestre.",
    "Muy pocas, quizás el único punto a favor es que entregaba las notas rápido.",
    "No destaco ninguna, le falta pedagogía y compromiso con el curso.",
    "Pocas fortalezas visibles; lo único rescatable es que la materia es interesante por sí sola.",
    "No me vienen a la mente, fue una experiencia bastante decepcionante.",
    "Ninguna que valga la pena mencionar.",
    "Tal vez el conocimiento del tema existe, pero no logra transmitirlo en absoluto.",
    "No hay, francamente. Faltaba a clases y no daba razón de sus ausencias.",
    "Me cuesta encontrar fortalezas: desorden en el temario y evaluaciones incoherentes.",
    "Ninguna relevante, el docente parecía desinteresado en el curso.",
]
MEJ_POS = [
    "Muy poco por mejorar, quizás dar más tiempo para los proyectos finales.",
    "Nada relevante, es un excelente docente. Quizás más ejercicios de práctica.",
    "Podría compartir las diapositivas un poco antes de cada clase, por lo demás todo bien.",
    "Solo mejoraría el tiempo de retroalimentación de los parciales, el resto es muy bueno.",
    "Casi nada, tal vez usar más recursos visuales en algunas clases teóricas.",
    "Nada en particular, mantener el mismo nivel.",
    "Sería bueno que dedicara una clase a repaso general antes de cada corte.",
    "Tal vez más talleres cortos, pero en general el curso estuvo muy bien.",
]
MEJ_NEU = [
    "Debería organizar mejor los temas, a veces se salta de un tema a otro sin transición.",
    "Mejorar la claridad al explicar, a veces asume que sabemos cosas que no hemos visto.",
    "Dedicar más tiempo a ejemplos prácticos y menos a teoría leída de las diapositivas.",
    "Responder los correos más rápido, a veces tardan una semana.",
    "Podría mejorar el manejo del tiempo, a veces se queda corto y no alcanza a explicar todo.",
    "Variar la metodología, las clases son un poco monótonas.",
    "Dar retroalimentación más detallada, no solo la nota.",
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
    "Dar clase en vez de contar anécdotas personales media hora.",
    "Evaluar lo que enseña y enseñar lo que evalúa, es lo mínimo.",
]

FORT_TONE = {"EXCELENTE": (.90,.09,.01), "BUENO": (.70,.20,.10),
             "REGULAR": (.38,.30,.32), "MALO": (.12,.23,.65)}
MEJ_TONE  = {"EXCELENTE": (.60,.30,.10), "BUENO": (.20,.42,.38),
             "REGULAR": (.10,.30,.60), "MALO": (.05,.15,.80)}

# numeros SIG: Likert 1-7,10-21 (19) / texto 8,9
LIKERT_NUM = list(range(1, 8)) + list(range(10, 22))
NUM_FORT, NUM_MEJ = 8, 9
PERIODO = "2026-2"

def q(s):  # escapa comillas para SQL
    return s.replace("'", "''")

def pick(seq, w):
    return random.choices(seq, weights=w, k=1)[0]

def tone(profile, table):
    return pick(["POSITIVO", "NEUTRO", "NEGATIVO"], table[profile])

def text_for(tone_, kind):
    pool = {"POSITIVO": FORT_POS if kind == "FORT" else MEJ_POS,
            "NEUTRO":   FORT_NEU if kind == "FORT" else MEJ_NEU,
            "NEGATIVO": FORT_NEG if kind == "FORT" else MEJ_NEG}[tone_]
    return random.choice(pool)

def score(tone_):
    if tone_ == "POSITIVO": return round(random.uniform(0.70, 0.99), 3)
    if tone_ == "NEGATIVO": return round(random.uniform(0.70, 0.98), 3)
    return round(random.uniform(0.50, 0.75), 3)

def likert(profile):
    return pick([1, 2, 3, 4], PROFILES[profile])

# ------------------------------------------------------------------ SQL
out = []
w = out.append

w("""-- ============================================================
-- DATASET MÍNIMO — 1 admin, 4 docentes, 6 estudiantes, 6 asignaturas,
-- 6 evaluaciones ABIERTA 2026-2, 2 encuestas respondidas por estudiante
-- en los mismos 2 docentes (6 respuestas c/u para estadísticas).
-- ============================================================
BEGIN;

-- ---------- 1. PURGA transaccional ----------
DELETE FROM respuesta_pregunta;
DELETE FROM encuesta_evaluacion;
DELETE FROM inscripcion_evaluacion;
DELETE FROM evaluacion_docente;
DELETE FROM sesion;
DELETE FROM usuario;
DELETE FROM factura;
DELETE FROM documento_aspirante;
DELETE FROM inscripcion;
DELETE FROM aspirante;
DELETE FROM oferta_admision;
DELETE FROM plan_asignatura;
DELETE FROM estudiante;
DELETE FROM docente;
DELETE FROM asignatura;
DELETE FROM pregunta_evaluacion WHERE numero >= 101;

-- ---------- 2. Identidades de vuelta a 1 (dataset determinista) ----------
ALTER TABLE estudiante           ALTER COLUMN id RESTART WITH 1;
ALTER TABLE docente              ALTER COLUMN id RESTART WITH 1;
ALTER TABLE asignatura           ALTER COLUMN id RESTART WITH 1;
ALTER TABLE evaluacion_docente   ALTER COLUMN id RESTART WITH 1;
ALTER TABLE inscripcion_evaluacion ALTER COLUMN id RESTART WITH 1;
ALTER TABLE encuesta_evaluacion  ALTER COLUMN id RESTART WITH 1;
ALTER TABLE respuesta_pregunta   ALTER COLUMN id RESTART WITH 1;
ALTER SEQUENCE usuario_id_seq RESTART WITH 1;
ALTER SEQUENCE sesion_id_seq RESTART WITH 1;

-- ---------- 3. Admin ----------
INSERT INTO usuario (username, password_hash, rol, nombre_mostrar)
VALUES ('admin', crypt('admin123', gen_salt('bf',10)), 'ADMIN', 'Administrador del sistema');
""")

# ---------- docentes ----------
w("\n-- ---------- 4 docentes ----------")
DEPTO = "(SELECT id FROM departamento_academico WHERE codigo='DCC')"
VINC = ["PLANTA_TIEMPO_COMPLETO", "CATEDRA", "OCASIONAL", "PLANTA_MEDIO_TIEMPO"]
for (did, doc, nom, ape, mail, _p), vin in zip(DOCENTES, VINC):
    w(f"INSERT INTO docente (numero_documento, nombres, apellidos, email, estado, "
      f"sexo, telefono, direccion, tipo_vinculacion, escalafon, nivel_formacion, departamento_id, fecha_ingreso) VALUES "
      f"('{doc}','{nom}','{ape}','{mail}','ACTIVO','MASCULINO','30{did}55501{did}0',"
      f"'Cartagena, Colombia','{vin}','TITULAR','DOCTORADO',{DEPTO},'2018-01-15');")

# ---------- asignaturas ----------
w("\n-- ---------- 6 asignaturas ----------")
for cod, nom, desc in ASIGNATURAS:
    w(f"INSERT INTO asignatura (departamento_id, codigo, nombre, descripcion, estado) VALUES "
      f"({DEPTO},'{cod}','{q(nom)}','{q(desc)}','ACTIVA');")

# ---------- estudiantes ----------
w("\n-- ---------- 6 estudiantes ----------")
for eid, doc, cod, nom, ape in ESTUDIANTES:
    base = f"{nom.split()[0]}.{ape.split()[0]}{eid}@estudiante.unicartagena.edu.co".lower()
    mail = "".join(c for c in unicodedata.normalize("NFD", base)
                   if unicodedata.category(c) != "Mn")
    sexo = random.choice(["MASCULINO", "FEMENINO"])
    sem = random.randint(3, 9)
    w(f"INSERT INTO estudiante (numero_documento, nombres, apellidos, email, estado, codigo, sexo, "
      f"telefono, direccion, programa_id, semestre, estado_academico, estado_ingreso, plan_estudios_id) VALUES "
      f"('{doc}','{q(nom)}','{q(ape)}','{mail}','ACTIVO','{cod}','{sexo}',"
      f"'31055500{eid}0','Cartagena, Colombia',1,{sem},'NORMAL','NO ESPECIFICA',1);")

# ---------- usuarios ----------
w("\n-- ---------- usuarios estudiantes + docentes ----------")
w("""INSERT INTO usuario (username, password_hash, rol, nombre_mostrar, estudiante_id)
SELECT e.codigo, crypt(e.numero_documento, gen_salt('bf',10)), 'ESTUDIANTE',
       e.nombres||' '||e.apellidos, e.id
FROM estudiante e ON CONFLICT (username) DO NOTHING;""")
w("""INSERT INTO usuario (username, password_hash, rol, nombre_mostrar, docente_id)
SELECT d.numero_documento, crypt(d.numero_documento, gen_salt('bf',10)), 'DOCENTE',
       d.nombres||' '||d.apellidos, d.id
FROM docente d ON CONFLICT (username) DO NOTHING;""")

# ---------- evaluaciones (6, ABIERTA) ----------
w("\n-- ---------- 6 evaluaciones ABIERTA 2026-2 ----------")
ev_id = 0
ev_ids = {}  # (docente_id, asig_codigo) -> id
for did, asigs in MAP_DOC_ASIG.items():
    for cod in asigs:
        ev_id += 1
        ev_ids[(did, cod)] = ev_id
        w(f"INSERT INTO evaluacion_docente (id, docente_id, asignatura_id, programa_id, grupo, periodo, "
          f"estudiantes_esperados, estado, fecha_creacion) OVERRIDING SYSTEM VALUE VALUES "
          f"({ev_id},{did},(SELECT id FROM asignatura WHERE codigo='{cod}'),1,'A1','{PERIODO}',6,"
          f"'ABIERTA','2026-10-17');")

# ---------- inscripciones: cada estudiante x las 6 ----------
w("\n-- ---------- inscripciones: 6 estudiantes x 6 evaluaciones ----------")
w("""INSERT INTO inscripcion_evaluacion (evaluacion_id, estudiante_id)
SELECT ev.id, e.id FROM evaluacion_docente ev CROSS JOIN estudiante e
ORDER BY ev.id, e.id;""")

# ---------- encuestas respondidas: 2 por estudiante ----------
w("\n-- ---------- 12 encuestas: cada estudiante responde prof1 y prof2 ----------")
resp_vals = []
enc_id = 0
for did, perfil in [(1, DOCENTES[0][5]), (2, DOCENTES[1][5])]:
    cod = EV_RESPONDIDA[did]
    evid = ev_ids[(did, cod)]
    for eid, doc, scod, nom, ape in ESTUDIANTES:
        enc_id += 1
        t_f = tone(perfil, FORT_TONE)
        t_m = tone(perfil, MEJ_TONE)
        w(f"INSERT INTO encuesta_evaluacion (id, evaluacion_id, estudiante_id, fecha_respuesta) OVERRIDING SYSTEM VALUE VALUES "
          f"({enc_id},{evid},{eid},'2026-11-0{eid} 10:00:00');")
        # Likert
        for n in LIKERT_NUM:
            v = likert(perfil)
            resp_vals.append(
                f"INSERT INTO respuesta_pregunta (encuesta_id, pregunta_id, valor) VALUES "
                f"({enc_id},(SELECT id FROM pregunta_evaluacion WHERE numero={n}),{v});")
        # Texto fortalezas / mejoras con sentimiento
        for n, kind, t in [(NUM_FORT, "FORT", t_f), (NUM_MEJ, "MEJ", t_m)]:
            txt = q(text_for(t, kind))
            resp_vals.append(
                f"INSERT INTO respuesta_pregunta (encuesta_id, pregunta_id, valor, texto_respuesta, "
                f"sentimiento, sentimiento_score, sentimiento_metodo) VALUES "
                f"({enc_id},(SELECT id FROM pregunta_evaluacion WHERE numero={n}),3,"
                f"'{txt}','{t}',{score(t)},'MODELO');")

w("\n".join(resp_vals))

# ---------- 5 preguntas INACTIVAS formato antiguo ----------
w("""
-- ---------- 5 preguntas INACTIVAS (formato instrumento anterior PVD003) ----------
-- Se recrean las categorías del instrumento viejo para conservar el formato.
INSERT INTO categoria_pregunta_evaluacion (codigo, nombre, orden) VALUES
    ('CONCEPTUAL', 'Conceptual', 10),
    ('PEDAGOGICO', 'Pedagógico', 11),
    ('RELACIONES', 'Relaciones', 12)
ON CONFLICT (codigo) DO NOTHING;""")
for num, cat, txt, tipo in PREGUNTAS_VIEJAS:
    w(f"INSERT INTO pregunta_evaluacion (categoria_id, numero, texto, tipo, estado) VALUES "
      f"((SELECT id FROM categoria_pregunta_evaluacion WHERE codigo='{cat}'),{num},'{q(txt)}','{tipo}','INACTIVA');")

w("""
-- ---------- verificación rápida ----------
-- esperado: 6 estudiantes, 4 docentes, 6 asignaturas, 6 evaluaciones,
-- 36 inscripciones, 12 encuestas, 252 respuestas, 11 usuarios,
-- 21 preguntas ACTIVA + 5 INACTIVA
COMMIT;
""")

with open(OUT, "w", encoding="utf-8") as f:
    f.write("\n".join(out) + "\n")

print(f"OK -> {OUT}")
