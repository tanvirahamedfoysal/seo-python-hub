# Python Learning Hub - Complete Page and Screen Specification

## 1. Purpose of this document

This document describes what every user-facing page and application screen in Python Learning Hub should show. It is the page-level product specification for the website and the authenticated application.

The supporting project documents describe the product idea, API boundary, architecture, implementation phases, and deployment approach. They are treated here as product context. This document converts that context into a concrete page inventory and explains the content, responsibility, interactions, data, and states of each page.

The product has one domain and one FastAPI backend, but it deliberately has two presentation layers:

1. **Jinja2 + HTMX + Tailwind CSS** provides public, server-rendered, Google-crawlable pages. This layer contains the educational content and public discovery experience.
2. **Flutter Web** provides authenticated, personal, stateful, and workflow-heavy experiences under `/app`. This layer contains dashboards, personal data, progress management, messages, group messages, notifications, and administration.

The two layers are not two separate products. They use the same database, services, authorization rules, and repositories. They simply present different parts of the product in the form that best fits the user task.

## 2. Core page ownership rule

The most important rule for the implementation is:

> If the page is useful to a visitor who has not signed in, it should be a real Jinja2 page with useful HTML in the initial response. If the page is primarily about a signed-in person's data, state, communication, or private workflow, it should be a Flutter application screen under `/app`.

### 2.1 Jinja2 and HTMX responsibilities

Jinja2 owns:

- the home page and public landing content;
- the Python introduction, history, and use-case content;
- the learning roadmap and roadmap explanations;
- topic, tutorial, guide, category, and tag pages;
- public search pages and useful public search results;
- public discussion listings and public discussion pages;
- public explanatory pages such as About, Contact, Privacy, and Terms;
- public error pages, sitemap output, and crawler instructions;
- server-rendered metadata, headings, canonical URLs, breadcrumbs, internal links, and structured data.

HTMX is a progressive enhancement for the public website. It may replace a small part of a page, such as a search result list, a filter result, a bookmark control, a progress control, a reply form result, or a flash message. It must not be required to read the main content, open a public URL, or understand the page.

### 2.2 Flutter responsibilities

Flutter owns:

- sign-in and account recovery screens;
- the personal learner dashboard;
- personal progress, activity, statistics, and learning history;
- personal bookmarks and saved material;
- profile and account settings;
- personal notifications;
- one-to-one messages and group messages when chat is enabled;
- private conversation lists, unread counts, membership controls, and message history;
- richer authenticated discussion workflows when they need client-side state;
- administration, moderation, content management, and analytics screens.

Flutter is not the canonical renderer for public topic content. A learner may select a topic from Flutter and be taken to the public Jinja2 URL, for example `/topics/python-functions`. The topic remains a crawlable HTML page even when the learner arrived from the application.

### 2.3 Shared backend responsibility

Both presentation layers call the same FastAPI backend and shared services:

```text
Jinja2 page route       -> shared service -> repository -> PostgreSQL
HTMX component route    -> shared service -> repository -> PostgreSQL
Flutter REST request    -> shared service -> repository -> PostgreSQL
Flutter WebSocket       -> shared service -> Redis/PostgreSQL as appropriate
```

Route handlers and Flutter widgets must not contain duplicate business rules. SQL belongs in repositories. Authentication and authorization belong in FastAPI dependencies, services, or explicit policy functions.

## 3. Global page structure

Every page uses the shared site language appropriate to its layer.

### 3.1 Public website shell

The Jinja2 shell should contain:

- a skip-to-content link;
- a header with the Python Learning Hub identity;
- a primary navigation link to Home;
- a Roadmap link;
- links to Topics, Tutorials, Guides, and Discussions;
- a prominent search field;
- a sign-in link for visitors;
- a Dashboard link for authenticated learners;
- a responsive mobile menu that remains usable with keyboard navigation;
- a main content area with one clear H1;
- a footer with About, Contact, Privacy, Terms, sitemap, and important content links;
- a consistent flash-message area for non-sensitive success or error feedback.

The header should not expose private personal information in the initial public HTML. If a signed-in user is recognized, the header may show a small account or dashboard link, but the detailed personal dashboard remains in Flutter.

### 3.2 Application shell

The Flutter shell under `/app` should contain:

- an authenticated navigation rail or responsive drawer;
- Dashboard;
- Progress;
- Bookmarks;
- Activity or Statistics;
- Notifications;
- Messages, when chat is enabled;
- Discussions or Community participation, when the richer workflow is enabled;
- Profile and settings;
- a sign-out action;
- an administrator section only for users with the administrator role.

The Flutter shell is a private application surface. It may use API data, charts, local state, optimistic updates, WebSockets, and multi-step forms. It should link back to public Jinja2 pages whenever a learner needs to read or share canonical educational content.

### 3.3 Shared visual and accessibility rules

All pages and screens should:

- use a consistent typography scale and spacing system;
- preserve visible keyboard focus states;
- use semantic headings in order;
- label every form control;
- provide useful empty, loading, error, and success states;
- use readable contrast and responsive layouts;
- avoid relying on color alone to communicate status;
- provide accessible names for icons and buttons;
- show a clear destructive-action confirmation where needed;
- preserve the current location or context after a successful action;
- show a useful 404 instead of silently redirecting to an unrelated page.

## 4. Page inventory at a glance

