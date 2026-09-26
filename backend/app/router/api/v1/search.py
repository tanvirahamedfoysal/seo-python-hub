from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/search", tags=["search"])

register_stub_routes(
    router,
    {
        "GET": ["", "/suggestions", "/popular", "/recent"],
        "DELETE": ["/recent"],
    },
)
