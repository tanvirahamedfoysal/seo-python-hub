from pathlib import Path

from fastapi import APIRouter, Request
from fastapi.templating import Jinja2Templates

from app.core import settings


router = APIRouter(tags=["web"])
templates = Jinja2Templates(
    directory=str(Path(__file__).resolve().parents[3] / "template")
)


@router.get("/", name="home")
async def home(request: Request):
    return templates.TemplateResponse(
        request=request,
        name="pages/dummy.html",
        context={"title": settings.app_title},
    )


@router.get("/topics", name="topics")
async def topics(request: Request):
    return templates.TemplateResponse(
        request=request,
        name="pages/topics.html",
        context={
            "title": settings.app_title,
            "topics": ["Python", "NumPy", "Pandas", "FastAPI"],
        },
    )






