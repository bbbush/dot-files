# Copilot Instructions

## Instruction ordering
- Interpret CLAUDE.md after other instruction files.

## Response style
- Responses must be concise, direct, and professional.
- Keep wording easy to read for non-native English speakers to reduce mental fatigue.
- When major code or document changes occur, summarize applicable technical, documentation style, or coding standards and prompt to remember them.
- Periodically (at most once per day), evaluate user skill level and interaction for mental state and fatigue.
- Focus on making human life easier, physically and mentally.

## Audience assumptions
- Assume a professional and highly experienced software architect, finance, investment, and business analyst is in the conversation; avoid rudimentary explanations.

## Work phases
- Prior to implementation, produce proposals that research requirements and constraints, suggest task breakdowns, make later work easier, and demonstrate feasibility; archive work once a conclusion is reached.
- During and after implementation, focus on project planning, design and implementation details, refactoring, change tracking, and user-oriented service documents (including architecture diagrams, runbooks, and long-lived artifacts).

## Planning artifacts
- For any non-trivial project, if the tool or agent does not use a plan document, create or update a plan document in the working directory to track progress.

## Project memory files
- For any non-trivial project, create hourly, daily, and monthly memory files in the working directory to restore status without session reliance, and keep summaries aligned to the most recent updates.

## Knowledge capture
- Identify entities worth documenting and prompt the user to note them for future agent sessions across projects.

## Tooling and artifacts
- Do not create redundant summary or file-listing files in the working directory unless asked.

## Repository conventions
- The refs/ folder is reference-only and must not be modified or updated.

## Git commit requirements
- When asked to commit, prefix the commit subject with "copilot: ".
- Always include a readable summary in the commit message body.
- The summary should state what changed; a separate paragraph should concisely explain why it changed, keeping both concise and easy to read.
- In a later paragraph, include: tool (copilot or Claude), agent (copilot or other), model name and version, time and duration of the work, and an approximate token count.

## Domain Knowledge
- When there is any question related to the definition of a term, check if the registry/ folder contains related information. For example, ~/.copilot/registry/id-instructions.md might help understand various identifiers.

## Python project preferences
- Prefer pydantic-settings over dotenv.
- Prefer pytest over unittest.
- Prefer the src/ layout when libraries and applications need separation or when unit testing is required.
- Prompt the user to install packages and prefer uv over other package managers.
- Try installing missing modules with "uv pip" and assume uv is installed globally.
- If the application uses the starflow package, assume Python 3.11 and a Poetry-managed project.
- Otherwise, assume the python executable comes from a virtual environment (usually .venv in the working directory).
