# Playground UI controls

Paths are relative to `example/lib/` unless stated otherwise. Copy nearby panel usage rather than inventing a new control.

## Control by data type

| Data type                   | Widget                      | File                                                                     |
| --------------------------- | --------------------------- | ------------------------------------------------------------------------ |
| `bool` (non-nullable)       | `SwitchListTileReveal`      | `shared/widgets/universal/switch_list_tile_reveal.dart`                  |
| `bool?` (tri-state)         | `NullableBoolToggleButtons` | `shared/widgets/universal/nullable_bool_toggle_buttons.dart`             |
| `int?` / `double?`          | `SliderListTileReveal`      | `shared/widgets/universal/slider_list_tile_reveal.dart`                  |
| `int` / `double` (non-null) | `ListTileSlider`            | `shared/widgets/universal/list_tile_slider.dart`                         |
| `T extends Enum`            | `EnumPopupMenu<T>`          | `example5_themes_playground/widgets/shared/enum_popup_menu.dart`         |
| `SchemeColor?`              | `ColorSchemePopupMenu`      | `example5_themes_playground/widgets/shared/color_scheme_popup_menu.dart` |
| `TargetPlatform?`           | `PlatformPopupMenu`         | `example5_themes_playground/widgets/shared/platform_popup_menu.dart`     |
| `Color` (custom)            | `ColorPickerInkWellDialog`  | `example5_themes_playground/widgets/shared/color_picker_inkwell.dart`    |
| Section info                | `ListTileReveal`            | `shared/widgets/universal/list_tile_reveal.dart`                         |
| Expandable section          | `ListTileExpand`            | `shared/widgets/universal/list_tile_expand.dart`                         |

`NullableBoolToggleButtons` is usually the trailing of a `ListTile` / `ListTileReveal`. Existing panels also cycle null → true → false on tile tap (`use_material3_typography.dart`, `app_bar_center_title_toggle_buttons.dart`).

`EnumPopupMenu` treats the **first popup item as the null default**. Passing `values: MyEnum.values` is the usual pattern; do not assume index 0 is an emitted enum value.

## Enable and default labels

Standard enable gate:

```dart
final bool enableControl = controller.useSubThemes && controller.useFlexColorScheme;
```

Default label when null means "Material/package default", with an optional global cascade (from `buttons_panel.dart`):

```dart
final double? effectiveRadius = ThemeValues.effectiveRadius(controller);
final String elevatedButtonRadiusDefaultLabel =
    controller.elevatedButtonBorderRadius == null && effectiveRadius == null
        ? useMaterial3 ? 'stadium' : '40 dp'
        : controller.elevatedButtonBorderRadius == null && effectiveRadius != null
            ? 'global ${effectiveRadius.toStringAsFixed(0)} dp'
            : '';
```

- Null and no global → M2/M3 wording (verify against `FlexSubThemes` / Flutter `defaultsFor`, not a frozen table)
- Null and global set → `'global N dp'`
- Value set → empty string (the control shows the value)

Look up current Material defaults in Flutter component `defaultsFor` and in `lib/src/flex_sub_themes.dart`. Do not copy numeric M2/M3 tables from old notes.

## Widget recipes

**Boolean (non-nullable)** — `SwitchListTileReveal`:

```dart
SwitchListTileReveal(
  enabled: enableControl,
  value: controller.interactionEffects,
  onChanged: controller.setInteractionEffects,
  title: const Text('Interaction effects'),
  subtitleReveal: const Text('What the setting does, including M2/M3 differences.'),
)
```

**Boolean (nullable)** — wrap `NullableBoolToggleButtons` as trailing; bind `onChanged` to the nullable setter.

**Nullable number** — `SliderListTileReveal` (`sliderTrackHeight` in `sliders_panel.dart`):

```dart
SliderListTileReveal(
  enabled: enableControl,
  title: const Text('Track height'),
  value: controller.sliderTrackHeight,
  onChanged: controller.setSliderTrackHeight,
  min: 1,
  max: 40,
  divisions: 39,
  valueDecimalPlaces: 0,
  valueHeading: 'HEIGHT',
  valueUnitLabel: ' dp',
  valueDefaultLabel: useMaterial3 && !use2023Style ? '16 dp' : '4 dp',
)
```

**Enum** — `EnumPopupMenu` (`listTileStyle` in `list_tile_panel.dart`):

```dart
EnumPopupMenu<ListTileStyle>(
  enabled: enableControl,
  values: ListTileStyle.values,
  title: const Text('Style'),
  value: controller.listTileStyle,
  onChanged: controller.setListTileStyle,
)
```

**SchemeColor** — `ColorSchemePopupMenu` with `defaultLabel` / `defaultLabelM2` / `defaultLabelDark` as the panel already does.

**Custom Color** — `ColorPickerInkWellDialog` as trailing of `ListTileReveal`, with `ColorIndicator` child. Handle `wasCancelled`.

Some nullable bools are shown as a **switch** that coalesces null to a bool for display (`sliderYear2023 ?? true` in `sliders_panel.dart`). Match the existing control for that setting; do not blindly swap in `NullableBoolToggleButtons`.

## Compact controller examples

Non-nullable setter (`useFlexColorScheme`):

```dart
void setUseFlexColorScheme(bool? value, [bool notify = true]) {
  if (value == null) return;
  if (value == _useFlexColorScheme) return;
  _useFlexColorScheme = value;
  if (notify) notifyListeners();
  unawaited(_themeService.save(Store.keyUseFlexColorScheme, value));
}
```

Nullable setter (`sliderTrackHeight`, `listTileStyle`): no `if (value == null) return;`. Equality early-return, assign, optional notify, `unawaited(_themeService.save(...))`.

`notify: false` batches UI updates; it does **not** skip persistence. Returning from a setter does not mean disk I/O has finished.

Place a new component option in its existing panel. Group related controls. Prefer `ResponsiveTwoWidgets` when two controls share a row on wide layouts.
