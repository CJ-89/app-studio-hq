# Privacy & Play compliance

Not legal advice — a practical checklist. Verify current Play policy at review time.

## Google Play items
| Item | What to do |
|---|---|
| Privacy policy | Required for all apps. Public URL (not a PDF), linked in Play Console and inside the app. |
| Data Safety form | Declare every data type collected or shared — by your code AND each SDK (Firebase Analytics, Crashlytics, AdMob, RevenueCat…). Say whether encrypted in transit and whether users can request deletion. |
| Account deletion | If users can create accounts: in-app deletion path + a web URL where deletion can be requested; deletes associated data (or explain what's kept and why). |
| Permissions | Request only what features need. Sensitive ones (location in background, SMS/call log, all-files access, broad photo/video access, exact alarms, foreground service types) need declarations; prefer the system photo picker over media permissions. |
| Target audience | If the app targets or appeals to children, Families policy applies (stricter ads, SDK and data rules). Avoid unless intended. |
| Ads declaration | Declare if the app shows ads. |
| Content rating | Complete the IARC questionnaire honestly. |
| Subscriptions | Clear price, trial, renewal and cancellation info before purchase. |
| AI-generated content | If the app generates content with AI, follow Play's AI-generated content policy: prevent prohibited content and give users a way to report offensive output. |

## AdMob (default money model)
- Consent: Google requires a certified consent message for users in the EEA, UK and Switzerland; use the UMP SDK and also enable US state privacy messages. Initialise ads only after consent is resolved.
- Data Safety: AdMob collects device or other IDs, approximate location (from IP), app interactions, diagnostics — declare per Google's current AdMob Data Safety guidance; mark data as "shared" for advertising.
- Policies: no click encouragement, no ads overlapping content or next to buttons, no ads on screens without publisher content, interstitials not unexpected.
- Never click your own live ads; use test ads or registered test devices (invalid activity can get the AdMob account disabled).
- Families: if the target audience includes children, only Families-certified ad SDKs and child-directed ad settings.

## Self-hosted backend (default)
- Privacy policy must name the hosting provider/region (your VPS provider and the server location you chose) as where data is stored.
- You are responsible for breach detection and backups; the security checklist covers the minimum.

## Singapore PDPA (applies if `studio.config.md` says the business is based in Singapore; use the matching local law otherwise)
- Consent: tell users what you collect and why, get consent before collecting.
- Purpose limitation: use data only for stated purposes.
- Access & correction: users can ask what you hold and correct it.
- Protection & retention: reasonable security; delete when no longer needed.
- Transfer: protect data sent overseas (e.g. to cloud providers) to a comparable standard.
- Data breach notification: assess and notify the PDPC (and affected users) when a breach is notifiable.
- Organisations must designate a Data Protection Officer — even a solo business.

## GDPR / UK GDPR (global English apps will have EU/UK users)
- Lawful basis, consent for non-essential tracking/ads (UMP consent form), right to access/erasure, list processors.

## Practical minimum for a solo app
Collect less: no accounts unless needed, no location unless core, analytics without personal data. Every item you don't collect is one less line in the policy, Data Safety form and risk list.
