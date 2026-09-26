from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/admin", tags=["admin"])

register_stub_routes(
    router,
    {
        "GET": [
            "/dashboard",
            "/users",
            "/users/{user_id}",
            "/topics",
            "/topics/pending",
            "/reports",
            "/reports/{report_id}",
            "/moderation/queue",
            "/audit-logs",
            "/analytics",
            "/statistics",
        ],
        "PATCH": [
            "/users/{user_id}",
            "/users/{user_id}/role",
            "/users/{user_id}/status",
            "/reports/{report_id}",
            "/topics/{topic_id}",
        ],
        "POST": [
            "/users/{user_id}/suspend",
            "/users/{user_id}/restore",
            "/topics",
            "/topics/{topic_id}/publish",
            "/topics/{topic_id}/unpublish",
        ],
        "DELETE": [
            "/topics/{topic_id}",
        ],
    },
)
