import asyncpg
from fastapi import APIRouter, status
from fastapi.responses import JSONResponse

from app.core.config import get_settings


router = APIRouter(tags=["system"])


async def _database_status() -> tuple[bool, str]:
    database_url = get_settings().database_url
    if not database_url:
        return False, "DATABASE_URL is not configured"
    try:
        connection = await asyncpg.connect(database_url, timeout=3)
        await connection.execute("SELECT 1")
        await connection.close()
    except (OSError, asyncpg.PostgresError, TimeoutError) as error:
        return False, str(error)
    return True, "connected"


@router.get("/health")
async def health() -> dict[str, str]:
    settings = get_settings()
    return {"status": "ok", "service": settings.app_name}


@router.get("/health/database")
async def database_health() -> JSONResponse:
    connected, detail = await _database_status()
    if not connected:
        return JSONResponse(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            content={"status": "unavailable", "detail": detail},
        )
    return {"status": "ok", "detail": detail}


@router.get("/ready")
async def ready() -> JSONResponse:
    connected, detail = await _database_status()
    if not connected:
        return JSONResponse(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            content={"status": "not_ready", "detail": detail},
        )
    return JSONResponse(
        status_code=status.HTTP_200_OK,
        content={"status": "ready", "service": settings.app_name},
    )


@router.get("/version")
async def version() -> dict[str, str]:
    settings = get_settings()
    return {"service": settings.app_name, "version": settings.app_version}
