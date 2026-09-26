from fastapi import APIRouter

from app.router.api.v1.placeholder import register_stub_routes


router = APIRouter(tags=["public-pages"])

register_stub_routes(
    router,
    {
        "GET": [
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
        ],
    },
)
