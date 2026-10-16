# Unity stack (games)

The user builds games in Unity on a Mac (Unity 6 line) for Google Play. Pin the exact editor version per project in TECH_SPEC and CLAUDE.md.

## Defaults
| Layer | Default | Notes |
|---|---|---|
| Engine | Unity 6 (the version already installed via Unity Hub), pinned | Upgrade only between milestones, with a backup branch |
| Render pipeline | URP (2D renderer for 2D games) | |
| Scripting backend | IL2CPP, ARM64 only | Required for Play's 64-bit rule |
| Input | Input System package | |
| UI | uGUI for in-game HUD; UI Toolkit for menus if comfortable | Pick one per screen type and keep it |
| Async/loading | Addressables for content beyond a small game | |
| Data | ScriptableObjects for config (levels, items, economy); JSON save file in `Application.persistentDataPath` | Version the save format |
| Ads (default) | Google Mobile Ads Unity plugin (AdMob) + UMP consent | Rewarded ads first, interstitials capped (see monetization.md) |
| IAP | Unity IAP ("Remove ads", optional currency packs) | |
| Crash/analytics | Firebase Unity SDK (Crashlytics + Analytics) | |
| Backend | None by default; if leaderboards/cloud save needed → PocketBase on Coolify, or Google Play Games Services for leaderboards/achievements | |
| Tests | Unity Test Framework (EditMode for logic, PlayMode for gameplay) | |
| Build | Editor build script + command-line batchmode build | Lets Claude Code build without clicking |

## Project structure
```
Assets/_Project/
  Scripts/{Core,Gameplay,UI,Services,Data}
  Prefabs/  Scenes/  ScriptableObjects/  Art/  Audio/  Editor/
  Tests/{EditMode,PlayMode}
```
- Assembly Definitions per folder (faster compiles, enforces dependencies).
- One Boot scene that loads services (ads, analytics, save) then the menu.
- Gameplay logic in plain C# classes where possible (testable in EditMode); MonoBehaviours stay thin.

## Working with Claude Code in Unity (important)
- Claude Code edits C# and text files well; it **cannot see or click the Editor**.
- Never hand-edit `.unity`, `.prefab`, `.asset` YAML or `.meta` files. Scene/prefab wiring is done by the user in the Editor, or by Editor scripts Claude Code writes (`Assets/_Project/Editor/`).
- Prefer code-driven setup: prefabs referenced through ScriptableObject configs, `[SerializeField]` fields documented in the task so the user knows what to drag in.
- Command-line test run (Mac):
  `"/Applications/Unity/Hub/Editor/<ver>/Unity.app/Contents/MacOS/Unity" -batchmode -nographics -projectPath . -runTests -testPlatform EditMode -testResults results.xml -logFile -`
- Command-line Android build: `-batchmode -quit -executeMethod BuildScript.BuildAndroid` (BuildScript in Editor folder builds an .aab).
- Use a Unity-specific `.gitignore` (Library/, Temp/, Obj/, Build/, Logs/, UserSettings/) and Git LFS for large binary assets.

## Android player settings checklist
Package name, version + bundle version code (increment every upload), minimum API, **target API = Play's current requirement**, IL2CPP + ARM64, "Build App Bundle (Google Play)", custom keystore (backed up outside the repo), Optimized frame pacing, check 16 KB page size support with the current Unity 6 version.

## Game-specific spec sections (add to TECH_SPEC)
- Core loop and session length
- Level/content pipeline (how levels are authored: ScriptableObjects, JSON, tilemaps)
- Economy (currencies, sources, sinks) if any
- Ad placements (which moments trigger rewarded/interstitial) and frequency caps
- Performance budget: 60 fps on the low-end test device, max memory, APK/AAB size target
