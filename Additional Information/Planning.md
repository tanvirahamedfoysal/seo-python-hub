# Python Learning Hub
### SEO-Optimized Python Learning and Community Platform

## Frontend Architecture Summary

Python Learning Hub intentionally uses **two frontend layers**:

1. **Jinja2 + HTMX + Tailwind CSS** for the public website, SEO-sensitive content, documentation, roadmap pages, tutorials, guides, public discussions, and lightweight progressive interactions.
2. **Flutter Web** for the interactive application, authenticated learner dashboard, profile, progress management, bookmarks, chat interface, and administrator dashboard.

Both frontends use the same FastAPI backend, PostgreSQL database, Redis infrastructure, shared services, authentication rules, and raw SQL repositories. Flutter Web is not replacing Jinja2, and Jinja2 is not replacing Flutter Web; each frontend serves a different part of the product.

## Profile Type

### Admin

Platform administrator responsible for managing users, educational content, discussions, reports, and overall platform operations through the authenticated Flutter Web application.

### User

Registered learner who can access personalized learning features such as task completion, bookmarks, discussions, chat, and learning statistics.

### Viewer

Unregistered visitor who can browse and read publicly available educational content through server-rendered, SEO-friendly pages. Viewers cannot access personalized features without authentication.

## Features

### 1. Python Learning Guide

A structured beginner-to-expert learning path containing Python fundamentals, data structures, modules, exceptions, files, object-oriented programming, iterators, generators, decorators, context managers, type hints, asynchronous programming, testing, packaging, and practical projects.

### 2. Per-User Learning Progress

- Mark topics and tasks as completed.
- View progress by roadmap, category, and topic.
- Continue from the last incomplete topic.
- Display progress through HTMX on public pages and through the Flutter dashboard for authenticated users.

### 3. Per-User Bookmarks

- Bookmark articles, tutorials, code examples, and references.
- View and remove bookmarks from the Flutter application.
- Allow lightweight bookmark actions through authenticated HTMX requests where appropriate.

### 4. Discussion System

- Topic-specific discussion areas for Core Python, NumPy, Pandas, Polars, Matplotlib, Scikit-learn, FastAPI, Django, and SQLAlchemy.
- Questions and discussions linked to relevant learning content.
- Replies, editing and deletion of owned content, reporting, moderation, and public discussion browsing.
- Public discussion pages are rendered with Jinja2; participation uses authenticated HTMX requests or the REST API.

### 5. Optional Chat System

- One-to-one private chat and group chat.
- Membership management, message history, timestamps, unread counts, and online status.
- WebSockets deliver real-time events, Redis coordinates transient presence and events, and PostgreSQL persists durable messages.
- Discussions remain part of the core release; chat may be enabled incrementally.

### 6. Python Code Examples

Syntax-highlighted examples with explanations, expected output, input data, copy actions, and beginner or advanced variants.

### 7. Python Tutorials

Long-form tutorials covering practical workflows, debugging, testing, web development, data work, automation, and project-based learning.

### 8. Python Library and Framework Guide

Guides for relevant libraries and frameworks, including installation, first usage, common patterns, comparisons, and related learning topics.

### 9. Search

Search across topics, tutorials, code examples, libraries, categories, tags, and public discussions. Public search results are returned as Jinja2 pages, HTMX fragments, or REST JSON depending on the client.

### 10. Categories and Tags

Categorization by difficulty, subject, library, framework, and learning level, with clean slugs and related-content navigation.

### 11. Learning Roadmap

A navigable roadmap from beginner to expert, with prerequisite relationships, recommended order, completion status, and links to related content.

### 12. Quizzes and Practice Tasks

Multiple-choice, output-prediction, conceptual, and topic-based exercises with scores and progress tracking. Quizzes are public where appropriate; attempts and scores require authentication.

### 13. SEO-Optimized Content

Public topics, tutorials, guides, categories, and selected discussions use server-rendered semantic HTML with unique titles, descriptions, headings, canonical URLs, breadcrumbs, internal links, and structured data where appropriate.

### 14. Technical SEO

