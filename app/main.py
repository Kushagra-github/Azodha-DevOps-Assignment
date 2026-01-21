from fastapi import FastAPI

app = FastAPI(title="Predict API")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/predict")
def predict():
    return {"score": 0.75}
