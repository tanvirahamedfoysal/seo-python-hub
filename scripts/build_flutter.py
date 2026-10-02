from pathlib import Path
import os
import shutil
import subprocess


ROOT = Path(__file__).resolve().parents[1]
FLUTTER = ROOT / "app" / "frontend" / "flutter"
BUILD = FLUTTER / "build" / "web"
DESTINATION = ROOT / "app" / "frontend" / "flutter_web"
API_BASE_URL = os.getenv(
    "API_BASE_URL",
    "https://seo-python-hub-437e0515.fastapicloud.dev",
)


subprocess.run(["flutter", "pub", "get"], cwd=FLUTTER, check=True)
subprocess.run(
    [
        "flutter",
        "build",
        "web",
        "--release",
        "--base-href",
        "/app/",
        "--dart-define",
        f"API_BASE_URL={API_BASE_URL}",
    ],
    cwd=FLUTTER,
    check=True,
)

if not (BUILD / "index.html").is_file():
    raise SystemExit("Flutter build did not produce build/web/index.html")

DESTINATION.mkdir(parents=True, exist_ok=True)
for child in DESTINATION.iterdir():
    if child.is_dir():
        shutil.rmtree(child)
    else:
        child.unlink()
shutil.copytree(BUILD, DESTINATION, dirs_exist_ok=True)
print(f"Copied Flutter Web artifact to {DESTINATION}")
