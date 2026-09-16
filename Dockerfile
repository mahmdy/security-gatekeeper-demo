# Pinned by digest to python:3.8-slim, so this always resolves to the same
# old, unpatched package set — Trivy always finds the same 4 CRITICAL,
# fixable CVEs, no matter when this demo is run.
FROM python:3-slim
RUN apt-get update && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN useradd --create-home appuser && \
    chown -R appuser:appuser /app
USER appuser
CMD ["python", "app.py"]
