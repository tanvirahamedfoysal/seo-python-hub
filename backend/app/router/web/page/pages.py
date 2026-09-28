from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(tags=["public-pages"])


@router.get("/roadmap")
async def roadmap_page() -> JSONResponse:
    return _not_implemented("Roadmap page")


@router.get("/topics")
async def topics_page() -> JSONResponse:
    return _not_implemented("Topics page")


@router.get("/topics/{slug}")
async def topic_page(slug: str) -> JSONResponse:
    return _not_implemented(f"Topic page {slug}")


@router.get("/categories")
async def categories_page() -> JSONResponse:
    return _not_implemented("Categories page")


@router.get("/categories/{slug}")
async def category_page(slug: str) -> JSONResponse:
    return _not_implemented(f"Category page {slug}")


@router.get("/tags/{slug}")
async def tag_page(slug: str) -> JSONResponse:
    return _not_implemented(f"Tag page {slug}")


@router.get("/tutorials")
async def tutorials_page() -> JSONResponse:
    return _not_implemented("Tutorials page")


@router.get("/tutorials/{slug}")
async def tutorial_page(slug: str) -> JSONResponse:
    return _not_implemented(f"Tutorial page {slug}")


@router.get("/guides")
async def guides_page() -> JSONResponse:
    return _not_implemented("Guides page")


@router.get("/guides/{slug}")
async def guide_page(slug: str) -> JSONResponse:
    return _not_implemented(f"Guide page {slug}")


@router.get("/search")
async def search_page() -> JSONResponse:
    return _not_implemented("Search page")


@router.get("/discussions")
async def discussions_page() -> JSONResponse:
    return _not_implemented("Discussions page")


@router.get("/discussions/{discussion_id}")
async def discussion_page(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Discussion page {discussion_id}")


@router.get("/about")
async def about_page() -> JSONResponse:
    return _not_implemented("About page")


@router.get("/contact")
async def contact_page() -> JSONResponse:
    return _not_implemented("Contact page")


@router.get("/privacy")
async def privacy_page() -> JSONResponse:
    return _not_implemented("Privacy page")


@router.get("/terms")
async def terms_page() -> JSONResponse:
    return _not_implemented("Terms page")


@router.get("/sitemap.xml")
async def sitemap() -> JSONResponse:
    return _not_implemented("Sitemap")


@router.get("/robots.txt")
async def robots() -> JSONResponse:
    return _not_implemented("Robots instructions")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
