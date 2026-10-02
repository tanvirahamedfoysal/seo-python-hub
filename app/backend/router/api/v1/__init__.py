from fastapi import APIRouter

from .admin import router as admin_router
from .auth import router as auth_router
from .bookmark import router as bookmark_router
from .category import router as category_router
from .discussion import router as discussion_router
from .media import router as media_router
from .moderation import router as moderation_router
from .progress import router as progress_router
from .quizz import router as quiz_router
from .roadmap import router as roadmap_router
from .search import router as search_router
from .tag import router as tag_router
from .topic import router as topic_router
from .users import router as users_router


router = APIRouter()

router.include_router(auth_router)
router.include_router(users_router)
router.include_router(topic_router)
router.include_router(category_router)
router.include_router(tag_router)
router.include_router(roadmap_router)
router.include_router(progress_router)
router.include_router(bookmark_router)
router.include_router(search_router)
router.include_router(discussion_router)
router.include_router(quiz_router)
router.include_router(admin_router)
router.include_router(media_router)
router.include_router(moderation_router)

__all__ = ["router"]
