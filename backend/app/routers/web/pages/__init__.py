from pathlib import Path

from fastapi import APIRouter, Request
from fastapi.templating import Jinja2Templates

from app.core.config import get_settings


router = APIRouter(tags=["web"])
templates = Jinja2Templates(
    directory=str(Path(__file__).resolve().parents[3] / "templates")
)


@router.get("/", name="home")
async def home(request: Request):
    settings = get_settings()
    return templates.TemplateResponse(
        request=request,
        name="pages/dummy.html",
        context={"title": settings.app_name, "version": settings.app_version},
    )


@router.get("/app", name="flutter-launch")
async def flutter_launch(request: Request):
    settings = get_settings()
    return templates.TemplateResponse(
        request=request,
        name="pages/flutter-launch.html",
        context={
            "title": "Open SEO Python Hub App",
            "frontend_url": "https://seo-python-hub.web.app",
            "backend_url": str(request.base_url).rstrip("/"),
            "version": settings.app_version,
        },
    )
