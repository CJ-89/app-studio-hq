---
name: chat-handoff
description: Compacts a long chat into a short bullet-point HANDOFF block that carries every critical decision, constraint, file change, code snippet and next step into a new chat. Use whenever the user says "handoff", "compact", "summarise this chat", "wrap up", "carry this to a new chat", "chat is getting long", or when a phase or milestone ends. Also use when the user pastes a HANDOFF block and says "resume".
---

# Chat Handoff

Goal: the next chat should continue **as if nothing was lost**, using as few tokens as possible.

## Mode 1 — Create a handoff ("handoff" / "compact")
1. Scan the whole conversation. Keep only what changes future work: decisions, constraints, exact names, numbers, versions, file paths, IDs, commands, errors still open, and the next step.
2. Drop: greetings, explanations already understood, rejected options (keep them only as one line under Decisions: "rejected X because Y"), anything already saved in a project file (point to the file instead).
3. Fill the template below. Target **250–600 words**. Bullets only; one fact per bullet.
4. Code: include only snippets needed to continue that don't yet live in the repo, max ~15 lines each. Otherwise reference the repo path.
5. **Never include secrets**: passwords, API keys, keystore passwords, tokens, ad unit IDs for production. Write `<in password manager>` instead.
6. If a handoff file (APP_BRIEF, TECH_SPEC, DESIGN_SYSTEM, TASKS, LAUNCH_PLAN) should change because of this chat, say which one and give the complete updated file separately. Don't duplicate its contents in the handoff.
7. In Claude Code: write it to the app's `docs/HANDOFF.md` and tell the user to `/clear` then type `resume`. In a chat: deliver as `HANDOFF.md` + one copy-ready block; user replaces HANDOFF.md in project files, starts a new chat, types `resume`.

## Template
```
# HANDOFF — <project> · <YYYY-MM-DD> · <phase / milestone>

## Goal
- <what we are trying to achieve right now, 1–2 bullets>

## Done
- <completed outcomes, newest last>

## Decisions (locked)
- <decision> — <why>
- Rejected: <option> — <why>

## Critical context
- <constraints, versions, names, IDs, URLs, numbers that must not be lost>

## Files
- Updated: <file> (<what changed>)
- Repo paths touched: <paths>

## Code & commands
<only snippets still needed, each ≤ 15 lines, with the file path as a comment>

## Open issues
- <bug/question> — <current hypothesis or blocker>

## Next steps
1. <the very next action — specific enough to start immediately>
2. …

## Resume prompt
Resume from this handoff. Phase: <phase>. Start with step 1 of Next steps.
```

## Mode 2 — Resume ("resume" + pasted block, or docs/HANDOFF.md / HANDOFF.md in project files)
1. Read the handoff (and only the files it points to).
2. Reply in ≤ 4 lines: current phase, the next step, any blocker. Then do step 1 or ask the one question needed to start it.
3. Don't re-summarise the handoff back to the user.

## Rules
- Facts that were uncertain in the chat stay marked `(unverified)`.
- Keep exact spelling of names, package names, versions and paths.
- Only one HANDOFF.md per project at a time; the newest replaces the old one.
