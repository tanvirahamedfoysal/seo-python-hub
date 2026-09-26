
# Python Learning Hub API

## Implementation status

This document is the target API contract. The current backend exposes the `/api/v1` route boundary, but most domain endpoints are still deliberate `501 Not Implemented` placeholders until their database migrations, repositories, services, and schemas are implemented. The operational endpoints below are implemented and tested.

Flutter Web calls the backend through the compile-time `API_BASE_URL` value. Production uses `https://seo-python-hub-437e0515.fastapicloud.dev`; local development can use `http://127.0.0.1:8000`. Flutter is served by FastAPI at `/app`, so the production application URL is `https://seo-python-hub-437e0515.fastapicloud.dev/app`.

## 1. Public HTML pages

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | Home page |
| `GET` | `/roadmap` | Learning roadmap |
| `GET` | `/topics` | Topic listing |
| `GET` | `/topics/{slug}` | Topic detail page |
| `GET` | `/categories` | Category listing |
| `GET` | `/categories/{slug}` | Category detail page |
| `GET` | `/tags/{slug}` | Tag-based topic listing |
| `GET` | `/tutorials` | Tutorial listing |
| `GET` | `/tutorials/{slug}` | Tutorial detail |
| `GET` | `/guides` | Guide listing |
| `GET` | `/guides/{slug}` | Guide detail |
| `GET` | `/search` | Search page and results |
| `GET` | `/discussions` | Public discussion listing |
| `GET` | `/discussions/{discussion_id}` | Public discussion page |
| `GET` | `/about` | About page |
| `GET` | `/contact` | Contact page |
| `GET` | `/privacy` | Privacy policy |
| `GET` | `/terms` | Terms of service |
| `GET` | `/sitemap.xml` | Search engine sitemap |
| `GET` | `/robots.txt` | Crawler instructions |

## 2. Authentication API

Prefix: `/api/v1/auth`

| Method | Endpoint | Purpose |
|---|---|---|
| `POST` | `/register` | Create a user account |
| `POST` | `/login` | Authenticate a user |
| `POST` | `/logout` | End the current session |
| `GET` | `/me` | Return the authenticated user |
| `POST` | `/refresh` | Refresh authentication credentials |
| `POST` | `/forgot-password` | Request password reset |
| `POST` | `/reset-password` | Reset password |
| `POST` | `/verify-email` | Verify email address |
| `POST` | `/resend-verification` | Resend verification email |
| `POST` | `/change-password` | Change current password |
| `DELETE` | `/account` | Delete current account |

## 3. User API

