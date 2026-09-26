from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/discussions", tags=["discussions"])

register_stub_routes(
    router,
    {
        "GET": [
            "",
            "/{discussion_id}",
            "/{discussion_id}/replies",
        ],
        "POST": [
            "",
            "/{discussion_id}/replies",
            "/{discussion_id}/like",
            "/{discussion_id}/report",
            "/replies/{reply_id}/report",
        ],
        "PATCH": [
            "/{discussion_id}",
            "/{discussion_id}/replies/{reply_id}",
        ],
        "DELETE": [
            "/{discussion_id}",
            "/{discussion_id}/replies/{reply_id}",
            "/{discussion_id}/like",
        ],
    },
)
