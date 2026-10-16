# TECH_SPEC — <App name>
Version: <n> · Updated: <YYYY-MM-DD> · Based on APP_BRIEF v<n>

## 1. Stack decisions
| Layer | Choice | Rejected alternative | Why |
|---|---|---|---|
| Platform | | | |
| State | | | |
| Backend | | | |
| Auth | | | |
| Payments | | | |
| Analytics/crash | | | |

## 2. Modules & screens
| Feature module | Screens | Route |
|---|---|---|
| | | |

## 3. Data model
| Entity | Fields (type) | Relations | Access rule (RLS/rules) |
|---|---|---|---|
| | | | |

## 4. Services & integrations
| Service | Package | Purpose | Data it collects (for Data Safety) |
|---|---|---|---|
| | | | |

## 5. Security baseline
- Secrets: <where they live>
- Server-side calls: <which>
- Rate limits: <…>
- Account deletion: <in-app path + web URL>

## 6. Analytics events
| Event | When fired | Metric it feeds |
|---|---|---|
| | | |

## 7. Environments & release
- Flavors: dev (`<applicationId>.dev`), prod (`<applicationId>`)
- Backend projects: dev = <…>, prod = <…>
- minSdk: <…> · targetSdk: Play's current requirement (checked by app-launch)
- Signing: Play App Signing + upload key (stored outside the repo)

## 8. Milestones
| # | Milestone (vertical slice) | Done when |
|---|---|---|
| M0 | Project bootstrap | App runs both flavors, CI green, theme from tokens, crash reporting live |
| M1 | | |

## 9. Open questions
- …
