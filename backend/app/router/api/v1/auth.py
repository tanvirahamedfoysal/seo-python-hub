from fastapi import APIRouter

from .placeholder import register_stub_routes


router = APIRouter(prefix="/auth", tags=["auth"])

register_stub_routes(
    router,
    {
        "POST": [
            "/register",
            "/login",
            "/logout",
            "/refresh",
            "/forgot-password",
            "/reset-password",
            "/verify-email",
            "/resend-verification",
            "/change-password",
        ],
        "GET": ["/me"],
        "DELETE": ["/account"],
    },
)
