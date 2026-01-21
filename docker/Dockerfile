# Build
FROM python:3.11-slim AS builder

WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Runtime
FROM python:3.11-slim

RUN useradd -m appuser

WORKDIR /app
COPY --from=builder /install /usr/local
COPY app/main.py .

USER appuser
EXPOSE 8000

HEALTHCHECK CMD curl -f http://localhost:8000/health || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
