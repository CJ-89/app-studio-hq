# Monetization guide

## Pick one primary model
| Model | Best for | Watch out |
|---|---|---|
| Subscription (weekly/monthly/annual) | Ongoing value: AI features, content, sync, tracking | Needs continuing value; offer annual with discount; free trial usually lifts conversion |
| Freemium + one-time unlock | Utilities, tools, offline apps | Lower lifetime value, simpler to build |
| One-time paid | Niche pro tools | Low discovery on Play; few users pay upfront |
| Ads (banner/interstitial/rewarded) | High-frequency, casual, wide audience | Need large volume; hurts ratings if aggressive; adds Data Safety and consent work |
| Hybrid (ads + remove-ads IAP) | Casual utilities | Keep ads light |
| Consumables (credits) | AI generation with real per-use cost | Explain credits clearly |

## Ads-first playbook (user default)
Ads revenue ≈ daily active users × ad impressions per user per day × eCPM ÷ 1000. So ads need **frequent sessions and scale**.
| Format | Use | Rule |
|---|---|---|
| Rewarded | Best for games and "unlock" moments; users choose to watch | Give a real reward; highest eCPM; best for ratings |
| Interstitial | Natural breaks (level end, after a task completes) | Cap frequency (e.g. no more than one every 2–3 minutes or every few actions); never on app open or mid-action |
| Banner | Persistent low-value screens | Low revenue; never near buttons (accidental clicks violate AdMob policy) |
| App open | Apps opened many times a day | Use carefully; can hurt retention |
| Native | Feeds and lists | Must be clearly labelled as ads |
- Always pair with a **"Remove ads" one-time IAP** (typical US$1.99–4.99) — it often adds meaningful revenue and helps ratings.
- **Global English traffic mix matters**: eCPM is much higher in US/UK/CA/AU than in India/SEA. Many installs from low-eCPM countries can mean high installs but low revenue — note the expected mix in the brief.
- Estimate in the brief with a stated eCPM assumption, labelled as an assumption (look up current AdMob eCPM ranges for the category; don't invent).
- Ads add work: UMP consent (EEA/UK + US states), Data Safety (AdMob collects device/ad IDs), app-ads.txt on a developer website, "contains ads" declaration.
- Apps or games that appeal to children trigger the Families policy — heavy ad restrictions. Aim the audience at 13+/18+ unless deliberately making a kids' product.

## AI apps: cost rule
If the app calls a paid AI API, estimate cost per active user per month and make sure the price is at least 3× that. Free tiers need hard limits.

## Pricing for the market
- Use Google Play's local price tiers. SEA prices are usually lower than US; Singapore close to US levels.
- Show the price in the brief as USD plus the target local currency.

## Paywall placement
- After the user has felt the core value once (after first success, not on first launch) — unless the app is a pure utility where a soft paywall on launch is normal.
- Always allow closing the paywall unless the model is paid-only.

## Default metrics with starter targets
| Metric | Starter target |
|---|---|
| D1 retention | 25%+ |
| D7 retention | 10%+ |
| Install → trial (subscription) | 5%+ |
| Trial → paid | 20%+ |
| Crash-free users | 99%+ |
Treat these as rough starting points; adjust once you have real data.

## Implementation pointer (for the architect)
Subscriptions/IAP on Android go through Google Play Billing. RevenueCat or the `in_app_purchase` plugin wraps it. Note the chosen model in the brief; the architect picks the tool.
