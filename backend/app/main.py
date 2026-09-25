from fastapi import FastAPI

from backend.app.routers.components import router as component_router
from backend.app.routers.pages import router as page_router

app = FastAPI(title="Python Learning Hub")

# Page routes return complete layouts; component routes return HTMX fragments.
app.include_router(page_router)
app.include_router(component_router)
