# App Studio (root) — read by Claude Code for every app under this folder

Use the **app-studio** skill to decide what's next. It holds my defaults, keywords, phase rules and the portfolio sequence.

- Portfolio and app order: `PORTFOLIO.md` (keep it updated).
- Each app: `apps/<slug>/` with its own `CLAUDE.md` and `docs/` (APP_BRIEF, TECH_SPEC, DESIGN_SYSTEM, design_tokens.json, TASKS, LAUNCH_PLAN, HANDOFF).
- Write phase files directly into `docs/`. Never ask me to copy files.
- Start every session by answering `status` unless I ask something else.
- One task per session; when a session gets long or a phase ends, write `docs/HANDOFF.md` and tell me to `/clear` and type `resume`.
- Keep replies short: tables and bullets.
