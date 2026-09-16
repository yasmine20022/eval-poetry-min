FROM python:3.11-slim
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y --no-install-recommends build-essential git libffi-dev libpq-dev libssl-dev python3-dev && rm -rf /var/lib/apt/lists/*
RUN pip install poetry && poetry install --no-root
RUN pip install --no-cache-dir "uvicorn[standard]"
EXPOSE 8000
CMD poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000