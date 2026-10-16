# Mobile UX patterns

## Navigation
- 3–5 top-level destinations → bottom NavigationBar. 2 → tabs. 6+ → rethink scope.
- One primary action per screen; FAB only for the main create action.
- Back behaviour must follow Android predictive back (system back gesture).

## Onboarding
- Max 3 screens, or skip entirely and teach in context.
- Show the value, not features. Ask for permissions only when the feature needs it, with a one-line reason first.
- Get the user to their first success in under 60 seconds.

## Paywall
- Show after the first moment of value (unless pure utility with soft launch paywall).
- Layout: benefit headline → 3 benefit bullets → plan cards (annual pre-selected, show savings) → one CTA → restore purchases + terms + privacy links → visible close.
- State the trial clearly: length, price after, how to cancel. Play policy requires clear subscription terms.

## Ad placement (ads are the default money model)
- Banners: fixed at the bottom or top edge of content screens, never adjacent to buttons or overlapping content; reserve the space in the layout so content doesn't jump.
- Interstitials: only at natural breaks (task finished, level complete, leaving a results screen); never on launch, on back press, or during input.
- Rewarded: an explicit button that states the reward ("Watch ad → +3 hints").
- Native ads in lists: same style as content but clearly labelled "Ad".
- Settings → "Privacy options" entry to reopen the consent form (UMP) where required.

## Empty / loading / error states
- Empty: illustration or icon + one line on what goes here + primary action.
- Loading: skeletons for lists, spinners only for short actions.
- Error: plain-language cause + retry. Never show raw error codes.
- Offline: banner + cached content if available.

## Forms
- Labels above fields, inline validation after the user leaves the field, the correct keyboard type, autofill hints.

## Settings (always include)
- Account (sign out, **delete account** if accounts exist), subscription management link, notifications, theme (system/light/dark), language, privacy policy, terms, contact/support, app version.

## Feedback & ratings
- Ask for a Play rating with the in-app review API only after a positive moment, never on first session.

## Accessibility
- Content descriptions (Semantics) on icons and images; logical focus order; don't rely on color alone for status.
