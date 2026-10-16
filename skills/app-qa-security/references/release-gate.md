# Release gate (all must be ✅ to SHIP)

## Build
- [ ] Release build from the prod flavor, obfuscated, symbols uploaded to Crashlytics
- [ ] versionCode increased; versionName updated
- [ ] targetSdk meets Play's current requirement (check with app-launch)
- [ ] No debug banners, test ads IDs swapped for real IDs (and test devices registered), no dev endpoints

## Quality
- [ ] All S1/S2 bugs closed
- [ ] Core loop integration test passes
- [ ] Device matrix done (device-matrix.md)
- [ ] Cold start feels fast on the low-end device (aim < 2–3 s)
- [ ] No crashes/ANRs in the last internal test build (Crashlytics)
- [ ] Play pre-launch report reviewed: no crashes, accessibility warnings triaged

## Money
- [ ] Purchase, cancel, restore, and expired-subscription flows tested with license testers
- [ ] Paywall shows price, trial terms, and links to terms + privacy

## Privacy & policy
- [ ] Privacy policy URL live and matches actual data use
- [ ] Data Safety form matches the app + all SDKs
- [ ] Account deletion works in-app and via web link (if accounts)
- [ ] Only needed permissions; each has a rationale screen
- [ ] Ads: consent flow (UMP) shown where required and "Privacy options" reachable in settings; "Contains ads" declared
- [ ] Ads: real ad unit IDs only in the prod build; your test devices registered; no ad placed next to buttons; interstitial frequency caps work
- [ ] app-ads.txt published at the root of the developer website listed in Play Console, and shows as verified in AdMob
- [ ] Rewarded ads grant the reward only in the reward callback

## Security
- [ ] security-checklist.md passed

Verdict: **SHIP** or **FIX FIRST** + list of the blocking items.
