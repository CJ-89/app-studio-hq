# studio.config.md — my studio defaults (keep this in your PRIVATE studio repo)

The App Studio skills read this file for anything personal. Fill it once.

## Owner
- GitHub owner for app repos: `<github-user-or-org>` (every app repo is **private**)
- Studio name: <Studio name>
- Business base: <country> (decides which privacy law applies, e.g. Singapore PDPA, GDPR)
- Kit path: `<path to your app-studio-hq clone>` (used to run `scripts/new-app.sh`)
- Package prefix: `<com.yourstudio>` (app id = `<prefix>.<slug>`)
- Support email: <support@example.com>
- Developer website: <https://you.github.io> (Play Console → Store settings → Website; hosts app-ads.txt)
- Site repo (local path): `<path to your site repo, or none>` (static site with app-ads.txt + privacy pages, `site.config.json` + `scripts/add-app.mjs`)
- Privacy policy URL pattern: <https://you.github.io/<slug>/privacy/>

## Stack
- Apps: Flutter (Android first). Games: Unity 6.
- Backend: <none / self-hosted Coolify on a VPS (PocketBase or Supabase) / managed Supabase / Firebase>. Local-first whenever possible.
- Automations / AI: <e.g. n8n, called server-side only / none>
- Backups: <off-server storage, keep ≥14 days>
- Crash + analytics: Firebase Crashlytics + Analytics

## Market & money
- Market: <global English / region>
- Money: <AdMob ads (+ "Remove ads" IAP) / subscriptions / paid>
- AdMob account: <exists / not yet>. Test ad unit IDs in all dev builds; real IDs only in the release config.
- app-ads.txt host: <e.g. GitHub Pages / own domain>

## Google Play
- Account type: <personal / organization> (personal → 12 testers × 14 days closed test per new app)
- Tester Google Group: <exists / not yet>

## Studio rules
- Max 1 app in build + 1 in closed test + live apps in maintenance.
- Portfolio and order: `PORTFOLIO.md`.
- Apps live in `apps/<slug>/`, each its own private repo `<owner>/<slug>`.
