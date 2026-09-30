from datetime import timedelta

from fastapi import HTTPException, status
from jose import JWTError, jwt
from passlib.context import CryptContext

from app.core import settings
from .datetime import utc_now


pwd_context = CryptContext(
    schemes=["argon2"],
    deprecated="auto",
)


def hash_password(password: str) -> str:
    return pwd_context.hash(password)


def verify_password(
    plain_password: str,
    hashed_password: str,
) -> bool:
    return pwd_context.verify(
        plain_password,
        hashed_password,
    )


def create_access_token(data: dict) -> str:
    payload = data.copy()
    expire_minutes = getattr(
        settings,
        "access_token_expire_minutes",
        60,
    )
    expire = utc_now() + timedelta(
        minutes=expire_minutes,
    )
    payload.update({
        "exp": expire,
    })
    token = jwt.encode(
        payload,
        getattr(settings, "secret_key", ""),
        algorithm=getattr(settings, "algorithm", "HS256"),
    )
    return token


def verify_token(token: str) -> dict:
    try:
        payload = jwt.decode(
            token,
            getattr(settings, "secret_key", ""),
            algorithms=[
                getattr(settings, "algorithm", "HS256")
            ],
        )
        return payload
    except JWTError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="INVALID OR EXPIRED TOKEN",
        )


def validate_user_access(token: str) -> dict:
    user_data = verify_token(token)
    if user_data.get("user_role") in {"USER", "ADMIN"}:
        return user_data
    raise HTTPException(
        status_code=status.HTTP_403_FORBIDDEN,
        detail="INSUFFICIENT PERMISSION",
    )


def validate_admin_access(token: str) -> dict:
    admin_data = verify_token(token)
    if admin_data.get("user_role") == "ADMIN":
        return admin_data
    raise HTTPException(
        status_code=status.HTTP_403_FORBIDDEN,
        detail="INSUFFICIENT PERMISSION",
    )
