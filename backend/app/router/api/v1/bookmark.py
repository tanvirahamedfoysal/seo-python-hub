from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/bookmarks", tags=["bookmarks"])

register_stub_routes(
    router,
    {
        "GET": ["", "/{bookmark_id}", "/topics/{topic_id}", "/check/{topic_id}"],
        "POST": ["", "/topics/{topic_id}"],
        "DELETE": ["/{bookmark_id}", "/topics/{topic_id}"],
    },
)
