from fastapi.testclient import TestClient
import pytest

from app.main import app
from app.core import settings


client = TestClient(app)


def test_settings_follow_env_file_structure(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setenv("APP_TITLE", "Python Hub")
    monkeypatch.setenv("APP_DESCRIPTION", "App for the community")
    monkeypatch.setenv("DATABASE_URL", "postgresql://user:pass@localhost:5432/test_db")
    monkeypatch.setenv("SECRET_KEY", "test-secret")
    monkeypatch.setenv("INTERNAL_API_KEY", "test-internal-key")
    monkeypatch.setenv("ALGORITHM", "HS256")
    monkeypatch.setenv("ACCESS_TOKEN_EXPIRE_MINUTES", "45")
    monkeypatch.setenv("CLOUDINARY_CLOUD_NAME", "demo-cloud")
    monkeypatch.setenv("CLOUDINARY_API_KEY", "demo-key")
    monkeypatch.setenv("CLOUDINARY_API_SECRET", "demo-secret")
    monkeypatch.setenv("SMTP_HOST", "smtp.example.com")
    monkeypatch.setenv("SMTP_PORT", "587")
    monkeypatch.setenv("SMTP_USERNAME", "smtp-user")
    monkeypatch.setenv("SMTP_PASSWORD", "smtp-pass")
    monkeypatch.setenv("MAIL_FROM", "noreply@example.com")
    monkeypatch.setenv("DEBUG", "true")

        assert settings.app_title == "Python Hub"
        assert settings.app_description == "App for the community"
        assert settings.database_url == "postgresql://user:pass@localhost:5432/test_db"
        assert settings.secret_key == "test-secret"
        assert settings.internal_api_key == "test-internal-key"
        assert settings.algorithm == "HS256"
        assert settings.access_token_expire_minutes == 45
        assert settings.cloudinary_cloud_name == "demo-cloud"
        assert settings.cloudinary_api_key == "demo-key"
        assert settings.cloudinary_api_secret == "demo-secret"
        assert settings.smtp_host == "smtp.example.com"
        assert settings.smtp_port == 587
        assert settings.smtp_username == "smtp-user"
        assert settings.smtp_password == "smtp-pass"
        assert settings.mail_from == "noreply@example.com"
        assert settings.debug is True



def test_health() -> None:
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json()["status"] == "ok"


def test_version() -> None:
    response = client.get("/version")

    assert response.status_code == 200
    assert response.json()["service"] == "Python Hub"


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
    assert "Python Hub" in response.text
    assert "/app" in response.text


def test_flutter_app_is_served_by_fastapi() -> None:
    response = client.get("/app")

    assert response.status_code == 200
    assert "<html" in response.text


def test_flutter_deep_link_uses_flutter_entrypoint() -> None:
    response = client.get("/app/dashboard")

    assert response.status_code == 200
    assert "flutter_bootstrap.js" in response.text
