## Backend

The backend is a FastAPI application in `app/`.

### Local development

```bash
uv sync --dev
uv run uvicorn app.main:app --reload
```

Operational endpoints:

- `GET /health` checks that the process is running.
- `GET /health/database` checks PostgreSQL when `DATABASE_URL` is configured.
- `GET /ready` reports whether required services are available.
- `GET /version` reports the deployed application version.

The Flutter web app is served by the same FastAPI deployment at `/app`. Build
it with `python scripts/build_flutter.py` before deploying the backend.

The backend owns these production surfaces:

- `/` for the server-rendered backend home page;
- `/app` for Flutter Web, including client-side deep links;
- `/api/v1` for versioned JSON endpoints;
- `/health`, `/ready`, `/version`, and `/docs` for operations and inspection.

### Synchronization

Pushes to `main` build the Flutter artifact and run backend tests through GitHub
Actions. FastAPI Cloud must be connected to this repository and configured to
run the same build helper before deploying the `backend` directory. The
production URLs are:

- `https://seo-python-hub-437e0515.fastapicloud.dev/`
- `https://seo-python-hub-437e0515.fastapicloud.dev/app`
- `https://seo-python-hub-437e0515.fastapicloud.dev/docs`

Manual deployment:

```bash
python scripts/build_flutter.py
cd backend
uv run pytest
uv run fastapi deploy .
```
