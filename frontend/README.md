# Flutter Web frontend

This directory contains the Flutter source project. In production, Flutter is
not deployed as a separate site. It is built and embedded into the FastAPI
package, then served at `/app`.

## Local development

Start the backend first:

```bash
cd ../backend
uv sync --dev
uv run uvicorn app.main:app --reload
```

Then run Flutter in this directory:

```bash
flutter pub get
flutter run -d chrome --dart-define=API_BASE_URL=http://127.0.0.1:8000
```

## Production build

From the repository root, use the shared build script:

```bash
python scripts/build_flutter.py
```

The script builds with `/app/` as the base path and copies the generated files
to `backend/app/flutter/web`. FastAPI then serves the application at:

```text
https://seo-python-hub-437e0515.fastapicloud.dev/app
```

Do not edit files inside `build/`; they are generated output.
