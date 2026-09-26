# SEO Python Hub

A Python learning platform with SEO-friendly FastAPI pages and a Flutter Web application served by the same FastAPI deployment.

## Architecture

```text
Browser
  |
  v
FastAPI
  |-- Jinja2 + HTMX public pages: /
  |-- JSON API: /api/v1
  |-- Flutter Web application: /app
  `-- Health and docs: /health, /ready, /docs
       |
       `-- PostgreSQL through asyncpg
```

FastAPI is the production boundary. Flutter is built as a static Web artifact,
embedded in `backend/app/flutter/web`, and served below `/app`. The Flutter
client calls the API through the same origin in production.

## Project layout

```text
backend/
  app/
    core/                 Settings and application configuration
    flutter/              Generated Flutter Web artifact served at /app
    routers/              FastAPI route modules
    templates/            Jinja2 pages and HTML fragments
  tests/                  Backend tests
  pyproject.toml
frontend/                 Flutter source project
scripts/build_flutter.py  Builds and embeds Flutter into FastAPI
Additional Information/   API, planning, and deployment documentation
```

## Production URLs

- Application: https://seo-python-hub-437e0515.fastapicloud.dev/app
- Backend home: https://seo-python-hub-437e0515.fastapicloud.dev/
- API docs: https://seo-python-hub-437e0515.fastapicloud.dev/docs
- Health: https://seo-python-hub-437e0515.fastapicloud.dev/health

## Local development

Start FastAPI:

```bash
cd backend
uv sync --dev
uv run uvicorn app.main:app --reload
```

Run Flutter against the local backend in another terminal:

```bash
cd frontend
flutter pub get
flutter run -d chrome --dart-define=API_BASE_URL=http://127.0.0.1:8000
```

Useful local URLs:

```text
http://127.0.0.1:8000/
http://127.0.0.1:8000/app
http://127.0.0.1:8000/docs
http://127.0.0.1:8000/health
```

## Build and deploy

Run from the repository root:

```bash
python scripts/build_flutter.py
cd backend
uv run pytest
uv run fastapi deploy .
```

The build script runs `flutter pub get`, builds with `--base-href /app/`,
passes the FastAPI URL through `API_BASE_URL`, and copies the output into the
backend package. FastAPI Cloud must deploy the backend after this build step.

## Configuration

Copy `backend/.env.example` to `backend/.env` and configure values such as:

- `DATABASE_URL` for PostgreSQL
- `CORS_ORIGINS` for local development origins
- `APP_VERSION` for release identification

The Flutter API URL is a build-time value:

```bash
flutter build web --dart-define=API_BASE_URL=http://127.0.0.1:8000
```

## Current implementation

Implemented foundation:

- FastAPI settings and CORS configuration
- `/health`, `/health/database`, `/ready`, and `/version`
- Root FastAPI page at `/`
- Flutter Web mounting at `/app` with deep-link fallback
- Versioned `/api/v1` route boundary
- Backend tests and Flutter static analysis
- GitHub Actions build and test validation

Most learning, authentication, progress, bookmark, and discussion endpoints
remain planned API contracts or explicit `501 Not Implemented` placeholders.

## Documentation

- [Deployment runbook](Additional%20Information/Deployment.md)
- [API contract](Additional%20Information/API.md)
- [Implementation plan](Additional%20Information/Planning.md)
- [Project proposal source](Additional%20Information/Project%20Proposal.tex)
