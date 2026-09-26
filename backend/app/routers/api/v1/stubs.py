from fastapi import APIRouter, Request, Response, status
from fastapi.responses import JSONResponse


router = APIRouter()
public_router = APIRouter()
web_components_router = APIRouter()
system_router = APIRouter()


async def not_implemented(request: Request) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={
            "detail": "This endpoint is not implemented yet.",
            "method": request.method,
            "path": request.url.path,
        },
    )


def register_stub(method: str, path: str) -> None:
    router.add_api_route(
        path,
        not_implemented,
        methods=[method],
        response_class=Response,
        include_in_schema=True,
    )


def register_router_stub(target_router: APIRouter, method: str, path: str) -> None:
    target_router.add_api_route(
        path,
        not_implemented,
        methods=[method],
        response_class=Response,
        include_in_schema=True,
    )


_ROUTES = {
    "POST": [
        "/auth/register",
        "/auth/login",
        "/auth/logout",
        "/auth/refresh",
        "/auth/forgot-password",
        "/auth/reset-password",
        "/auth/verify-email",
        "/auth/resend-verification",
        "/auth/change-password",
        "/topics",
        "/topics/{topic_id}/publish",
        "/topics/{topic_id}/unpublish",
        "/categories",
        "/tags",
        "/progress/{topic_id}/start",
        "/progress/{topic_id}/complete",
        "/bookmarks",
        "/bookmarks/topics/{topic_id}",
        "/discussions",
        "/discussions/{discussion_id}/replies",
        "/discussions/{discussion_id}/like",
        "/discussions/{discussion_id}/report",
        "/discussions/replies/{reply_id}/report",
        "/quizzes/{quiz_id}/attempts",
        "/quizzes/{quiz_id}/attempts/{attempt_id}/answers",
        "/quizzes/{quiz_id}/attempts/{attempt_id}/submit",
        "/quizzes",
        "/admin/users/{user_id}/suspend",
        "/admin/users/{user_id}/restore",
        "/media/upload",
        "/media/presigned-url",
    ],
    "GET": [
        "/auth/me",
        "/users/me",
        "/users/me/statistics",
        "/users/me/activity",
        "/users/me/notifications",
        "/users/{user_id}",
        "/topics",
        "/topics/{slug}",
        "/topics/{topic_id}/related",
        "/topics/{topic_id}/prerequisites",
        "/topics/{topic_id}/next",
        "/categories",
        "/categories/{slug}",
        "/categories/{slug}/topics",
        "/tags",
        "/tags/{slug}",
        "/tags/{slug}/topics",
        "/roadmap",
        "/roadmap/nodes",
        "/roadmap/nodes/{node_id}",
        "/roadmap/nodes/{node_id}/children",
        "/roadmap/nodes/{node_id}/prerequisites",
        "/roadmap/me",
        "/progress",
        "/progress/summary",
        "/progress/{topic_id}",
        "/progress/history",
        "/progress/streak",
        "/bookmarks",
        "/bookmarks/{bookmark_id}",
        "/bookmarks/check/{topic_id}",
        "/search",
        "/search/suggestions",
        "/search/popular",
        "/search/recent",
        "/discussions",
        "/discussions/{discussion_id}",
        "/discussions/{discussion_id}/replies",
        "/quizzes",
        "/quizzes/{quiz_id}",
        "/quizzes/{quiz_id}/attempts",
        "/quizzes/attempts/{attempt_id}",
        "/quizzes/attempts/{attempt_id}/result",
        "/admin/dashboard",
        "/admin/users",
        "/admin/topics/pending",
        "/admin/reports",
        "/admin/reports/{report_id}",
        "/admin/moderation/queue",
        "/admin/audit-logs",
        "/admin/analytics",
        "/media/{media_id}",
    ],
    "PATCH": [
        "/users/me",
        "/users/me/notifications/{notification_id}",
        "/topics/{topic_id}",
        "/categories/{category_id}",
        "/roadmap/nodes/{node_id}",
        "/progress/{topic_id}",
        "/discussions/{discussion_id}",
        "/discussions/{discussion_id}/replies/{reply_id}",
        "/quizzes/{quiz_id}",
        "/admin/users/{user_id}",
        "/admin/reports/{report_id}",
    ],
    "DELETE": [
        "/auth/account",
        "/users/me/avatar",
        "/topics/{topic_id}",
        "/categories/{category_id}",
        "/tags/{tag_id}",
        "/progress/{topic_id}",
        "/bookmarks/{bookmark_id}",
        "/bookmarks/topics/{topic_id}",
        "/search/recent",
        "/discussions/{discussion_id}",
        "/discussions/{discussion_id}/replies/{reply_id}",
        "/discussions/{discussion_id}/like",
        "/quizzes/{quiz_id}",
        "/media/{media_id}",
    ],
}


for _method, _paths in _ROUTES.items():
    for _path in _paths:
        register_stub(_method, _path)


for _path in [
    "/",
    "/roadmap",
    "/topics",
    "/topics/{slug}",
    "/categories",
    "/categories/{slug}",
    "/tags/{slug}",
    "/tutorials",
    "/tutorials/{slug}",
    "/guides",
    "/guides/{slug}",
    "/search",
    "/discussions",
    "/discussions/{discussion_id}",
    "/about",
    "/contact",
    "/privacy",
    "/terms",
    "/sitemap.xml",
    "/robots.txt",
]:
    register_router_stub(public_router, "GET", _path)


for _method, _path in [
    ("GET", "/search/results"),
    ("GET", "/topics/{slug}/related"),
    ("POST", "/topics/{topic_id}/progress"),
    ("POST", "/topics/{topic_id}/bookmark"),
    ("DELETE", "/topics/{topic_id}/bookmark"),
    ("POST", "/discussions/{discussion_id}/replies"),
    ("POST", "/discussions/{discussion_id}/like"),
    ("POST", "/discussions/{discussion_id}/report"),
    ("GET", "/notifications"),
    ("POST", "/notifications/{id}/read"),
    ("GET", "/flash-messages"),
]:
    register_router_stub(web_components_router, _method, _path)


for _path in ["/health", "/health/database", "/ready", "/version"]:
    register_router_stub(system_router, "GET", _path)









