from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/categories", tags=["categories"])

register_stub_routes(
    router,
    {
        "GET": ["", "/{slug}", "/{slug}/topics"],
        "POST": [""],
        "PATCH": ["/{category_id}"],
        "DELETE": ["/{category_id}"],
    },
)
