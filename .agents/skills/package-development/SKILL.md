---
name: package-development
description: Maintain FlexColorScheme package APIs, theme calculations, component themes, and regression tests. Use for changes to lib/ or package tests; use the Playground skills for its state, UI, and emitted code.
---

# Package development

Start with the requested behavior and the [architecture map](../../../docs/guides/architecture.md). For app integration recipes, use the [consumer skill](../flex-color-scheme/SKILL.md).

## Trace the change

- For a component option, follow `FlexSubThemesData` through `FlexColorScheme.toTheme` into the relevant `FlexSubThemes` builder. Include constructor, field documentation, `copyWith`, equality, hash, and diagnostics when adding data-object fields. Preserve the class's existing nullable-copy semantics rather than introducing a different convention incidentally.
- For a top-level factory option, inspect both `FlexColorScheme.light` / `.dark` and matching `FlexThemeData.light` / `.dark` forwarding. Verify direct construction and conversion only where the option participates.
- Distinguish an API's declared default from its effective default after color, brightness, platform, Material mode, and component fallbacks. Test the actual observable result.
- Check the public barrel before exporting new types. Coordinate consumer-visible changes with dartdoc, changelog, and examples. Breaking API changes need prior discussion.
- If the task exposes an option in the Playground, follow [Playground development](../themes-playground-development/SKILL.md), including its code-generation handoff. A package parameter alone does not add a Playground control.

## Validation

Use current test names from `test/`. Relevant suites include `flex_sub_themes_data_test.dart`, `flex_sub_themes_test.dart`, `flex_color_scheme_test.dart`, `flex_color_scheme_to_theme_test.dart`, and `flex_color_scheme_key_colors_test.dart`.

For configuration objects, cover construction, copying, equality/hash, and diagnostics as relevant. For theming behavior, cover explicit and omitted values, light/dark, M2/M3, and affected overrides; for seeded/blended color changes, add focused regression cases for the affected color roles. Avoid broad unrelated test rewrites.

Resolve dependencies in both packages only when needed. Run targeted Flutter tests and analysis/format checks on the changed scope; full `flutter test --coverage` is useful for broader behavior changes and release validation. Do not invent a numeric coverage requirement. Honor the temporary migration status in [AGENTS.md](../../../AGENTS.md); existing failures do not justify suppressing new failures or widening the task.

Follow local `material_ui` / `cupertino_ui` imports and color conversion helpers. Do not change SDK constraints or lint policy as a side effect of a feature. Generated build output and Claude mirrors are not implementation sources.
