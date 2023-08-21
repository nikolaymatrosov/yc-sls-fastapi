import os
from typing import Union

import uvicorn
from asgi_correlation_id import CorrelationIdMiddleware
from fastapi import FastAPI

from app.log_middleware import LogMiddleware
from app.logger import logger

app = FastAPI()

app.add_middleware(LogMiddleware)
app.add_middleware(CorrelationIdMiddleware)


@app.get("/")
def read_root():
    logger.info("Hello")
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    logger.info("items")
    return {"item_id": item_id, "q": q}


@app.get("/error")
def read_error():
    raise Exception("Error")
