from collections.abc import Iterable, Mapping

from fastapi import APIRouter, Request, status
from fastapi.responses import JSONResponse


async def not_implemented(request: Request) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": "not implemented yet"},
    )


def register_stub_routes(
    router: APIRouter,
    routes: Mapping[str, Iterable[str]],
) -> None:
    """Register documented routes until their services are implemented."""
    for method, paths in routes.items():
        for path in paths:
            route_name = path.strip("/") or "root"
            route_name = route_name.replace("/", "_").replace("{", "by_").replace("}", "")
            router.add_api_route(
                path,
                not_implemented,
                methods=[method],
                name=f"{method.lower()}_{route_name}",
                response_class=JSONResponse,
                include_in_schema=True,
            )
