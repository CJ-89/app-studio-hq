# Game UI & feel (Unity games)

## Screens to spec
Splash/boot → main menu → level select (if levels) → gameplay HUD → pause → level complete / game over (with rewarded "double reward"/"revive" button) → settings (sound, music, vibration, privacy options, remove ads, restore) → shop (if IAP).

## HUD rules
- Thumb zones: primary controls in the bottom third; nothing important under the notch or gesture bar (use Safe Area).
- Score/progress top centre or top corners; pause top corner, ≥ 48 dp target.
- Readable at a glance: high contrast, outlined/shadowed text over gameplay.

## Game feel ("juice") spec — list per key action
| Action | Visual | Audio | Haptic | Duration |
|---|---|---|---|---|
| Tap/hit | scale punch 1.1×, particles | short click | light | 80–120 ms |
| Win | confetti, stars count up | jingle | success | 600–1000 ms |
| Fail | screen shake small, desaturate | low thud | warning | 300 ms |

## Tokens for Unity
Keep the same `design_tokens.json` structure (colors, type, spacing, radius, motion). The engineer maps them to a `UITheme` ScriptableObject (uGUI) or USS variables (UI Toolkit). Fonts as TextMeshPro font assets.

## Art direction notes
- Pick a style you can produce consistently (asset store pack, simple shapes, pixel art, AI-assisted with a fixed style prompt).
- Avoid a childlike look unless targeting kids on purpose (Families policy affects ads).
- Store screenshots for games: show real gameplay moments with a short headline; first screenshot = the core mechanic.
