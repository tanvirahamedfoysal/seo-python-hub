from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/quizzes", tags=["quizzes"])

register_stub_routes(
    router,
    {
        "GET": [
            "",
            "/{quiz_id}",
            "/{quiz_id}/attempts",
            "/attempts/{attempt_id}",
            "/attempts/{attempt_id}/result",
        ],
        "POST": [
            "",
            "/{quiz_id}/attempts",
            "/attempts/{attempt_id}/answers",
            "/attempts/{attempt_id}/submit",
        ],
        "PATCH": ["/{quiz_id}"],
        "DELETE": ["/{quiz_id}"],
    },
)
