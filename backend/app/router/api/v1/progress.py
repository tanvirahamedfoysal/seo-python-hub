from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/progress", tags=["progress"])


@router.get("")
async def get_progress() -> JSONResponse:
    return _not_implemented("Current progress")


@router.get("/summary")
async def get_progress_summary() -> JSONResponse:
    return _not_implemented("Progress summary")


@router.get("/history")
async def get_progress_history() -> JSONResponse:
    return _not_implemented("Progress history")


@router.get("/streak")
async def get_progress_streak() -> JSONResponse:
    return _not_implemented("Learning streak")


@router.get("/{topic_id}")
async def get_topic_progress(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Progress for topic {topic_id}")


@router.post("/{topic_id}/start")
async def start_topic_progress(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Start progress for topic {topic_id}")


@router.post("/{topic_id}/complete")
async def complete_topic_progress(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Complete topic {topic_id}")


@router.patch("/{topic_id}")
async def update_topic_progress(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Update progress for topic {topic_id}")


@router.delete("/{topic_id}")
async def delete_topic_progress(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Delete progress for topic {topic_id}")


@router.delete("/{topic_id}/complete")
async def reset_topic_completion(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Reset completion for topic {topic_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
