from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/search", tags=["search"])


@router.get("")
async def search_content() -> JSONResponse:
    return _not_implemented("Content search")


@router.get("/suggestions")
async def get_search_suggestions() -> JSONResponse:
    return _not_implemented("Search suggestions")


@router.get("/popular")
async def get_popular_searches() -> JSONResponse:
    return _not_implemented("Popular searches")


@router.get("/recent")
async def get_recent_searches() -> JSONResponse:
    return _not_implemented("Recent searches")


@router.delete("/recent")
async def clear_recent_searches() -> JSONResponse:
    return _not_implemented("Clear recent searches")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
