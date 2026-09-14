# Add or change a Playground property

Paths below are relative to `example/lib/`. Follow the relevant branches of this checklist; a UI-only toggle does not automatically need a public package API or generated consumer argument. Widget recipes: [ui-controls.md](ui-controls.md). Architecture: [architecture.md](architecture.md).

## 1. Establish meaning and API support

Determine the type, nullable/default meaning, affected Material mode, brightness scope, and feature gate. Read the actual public parameter and consuming package implementation. A Playground default can intentionally differ from the package default. For a new package API, use [package development](../../package-development/SKILL.md) before wiring the control.

For paired light/dark values, trace both independently. For a shared value, use the same controller setting in both builders. Identify any derived representation (for example, `AdaptiveResponse` mapped to `FlexAdaptive` via `.code`).

## 2. Storage and controller

- Add a unique key and typed default to `shared/const/store.dart`; include the key in `Store.storageKeys`. Missing allowlist entries cause import to discard otherwise-working settings. Keep existing key strings stable.
- Naming: `keyPropertyName` / `defaultPropertyName` (same camelCase property).
- Add the late backing field and getter to `shared/controllers/theme_controller.dart`; initialize it in `loadAll()` before any consumer reads it:

```dart
_[propertyName] = await _themeService.load(Store.key[PropertyName], Store.default[PropertyName]);
```

- Follow the nearby setter pattern: equality early return, assignment, optional notification, and `unawaited(_themeService.save(...))`. Non-nullable setters reject null; nullable setters do not. The optional `notify` argument batches UI notifications; false does not turn persistence off.
- Add the setter call to `resetAllToDefaults`, usually with notification disabled. Inspect component resets, text-field preset helpers, and premade theme logic. Presets that first reset to defaults inherit the new default; add an explicit override only if that design calls for it.
- For custom color state, inspect `resetCustomColorsToDefaults` separately. View/mode/panel index is intentionally not reset.

`shared/const/list_keys.py` prints key identifiers when run from its directory. It does not edit the allowlist or validate controller coverage.

## 3. Types, imports, and sharing

Primitive settings and already-supported Color/enum types generally need no new codec. A **new enum type** requires all of:

1. `JsonKeys.typeEnum…` in `example5_themes_playground/utils/import_export_playground_settings.dart`
2. Encode branch (`else if (object is MyEnum)`) and decode branch (`values.firstWhere` on `element.name`)
3. Hive `TypeAdapter` in `shared/services/theme_service_hive_adapters.dart` with a new typeId (next unused after inspecting the file; never reuse **163** or **164**)
4. `Hive.registerAdapter` in `theme_service_hive.dart`
5. Nullable/non-nullable handling as applicable in SharedPreferences

Persisted enum indices make reordering values a compatibility concern.

JSON exports read saved service values, not controller fields directly. Setters save asynchronously, so persistence tests should use a service whose pending writes can be awaited or reliably drained. Import drops mapped null values and reloads from defaults for absent values after bulk replacement; do not promise an explicit-null round trip that this implementation does not provide. JSON numbers can decode as int or double, so verify service conversion for numeric settings.

Check export/import and URL sharing through the same JSON path. A primitive setting does not require a separate custom URL parameter.

## 4. UI and previews

Add the control in the matching panel, reusing null-aware sliders, toggles, and enum/color selectors. Bind the getter and setter, show what default means, and apply the existing feature gate. Check meaningful zero and false values rather than treating them as absent. See [ui-controls.md](ui-controls.md).

Wire the setting into `example5_themes_playground/theme/flex_theme_light.dart` and `flex_theme_dark.dart` at the same relative position in both files. Inspect `ThemeValues` and adaptive conversion where needed. Update the alternate ThemeData path only if the option is meant to work there too.

Brightness-paired examples: `inputDecoratorSchemeColorLight` / `Dark`, `appBarBackgroundSchemeColorLight` / `Dark`. Shared examples: `listTileStyle`, `sliderTrackHeight`.

For a new panel, follow [topic and panel routing](architecture.md). Do not introduce a new state-management pattern for a single option.

## 5. Emitted code and completion

Use the [code-generation skill](../../themes-playground-code-generation/SKILL.md). Add the property fragment to every applicable assembly branch; deciding when an argument can be omitted requires the public API's **effective** default, not only `Store.default...`.

For a behavior change, validate startup with missing storage, change/reload, reset, preset application, non-default export/import, and relevant light/dark preview behavior. Exercise nullable settings as null and explicit values, including false/zero where valid. Verify the generated argument reproduces the affected theme field. Use a storage-capable fixture for round trips; `ThemeServiceMem` cannot test them.

## Completion checklist

- Store key + default, and key listed in `storageKeys`
- Controller field, getter, setter, `loadAll()`, `resetAllToDefaults` (or custom-color reset)
- UI control on the correct panel with enable gate and default label
- Light **and** dark theme builders connected
- Code generation in every applicable branch; omitted at package default
- JSON / Hive / prefs only if the type is new
- Panel + `themeTopics` index pair only if creating a new panel
- Manual checks: control updates controller; persist/reload; theme actually changes; export/import

## Existing paths to trace

These are navigation examples, not certified-correct templates. Search exact identifiers across package and example code before adapting them.

| Shape           | Existing setting                               | What to inspect                                                                                                                                        |
| --------------- | ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Nullable number | `sliderTrackHeight`                            | Store key/default/allowlist; load/set/reset; sliders panel; light/dark subthemes; emitted fragment and both assemblies                                 |
| Nullable bool   | `sliderYear2023`                               | Null versus explicit true/false, package Material behavior, UI switch coalescing `?? true`, generator omission (`null` or true omitted; false emitted) |
| Nullable enum   | `listTileStyle` / `sliderShowValueIndicator`   | JSON tag, Hive adapter/registration, SharedPreferences type branches, `EnumPopupMenu`, emitted enum spelling                                           |
| Brightness pair | `appBarElevationLight` / `appBarElevationDark` | Independent keys/setters/resets and panel values; corresponding builders and top-level `appBarElevation` output per brightness                         |

A practical trace from the repository root is `rg -n 'sliderTrackHeight|keySliderTrackHeight|setSliderTrackHeight' lib example/lib`. Repeat with the other identifiers and inspect the matching call sites, not only the match count.
