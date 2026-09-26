from fastapi import APIRouter

from app.router.api.v1.placeholder import register_stub_routes


router = APIRouter(tags=["web-components"])

register_stub_routes(
    router,
    {
        "GET": [
            "/search/results",
            "/topic-list",
            "/topics/{slug}/related",
            "/notifications",
            "/flash-messages",
        ],
        "POST": [
            "/topics/{topic_id}/progress",
            "/topics/{topic_id}/bookmark",
            "/discussions/{discussion_id}/replies",
            "/discussions/{discussion_id}/like",
            "/discussions/{discussion_id}/report",
            "/notifications/{id}/read",
        ],
        "DELETE": [
            "/topics/{topic_id}/progress",
            "/topics/{topic_id}/bookmark",
        ],
    },
)
