"""
Microservicio de análisis de sentimiento en español para academiCORE.
Envuelve la librería sentiment-analysis-spanish (modelo pre-entrenado
sobre ~800k reseñas en español) detrás de un API REST mínima.

Uso local:
    pip install -r requirements.txt
    python app.py
"""
from flask import Flask, jsonify, request
from sentiment_analysis_spanish import sentiment_analysis

app = Flask(__name__)
_analizador = sentiment_analysis.SentimentAnalysisSpanish()

UMBRAL_POSITIVO = 0.6
UMBRAL_NEGATIVO = 0.4


@app.get("/salud")
def salud():
    return jsonify(estado="ok")


@app.post("/sentimiento")
def sentimiento():
    data = request.get_json(silent=True) or {}
    texto = (data.get("texto") or "").strip()
    if not texto:
        return jsonify(error="El campo 'texto' es requerido"), 400

    score = float(_analizador.sentiment(texto))
    if score >= UMBRAL_POSITIVO:
        etiqueta = "POSITIVO"
    elif score <= UMBRAL_NEGATIVO:
        etiqueta = "NEGATIVO"
    else:
        etiqueta = "NEUTRO"

    return jsonify(sentimiento=etiqueta, score=round(score, 4))


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