| ID | Route or screen | Layer | Audience | Public/indexable | Main purpose |
|---|---|---|---|---|---|
| P01 | `/` | Jinja2 + HTMX | Everyone | Yes | Introduce the platform and direct learners into the library or roadmap. |
| P02 | `/topics/python` or canonical Python overview slug | Jinja2 + HTMX | Everyone | Yes | Explain Python, its history, strengths, and use cases. |
| P03 | `/roadmap` | Jinja2 + HTMX | Everyone | Yes | Show the complete learning path from beginner to advanced. |
| P04 | `/topics` | Jinja2 + HTMX | Everyone | Yes | List and filter learning topics. |
| P05 | `/topics/{slug}` | Jinja2 + HTMX | Everyone | Yes | Teach one Python topic in depth. |
| P06 | `/categories` | Jinja2 + HTMX | Everyone | Yes | Show the main learning categories. |
| P07 | `/categories/{slug}` | Jinja2 + HTMX | Everyone | Yes | Show a category landing page and its content. |
| P08 | `/tags/{slug}` | Jinja2 + HTMX | Everyone | Usually | Show content grouped by a tag. |
| P09 | `/tutorials` | Jinja2 + HTMX | Everyone | Yes | List practical, long-form tutorials. |
| P10 | `/tutorials/{slug}` | Jinja2 + HTMX | Everyone | Yes | Present one practical tutorial. |
| P11 | `/guides` | Jinja2 + HTMX | Everyone | Yes | List library, framework, workflow, and reference guides. |
| P12 | `/guides/{slug}` | Jinja2 + HTMX | Everyone | Yes | Present one library, framework, or practical guide. |
| P13 | `/search` | Jinja2 + HTMX | Everyone | Controlled | Search public content and show useful results. |
| P14 | `/discussions` | Jinja2 + HTMX | Everyone | Yes | Browse public questions and discussions. |
| P15 | `/discussions/{discussion_id}` | Jinja2 + HTMX | Everyone | Yes | Read a public discussion and its replies. |
| P16 | `/about` | Jinja2 | Everyone | Yes | Explain the product, mission, and learning approach. |
| P17 | `/contact` | Jinja2 + HTMX | Everyone | Yes | Provide a contact form and contact information. |
| P18 | `/privacy` | Jinja2 | Everyone | Yes | Explain privacy and personal-data handling. |
| P19 | `/terms` | Jinja2 | Everyone | Yes | Explain acceptable use and service terms. |
| P20 | 404 and error pages | Jinja2 or Flutter state | Everyone | No | Help users recover from missing or failed requests. |
| A01 | `/app/login` | Flutter | Visitor | No | Sign in to the personal application. |
| A02 | `/app/register` | Flutter | Visitor | No | Create a learner account. |
| A03 | `/app/forgot-password` and reset flow | Flutter | Visitor | No | Recover access to an account. |
| A04 | `/app/verify-email` | Flutter | User | No | Verify an email address. |
| A05 | `/app/dashboard` | Flutter | User | No | Show a personalized learning overview. |
| A06 | `/app/progress` | Flutter | User | No | Show detailed personal progress. |
| A07 | `/app/bookmarks` | Flutter | User | No | Manage saved topics, tutorials, guides, and examples. |
| A08 | `/app/activity` or statistics | Flutter | User | No | Show personal learning history and statistics. |
| A09 | `/app/profile` and settings | Flutter | User | No | Manage personal account data and preferences. |
| A10 | `/app/notifications` | Flutter | User | No | Show personal notifications and unread state. |
| A11 | `/app/messages` | Flutter | User | No | List personal and group conversations. |
| A12 | `/app/messages/{conversation_id}` | Flutter | User | No | Show one-to-one or group messages. |
| A13 | `/app/discussions` | Flutter | User | No | Provide richer authenticated discussion participation. |
| A14 | `/app/admin` | Flutter | Admin | No | Summarize platform administration work. |
| A15 | `/app/admin/content` | Flutter | Admin | No | Manage topics, tutorials, guides, categories, tags, and SEO. |
| A16 | `/app/admin/roadmap` | Flutter | Admin | No | Manage roadmap nodes and relationships. |
| A17 | `/app/admin/users` | Flutter | Admin | No | Manage users, roles, and account status. |
| A18 | `/app/admin/moderation` | Flutter | Admin/moderator | No | Review reports, discussions, replies, and moderation actions. |
| A19 | `/app/admin/analytics` | Flutter | Admin | No | Show platform and content statistics. |

The IDs are documentation identifiers, not required URL names. The final URL slugs should remain stable after publication.

## 5. Public pages: Jinja2 + HTMX

### P01 - Home page

**Route:** `GET /`

**Renderer:** Jinja2 full page. HTMX may enhance selected lists or filters.

**Audience:** Visitors, learners, search engines, and returning users.

**Purpose:** Explain what Python Learning Hub is within a few seconds and give the visitor a clear next step. The home page is the main entry point from search, direct visits, shared links, and the project presentation.

#### Content shown

1. **Hero section**
   - A short value proposition such as a structured way to learn Python from fundamentals to practical development.
   - A supporting sentence explaining that the platform combines guided learning content with optional community participation.
   - A primary call to action to start the roadmap.
   - A secondary call to action to browse topics or search.
   - No requirement to register before reading.

2. **What the platform covers**
   - Python fundamentals;
   - data structures and problem solving;
   - object-oriented programming;
   - files, modules, exceptions, and testing;
   - asynchronous programming and web development;
   - data and scientific libraries;
   - practical projects and learning guides.

3. **Roadmap preview**
   - A short visual or ordered summary of Beginner, Core Python, Applied Python, and Advanced Python stages.
   - One or two representative topics in each stage.
   - A link to the complete roadmap.

4. **Featured or recommended content**
   - A small set of published beginner topics;
   - one or more tutorials;
   - one or more library or framework guides;
   - links to canonical content pages.

5. **How learning works**
   - Read a topic;
   - follow prerequisites and recommended next topics;
   - complete the material;
   - optionally create an account to track progress and bookmarks;
   - return to the personal dashboard when signed in.

6. **Community preview**
   - A short explanation of public discussions and topic-specific questions.
   - A small list of recent or useful public discussions, only if there is enough quality content.
   - A link to public discussions.

7. **Account call to action**
   - Explain the personal benefits of registration: progress, bookmarks, statistics, and optional messages or group participation.
   - Do not block public reading behind registration.

8. **Footer navigation**
   - About, Contact, Privacy, Terms, Roadmap, Topics, Tutorials, Guides, Discussions, and sitemap.

#### Interaction and states

- The page must be useful with JavaScript disabled.
- Featured lists should have a server-rendered fallback.
- If there is no published featured content, show a deliberate empty state rather than broken cards.
- If the visitor is already authenticated, show a link to the Flutter dashboard without turning the home page into a personal dashboard.

#### SEO requirements

- Unique title and meta description describing the Python learning platform.
- One H1 describing the learning purpose.
- Introductory copy must be present in the initial HTML.
- Internal links to the roadmap, topic listing, tutorials, guides, and selected high-value content.
- Organization or WebSite structured data only when the fields are accurate.

### P02 - Python overview, history, and use cases page

**Route:** Use one canonical topic slug such as `GET /topics/python` or `GET /topics/python-overview`. The chosen slug must be stable after publication.

**Renderer:** Jinja2 full page with optional HTMX controls.

**Audience:** Beginners, general search visitors, and anyone deciding whether to learn Python.

**Purpose:** Cover the introductory material represented by the original Page 1 and Page 2 outline. The original outline repeats history and use cases; this specification consolidates that material into one canonical, detailed page so the same information is not published twice under competing URLs.

#### Content shown

1. **Introduction to Python**
   - What Python is;
   - why it is used for learning, automation, web development, data work, scripting, and tooling;
   - the difference between a programming language and a framework or library;
   - the kind of learner who will benefit from the platform.

2. **Short history of Python**
   - Its origins as a readable, general-purpose language;
   - the importance of readability and a large standard library;
   - the evolution from early Python releases to the modern Python 3 ecosystem;
   - a careful note that exact historical dates and version details should be verified by the content administrator before publication.

3. **Why Python is popular**
   - readable syntax;
   - large community and documentation ecosystem;
   - broad third-party library support;
   - usefulness across education, automation, backend systems, data work, and research;
   - suitability for prototypes as well as production systems when engineered appropriately.

4. **Python use cases**
   - web development with frameworks such as FastAPI and Django;
   - data analysis with Pandas or Polars;
   - scientific and numerical work with NumPy and related tools;
   - visualization with Matplotlib;
   - machine learning with appropriate libraries;
   - automation, scripting, testing, and DevOps tooling;
   - APIs, integrations, and background jobs.

5. **What the learner will study next**
   - variables and values;
   - control flow;
   - functions;
   - collections;
   - modules and packages;
   - exceptions and files;
   - object-oriented programming;
   - testing and practical projects.

6. **Navigation block**
   - Start the beginner roadmap;
   - browse all topics;
   - read a first tutorial;
   - open related guides;
   - view prerequisite and next-topic links.

#### Interaction and states

- A visitor can read the entire page without an account.
- The topic may show a sign-in prompt beside personal actions, but the explanatory content remains public.
- Code examples, if included, should show the code, explanation, expected output, and a copy action that degrades gracefully.

