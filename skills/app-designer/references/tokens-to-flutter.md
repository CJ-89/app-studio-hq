# Design tokens → Flutter mapping

| Token group | Flutter target |
|---|---|
| color.light.* / color.dark.* | `ColorScheme(...)` for `ThemeData(colorScheme:)` light and dark. If only a seed color is chosen, `ColorScheme.fromSeed(seedColor:, brightness:)` then override specific roles. |
| typography.* | `TextTheme` (displayLarge … labelSmall); fonts via `google_fonts` or bundled assets (bundled is better for offline + privacy). |
| spacing.* | `abstract final class AppSpacing { static const xs = 4.0; … }` |
| radius.* | `AppRadius` constants + `ShapeBorder`s in component themes |
| elevation.* | Component themes (`CardTheme`, `DialogTheme`) |
| motion.* | `AppMotion` durations + `Curves` |
| components.* | Component themes: `FilledButtonThemeData`, `InputDecorationTheme`, `NavigationBarThemeData`, etc. |

Rule for the engineer: widgets read only from `Theme.of(context)` and the `App*` constants — never raw hex or numbers.

Use `ThemeExtension` for brand values Material doesn't cover (e.g. success/warning colors, gradients).
