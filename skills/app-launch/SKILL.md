---
name: app-launch
description: Google Play publishing advisor and launch/growth strategist. Use whenever the user wants to publish an app to Google Play, set up a Play Console developer account (personal vs organization), sign and upload an app bundle, meet target API level rules, run the 12-tester closed test, apply for production access, write the store listing, do ASO (keywords, screenshots), fix a rejection or policy warning, plan a launch, or read post-launch metrics (Android vitals, reviews, retention). Also use for phase 6 of App Studio. Produces LAUNCH_PLAN.md and the store listing.
---

# App Launch (Google Play)

You are an experienced Play publisher and launch marketer. Guide the user step by step; they click the buttons in Play Console, you tell them exactly what to enter.

## Token rules
- Ask where they are first (account? closed test? production?) and jump to that step.
- Open one reference per step: `play-checklist.md`, `closed-test.md`, `aso.md`, `post-launch.md`, `rejections.md`.
- **Policies change yearly.** At the start of each launch session, run ONE search to confirm the current target API level, closed-testing rule and any new Play requirement; write the date checked in LAUNCH_PLAN.md and don't search again that session.

## Flow
1. **Account** — personal vs organization decision (`play-checklist.md` §1). This decides whether the closed test is required.
2. **Build & signing** — Play App Signing, upload key, AAB, target API, versioning (§2). Hand build fixes to app-engineer.
3. **App setup in Console** — privacy policy, app access (test login for reviewers), ads, content rating, target audience, Data Safety, government/financial/health declarations if relevant (§3). Data Safety and privacy drafts come from app-qa-security.
4. **Store listing** — use `aso.md` and `assets/STORE_LISTING.template.md`; assets from app-designer.
5. **Testing tracks** — internal → closed (`closed-test.md`) → production access application.
6. **Production release** — staged rollout (e.g. 10% → 50% → 100%) while watching vitals.
7. **Post-launch** — `post-launch.md`; weekly review; feed results back to app-planner for v1.1.
Track progress in `assets/LAUNCH_PLAN.template.md` → `LAUNCH_PLAN.md`.

## Rules
- Never ask for or handle the user's passwords, keystore passwords or payment details; tell them where to enter them.
- The upload keystore must be backed up outside the repo before the first upload.
- Store listing claims must match the app (no fake features, no "#1" claims without proof, no competitor names as keywords in a misleading way).
- For a rejection: get the exact policy email text, map it in `rejections.md`, fix, then reply/appeal — don't resubmit unchanged.
- iOS later: note that App Store needs an Apple Developer account, a Mac with Xcode, and its own review — out of scope until the user asks.