#### SEO requirements

- This is a canonical educational page, not a dashboard screen.
- Use a descriptive title and a clear H1 such as “What Is Python? History, Uses, and a Beginner’s Starting Point”.
- Link to the roadmap, beginner topics, and use-case-specific guides.
- Use Article or TechArticle structured data only if the metadata matches the actual content.

### P03 - Complete learning roadmap

**Route:** `GET /roadmap`

**Renderer:** Jinja2 full page. HTMX may enhance filters or expand/collapse controls.

**Audience:** All visitors and authenticated learners.

**Purpose:** Show the long, detailed learning strategy requested in the original Page 3 outline. The roadmap is a public learning map first and a personal progress surface second.

#### Content shown

1. **Roadmap introduction**
   - What the roadmap means;
   - how prerequisites work;
   - why the order is recommended rather than mandatory;
   - how learners can return to earlier topics when they need revision.

2. **Stage 0: orientation and setup**
   - What programming is;
   - installing Python;
   - choosing an editor or development environment;
   - running a first Python program;
   - using the interpreter and basic command-line concepts;
   - understanding Python versions and virtual environments at a beginner-friendly level.

3. **Stage 1: Python fundamentals**
   - syntax and indentation;
   - variables and naming;
   - numbers, strings, booleans, and `None`;
   - operators and expressions;
   - input and output;
   - conditional statements;
   - loops;
   - functions and return values;
   - basic debugging.

4. **Stage 2: core data structures**
   - lists, tuples, sets, and dictionaries;
   - indexing, slicing, and iteration;
   - comprehensions;
   - mutability and copying;
   - choosing an appropriate data structure;
   - common algorithmic patterns.

5. **Stage 3: reusable Python programs**
   - modules and imports;
   - packages and virtual environments;
   - exceptions and error handling;
   - files and paths;
   - JSON and common data formats;
   - standard library modules;
   - logging and configuration basics.

6. **Stage 4: object-oriented and advanced language features**
   - classes and objects;
   - constructors and methods;
   - inheritance and composition;
   - iterators and generators;
   - decorators;
   - context managers;
   - type hints;
   - dataclasses and protocols where appropriate.

7. **Stage 5: quality and professional workflow**
   - testing with unit and integration patterns;
   - testable design;
   - formatting and linting;
   - packaging;
   - dependency management;
   - documentation;
   - Git and collaborative workflow;
   - debugging and profiling.

8. **Stage 6: practical development paths**
   - web development;
   - API development;
   - databases and SQL;
   - automation;
   - data analysis;
   - visualization;
   - machine learning foundations;
   - asynchronous programming;
   - deployment and operations.

9. **Project checkpoints**
   - small command-line project;
   - file or data-processing project;
   - tested package or reusable tool;
   - API or web application project;
   - final portfolio project.

10. **Roadmap node detail**
    - topic title;
    - short description;
    - difficulty;
    - estimated effort if maintained by the administrator;
    - prerequisites;
    - related topics;
    - link to the public topic page;
    - optional quiz or practice task;
    - public completion explanation.

#### Personal state behavior

- For a visitor, show the roadmap as an ordered public learning path.
- For an authenticated user, the page may show a small progress indicator or completion state through a lightweight server-rendered enhancement.
- The complete personal progress dashboard belongs in Flutter at `/app/progress`.
- The public roadmap must never require the learner’s private progress data to render.

#### SEO requirements

- The roadmap itself must contain explanatory text, not only a visual graph.
- Every node must link to a stable public topic URL.
- Use breadcrumbs and internal links.
- If structured data is used, it must accurately describe the page and not invent course or certificate claims.

### P04 - Topic listing page

**Route:** `GET /topics`

**Renderer:** Jinja2 full page with HTMX filtering and pagination where useful.

**Audience:** Visitors and learners who want to browse the learning library.

**Purpose:** Make the full topic library understandable and navigable without forcing the visitor to know the exact search term.

#### Content shown

- Page title and short explanation of the topic library;
- search or filter controls for category, difficulty, learning stage, and tag;
- a list or grid of published topics;
- topic title, summary, difficulty, category, and estimated reading or study effort where available;
- a small prerequisite or “next topic” hint;
- pagination or progressive loading with a full-page fallback;
- links to the roadmap and category pages;
- a deliberate no-results state explaining how to broaden the filter.

#### Interaction

- Filter controls may use HTMX to replace only the topic-list region.
- The filter state should remain shareable through query parameters.
- Every topic card must link to `/topics/{slug}` as a normal anchor.
- Unpublished, draft, archived, or private topics must never appear to visitors.

#### SEO requirements

- The base topic listing is indexable if it contains useful content.
- Thin filtered combinations may be canonicalized to the base listing or marked according to the final SEO policy.
- Do not create thousands of low-value indexable filter URLs.

### P05 - Topic detail page

**Route:** `GET /topics/{slug}`

**Renderer:** Jinja2 full page. HTMX may enhance progress, bookmark, related content, and discussion controls.

**Audience:** Everyone; authenticated learners receive optional personal controls.

**Purpose:** Provide the main canonical learning experience for one concept. This is one of the most important SEO pages in the product.

#### Content shown

1. **Breadcrumbs**
   - Home;
   - category or learning stage;
   - current topic.

2. **Topic header**
   - H1 topic title;
   - one-sentence summary;
   - difficulty;
   - category, tags, and learning stage;
   - last reviewed or updated date only if the project maintains reliable editorial dates;
   - estimated effort if available.

3. **Learning objectives**
   - What the learner should understand after reading;
   - concrete skills or outcomes;
   - prerequisites.

4. **Main lesson content**
   - clear sections and subsections;
   - explanations in beginner-friendly language;
   - terminology definitions;
   - examples and counterexamples;
   - warnings about common mistakes;
   - links to related concepts;
   - code examples with syntax highlighting, explanation, input, expected output, and copy action where relevant.

5. **Practice section**
   - short questions or an exercise prompt;
   - output-prediction or conceptual examples where appropriate;
   - link to a quiz or task if that feature exists;
   - no unsafe or unreviewed code execution promise.

6. **Navigation section**
   - previous topic;
   - prerequisite topics;
   - related topics;
   - recommended next topic;
   - links to relevant tutorials and guides.

7. **Learner controls**
   - Mark complete;
   - bookmark;
   - sign-in prompt when the visitor is not authenticated;
   - lightweight HTMX update for a simple action if the product chooses to support it;
   - link to the Flutter dashboard for detailed progress.

8. **Discussion entry point**
   - number or preview of public discussions about the topic;
   - link to the public discussion page or to start a discussion after sign-in.

9. **Related content and footer**
   - related topics;
   - useful tutorials;
   - library or framework guides;
   - a feedback or report-content route if implemented.

#### Loading, error, and content states

- A missing slug returns a real 404 page.
- An unpublished topic is not exposed to anonymous visitors.
- A topic with no related content should omit the empty section or explain that more material will be added.
- A code example must remain readable on small screens.

#### SEO requirements

- Unique title, meta description, canonical URL, Open Graph data, and one H1.
- Initial response must include the title, summary, headings, and lesson content.
- Use Article or TechArticle structured data only when accurate.
- Provide strong internal linking to prerequisites, next topics, categories, tutorials, guides, and discussions.
- Do not require Flutter, a REST request, or client-side JavaScript to read the lesson.

