from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def principal():
    return{
        "message": "Hi, This is my app"
    }


