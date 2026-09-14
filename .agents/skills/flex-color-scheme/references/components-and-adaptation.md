# Component themes and adaptation

`FlexSubThemesData` configures optional component theming. Omission of the entire object and passing `const FlexSubThemesData()` are different configurations. A nullable field often defers to a package or Material default; explicit false and zero can be meaningful overrides.

```dart
const FlexSubThemesData components = FlexSubThemesData(
  defaultRadius: 12,
  elevatedButtonRadius: 20,
  inputDecoratorSchemeColor: SchemeColor.primary,
);
final ThemeData theme = FlexThemeData.light(
  scheme: FlexScheme.indigo,
  subThemesData: components,
);
```

Use the imports shown in the skill entrypoint. Global settings provide broad defaults and component-specific settings refine them. `SchemeColor` selects a role from the effective scheme rather than a literal color. Consult the specific field's docs for fallback behavior and differences between M2 and M3; do not infer all defaults from the object constructor alone.

Pass shared component configuration to both themes when their shapes and behavior should match. Use separate values when brightness-specific styling is intentional.

`useMaterial3` defaults to true on the FCS factories. M2 vs M3 changes many component fallbacks; a Playground or docs label that says "M3 default" is not the same as a constructor `null`.

## Adaptive behavior

Adaptive fields take `FlexAdaptive` configurations to select platforms; companion fields hold values such as the adaptive radius:

```dart
const FlexSubThemesData components = FlexSubThemesData(
  defaultRadius: 12,
  defaultRadiusAdaptive: 8,
  adaptiveRadius: FlexAdaptive.desktop(),
);
```

Inspect `FlexAdaptive`'s web/platform behavior for the target app. Playground controls can simulate platform choices via `AdaptiveResponse`; that enum is **not** a consumer API. Generated code should emit `FlexAdaptive.*()` factories, not Playground controller types.

## Further overrides

Use the resulting `ThemeData.copyWith` for behavior outside the package's configuration. Copy an existing component theme when changing one field, rather than unintentionally replacing its other settings. A widget's explicit styling can override ThemeData, so inspect widget arguments and state-dependent colors when a setting appears ineffective.

A ColorScheme-only export will not reproduce radii, typography, density, splash, or component behavior. Use generated theme setup or configure these separately. For Cupertino widgets in this API generation, use compatible `cupertino_ui` types and the documented Cupertino integration options; mixing old Flutter Material/Cupertino types with SDK-decoupled ones can cause type mismatches.

## 9.0 component leftovers

Removed from `FlexSubThemesData`: `useTextTheme`, `useFlutterDefaults`, `blendTextTheme`. Use `useMaterial3Typography` instead of `useTextTheme`. `FlexSubThemes.bottomNavigationBar` was a pass-through alias; call `bottomNavigationBarTheme`. `FlexColorScheme.createPrimarySwatch` moved to FlexColorPicker `ColorTools.createPrimarySwatch`.
