from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/bookmarks", tags=["bookmarks"])


@router.get("")
async def list_bookmarks() -> JSONResponse:
    return _not_implemented("Bookmark listing")


@router.post("")
async def create_bookmark() -> JSONResponse:
    return _not_implemented("Bookmark creation")


@router.get("/{bookmark_id}")
async def get_bookmark(bookmark_id: str) -> JSONResponse:
    return _not_implemented(f"Bookmark {bookmark_id}")


@router.delete("/{bookmark_id}")
async def delete_bookmark(bookmark_id: str) -> JSONResponse:
    return _not_implemented(f"Delete bookmark {bookmark_id}")


@router.post("/topics/{topic_id}")
async def bookmark_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Bookmark topic {topic_id}")


@router.delete("/topics/{topic_id}")
async def remove_topic_bookmark(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Remove bookmark for topic {topic_id}")


@router.get("/check/{topic_id}")
async def check_topic_bookmark(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Check bookmark for topic {topic_id}")


@router.get("/topics/{topic_id}")
async def get_topic_bookmark(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Get bookmark for topic {topic_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
