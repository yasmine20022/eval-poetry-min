from fastapi import FastAPI

app = FastAPI()


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/")
def index():
    return {"service": "eval-poetry-min"}


# DevOps Autopilot: Prometheus instrumentation
try:
    from prometheus_fastapi_instrumentator import Instrumentator as _DapInstrumentator
    _DapInstrumentator().instrument(app).expose(app)
except Exception:
    pass
