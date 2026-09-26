from fastapi.testclient import TestClient
import pytest

from app.main import app
from app.core.config import get_settings


client = TestClient(app)


@pytest.mark.parametrize("configured_prefix", ["api/v1", "/api/v1/"])
def test_api_prefix_is_normalized(monkeypatch: pytest.MonkeyPatch, configured_prefix: str) -> None:
    monkeypatch.setenv("API_PREFIX", configured_prefix)
    get_settings.cache_clear()

    try:
        assert get_settings().api_prefix == "/api/v1"
    finally:
        get_settings.cache_clear()


def test_health() -> None:
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json()["status"] == "ok"


def test_version() -> None:
    response = client.get("/version")

    assert response.status_code == 200
    assert response.json()["version"] == "0.1.0"


def test_database_health_requires_configuration() -> None:
    response = client.get("/health/database")

    assert response.status_code == 503
    assert response.json()["status"] == "unavailable"


def test_api_prefix_is_available() -> None:
    response = client.get("/api/v1/topics")

    assert response.status_code == 501


def test_root_renders_welcome_page_with_app_link() -> None:
    response = client.get("/")

    assert response.status_code == 200
    assert "Welcome to SEO Python Hub" in response.text
    assert "/app" in response.text


def test_flutter_app_is_served_by_fastapi() -> None:
    response = client.get("/app")

    assert response.status_code == 200
    assert "<html" in response.text


def test_flutter_deep_link_uses_flutter_entrypoint() -> None:
    response = client.get("/app/dashboard")

    assert response.status_code == 200
    assert "flutter_bootstrap.js" in response.text