The platform provides clean URLs, XML sitemaps, `robots.txt`, correct status codes, canonical metadata, Open Graph metadata, mobile-friendly layouts, accessible markup, and protected private routes.

## Functionalities

### Admin

- Manage users, roles, suspension, and account status.
- Create, edit, publish, unpublish, archive, and delete educational content.
- Manage categories, tags, roadmap relationships, code examples, quizzes, and SEO metadata.
- Moderate discussions, replies, reports, users, groups, and messages when chat is enabled.
- View platform statistics through the authenticated Flutter administration interface.

### User

- Register, log in, log out, reset a password, and manage a profile.
- Track topics, tasks, quizzes, bookmarks, activity, and learning statistics.
- Participate in discussions and optional chat.
- Use the Flutter Web application for dashboards and complex authenticated workflows.

### Viewer

- Browse the roadmap, topics, tutorials, guides, categories, tags, and public discussions.
- Search public content.
- Read SEO-friendly pages without JavaScript or authentication.
- Use progressive HTMX interactions where available.

## Technology

### Backend

- Python
- FastAPI
- Jinja2
- HTMX
- Tailwind CSS
- Uvicorn

FastAPI is the single backend and application boundary. Jinja2 renders public HTML pages and HTMX fragments. FastAPI also exposes the versioned REST API consumed by Flutter Web and future clients.

### Frontend

- **Jinja2 + HTMX + Tailwind CSS** for the public server-rendered website.
- **Flutter Web** for the interactive and authenticated application.
- Minimal JavaScript for small public-page enhancements that are not handled by HTMX.

The two frontends have separate responsibilities:

| Frontend | Main responsibility | Backend interface |
|---|---|---|
| Jinja2 + HTMX | Public SEO pages and lightweight interactions | HTML page routes and HTMX fragment routes |
| Flutter Web | Authenticated dashboards and complex interactive workflows | Versioned REST API and selected WebSocket routes |

Flutter is placed under `/app` and does not replace the server-rendered public website. Public content remains accessible through direct HTML URLs, while authenticated application features are delivered by Flutter Web.

### Database

- PostgreSQL as the durable source of truth.
- Raw SQL for explicit and optimized queries.
- `asyncpg` for asynchronous connection pooling and query execution.
- Alembic and/or SQL migration files for versioned schema changes.

The project will not use an ORM.

### Cache and Real-Time Infrastructure

- Redis for safe cache-aside reads, rate limiting, temporary counters, short-lived state, and chat coordination.
- WebSockets for optional real-time group chat, private chat, notifications, and discussion updates.

Redis will not replace PostgreSQL and is not required for the page/component/API separation.

## Proposed Architecture

```text
                         PostgreSQL
                              ^
                              |
                           FastAPI
                              |
          +-------------------+-------------------+
          |                   |                   |
          v                   v                   v
   Jinja2 + HTMX frontend                 Flutter Web frontend
            |                                      |
            v                                      v
   HTML page/component routes              REST API /api/v1
            |                                      |
            +------------------+-------------------+
                               v
                         Shared services
                               |
                        Raw SQL + asyncpg
```

All three response layers use shared services and repositories. They must not duplicate database or business logic.

### Public HTML Routes

Location: `app/routers/web/pages/`

- Return complete HTML documents.
- Render templates extending `app/templates/base.html`.
- Own browser-addressable public routes and SEO metadata.
- Remain usable without JavaScript.

Example routes:

```text
GET /                         Home page
GET /roadmap                  Learning roadmap
GET /topics/{slug}            Public topic page
GET /categories/{slug}        Category page
GET /search                  Public search page
GET /discussions/{id}         Public discussion page
GET /sitemap.xml              Published-page sitemap
GET /robots.txt               Crawler rules
```

### HTMX Component Routes

Location: `app/routers/web/components/`

- Return small HTML fragments only.
- Render templates under `app/templates/components/`.
- Support targeted search, progress, bookmark, reply, and filter updates.
- Never return a complete document or duplicate the base layout.

Example routes:

```text
GET    /web-components/search-results
GET    /web-components/topic-list
POST   /web-components/topics/{topic_id}/progress
DELETE /web-components/topics/{topic_id}/progress
POST   /web-components/bookmarks/{topic_id}
DELETE /web-components/bookmarks/{topic_id}
POST   /web-components/discussions/{discussion_id}/replies
```

### REST API Routes

Location: `app/routers/api/v1/`

The REST API returns JSON and is the primary backend interface for Flutter Web.

```text
POST   /api/v1/auth/register
POST   /api/v1/auth/login
POST   /api/v1/auth/logout
POST   /api/v1/auth/refresh
GET    /api/v1/auth/me

GET    /api/v1/roadmap
GET    /api/v1/roadmap/{slug}
GET    /api/v1/topics
GET    /api/v1/topics/{slug}
GET    /api/v1/categories
GET    /api/v1/categories/{slug}/topics
GET    /api/v1/search
GET    /api/v1/topics/{topic_id}/related

GET    /api/v1/users/me
PATCH  /api/v1/users/me
GET    /api/v1/users/me/statistics

GET    /api/v1/progress
GET    /api/v1/progress/{topic_id}
POST   /api/v1/progress/{topic_id}/complete
DELETE /api/v1/progress/{topic_id}/complete

GET    /api/v1/bookmarks
POST   /api/v1/bookmarks
DELETE /api/v1/bookmarks/{bookmark_id}

GET    /api/v1/discussions
POST   /api/v1/discussions
GET    /api/v1/discussions/{discussion_id}
PATCH  /api/v1/discussions/{discussion_id}
DELETE /api/v1/discussions/{discussion_id}
POST   /api/v1/discussions/{discussion_id}/replies
PATCH  /api/v1/replies/{reply_id}
DELETE /api/v1/replies/{reply_id}
POST   /api/v1/reports
```

### Administrator API Routes

Administrator endpoints require authentication and an administrator role.

```text
GET    /api/v1/admin/users
GET    /api/v1/admin/users/{user_id}
PATCH  /api/v1/admin/users/{user_id}/role
PATCH  /api/v1/admin/users/{user_id}/status

GET    /api/v1/admin/topics
POST   /api/v1/admin/topics
PATCH  /api/v1/admin/topics/{topic_id}
DELETE /api/v1/admin/topics/{topic_id}
POST   /api/v1/admin/topics/{topic_id}/publish
POST   /api/v1/admin/topics/{topic_id}/unpublish

GET    /api/v1/admin/reports
PATCH  /api/v1/admin/reports/{report_id}
GET    /api/v1/admin/statistics
```

### WebSocket Routes

Location: `app/routers/websocket/`

```text
WS /ws/chat
    Authenticated general chat connection.

WS /ws/rooms/{room_id}
    Real-time messages for a community room.

WS /ws/discussions/{discussion_id}
    Live updates for a discussion thread.

WS /ws/notifications
    Real-time notifications for the current user.
```

Possible events include `message.created`, `message.updated`, `message.deleted`, `discussion.updated`, `notification.created`, `user.joined`, and `user.left`.

### Application URL Map

```text
/                              Jinja2 public homepage
/topics/{slug}                 Jinja2 public content page
/web-components/...            HTMX HTML fragments
/app                           Flutter Web application shell
/app/dashboard                 Flutter learner dashboard
/app/profile                   Flutter profile page
/app/admin                     Flutter administration interface
/api/v1/...                    FastAPI JSON API
/ws/...                        FastAPI WebSocket endpoints
```

## Data and Application Design

```text
Browser request
  -> FastAPI page or component router
  -> Shared service layer
  -> Raw SQL repository/query module
  -> PostgreSQL or Redis
  -> Jinja2 full page or HTMX fragment

Flutter Web request
  -> /api/v1/... REST endpoint
  -> Shared service layer
  -> PostgreSQL or Redis
  -> JSON response

Chat request
  -> /ws/... WebSocket endpoint
  -> Chat service and Redis coordination
  -> PostgreSQL persistence where required
```

