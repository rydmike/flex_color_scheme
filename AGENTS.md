# FlexColorScheme repository guidance

FlexColorScheme is a public Flutter theming package. `lib/` contains the package, `test/` its tests, and `example/` a separate Flutter package. The Themes Playground starts at `example/lib/example5_themes_playground/main.dart`; much of its state and persistence lives in `example/lib/shared/`.

## Working conventions

- Read SDK/dependency constraints from both pubspecs and formatter/lint settings from the applicable `analysis_options.yaml`. Use the configured FVM SDK when available; `.fvmrc` selects a channel, not an immutable SDK version.
- Keep public APIs documented and preserve deliberate defaults, null semantics, and Material 2/3 differences. Discuss breaking changes before implementing them.
- Follow the SDK-decoupled `material_ui` / `cupertino_ui` imports used by this checkout. Do not mechanically restore old Flutter Material/Cupertino imports.
- Keep edits and checks scoped to the task. Format changed Dart files using repository settings. Add relevant regression coverage for behavior changes, especially theme calculations and seeding.
- Do not hand-edit generated build/coverage output. Preserve unrelated working-tree changes.
- Use concise conventional commit messages. For user-visible changes, describe behavior, validation, and API impact; include a Playground screenshot or example when useful.

## Choose the relevant skill

Read only the skills and references needed for the task.

| Task | Skill |
| --- | --- |
| Use the package in an app | [flex-color-scheme](.agents/skills/flex-color-scheme/SKILL.md) |
| Change package APIs, theme behavior, or tests | [package-development](.agents/skills/package-development/SKILL.md) |
| Write Dart docs, README, or changelog entries | [code-documentation](.agents/skills/code-documentation/SKILL.md) |
| Review a diff or pull request | [code-review](.agents/skills/code-review/SKILL.md) |
| Prepare or verify a release | [release](.agents/skills/release/SKILL.md) |
| Change Playground properties, persistence, or panels | [themes-playground-development](.agents/skills/themes-playground-development/SKILL.md) |
| Change or verify emitted theme code | [themes-playground-code-generation](.agents/skills/themes-playground-code-generation/SKILL.md) |

Package map: [architecture](docs/guides/architecture.md). Fresh checkout/worktree setup: [worktree guidance](docs/guides/using-worktrees-guidance.md).

## Canonical guidance and Claude

Edit `AGENTS.md`, `.agents/skills/`, and their linked references. `CLAUDE.md` and `.claude/skills/` are ignored, generated local copies. After cloning or changing canonical guidance, run `./scripts/sync_claude_code_config.sh` when using Claude Code. Do not edit the mirrors. See [scripts](scripts/README.md) for sync and cleanup behavior.

