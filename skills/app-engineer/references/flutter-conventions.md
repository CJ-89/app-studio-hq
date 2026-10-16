# Flutter conventions (summary for prompts and reviews)

- **Layers**: ui (widgets + Riverpod controllers) → domain (entities, use-case functions) → data (repositories, DTOs, data sources). UI depends on repositories via providers only.
- **Errors**: repositories return a typed result (sealed class `Result<T>` or `AsyncValue` at the UI). Map backend exceptions to app errors with user-friendly messages in one place.
- **State**: `@riverpod` codegen providers; keep controllers small; no business logic in widgets.
- **Models**: freezed immutable classes; DTO ↔ entity mappers in data layer.
- **Navigation**: route names as constants; guards for auth/onboarding in go_router `redirect`.
- **Theme**: `Theme.of(context).colorScheme.*`, `textTheme.*`, `AppSpacing.*`; never raw colors.
- **Strings**: `AppLocalizations.of(context)`; no literals in widgets.
- **Async UI**: every async screen handles loading, error (with retry) and empty.
- **Performance**: `const` constructors, `ListView.builder` for lists, cache network images, avoid rebuilding whole screens (select/watch narrowly).
- **Logging**: a small logger wrapper; never log tokens, emails or personal data.
- **Tests**: `test/` mirrors `lib/`; name `<file>_test.dart`; use mocktail fakes for repositories; widget tests wrap in `ProviderScope(overrides: …)`.
- **Commits**: one per task, message `M2-T3: <summary>`.
