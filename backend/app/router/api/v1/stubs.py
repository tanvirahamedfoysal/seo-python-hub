"""Compatibility exports for the original application router wiring."""

from fastapi import APIRouter

from app.router.api.v1 import router
from app.router.web.component.components import router as web_components_router
from app.router.web.page.pages import router as public_router


system_router = APIRouter()

__all__ = ["public_router", "router", "system_router", "web_components_router"]
