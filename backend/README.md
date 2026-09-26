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

The Flutter web app calls the FastAPI deployment through `API_BASE_URL`. Set
`CORS_ORIGINS` in FastAPI Cloud to include `https://seo-python-hub.web.app`.

### Synchronization

Pushes to `main` run backend tests and deploy the Flutter build through GitHub
Actions. FastAPI Cloud must be connected to this repository and configured to
deploy the `backend` directory. Both services should deploy from the same
commit; the Flutter build receives the backend URL through `API_BASE_URL`.
