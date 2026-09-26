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
