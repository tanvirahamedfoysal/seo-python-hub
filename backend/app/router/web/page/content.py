"""Editorial fixture content for the public learning experience.

The route layer deliberately stays thin. These dictionaries are a small, reviewable
content seed until the database-backed repositories are wired in.
"""

TOPICS = [
    {
        "id": "python-overview",
        "slug": "python",
        "title": "What Is Python? History, Uses, and a Beginner's Starting Point",
        "summary": "Understand what Python is, why it is popular, and where it fits in modern software development.",
        "category": "Core Python",
        "category_slug": "core-python",
        "difficulty": "Beginner",
        "stage": "Orientation",
        "time": "8 min",
        "tags": ["beginner", "python", "programming"],
        "objectives": ["Explain what Python is", "Name common Python use cases", "Choose a useful next topic"],
        "prerequisites": [],
        "next": "python-variables",
        "sections": [
            {"heading": "Python in one sentence", "body": "Python is a general-purpose programming language designed to make ideas readable and practical. It can power a tiny script, a web API, a data pipeline, or a research notebook without changing its fundamental feel."},
            {"heading": "A short history", "body": "Python began as a readable, general-purpose language and grew through a strong standard library, an open community, and the modern Python 3 ecosystem. Exact historical dates and version details should be confirmed by the content administrator before publication."},
            {"heading": "Why people choose it", "body": "Readable syntax, a generous standard library, and a broad ecosystem make Python especially welcoming to learners. The same language also supports production systems when teams add testing, packaging, observability, and thoughtful design."},
            {"heading": "Where it is used", "body": "Python appears in web development with FastAPI and Django, data work with Polars and Pandas, scientific computing with NumPy, visualization with Matplotlib, automation, testing, machine learning, DevOps tooling, and API integrations."},
        ],
        "code": "print('A readable first step')",
        "output": "A readable first step",
    },
    {
        "id": "topic-variables",
        "slug": "python-variables",
        "title": "Variables and Values in Python",
        "summary": "Learn how names point to values and how to choose clear, useful names in your programs.",
        "category": "Core Python",
        "category_slug": "core-python",
        "difficulty": "Beginner",
        "stage": "Fundamentals",
        "time": "12 min",
        "tags": ["beginner", "syntax", "values"],
        "objectives": ["Assign values to names", "Recognize common built-in types", "Write readable assignments"],
        "prerequisites": ["python"],
        "next": "python-control-flow",
        "sections": [
            {"heading": "Names make values useful", "body": "A variable is a name that lets you refer to a value later. Python figures out the value's type at runtime, so the code can stay expressive while the interpreter keeps track of the details."},
            {"heading": "Name the idea, not the container", "body": "Prefer names such as learner_name, retry_count, or has_access. Clear names turn a line of code into a small piece of documentation."},
        ],
        "code": "learner_name = 'Maya'\nlessons_today = 2\nprint(f'{learner_name} has {lessons_today} lessons today.')",
        "output": "Maya has 2 lessons today.",
    },
    {
        "id": "topic-control-flow",
        "slug": "python-control-flow",
        "title": "Control Flow: Conditions and Loops",
        "summary": "Make decisions and repeat useful work with if statements and loops.",
        "category": "Core Python",
        "category_slug": "core-python",
        "difficulty": "Beginner",
        "stage": "Fundamentals",
        "time": "18 min",
        "tags": ["beginner", "logic", "loops"],
        "objectives": ["Write conditional branches", "Repeat work with for loops", "Recognize a useful stopping condition"],
        "prerequisites": ["python-variables"],
        "next": "python-functions",
        "sections": [
            {"heading": "Let the program choose", "body": "Conditional statements let a program respond to the data it receives. Keep each branch focused, and give the reader a clear default path."},
            {"heading": "Repeat the smallest useful unit", "body": "A for loop is often the clearest way to visit each item in a collection. When a loop becomes difficult to explain, extract the work into a function."},
        ],
        "code": "lessons = ['variables', 'loops', 'functions']\nfor lesson in lessons:\n    print(f'Next: {lesson}')",
        "output": "Next: variables\nNext: loops\nNext: functions",
    },
    {
        "id": "topic-functions",
        "slug": "python-functions",
        "title": "Functions and Return Values",
        "summary": "Turn a sequence of steps into a reusable building block with clear inputs and outputs.",
        "category": "Core Python",
        "category_slug": "core-python",
        "difficulty": "Beginner",
        "stage": "Fundamentals",
        "time": "20 min",
        "tags": ["beginner", "functions", "design"],
        "objectives": ["Define and call a function", "Pass arguments", "Return a result that callers can use"],
        "prerequisites": ["python-control-flow"],
        "next": "python-collections",
        "sections": [
            {"heading": "A boundary for an idea", "body": "A function gives a named idea a boundary. It accepts inputs, performs one coherent job, and returns a result without asking the rest of the program to know its internal steps."},
            {"heading": "Prefer explicit data flow", "body": "Passing values into a function is easier to test and reuse than relying on global state. A small function with a clear return value is a powerful unit of design."},
        ],
        "code": "def greet(name):\n    return f'Hello, {name}!'\n\nmessage = greet('Maya')\nprint(message)",
        "output": "Hello, Maya!",
    },
    {
        "id": "topic-collections",
        "slug": "python-collections",
        "title": "Lists, Tuples, Sets, and Dictionaries",
        "summary": "Choose the right built-in data structure for the information your program needs to manage.",
        "category": "Core Python",
        "category_slug": "core-python",
        "difficulty": "Beginner",
        "stage": "Core Python",
        "time": "24 min",
        "tags": ["beginner", "data-structures", "collections", "data-analysis"],
        "objectives": ["Compare the core collection types", "Choose based on access and mutability", "Iterate over structured data"],
        "prerequisites": ["python-functions"],
        "next": "python-exceptions",
        "sections": [
            {"heading": "Shape follows purpose", "body": "Lists preserve order, tuples represent a stable group of values, sets keep unique members, and dictionaries connect keys to values. The best choice makes the intended operation obvious."},
            {"heading": "Data structures are design decisions", "body": "Before reaching for a clever expression, ask what needs to be fast, what may change, and what a future reader should understand at a glance."},
        ],
        "code": "skills = {'python', 'testing'}\nprofile = {'name': 'Maya', 'skills': skills}\nprint(profile['name'])",
        "output": "Maya",
    },
    {
        "id": "topic-exceptions",
        "slug": "python-exceptions",
        "title": "Exceptions and Error Handling",
        "summary": "Handle expected failures without hiding the bugs that deserve your attention.",
        "category": "Professional Python",
        "category_slug": "professional-python",
        "difficulty": "Intermediate",
        "stage": "Reusable programs",
        "time": "22 min",
        "tags": ["errors", "debugging", "standard-library"],
        "objectives": ["Distinguish expected failures from defects", "Catch specific exceptions", "Write useful error messages"],
        "prerequisites": ["python-functions"],
        "next": "python-testing",
        "sections": [
            {"heading": "An exception is information", "body": "A useful exception tells you that an operation could not complete normally. Handle it where you have enough context to recover, explain the problem, or choose a safe fallback."},
            {"heading": "Catch narrowly", "body": "Catching Exception everywhere makes a program appear calm while real defects disappear. Catch the specific failure you expect, and let unexpected failures remain visible during development."},
        ],
        "code": "try:\n    count = int('twelve')\nexcept ValueError:\n    count = 0\nprint(count)",
        "output": "0",
    },
    {
        "id": "topic-testing",
        "slug": "python-testing",
        "title": "Testing Python Code with Confidence",
        "summary": "Build a feedback loop that makes refactoring safer and learning more deliberate.",
        "category": "Testing",
        "category_slug": "testing",
        "difficulty": "Intermediate",
        "stage": "Quality workflow",
        "time": "26 min",
        "tags": ["testing", "pytest", "quality"],
        "objectives": ["Describe a behavior as a test", "Keep tests focused", "Use failures as design feedback"],
        "prerequisites": ["python-functions", "python-exceptions"],
        "next": "python-asyncio",
        "sections": [
            {"heading": "Tests are executable examples", "body": "A good test names a behavior and makes the expected result unmistakable. Start with the smallest useful case, then add the edge cases that matter to the product."},
            {"heading": "Fast feedback changes how you work", "body": "When tests are easy to run, small refactors become safer. That safety lets you improve names, boundaries, and structure without guessing whether you broke a promise."},
        ],
        "code": "def add_tax(amount, rate):\n    return amount * (1 + rate)\n\nassert add_tax(100, .1) == 110",
        "output": "",
    },
    {
        "id": "topic-asyncio",
        "slug": "python-asyncio",
        "title": "Asyncio and Cooperative Concurrency",
        "summary": "Understand when asynchronous Python helps and how to keep its control flow readable.",
        "category": "Web Development",
        "category_slug": "web-development",
        "difficulty": "Advanced",
        "stage": "Applied Python",
        "time": "30 min",
        "tags": ["asyncio", "advanced", "web", "fastapi"],
        "objectives": ["Explain cooperative concurrency", "Recognize I/O-bound work", "Keep async boundaries intentional"],
        "prerequisites": ["python-functions", "python-exceptions"],
        "next": "python-functions",
        "sections": [
            {"heading": "Waiting without blocking everything", "body": "Asyncio is useful when a program spends much of its time waiting for network or file operations. While one task waits, the event loop can let another task make progress."},
            {"heading": "Async is a boundary, not a personality", "body": "Keep asynchronous code at the edges that need it. A clear boundary makes it easier to test, compose, and explain than turning every helper into an async function by default."},
        ],
        "code": "import asyncio\n\nasync def main():\n    await asyncio.sleep(.1)\n    print('Ready for the next task')\n\nasyncio.run(main())",
        "output": "Ready for the next task",
    },
]

