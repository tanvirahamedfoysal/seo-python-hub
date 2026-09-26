from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/media", tags=["media"])

register_stub_routes(
    router,
    {
        "POST": ["/upload", "/presigned-url"],
        "GET": ["/{media_id}"],
        "DELETE": ["/{media_id}"],
    },
)