### P06 - Category listing page

**Route:** `GET /categories`

**Renderer:** Jinja2.

**Audience:** Everyone.

**Purpose:** Explain the major content groupings and help visitors choose a learning direction.

#### Content shown

- Page title and explanation of categories;
- category cards with name, summary, content count, and learning focus;
- representative topics for each category;
- category types such as Core Python, Data, Web Development, Testing, Automation, and Libraries;
- links to the roadmap and topic listing;
- a helpful empty state if a category exists but has no published content.

Categories should describe a meaningful subject area, not duplicate every tag. Only categories with useful content should be promoted to search engines.

### P07 - Category detail page

**Route:** `GET /categories/{slug}`

**Renderer:** Jinja2 with optional HTMX pagination or filtering.

**Audience:** Everyone.

**Purpose:** Serve as a useful landing page for one area of Python learning.

#### Content shown

- Breadcrumbs and H1;
- category description and intended learner;
- what the learner should know before entering the category;
- featured topics;
- complete published topic list;
- tutorials and guides in the category;
- related categories and roadmap stages;
- tags used within the category;
- a link back to the roadmap.

The category page must include enough descriptive text to be useful by itself. It must not be only a list of links.

### P08 - Tag-based topic listing

**Route:** `GET /tags/{slug}`

**Renderer:** Jinja2.

**Audience:** Everyone.

**Purpose:** Group related content by a narrower label, such as `beginner`, `asyncio`, `fastapi`, `testing`, or `data-analysis`.

#### Content shown

- tag name and explanation;
- topics using the tag;
- related tutorials and guides;
- category and difficulty information;
- links to broader category pages;
- no-results or low-content handling.

Tags should be indexable only when they have a meaningful description and enough useful published content. Thin tag pages should be canonicalized, merged, or excluded from indexing according to the content policy.

### P09 - Tutorial listing page

**Route:** `GET /tutorials`

**Renderer:** Jinja2 with optional HTMX filters.

**Audience:** Everyone.

**Purpose:** Help visitors find longer, practical learning journeys rather than isolated reference topics.

#### Content shown

- explanation of what makes a tutorial different from a short topic;
- tutorial cards with title, summary, difficulty, expected outcome, and estimated effort;
- filters for subject, library/framework, difficulty, and level;
- featured beginner and project-based tutorials;
- links to prerequisite topics;
- pagination and no-results states.

### P10 - Tutorial detail page

**Route:** `GET /tutorials/{slug}`

**Renderer:** Jinja2.

**Audience:** Everyone.

**Purpose:** Guide the learner through a practical workflow from setup to finished result.

#### Content shown

1. Tutorial title, summary, outcome, difficulty, and estimated effort.
2. Prerequisites and required tools.
3. What will be built or understood.
4. Ordered sections with a visible table of contents.
5. Complete explanations, code examples, commands, expected output, and troubleshooting notes.
6. Checkpoints after important steps.
7. Common mistakes and debugging guidance.
8. Links to underlying topic pages and library/framework guides.
9. Completion or bookmark controls for signed-in learners.
10. Next projects and related tutorials.

The tutorial must remain readable as a complete HTML document. If a code example is long, it may have a copy control or collapsible enhancement, but the code and explanation must be present in the source response.

### P11 - Guide listing page

**Route:** `GET /guides`

**Renderer:** Jinja2.

**Audience:** Everyone.

**Purpose:** List focused reference and ecosystem material, including library and framework introductions, comparisons, installation guidance, and common patterns.

#### Content shown

- guide categories such as FastAPI, Django, NumPy, Pandas, Polars, Matplotlib, Scikit-learn, SQLAlchemy, testing, packaging, and deployment;
- guide cards with the problem they solve;
- difficulty and prerequisite information;
- related topics and tutorials;
- search and filter controls;
- a useful no-results page.

### P12 - Guide detail page

**Route:** `GET /guides/{slug}`

**Renderer:** Jinja2.

**Audience:** Everyone.

**Purpose:** Explain a Python library, framework, workflow, comparison, or practical reference topic.

#### Content shown

- what the library, framework, or workflow is;
- when to use it and when not to use it;
- installation and setup;
- a minimal first example;
- common patterns and conventions;
- version assumptions where maintained;
- typical errors and troubleshooting;
- comparison with related tools when appropriate;
- related Python topics;
- practical tutorials;
- bookmark and progress controls for authenticated learners;
- a clear note when a guide is introductory rather than exhaustive.

The guide must not claim live support for a package version that has not been reviewed. Package names, versions, links, and code examples should be editorially maintained.

### P13 - Search page and result states

**Route:** `GET /search`

**Renderer:** Jinja2 full page. HTMX may update the results region.

**Audience:** Everyone.

**Purpose:** Help visitors locate topics, tutorials, guides, examples, categories, tags, and useful public discussions.

#### Content shown

- a prominent search input;
- optional type filters for topics, tutorials, guides, discussions, and all content;
- the submitted query;
- result count and pagination;
- result title, type, summary, category, and matched context;
- related suggestions when a query is broad;
- popular or recommended searches when no query has been submitted;
- recent searches only inside the authenticated Flutter application, not as public personal data;
- a no-results state with spelling or broader-topic suggestions.

#### Interaction

- The initial search page must work as a normal GET request.
- HTMX may replace only the results list while preserving the search form and URL state.
- Autocomplete may use `/api/v1/search/suggestions` or a dedicated fragment, but the suggestion list must not be the only way to submit a search.
- Search must never expose private messages, private profiles, private notes, or unpublished content.

#### SEO requirements

- The base `/search` page can be crawlable if it has useful explanatory content.
- Individual arbitrary query result pages should normally be controlled to avoid producing a large set of thin duplicate pages.
- Search results must use correct empty and error states.

### P14 - Public discussion listing

**Route:** `GET /discussions`

**Renderer:** Jinja2 with optional HTMX filters or pagination.

**Audience:** Everyone for reading; authenticated users for participation.

**Purpose:** Provide a public, searchable community index around learning topics without requiring the visitor to enter the private application.

#### Content shown

- page explanation and community guidelines link;
- recent, active, unanswered, or popular discussion filters;
- discussion title;
- short excerpt;
- related topic or category;
- author display name if public and permitted;
- reply count, like count, and last activity date;
- moderation or closed status when useful;
- link to start a discussion after sign-in;
- pagination and no-results state.

#### Privacy and moderation

- Only public and published discussions appear.
- Private messages and private groups never appear here.
- Reported or hidden content follows moderation policy.
- User-generated text is escaped and sanitized according to a deliberate policy.

### P15 - Public discussion detail

**Route:** `GET /discussions/{discussion_id}`

**Renderer:** Jinja2 full page. HTMX may add a reply, like, report, or moderation result.

**Audience:** Everyone for reading; authenticated users for actions.

**Purpose:** Make a useful public question and its answers accessible from search, topic pages, and direct links.

#### Content shown

1. Breadcrumbs and related topic.
2. Discussion title.
3. Original question or post.
4. Author and publication date, subject to privacy settings.
5. Replies in chronological or voted order according to the product decision.
6. Accepted or helpful answer indicator if that feature is implemented.
7. Like count and reply count.
8. Report control for signed-in users.
9. Sign-in prompt for visitors who want to reply.
10. Related discussions and the linked learning topic.
11. Reply form for authenticated users, possibly returned or updated through HTMX.

