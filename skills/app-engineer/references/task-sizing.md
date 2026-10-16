# Task sizing

A good task:
- Delivers one visible or testable result (a slice: data → logic → UI → test).
- Touches roughly ≤ 8 files, one feature folder (+ shared core if needed).
- Can be described with ≤ 6 acceptance criteria.
- Finishes in one Claude Code session without `/compact`.

Split when:
| Smell | Split into |
|---|---|
| "Build the X feature" | data layer + repository tests → screen with mock data → wire real data → edge states |
| New backend table + UI | migration/RLS task → repository task → UI task |
| Payments | product setup + service wrapper → paywall UI → entitlement gating → restore purchases |
| Auth | sign-in flow → session handling + guards → sign-out + delete account |
| Anything with "and also" | one task per "and" |

Order inside a milestone: data/domain first (testable without UI), then UI against fake data, then real wiring, then polish states.

Task IDs: `M<milestone>-T<n>`, e.g. `M2-T3`.
