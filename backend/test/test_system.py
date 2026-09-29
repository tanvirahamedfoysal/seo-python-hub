from collections.abc import Iterator

import pytest

from app.core import settings
from app.router.utility import system


class FakeConnection:
    def __init__(self) -> None:
        self.closed = False

    async def close(self) -> None:
        self.closed = True


@pytest.fixture()
def database_url(monkeypatch: pytest.MonkeyPatch) -> Iterator[None]:
    monkeypatch.setattr(settings, "database_url", "")
    yield


def test_health_reports_process_is_running(client) -> None:
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok", "service": settings.app_title}


def test_version_reports_service_name_and_version(client) -> None:
    response = client.get("/version")

    assert response.status_code == 200
    assert response.json() == {
        "service": settings.app_title,
        "version": settings.app_version,
    }


def test_database_health_is_unavailable_without_configuration(client, database_url) -> None:
    response = client.get("/health/database")

    assert response.status_code == 503
    assert response.json() == {
        "status": "unavailable",
        "message": "DATABASE_URL is not configured",
    }


def test_ready_is_unavailable_without_database_configuration(client, database_url) -> None:
    response = client.get("/ready")

    assert response.status_code == 503
    assert response.json()["status"] == "unavailable"


def test_database_health_closes_successful_connection(
    client, monkeypatch: pytest.MonkeyPatch
) -> None:
    connection = FakeConnection()

    async def fake_connect(database_url: str, timeout: int):
        assert database_url == settings.database_url
        assert timeout == 2
        return connection

    monkeypatch.setattr(system.asyncpg, "connect", fake_connect)

    response = client.get("/health/database")

    assert response.status_code == 200
    assert response.json() == {
        "status": "ok",
        "message": "Database is available",
    }
    assert connection.closed is True


def test_ready_reports_success_when_database_connects(
    client, monkeypatch: pytest.MonkeyPatch
) -> None:
    connection = FakeConnection()

    async def fake_connect(database_url: str, timeout: int):
        return connection

    monkeypatch.setattr(system.asyncpg, "connect", fake_connect)

    response = client.get("/ready")

    assert response.status_code == 200
    assert response.json() == {"status": "ok", "message": "Service is ready"}
    assert connection.closed is True


def test_database_health_handles_connection_errors(client, monkeypatch) -> None:
    async def failing_connect(database_url: str, timeout: int):
        raise OSError("database is down")

    monkeypatch.setattr(system.asyncpg, "connect", failing_connect)

    response = client.get("/health/database")

    assert response.status_code == 503
    assert response.json() == {
        "status": "unavailable",
        "message": "Database is unavailable",
    }


def test_openapi_is_available_and_contains_operational_routes(client) -> None:
    response = client.get("/openapi.json")

    assert response.status_code == 200
    paths = response.json()["paths"]
    assert "/health" in paths
    assert "/health/database" in paths
    assert "/ready" in paths
    assert "/version" in paths
