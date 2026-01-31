from fastapi import FastAPI
from datetime import datetime

app = FastAPI(
    title="Secure Simple App",
    description="Production-ready minimal app with security headers",
    version="1.0.0"
)

@app.get("/")
async def root():
    return {
        "message": "Hello from secure container!",
        "timestamp": datetime.utcnow().isoformat(),
        "status": "healthy"
    }

@app.get("/health")
async def health_check():
    return {"status": "ok"}