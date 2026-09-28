from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/discussions", tags=["discussions"])


@router.get("")
async def list_discussions() -> JSONResponse:
    return _not_implemented("Discussion listing")


@router.post("")
async def create_discussion() -> JSONResponse:
    return _not_implemented("Discussion creation")


@router.get("/{discussion_id}")
async def get_discussion(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Discussion {discussion_id}")


@router.patch("/{discussion_id}")
async def update_discussion(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Update discussion {discussion_id}")


@router.delete("/{discussion_id}")
async def delete_discussion(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Delete discussion {discussion_id}")


@router.post("/{discussion_id}/replies")
async def create_discussion_reply(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Create reply for discussion {discussion_id}")


@router.get("/{discussion_id}/replies")
async def list_discussion_replies(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Replies for discussion {discussion_id}")


@router.patch("/{discussion_id}/replies/{reply_id}")
async def update_discussion_reply(discussion_id: str, reply_id: str) -> JSONResponse:
    return _not_implemented(f"Update reply {reply_id} in discussion {discussion_id}")


@router.delete("/{discussion_id}/replies/{reply_id}")
async def delete_discussion_reply(discussion_id: str, reply_id: str) -> JSONResponse:
    return _not_implemented(f"Delete reply {reply_id} in discussion {discussion_id}")


@router.post("/{discussion_id}/like")
async def like_discussion(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Like discussion {discussion_id}")


@router.delete("/{discussion_id}/like")
async def unlike_discussion(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Unlike discussion {discussion_id}")


@router.post("/{discussion_id}/report")
async def report_discussion(discussion_id: str) -> JSONResponse:
    return _not_implemented(f"Report discussion {discussion_id}")


@router.post("/replies/{reply_id}/report")
async def report_discussion_reply(reply_id: str) -> JSONResponse:
    return _not_implemented(f"Report reply {reply_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
