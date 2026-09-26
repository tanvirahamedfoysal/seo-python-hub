Automatic deployment:

1. Push changes to the `main` branch.
2. GitHub Actions builds and deploys Flutter Hosting when `frontend/` changes.
3. GitHub Actions runs backend tests when `backend/` changes.
4. FastAPI Cloud deploys the backend from the configured GitHub repository.

Manual Firebase deployment from the `frontend` directory:

flutter clean
flutter pub get
flutter build web --release --dart-define=API_BASE_URL=https://seo-python-hub-437e0515.fastapicloud.dev
firebase deploy --only hosting

Runtime links:

Frontend: https://seo-python-hub.web.app
Backend API: https://seo-python-hub-437e0515.fastapicloud.dev
API docs: https://seo-python-hub-437e0515.fastapicloud.dev/docs

The Flutter app reads `API_BASE_URL` at build time. The backend must allow the
frontend origin through `CORS_ORIGINS`, and both deployments must use the same
commit to stay synchronized.

