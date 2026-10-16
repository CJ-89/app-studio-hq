# M0 — Project bootstrap (Claude Code prompt)

Give this to Claude Code in an empty folder, after placing CLAUDE.md in the root and docs/TECH_SPEC.md, docs/DESIGN_SYSTEM.md, docs/design_tokens.json and docs/TASKS.md in it. Fill the <> values from TECH_SPEC.

```
Goal: Create the Flutter project skeleton for <App name> exactly as described in CLAUDE.md and docs/TECH_SPEC.md.

Read first: CLAUDE.md, docs/TECH_SPEC.md (sections 1, 7), docs/design_tokens.json.

Steps:
1. `flutter create --org <reverse.domain> --project-name <snake_name> --platforms android,ios .` (iOS folder kept for later).
2. Add packages from TECH_SPEC section 1 only. Add very_good_analysis and set analysis_options.yaml.
3. Create folders: lib/app, lib/core, lib/features, test/, integration_test/.
4. Flavors dev and prod (Android productFlavors, applicationIdSuffix ".dev" for dev, app name "<Name> Dev"), entry points lib/main_dev.dart and lib/main_prod.dart.
5. Theme: generate lib/app/theme/ from docs/design_tokens.json (light + dark ColorScheme, TextTheme, AppSpacing, AppRadius, AppMotion, ThemeExtension for success/warning). No hard-coded values elsewhere.
6. go_router with a placeholder home route; Riverpod ProviderScope at the root.
7. Localization: flutter_localizations + ARB file lib/l10n/app_en.arb with the app title.
8. AdsService wrapping google_mobile_ads + UMP consent (Google test ad unit IDs in dev; prod IDs via --dart-define), initialised after consent. Firebase Crashlytics + Analytics wired (I will add google-services.json for each flavor; leave clear TODOs and don't commit those files).
9. Android: set compileSdk/targetSdk to <required level>, minSdk <n>, enable R8; release signing reads from android/key.properties (gitignored).
10. .gitignore: key.properties, *.jks, google-services.json, .env*.
11. GitHub Actions workflow: flutter pub get, build_runner, analyze, test on every push.
12. One widget test: app starts and shows the home route.

Acceptance: `flutter analyze` zero issues; `flutter test` passes; `flutter run --flavor dev -t lib/main_dev.dart` launches; light/dark follow the system setting.
Out of scope: any feature screens.
Report: max 5 lines + list of TODOs I must do by hand.
```

## Manual steps for the user after M0
- Create Firebase projects (dev, prod), download `google-services.json` per flavor into `android/app/src/<flavor>/`.
- Create the upload keystore (`keytool`), store it OUTSIDE the repo, back it up (password manager + offline copy). Losing it means a key-reset request to Google.
- `git init`, first commit, push to a private GitHub repo.
