---
name: themes-playground-development
description: Add or change FlexColorScheme Themes Playground settings, controls, panels, persistence, reset behavior, and previews. Use for example5_themes_playground and its shared controller/services; property changes also require checking emitted code.
---

# Themes Playground development

The Playground entrypoint is `example/lib/example5_themes_playground/main.dart`. Shared state lives under `example/lib/shared/`. It is a separate Flutter package and uses `ThemeController` with `ChangeNotifier`, not Riverpod.

Read [architecture](references/architecture.md) when locating UI or state. For widget recipes and default labels, read [UI controls](references/ui-controls.md). For a new or changed setting, follow the [property checklist](references/property-checklist.md) through storage, reset, preview, and generation. Read only the references needed for the task.

Consumer theme APIs belong in [package development](../package-development/SKILL.md). Emitted Dart belongs in [code generation](../themes-playground-code-generation/SKILL.md). A package parameter alone does not add a Playground control.

## Before starting

Ask if any of these are missing:

1. Target panel file (for example `buttons_panel.dart`, `sliders_panel.dart`)
2. FlexColorScheme / `FlexSubThemesData` API property name
3. Data type (including nullability)
4. Default value and whether null means "use Material/package default"

Decide whether the setting is a consumer theme parameter, a brightness-specific variant, or Playground-only UI/simulation state. Do not export simulator state or Playground-only types (`ThemeController`, `AdaptiveResponse`, topic theme extensions) as consumer APIs. Preserve existing storage keys, defaults, and backward compatibility unless the task requires a migration.

## Add or change a property

Follow this order. Details and snippets: [property checklist](references/property-checklist.md) and [UI controls](references/ui-controls.md).

1. **Store** — key + typed default in `shared/const/store.dart`; add the key to `Store.storageKeys` (import allowlist).
2. **Controller** — late field, getter, setter, `loadAll()`, `resetAllToDefaults` (usually `notify: false`). Custom colors use `resetCustomColorsToDefaults`. Do not reset view/panel index.
3. **UI** — existing panel, shared control for the type, enable gate, default label. Feature-gate disabled controls; do not delete stored values just because the control is off.
4. **Preview** — wire **both** `flex_theme_light.dart` and `flex_theme_dark.dart`. Shared values use the same controller field; paired values use `…Light` / `…Dark`. Update `theme_data_light.dart` / `theme_data_dark.dart` only if the option is meant to work on the plain ThemeData path too.
5. **Persist extras** — primitives and `Color` need no new codec. A **new enum type** needs JSON tagging, Hive adapter + unused typeId, and SharedPreferences branches.
6. **Generated code** — follow the [code-generation skill](../themes-playground-code-generation/SKILL.md). Insert fragments in every applicable assembly branch. `Store` defaults are not the omission condition.

## Enable gates

Most specific to least specific:

```dart
final bool enableAdvancedControl =
    controller.useSubThemes && controller.useFlexColorScheme && controller.someFeatureEnabled;
final bool enableControl = controller.useSubThemes && controller.useFlexColorScheme;
```

Always-on controls are rare (general / Playground chrome). Preserve stored values when a control is disabled unless that control already resets them.

## Null handling

- Non-nullable (`bool`, non-null enum): setter `if (value == null) return;`
- Nullable (`bool?`, `double?`, `Color?`, nullable enum): no null rejection; null is "use default"
- Playground default can intentionally differ from the package default

## New panel (rare)

`Topic` metadata in `theme_topic.dart` and the widget list in `panel.dart` are **positional**. There is no `Topic.builder`. Add the same index in both lists, pick a `TopicGroup`, and check home-page / topic-selector index uses. See [architecture](references/architecture.md).

## Validation

For a behavior change: startup with missing storage, change/reload, reset, preset, non-default export/import, both brightness previews, and generated argument vs affected theme field. `ThemeServiceMem` cannot test persistence round trips. `example/test/widget_test.dart` is empty; it is not a Playground regression suite.

Known leftovers (do not "fix" as a side effect): Hive box name is `flex_color_scheme_v8`; `generateCodeForOwnFile` is stored but unused.
