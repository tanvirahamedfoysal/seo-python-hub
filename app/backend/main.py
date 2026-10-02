from pathlib import Path

from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles

from app.backend.core import settings
from app.backend.router.api.v1 import router as api_v1_router
from app.backend.router.utility.system import router as system_router
from app.frontend.flutter_server.router import router as flutter_router
from app.frontend.htmx.router.web.component.components import router as web_components_router
from app.frontend.htmx.router.web.page import router as pages_router, templates
from app.frontend.htmx.router.web.page.pages import router as public_router


app = FastAPI(title=settings.app_title, description=settings.app_description)

app.mount(
    "/static",
    StaticFiles(
        directory=str(
            Path(__file__).resolve().parents[1] / "frontend" / "htmx" / "static"
        )
    ),
    name="static",
)

app.include_router(api_v1_router, prefix="/api/v1")
app.include_router(flutter_router)
app.include_router(pages_router)
app.include_router(public_router)
app.include_router(web_components_router, prefix="/web-components")
app.include_router(system_router)


@app.exception_handler(404)
async def not_found(request: Request, exc):
    if request.url.path.startswith(("/api/", "/web-components/")):
        return JSONResponse(status_code=404, content={"detail": "Not found"})
    return templates.TemplateResponse(
        request=request,
        name="pages/404.html",
        context={"page_title": "Page not found", "path": request.url.path},
        status_code=404,
    )


@app.exception_handler(500)
async def server_error(request: Request, exc):
    if request.url.path.startswith(("/api/", "/web-components/")):
        return JSONResponse(status_code=500, content={"detail": "Internal server error"})
    return templates.TemplateResponse(
        request=request,
        name="pages/500.html",
        context={"page_title": "Something went wrong"},
        status_code=500,
    )
