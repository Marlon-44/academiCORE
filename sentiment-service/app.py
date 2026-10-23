"""
Microservicio de análisis de sentimiento en español para academiCORE.

Usa un DistilBERT multilingüe afinado para sentimiento
(lxyuan/distilbert-base-multilingual-cased-sentiments-student),
mucho más preciso que el viejo Naive Bayes de sentiment-analysis-spanish
sobre comentarios académicos.

Uso local:
    pip install torch --index-url https://download.pytorch.org/whl/cpu
    pip install -r requirements.txt
    python app.py
"""
from flask import Flask, jsonify, request
from transformers import pipeline

MODELO = "lxyuan/distilbert-base-multilingual-cased-sentiments-student"

app = Flask(__name__)
_clf = pipeline("sentiment-analysis", model=MODELO)

ETIQUETAS = {
    "positive": "POSITIVO",
    "negative": "NEGATIVO",
    "neutral": "NEUTRO",
}


@app.get("/salud")
def salud():
    return jsonify(estado="ok", modelo=MODELO)


@app.post("/sentimiento")
def sentimiento():
    data = request.get_json(silent=True) or {}
    texto = (data.get("texto") or "").strip()
    if not texto:
        return jsonify(error="El campo 'texto' es requerido"), 400

    resultado = _clf(texto, truncation=True, max_length=512)[0]
    etiqueta = ETIQUETAS.get(resultado["label"].lower(), "NEUTRO")
    return jsonify(sentimiento=etiqueta, score=round(float(resultado["score"]), 4))


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
