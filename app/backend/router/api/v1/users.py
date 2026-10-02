from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/users", tags=["users"])


@router.get("/me")
async def get_my_profile() -> JSONResponse:
    return _not_implemented("Current profile lookup")


@router.patch("/me")
async def update_my_profile() -> JSONResponse:
    return _not_implemented("Current profile update")


@router.get("/me/statistics")
async def get_my_statistics() -> JSONResponse:
    return _not_implemented("Learning statistics")


@router.get("/me/activity")
async def get_my_activity() -> JSONResponse:
    return _not_implemented("Activity history")


@router.get("/me/notifications")
async def list_my_notifications() -> JSONResponse:
    return _not_implemented("Notification listing")


@router.patch("/me/notifications/{notification_id}")
async def mark_my_notification_read(notification_id: str) -> JSONResponse:
    return _not_implemented(f"Mark notification {notification_id} as read")


@router.post("/me/avatar")
async def upload_my_avatar() -> JSONResponse:
    return _not_implemented("Avatar upload")


@router.delete("/me/avatar")
async def delete_my_avatar() -> JSONResponse:
    return _not_implemented("Avatar removal")


@router.get("/{user_id}")
async def get_public_user_profile(user_id: str) -> JSONResponse:
    return _not_implemented(f"Public user profile {user_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
