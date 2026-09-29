from fastapi import FastAPI

from app.core import settings
from app.flutter.router import router as flutter_router
from app.router.api.v1 import router as api_v1_router
from app.router.utility.system import router as system_router
from app.router.web.component.components import router as web_components_router
from app.router.web.page import router as pages_router
from app.router.web.page.pages import router as public_router


app = FastAPI(title=settings.app_title, description=settings.app_description)

app.include_router(api_v1_router, prefix="/api/v1")
app.include_router(flutter_router)
app.include_router(pages_router)
app.include_router(public_router)
app.include_router(web_components_router, prefix="/web-components")
app.include_router(system_router)
