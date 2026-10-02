import pytest

from app.frontend.flutter_server import router as flutter_router


PUBLIC_PLACEHOLDER_ROUTES = (
    "/roadmap",
    "/topics/python-basics",
    "/categories",
    "/categories/python",
    "/tags/asyncio",
    "/tutorials",
    "/tutorials/asyncio",
    "/guides",
    "/guides/fastapi",
    "/search",
    "/discussions",
    "/discussions/discussion-1",
    "/about",
    "/contact",
    "/privacy",
    "/terms",
    "/sitemap.xml",
    "/robots.txt",
)


def test_home_page_renders_application_title_and_flutter_link(client) -> None:
    response = client.get("/")

    assert response.status_code == 200
    assert response.headers["content-type"].startswith("text/html")
    assert "Python Hub" in response.text
    assert "/app" in response.text


def test_topics_page_renders_known_topics(client) -> None:
    response = client.get("/topics")

    assert response.status_code == 200
    assert "Python" in response.text
    assert "FastAPI" in response.text


@pytest.mark.parametrize("path", PUBLIC_PLACEHOLDER_ROUTES)
def test_public_placeholder_routes_are_explicit(client, path) -> None:
    response = client.get(path)

    assert response.status_code == 501
    assert response.json()["status"] == 501


def test_flutter_fallback_is_clear_when_artifact_is_not_built(client) -> None:
    response = client.get("/app")

    assert response.status_code == 503
    assert "Flutter build unavailable" in response.text


def test_flutter_deep_link_uses_same_fallback_without_artifact(client) -> None:
    response = client.get("/app/dashboard")

    assert response.status_code == 503
    assert "Build the Flutter Web artifact" in response.text


def test_flutter_asset_path_traversal_is_rejected() -> None:
    assert flutter_router._safe_asset("../../../../etc/passwd") is None


def test_flutter_asset_resolver_only_returns_files() -> None:
    assert flutter_router._safe_asset(".") is None
    assert flutter_router._safe_asset("index.html") is None
