import asyncpg
from fastapi import APIRouter, status
from fastapi.responses import JSONResponse

from app.backend.core import settings

router = APIRouter()


@router.get("/health-status")
async def health_status() -> JSONResponse:
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

    return JSONResponse(
        status_code=status.HTTP_200_OK, 
        content={"status": "ok", "message": "Service is ready"}
    )
