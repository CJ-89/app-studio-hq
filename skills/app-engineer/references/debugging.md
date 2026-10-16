# Debugging flow

1. Ask for the minimum: command run, last ~40 lines of the error, Flutter version (`flutter --version` first line), what changed since it last worked.
2. Classify:
| Type | First moves |
|---|---|
| Gradle / Android build | `flutter clean && flutter pub get`; check AGP/Gradle/Kotlin version compatibility; check compileSdk/targetSdk; read the first "What went wrong" block, not the last |
| Codegen | rerun build_runner with `--delete-conflicting-outputs`; check part directives |
| Dependency conflict | `flutter pub deps`; prefer upgrading the outlier package, avoid dependency_overrides |
| Runtime crash | Crashlytics stack trace or `flutter run` log; find the first frame in `lib/` |
| Layout overflow | identify the widget in the error; check flex/constraints; test at 200% text scale |
| Backend/auth | check env/flavor config, RLS policy or security rules, network on emulator |
| Test failure | run only that test: `flutter test path/to_test.dart --plain-name "<name>"` |
3. Give ONE hypothesis and a ≤ 10-line Claude Code fix prompt that includes how to verify.
4. If two attempts fail, step back: ask for a minimal reproduction or use plan mode to investigate before editing.
