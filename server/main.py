from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from server.routes import router

import warnings
warnings.filterwarnings("ignore")

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"]
)

app.include_router(router)
