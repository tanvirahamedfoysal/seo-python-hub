from fastapi import APIRouter, status
from fastapi.responses import JSONResponse


router = APIRouter(prefix="/quizzes", tags=["quizzes"])


@router.get("")
async def list_quizzes() -> JSONResponse:
    return _not_implemented("Quiz listing")


@router.post("")
async def create_quiz() -> JSONResponse:
    return _not_implemented("Quiz creation")


@router.get("/{quiz_id}")
async def get_quiz(quiz_id: str) -> JSONResponse:
    return _not_implemented(f"Quiz {quiz_id}")


@router.patch("/{quiz_id}")
async def update_quiz(quiz_id: str) -> JSONResponse:
    return _not_implemented(f"Update quiz {quiz_id}")


@router.delete("/{quiz_id}")
async def delete_quiz(quiz_id: str) -> JSONResponse:
    return _not_implemented(f"Delete quiz {quiz_id}")


@router.post("/{quiz_id}/attempts")
async def start_quiz_attempt(quiz_id: str) -> JSONResponse:
    return _not_implemented(f"Start attempt for quiz {quiz_id}")


@router.get("/{quiz_id}/attempts")
async def list_quiz_attempts(quiz_id: str) -> JSONResponse:
    return _not_implemented(f"Attempts for quiz {quiz_id}")


@router.get("/attempts/{attempt_id}")
async def get_quiz_attempt(attempt_id: str) -> JSONResponse:
    return _not_implemented(f"Quiz attempt {attempt_id}")


@router.post("/attempts/{attempt_id}/answers")
async def submit_quiz_answer(attempt_id: str) -> JSONResponse:
    return _not_implemented(f"Submit answer for attempt {attempt_id}")


@router.post("/attempts/{attempt_id}/submit")
async def submit_quiz_attempt(attempt_id: str) -> JSONResponse:
    return _not_implemented(f"Submit quiz attempt {attempt_id}")


@router.get("/attempts/{attempt_id}/result")
async def get_quiz_result(attempt_id: str) -> JSONResponse:
    return _not_implemented(f"Result for quiz attempt {attempt_id}")


def _not_implemented(operation: str) -> JSONResponse:
    return JSONResponse(
        status_code=status.HTTP_501_NOT_IMPLEMENTED,
        content={"message": f"{operation} is not implemented yet", "status": 501},
    )
