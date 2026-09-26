from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import get_settings
from app.routers.api.v1.stubs import (
	public_router,
	router as api_v1_router,
	web_components_router,
)
from app.routers.system import router as system_router


settings = get_settings()
app = FastAPI(title=settings.app_name, version=settings.app_version)

app.add_middleware(
	CORSMiddleware,
	allow_origins=list(settings.cors_origins),
	allow_credentials=True,
	allow_methods=["GET", "POST", "PATCH", "DELETE", "OPTIONS"],
	allow_headers=["Content-Type", "X-CSRF-Token"],
)

app.include_router(api_v1_router, prefix=settings.api_prefix)
app.include_router(public_router)
app.include_router(web_components_router, prefix="/web-components")
app.include_router(system_router)

