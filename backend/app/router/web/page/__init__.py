from pathlib import Path

from fastapi import APIRouter
from fastapi.templating import Jinja2Templates


router = APIRouter(tags=["web"])
templates = Jinja2Templates(
    directory=str(Path(__file__).resolve().parents[3] / "template")
)
