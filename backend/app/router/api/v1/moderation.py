from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(tags=["moderation"])

register_stub_routes(
    router,
    {
        "POST": ["/reports"],
        "PATCH": ["/replies/{reply_id}"],
        "DELETE": ["/replies/{reply_id}"],
    },
)
