import asyncpg
from fastapi import APIRouter, status
from fastapi.responses import JSONResponse

from app.core.config import get_settings

router = APIRouter()


@router.get("/health")
async def health() -> dict[str, str]:
    return {"status": "ok"}


@router.get("/health/database")
async def database_health() -> JSONResponse:
    settings = get_settings()
    if not settings.database_url:
        return JSONResponse(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            content={"status": "unavailable", "message": "DATABASE_URL is not configured"},
        )

    try:
        connection = await asyncpg.connect(settings.database_url, timeout=2)
        await connection.close()
    except Exception:
        return JSONResponse(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            content={"status": "unavailable", "message": "Database is unavailable"},
        )

    return JSONResponse(status_code=status.HTTP_200_OK, content={"status": "ok"})


@router.get("/ready")
async def readiness() -> JSONResponse:
    database_response = await database_health()
    if database_response.status_code != status.HTTP_200_OK:
        return JSONResponse(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            content={"status": "unavailable", "message": "Service is not ready"},
        )
    return JSONResponse(status_code=status.HTTP_200_OK, content={"status": "ready"})


@router.get("/version")
async def version() -> dict[str, str]:
    settings = get_settings()
    return {"service": settings.app_name, "version": settings.app_version}