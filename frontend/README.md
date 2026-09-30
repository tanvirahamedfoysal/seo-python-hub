# Python Learning Hub — authenticated Flutter application

This project implements the private `/app` surface described in the Python Learning Hub page specification.

## Screen inventory

- Authentication: `/app/login`, `/app/register`, `/app/forgot-password`, `/app/reset-password`, `/app/verify-email`
- Learner workspace: `/app/dashboard`, `/app/progress`, `/app/bookmarks`, `/app/activity`, `/app/profile`, `/app/notifications`
- Community: `/app/messages`, `/app/messages/mentor-jules`, `/app/discussions`
- Administration: `/app/admin`, `/app/admin/content`, `/app/admin/roadmap`, `/app/admin/users`, `/app/admin/moderation`, `/app/admin/analytics`

The UI currently uses realistic local fixture data so every route is previewable without a running backend. The route layout is ready to connect to the FastAPI contract under `/api/v1`.

## Run

```bash
flutter pub get
flutter run -d chrome --web-renderer canvaskit \
  --dart-define=API_BASE_URL=http://127.0.0.1:8000
```

For the unified deployment described by the API specification:

```bash
flutter build web --release --base-href /app/ \
  --dart-define=API_BASE_URL=https://seo-python-hub-437e0515.fastapicloud.dev
```
