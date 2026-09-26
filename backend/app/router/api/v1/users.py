from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/users", tags=["users"])

register_stub_routes(
    router,
    {
        "GET": [
            "/me",
            "/me/statistics",
            "/me/activity",
            "/me/notifications",
            "/{user_id}",
        ],
        "PATCH": [
            "/me",
            "/me/notifications/{notification_id}",
        ],
        "POST": ["/me/avatar"],
        "DELETE": ["/me/avatar"],
    },
)