#### Interaction boundary

Simple public-page actions such as posting a reply, liking a discussion, reporting content, or marking a notification may use authenticated HTMX requests when that gives a good progressive experience. The personal discussion management view, notification history, and message-style communication remain Flutter responsibilities.

### P16 - About page

**Route:** `GET /about`

**Renderer:** Jinja2.

**Audience:** Everyone.

**Purpose:** Explain the mission and the relationship between the public learning site and the authenticated application.

#### Content shown

- why Python Learning Hub exists;
- the beginner-to-advanced learning approach;
- the difference between topics, tutorials, guides, and discussions;
- the public SEO-first philosophy;
- the role of accounts, progress, bookmarks, and community features;
- a concise explanation of the two presentation layers;
- a link to the roadmap and contact page.

This page should be plain, trustworthy, and human-readable. It should not become a technical architecture document for ordinary visitors.

### P17 - Contact page

**Route:** `GET /contact`

**Renderer:** Jinja2 with HTMX-enhanced form submission if appropriate.

**Audience:** Everyone.

**Purpose:** Give visitors a clear way to send a general question, content correction, technical issue, or safety/moderation report.

#### Content shown

- contact purpose and expected response guidance;
- name field where needed;
- email field;
- subject or request type;
- message field;
- optional related URL field;
- spam or abuse protection;
- privacy notice explaining how the message is handled;
- success, validation, rate-limit, and failure states.

The contact page must not expose private administration data. A report about a discussion should link to the relevant public discussion without echoing sensitive report details into the page.

### P18 - Privacy policy

**Route:** `GET /privacy`

**Renderer:** Jinja2.

**Audience:** Everyone.

**Purpose:** Explain what data the platform collects, why it is needed, how long it is retained, and how users can exercise their rights.

#### Content shown

- account information;
- learning progress and bookmarks;
- activity, notifications, and optional message data;
- public profile and discussion data;
- cookies and session handling;
- service providers or infrastructure where relevant;
- retention and deletion;
- account deletion process;
- contact route for privacy requests;
- policy version or effective date.

The content must be reviewed for the actual deployment, jurisdiction, and data practices before production. This page is not a substitute for legal review.

### P19 - Terms of service

**Route:** `GET /terms`

**Renderer:** Jinja2.

**Audience:** Everyone.

**Purpose:** Explain acceptable use, learner responsibilities, content ownership, moderation, account suspension, and limitations of educational information.

#### Content shown

- permitted educational and community use;
- prohibited abuse, spam, harassment, scraping of private data, and malicious activity;
- user responsibility for account credentials;
- rules for user-authored discussions and messages;
- moderation and reporting process;
- content availability and correction policy;
- service limitations and external links;
- account termination and appeal route;
- effective date and contact link.

### P20 - 404, 500, and other error pages

**Routes:** public not-found and server-error responses; Flutter has equivalent in-app error states.

**Renderer:** Jinja2 for public requests; Flutter state for failed application requests.

**Content shown for a public 404**

- clear “Page not found” heading;
- short explanation;
- search field;
- links to Home, Roadmap, Topics, Tutorials, Guides, and Discussions;
- optional suggestions based on the requested path if safe;
- correct HTTP 404 status.

**Content shown for a public 500 or temporary failure**

- clear explanation that the request could not be completed;
- a safe retry action;
- links to Home and Search;
- no stack traces, database details, tokens, or private data;
- correct HTTP 500 or appropriate temporary status.

**Flutter error states**

- loading state while an API request is in progress;
- empty state when the user has no data yet;
- retry action for temporary failures;
- sign-in/session-expired state;
- permission-denied state;
- validation feedback;
- offline or WebSocket-disconnected state for messages;
- a route-safe fallback that does not leak API errors.

## 6. Technical public endpoints that support pages

These endpoints are important to the public experience but are not ordinary content pages.

### Sitemap

**Route:** `GET /sitemap.xml`

The sitemap should contain only canonical, published, public URLs such as the home page, roadmap, published topic pages, categories, selected tags, tutorials, guides, and useful public discussions. It must not contain `/app`, private profiles, bookmarks, messages, private discussions, admin screens, or arbitrary private search queries.

### Robots instructions

**Route:** `GET /robots.txt`

The file should give crawler guidance and point to the sitemap. It is not access control. Private data remains protected by authentication and authorization regardless of crawler instructions.

### OpenAPI and health endpoints

`/docs`, `/redoc`, `/openapi.json`, `/health`, `/health/database`, `/ready`, and `/version` support developers and operations. They are not part of the main public learning navigation. Their production exposure and indexing policy should be decided separately from content SEO.

## 7. Flutter application screens

All screens in this section are private application screens under `/app`. They are not intended for Google indexing. Flutter is used here because these experiences depend on a signed-in user's data, state, multi-step interactions, or real-time updates.

### A01 - Sign-in screen

**Route:** `/app/login`

**Audience:** Existing users.

**Content shown**

- Python Learning Hub identity;
- email or username field according to the account design;
- password field;
- show/hide password control;
- sign-in button;
- link to password recovery;
- link to registration;
- link back to the public home page;
- validation and authentication error messages;
- loading and disabled-submit state.

The screen must not reveal whether an email address is registered through overly specific error messages. After successful sign-in, return the user to the originally requested private route when safe; otherwise open the dashboard.

### A02 - Registration screen

**Route:** `/app/register`

**Audience:** New learners.

**Content shown**

- display name;
- email;
- password and confirmation;
- password requirements;
- agreement to terms and privacy policy;
- account creation button;
- link to sign-in;
- link to public learning content;
- validation, duplicate-account, rate-limit, and service-error states.

After registration, the user should see the email-verification state if verification is enabled. Public content remains accessible before registration and before verification.

### A03 - Forgot-password and reset flow

**Routes:** `/app/forgot-password` and `/app/reset-password`.

**Content shown**

- email field for requesting a reset;
- neutral success message that does not reveal account existence;
- reset-token or one-time-link state;
- new password and confirmation;
- password requirements;
- expired or invalid-token state;
- link back to sign-in.

### A04 - Email-verification screen

**Route:** `/app/verify-email`

**Content shown**

- current verification state;
- resend-verification action;
- neutral success, rate-limit, expired-token, and error messages;
- explanation of what account features require verification;
- link to dashboard or public content.

### A05 - Personal learner dashboard

**Route:** `/app/dashboard`

**Audience:** Authenticated user.

**Purpose:** Give the learner an immediate answer to “Where am I, what should I do next, and what changed since I last visited?”

#### Content shown

1. **Welcome area**
   - learner display name;
   - short encouragement;
   - account or profile shortcut;
   - no sensitive information in a shareable URL.

2. **Continue learning card**
   - last started or next recommended topic;
   - topic title and short summary;
   - progress percentage or completion state;
   - Continue button that opens the public topic URL;
   - fallback to the first roadmap node for a new learner.

3. **Progress summary**
   - topics completed;
   - topics in progress;
   - roadmap stage progress;
   - optional streak or learning-time metric if reliably calculated;
   - link to detailed Progress screen.

4. **Bookmarks preview**
   - recently saved items;
   - item type and title;
   - link to the public content page;
   - link to all bookmarks.

