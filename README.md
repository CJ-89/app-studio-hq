# App Studio kit

A solo builder's studio for mobile apps and games, run with Claude. It's a set of role skills (planner, architect, designer, engineer, QA/security, launch) plus templates and a script. Together they take an app from idea to Google Play, one phase at a time, and then move on to the next app in your portfolio.

The kit holds no personal data. Your defaults, portfolio and apps live in **your own private studio repo**.

## Phases
| # | Phase | Skill | Output (in `apps/<slug>/docs/`) |
|---|---|---|---|
| 1 | Plan | app-planner | APP_BRIEF.md |
| 2 | Architect | app-architect | TECH_SPEC.md, CLAUDE.md |
| 3 | Design | app-designer | DESIGN_SYSTEM.md, design_tokens.json |
| 4 | Build | app-engineer | TASKS.md, Claude Code prompts |
| 5 | QA | app-qa-security | TEST_PLAN.md, release gate, privacy/Data Safety |
| 6 | Launch | app-launch | LAUNCH_PLAN.md, store listing |
| 7 | Grow | app-launch / app-planner | weekly reviews, v1.1 |

`app-studio` works out the phase from `docs/` and routes to the right skill. `chat-handoff` and `phase-auto-handoff` carry state between sessions.

## Keywords
`status` · `next` · `portfolio` · `next app` · `new app <slug> flutter|unity` · `idea: …` · `plan M1` · `prompt M1-T2` · `review:` · `debug:` · `gate` · `launch` · `listing` · `weekly` · `v1.1` · `handoff` · `resume <slug>`. See [KEYWORDS.md](KEYWORDS.md).

## Layout
```
skills/      role skills (copy into ~/.claude/skills/ or upload to claude.ai)
templates/   APP_BRIEF, TECH_SPEC, DESIGN_SYSTEM, TASKS, TEST_PLAN, LAUNCH_PLAN, HANDOFF,
             PORTFOLIO, studio.config, CLAUDE.md (studio + app) templates
scripts/     new-app.sh: creates apps/<slug>/ + a private GitHub repo
```

## Quick start
1. Clone this kit, for example to `~/Repo/app-studio-hq`.
2. Install the skills: `cp -R skills/* ~/.claude/skills/` (Claude Code). For the Claude app, zip each skill folder and upload it under Settings → Capabilities → Skills.
3. Create your **private** studio repo (`gh repo create <you>/my-studio --private --clone`), then copy in the starting files:
   ```
   cp <kit>/templates/studio.config.template.md studio.config.md   # fill it in
   cp <kit>/templates/PORTFOLIO.template.md PORTFOLIO.md
   cp <kit>/templates/CLAUDE.studio.md.template CLAUDE.md
   echo "apps/" >> .gitignore
   ```
4. Open Claude Code in the studio repo and type `new app <slug> flutter`. That runs `scripts/new-app.sh`, which creates `apps/<slug>/` and a private `<owner>/<slug>` repo.
5. Type `next` to start planning.

Requires `git`, the `gh` CLI (logged in) and Claude Code. Recommended: `gitleaks`.

## License
MIT. See [LICENSE](LICENSE).
