"""
Genera encuestas de evaluación docente de prueba a través de la API real.

Para cada evaluación (docente + materia + grupo + periodo):
  1. Consulta los estudiantes inscritos (GET /evaluaciones/{id}/inscritos).
  2. Hace que ~80% de los inscritos respondan la encuesta
     (POST /encuestas con las 17 preguntas activas).
  3. Cada respuesta de texto (P16/P17) corre por el analizador de
     sentimiento real del backend.

Cada docente tiene un "perfil" (excelente / bueno / regular / flojo) que
determina la distribución Likert y los comentarios, para que los reportes
salgan variados.

Uso:
    python scripts/seed_encuestas.py                # todas las evaluaciones
    python scripts/seed_encuestas.py --prob 0.9     # ~90% de participación
    python scripts/seed_encuestas.py --base http://localhost:8080
"""

import argparse
import random
import sys
import urllib.request
import urllib.error
import json

BASE = "http://localhost:8080/api/v1/evaluacion-docente"

# Perfil por evaluación: (índice lista, sesgo Likert, estilo comentario)
# sesgo: pesos para valores 1..5
PERFILES = {
    # Chanchí — IHC: muy buen docente
    "EP1303": {
        "pesos": [2, 6, 20, 45, 27],
        "tono": "excelente",
    },
    # Chanchí — Software Libre: bueno
    "2222123": {
        "pesos": [3, 10, 30, 40, 17],
        "tono": "bueno",
    },
    # Prof. Ruiz — Bases de Datos: regular/mixto
    "EP2201": {
        "pesos": [10, 20, 35, 25, 10],
        "tono": "regular",
    },
    # Prof. Mendoza — Programación II: flojo
    "EP1102": {
        "pesos": [20, 30, 30, 15, 5],
        "tono": "flojo",
    },
    # Prof. Paternina — Redes: bueno
    "EP2103": {
        "pesos": [5, 12, 30, 35, 18],
        "tono": "bueno",
    },
}

MEJORAS = {
    "excelente": [
        "Quizás incluir más proyectos prácticos, aunque el curso es excelente en general.",
        "Sería bueno que compartiera aún más material complementario, aunque la clase es muy completa.",
        "Nada que mejorar realmente, el docente maneja muy bien el curso.",
        "Podría subir las notas un poco más rápido, es lo único que se me ocurre.",
        "Más horas de consulta, porque las que tiene se llenan de inmediato.",
    ],
    "bueno": [
        "Debería dar más ejemplos aplicados en algunos temas que son abstractos.",
        "A veces avanza un poco rápido, convendría pausas para asimilar.",
        "Mejorar la retroalimentación de los talleres, tarda en devolverlos.",
        "Podría usar más recursos visuales en las diapositivas.",
        "Incluir más ejercicios de práctica antes de los parciales.",
    ],
    "regular": [
        "Necesita mejorar la organización de la clase, a veces no queda claro el objetivo.",
        "Debería actualizar los ejemplos, algunos son de hace varios años.",
        "Falta más interacción con los estudiantes, la clase es casi toda monólogo.",
        "Las evaluaciones no siempre reflejan lo visto en clase.",
        "Debería empezar puntual y avisar con tiempo cuando cancela.",
    ],
    "flojo": [
        "Debe mejorar bastante: llega tarde, no responde correos y las notas se demoran meses.",
        "La clase es poco clara, lee literalmente las diapositivas sin explicar.",
        "No hay retroalimentación de los trabajos, uno no sabe en qué está mal.",
        "Debería preparar mejor las clases, se nota improvisación.",
        "Falta respeto con los estudiantes cuando hacen preguntas.",
    ],
}

FORTALEZAS = {
    "excelente": [
        "Domina completamente el tema y explica con ejemplos reales muy claros.",
        "Es un docente excepcional: responde todas las dudas y motiva a investigar más.",
        "Su forma de evaluar es justa y da retroalimentación detallada y rápida.",
        "Tiene muy buena relación con los estudiantes y mucha disposición.",
        "Las clases son dinámicas, se aprende muchísimo y el tiempo vuela.",
    ],
    "bueno": [
        "Conoce bien la materia y se nota la experiencia profesional.",
        "Explica bien la mayoría de temas y es paciente con las dudas.",
        "Es puntual, organizado y cumple lo que propone en el sílabo.",
        "Trata bien a los estudiantes y el ambiente de clase es bueno.",
        "Sus ejemplos del mundo laboral ayudan a entender la teoría.",
    ],
    "regular": [
        "Se nota que sabe del tema aunque a veces le cuesta transmitirlo.",
        "Es responsable y puntual, eso se valora.",
        "Tiene buena disposición cuando se le pregunta directamente.",
        "El material que comparte es útil para estudiar.",
        "Algunas clases específicas resultaron muy buenas.",
    ],
    "flojo": [
        "El contenido del curso es interesante, lástima la forma de enseñarlo.",
        "Al menos es estricto con la asistencia al aula.",
        "Se nota que conoce el tema, aunque no logre enseñarlo.",
        "Los trabajos prácticos son útiles, eso rescata algo del curso.",
        "No logro destacar mucho, pero el tema es importante.",
    ],
}

