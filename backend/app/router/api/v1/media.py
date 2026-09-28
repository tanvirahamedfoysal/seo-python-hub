from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/media", tags=["media"])


@router.post("/upload")
async def upload_media() -> JSONResponse:
    return _not_implemented("Media upload")


@router.post("/presigned-url")
async def create_media_presigned_url() -> JSONResponse:
    return _not_implemented("Media presigned URL")


@router.get("/{media_id}")
async def get_media_metadata(media_id: str) -> JSONResponse:
    return _not_implemented(f"Media metadata {media_id}")


@router.delete("/{media_id}")
async def delete_media(media_id: str) -> JSONResponse:
    return _not_implemented(f"Delete media {media_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
