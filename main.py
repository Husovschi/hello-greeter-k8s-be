from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/env/{env_var}")
async def read_env_var(env_var: str):
    return {env_var: os.getenv(env_var)}