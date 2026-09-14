# Playground architecture and UI routing

Paths in this reference are relative to `example/lib/` unless stated otherwise.

## State and persistence

`example5_themes_playground/main.dart` initializes `ThemeServiceHive('flex_color_scheme_v8')`, then awaits `ThemeController.loadAll()` before the UI uses its late fields. Do not rename the Hive box just to match a package version.

- `shared/const/store.dart` — string keys, typed defaults, and `Store.storageKeys` (import allowlist)
- `shared/controllers/theme_controller.dart` — initialization, getters/setters, `resetAllToDefaults`, `resetCustomColorsToDefaults`, presets, import/export bridge, URL decompression
- `shared/services/theme_service.dart` — generic load/save and bulk operations
- `shared/services/theme_service_hive.dart` + `theme_service_hive_adapters.dart` — Hive; new enums need an adapter, registration, and a **new** typeId (150+). Retired IDs **163** and **164** must stay unused
- `shared/services/theme_service_prefs.dart` — SharedPreferences; type-specific conversion, including nullable enums
- `shared/services/theme_service_mem.dart` — supplies defaults and ignores saves; bulk export/import and clear are unimplemented; `supportsExportImport` is false; **unsuitable** for persistence round-trip tests

Ordinary new primitive properties do not each need new service methods. Hive and SharedPreferences already convert supported primitives and `Color`.

`example5_themes_playground/utils/import_export_playground_settings.dart` exports saved service data and maps `Color`/enum values to JSON. Import validates keys against `Store.storageKeys`, converts supported types, writes bulk data, and reloads the controller. Unknown keys are dropped. Mapped null values are dropped; absent keys reload from defaults after bulk replacement. JSON numbers can decode as `int` or `double`.

`share_settings.dart` and `utils/query_params/` connect clipboard/files/URL sharing. URL configuration uses the JSON import path, not a separate property-by-property query schema.

`shared/const/list_keys.py` prints key identifiers when run from its directory. It does not edit the allowlist or validate controller coverage.

## Preview and generated configuration

- `example5_themes_playground/theme/flex_theme_light.dart` / `flex_theme_dark.dart` — FlexColorScheme builders **and** ThemeData wrappers
- `theme_data_light.dart` / `theme_data_dark.dart` — alternate plain ThemeData path
- `theme_values.dart` — effective values (global radius, padding helpers)
- `shared/model/adaptive_response.dart` — Playground `AdaptiveResponse`; `.code` emits `FlexAdaptive.*()` strings for generation. Not a consumer type
- Topic colors: `example5_themes_playground/theme/topic_theme.dart` (Playground `ThemeExtension`)

Wrappers add Playground-specific behavior (topic/code colors, preview adjustments). Compare the affected **consumer** configuration, not the entire wrapper theme, when checking code generation.

## Panels and navigation

`example5_themes_playground/widgets/panels/` holds component controls. Reuse shared widgets under `shared/widgets/` and `example5_themes_playground/widgets/shared/`.

`widgets/pages/model/theme_topic.dart` (`List<Topic> themeTopics`) and `widgets/panels/panel.dart` (`Panel` builds `elementAt(page)`) are **positionally related**. `Topic` has `heading`, `icon`, `group`, `info` — no `builder`, no `topicKey`. Adding only a panel file, or only a `Topic`, desynchronizes navigation.

`TopicGroup`: `general`, `colors`, `components`, `controls`, `inputs`, `bars`, `navigation`, `surfaces`, `texts`.

Check the control in the relevant narrow/wide layout and in the theme simulator. For a setting that is disabled by another option, preserve its stored value unless the existing control deliberately resets it.

## File map (quick)

- Store / controller: `shared/const/store.dart`, `shared/controllers/theme_controller.dart`, `shared/const/app_color.dart`
- Theme builders: `example5_themes_playground/theme/flex_theme_light.dart`, `flex_theme_dark.dart`
- Code generation: `example5_themes_playground/utils/generate_theme_dart_code.dart`, `generate_colorscheme_dart_code.dart`
- Import/export: `example5_themes_playground/utils/import_export_playground_settings.dart`
- Topics / panels: `widgets/pages/model/theme_topic.dart`, `widgets/panels/panel.dart`

## Run

From `example/` using the selected Flutter SDK:

```bash
fvm flutter run -d chrome lib/example5_themes_playground/main.dart
```

Use disposable app storage or exported backup settings for reset/import experiments. Do not broaden an unrelated change to fix the application baseline.
