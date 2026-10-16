# Other non-Flutter stacks (open only when Step 1 picks one of these)

Unity (games) has its own file: `stack-unity.md`.

## React Native + Expo
- Expo (managed workflow, development builds), TypeScript strict, Expo Router, Zustand or Redux Toolkit, TanStack Query for server data.
- EAS Build/Submit for Play uploads; EAS Update for over-the-air JS fixes.
- Tests: Jest + React Native Testing Library; Maestro or Detox for end-to-end.

## Kotlin + Jetpack Compose (Android-only)
- Single-activity, Compose UI, Navigation Compose, ViewModel + StateFlow, Hilt for DI, Room for local DB, Retrofit/Ktor for network.
- Use the Compose BOM; Gradle version catalogs.
- Tests: JUnit, Turbine, Compose UI tests.

## Kotlin Multiplatform
- Shared `commonMain` for data/domain; Compose Multiplatform UI or native SwiftUI on iOS.
- Requires a Mac + Xcode for iOS builds. Smaller ecosystem than Flutter — check every needed library supports KMP before committing.

For every alternative, keep the same TECH_SPEC and CLAUDE.md templates; replace the stack table and commands.
