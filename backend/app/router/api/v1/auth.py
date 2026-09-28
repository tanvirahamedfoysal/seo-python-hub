from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/auth", tags=["auth"])


@router.post("/register")
async def register_user() -> JSONResponse:
    return _not_implemented("User registration")


@router.post("/login")
async def login_user() -> JSONResponse:
    return _not_implemented("User login")


@router.post("/logout")
async def logout_user() -> JSONResponse:
    return _not_implemented("User logout")


@router.get("/me")
async def get_current_user() -> JSONResponse:
    return _not_implemented("Current user lookup")


@router.post("/refresh")
async def refresh_authentication() -> JSONResponse:
    return _not_implemented("Authentication refresh")


@router.post("/forgot-password")
async def request_password_reset() -> JSONResponse:
    return _not_implemented("Password reset request")


@router.post("/reset-password")
async def reset_password() -> JSONResponse:
    return _not_implemented("Password reset")


@router.post("/verify-email")
async def verify_email() -> JSONResponse:
    return _not_implemented("Email verification")


@router.post("/resend-verification")
async def resend_email_verification() -> JSONResponse:
    return _not_implemented("Email verification resend")


@router.post("/change-password")
async def change_password() -> JSONResponse:
    return _not_implemented("Password change")


@router.delete("/account")
async def delete_account() -> JSONResponse:
    return _not_implemented("Account deletion")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