5. **Recent activity**
   - recently completed topic;
   - bookmark added or removed;
   - discussion participation;
   - quiz attempt if enabled;
   - link to full activity.

6. **Notifications preview**
   - unread count;
   - a few recent notifications;
   - link to notifications.

7. **Messages preview**
   - unread personal or group messages when chat is enabled;
   - last conversation and timestamp;
   - link to messages.

8. **Recommended next steps**
   - next roadmap topic;
   - incomplete prerequisite;
   - suggested tutorial;
   - relevant public discussion.

#### States

- New account with no activity;
- active learner with in-progress topics;
- learner who has completed the current roadmap;
- partial API failure where one card can retry without blanking the whole dashboard;
- expired session;
- no-chat state when messaging is not enabled.

### A06 - Personal progress screen

**Route:** `/app/progress`

**Audience:** Authenticated user.

**Purpose:** Show personal learning state in detail. This is not the public roadmap; it is the learner’s private interpretation of the roadmap.

#### Content shown

- overall completion summary;
- progress by roadmap stage;
- expandable roadmap nodes;
- completed, in-progress, locked-by-prerequisite, and not-started states;
- last activity date;
- next recommended topic;
- filters for stage, category, difficulty, and status;
- link from every node to its public Jinja2 topic page;
- progress history or streak summary when available;
- clear explanation of how completion is calculated.

#### Interactions

- expand or collapse roadmap branches;
- filter without losing the selected state;
- open a topic in the public content page;
- update progress through the API;
- refresh or retry failed data;
- never allow the UI to claim completion when the API has not confirmed the mutation.

### A07 - Personal bookmarks screen

**Route:** `/app/bookmarks`

**Audience:** Authenticated user.

**Purpose:** Manage saved learning material.

#### Content shown

- saved topics, tutorials, guides, code examples, and references;
- title, type, summary, category, and saved date;
- filters by type, category, and completion state;
- search within bookmarks if useful;
- remove bookmark action;
- link to the public canonical URL;
- empty state explaining how to bookmark a page;
- pagination or lazy loading for large collections.

Bookmarks are personal data. They should not be shown in public page HTML, public APIs, sitemap entries, or public profile pages unless the user explicitly creates a separate public collection feature.

### A08 - Personal activity and statistics screen

**Route:** `/app/activity` or `/app/statistics`.

**Audience:** Authenticated user.

**Purpose:** Help the learner understand their own learning behavior without exposing that data publicly.

#### Content shown

- completed topics over time;
- activity history;
- current and longest learning streak if supported;
- progress by category and roadmap stage;
- quiz attempts and scores if quizzes are enabled;
- bookmarks added over time if useful;
- recent public discussion participation;
- filters by date range and content type;
- explanation of metric definitions;
- empty state for a new account.

Charts must have text summaries or accessible tables so the screen remains understandable with assistive technology.

### A09 - Profile and account settings

**Routes:** `/app/profile`, `/app/profile/edit`, and settings subsections as needed.

**Audience:** Authenticated user.

**Purpose:** Let users view and manage their own account and preferences.

#### Content shown

- display name;
- email and verification status;
- avatar or profile image;
- short public bio if the public profile feature is enabled;
- account creation or status information where appropriate;
- password-change form;
- notification preferences;
- message or privacy preferences;
- theme or appearance preferences if implemented;
- sign-out action;
- account deletion action with clear consequences.

#### Privacy rules

- The screen may show the user’s private data because it is authenticated.
- A public profile page is a separate decision and must reveal only explicitly public fields.
- Never place tokens, password values, private messages, or security details in client-visible logs or URLs.

### A10 - Personal notifications screen

**Route:** `/app/notifications`

**Audience:** Authenticated user.

**Purpose:** Give the user one place to see personal events and manage read state.

#### Content shown

- unread and read notifications;
- notification type, such as reply, mention, discussion update, message, moderation result, or account event;
- timestamp;
- concise message;
- link to the relevant public topic, public discussion, private conversation, or application screen;
- mark-as-read and mark-all-as-read actions;
- filtering by unread or type;
- empty state;
- real-time update indicator if WebSockets are enabled.

Notifications must never reveal the content of a private conversation to an unauthorized user. The API must re-check authorization when a notification link is opened.

### A11 - Conversation list: personal and group messages

**Route:** `/app/messages`

**Audience:** Authenticated user; available when chat is enabled.

**Purpose:** Show all conversations the current user is allowed to see. This is specifically a Flutter experience because it contains personal data, unread state, membership, and potentially real-time updates.

#### Content shown

- tabs or filters for Direct, Group, and possibly Community conversations;
- conversation title or participant name;
- avatar or group image;
- last-message preview, with privacy-safe truncation;
- timestamp;
- unread count;
- muted or archived state;
- online/presence indicator only if the product decides to provide it;
- search or filter conversations;
- new-message or new-group action if enabled;
- empty state explaining that the user has no conversations.

Private and group conversations must never be rendered by public Jinja2 pages or exposed through public search.

### A12 - One-to-one or group conversation screen

**Route:** `/app/messages/{conversation_id}`

**Audience:** Authorized conversation members only.

**Purpose:** Show message history and support private or group communication.

#### Content shown

1. Conversation header with participant or group name.
2. Member count and member-management control for authorized group members.
3. Message history with sender, timestamp, delivery/read state where supported, and grouped dates.
4. Unread divider and jump-to-latest behavior.
5. Message composer with validation and send state.
6. Attachment or media control only if a secure media design exists.
7. Edit/delete controls only for owned messages and within the allowed policy.
8. Report, block, mute, leave-group, or remove-member controls according to role.
9. Reconnection, sending failure, retry, and offline states.
10. Link to a public topic or discussion only when that link is intentionally shared; the private message body remains private.

#### Real-time behavior

- WebSockets may deliver new-message, edited-message, deleted-message, member, and presence events.
- PostgreSQL is the durable source for message history.
- Redis may coordinate transient presence and event delivery; it is not the permanent message store.
- The screen must still show a useful history after a refresh or WebSocket disconnect.

### A13 - Rich authenticated discussions screen

**Route:** `/app/discussions`

**Audience:** Authenticated user.

**Purpose:** Provide personal participation tools when public discussion pages alone are not enough.

#### Content shown

- discussions started by the user;
- discussions followed or saved by the user;
- replies and mentions relevant to the user;
- drafts if drafts are supported;
- create-discussion form;
- edit/delete controls for owned content;
- report status or moderation messages relevant to the user;
- links to the public discussion URL;
- filters for followed, authored, unanswered, and recent discussions.

The public discussion listing and detail remain Jinja2. This Flutter screen is for the authenticated user’s personal view and richer management workflow.

### A14 - Administrator dashboard

**Route:** `/app/admin`

**Audience:** Administrator, with separate moderator permissions if applicable.

**Purpose:** Show the work that needs attention across content, users, moderation, and operations.

#### Content shown

- total users and recent registrations;
- published, draft, pending, and archived content counts;
- open reports and moderation queue count;
- recent discussions and flagged items;
- basic traffic or content statistics when available;
- health or deployment status links for authorized operators;
- shortcuts to content, roadmap, users, moderation, and analytics.

The dashboard must distinguish unavailable data from zero. It must not expose secrets, database credentials, or raw internal errors.

### A15 - Administrator content management

**Route:** `/app/admin/content`

