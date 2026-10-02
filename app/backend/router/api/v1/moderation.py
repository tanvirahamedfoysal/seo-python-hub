from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(tags=["moderation"])


@router.post("/reports")
async def create_moderation_report() -> JSONResponse:
    return _not_implemented("Moderation report creation")


@router.patch("/replies/{reply_id}")
async def moderate_reply(reply_id: str) -> JSONResponse:
    return _not_implemented(f"Moderate reply {reply_id}")


@router.delete("/replies/{reply_id}")
async def remove_moderated_reply(reply_id: str) -> JSONResponse:
    return _not_implemented(f"Remove reply {reply_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
