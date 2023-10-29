from fastapi import FastAPI
import time

app = FastAPI()

@app.get("/")
def get_message():
    return {"message": "Automate all the things!", "timestamp": int(time.time())}
