from fastapi import APIRouter, HTTPException, status

router = APIRouter()


@router.get("/health")
async def health() -> dict[str, str]:
    raise HTTPException(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        detail="Not Implemented Yet",
    )