import asyncio
from datetime import datetime
import importlib

import pytest

from app.core import settings
from app.utility import auth, brevo, datetime as datetime_utility, rate_limiter


def test_upload_image_returns_cloudinary_metadata(monkeypatch: pytest.MonkeyPatch) -> None:
    cloudinary_utility = importlib.import_module("app.utility.cloudinary")
    uploaded_file = type("Upload", (), {"file": object()})()
    expected_file = uploaded_file.file

    def fake_upload(file, folder: str):
        assert file is expected_file
        assert folder == "peripheralstalk"
        return {"secure_url": "https://cdn.example/image.jpg", "public_id": "image-1"}

    monkeypatch.setattr(cloudinary_utility.cloudinary.uploader, "upload", fake_upload)

    result = asyncio.run(cloudinary_utility.upload_image(uploaded_file))

    assert result == {
        "url": "https://cdn.example/image.jpg",
        "public_id": "image-1",
    }


def test_send_email_builds_message_and_uses_fastmail(monkeypatch: pytest.MonkeyPatch) -> None:
    sent = {}

    class FakeFastMail:
        def __init__(self, config) -> None:
            sent["config"] = config

        async def send_message(self, message) -> None:
            sent["message"] = message

    monkeypatch.setattr(brevo, "FastMail", FakeFastMail)

    asyncio.run(brevo.send_email("user@example.com", "Welcome", "<p>Hello</p>"))

    message = sent["message"]
    assert message.subject == "Welcome"
    assert [recipient.email for recipient in message.recipients] == ["user@example.com"]
    assert message.body == "<p>Hello</p>"


def test_password_hash_is_not_the_plaintext_and_verifies() -> None:
    password = "correct horse battery staple"
    hashed = auth.hash_password(password)

    assert hashed != password
    assert auth.verify_password(password, hashed) is True
    assert auth.verify_password("wrong password", hashed) is False


def test_access_token_round_trip_preserves_claims() -> None:
    token = auth.create_access_token({"user_id": "user-1", "user_role": "STUDENT"})

    result = auth.verify_token(token)

    assert result["is_valid"] is True
    assert result["data"]["user_id"] == "user-1"
    assert result["data"]["user_role"] == "STUDENT"
    assert "exp" in result["data"]


def test_invalid_access_token_is_rejected() -> None:
    result = auth.verify_token("not-a-jwt")

    assert result == {"is_valid": False, "data": None}


@pytest.mark.parametrize("role", ["STUDENT", "ADMIN", "MODERATOR"])
def test_user_access_allows_supported_roles(role: str) -> None:
    token = auth.create_access_token({"user_id": "user-1", "user_role": role})

    assert auth.validate_user_access(token)["is_valid"] is True


def test_user_access_rejects_unknown_roles() -> None:
    token = auth.create_access_token({"user_id": "user-1", "user_role": "GUEST"})

    assert auth.validate_user_access(token)["is_valid"] is False


def test_admin_access_allows_admin() -> None:
    token = auth.create_access_token({"user_id": "user-1", "user_role": "ADMIN"})

    assert auth.validate_admin_access(token)["is_valid"] is True


@pytest.mark.parametrize("role", ["STUDENT", "MODERATOR"])
def test_admin_access_rejects_non_admin_roles(role: str) -> None:
    token = auth.create_access_token({"user_id": "user-1", "user_role": role})

    assert auth.validate_admin_access(token)["is_valid"] is False


def test_moderator_access_allows_moderators_and_admins() -> None:
    moderator_token = auth.create_access_token({"user_id": "user-1", "user_role": "MODERATOR"})
    admin_token = auth.create_access_token({"user_id": "user-2", "user_role": "ADMIN"})

    assert auth.validate_moderator_access(moderator_token)["is_valid"] is True
    assert auth.validate_moderator_access(admin_token)["is_valid"] is True


def test_access_token_uses_configured_expiration(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(settings, "access_token_expire_minutes", 15)
    before = datetime_utility.utc_now().timestamp()

    token = auth.create_access_token({"user_id": "user-1"})
    payload = auth.verify_token(token)["data"]

    assert before + 14 * 60 <= payload["exp"] <= before + 16 * 60


def test_datetime_helpers_return_aware_datetimes() -> None:
    utc_value = datetime_utility.utc_now()
    dhaka_value = datetime_utility.bd_now()

    assert isinstance(utc_value, datetime)
    assert isinstance(dhaka_value, datetime)
    assert utc_value.tzinfo is not None
    assert dhaka_value.tzinfo is not None
    assert utc_value.utcoffset() is not None
    assert dhaka_value.utcoffset() is not None


def test_rate_limit_key_uses_authenticated_user(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(
        rate_limiter,
        "validate_user_access",
        lambda token: {"is_valid": True, "data": {"user_id": "user-1"}},
    )
    request = type(
        "Request",
        (),
        {
            "headers": {"Authorization": "Bearer token"},
            "client": type("Client", (), {"host": "192.0.2.1"})(),
        },
    )()

    assert rate_limiter.rate_limit_key(request) == "user-1"


def test_rate_limit_key_uses_ip_and_device_for_guests() -> None:
    request = type(
        "Request",
        (),
        {
            "headers": {"device-id": "  Device-ABC  "},
            "client": type("Client", (), {"host": "192.0.2.1"})(),
        },
    )()

    assert rate_limiter.rate_limit_key(request) == "192.0.2.1:device-abc"


def test_rate_limit_key_falls_back_to_ip() -> None:
    request = type(
        "Request",
        (),
        {
            "headers": {},
            "client": type("Client", (), {"host": "192.0.2.1"})(),
        },
    )()

    assert rate_limiter.rate_limit_key(request) == "192.0.2.1"
