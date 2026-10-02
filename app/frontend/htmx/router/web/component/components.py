from fastapi import APIRouter, Form, Request
from fastapi.responses import HTMLResponse

from app.frontend.htmx.router.web.page import templates
from app.frontend.htmx.router.web.page.content import DISCUSSIONS, TOPICS, discussion_by_id, search_content, topic_by_slug
from app.frontend.htmx.router.web.page.pages import _topics


router = APIRouter(tags=["web-components"])


def _render(request: Request, name: str, **context):
    return templates.TemplateResponse(request=request, name=f"components/{name}.html", context=context)


@router.get("/search/results", name="search_results_fragment")
async def render_search_results(request: Request, q: str = "", type: str = "all"):
    return _render(request, "search_results", results=search_content(q, type), query=q)


@router.get("/topic-list", name="topic_list_fragment")
async def render_topic_list(request: Request, q: str = "", category: str = "", difficulty: str = ""):
    items = TOPICS
    if q.strip():
        needle = q.strip().lower()
        items = [item for item in items if needle in f"{item['title']} {item['summary']} {' '.join(item['tags'])}".lower()]
    if category:
        items = [item for item in items if item["category_slug"] == category]
    if difficulty:
        items = [item for item in items if item["difficulty"].lower() == difficulty.lower()]
    return _render(request, "topic_list", topics=_topics(items), topic_by_slug=topic_by_slug)


@router.get("/topics/{slug}/related", name="related_topics_fragment")
async def render_related_topics(request: Request, slug: str):
    topic = topic_by_slug(slug)
    related = [] if not topic else [item for item in TOPICS if item["slug"] != slug and item["category_slug"] == topic["category_slug"]][:3]
    return _render(request, "related_topics", topics=_topics(related))


@router.post("/topics/{topic_id}/progress", name="topic_progress")
async def render_topic_progress(request: Request, topic_id: str):
    return _render(request, "progress_control", topic_id=topic_id, complete=True)


@router.delete("/topics/{topic_id}/progress", name="remove_topic_progress")
async def remove_topic_progress_fragment(request: Request, topic_id: str):
    return _render(request, "progress_control", topic_id=topic_id, complete=False)


@router.post("/topics/{topic_id}/bookmark", name="topic_bookmark")
async def render_topic_bookmark(request: Request, topic_id: str):
    return _render(request, "bookmark_control", topic_id=topic_id, saved=True)


@router.delete("/topics/{topic_id}/bookmark", name="remove_topic_bookmark")
async def remove_topic_bookmark_fragment(request: Request, topic_id: str):
    return _render(request, "bookmark_control", topic_id=topic_id, saved=False)


@router.post("/discussions/{discussion_id}/replies", name="discussion_reply")
async def render_discussion_reply(request: Request, discussion_id: str, body: str = Form("")):
    reply = {"id": "live", "author": "You", "body": body.strip() or "Thanks for sharing this question.", "date": "Just now"}
    return _render(request, "reply", reply=reply)


@router.post("/discussions/{discussion_id}/like", name="discussion_like")
async def render_discussion_like(discussion_id: str):
    discussion = discussion_by_id(discussion_id)
    likes = (discussion["likes"] if discussion else 0) + 1
    return HTMLResponse(f'<span class="reaction-count">♥ {likes}</span>')


@router.post("/discussions/{discussion_id}/report", name="discussion_report")
async def render_discussion_report(discussion_id: str):
    return HTMLResponse('<span class="muted">Thanks — we will review this report.</span>')


@router.get("/notifications", name="notifications")
async def render_notifications(request: Request):
    return _render(request, "notifications", notifications=[])


@router.post("/notifications/{notification_id}/read", name="notification_read")
async def render_notification_read(notification_id: str):
    return HTMLResponse("")


@router.get("/flash-messages", name="flash_messages")
async def render_flash_messages(request: Request):
    return _render(request, "flash", flash={"kind": "info", "message": "Your request has been received."})
