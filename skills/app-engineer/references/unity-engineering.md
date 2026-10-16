# Unity engineering (use when TECH_SPEC platform = Unity)

## Bootstrap (M0) prompt outline
Goal: set up `Assets/_Project` structure, Assembly Definitions, Boot scene loader script, `AdsService` (AdMob + UMP, test IDs in dev), `AnalyticsService` (Firebase), `SaveService` (versioned JSON), `BuildScript.BuildAndroid` editor script (.aab, reads keystore path/passwords from environment variables — never committed), Unity `.gitignore`, one EditMode test.
Manual steps for the user: import Google Mobile Ads, Firebase and Unity IAP packages via the Editor/Package Manager if Claude Code can't add them through `Packages/manifest.json`; set Player Settings (stack-unity.md checklist); create keystore; add `google-services.json`.

## Task rules
- Split each feature into: logic class + EditMode tests → MonoBehaviour/UI glue → Editor wiring steps (user) → PlayMode or manual check.
- Every task prompt ends with a "Manual Editor steps" section the user must do (assign references, add components to prefabs).
- Ask the user to confirm the game runs in Play mode after each task (Claude Code can't see it).

## Review additions (on top of the standard checklist)
- No direct YAML/meta edits in the diff.
- No per-frame allocations, no uncached `GetComponent` in Update.
- Ads only shown at the planned moments; rewarded ad reward granted only in the reward callback.
- Save format version bumped if save data changed.

## Debugging
- Ask for the first error in the Console (not the cascade), Unity version, and whether it's Editor or device.
- Device issues: `adb logcat -s Unity` filtered output, last ~40 lines.
- Gradle/Android build failures: check Player Settings target/min API, External Tools JDK/SDK/NDK paths, and plugin Android resolver (External Dependency Manager → Force Resolve).
