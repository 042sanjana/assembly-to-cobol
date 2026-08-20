from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from database.db import create_database
from routes.upload import router as upload_router


# Create database tables
create_database()


# Create FastAPI application
app = FastAPI(
    title="Assembly to COBOL Migration"
)


# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "http://localhost:3001",
        "http://127.0.0.1:3000",
        "http://127.0.0.1:3001",
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Register upload routes
app.include_router(upload_router)


@app.get("/")
def home():
    return {
        "message": "Assembly to COBOL AI Migration"
    }