Prefix: `/api/v1/users`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/me` | Get current profile |
| `PATCH` | `/me` | Update current profile |
| `GET` | `/me/statistics` | Get learning statistics |
| `GET` | `/me/activity` | Get activity history |
| `GET` | `/me/notifications` | List notifications |
| `PATCH` | `/me/notifications/{notification_id}` | Mark notification as read |
| `POST` | `/me/avatar` | Upload profile image |
| `DELETE` | `/me/avatar` | Remove profile image |
| `GET` | `/{user_id}` | Get public user profile |

## 4. Topics API

Prefix: `/api/v1/topics`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | List topics |
| `POST` | `/` | Create topic; admin only |
| `GET` | `/{slug}` | Get topic details |
| `PATCH` | `/{topic_id}` | Update topic; admin only |
| `DELETE` | `/{topic_id}` | Delete topic; admin only |
| `GET` | `/{topic_id}/related` | Get related topics |
| `GET` | `/{topic_id}/prerequisites` | Get prerequisite topics |
| `GET` | `/{topic_id}/next` | Get recommended next topics |
| `POST` | `/{topic_id}/publish` | Publish topic; admin only |
| `POST` | `/{topic_id}/unpublish` | Unpublish topic; admin only |

Example filters:

```text
GET /api/v1/topics?category=python&difficulty=beginner&page=1&page_size=20
```

## 5. Categories and tags API

Prefix: `/api/v1/categories`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | List categories |
| `POST` | `/` | Create category; admin only |
| `GET` | `/{slug}` | Get category details |
| `PATCH` | `/{category_id}` | Update category; admin only |
| `DELETE` | `/{category_id}` | Delete category; admin only |
| `GET` | `/{slug}/topics` | List topics in category |

Prefix: `/api/v1/tags`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | List tags |
| `POST` | `/` | Create tag; admin only |
| `GET` | `/{slug}` | Get tag details |
| `GET` | `/{slug}/topics` | List topics using tag |
| `DELETE` | `/{tag_id}` | Delete tag; admin only |

## 6. Roadmap API

Prefix: `/api/v1/roadmap`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | Get complete roadmap |
| `GET` | `/nodes` | List roadmap nodes |
| `GET` | `/nodes/{node_id}` | Get roadmap node |
| `GET` | `/nodes/{node_id}/children` | Get child topics |
| `GET` | `/nodes/{node_id}/prerequisites` | Get prerequisites |
| `GET` | `/me` | Get current user’s roadmap progress |
| `PATCH` | `/nodes/{node_id}` | Update roadmap node; admin only |

## 7. Progress API

Prefix: `/api/v1/progress`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | Get current user’s progress |
| `GET` | `/summary` | Get overall progress summary |
| `GET` | `/{topic_id}` | Get progress for one topic |
| `POST` | `/{topic_id}/start` | Mark topic as started |
| `POST` | `/{topic_id}/complete` | Mark topic as completed |
| `PATCH` | `/{topic_id}` | Update progress percentage |
| `DELETE` | `/{topic_id}` | Remove progress record |
| `GET` | `/history` | Get progress history |
| `GET` | `/streak` | Get learning streak |

## 8. Bookmarks API

Prefix: `/api/v1/bookmarks`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | List current user’s bookmarks |
| `POST` | `/` | Create bookmark |
| `GET` | `/{bookmark_id}` | Get bookmark |
| `DELETE` | `/{bookmark_id}` | Delete bookmark |
| `POST` | `/topics/{topic_id}` | Bookmark a topic |
| `DELETE` | `/topics/{topic_id}` | Remove topic bookmark |
| `GET` | `/check/{topic_id}` | Check bookmark status |

## 9. Search API

Prefix: `/api/v1/search`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | Search topics, guides, and tutorials |
| `GET` | `/suggestions` | Autocomplete suggestions |
| `GET` | `/popular` | Popular searches |
| `GET` | `/recent` | Current user’s recent searches |
| `DELETE` | `/recent` | Clear recent searches |

Example:

```text
GET /api/v1/search?q=asyncio&type=topic&page=1&page_size=20
```

## 10. Discussions API

Prefix: `/api/v1/discussions`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | List discussions |
| `POST` | `/` | Create discussion |
| `GET` | `/{discussion_id}` | Get discussion |
| `PATCH` | `/{discussion_id}` | Edit discussion |
| `DELETE` | `/{discussion_id}` | Delete discussion |
| `POST` | `/{discussion_id}/replies` | Add reply |
| `GET` | `/{discussion_id}/replies` | List replies |
| `PATCH` | `/{discussion_id}/replies/{reply_id}` | Edit reply |
| `DELETE` | `/{discussion_id}/replies/{reply_id}` | Delete reply |
| `POST` | `/{discussion_id}/like` | Like discussion |
| `DELETE` | `/{discussion_id}/like` | Remove like |
| `POST` | `/{discussion_id}/report` | Report discussion |
| `POST` | `/replies/{reply_id}/report` | Report reply |

## 11. Quizzes and exercises API

Prefix: `/api/v1/quizzes`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/` | List quizzes |
| `GET` | `/{quiz_id}` | Get quiz |
| `POST` | `/{quiz_id}/attempts` | Start quiz attempt |
| `GET` | `/{quiz_id}/attempts` | List user attempts |
| `GET` | `/attempts/{attempt_id}` | Get attempt |
| `POST` | `/attempts/{attempt_id}/answers` | Submit answer |
| `POST` | `/attempts/{attempt_id}/submit` | Submit quiz |
| `GET` | `/attempts/{attempt_id}/result` | Get quiz result |
| `POST` | `/` | Create quiz; admin only |
| `PATCH` | `/{quiz_id}` | Update quiz; admin only |
| `DELETE` | `/{quiz_id}` | Delete quiz; admin only |

## 12. HTMX component endpoints

Prefix: `/web-components`