Authentication and authorization are enforced in FastAPI. Public HTML routes expose only published public content. Private learner and administrator data is available only through authenticated routes and APIs.

## Security

- Hash passwords using a suitable password-hashing algorithm.
- Use secure, HTTP-only cookies or carefully managed access and refresh tokens.
- Enforce authentication and role-based authorization in backend dependencies.
- Validate input with FastAPI schemas and parameterized raw SQL.
- Apply CSRF protection for cookie-authenticated state-changing web and HTMX requests.
- Rate-limit authentication, search, reporting, and messaging operations with Redis where appropriate.
- Apply ownership checks before editing or deleting discussions, replies, bookmarks, or profile data.
- Treat `robots.txt` as crawler guidance, never as access control.
- Never expose private learner data in public Jinja2 pages, public APIs, or sitemap entries.

## SEO and Performance

- Render indexable public content as complete Jinja2 HTML responses.
- Use HTMX only as progressive enhancement; preserve direct URLs and full-page fallbacks.
- Generate unique titles, descriptions, headings, canonical links, Open Graph metadata, and structured data.
- Generate `/sitemap.xml` from published PostgreSQL content.
- Exclude `/app`, private pages, and authenticated resources from indexing where appropriate.
- Use clean slugs, semantic HTML, breadcrumbs, internal links, correct 404 responses, and controlled redirects.
- Cache safe read-heavy public data with Redis.
- Use database indexes, async I/O, compressed assets, pagination, and efficient templates.
- Evaluate representative public pages with Lighthouse, manual SEO checks, broken-link checks, and Search Console after deployment.

## Project Structure

```text
python-learning-hub/
├── alembic/                         migration files
├── app/
│   ├── core/                         configuration, database, security, cache
│   ├── routers/
│   │   ├── web/pages/                Jinja2 full-page routes
│   │   ├── web/components/           HTMX fragment routes
│   │   ├── api/v1/                   versioned JSON endpoints
│   │   └── websocket/                real-time endpoints
│   ├── services/                     shared business logic
│   ├── repositories/                 raw SQL query modules
│   ├── schemas/                      API request/response schemas
│   ├── templates/                    pages and HTMX components
│   └── static/                       CSS, JavaScript, images, robots.txt
├── frontend/
│   └── flutter_app/                  Flutter Web application
├── tests/                            web, HTMX, API, security, and WebSocket tests
├── pyproject.toml
├── README.md
└── uv.lock
```

## Project Scope

### Core MVP

- Python learning roadmap and public content pages.
- Search, categories, tags, slugs, breadcrumbs, and related content.
- Jinja2 server-rendered public website.
- HTMX progressive interactions.
- Authentication, progress, bookmarks, and discussions.
- Versioned REST API and initial Flutter Web application shell.
- PostgreSQL with raw SQL and `asyncpg`.
- Basic moderation and technical SEO.

### Secondary Features

- Quizzes and practice tasks.
- Learning statistics and advanced dashboards.
- Administrator content management.
- Redis caching and rate limiting.
- WebSocket chat and notifications.
- Expanded library/framework guides and content reporting.

### Out of Scope

- Online code execution infrastructure.
- Video-course hosting.
- AI tutoring.
- Payments and subscriptions.
- Native mobile applications.

## Evaluation

- Functional, integration, API, security, WebSocket, and content tests.
- At least 95% of planned tests passing.
- Lighthouse SEO and accessibility scores of at least 90 for representative public pages.
- Lighthouse performance score of at least 85 under representative deployment conditions.
- Usability testing based on learner task completion and satisfaction.
- Content quality review for accuracy, consistency, examples, links, and progression.

## Expected Outcome

Python Learning Hub will provide a focused learning and community platform with a strong separation of responsibilities. FastAPI will remain the single backend; Jinja2 will deliver crawlable public HTML; HTMX will add lightweight progressive interactions; the REST API will support Flutter Web and future clients; and WebSockets will provide optional real-time communication. PostgreSQL, raw SQL, `asyncpg`, Redis, and Alembic will preserve a maintainable and scalable backend foundation without introducing an ORM or requiring a JavaScript SPA for public content.
