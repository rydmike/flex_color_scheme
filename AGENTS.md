# Repository Guidelines

## Project Structure & Module Organization
- `lib/` holds the published package; most implementation lives under `lib/src/` (e.g., `flex_color_scheme.dart`, `flex_sub_themes*.dart`, and color data classes). Add new APIs next to related modules.
- `example/` contains runnable Flutter apps; `example5_themes_playground` showcases every option and is the fastest way to sanity‑check UI changes.
- `test/` mirrors the `lib/` layout with `*_test.dart` files plus widget-specific suites.
- `coverage/lcov.info` and `build/` are generated outputs; do not edit them manually.

## Build, Test, and Development Commands
- `flutter pub get` – refreshes dependencies defined in `pubspec.yaml`.
- `dart analyze` – runs the strict RydMike lint bundle (all lint rules + `strict-*` analyzer settings from `analysis_options.yaml`). Fix every warning before opening a PR.
- `flutter test --coverage` – executes the full test suite and refreshes `coverage/lcov.info` for Codecov uploads.
- `flutter test test/flex_color_scheme_test.dart` or `flutter test --name="pattern"` – use for focused debugging during development.
- Example smoke test: `flutter run -d chrome example/lib/example5_themes_playground/main.dart`.

## Coding Style & Naming Conventions
- Dart’s formatter (2-space indent, 80-char soft wrap) is required; run `dart format lib test example`.
- Prefer explicit types and `@immutable` data objects, matching the `all_lint_rules.yaml` baseline; avoid `var` unless inference adds clarity.
- Keep public APIs documented with triple-slash comments and mention Material-design specifics when behavior differs from Flutter defaults.


## Testing Guidelines
- Unit and widget tests live in `test/` and should mirror filenames in `lib/` (`flex_color_scheme_test.dart`, `flex_sub_themes_test.dart`, etc.).
- Add regression cases whenever you touch theming math or seeded color logic; lean on the example apps for visual checks.
- Maintain coverage by running `flutter test --coverage`; avoid skipping tests and gate new functionality with assertions that guard against API regressions.

## Commit & Pull Request Guidelines
- Use topical branches such as `fix/<issue-id>` or `feature/<theme-area>`; one logical change per PR.
- Follow conventional commits with concise scopes (e.g., `fix: correct blend for tertiary colors`) and reference GitHub issues when available.
- Every PR should describe the change, testing performed, screenshots or Playground snippets for visual tweaks, and note any API considerations.
- Do not land breaking API updates without prior discussion; flag them in the PR template and update docs (`README*.md`, examples, and changelog) in the same branch.
