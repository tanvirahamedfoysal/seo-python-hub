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

FastAPI is the production boundary. Frontend source and deployable assets live
under `app/frontend`; backend logic lives under `app/backend`. Flutter is built
as a static Web artifact in `app/frontend/flutter_web` and served below `/app`.

## Project layout

```text
app/
  backend/                FastAPI entry point, APIs, core logic, and utilities
  frontend/
    htmx/                 Jinja2 templates, HTMX routes, and static assets
    flutter/               Raw Flutter project
    flutter_web/           Compiled Flutter Web artifact served at /app
test/                     Backend and frontend-serving tests
scripts/build_flutter.py  Builds and embeds Flutter into FastAPI
additionals/              API, planning, and deployment documentation
```

## Production URLs

- Application: https://seo-python-hub-eefdcd3b.fastapicloud.dev/app
- Backend home: https://seo-python-hub-eefdcd3b.fastapicloud.dev/
- API docs: https://seo-python-hub-eefdcd3b.fastapicloud.dev/docs
- Health: https://seo-python-hub-eefdcd3b.fastapicloud.dev/health

## Local development

Start FastAPI:

```bash
uv sync --dev
uv run uvicorn app.backend.main:app --reload
```

Run Flutter against the local backend in another terminal:

```bash
cd app/frontend/flutter
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
uv run python scripts/build_flutter.py
uv run pytest
uv run fastapi deploy .
```

The build script runs `flutter pub get`, builds with `--base-href /app/`,
passes the FastAPI URL through `API_BASE_URL`, and copies the output into
`app/frontend/flutter_web`. FastAPI Cloud deploys the root project after this
build step.

## Configuration

Copy `.env.example` to `.env` and configure values such as:

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
