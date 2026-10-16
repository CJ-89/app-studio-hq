# Common rejections and fixes

| Issue | Typical cause | Fix |
|---|---|---|
| Target API level | targetSdk below requirement | Raise targetSdk/compileSdk, rebuild, re-upload |
| Data Safety mismatch | SDK collects data you didn't declare | Re-check every SDK's Data Safety guidance; update the form |
| Privacy policy | Missing, broken link, or doesn't match data use | Live URL; list all collected data and SDKs |
| App access | Reviewers couldn't log in | Provide a working test account + steps |
| Account deletion | No in-app path or web URL | Add both; data actually deleted |
| Permissions | Sensitive permission not core to the app | Remove it or submit the declaration with a demo video |
| Misleading metadata | Screenshots/description promise features not in the app | Match the listing to the real app |
| Subscriptions | Unclear price/trial/cancel info | Show terms clearly on the paywall |
| Broken functionality / crash | Crash on reviewer device | Fix via pre-launch report + Crashlytics; test on low-end device |
| Production access denied | Thin testing answers or inactive testers | Run a better closed test (closed-test.md), reapply with specifics |
| Impersonation / IP | Name or icon too close to another brand | Rename / redesign |

Process: read the exact email + Policy status page → fix → reply in Console/appeal if you believe it's wrong → never resubmit unchanged.
