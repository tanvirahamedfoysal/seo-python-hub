from urllib.parse import urljoin

from fastapi import APIRouter, Form, HTTPException, Request
from fastapi.responses import PlainTextResponse, Response

from app.core import settings
from app.router.web.page import templates
from app.router.web.page.content import (
    CATEGORIES,
    DISCUSSIONS,
    GUIDES,
    ROADMAP_STAGES,
    TOPICS,
    TUTORIALS,
    category_by_slug,
    discussion_by_id,
    guide_by_slug,
    search_content,
    topic_by_slug,
    tutorial_by_slug,
)


router = APIRouter(tags=["public-pages"])

CATEGORY_COLORS = {
    "core-python": "teal",
    "professional-python": "gold",
    "testing": "violet",
    "web-development": "coral",
    "data-science": "blue",
}


def _decorate(item: dict) -> dict:
    decorated = dict(item)
    decorated.setdefault("color", CATEGORY_COLORS.get(item.get("category_slug"), "teal"))
    return decorated


def _topics(items) -> list[dict]:
    return [_decorate(item) for item in items]


def _render(request: Request, name: str, **context):
    return templates.TemplateResponse(
        request=request,
        name=f"pages/{name}.html",
        context={"page_title": settings.app_title, **context},
    )


@router.get("/", name="home")
async def home(request: Request):
    coverage = [
        {"title": "Core Python", "summary": "Syntax, data, functions, and the instincts every path needs.", "color": "teal", "icon": "01"},
        {"title": "Professional workflow", "summary": "Testing, errors, packaging, and habits for real projects.", "color": "gold", "icon": "02"},
        {"title": "Applied paths", "summary": "Web, data, automation, and asynchronous systems.", "color": "coral", "icon": "03"},
    ]
    featured = [
        {"type": "Topic", "title": TOPICS[1]["title"], "summary": TOPICS[1]["summary"], "time": TOPICS[1]["time"], "url": f"/topics/{TOPICS[1]['slug']}", "color": "teal"},
        {"type": "Tutorial", "title": TUTORIALS[0]["title"], "summary": TUTORIALS[0]["summary"], "time": TUTORIALS[0]["time"], "url": f"/tutorials/{TUTORIALS[0]['slug']}", "color": "coral"},
        {"type": "Guide", "title": GUIDES[0]["title"], "summary": GUIDES[0]["summary"], "time": "Reference", "url": f"/guides/{GUIDES[0]['slug']}", "color": "violet"},
    ]
    return _render(request, "home", coverage=coverage, stages=ROADMAP_STAGES, featured=featured, discussions=DISCUSSIONS[:3], topic_by_slug=topic_by_slug)


@router.get("/roadmap", name="roadmap")
async def roadmap_page(request: Request):
    return _render(request, "roadmap", stages=ROADMAP_STAGES, topic_by_slug=topic_by_slug)


@router.get("/topics", name="topics")
async def topics_page(request: Request, q: str = "", category: str = "", difficulty: str = ""):
    filtered = TOPICS
    if q.strip():
        needle = q.strip().lower()
        filtered = [item for item in filtered if needle in f"{item['title']} {item['summary']} {' '.join(item['tags'])}".lower()]
    if category:
        filtered = [item for item in filtered if item["category_slug"] == category]
    if difficulty:
        filtered = [item for item in filtered if item["difficulty"].lower() == difficulty.lower()]
    return _render(
        request,
        "topics",
        topics=_topics(filtered),
        categories=CATEGORIES,
        filters={"q": q, "category": category, "difficulty": difficulty},
        topic_by_slug=topic_by_slug,
    )


@router.get("/topics/{slug}", name="topic_page")
async def topic_page(request: Request, slug: str):
    topic = topic_by_slug(slug)
    if not topic:
        raise HTTPException(status_code=404, detail="Topic not found")
    return _render(request, "topic_detail", topic=_decorate(topic), topic_by_slug=topic_by_slug)


@router.get("/categories", name="categories")
async def categories_page(request: Request):
    return _render(request, "categories", categories=CATEGORIES)


@router.get("/categories/{slug}", name="category_page")
async def category_page(request: Request, slug: str):
    category = category_by_slug(slug)
    if not category:
        raise HTTPException(status_code=404, detail="Category not found")
    topics = _topics([topic for topic in TOPICS if topic["slug"] in category["topics"]])
    return _render(request, "category_detail", category=category, topics=topics, topic_by_slug=topic_by_slug)