CATEGORIES = [
    {"slug": "core-python", "name": "Core Python", "summary": "The language fundamentals that every Python path builds on.", "count": 18, "color": "teal", "topics": ["python", "python-variables", "python-control-flow", "python-functions", "python-collections"]},
    {"slug": "professional-python", "name": "Professional Python", "summary": "Error handling, modules, packaging, and habits that keep projects healthy.", "count": 14, "color": "gold", "topics": ["python-exceptions", "python-modules"]},
    {"slug": "testing", "name": "Testing", "summary": "Turn expected behavior into a feedback loop you can trust.", "count": 9, "color": "violet", "topics": ["python-testing"]},
    {"slug": "web-development", "name": "Web Development", "summary": "Build APIs and web applications with Python's modern ecosystem.", "count": 16, "color": "coral", "topics": ["python-asyncio", "python-fastapi"]},
    {"slug": "data-science", "name": "Data & Science", "summary": "Explore data, experiments, and visual explanations with Python.", "count": 21, "color": "blue", "topics": ["python-collections"]},
]

TUTORIALS = [
    {"slug": "cli-weather-app", "title": "Build a CLI Weather App", "summary": "A practical project with APIs, parsing, errors, and tests.", "difficulty": "Intermediate", "time": "45 min", "category": "Projects", "outcome": "A tested command-line weather lookup", "prerequisites": ["Functions and return values", "Exceptions and error handling"], "steps": ["Create a small command-line interface", "Call an HTTP API and parse the response", "Handle network and input failures", "Add focused tests and a helpful README"]},
    {"slug": "first-fastapi-service", "title": "Ship Your First FastAPI Service", "summary": "Turn a Python function into a documented, testable web endpoint.", "difficulty": "Intermediate", "time": "60 min", "category": "Web development", "outcome": "A small JSON API with validation", "prerequisites": ["Functions and return values", "Testing Python code"], "steps": ["Create the application boundary", "Validate request data", "Return a useful response", "Exercise the route with a client and a test"]},
    {"slug": "python-data-cleaning", "title": "Clean a Small Dataset with Python", "summary": "Use explicit transformations to turn messy rows into an understandable result.", "difficulty": "Beginner", "time": "35 min", "category": "Data", "outcome": "A repeatable data-cleaning script", "prerequisites": ["Lists, tuples, sets, and dictionaries"], "steps": ["Inspect the input shape", "Normalize missing and inconsistent values", "Summarize the cleaned result", "Save a small report for future readers"]},
]

