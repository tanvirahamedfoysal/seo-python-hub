from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/topics", tags=["topics"])


@router.get("")
async def list_topics() -> JSONResponse:
    return _not_implemented("Topic listing")


@router.post("")
async def create_topic() -> JSONResponse:
    return _not_implemented("Topic creation")


@router.get("/{slug}")
async def get_topic(slug: str) -> JSONResponse:
    return _not_implemented(f"Topic {slug}")


@router.patch("/{topic_id}")
async def update_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Update topic {topic_id}")


@router.delete("/{topic_id}")
async def delete_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Delete topic {topic_id}")


@router.get("/{topic_id}/related")
async def list_related_topics(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Related topics for {topic_id}")


@router.get("/{topic_id}/prerequisites")
async def list_topic_prerequisites(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Prerequisites for topic {topic_id}")


@router.get("/{topic_id}/next")
async def get_next_topic_recommendations(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Next topics for {topic_id}")


@router.post("/{topic_id}/publish")
async def publish_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Publish topic {topic_id}")


@router.post("/{topic_id}/unpublish")
async def unpublish_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Unpublish topic {topic_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
