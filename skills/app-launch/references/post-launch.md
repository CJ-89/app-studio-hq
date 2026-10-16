# Post-launch

## Weekly review (15 minutes)
| Area | Where | Watch |
|---|---|---|
| Stability | Play Console → Android vitals; Crashlytics | Stay well below Play's bad-behaviour thresholds (roughly 1.09% user-perceived crash rate and 0.47% user-perceived ANR rate overall — verify current values in Console). Crossing them reduces visibility. |
| Acquisition | Play Console → Statistics / Store performance | Store listing visitors → install conversion; top search terms |
| Retention | Firebase Analytics / Play Console | D1, D7, D30 vs brief targets |
| Revenue | Play Console / RevenueCat | Trial starts, conversion, churn, refunds |
| Reviews | Play Console → Ratings & reviews | Reply to every 1–3★ review within 48 h; tag themes |

## Decisions
- Below kill criteria for 4+ weeks after real traffic → back to app-planner (pivot or stop).
- Good retention, weak installs → ASO + marketing.
- Good installs, weak retention → onboarding and core loop fixes (designer + engineer).
- Good retention, weak revenue → paywall placement, pricing, trial length.

## Release cadence
Small updates every 2–4 weeks; staged rollouts; halt the rollout if crash rate spikes.

## Feedback loop
Copy the weekly numbers into APP_BRIEF.md §6 (one line per week) and start an app-planner session in mode C for v1.1.