GUIDES = [
    {"slug": "testing-with-pytest", "title": "Testing with pytest", "summary": "A friendly guide to arranging, naming, and running Python tests.", "difficulty": "Intermediate", "category": "Testing", "tool": "pytest", "when": "Use it when a project needs a fast, expressive feedback loop.", "setup": "Install pytest in your project environment, then run pytest from the project root.", "patterns": ["Arrange, act, assert", "One behavior per test", "Fixtures for shared setup"]},
    {"slug": "fastapi-for-python-developers", "title": "FastAPI for Python Developers", "summary": "Understand the building blocks of typed, documented Python APIs.", "difficulty": "Intermediate", "category": "Web development", "tool": "FastAPI", "when": "Use it when Python type hints and API documentation should work together.", "setup": "Create a virtual environment, install FastAPI and an ASGI server, and start with one route.", "patterns": ["Small route handlers", "Schema-first validation", "Dependency boundaries"]},
    {"slug": "python-virtual-environments", "title": "Virtual Environments", "summary": "Keep each Python project’s dependencies explicit and isolated.", "difficulty": "Beginner", "category": "Workflow", "tool": "venv", "when": "Use an environment for every project that has dependencies.", "setup": "Create an environment with python -m venv .venv and activate it before installing packages.", "patterns": ["Pin dependencies", "Keep secrets out of source", "Document the setup path"]},
]

