from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/tags", tags=["tags"])

register_stub_routes(
    router,
    {
        "GET": ["", "/{slug}", "/{slug}/topics"],
        "POST": [""],
        "DELETE": ["/{tag_id}"],
    },
)
