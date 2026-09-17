FROM python:latest
WORKDIR /app
COPY . .
RUN pip install poetry && poetry install --no-root
EXPOSE 8000
# DevOps Autopilot: Prometheus instrumentation: install the Prometheus client into the app's Python env
RUN python -m ensurepip --upgrade >/dev/null 2>&1 || true; \
    python -m pip install --no-cache-dir prometheus-fastapi-instrumentator

CMD poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000
