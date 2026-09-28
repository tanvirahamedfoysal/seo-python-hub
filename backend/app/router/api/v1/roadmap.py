from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/roadmap", tags=["roadmap"])


@router.get("")
async def get_roadmap() -> JSONResponse:
    return _not_implemented("Complete roadmap")


@router.get("/nodes")
async def list_roadmap_nodes() -> JSONResponse:
    return _not_implemented("Roadmap node listing")


@router.get("/nodes/{node_id}")
async def get_roadmap_node(node_id: str) -> JSONResponse:
    return _not_implemented(f"Roadmap node {node_id}")


@router.get("/nodes/{node_id}/children")
async def list_roadmap_node_children(node_id: str) -> JSONResponse:
    return _not_implemented(f"Children of roadmap node {node_id}")


@router.get("/nodes/{node_id}/prerequisites")
async def list_roadmap_node_prerequisites(node_id: str) -> JSONResponse:
    return _not_implemented(f"Prerequisites for roadmap node {node_id}")


@router.get("/me")
async def get_my_roadmap_progress() -> JSONResponse:
    return _not_implemented("Current roadmap progress")


@router.get("/{slug}")
async def get_roadmap_by_slug(slug: str) -> JSONResponse:
    return _not_implemented(f"Roadmap {slug}")


@router.patch("/nodes/{node_id}")
async def update_roadmap_node(node_id: str) -> JSONResponse:
    return _not_implemented(f"Update roadmap node {node_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