These return HTML fragments rather than JSON.

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/search/results` | Search result fragment |
| `GET` | `/topics/{slug}/related` | Related-topic fragment |
| `POST` | `/topics/{topic_id}/progress` | Mark topic complete |
| `POST` | `/topics/{topic_id}/bookmark` | Add bookmark |
| `DELETE` | `/topics/{topic_id}/bookmark` | Remove bookmark |
| `POST` | `/discussions/{discussion_id}/replies` | Add reply fragment |
| `POST` | `/discussions/{discussion_id}/like` | Like discussion |
| `POST` | `/discussions/{discussion_id}/report` | Report discussion |
| `GET` | `/notifications` | Notification fragment |
| `POST` | `/notifications/{id}/read` | Mark notification read |
| `GET` | `/flash-messages` | Flash-message fragment |

## 13. Administration API

Prefix: `/api/v1/admin`

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/dashboard` | Admin dashboard statistics |
| `GET` | `/users` | List users |
| `PATCH` | `/users/{user_id}` | Update user |
| `POST` | `/users/{user_id}/suspend` | Suspend user |
| `POST` | `/users/{user_id}/restore` | Restore user |
| `GET` | `/topics/pending` | List unpublished topics |
| `GET` | `/reports` | List reports |
| `GET` | `/reports/{report_id}` | Get report |
| `PATCH` | `/reports/{report_id}` | Resolve report |
| `GET` | `/moderation/queue` | Moderation queue |
| `GET` | `/audit-logs` | Audit log |
| `GET` | `/analytics` | Platform analytics |

## 14. File and media API

Prefix: `/api/v1/media`

| Method | Endpoint | Purpose |
|---|---|---|
| `POST` | `/upload` | Upload media |
| `GET` | `/{media_id}` | Get media metadata |
| `DELETE` | `/{media_id}` | Delete media |
| `POST` | `/presigned-url` | Generate upload URL if external storage is used |

## 15. Health and system endpoints

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/health` | Returns `200` when the FastAPI process is running |
| `GET` | `/health/database` | Returns `200` when `DATABASE_URL` connects and `503` otherwise |
| `GET` | `/ready` | Returns `200` only when the configured PostgreSQL connection succeeds |
| `GET` | `/version` | Returns the configured service name and `APP_VERSION` |
| `GET` | `/docs` | Swagger API documentation |
| `GET` | `/redoc` | ReDoc API documentation |
| `GET` | `/openapi.json` | OpenAPI schema |

## 16. WebSocket endpoints

These are optional and should be introduced later.

| Endpoint | Purpose |
|---|---|
| `WS /ws/chat/{conversation_id}` | Real-time chat |
| `WS /ws/notifications` | Live notifications |
| `WS /ws/discussions/{discussion_id}` | Live discussion updates |
| `WS /ws/presence` | Online-user presence |

## Recommended MVP API

For the first release, implement only:

```text
POST /api/v1/auth/register
POST /api/v1/auth/login
POST /api/v1/auth/logout
GET  /api/v1/auth/me

GET  /api/v1/topics
GET  /api/v1/topics/{slug}

GET  /api/v1/roadmap
GET  /api/v1/progress
POST /api/v1/progress/{topic_id}/complete

GET  /api/v1/bookmarks
POST /api/v1/bookmarks/topics/{topic_id}
DELETE /api/v1/bookmarks/topics/{topic_id}

GET  /api/v1/search
GET  /health
```

## Frontend and backend synchronization

The unified deployment is:

```text
GitHub push to main
	-> build Flutter with --base-href /app/
	-> copy frontend/build/web into backend/app/flutter/web
	-> FastAPI Cloud deploys backend/
	-> FastAPI serves / and /app
	-> Flutter requests https://seo-python-hub-437e0515.fastapicloud.dev/api/v1/...
```

Deploy the backend after building the Flutter artifact. The Flutter build must include the backend URL:

```bash
flutter build web --release \
	--dart-define=API_BASE_URL=https://seo-python-hub-437e0515.fastapicloud.dev
```

FastAPI Cloud must be connected to the repository or deployed after running `python scripts/build_flutter.py` with `uv run fastapi deploy .` from `backend/`. The `/app` fallback serves Flutter's `index.html` for client-side routes such as `/app/dashboard`.

