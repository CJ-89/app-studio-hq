# Default Flutter stack

Use these unless the brief gives a reason not to. One choice per layer — never mix (e.g. never Riverpod + Bloc in one app).

| Layer | Default | Notes |
|---|---|---|
| Framework | Flutter stable channel | Pin the version at bootstrap (`.fvmrc` with FVM, or note it in AGENTS.md). Upgrade deliberately between milestones. |
| Language | Dart, null-safe, strict analysis | |
| State management | Riverpod (with code generation) | Bloc acceptable if the user prefers strict event/state structure — decide once. |
| Navigation | go_router | Typed routes if the project grows. |
| Models | freezed + json_serializable | Run build_runner after model changes. |
| Local storage | shared_preferences (settings); drift or isar-type local DB for structured data | Choose one DB only. |
| Networking | The backend's SDK (pocketbase / supabase_flutter); dio only for other HTTP APIs | |
| Backend | Self-hosted (e.g. Coolify on a VPS): PocketBase (`pocketbase` Dart SDK) or Supabase (`supabase_flutter`) — see backend-choice.md | Local-first if no accounts/sync needed. |
| Auth | Backend's auth (PocketBase / Supabase); Google Sign-In on Android | Needs in-app account deletion if accounts exist. |
| Payments | `in_app_purchase` for a "Remove ads" one-time unlock (recommended alongside ads); RevenueCat only if the app has subscriptions | |
| Ads (default model) | google_mobile_ads (AdMob) + UMP consent SDK | Default money model. Wrap in an `AdsService`; test ad IDs in dev flavor, real IDs only in prod. Adds consent, Data Safety and app-ads.txt work. |
| Crash + analytics | Firebase Crashlytics + Firebase Analytics | Even with a self-hosted backend; link Firebase to AdMob for ad revenue reporting. |
| Push | firebase_messaging | Request notification permission at a meaningful moment. |
| Localization | flutter_localizations + intl (ARB files) | Set up on day one even if English-only. |
| Lints | very_good_analysis (or flutter_lints + stricter rules) | |
| Testing | flutter_test (unit + widget), integration_test, mocktail | |
| CI/CD | GitHub Actions for analyze+test; Codemagic or fastlane for build+upload | |

## Folder structure (feature-first)
```
lib/
  main_dev.dart / main_prod.dart   # flavor entry points
  app/            # app widget, router, theme, DI
  core/           # shared utils, errors, constants, widgets
  features/
    <feature>/
      data/       # repositories, DTOs, data sources
      domain/     # entities, business rules
      ui/         # screens, widgets, providers/controllers
test/ (mirrors lib/)
integration_test/
```
Why: Claude Code can work on one feature by reading one folder, which keeps each task small and cheap.

## Conventions to put in AGENTS.md
- Repositories return typed results; UI never calls the backend directly.
- All user-facing strings in ARB files.
- Theme values come from the design tokens; no hard-coded colors or sizes in widgets.
- Every feature task ships with tests; `flutter analyze` and `flutter test` must pass.

## Android build basics
- Gradle Kotlin DSL; set `targetSdk`/`compileSdk` to Play's current required level (app-launch checks the exact value).
- Release builds with `--obfuscate --split-debug-info=build/symbols` and upload symbols to Crashlytics.
- Build Android App Bundles (`flutter build appbundle`), not APKs, for Play.