@router.get("/tags/{slug}", name="tag_page")
async def tag_page(request: Request, slug: str):
    tag_name = slug.replace("-", " ")
    matches = [
        topic
        for topic in TOPICS
        if any(slug == tag or "-".join(tag.lower().split()) == slug for tag in topic["tags"])
    ]
    if not matches:
        raise HTTPException(status_code=404, detail="Tag not found")
    tag = {"name": tag_name, "description": f"A focused collection of Python material about {tag_name}."}
    return _render(request, "tag_detail", tag=tag, topics=_topics(matches), topic_by_slug=topic_by_slug)


@router.get("/tutorials", name="tutorials")
async def tutorials_page(request: Request):
    return _render(request, "tutorials", tutorials=TUTORIALS)


@router.get("/tutorials/{slug}", name="tutorial_page")
async def tutorial_page(request: Request, slug: str):
    tutorial = tutorial_by_slug(slug)
    if not tutorial:
        raise HTTPException(status_code=404, detail="Tutorial not found")
    return _render(request, "tutorial_detail", tutorial=tutorial)


@router.get("/guides", name="guides")
async def guides_page(request: Request):
    return _render(request, "guides", guides=GUIDES)


@router.get("/guides/{slug}", name="guide_page")
async def guide_page(request: Request, slug: str):
    guide = guide_by_slug(slug)
    if not guide:
        raise HTTPException(status_code=404, detail="Guide not found")
    return _render(request, "guide_detail", guide=guide)


@router.get("/search", name="search_page")
async def search_page(request: Request, q: str = "", type: str = "all"):
    popular = [
        {"title": TOPICS[0]["title"], "summary": TOPICS[0]["summary"], "label": "Topic", "url": f"/topics/{TOPICS[0]['slug']}"},
        {"title": TOPICS[3]["title"], "summary": TOPICS[3]["summary"], "label": "Topic", "url": f"/topics/{TOPICS[3]['slug']}"},
        {"title": GUIDES[0]["title"], "summary": GUIDES[0]["summary"], "label": "Guide", "url": f"/guides/{GUIDES[0]['slug']}"},
    ]
    return _render(request, "search", query=q, kind=type, results=search_content(q, type), popular=popular)


@router.get("/discussions", name="discussions")
async def discussions_page(request: Request):
    return _render(request, "discussions", discussions=DISCUSSIONS)


@router.get("/discussions/{discussion_id}", name="discussion_page")
async def discussion_page(request: Request, discussion_id: str):
    discussion = discussion_by_id(discussion_id)
    if not discussion:
        raise HTTPException(status_code=404, detail="Discussion not found")
    return _render(request, "discussion_detail", discussion=discussion)


@router.get("/about", name="about")
async def about_page(request: Request):
    return _render(request, "about")


@router.get("/contact", name="contact")
async def contact_page(request: Request):
    return _render(request, "contact", form={})


@router.post("/contact", name="contact_submit")
async def contact_submit(
    request: Request,
    name: str = Form(""),
    email: str = Form(""),
    subject: str = Form(""),
    message: str = Form(""),
):
    return _render(
        request,
        "contact",
        form={"name": name, "email": email, "subject": subject, "message": message},
        flash={"kind": "success", "message": "Thanks — your note is ready for the Python Learning Hub team."},
    )


@router.get("/privacy", name="privacy")
async def privacy_page(request: Request):
    return _render(request, "privacy")


@router.get("/terms", name="terms")
async def terms_page(request: Request):
    return _render(request, "terms")


@router.get("/sitemap.xml", name="sitemap")
async def sitemap(request: Request):
    paths = ["/", "/roadmap", "/topics", "/categories", "/tutorials", "/guides", "/search", "/discussions", "/about", "/contact", "/privacy", "/terms"]
    paths.extend(f"/topics/{item['slug']}" for item in TOPICS)
    paths.extend(f"/categories/{item['slug']}" for item in CATEGORIES)
    paths.extend(f"/tutorials/{item['slug']}" for item in TUTORIALS)
    paths.extend(f"/guides/{item['slug']}" for item in GUIDES)
    paths.extend(f"/discussions/{item['id']}" for item in DISCUSSIONS)
    base = str(request.base_url).rstrip("/")
    locations = "".join(f"<url><loc>{urljoin(base, path)}</loc></url>" for path in paths)
    return Response(content=f'<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">{locations}</urlset>', media_type="application/xml")


@router.get("/robots.txt", name="robots")
async def robots(request: Request):
    return PlainTextResponse(f"User-agent: *\nAllow: /\nDisallow: /api/\nDisallow: /web-components/\nSitemap: {urljoin(str(request.base_url), 'sitemap.xml')}\n")
