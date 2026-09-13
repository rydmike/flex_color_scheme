---
name: themes-playground-development
description: Add or change FlexColorScheme Themes Playground settings, controls, panels, persistence, reset behavior, and previews. Use for example5_themes_playground and its shared controller/services; property changes also require checking emitted code.
---

# Themes Playground development

The Playground entrypoint is `example/lib/example5_themes_playground/main.dart`; shared state lives under `example/lib/shared/`. It is a separate Flutter package and uses `ThemeController` with `ChangeNotifier`, not Riverpod.

Read [architecture and panel routing](references/architecture.md) when locating UI or state. For a new or changed setting, follow the [property checklist](references/property-checklist.md) through storage, reset, preview, and generation. Read only the references needed for the task.

Decide whether a setting is a consumer theme parameter, a brightness-specific variant, or Playground-only UI/simulation state. Preserve existing storage keys, defaults, and backward compatibility unless the requested behavior requires a migration.

For a consumer theme setting, use [code generation](../themes-playground-code-generation/SKILL.md) as part of the change. Verify light and dark previews and emitted setup together. Do not automatically export simulator state or Playground-only extensions.

Use existing shared controls and nullable/default displays. Place a new component option in its existing panel; a genuinely new panel also needs topic/index routing. Scope runtime checks to the changed behavior and report migration blockers separately. Existing example test scaffolding is not a Playground regression suite.
