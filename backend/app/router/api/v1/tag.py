from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/tags", tags=["tags"])


@router.get("")
async def list_tags() -> JSONResponse:
    return _not_implemented("Tag listing")


@router.post("")
async def create_tag() -> JSONResponse:
    return _not_implemented("Tag creation")


@router.get("/{slug}")
async def get_tag(slug: str) -> JSONResponse:
    return _not_implemented(f"Tag {slug}")


@router.get("/{slug}/topics")
async def list_tag_topics(slug: str) -> JSONResponse:
    return _not_implemented(f"Topics using tag {slug}")


@router.delete("/{tag_id}")
async def delete_tag(tag_id: str) -> JSONResponse:
    return _not_implemented(f"Delete tag {tag_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
