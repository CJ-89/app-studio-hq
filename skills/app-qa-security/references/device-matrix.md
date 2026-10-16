# Device test matrix (solo-dev friendly)

Minimum before closed test:
| Slot | What | How |
|---|---|---|
| Low-end | Old/cheap Android, minSdk-ish OS, 2–3 GB RAM | Real device if possible, else emulator with low RAM |
| Mid | Popular mid-range phone, recent Android | Your own phone |
| Latest | Newest Android version (target API) | Emulator |
| Small screen | ~360 dp wide | Emulator |
| Large / foldable / tablet | If supported | Emulator |
| Text scale 200% + dark mode | On any device | Settings |
| Bad network | Offline + slow 3G | Emulator network throttling / airplane mode |

Use Firebase Test Lab (Robo test or your integration tests) for broader coverage on real devices. Play Console's pre-launch report also runs automatically on closed/open test uploads — read it every time.

Always test: fresh install, upgrade from the previous build (data survives), uninstall/reinstall, app killed in background and resumed, rotation (or locked orientation works), permission denied paths.
