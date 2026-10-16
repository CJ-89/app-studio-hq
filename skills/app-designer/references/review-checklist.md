# UI review checklist (Improve mode)

Score each screen; report only failures, grouped P1 (blocks use or looks broken), P2 (hurts conversion or trust), P3 (polish).

1. **Hierarchy** — is the primary action obvious within 2 seconds?
2. **Consistency** — spacing on the 4-pt grid, one radius family, tokens used everywhere
3. **Contrast** — text and icons meet WCAG AA
4. **Touch targets** — ≥ 48 dp, enough spacing between tappables
5. **States** — empty, loading, error present and helpful
6. **Copy** — short, specific, action-led button labels ("Save expense" not "OK")
7. **Text scaling** — no clipping at 200% font size
8. **Dark mode** — correct surfaces, no pure black/white glare unless intended
9. **Navigation** — back behaviour, no dead ends
10. **Trust** — paywall terms clear, permissions explained, no dark patterns

Output format per issue: `P1 · Screen · Problem · Fix (exact token/layout change)`.
