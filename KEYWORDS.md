# App Studio — keyword cheat sheet

## In the Claude app project
| Type | What happens |
|---|---|
| `status` | Current app + phase, last done, next step (3 lines) |
| `portfolio` | App sequence + status of every app |
| `next app` | Close the current app and start the next slot |
| `new app <slug> flutter` / `unity` | Creates apps/<slug> + a private GitHub repo from the kit templates, starts planning |
| `next` | Starts the skill for the current phase |
| `new idea` / `no idea, suggest 5` | Planner, mode A / B |
| `idea: <one line>` | Planner starts the interview on that idea |
| `architect` | Tech stack, backend, milestones → TECH_SPEC + AGENTS.md |
| `design` / `improve UI` + screenshot | Designer, new design / improve mode |
| `store assets` | Icon, feature graphic, screenshot plan |
| `plan M1` | Splits milestone M1 into tasks (TASKS.md) |
| `prompt M1-T2` | Claude Code prompt for that task |
| `review:` + Claude Code summary | PASS or a short FIX prompt |
| `debug:` + last ~40 error lines | One hypothesis + fix prompt |
| `test plan` | TEST_PLAN for the milestone/release |
| `gate` | Release gate → SHIP / FIX FIRST |
| `privacy` / `data safety` | Privacy policy draft / Data Safety answers |
| `launch` | Play Console step-by-step from where you are |
| `listing` | Store listing + ASO keywords |
| `weekly` + your numbers | Post-launch review and decisions |
| `v1.1` | Planner, post-launch mode |
| `handoff` | Compacts the chat into HANDOFF.md |
| `resume <slug>` | Pulls the studio + app repos, continues from HANDOFF.md |

## In Claude Code (Mac terminal)
| Type | What happens |
|---|---|
| paste the task prompt | Builds the task |
| `/clear` | Fresh context between tasks (do this every task) |
| `/compact keep decisions, file paths, failing tests, next step` | Shrinks a long session but keeps what matters |
| Shift+Tab (plan mode) | Plans before editing, for big or risky tasks |
| "use the app-engineer skill to …" | Uses the same rules as the chat engineer |
