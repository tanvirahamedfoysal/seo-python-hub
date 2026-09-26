from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/topics", tags=["topics"])

register_stub_routes(
    router,
    {
        "GET": [
            "",
            "/{slug}",
            "/{topic_id}/related",
            "/{topic_id}/prerequisites",
            "/{topic_id}/next",
        ],
        "POST": [
            "",
            "/{topic_id}/publish",
            "/{topic_id}/unpublish",
        ],
        "PATCH": ["/{topic_id}"],
        "DELETE": ["/{topic_id}"],
    },
)