GENERICOS = [
    "El curso estuvo bien en general.",
    "Fue una experiencia normal, sin mayores comentarios.",
    "La materia es importante para la carrera.",
]


def http(method, path, payload=None):
    data = json.dumps(payload).encode() if payload is not None else None
    req = urllib.request.Request(
        BASE + path, data=data, method=method,
        headers={"Content-Type": "application/json"},
    )
    try:
        with urllib.request.urlopen(req, timeout=30) as res:
            body = res.read()
            return json.loads(body) if body else None
    except urllib.error.HTTPError as e:
        raise RuntimeError(f"{method} {path} -> {e.code}: {e.read().decode()[:300]}")
    except urllib.error.URLError as e:
        print(f"\nError de conexión con {BASE}: {e.reason}", file=sys.stderr)
        sys.exit(1)


def perfil_para(evaluacion, preguntas):
    """Perfil según la asignatura de la evaluación (por código)."""
    codigo = (evaluacion.get("asignaturaCodigo") or "").strip()
    return PERFILES.get(codigo, PERFILES["EP2201"])


def respuestas_para(preguntas, pesos, tono):
    respuestas = []
    for p in preguntas:
        item = {"preguntaId": p["id"]}
        if p["tipo"] == "LIKERT":
            item["valor"] = random.choices([1, 2, 3, 4, 5], weights=pesos)[0]
        else:
            numero = p.get("numero") or 0
            if random.random() < 0.08:  # unas pocas respuestas genéricas
                item["textoRespuesta"] = random.choice(GENERICOS)
            elif numero == 16:  # mejoras
                item["textoRespuesta"] = random.choice(MEJORAS[tono])
            else:  # fortalezas / otra pregunta de texto
                item["textoRespuesta"] = random.choice(FORTALEZAS[tono])
        respuestas.append(item)
    return respuestas


def main():
    global BASE

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", default=BASE, help="URL base del endpoint de evaluación")
    parser.add_argument("--prob", type=float, default=0.8,
                        help="Probabilidad de que un inscrito responda (default 0.8)")
    parser.add_argument("--seed", type=int, default=42, help="Semilla aleatoria")
    args = parser.parse_args()

    BASE = args.base.rstrip("/")
    random.seed(args.seed)

    preguntas = http("GET", "/preguntas")
    likerts = sum(1 for p in preguntas if p["tipo"] == "LIKERT")
    textos = sum(1 for p in preguntas if p["tipo"] == "TEXTO")
    print(f"Instrumento: {len(preguntas)} preguntas ({likerts} LIKERT + {textos} TEXTO)")

    evaluaciones = http("GET", "/evaluaciones")
    print(f"Evaluaciones encontradas: {len(evaluaciones)}\n")

    total_ok, total_skip, total_err = 0, 0, 0
    for ev in evaluaciones:
        label = f"{ev.get('asignaturaCodigo') or ev['asignaturaId']} · G{ev['grupo']} · {ev['periodo']}"
        if ev.get("estado") != "ABIERTA":
            print(f"  {label}: CERRADA, se omite")
            continue

        inscritos = http("GET", f"/evaluaciones/{ev['id']}/inscritos")
        respondidas = {
            enc.get("estudianteId")
            for enc in http("GET", f"/evaluaciones/{ev['id']}/encuestas")
        }
        perfil = perfil_para(ev, preguntas)
        ok = skip = err = 0

        for est in inscritos:
            if est["id"] in respondidas:
                skip += 1
                continue
            if random.random() >= args.prob:
                skip += 1
                continue
            payload = {
                "evaluacionId": ev["id"],
                "estudianteId": est["id"],
                "respuestas": respuestas_para(preguntas, perfil["pesos"], perfil["tono"]),
            }
            try:
                http("POST", "/encuestas", payload)
                ok += 1
            except RuntimeError as e:
                err += 1
                print(f"    ! {est['nombreCompleto']}: {e}")

        total_ok += ok
        total_skip += skip
        total_err += err
        print(f"  {label} [{perfil['tono']}]: {ok} encuestas, {skip} sin responder, {err} errores")

    print(f"\nTotal: {total_ok} encuestas creadas, {total_skip} omitidas, {total_err} errores")


if __name__ == "__main__":
    main()