DISCUSSIONS = [
    {"id": "discussion-1", "title": "When should I use a tuple instead of a list?", "excerpt": "I understand that tuples are immutable, but I am still unsure how to decide in a real project.", "topic": "Data structures", "topic_slug": "python-collections", "author": "Nadia Cole", "date": "Today", "replies": 8, "likes": 14, "status": "Active", "body": "I am working through collections and want a rule of thumb that will hold up beyond toy examples. Is immutability the only reason to choose a tuple?", "reply_items": [{"author": "Jules Martin", "body": "Immutability is a useful signal. I reach for a tuple when the number and meaning of positions should stay stable, such as coordinates or a function's fixed return shape.", "date": "12 min ago"}, {"author": "Maya Chen", "body": "I also like tuples when I want the reader to know that this group is a value, not a work queue that will grow.", "date": "6 min ago"}]},
    {"id": "discussion-2", "title": "How I structure my first Python project", "excerpt": "A small project layout helped me stop putting every function in one file.", "topic": "Project workflow", "topic_slug": "python-functions", "author": "Alex Rivera", "date": "Yesterday", "replies": 5, "likes": 10, "status": "Answered", "body": "I have a command-line project that started as one file. What is the smallest useful structure before splitting things too far?", "reply_items": [{"author": "Maya Chen", "body": "Keep the entry point thin, move one coherent idea into a module, and add tests at the boundary where behavior matters.", "date": "Yesterday"}]},
    {"id": "discussion-3", "title": "My mental model for decorators", "excerpt": "Looking for an explanation of decorators that connects syntax to ordinary functions.", "topic": "Advanced Python", "topic_slug": "python-functions", "author": "Priya Sen", "date": "Sep 24", "replies": 12, "likes": 22, "status": "Active", "body": "The @ syntax feels magical. What should I picture Python doing when it reads a decorator?", "reply_items": [{"author": "Jules Martin", "body": "Start by reading @decorator above a function as a reassignment: the original function is passed to another function and the returned value replaces it.", "date": "Sep 24"}]},
]

ROADMAP_STAGES = [
    {"name": "Orientation & setup", "slug": "orientation", "summary": "Get comfortable with the tools and the act of programming.", "color": "teal", "topics": ["python", "python-variables"]},
    {"name": "Python fundamentals", "slug": "fundamentals", "summary": "Build the language instincts that make every later topic easier.", "color": "coral", "topics": ["python-control-flow", "python-functions"]},
    {"name": "Core data structures", "slug": "data-structures", "summary": "Model and transform information with confidence.", "color": "violet", "topics": ["python-collections"]},
    {"name": "Quality & professional workflow", "slug": "quality", "summary": "Make programs reliable, testable, and ready to share.", "color": "gold", "topics": ["python-exceptions", "python-testing"]},
    {"name": "Applied Python", "slug": "applied", "summary": "Choose a path into APIs, data, automation, or asynchronous systems.", "color": "blue", "topics": ["python-asyncio"]},
]


def topic_by_slug(slug: str):
    return next((topic for topic in TOPICS if topic["slug"] == slug), None)


def category_by_slug(slug: str):
    return next((category for category in CATEGORIES if category["slug"] == slug), None)


def tutorial_by_slug(slug: str):
    return next((item for item in TUTORIALS if item["slug"] == slug), None)


def guide_by_slug(slug: str):
    return next((item for item in GUIDES if item["slug"] == slug), None)


def discussion_by_id(discussion_id: str):
    return next((item for item in DISCUSSIONS if item["id"] == discussion_id), None)


def search_content(query: str, kind: str = "all"):
    needle = query.strip().lower()
    if not needle:
        return []
    results = []
    if kind in {"all", "topic"}:
        for item in TOPICS:
            haystack = " ".join([item["title"], item["summary"], item["category"], *item["tags"]]).lower()
            if needle in haystack:
                results.append({"type": "Topic", "title": item["title"], "summary": item["summary"], "url": f"/topics/{item['slug']}", "meta": f"{item['category']} · {item['difficulty']}"})
    if kind in {"all", "tutorial"}:
        for item in TUTORIALS:
            if needle in f"{item['title']} {item['summary']} {item['category']}".lower():
                results.append({"type": "Tutorial", "title": item["title"], "summary": item["summary"], "url": f"/tutorials/{item['slug']}", "meta": f"{item['category']} · {item['difficulty']}"})
    if kind in {"all", "guide"}:
        for item in GUIDES:
            if needle in f"{item['title']} {item['summary']} {item['category']}".lower():
                results.append({"type": "Guide", "title": item["title"], "summary": item["summary"], "url": f"/guides/{item['slug']}", "meta": f"{item['category']} · {item['difficulty']}"})
    if kind in {"all", "discussion"}:
        for item in DISCUSSIONS:
            if needle in f"{item['title']} {item['excerpt']} {item['topic']}".lower():
                results.append({"type": "Discussion", "title": item["title"], "summary": item["excerpt"], "url": f"/discussions/{item['id']}", "meta": f"{item['topic']} · {item['replies']} replies"})
    return results
