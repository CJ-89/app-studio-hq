# Play publishing checklist
(Last verified: 2026-10 — re-check each launch)

## §1 Account
**Account type: read `studio.config.md` (Google Play).** Personal account → the closed test below is required. Start recruiting testers during the build so the 14 days begin the day the first internal build is stable.
- One-time US$25 registration, identity verification required.
- **Personal account created after 13 Nov 2023** → must run a closed test with **≥12 testers opted in for 14 continuous days** before applying for production access (per app, until the account has production access).
- **Organization account** → no closed-test requirement, but needs a registered business (D-U-N-S number) and longer verification; developer phone and email shown publicly.
- Singapore business: an ACRA-registered entity can apply for a D-U-N-S number (free) — worth it if you plan several apps.

## §2 Build & signing
- Upload an **Android App Bundle (.aab)**.
- **Target API: Android 16 (API 36)** for new apps and updates since 31 Aug 2026. Support 16 KB memory page size (Flutter/NDK builds on current toolchains handle this — verify with the APK analyzer or Play Console warnings).
- Enrol in **Play App Signing**; you keep only the upload key. Back it up (password manager + offline copy).
- versionCode must increase with every upload.
- Upload Crashlytics symbols for obfuscated builds.

## §3 App content (Policy → App content)
| Item | Notes |
|---|---|
| Privacy policy | Public URL |
| App access | If login is needed, give reviewers a working test account and instructions |
| Ads | Declare "Contains ads" (yes by default for this user) |
| Content rating | IARC questionnaire |
| Target audience & content | Pick 13+/18+ unless deliberately for kids |
| Data Safety | Must match app + SDKs |
| Account deletion | Web URL if the app has accounts |
| Financial / health / government / news declarations | Only if relevant |
| Foreground service, exact alarm, photo/video permission declarations | Only if used |

## §3b AdMob setup (default)
- Create the AdMob app, link it to the Play listing once published, and link to Firebase.
- Publish **app-ads.txt** at the root of the developer website in the Play listing (GitHub Pages or any static host works). Ads can serve with limited demand until it verifies.
- Set up the UMP privacy & messaging forms (GDPR + US states) in AdMob.
- Expect limited ad serving for brand-new AdMob apps/accounts while Google reviews them.

## §4 Release
- Internal testing (up to 100 testers, quick, no review gate) → Closed testing → Apply for production → Production with staged rollout.
- Budget ~3 weeks for a first launch on a new personal account (14-day test + production access review + app review).
- Countries: choose deliberately; start with markets you can support and price for.
