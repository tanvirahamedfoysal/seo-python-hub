from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/roadmap", tags=["roadmap"])

register_stub_routes(
    router,
    {
        "GET": [
            "",
            "/nodes",
            "/nodes/{node_id}",
            "/nodes/{node_id}/children",
            "/nodes/{node_id}/prerequisites",
            "/me",
            "/{slug}",
        ],
        "PATCH": ["/nodes/{node_id}"],
    },
)
