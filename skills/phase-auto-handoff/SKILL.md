---
name: phase-auto-handoff
description: Closes an App Studio phase cleanly. Use automatically whenever a phase ends (brief GO, spec done, design system done, milestone done, release gate passed, launch step done), when a session gets long, or when the user says "end phase", "wrap phase" or "close phase". Writes a phase summary and docs/HANDOFF.md, gives the exact resume line, updates PORTFOLIO.md, and commits + pushes the app docs and the portfolio.
---

# Phase auto-handoff

Run these steps in order. Don't ask before doing them. Only ask if a push fails.

1. **Phase summary**: at most 6 bullets. What was decided, which files changed, and what the next phase is.
2. **HANDOFF.md**: write `apps/<slug>/docs/HANDOFF.md` with the chat-handoff skill's template (`templates/HANDOFF.template.md`). Never include secrets.
3. **PORTFOLIO.md**: update the app's row (phase, a one-line note).
4. **Commit + push**:
   - `git -C apps/<slug> add docs CLAUDE.md && git -C apps/<slug> commit -m "docs: end of phase <n> <name>" && git -C apps/<slug> push`
   - `git add PORTFOLIO.md && git commit -m "portfolio: <slug> → phase <n+1>" && git push` (in the studio root)
   - Skip a push silently if the repo has no remote. Never commit secret files (see the app's `.gitignore`).
5. **Resume line**: end the reply with exactly:
   ```
   /clear
   resume <slug>
   ```

On `resume <slug>`: `git pull` in the studio root and in `apps/<slug>` first, then read `apps/<slug>/docs/HANDOFF.md` and continue (chat-handoff Mode 2).
