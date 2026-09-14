# FlexColorScheme

FlexColorScheme (FCS) is a published Flutter theming package. It builds matched light/dark `ThemeData` from built-in or custom colors, optional FlexSeedScheme seeding, component themes, and adaptive styling. Breaking public API changes need discussion. Documentation quality and tests are required. There is no numeric coverage gate; add focused regression coverage for behavior you change.

SDK constraints live in `pubspec.yaml`. Use `fvm flutter` locally (`.fvmrc` tracks `stable`).

## Agent configuration

`AGENTS.md` is the only instruction master. Skills live in `.agents/skills/`.

Claude Code uses generated `CLAUDE.md` and a generated skills mirror. Recreate them after master edits:

```bash
./scripts/sync_claude_code_config.sh
```

The script rewrites skill paths for Claude. Optional teardown: `./scripts/delete_claude_code_config.sh`. Never hand-edit generated Claude files. Cursor: keep **Include third-party Plugins, Skills, and other configs** off so the generated mirror is not loaded twice. Details: [scripts](scripts/README.md).

## Skills

Load the matching skill; do not paste their contents into this file.

| Skill                                                                                                                  | When                                                                      |
| ---------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| [.agents/skills/flex-color-scheme/SKILL.md](.agents/skills/flex-color-scheme/SKILL.md)                                 | Using the package in an app, or copying the consume skill into a consumer |
| [.agents/skills/package-development/SKILL.md](.agents/skills/package-development/SKILL.md)                             | Changing `lib/`, package tests, or CI                                     |
| [.agents/skills/themes-playground-development/SKILL.md](.agents/skills/themes-playground-development/SKILL.md)         | Playground settings, controls, panels, persistence, reset, previews       |
| [.agents/skills/themes-playground-code-generation/SKILL.md](.agents/skills/themes-playground-code-generation/SKILL.md) | Emitted theme setup or ColorScheme Dart from the Playground               |
| [.agents/skills/code-documentation/SKILL.md](.agents/skills/code-documentation/SKILL.md)                               | Writing or updating dartdoc, README, or CHANGELOG                         |
| [.agents/skills/code-review/SKILL.md](.agents/skills/code-review/SKILL.md)                                             | Reviewing a branch, PR, or uncommitted diff                               |
| [.agents/skills/release/SKILL.md](.agents/skills/release/SKILL.md)                                                     | Publishing to pub.dev, tagging, web example deploy                        |

Package map: [architecture](docs/guides/architecture.md). Fresh checkout/worktree setup: [worktree guidance](docs/guides/using-worktrees-guidance.md). Themes Playground: entrypoint `example/lib/example5_themes_playground/main.dart`, shared state `example/lib/shared/`; load the Playground development skill for Store/controller/panels and the code-generation skill for emitted Dart.

## Commands

`example/` is a separate package, not a pub workspace.

```bash
fvm flutter pub get
(cd example && fvm flutter pub get)
fvm dart format lib test example
fvm dart analyze
fvm flutter test --coverage
```

`dart format --fix` no longer exists in Dart 3.13; use plain `dart format` (lint fixes: `dart fix --apply`). Prefer the `fvm dart` / `fvm flutter` prefix so the pinned SDK is used.

CI also runs `dart format --output=none --set-exit-if-changed .`. Optional local HTML: `genhtml coverage/lcov.info -o coverage/html`. Never hand-edit `coverage/` or `build/`.

Playground:

```bash
cd example
fvm flutter run -d chrome lib/example5_themes_playground/main.dart
```

## Layout

- `lib/flex_color_scheme.dart` — public barrel; also re-exports FlexSeedScheme
- `lib/src/` — FCS API (`FlexColorScheme`, `FlexThemeData`, `FlexSubThemesData`, `FlexSubThemes`, palettes, adaptive helpers)
- `test/` — package tests (`flutter_test`); numbered groups such as `FCS1`, `FSTC1`, `FKCS1`
- `example/` — five entrypoints of increasing depth; Playground is example 5
- `example/lib/example5_themes_playground/` — Themes Playground UI, theme builders, code generation
- `example/lib/shared/` — Playground `ThemeController`, `Store`, persistence services, shared widgets
- `docs/guides/` — architecture and worktree notes
- `resources/` — README images hosted from GitHub; not published

