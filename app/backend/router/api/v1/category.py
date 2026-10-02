from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/categories", tags=["categories"])


@router.get("")
async def list_categories() -> JSONResponse:
    return _not_implemented("Category listing")


@router.post("")
async def create_category() -> JSONResponse:
    return _not_implemented("Category creation")


@router.get("/{slug}")
async def get_category(slug: str) -> JSONResponse:
    return _not_implemented(f"Category {slug}")


@router.patch("/{category_id}")
async def update_category(category_id: str) -> JSONResponse:
    return _not_implemented(f"Update category {category_id}")


@router.delete("/{category_id}")
async def delete_category(category_id: str) -> JSONResponse:
    return _not_implemented(f"Delete category {category_id}")


@router.get("/{slug}/topics")
async def list_category_topics(slug: str) -> JSONResponse:
    return _not_implemented(f"Topics in category {slug}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
