Unified FastAPI deployment:

1. Push changes to the `main` branch.
2. Build and copy Flutter into the backend package:

python scripts/build_flutter.py

3. Deploy the backend and embedded Flutter application:

cd backend
uv run fastapi deploy .

Runtime links:

Application: https://seo-python-hub-437e0515.fastapicloud.dev/app
Backend API: https://seo-python-hub-437e0515.fastapicloud.dev/api/v1
API docs: https://seo-python-hub-437e0515.fastapicloud.dev/docs

The Flutter app reads `API_BASE_URL` at build time and is served by the same
FastAPI origin.

