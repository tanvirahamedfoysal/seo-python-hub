from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/admin", tags=["admin"])


@router.get("/dashboard")
async def get_admin_dashboard() -> JSONResponse:
    return _not_implemented("Admin dashboard statistics")


@router.get("/users")
async def list_admin_users() -> JSONResponse:
    return _not_implemented("Admin user listing")


@router.patch("/users/{user_id}")
async def update_admin_user(user_id: str) -> JSONResponse:
    return _not_implemented(f"Update admin user {user_id}")


@router.get("/users/{user_id}")
async def get_admin_user(user_id: str) -> JSONResponse:
    return _not_implemented(f"Get admin user {user_id}")


@router.post("/users/{user_id}/suspend")
async def suspend_admin_user(user_id: str) -> JSONResponse:
    return _not_implemented(f"Suspend admin user {user_id}")


@router.post("/users/{user_id}/restore")
async def restore_admin_user(user_id: str) -> JSONResponse:
    return _not_implemented(f"Restore admin user {user_id}")


@router.patch("/users/{user_id}/role")
async def update_admin_user_role(user_id: str) -> JSONResponse:
    return _not_implemented(f"Update role for admin user {user_id}")


@router.patch("/users/{user_id}/status")
async def update_admin_user_status(user_id: str) -> JSONResponse:
    return _not_implemented(f"Update status for admin user {user_id}")


@router.get("/topics")
async def list_admin_topics() -> JSONResponse:
    return _not_implemented("Admin topic listing")


@router.post("/topics")
async def create_admin_topic() -> JSONResponse:
    return _not_implemented("Create admin topic")


@router.patch("/topics/{topic_id}")
async def update_admin_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Update admin topic {topic_id}")


@router.delete("/topics/{topic_id}")
async def delete_admin_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Delete admin topic {topic_id}")


@router.get("/topics/pending")
async def list_pending_topics() -> JSONResponse:
    return _not_implemented("Pending topic listing")


@router.post("/topics/{topic_id}/publish")
async def publish_admin_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Publish admin topic {topic_id}")


@router.post("/topics/{topic_id}/unpublish")
async def unpublish_admin_topic(topic_id: str) -> JSONResponse:
    return _not_implemented(f"Unpublish admin topic {topic_id}")


@router.get("/reports")
async def list_admin_reports() -> JSONResponse:
    return _not_implemented("Admin report listing")


@router.get("/reports/{report_id}")
async def get_admin_report(report_id: str) -> JSONResponse:
    return _not_implemented(f"Get admin report {report_id}")


@router.patch("/reports/{report_id}")
async def resolve_admin_report(report_id: str) -> JSONResponse:
    return _not_implemented(f"Resolve admin report {report_id}")


@router.get("/moderation/queue")
async def get_moderation_queue() -> JSONResponse:
    return _not_implemented("Moderation queue")


@router.get("/audit-logs")
async def list_audit_logs() -> JSONResponse:
    return _not_implemented("Audit log listing")


@router.get("/analytics")
async def get_admin_analytics() -> JSONResponse:
    return _not_implemented("Admin analytics")


@router.get("/statistics")
async def get_admin_statistics() -> JSONResponse:
    return _not_implemented("Admin statistics")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
