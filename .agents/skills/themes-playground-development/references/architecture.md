# Playground architecture and UI routing

Paths in this reference are relative to `example/lib/` unless stated otherwise.

## State and persistence

`example5_themes_playground/main.dart` initializes the selected `ThemeService`, then awaits `ThemeController.loadAll()` before the UI uses its late fields. The current default is Hive; inspect the entrypoint before relying on a box name. Do not change the persisted box name just to match a package version.

- `shared/const/store.dart`: string keys, typed defaults, and `Store.storageKeys`, the import allowlist.
- `shared/controllers/theme_controller.dart`: initialization, setters/getters, resets, presets, import/export bridge, and URL decompression.
- `shared/services/theme_service.dart`: generic load/save and bulk operations. Hive and SharedPreferences have type-specific conversion support; ordinary new primitive properties do not each need new service methods.
- `shared/services/theme_service_mem.dart`: supplies defaults and ignores saves; the controller holds runtime state. Bulk export/import and clear are unimplemented, and `supportsExportImport` is false. It is unsuitable for persistence round-trip tests.

`example5_themes_playground/utils/import_export_playground_settings.dart` exports saved service data and maps Color/enum values to JSON. Import validates keys against `Store.storageKeys`, converts supported types, writes bulk data, and reloads the controller. `share_settings.dart` and `utils/query_params/` connect clipboard/files/URL sharing; URL configuration ultimately uses the JSON import path, not a separate property-by-property query schema.

## Preview and generated configuration

`example5_themes_playground/theme/flex_theme_light.dart` and `flex_theme_dark.dart` contain both the FlexColorScheme configuration builders and ThemeData wrappers. `theme_data_light.dart` / `theme_data_dark.dart` provide the alternate plain ThemeData path. `theme_values.dart` and `shared/model/adaptive_response.dart` translate some controller settings into effective values and platform adaptation.

The wrappers add Playground-specific behavior, including theme extensions for topic and code colors and preview adjustments. Compare the affected consumer configuration, not the entire wrapper theme, when checking code generation.

## Panels and navigation

`example5_themes_playground/widgets/panels/` holds component controls. Reuse the shared widgets under `shared/widgets/` and `example5_themes_playground/widgets/shared/`, especially controls that expose null/default behavior.

For a new panel, inspect `widgets/pages/model/theme_topic.dart` and `widgets/panels/panel.dart` together: topic metadata and the panel list are positionally related. Check the home page and topic selectors for dependent indices and layout behavior; adding only a panel file is insufficient. Preserve the meaning of persisted selections where applicable.

Check the control in the relevant narrow/wide layout and in the theme simulator. For a setting that is disabled by another option, preserve its stored value unless the existing control deliberately resets it; disabled UI and deleted state are different behaviors.

Run from `example/` using the selected Flutter SDK:

```bash
flutter run -d chrome lib/example5_themes_playground/main.dart
```

Use disposable app storage or exported backup settings for reset/import experiments. The ongoing SDK migration can block builds; do not broaden an unrelated change to fix the application baseline.
