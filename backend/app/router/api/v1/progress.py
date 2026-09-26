from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/progress", tags=["progress"])

register_stub_routes(
    router,
    {
        "GET": [
            "",
            "/summary",
            "/history",
            "/streak",
            "/{topic_id}",
        ],
        "POST": [
            "/{topic_id}/start",
            "/{topic_id}/complete",
        ],
        "PATCH": ["/{topic_id}"],
        "DELETE": [
            "/{topic_id}",
            "/{topic_id}/complete",
        ],
    },
)
