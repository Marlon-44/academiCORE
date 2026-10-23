FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
# Torch CPU-only (sin dependencias CUDA, ~200MB vs ~2.5GB)
RUN pip install --no-cache-dir torch==2.5.1+cpu \
        --index-url https://download.pytorch.org/whl/cpu \
    && pip install --no-cache-dir -r requirements.txt

# Cache del modelo dentro de la imagen (offline en runtime)
ENV HF_HOME=/app/hf_cache
RUN python -c "from transformers import pipeline; pipeline('sentiment-analysis', model='lxyuan/distilbert-base-multilingual-cased-sentiments-student')"

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