**Audience:** Administrator or content editor role.

**Purpose:** Create, edit, review, publish, unpublish, archive, and delete educational content.

#### Content shown

- tabs for topics, tutorials, guides, categories, and tags;
- search and status filters;
- title, slug, type, author/editor, publication state, and updated date;
- create and edit forms;
- body content editor with preview or safe rendered preview;
- summary, difficulty, category, tags, prerequisites, related content, and next-topic fields;
- code-example fields where supported;
- SEO title, meta description, canonical URL, Open Graph image, and indexing control;
- validation messages;
- draft, preview, publish, unpublish, archive, and delete actions;
- revision or last-edited information if maintained.

Publication must be explicit. A draft must not appear on public pages or in the sitemap. Deletion should be protected and preferably recoverable through archive or revision policy.

### A16 - Administrator roadmap management

**Route:** `/app/admin/roadmap`

**Audience:** Administrator or content editor role.

**Purpose:** Maintain the ordered learning path and prerequisite graph.

#### Content shown

- roadmap stages and nodes;
- node title, slug, topic link, order, difficulty, and publication state;
- prerequisite and child relationships;
- drag/reorder or explicit ordering controls if reliable;
- validation for missing topics, circular prerequisites, unpublished linked topics, and broken references;
- preview of the public roadmap;
- save, publish, and rollback or cancel actions.

The roadmap must have a clear text representation even if the administrator uses a visual editor.

### A17 - Administrator user management

**Route:** `/app/admin/users`

**Audience:** Administrator.

**Purpose:** Manage accounts, roles, and account status responsibly.

#### Content shown

- user search;
- display name, email or masked email, role, status, verification state, and creation date;
- recent activity summary only when authorized and necessary;
- role update control;
- suspend, restore, or disable control;
- account-detail view;
- audit history for administrative changes;
- confirmation and reason fields for consequential actions.

Password values and session tokens must never appear. Administrative actions should be logged.

### A18 - Moderation and reports

**Route:** `/app/admin/moderation`

**Audience:** Administrator or moderator.

**Purpose:** Review reports and protect discussion quality and user safety.

#### Content shown

- open, in-review, resolved, and dismissed reports;
- reported discussion or reply excerpt;
- report reason and timestamp;
- reporter identity only when necessary and authorized;
- content author;
- links to the public discussion or private moderation context as permitted;
- actions such as hide, restore, resolve, dismiss, suspend, or escalate;
- moderation notes;
- audit trail.

The UI should make it hard to take a destructive action accidentally and should make the resulting public state clear.

### A19 - Administrator analytics

**Route:** `/app/admin/analytics`

**Audience:** Administrator.

**Purpose:** Show aggregate platform and content performance without turning private learner data into public analytics.

#### Content shown

- published-content counts;
- topic and tutorial views if measured;
- search terms in aggregate if privacy-safe;
- completion trends in aggregate;
- discussion and moderation trends;
- account growth;
- performance or error summaries where available;
- date-range and content-type filters;
- export only if the export is authorized and privacy reviewed.

Analytics must distinguish measured facts from estimates. Avoid collecting more personal data than the product needs.

## 8. HTMX component and fragment specification

These are not standalone pages. They are small HTML responses returned to a known target in a Jinja2 page. Each fragment must be independently safe, accessible, and understandable when inserted into its target.

### C01 - Search-results fragment

**Endpoint:** `/web-components/search/results` or equivalent.

Returns the result list, count, pagination, and no-results state. It does not return a full document, header, footer, or duplicate page metadata.

### C02 - Topic-list fragment

**Endpoint:** `/web-components/topics` or equivalent.

Returns filtered topic cards or rows, filter summary, pagination, and empty state. Each result still contains a normal link to its public topic page.

### C03 - Progress-control fragment

**Endpoint:** `POST /web-components/topics/{topic_id}/progress` or equivalent.

Returns the updated progress control and a concise accessible status message. A visitor who is not signed in receives a sign-in prompt or a safe redirect. The fragment must not expose the user’s overall progress or any unrelated private data.

### C04 - Bookmark-control fragment

**Endpoints:** bookmark add/remove endpoints.

Returns the updated bookmark button and status message. It must enforce authentication and ownership server-side.

### C05 - Reply fragment

**Endpoint:** `POST /web-components/discussions/{discussion_id}/replies`.

Returns the newly created reply or validation errors. User-authored content must be escaped or sanitized. The fragment must include the author, timestamp, and moderation state appropriate to the public discussion.

### C06 - Like, report, and notification fragments

These may return an updated count, status control, or notification row. They must be small and must not cause a public page to become dependent on private application state.

### C07 - Flash-message fragment

**Endpoint:** `/web-components/flash-messages` or equivalent.

Returns accessible success, warning, or error feedback after a public-page action. It must not reveal sensitive backend details.

## 9. Page-to-API relationship

The following separation keeps the user experience clear.

| User need | Public/Jinja2 representation | Flutter representation | Backend source |
|---|---|---|---|
| Read a topic | `/topics/{slug}` full HTML | Link to the public topic URL | Topic service and repository |
| Browse roadmap | `/roadmap` full HTML | `/app/progress` with personal state | Roadmap and progress services |
| Browse topics | `/topics` full HTML | Optional selection/search within app | Topic service |
| Search public content | `/search` and HTMX results | Typed API search for app workflows | Search service |
| Read discussion | `/discussions/{id}` full HTML | Personal discussion view when needed | Discussion service |
| Reply or like | HTMX progressive action or normal authenticated request | Flutter discussion workflow | Discussion service |
| See own progress | Small optional control on public page | `/app/progress` and dashboard | Progress service |
| See own bookmarks | Optional button on public page | `/app/bookmarks` | Bookmark service |
| See own activity | Not public | `/app/activity` | Activity/statistics service |
| See own profile | Not public | `/app/profile` | User service |
| Send direct message | Never public | `/app/messages/{conversation_id}` | Chat service, PostgreSQL, Redis/WebSocket |
| Send group message | Never public | `/app/messages/{conversation_id}` | Chat service, PostgreSQL, Redis/WebSocket |
| Manage content | Never public | `/app/admin/content` | Admin/content services |

## 10. Authentication and privacy behavior by page

### Visitor

A visitor can:

- open the home page;
- read the Python overview;
- read the roadmap;
- browse topics, categories, tags, tutorials, and guides;
- search public content;
- read public discussions;
- open About, Contact, Privacy, and Terms;
- use public pages without JavaScript for the core reading experience.

A visitor cannot:

- see another user’s private progress, bookmarks, activity, notifications, or messages;
- open a private conversation;
- access the Flutter dashboard as an authenticated user;
- see unpublished content, private discussions, or admin screens.

### Authenticated learner

An authenticated learner can do everything a visitor can do, plus:

- record progress;
- create and manage bookmarks;
- view personal dashboard, activity, statistics, and notifications;
- participate in discussions according to permissions;
- use personal and group messages when enabled;
- manage profile and account settings.

Personal data belongs in the Flutter application. A public page may show only the minimum state required for a small action, such as whether the current user bookmarked the current topic, and only after authorization has been checked.

### Administrator or moderator

An administrator or moderator can access protected Flutter screens according to explicit role permissions. The UI must not be the only authorization boundary. Every API and mutation must re-check identity, role, ownership, and current content state on the server.

