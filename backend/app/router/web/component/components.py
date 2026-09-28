from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(tags=["web-components"])


@router.get("/search/results")
async def render_search_results() -> JSONResponse:
    return _not_implemented("Search result fragment")


@router.get("/topic-list")
async def render_topic_list() -> JSONResponse:
    return _not_implemented("Topic list fragment")


@router.get("/topics/{slug}/related")
async def render_related_topics(slug: str) -> JSONResponse:
    return _not_implemented(f"Related topic fragment for {slug}")


@router.post("/topics/{topic_id}/progress")
async def render_topic_progress(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Topic progress fragment for {topic_id}")


@router.delete("/topics/{topic_id}/progress")
async def remove_topic_progress_fragment(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Remove topic progress fragment for {topic_id}")


@router.post("/topics/{topic_id}/bookmark")
async def render_topic_bookmark(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Topic bookmark fragment for {topic_id}")


@router.delete("/topics/{topic_id}/bookmark")
async def remove_topic_bookmark_fragment(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Remove topic bookmark fragment for {topic_id}")


@router.post("/discussions/{discussion_id}/replies")
async def render_discussion_reply(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Discussion reply fragment for {discussion_id}")


@router.post("/discussions/{discussion_id}/like")
async def render_discussion_like(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Discussion like fragment for {discussion_id}")


@router.post("/discussions/{discussion_id}/report")
async def render_discussion_report(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Discussion report fragment for {discussion_id}")


@router.get("/notifications")
async def render_notifications() -> JSONResponse:
    return _not_implemented("Notification fragment")


@router.post("/notifications/{notification_id}/read")
async def render_notification_read(notification_id: str) -> JSONResponse:
    return _not_implemented(f"Notification read fragment for {notification_id}")


@router.get("/flash-messages")
async def render_flash_messages() -> JSONResponse:
    return _not_implemented("Flash message fragment")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
