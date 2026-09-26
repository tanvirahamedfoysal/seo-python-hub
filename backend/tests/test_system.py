from fastapi.testclient import TestClient

from app.main import app


client = TestClient(app)


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


def test_root_renders_backend_dummy_page() -> None:
    response = client.get("/")

    assert response.status_code == 200
    assert "SEO Python Hub backend" in response.text


def test_flutter_app_is_served_by_fastapi() -> None:
    response = client.get("/app")

    assert response.status_code == 200
    assert "<html" in response.text


def test_flutter_deep_link_uses_flutter_entrypoint() -> None:
    response = client.get("/app/dashboard")

    assert response.status_code == 200
    assert "flutter_bootstrap.js" in response.text
