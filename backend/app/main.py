from fastapi import FastAPI

from app.routers.api.v1.stubs import (
	public_router,
	router as api_v1_router,
	system_router,
	web_components_router,
)


app = FastAPI(title="Python Learning Hub")

app.include_router(api_v1_router, prefix="/api/v1")
app.include_router(public_router)
app.include_router(web_components_router, prefix="/web-components")
app.include_router(system_router, tags=["system"])

