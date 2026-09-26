from pathlib import Path

from fastapi import APIRouter
from fastapi.responses import HTMLResponse, FileResponse


WEB_ROOT = Path(__file__).parent / "web"
router = APIRouter(tags=["flutter"])


FALLBACK_HTML = """<!doctype html>
<html lang="en">
<head><meta charset="utf-8"><title>Flutter build unavailable</title></head>
<body>
<h1>Flutter build unavailable</h1>
<p>Build the Flutter Web artifact and deploy the backend again.</p>
</body>
</html>
"""


def _safe_asset(path: str) -> Path | None:
    root = WEB_ROOT.resolve()
    candidate = (root / path).resolve()
    if not candidate.is_relative_to(root) or not candidate.is_file():
        return None
    return candidate


def _response_for(path: str):
    if not WEB_ROOT.is_dir():
        return HTMLResponse(FALLBACK_HTML, status_code=503)
    asset = _safe_asset(path) if path else None
    if asset is not None:
        return FileResponse(asset)
    index = _safe_asset("index.html")
    if index is None:
        return HTMLResponse(FALLBACK_HTML, status_code=503)
    return FileResponse(index)


@router.get("/app", include_in_schema=False)
async def flutter_app():
    return _response_for("index.html")


@router.get("/app/{path:path}", include_in_schema=False)
async def flutter_asset(path: str):
    return _response_for(path)
