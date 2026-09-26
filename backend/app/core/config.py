from functools import lru_cache
import os
from dataclasses import dataclass


@dataclass(frozen=True)
class Settings:
    app_name: str
    app_version: str
    environment: str
    api_prefix: str
    cors_origins: tuple[str, ...]
    database_url: str | None


@lru_cache
def get_settings() -> Settings:
    origins = tuple(
        origin.strip()
        for origin in os.getenv(
            "CORS_ORIGINS",
            "http://localhost:3000,http://localhost:5000",
        ).split(",")
        if origin.strip()
    )
    return Settings(
        app_name=os.getenv("APP_NAME", "SEO Python Hub"),
        app_version=os.getenv("APP_VERSION", "0.1.0"),
        environment=os.getenv("ENVIRONMENT", "development"),
        api_prefix=os.getenv("API_PREFIX", "/api/v1"),
        cors_origins=origins,
        database_url=os.getenv("DATABASE_URL"),
    )