## 11. SEO contract for every public content page

Every indexable Jinja2 page should have:

- a stable, readable URL;
- one clear H1;
- a unique title;
- a unique meta description;
- canonical URL handling;
- server-rendered main content in the initial response;
- meaningful internal links;
- breadcrumbs when they clarify hierarchy;
- correct status codes;
- accessible semantic HTML;
- Open Graph metadata where appropriate;
- structured data only when it accurately describes the page;
- a useful 404 path for missing content;
- no accidental leakage of private or unpublished data.

Public pages should not be created merely to generate more URLs. A category, tag, discussion, search result, or filtered listing should be indexable only when it provides unique, useful content for a real visitor.

The sitemap should include published canonical pages. The `/app` application, private API data, private profiles, private messages, personal bookmarks, and private analytics must not be treated as public SEO content.

## 12. Content and navigation rules

### 12.1 Topic navigation

Every substantial topic should connect to:

- its category;
- its learning stage;
- prerequisites;
- related topics;
- recommended next topic;
- relevant tutorials;
- relevant guides;
- public discussions;
- the roadmap.

This creates a useful learning graph and helps search engines understand the relationship between pages.

### 12.2 Content types

- **Topic:** one concept or skill, taught in a focused page.
- **Tutorial:** a longer, ordered workflow that produces a practical result.
- **Guide:** a focused reference for a library, framework, comparison, setup, or common pattern.
- **Discussion:** community-authored questions and replies connected to topics.
- **Roadmap node:** a learning-order object that links to public topics and prerequisite relationships.

These types should have different page templates and editorial expectations. They should not be rendered as identical generic cards with only a changed title.

### 12.3 Linking from Flutter to public content

The Flutter application should open public content using its canonical URL. Examples:

- Dashboard Continue Learning -> `/topics/python-functions`;
- Progress node -> `/topics/python-asyncio`;
- Bookmark -> the saved topic, tutorial, or guide URL;
- Notification -> the authorized public discussion or topic URL;
- Message link -> a public topic only when the sender intentionally shared it.

This preserves one canonical content source and prevents the Flutter application from creating a second, inconsistent version of the lesson.

## 13. Page states that must be designed explicitly

Every list and personal screen needs more than its successful populated state.

### Loading

Show a stable skeleton or progress indicator for Flutter requests. Public Jinja2 pages should arrive with useful HTML and should not show a blank client-only shell while data loads.

### Empty

Explain why there is no content and give the next action. Examples:

- no bookmarks -> “Save a topic or guide to find it here later”;
- no progress -> “Start with the roadmap”;
- no discussions -> “Be the first to ask a question”;
- no messages -> “Your direct and group conversations will appear here.”

### Error

Explain the user-visible problem, provide retry or recovery, and avoid internal details. Do not turn a database exception into a page of raw text.

### Unauthorized

Show a sign-in route or session-expired state. Do not redirect every unauthorized request to the home page because that hides the real action required.

### Forbidden

Explain that the current account does not have permission. For admin actions, do not reveal whether a resource exists when that would expose sensitive information.

### Draft or unpublished

Only authorized administrators can see previews. Draft and unpublished content must not appear in public lists, related content, sitemap data, or search results.

## 14. Implementation phases mapped to pages

### Phase 1 - Public learning website

Build and validate:

- P01 Home;
- P02 Python overview;
- P03 Roadmap;
- P04 Topics;
- P05 Topic detail;
- P06 Categories;
- P07 Category detail;
- P08 Tags where enough content exists;
- P09 Tutorials;
- P10 Tutorial detail;
- P11 Guides;
- P12 Guide detail;
- P13 Search;
- P16 About;
- P17 Contact;
- P18 Privacy;
- P19 Terms;
- P20 public 404 and error states;
- sitemap and robots;
- base layout, metadata, accessible HTML, and responsive styling.

The first release should prioritize a smaller set of excellent topics over a large set of thin pages. The project plan’s approximate 15-25 topics and 5-10 tutorials or guides is a content target, not a reason to publish incomplete pages.

### Phase 2 - Accounts and lightweight learner actions

Add:

- A01 Sign-in;
- A02 Registration;
- A03 Password recovery;
- A04 Email verification;
- progress and bookmark services;
- authenticated HTMX controls on public pages where useful;
- the first version of the user API;
- secure sessions, CSRF protection, ownership checks, and account deletion behavior.

### Phase 3 - Flutter personal application

Add:

- A05 Dashboard;
- A06 Personal progress;
- A07 Bookmarks;
- A08 Activity and statistics;
- A09 Profile and settings;
- A10 Notifications;
- typed Flutter API client;
- direct route refresh behavior under `/app`;
- generated Flutter artifact build and deployment checks.

### Phase 4 - Public discussions and administration

Add:

- P14 Public discussions;
- P15 Public discussion detail;
- A13 Rich authenticated discussions;
- A14 Admin dashboard;
- A15 Content management;
- A16 Roadmap management;
- A17 User management;
- A18 Moderation;
- A19 Analytics;
- reporting, audit events, and role-based workflows.

### Phase 5 - Real-time and scale features

Add only after the core learning workflow is stable:

- A11 Conversation list;
- A12 One-to-one and group conversation screens;
- WebSocket events;
- Redis coordination and caching;
- live notifications and presence;
- background jobs, search indexing, advanced analytics, and more complex moderation.

Chat is valuable, but it is not a prerequisite for the SEO-first learning site. Discussions remain a core community feature; private and group chat can be enabled incrementally.

## 15. Definition of done for the page system

The page system is ready for its first production milestone when:

- a visitor can read useful Python content with JavaScript disabled;
- the home page, roadmap, topics, tutorials, guides, and search have stable public URLs;
- the roadmap contains meaningful explanatory text in addition to any visual graph;
- topic pages contain real lesson content, examples, prerequisites, and navigation;
- public pages do not depend on Flutter booting;
- authenticated personal data is available only to the authorized user through the protected application;
- direct refresh works for `/app/dashboard` and other Flutter routes;
- the Flutter application links to canonical public content instead of duplicating lessons;
- public discussions are separated from private and group messages;
- draft and private data are excluded from public pages and the sitemap;
- HTMX fragments return fragments, not duplicate full pages;
- Jinja2 and Flutter use the same services and repositories;
- loading, empty, error, unauthorized, and forbidden states are designed;
- metadata, canonical links, internal links, accessibility, and correct status codes are present;
- functional, route, API, browser, authentication, and Flutter tests cover the main workflows;
- health, deployment, generated Flutter output, and security checks are documented.

## 16. Final product rule

Python Learning Hub should feel like one coherent product:

```text
Public discovery and learning
    -> FastAPI + Jinja2 + HTMX
    -> crawlable HTML, stable URLs, useful content

Personal learning and communication
    -> FastAPI REST/WebSocket APIs + Flutter Web
    -> dashboard, personal data, progress, bookmarks, notifications,
       one-to-one messages, group messages, and administration

Both experiences
    -> shared services + repositories + PostgreSQL
```

The public website should behave like a strong learning resource that can be found, read, and shared. The Flutter application should behave like a private workspace that helps each learner manage their own learning and communication. Keeping those responsibilities clear gives the project the SEO benefits of server-rendered content without giving up the richer user experience needed for personal dashboards, personal messages, group messages, and private data.