## Quality bar

- **Coverage:** add focused regression tests for theme calculations, seeding, and component behavior you change. Do not invent a 100% coverage gate. `example/test/widget_test.dart` is empty; package tests are the suite.
- **Docs:** `public_member_api_docs` is on for `lib/`. Unresolved dartdoc `[Type]` references fail CI. Explain *why* and how parameters interact; usage tutorials belong in README and the consume skill.
- **API:** no breaking public API without discussion. See [CONTRIBUTING.md](CONTRIBUTING.md). Preserve deliberate defaults, null semantics, and Material 2/3 differences. FlexColorScheme re-exports FlexSeedScheme; FSS breaks are FCS breaks.
- **User-facing changes:** update `example/` (Playground when the option is configurable there, plus a simpler example when the feature is meant to be copied) and README. CHANGELOG sections: `Package`, `Test`, `Themes Playground` with tags `BREAKING`, `NEW`, `FIX`, `CHANGE`, `CHORE`, `DOCS`.

## Style

`dart format` owns layout (`page_width: 120`, trailing commas preserved). Use package imports (`always_use_package_imports`). `always_specify_types` is **off**. PascalCase types, lowerCamelCase members, `_` for private. Match file names to the primary type (`flex_color_scheme.dart`, `flex_sub_themes_data.dart`).

Material and Cupertino widgets come from `package:material_ui/material_ui.dart` and `package:cupertino_ui/cupertino_ui.dart`, not `package:flutter/material.dart`. Persist `Color` with `value32bit` / `*8bit` channel extensions — never deprecated `Color.value` or `.red`.

`///` on public API; `//` on private helpers. In `//`, wrap names in backticks — never `[Type]`. In `///`, use `[Type]` only when the symbol is in dartdoc scope. Function and factory parameter catalogs use `## [paramName]` in the body comment; parameter-level `///` uses backticks. See [code-documentation](.agents/skills/code-documentation/SKILL.md).

## Formatting Scope

- Do not run `dart format .` — it does not honor `.gitignore` or `analyzer: exclude` and may fail inside `build/` (see [dart-lang/dart_style#1840](https://github.com/dart-lang/dart_style/issues/1840)).
- Do not run formatting across the entire repo unless explicitly requested.
- Prefer formatting only the files you changed to keep diffs reviewable.

## Markdown Style

Applies to every markdown file in this repo (skills, `docs/`, README files) and to issue, PR, and review text you write:
- Use US English.
- Never insert line breaks inside a paragraph or a bullet item. One paragraph = one line. One bullet = one line.
- Let the IDE, GitHub, Slack, and agent previews wrap to the viewport; do not hard-wrap at 80/100 columns.
- Never reflow fenced code blocks, tables, or headings — the rule is about prose lines only.
- Avoid wide tables in anything rendered on GitHub; prefer compact lists. Tables are fine for short enumerable facts.

## Tests

Suites use numbered group names (`FCS1`, `FSTC1`, `FKCS1`, `FSOC1`, …) and many `WITH: FlexSubThemes.*` component files. Cover omitted vs explicit values, light/dark, and M2/M3 when the option participates. Recipes: [package-development](.agents/skills/package-development/SKILL.md).

## Git and PRs

Tagged imperative messages (`FIX:`, `ADD:`, `CHORE:`, or existing `fix:` / `chore:` / `test:`), optional `#issue`. PRs target `master`. Summarize motivation, functional changes, example screenshots if UI, analyzer + test results, and any API or behavior risk.

## Worktrees

Cursor and Codex run `bash scripts/setup_worktree.sh` automatically. Claude Code does not — run it before the first `pub get`, test, or example run. Guide: [docs/guides/using-worktrees-guidance.md](docs/guides/using-worktrees-guidance.md).
