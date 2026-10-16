Task <M#-T#>: <title>

Goal: <1–2 lines — the user-visible result>

Read first: AGENTS.md, <docs/TECH_SPEC.md §n>, <docs/DESIGN_SYSTEM.md — screen "<name>">, <specific lib/... files>

Scope: only <lib/features/<feature>/**, test/features/<feature>/**>. Ask before touching anything else.

Steps:
1. <specific step with exact names>
2. …

Acceptance criteria:
- [ ] <testable outcome>
- [ ] Empty / loading / error / success states for <screen>
- [ ] `flutter analyze` clean, `flutter test` passes

Tests to add:
- <unit test: …>
- <widget test: …>

Out of scope: <what not to do>

Report back (max 5 lines): what changed, files touched, new packages (with reason), anything left undone. Then mark <M#-T#> done in docs/TASKS.md.
